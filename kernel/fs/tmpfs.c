// tmpfs.c - 内存文件系统实现
// 用于支持文件创建测试（close, chdir, openat 等）

#include "fs/tmpfs.h"
#include "fs/file.h"
#include "lib/string.h"
#include "lib/print.h"
#include "proc/cpu.h"
#include "mem/vmem.h"

static tmpfs_file_t tmpfs_files[TMPFS_MAX_FILES];
static char tmpfs_cwd[TMPFS_MAX_NAME] = "/";

// 初始化 tmpfs
void tmpfs_init(void)
{
    memset(tmpfs_files, 0, sizeof(tmpfs_files));
    
    // 创建根目录
    tmpfs_files[0].type = TMPFS_TYPE_DIR;
    strncpy(tmpfs_files[0].name, "/", TMPFS_MAX_NAME);
    tmpfs_files[0].parent = 0;
    
    strncpy(tmpfs_cwd, "/", TMPFS_MAX_NAME);
}

// 规范化路径（去掉 ./ 和 多余的 /）
static void normalize_path(const char* path, char* out, int outlen)
{
    const char* p = path;
    char* o = out;
    char* end = out + outlen - 1;
    
    // 跳过开头的 ./
    while(*p == '.' && *(p+1) == '/') p += 2;
    while(*p == '/') p++;
    
    // 如果是空路径，返回根目录
    if(*p == '\0') {
        *o++ = '/';
        *o = '\0';
        return;
    }
    
    *o++ = '/';  // 开头加 /
    while(*p && o < end) {
        if(*p == '/') {
            // 跳过多余的 /
            while(*p == '/') p++;
            if(*p && o < end) *o++ = '/';
        } else {
            *o++ = *p++;
        }
    }
    *o = '\0';
}

// 查找文件
static int tmpfs_find(const char* path)
{
    char normalized[TMPFS_MAX_NAME];
    normalize_path(path, normalized, TMPFS_MAX_NAME);
    
    for(int i = 0; i < TMPFS_MAX_FILES; i++) {
        if(tmpfs_files[i].type != TMPFS_TYPE_UNUSED) {
            if(strncmp(tmpfs_files[i].name, normalized, TMPFS_MAX_NAME) == 0) {
                return i;
            }
        }
    }
    return -1;
}

// 分配空闲槽
static int tmpfs_alloc(void)
{
    for(int i = 1; i < TMPFS_MAX_FILES; i++) {  // 0 是根目录
        if(tmpfs_files[i].type == TMPFS_TYPE_UNUSED) {
            return i;
        }
    }
    return -1;
}

// 检查路径是否存在
int tmpfs_exists(const char* path)
{
    return tmpfs_find(path) >= 0;
}

// 创建文件/目录
int tmpfs_create(const char* path, int type)
{
    char normalized[TMPFS_MAX_NAME];
    normalize_path(path, normalized, TMPFS_MAX_NAME);
    
    // 检查是否已存在
    if(tmpfs_find(normalized) >= 0) {
        return tmpfs_find(normalized);  // 已存在，返回索引
    }
    
    int idx = tmpfs_alloc();
    if(idx < 0) return -1;
    
    tmpfs_files[idx].type = type;
    strncpy(tmpfs_files[idx].name, normalized, TMPFS_MAX_NAME);
    tmpfs_files[idx].size = 0;
    tmpfs_files[idx].parent = 0;  // 简化：所有文件都在根目录
    memset(tmpfs_files[idx].data, 0, TMPFS_MAX_SIZE);
    
    return idx;
}

// 外部声明的 file_alloc
extern file_t* file_alloc(void);
extern int fd_alloc(file_t* file);

