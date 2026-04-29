#include "proc/cpu.h"
#include "mem/vmem.h"
#include "fs/inode.h"
#include "fs/dir.h"
#include "fs/file.h"
#include "fs/fat32.h"
#include "fs/tmpfs.h"
#include "lib/string.h"
#include "lib/print.h"
#include "syscall/syscall.h"
#include "syscall/sysfunc.h"

// Linux 文件打开标志
#define O_RDONLY    0x000
#define O_WRONLY    0x001
#define O_RDWR      0x002
#define O_CREATE    0x40
#define O_TRUNC     0x200
#define O_APPEND    0x400
#define O_DIRECTORY 0x200000
#define O_DIRECTORY_LINUX 0x10000
#define O_NONBLOCK  0x800
#define O_CLOEXEC   0x80000

#define AT_FDCWD    (-100)

static void normalize_absolute_path(const char* path, char* out)
{
    int len = 1;
    out[0] = '/';
    out[1] = '\0';

    const char* p = path;
    while(*p != '\0') {
        while(*p == '/') p++;
        if(*p == '\0') break;

        const char* seg = p;
        int seg_len = 0;
        while(p[seg_len] != '\0' && p[seg_len] != '/') seg_len++;
        p += seg_len;

        if(seg_len == 1 && seg[0] == '.') continue;
        if(seg_len == 2 && seg[0] == '.' && seg[1] == '.') {
            if(len > 1) {
                len--;
                while(len > 1 && out[len - 1] != '/') len--;
                out[len] = '\0';
            }
            continue;
        }

        if(len > 1 && len < DIR_PATH_LEN - 1)
            out[len++] = '/';
        for(int i = 0; i < seg_len && len < DIR_PATH_LEN - 1; i++)
            out[len++] = seg[i];
        out[len] = '\0';
    }
}

static void resolve_user_path_local(const char* path, char* out)
{
    proc_t* p = myproc();
    const char* cwd = "/";
    if(p && p->cwd_path[0] != '\0')
        cwd = p->cwd_path;

    if(path[0] == '/') {
        normalize_absolute_path(path, out);
        return;
    }

    char joined[DIR_PATH_LEN];
    safestrcpy(joined, cwd, sizeof(joined));
    int len = strlen(joined);
    if(len == 0) {
        joined[0] = '/';
        joined[1] = '\0';
        len = 1;
    }
    if(len > 1 && joined[len - 1] == '/') {
        joined[len - 1] = '\0';
        len--;
    }
    if(len < DIR_PATH_LEN - 1) {
        joined[len++] = '/';
        joined[len] = '\0';
    }
    safestrcpy(joined + len, path, sizeof(joined) - len);
    normalize_absolute_path(joined, out);
}

// 获取第n个参数对应的fd和这个fd对应的file
// 成功返回0 失败返回-1
static int arg_fd(int n, int* pfd, file_t** pfile)
{
    // 读出fd
    int fd = 0;
    arg_uint32(n, (uint32*)(&fd));
    
    // fd 溢出
    if(fd < 0 || fd >= FILE_PER_PROC)
        return -1;
    
    // 确定fd对应的file
    file_t* file = myproc()->filelist[fd];
    if(file == NULL)
        return -1;
    
    if(pfd) *pfd = fd;
    if(pfile) *pfile = file;

    return 0;
}

// 成功返回申请到的fd
// 失败返回-1
int fd_alloc(file_t* file)
{
    proc_t* p = myproc();

    for(int fd = 0; fd < FILE_PER_PROC; fd++) {
        if(p->filelist[fd] == NULL) {
            p->filelist[fd] = file;
            p->fd_cloexec[fd] = 0;
            return fd;
        }
    }

    return -1;
}

