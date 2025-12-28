#include "fs/fs.h"
#include "fs/buf.h"
#include "fs/inode.h"
#include "fs/dir.h"
#include "fs/bitmap.h"
#include "lib/string.h"
#include "lib/print.h"
#include "proc/cpu.h"
#include "mem/vmem.h"

// 对目录文件的简化性假设: 每个目录文件只包括一个block
// 也就是每个目录下最多 BLOCK_SIZE / sizeof(dirent_t) = 32 个目录项

// 查询一个目录项是否在目录里
// 成功返回这个目录项的inode_num
// 失败返回INODE_NUM_UNUSED
// ps: 调用者需持有pip的锁
uint16 dir_search_entry(inode_t *pip, char *name)
{
    assert(sleeplock_holding(&pip->slk), "dir_search_entry: lock");
    if(pip->type != FT_DIR || pip->addrs[0] == 0)
        return INODE_NUM_UNUSED;

    buf_t *buf = buf_read(pip->addrs[0]);
    uint32 max = (pip->size > BLOCK_SIZE) ? BLOCK_SIZE : pip->size;
    for (uint32 offset = 0; offset < max; offset += sizeof(dirent_t))
    {
        dirent_t *de = (dirent_t *)(buf->data + offset);
        if (de->name[0] == 0)
            continue;
        if (strncmp(name, de->name, DIR_NAME_LEN) == 0)
        {
            uint16 ret = de->inode_num;
            buf_release(buf);
            return ret;
        }
    }
    buf_release(buf);
    return INODE_NUM_UNUSED;
}

// 在pip目录下添加一个目录项
// 成功返回这个目录项的偏移量 (同时更新pip->size)
// 失败返回BLOCK_SIZE (没有空间 或 发生重名)
// ps: 调用者需持有pip的锁
uint32 dir_add_entry(inode_t *pip, uint16 inode_num, char *name)
{
    assert(sleeplock_holding(&pip->slk), "dir_add_entry: lock");
    if(pip->type != FT_DIR)
        return BLOCK_SIZE;

    // 重名检查
    if(dir_search_entry(pip, name) != INODE_NUM_UNUSED)
        return BLOCK_SIZE;

    if(pip->addrs[0] == 0) {
        pip->addrs[0] = bitmap_alloc_block();
        buf_t* zbuf = buf_read(pip->addrs[0]);
        memset(zbuf->data, 0, BLOCK_SIZE);
        zbuf->dirty = true;
        buf_write(zbuf);
        buf_release(zbuf);
    }

    buf_t *buf = buf_read(pip->addrs[0]);
    uint32 offset;
    for (offset = 0; offset < BLOCK_SIZE; offset += sizeof(dirent_t))
    {
        dirent_t *de = (dirent_t *)(buf->data + offset);
        if (de->name[0] == 0)
        {
            de->inode_num = inode_num;
            memset(de->name, 0, DIR_NAME_LEN);
            safestrcpy(de->name, name, DIR_NAME_LEN);
            buf->dirty = true;
            buf_write(buf);
            buf_release(buf);
            if(offset + sizeof(dirent_t) > pip->size)
                pip->size = offset + sizeof(dirent_t);
            inode_rw(pip, true);
            return offset;
        }
    }
    buf_release(buf);
    return BLOCK_SIZE;
}

// 在pip目录下删除一个目录项
// 成功返回这个目录项的inode_num
// 失败返回INODE_NUM_UNUSED
// ps: 调用者需持有pip的锁
uint16 dir_delete_entry(inode_t *pip, char *name)
{
    assert(sleeplock_holding(&pip->slk), "dir_delete_entry: lock");
    if(pip->type != FT_DIR || pip->addrs[0] == 0)
        return INODE_NUM_UNUSED;

    buf_t *buf = buf_read(pip->addrs[0]);
    for (uint32 offset = 0; offset < BLOCK_SIZE; offset += sizeof(dirent_t))
    {
        dirent_t *de = (dirent_t *)(buf->data + offset);
        if (de->name[0] == 0)
            continue;
        if (strncmp(name, de->name, DIR_NAME_LEN) == 0)
        {
            uint16 inum = de->inode_num;
            de->inode_num = INODE_NUM_UNUSED;
            de->name[0] = 0;
            buf->dirty = true;
            buf_write(buf);
            buf_release(buf);
            return inum;
        }
    }
    buf_release(buf);
    return INODE_NUM_UNUSED;
}

