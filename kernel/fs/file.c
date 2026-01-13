#include "fs/fs.h"
#include "fs/buf.h"
#include "fs/dir.h"
#include "fs/bitmap.h"
#include "fs/inode.h"
#include "fs/file.h"
#include "fs/fat32.h"
#include "fs/tmpfs.h"
#include "mem/vmem.h"
#include "proc/cpu.h"
#include "lib/print.h"
#include "lib/string.h"
#include "dev/uart.h"

// Pipe 函数前向声明 (实现在 sysfunc.c)
struct pipe;
uint32 pipe_read(struct pipe* pi, uint64 dst, uint32 n, bool user);
uint32 pipe_write(struct pipe* pi, uint64 src, uint32 n, bool user);
void pipe_close(struct pipe* pi, int writable);

// 设备列表(读写接口)
dev_t devlist[N_DEV];

// ftable + 保护它的锁
#define N_FILE 32
file_t ftable[N_FILE];
spinlock_t lk_ftable;

static uint32 console_write(uint32 len, uint64 src, bool user_src)
{
    char ch;
    for(uint32 i = 0; i < len; i++) {
        if(user_src)
            uvm_copyin(myproc()->pgtbl, (uint64)&ch, src + i, 1);
        else
            ch = *((char*)(src + i));
        uart_putc_sync(ch);
    }
    return len;
}

static uint32 console_read(uint32 len, uint64 dst, bool user_dst)
{
    char ch;
    uint32 i = 0;
    while(i < len) {
        int c = uart_getc_sync();
        if(c == -1)
            break;
        ch = (char)c;
        if(user_dst)
            uvm_copyout(myproc()->pgtbl, dst + i, (uint64)&ch, 1);
        else
            *((char*)(dst + i)) = ch;
        i++;
    }
    return i;
}

// ftable初始化 + devlist初始化
void file_init()
{
    spinlock_init(&lk_ftable, "ftable");
    memset(ftable, 0, sizeof(ftable));
    memset(devlist, 0, sizeof(devlist));
    devlist[DEV_CONSOLE].read = console_read;
    devlist[DEV_CONSOLE].write = console_write;
}

// alloc file_t in ftable
// 失败则panic
file_t* file_alloc()
{
    spinlock_acquire(&lk_ftable);
    for(int i = 0; i < N_FILE; i++) {
        if(ftable[i].ref == 0) {
            ftable[i].ref = 1;
            ftable[i].type = FD_UNUSED;
            ftable[i].readable = false;
            ftable[i].writable = false;
            ftable[i].major = 0;
            ftable[i].offset = 0;
            ftable[i].ip = NULL;
            ftable[i].fat32_cluster = 0;
            ftable[i].fat32_size = 0;
            spinlock_release(&lk_ftable);
            return &ftable[i];
        }
    }
    spinlock_release(&lk_ftable);
    panic("file_alloc: no free file");
    return NULL;
}

// 创建设备文件(供proczero创建console)
file_t* file_create_dev(char* path, uint16 major, uint16 minor)
{
    inode_t* ip = path_create_inode(path, FT_DEVICE, major, minor);
    if(ip == NULL)
        return NULL;

    file_t* f = file_alloc();
    f->type = FD_DEVICE;
    f->readable = true;
    f->writable = true;
    f->major = major;
    f->ip = ip;
    f->offset = 0;
    return f;
}

// 打开一个文件
file_t* file_open(char* path, uint32 open_mode)
{
    inode_t* ip;
    if(open_mode & MODE_CREATE)
        ip = path_create_inode(path, FT_FILE, 0, 0);
    else
        ip = path_to_inode(path);

    if(ip == NULL)
        return NULL;

    inode_lock(ip);
    if(ip->type == FT_DIR && (open_mode & MODE_WRITE)) {
        inode_unlock_free(ip);
        return NULL;
    }

    file_t* f = file_alloc();
    f->ip = ip;
    f->offset = 0;
    f->readable = open_mode & MODE_READ;
    f->writable = open_mode & MODE_WRITE;
    f->major = ip->major;

    if(ip->type == FT_DIR)
        f->type = FD_DIR;
    else if(ip->type == FT_DEVICE)
        f->type = FD_DEVICE;
    else
        f->type = FD_FILE;

    inode_unlock(ip);
    return f;
}