// 打开或创建文件
// char* path
// uint32 flags (Linux 标志)
// 成功返回fd 失败返回-1
uint64 sys_open()
{
    char path[DIR_PATH_LEN];
    char resolved[DIR_PATH_LEN];
    uint32 flags;

    arg_str(0, path, DIR_PATH_LEN);
    arg_uint32(1, &flags);
    resolve_user_path_local(path, resolved);

    file_t* file = NULL;

    if(strncmp(resolved, "/", DIR_PATH_LEN) == 0 && !(flags & O_CREATE)) {
        file = file_alloc();
        if(file) {
            file->type = FD_FAT32;
            file->readable = true;
            file->writable = false;
            file->offset = 0;
            file->ip = NULL;
            file->fat32_cluster = fat32_get_root_cluster();
            file->fat32_size = 0;
            safestrcpy(file->path, "/", sizeof(file->path));
            file->status_flags = OPEN_RDONLY | OPEN_DIRECTORY;
            int fd = fd_alloc(file);
            if(fd >= 0 && (flags & O_CLOEXEC)) myproc()->fd_cloexec[fd] = 1;
            if(fd == -1) file_close(file);
            return fd;
        }
    }

    // 先处理创建场景：始终使用 tmpfs
    if(flags & O_CREATE) {
        file = tmpfs_open(resolved, flags);
        if(file != NULL) {
            int type = tmpfs_get_type(file->tmpfs_idx);
            if((flags & (O_DIRECTORY | O_DIRECTORY_LINUX)) && type != TMPFS_TYPE_DIR) {
                file_close(file);
                return -1;
            }
            if(type == TMPFS_TYPE_DIR) {
                file->writable = false;
                file->status_flags |= OPEN_DIRECTORY;
            }
            file->status_flags = (file->status_flags & ~(OPEN_APPEND | OPEN_NONBLOCK | OPEN_CLOEXEC))
                               | (flags & (O_APPEND | O_NONBLOCK));
            if((flags & O_TRUNC) && file->writable) {
                if(file_truncate(file) < 0) {
                    file_close(file);
                    return -1;
                }
            }
            int fd = fd_alloc(file);
            if(fd >= 0 && (flags & O_CLOEXEC)) myproc()->fd_cloexec[fd] = 1;
            if(fd == -1) file_close(file);
            return fd;
        }
    }

    // 非创建场景优先尝试 FAT32（用于 SD 卡测试文件）
    file = file_open_fat32(resolved, flags);
    if(file == NULL) {
        // 如果 FAT32 没找到，再尝试 tmpfs 中已存在的条目
        if(tmpfs_exists(resolved)) {
            file = tmpfs_open(resolved, flags);
            if(file != NULL) {
                int type = tmpfs_get_type(file->tmpfs_idx);
                if((flags & (O_DIRECTORY | O_DIRECTORY_LINUX)) && type != TMPFS_TYPE_DIR) {
                    file_close(file);
                    return -1;
                }
                if(type == TMPFS_TYPE_DIR) {
                    file->writable = false;
                    file->status_flags |= OPEN_DIRECTORY;
                }
                file->status_flags = (file->status_flags & ~(OPEN_APPEND | OPEN_NONBLOCK | OPEN_CLOEXEC))
                                   | (flags & (O_APPEND | O_NONBLOCK));
                if((flags & O_TRUNC) && file->writable) {
                    if(file_truncate(file) < 0) {
                        file_close(file);
                        return -1;
                    }
                }
                int fd = fd_alloc(file);
                if(fd >= 0 && (flags & O_CLOEXEC)) myproc()->fd_cloexec[fd] = 1;
                if(fd == -1) file_close(file);
                return fd;
            }
        }
    }

    // FAT32 和 tmpfs 都失败，回退到原始文件系统
    if(file == NULL) {
        uint32 open_mode = 0;
        if(flags & O_CREATE) open_mode |= MODE_CREATE;
        if((flags & O_RDWR) == O_RDWR) {
            open_mode |= MODE_READ | MODE_WRITE;
        } else if(flags & O_WRONLY) {
            open_mode |= MODE_WRITE;
        } else {
            open_mode |= MODE_READ;  // O_RDONLY = 0
        }
        file = file_open(resolved, open_mode);
    }
    
    if(file == NULL)
        return -1;

    if((flags & (O_DIRECTORY | O_DIRECTORY_LINUX)) && file->type != FD_DIR && file->type != FD_TMPFS && !(file->type == FD_FAT32 && strncmp(resolved, "/", DIR_PATH_LEN) == 0)) {
        file_close(file);
        return -1;
    }
    file->status_flags = (file->status_flags & ~(OPEN_APPEND | OPEN_NONBLOCK | OPEN_CLOEXEC))
                       | (flags & (O_APPEND | O_NONBLOCK));
    if(flags & (O_DIRECTORY | O_DIRECTORY_LINUX))
        file->status_flags |= OPEN_DIRECTORY;
    if((flags & O_TRUNC) && file->writable) {
        if(file_truncate(file) < 0) {
            file_close(file);
            return -1;
        }
    }
    
    int fd = fd_alloc(file);
    if(fd >= 0 && (flags & O_CLOEXEC)) myproc()->fd_cloexec[fd] = 1;
    if(fd == -1)
        file_close(file);

    return fd;
}

// 关闭一个文件
// int fd
// 成功返回0 失败返回-1
uint64 sys_close()
{
    int fd;
    file_t* file;

    if(arg_fd(0, &fd, &file) < 0)
        return -1;

    myproc()->filelist[fd] = NULL;
    myproc()->fd_cloexec[fd] = 0;
    file_close(file);

    return 0;
}