// 把目录下的有效目录项复制到dst (dst区域长度为len)
// 返回读到的字节数 (sizeof(dirent_t)*n)
// 调用者需要持有pip的锁
uint32 dir_get_entries(inode_t* pip, uint32 len, void* dst, bool user)
{
    assert(sleeplock_holding(&pip->slk), "dir_get_entries: lock");
    if(pip->type != FT_DIR || pip->addrs[0] == 0)
        return 0;

    uint32 copied = 0;
    buf_t* buf = buf_read(pip->addrs[0]);
    uint32 max = (pip->size > BLOCK_SIZE) ? BLOCK_SIZE : pip->size;
    for(uint32 offset = 0; offset < max; offset += sizeof(dirent_t)) {
        dirent_t* de = (dirent_t*)(buf->data + offset);
        if(de->name[0] == 0)
            continue;
        if(copied + sizeof(dirent_t) > len)
            break;
        if(user)
            uvm_copyout(myproc()->pgtbl, (uint64)dst + copied, (uint64)de, sizeof(dirent_t));
        else
            memmove((uint8*)dst + copied, de, sizeof(dirent_t));
        copied += sizeof(dirent_t);
    }
    buf_release(buf);
    return copied;
}

// 改变进程里存储的当前目录
// 成功返回0 失败返回-1
uint32 dir_change(char* path)
{
    inode_t* ip = path_to_inode(path);
    if(ip == NULL)
        return -1;

    inode_lock(ip);
    if(ip->type != FT_DIR) {
        inode_unlock_free(ip);
        return -1;
    }
    inode_unlock(ip);

    proc_t* p = myproc();
    if(p->cwd)
        inode_free(p->cwd);
    p->cwd = ip;
    return 0;
}

// 输出一个目录下的所有有效目录项
// for debug
// ps: 调用者需持有pip的锁
void dir_print(inode_t *pip)
{
    assert(sleeplock_holding(&pip->slk), "dir_print: lock");

    printf("\ninode_num = %d dirents:\n", pip->inode_num);

    dirent_t *de;
    buf_t *buf = buf_read(pip->addrs[0]);
    for (uint32 offset = 0; offset < BLOCK_SIZE; offset += sizeof(dirent_t))
    {
        de = (dirent_t *)(buf->data + offset);
        if (de->name[0] != 0)
            printf("inum = %d dirent = %s\n", de->inode_num, de->name);
    }
    buf_release(buf);
}

/*----------------------- 路径(一串目录和文件) -------------------------*/

// Examples:
//   skipelem("a/bb/c", name) = "bb/c", setting name = "a"
//   skipelem("///a//bb", name) = "bb", setting name = "a"
//   skipelem("a", name) = "", setting name = "a"
//   skipelem("", name) = skipelem("////", name) = 0
static char *skip_element(char *path, char *name)
{
    while(*path == '/') path++;
    if(*path == 0) return 0;

    char *s = path;
    while (*path != '/' && *path != 0)
        path++;

    int len = path - s;
    if (len >= DIR_NAME_LEN) {
        memmove(name, s, DIR_NAME_LEN);
    } else {
        memmove(name, s, len);
        name[len] = 0;
    }
    while (*path == '/')
        path++;
    return path;
}

// 查找路径path对应的inode (find_parent = false)
// 查找路径path对应的inode的父节点 (find_parent = true)
// 供两个上层函数使用
// 失败返回NULL
static inode_t* search_inode(char* path, char* name, bool find_parent)
{
    inode_t* ip;

    proc_t* p = myproc();
    if(path[0] == '/')
        ip = inode_alloc(INODE_ROOT);
    else if(p != NULL && p->cwd)
        ip = inode_dup(p->cwd);
    else
        ip = inode_alloc(INODE_ROOT);

    while((path = skip_element(path, name)) != 0) {
        inode_lock(ip);
        if(ip->type != FT_DIR) {
            inode_unlock_free(ip);
            return NULL;
        }
        if(find_parent && *path == '\0') {
            inode_unlock(ip);
            return ip;
        }

        uint16 inum = dir_search_entry(ip, name);
        if(inum == INODE_NUM_UNUSED) {
            inode_unlock_free(ip);
            return NULL;
        }
        inode_t* next = inode_alloc(inum);
        inode_unlock_free(ip);
        ip = next;
    }

    if(find_parent) {
        inode_free(ip);
        return NULL;
    }

    return ip;
}