// 打开 FAT32 文件
file_t* file_open_fat32(const char* path, uint32 open_mode)
{
    fat32_file_t fat_file;
    if(fat32_open(path, &fat_file) < 0) {
        return NULL;
    }
    
    file_t* f = file_alloc();
    f->type = FD_FAT32;
    f->readable = true;  // FAT32 当前只支持读
    f->writable = false;
    f->offset = 0;
    f->ip = NULL;
    f->fat32_cluster = fat_file.cluster;
    f->fat32_size = fat_file.size;
    
    return f;
}

// 释放一个file
void file_close(file_t* file)
{
    spinlock_acquire(&lk_ftable);
    if(file->ref < 1)
        panic("file_close: ref");
    file->ref--;
    if(file->ref > 0) {
        spinlock_release(&lk_ftable);
        return;
    }
    file_t f = *file;
    file->type = FD_UNUSED;
    file->ip = NULL;
    file->readable = file->writable = false;
    file->offset = 0;
    spinlock_release(&lk_ftable);

    if((f.type == FD_FILE || f.type == FD_DIR || f.type == FD_DEVICE) && f.ip) {
        inode_free(f.ip);
    }
    if(f.type == FD_PIPE && f.pipe) {
        pipe_close(f.pipe, f.writable);
    }
    // FAT32 文件不需要特殊清理，数据已在结构体中清零
}

// 文件内容读取
// 返回读取到的字节数
uint32 file_read(file_t* file, uint32 len, uint64 dst, bool user)
{
    if(!file->readable)
        return 0;

    uint32 r = 0;
    switch(file->type) {
        case FD_DEVICE:
            if(file->major >= N_DEV || devlist[file->major].read == NULL)
                return 0;
            return devlist[file->major].read(len, dst, user);
        case FD_FILE:
        case FD_DIR:
            inode_lock(file->ip);
            r = inode_read_data(file->ip, file->offset, len, (void*)dst, user);
            if(file->type == FD_FILE)
                file->offset += r;
            inode_unlock(file->ip);
            return r;
        case FD_FAT32:
            r = fat32_read_at(file->fat32_cluster, file->fat32_size, 
                              file->offset, (void*)dst, len, user, myproc()->pgtbl);
            if(r > 0) file->offset += r;
            return r;
        case FD_TMPFS: {
            // 从内核缓冲区读取，然后复制到用户空间
            static uint8 tmpbuf[4096];
            if(len > 4096) len = 4096;
            r = tmpfs_read(file->tmpfs_idx, file->offset, tmpbuf, len);
            if(r > 0) {
                if(user) {
                    uvm_copyout(myproc()->pgtbl, dst, (uint64)tmpbuf, r);
                } else {
                    memcpy((void*)dst, tmpbuf, r);
                }
                file->offset += r;
            }
            return r;
        }
        case FD_PIPE:
            return pipe_read(file->pipe, dst, len, user);
        default:
            return 0;
    }
}

// 文件内容写入
// 返回写入的字节数
uint32 file_write(file_t* file, uint32 len, uint64 src, bool user)
{
    if(!file->writable)
        return 0;

    switch(file->type) {
        case FD_DEVICE:
            if(file->major >= N_DEV || devlist[file->major].write == NULL)
                return 0;
            return devlist[file->major].write(len, src, user);
        case FD_FILE: {
            inode_lock(file->ip);
            uint32 r = inode_write_data(file->ip, file->offset, len, (void*)src, user);
            file->offset += r;
            inode_unlock(file->ip);
            return r;
        }
        case FD_TMPFS: {
            // 从用户空间复制到内核缓冲区，然后写入
            static uint8 tmpbuf[4096];
            if(len > 4096) len = 4096;
            if(user) {
                uvm_copyin(myproc()->pgtbl, (uint64)tmpbuf, src, len);
            } else {
                memcpy(tmpbuf, (void*)src, len);
            }
            uint32 r = tmpfs_write(file->tmpfs_idx, file->offset, tmpbuf, len);
            if(r > 0) file->offset += r;
            return r;
        }
        case FD_PIPE:
            return pipe_write(file->pipe, src, len, user);
        default:
            return 0;
    }
}

