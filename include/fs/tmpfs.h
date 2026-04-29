#ifndef __TMPFS_H__
#define __TMPFS_H__

#include "common.h"
#include "fs/file.h"

// 内存文件系统 (tmpfs) - 用于支持文件创建测试

#define TMPFS_MAX_FILES     256
#define TMPFS_MAX_NAME      128
#define TMPFS_MAX_SIZE      65536
#define TMPFS_TYPE_UNUSED   0
#define TMPFS_TYPE_FILE     1
#define TMPFS_TYPE_DIR      2

typedef struct tmpfs_file {
    uint8  type;                    // 文件类型
    char   name[TMPFS_MAX_NAME];    // 文件名
    uint32 size;                    // 文件大小
    uint8  data[TMPFS_MAX_SIZE];    // 文件内容
    uint32 parent;                  // 父目录索引
    uint32 backing;                 // 共享数据的后端索引
    uint32 nlink;                   // 共享数据的链接数
} tmpfs_file_t;

// 初始化 tmpfs
void tmpfs_init(void);

// 创建文件/目录
// 返回 tmpfs 索引，失败返回 -1
int tmpfs_create(const char* path, int type);

// 打开文件
// 返回 file_t*，失败返回 NULL
file_t* tmpfs_open(const char* path, uint32 flags);

// 检查路径是否存在于 tmpfs
int tmpfs_exists(const char* path);

// 读取文件
int tmpfs_read(int idx, uint32 offset, void* buf, uint32 len);

// 写入文件
int tmpfs_write(int idx, uint32 offset, const void* buf, uint32 len);

// 改变当前目录 (tmpfs)
int tmpfs_chdir(const char* path);

// 获取当前目录
const char* tmpfs_getcwd(void);

// 获取文件大小
uint32 tmpfs_get_size(int idx);

// 清空文件内容
int tmpfs_truncate(int idx);

// 获取 tmpfs 节点类型
int tmpfs_get_type(int idx);

// 获取 tmpfs 节点名/路径
const char* tmpfs_get_name(int idx);

// 枚举目录项，cursor 作为迭代位置
int tmpfs_readdir(int dir_idx, uint32* cursor, char* name, int name_len, uint8* type, uint64* ino);

// 删除文件
int tmpfs_unlink(const char* path);

// 创建硬链接（最小实现）
int tmpfs_link(const char* oldpath, const char* newpath);

#endif
