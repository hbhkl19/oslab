#include "fs/fs.h"
#include "fs/buf.h"
#include "fs/dir.h"
#include "fs/bitmap.h"
#include "fs/inode.h"
#include "fs/file.h"
#include "mem/vmem.h"
#include "proc/cpu.h"
#include "lib/print.h"
#include "lib/string.h"
#include "dev/uart.h"

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
        default:
            return 0;
    }
}

// flags 可能取值
#define LSEEK_SET 0  // file->offset = offset
#define LSEEK_ADD 1  // file->offset += offset
#define LSEEK_SUB 2  // file->offset -= offset

// 修改file->offset (只针对FD_FILE类型的文件)
uint32 file_lseek(file_t* file, uint32 offset, int flags)
{
    if(file->type != FD_FILE)
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

// 获取文件状态
int file_stat(file_t* file, uint64 addr)
{
    file_state_t state;
    if(file->type == FD_FILE || file->type == FD_DIR)
    {
        inode_lock(file->ip);
        state.type = file->ip->type;
        state.inode_num = file->ip->inode_num;
        state.nlink = file->ip->nlink;
        state.size = file->ip->size;
        inode_unlock(file->ip);

        uvm_copyout(myproc()->pgtbl, addr, (uint64)&state, sizeof(file_state_t));
    }
    return -1;
}