// 文件内容读取
// int fd
// uint64 buf
// uint32 count
// 成功返回字节数 失败返回0
uint64 sys_read()
{
    uint64 addr;
    uint32 len;
    file_t* file;

    if(arg_fd(0, NULL, &file) < 0)
        return -1;
    arg_uint64(1, &addr);  // buf 地址
    arg_uint32(2, &len);   // 长度

    return file_read(file, len, addr, true);
}

// 文件内容写入
// int fd
// uint32 len
// uint64 addr
// 成功返回字节数 失败返回0
uint64 sys_write()
{
    uint64 addr;
    uint32 len;
    file_t* file;

    if(arg_fd(0, NULL, &file) < 0)
        return -1;
    arg_uint64(1, &addr);  // buf 地址
    arg_uint32(2, &len);   // 长度

    return file_write(file, len, addr, true);
}

// 文件偏移量设置
// int fd
// uint32 offset
// int flags (见LSEEK_xxx)
// 成功返回新的偏移量, 失败返回-1
uint64 sys_lseek()
{
    file_t* file;
    uint32 offset;
    int flags;

    if(arg_fd(0, NULL, &file) < 0)
        return -1;
    arg_uint32(1, &offset);
    arg_uint32(2, (uint32*)(&flags));

    return file_lseek(file, offset, flags);
}

// int fd
// 成功返回 new_fd 失败返回 -1
uint64 sys_dup()
{
    int new_fd;
    file_t* file;

    if(arg_fd(0, NULL, &file) < 0)
        return -1;
    
    new_fd = fd_alloc(file);
    if(new_fd >= 0) {
        file_dup(file);
        myproc()->fd_cloexec[new_fd] = 0;
    }

    return new_fd;
}

// 获取文件信息
// int fd
// uint64 addr
// 成功返回0 失败返回-1
uint64 sys_fstat()
{
    uint64 addr;
    file_t* file;
    
    if(arg_fd(0, NULL, &file) < 0)
        return -1;
    arg_uint64(1, &addr);

    return file_stat(file, addr);
}

// 获取目录里的目录项
// int fd
// uint64 addr
// uint32 len
// 成功返回读取的字节数, 失败返回-1
uint64 sys_getdir()
{
    file_t* file;
    uint64 addr;
    uint32 len;

    if(arg_fd(0, NULL, &file) < 0)
        return -1;
    arg_uint64(1, &addr);
    arg_uint32(2, &len);

    if(file->type != FD_DIR || file->ip == NULL)
        return -1;

    inode_lock(file->ip);
    len = dir_get_entries(file->ip, len, (void*)addr, true);
    inode_unlock(file->ip);

    return len;
}

// 创建目录
// char* path
// 成功返回0 失败返回-1
uint64 sys_mkdir()
{
    char path[DIR_PATH_LEN];
    char resolved[DIR_PATH_LEN];
    arg_str(0, path, DIR_PATH_LEN);
    resolve_user_path_local(path, resolved);

    // 尝试在 tmpfs 中创建目录
    int idx = tmpfs_create(resolved, 2);  // TMPFS_TYPE_DIR = 2
    if(idx >= 0) return 0;

    inode_t* inode = path_create_inode(resolved, FT_DIR, 0, 0);

    return (inode == NULL) ? -1 : 0;
}

// 文件链接
// char* old_path
// char* new_path
// 成功返回0 失败返回-1
uint64 sys_link()
{
    char old_path[DIR_PATH_LEN], new_path[DIR_PATH_LEN];
    char old_resolved[DIR_PATH_LEN], new_resolved[DIR_PATH_LEN];
    arg_str(0, old_path, DIR_PATH_LEN);
    arg_str(1, new_path, DIR_PATH_LEN);
    resolve_user_path_local(old_path, old_resolved);
    resolve_user_path_local(new_path, new_resolved);

    if(tmpfs_exists(old_resolved))
        return tmpfs_link(old_resolved, new_resolved);
    return path_link(old_resolved, new_resolved);
}

// 文件删除链接 (link=0 则删除文件)
// char* path
// 成功返回0 失败返回-1
uint64 sys_unlink()
{
    char path[DIR_PATH_LEN];
    char resolved[DIR_PATH_LEN];
    arg_str(0, path, DIR_PATH_LEN);
    resolve_user_path_local(path, resolved);

    if(tmpfs_unlink(resolved) == 0) return 0;
    return path_unlink(resolved);
}