// 找到path对应的inode
inode_t* path_to_inode(char* path)
{
    char name[DIR_NAME_LEN];
    return search_inode(path, name, false);
}

// 找到path对应的inode的父节点
// path最后的目录名放入name指向的空间
inode_t* path_to_pinode(char* path, char* name)
{
    return search_inode(path, name, true);
}

// 如果path对应的inode存在则返回inode
// 如果path对应的inode不存在则创建inode
// 失败返回NULL
inode_t* path_create_inode(char* path, uint16 type, uint16 major, uint16 minor)
{
    char name[DIR_NAME_LEN];
    inode_t* pip = path_to_pinode(path, name);
    if(pip == NULL)
        return NULL;

    inode_lock(pip);
    uint16 inum = dir_search_entry(pip, name);
    if(inum != INODE_NUM_UNUSED) {
        inode_unlock(pip);
        inode_free(pip);
        return inode_alloc(inum);
    }

    inode_t* ip = inode_create(type, major, minor);
    if(type == FT_DIR) {
        inode_lock(ip);
        dir_add_entry(ip, ip->inode_num, ".");
        dir_add_entry(ip, pip->inode_num, "..");
        inode_unlock(ip);
        pip->nlink++;
    }

    dir_add_entry(pip, ip->inode_num, name);
    inode_rw(pip, true);
    inode_unlock(pip);
    inode_free(pip);
    return ip;
}

// 文件链接(目录不能被链接)
// 本质是创建一个目录项, 这个目录项的inode_num是存在的而不用申请
// 成功返回0 失败返回-1
uint32 path_link(char* old_path, char* new_path)
{
    inode_t* ip = path_to_inode(old_path);
    if(ip == NULL)
        return -1;

    inode_lock(ip);
    if(ip->type == FT_DIR) {
        inode_unlock_free(ip);
        return -1;
    }

    char name[DIR_NAME_LEN];
    inode_t* pip = path_to_pinode(new_path, name);
    if(pip == NULL) {
        inode_unlock_free(ip);
        return -1;
    }

    inode_lock(pip);
    if(dir_search_entry(pip, name) != INODE_NUM_UNUSED) {
        inode_unlock(pip);
        inode_free(pip);
        inode_unlock_free(ip);
        return -1;
    }

    dir_add_entry(pip, ip->inode_num, name);
    ip->nlink++;
    inode_rw(ip, true);

    inode_unlock(pip);
    inode_free(pip);
    inode_unlock_free(ip);
    return 0;
}

// 检查一个unlink操作是否合理
// 调用者需要持有ip的锁
// 在path_unlink()中调用
static bool check_unlink(inode_t* ip)
{
    assert(sleeplock_holding(&ip->slk), "check_unlink: slk");

    uint8 tmp[sizeof(dirent_t) * 3];
    uint32 read_len;
    
    read_len = dir_get_entries(ip, sizeof(dirent_t) * 3, tmp, false);
    
    if(read_len == sizeof(dirent_t) * 3) {
        return false;
    } else if(read_len == sizeof(dirent_t) * 2) {
        return true;
    } else {
        panic("check_unlink: read_len");
        return false;
    }
}

// 文件删除链接
uint32 path_unlink(char* path)
{
    char name[DIR_NAME_LEN];
    inode_t* pip = path_to_pinode(path, name);
    if(pip == NULL)
        return -1;

    inode_lock(pip);
    if(strncmp(name, ".", DIR_NAME_LEN) == 0 || strncmp(name, "..", DIR_NAME_LEN) == 0) {
        inode_unlock(pip);
        inode_free(pip);
        return -1;
    }

    uint16 inum = dir_search_entry(pip, name);
    if(inum == INODE_NUM_UNUSED) {
        inode_unlock(pip);
        inode_free(pip);
        return -1;
    }

    inode_t* ip = inode_alloc(inum);
    inode_lock(ip);

    if(ip->nlink < 1)
        panic("path_unlink: nlink");

    if(ip->type == FT_DIR && check_unlink(ip) == false) {
        inode_unlock(ip);
        inode_free(ip);
        inode_unlock(pip);
        inode_free(pip);
        return -1;
    }

    dir_delete_entry(pip, name);
    if(ip->type == FT_DIR) {
        pip->nlink--;
        inode_rw(pip, true);
    }

    ip->nlink--;
    inode_rw(ip, true);

    inode_unlock_free(ip);
    inode_unlock(pip);
    inode_free(pip);
    return 0;
}