// flags 可能取值
#define LSEEK_SET 0  // file->offset = offset
#define LSEEK_ADD 1  // file->offset += offset
#define LSEEK_SUB 2  // file->offset -= offset

// 修改file->offset (只针对FD_FILE和FD_FAT32类型的文件)
uint32 file_lseek(file_t* file, uint32 offset, int flags)
{
    if(file->type != FD_FILE && file->type != FD_FAT32)
        return (uint32)-1;

    uint32 new_offset = file->offset;
    switch(flags) {
        case LSEEK_SET:
            new_offset = offset;
            break;
        case LSEEK_ADD:
            new_offset += offset;
            break;
        case LSEEK_SUB:
            new_offset = (new_offset > offset) ? (new_offset - offset) : 0;
            break;
        default:
            return (uint32)-1;
    }
    file->offset = new_offset;
    return new_offset;
}

// file->ref++ with lock
file_t* file_dup(file_t* file)
{
    spinlock_acquire(&lk_ftable);
    assert(file->ref > 0, "file_dup: ref");
    file->ref++;
    spinlock_release(&lk_ftable);
    return file;
}

// Linux kstat 结构
struct kstat {
    uint64 st_dev;
    uint64 st_ino;
    uint32 st_mode;
    uint32 st_nlink;
    uint32 st_uid;
    uint32 st_gid;
    uint64 st_rdev;
    uint64 __pad;
    int64  st_size;
    uint32 st_blksize;
    int32  __pad2;
    uint64 st_blocks;
    int64  st_atime_sec;
    int64  st_atime_nsec;
    int64  st_mtime_sec;
    int64  st_mtime_nsec;
    int64  st_ctime_sec;
    int64  st_ctime_nsec;
    uint32 __unused[2];
};

#define S_IFMT   0170000  // 文件类型掩码
#define S_IFREG  0100000  // 普通文件
#define S_IFDIR  0040000  // 目录
#define S_IFCHR  0020000  // 字符设备

// 获取文件状态 (返回 Linux 兼容的 kstat)
int file_stat(file_t* file, uint64 addr)
{
    struct kstat st;
    memset(&st, 0, sizeof(st));
    
    st.st_blksize = 512;
    
    if(file->type == FD_FILE || file->type == FD_DIR)
    {
        inode_lock(file->ip);
        st.st_dev = 0;
        st.st_ino = file->ip->inode_num;
        st.st_mode = (file->ip->type == FT_DIR) ? (S_IFDIR | 0755) : (S_IFREG | 0644);
        st.st_nlink = file->ip->nlink;
        st.st_size = file->ip->size;
        inode_unlock(file->ip);

        uvm_copyout(myproc()->pgtbl, addr, (uint64)&st, sizeof(st));
        return 0;
    }
    else if(file->type == FD_FAT32) {
        st.st_dev = 0;
        st.st_ino = file->fat32_cluster;  // 用簇号作为 inode 号
        st.st_mode = S_IFREG | 0644;
        st.st_nlink = 1;
        st.st_size = file->fat32_size;
        st.st_blocks = (file->fat32_size + 511) / 512;
        uvm_copyout(myproc()->pgtbl, addr, (uint64)&st, sizeof(st));
        return 0;
    }
    else if(file->type == FD_DEVICE) {
        st.st_dev = file->major;
        st.st_ino = 0;
        st.st_mode = S_IFCHR | 0666;
        st.st_nlink = 1;
        st.st_size = 0;
        uvm_copyout(myproc()->pgtbl, addr, (uint64)&st, sizeof(st));
        return 0;
    }
    else if(file->type == FD_TMPFS) {
        st.st_dev = 0;
        st.st_ino = file->tmpfs_idx;
        int t = tmpfs_get_type(file->tmpfs_idx);
        if(t == TMPFS_TYPE_DIR) {
            st.st_mode = S_IFDIR | 0755;
            st.st_size = 0;
        } else {
            st.st_mode = S_IFREG | 0644;
            st.st_size = tmpfs_get_size(file->tmpfs_idx);
        }
        st.st_nlink = 1;
        uvm_copyout(myproc()->pgtbl, addr, (uint64)&st, sizeof(st));
        return 0;
    }
    return -1;
}