// 打开文件
file_t* tmpfs_open(const char* path, uint32 flags)
{
    int idx = tmpfs_find(path);
    
    // 如果不存在且需要创建
    if(idx < 0 && (flags & 0x40)) {  // O_CREATE = 0x40
        idx = tmpfs_create(path, TMPFS_TYPE_FILE);
    }
    
    if(idx < 0) return NULL;
    
    bool is_dir = (tmpfs_files[idx].type == TMPFS_TYPE_DIR);

    file_t* f = file_alloc();
    if(f == NULL) return NULL;
    
    f->type = FD_TMPFS;
    f->readable = true;
    f->writable = !is_dir;
    f->offset = 0;
    f->ip = NULL;
    f->tmpfs_idx = idx;
    
    return f;
}

// 读取文件
int tmpfs_read(int idx, uint32 offset, void* buf, uint32 len)
{
    if(idx < 0 || idx >= TMPFS_MAX_FILES) return -1;
    if(tmpfs_files[idx].type != TMPFS_TYPE_FILE) return -1;
    
    uint32 size = tmpfs_files[idx].size;
    if(offset >= size) return 0;
    if(offset + len > size) len = size - offset;
    
    memcpy(buf, tmpfs_files[idx].data + offset, len);
    return len;
}

// 写入文件
int tmpfs_write(int idx, uint32 offset, const void* buf, uint32 len)
{
    if(idx < 0 || idx >= TMPFS_MAX_FILES) return -1;
    if(tmpfs_files[idx].type != TMPFS_TYPE_FILE) return -1;
    
    if(offset + len > TMPFS_MAX_SIZE) {
        len = TMPFS_MAX_SIZE - offset;
    }
    
    memcpy(tmpfs_files[idx].data + offset, buf, len);
    
    if(offset + len > tmpfs_files[idx].size) {
        tmpfs_files[idx].size = offset + len;
    }
    
    return len;
}

// 改变当前目录
int tmpfs_chdir(const char* path)
{
    char normalized[TMPFS_MAX_NAME];
    normalize_path(path, normalized, TMPFS_MAX_NAME);
    
    int idx = tmpfs_find(normalized);
    if(idx < 0) {
        // 目录不存在，尝试创建
        idx = tmpfs_create(normalized, TMPFS_TYPE_DIR);
        if(idx < 0) return -1;
    }
    
    if(tmpfs_files[idx].type != TMPFS_TYPE_DIR) {
        return -1;  // 不是目录
    }
    
    strncpy(tmpfs_cwd, normalized, TMPFS_MAX_NAME);
    return 0;
}

// 获取当前目录
const char* tmpfs_getcwd(void)
{
    return tmpfs_cwd;
}

// 获取文件大小
uint32 tmpfs_get_size(int idx)
{
    if(idx < 0 || idx >= TMPFS_MAX_FILES) return 0;
    if(tmpfs_files[idx].type != TMPFS_TYPE_FILE) return 0;
    return tmpfs_files[idx].size;
}

// 获取 tmpfs 节点类型
int tmpfs_get_type(int idx)
{
    if(idx < 0 || idx >= TMPFS_MAX_FILES) return -1;
    return tmpfs_files[idx].type;
}

// 删除文件
int tmpfs_unlink(const char* path)
{
    char normalized[TMPFS_MAX_NAME];
    // 简化的路径规范化
    const char* p = path;
    while(*p == '.' && *(p+1) == '/') p += 2;
    while(*p == '/') p++;
    
    char* o = normalized;
    *o++ = '/';
    while(*p && o < normalized + TMPFS_MAX_NAME - 1) {
        *o++ = *p++;
    }
    *o = '\0';
    
    // 查找文件
    for(int i = 1; i < TMPFS_MAX_FILES; i++) {
        if(tmpfs_files[i].type != TMPFS_TYPE_UNUSED) {
            if(strncmp(tmpfs_files[i].name, normalized, TMPFS_MAX_NAME) == 0) {
                // 标记为未使用
                tmpfs_files[i].type = TMPFS_TYPE_UNUSED;
                tmpfs_files[i].size = 0;
                memset(tmpfs_files[i].name, 0, TMPFS_MAX_NAME);
                return 0;
            }
        }
    }
    return -1;  // 未找到
}
