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

static int tmpfs_alloc(void);

static int tmpfs_data_index(int idx)
{
    if(idx < 0 || idx >= TMPFS_MAX_FILES) return -1;
    if(tmpfs_files[idx].type != TMPFS_TYPE_FILE) return idx;

    uint32 backing = tmpfs_files[idx].backing;
    if(backing >= TMPFS_MAX_FILES) return -1;
    if(tmpfs_files[backing].type != TMPFS_TYPE_FILE) return -1;
    return (int)backing;
}

// 初始化 tmpfs
void tmpfs_init(void)
{
    memset(tmpfs_files, 0, sizeof(tmpfs_files));
    
    // 创建根目录
    tmpfs_files[0].type = TMPFS_TYPE_DIR;
    strncpy(tmpfs_files[0].name, "/", TMPFS_MAX_NAME);
    tmpfs_files[0].parent = 0;
    tmpfs_files[0].backing = 0;
    tmpfs_files[0].nlink = 1;
    
    strncpy(tmpfs_cwd, "/", TMPFS_MAX_NAME);
}

// 规范化路径（处理 ., .., 多余的 /，并输出绝对路径）
static void normalize_path(const char* path, char* out, int outlen)
{
    if(outlen <= 1) {
        return;
    }

    int seg_starts[TMPFS_MAX_NAME / 2];
    int seg_count = 0;
    int pos = 0;
    out[pos++] = '/';
    out[pos] = '\0';

    const char* p = path;
    while(*p != '\0') {
        while(*p == '/') {
            p++;
        }
        if(*p == '\0') {
            break;
        }

        char segment[TMPFS_MAX_NAME];
        int seg_len = 0;
        while(*p != '\0' && *p != '/') {
            if(seg_len < TMPFS_MAX_NAME - 1) {
                segment[seg_len++] = *p;
            }
            p++;
        }
        segment[seg_len] = '\0';

        if(seg_len == 0 || (seg_len == 1 && strncmp(segment, ".", 2) == 0)) {
            continue;
        }
        if(seg_len == 2 && strncmp(segment, "..", 3) == 0) {
            if(seg_count > 0) {
                pos = seg_starts[--seg_count];
                out[pos] = '\0';
            }
            continue;
        }

        if(pos > 1) {
            if(pos >= outlen - 1) {
                break;
            }
            out[pos++] = '/';
        }
        if(pos >= outlen - 1) {
            break;
        }

        seg_starts[seg_count++] = (pos > 1) ? pos - 1 : 1;
        for(int i = 0; i < seg_len && pos < outlen - 1; i++) {
            out[pos++] = segment[i];
        }
        out[pos] = '\0';
    }

    if(pos == 0) {
        out[0] = '/';
        out[1] = '\0';
    } else if(pos > 1 && out[pos - 1] == '/') {
        out[pos - 1] = '\0';
    }
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

static int tmpfs_parent_index(const char* normalized)
{
    if(normalized[0] != '/') return -1;
    if(normalized[1] == '\0') return 0;

    int last = -1;
    for(int i = 1; normalized[i] != '\0'; i++) {
        if(normalized[i] == '/') last = i;
    }
    if(last < 0 || last == 0) return 0;

    char parent[TMPFS_MAX_NAME];
    if(last >= TMPFS_MAX_NAME) return -1;
    memcpy(parent, normalized, last);
    parent[last] = '\0';
    return tmpfs_find(parent);
}

static int tmpfs_create_dir_entry(const char* normalized)
{
    int parent = tmpfs_parent_index(normalized);
    if(parent < 0) return -1;
    if(tmpfs_files[parent].type != TMPFS_TYPE_DIR) return -1;

    int idx = tmpfs_alloc();
    if(idx < 0) return -1;

    tmpfs_files[idx].type = TMPFS_TYPE_DIR;
    strncpy(tmpfs_files[idx].name, normalized, TMPFS_MAX_NAME);
    tmpfs_files[idx].size = 0;
    tmpfs_files[idx].parent = parent;
    memset(tmpfs_files[idx].data, 0, TMPFS_MAX_SIZE);
    return idx;
}

static int tmpfs_ensure_dir(const char* path)
{
    char normalized[TMPFS_MAX_NAME];
    normalize_path(path, normalized, TMPFS_MAX_NAME);

    int idx = tmpfs_find(normalized);
    if(idx >= 0) {
        return (tmpfs_files[idx].type == TMPFS_TYPE_DIR) ? idx : -1;
    }

    if(normalized[1] == '\0') {
        return 0;
    }

    int last = -1;
    for(int i = 1; normalized[i] != '\0'; i++) {
        if(normalized[i] == '/') last = i;
    }

    if(last > 0) {
        char parent[TMPFS_MAX_NAME];
        memcpy(parent, normalized, last);
        parent[last] = '\0';
        if(tmpfs_ensure_dir(parent) < 0) {
            return -1;
        }
    }

    return tmpfs_create_dir_entry(normalized);
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
        return tmpfs_find(normalized);
    }

    int parent = tmpfs_parent_index(normalized);
    if(parent < 0) {
        int last = -1;
        for(int i = 1; normalized[i] != '\0'; i++) {
            if(normalized[i] == '/') last = i;
        }
        if(last > 0) {
            char parent_path[TMPFS_MAX_NAME];
            memcpy(parent_path, normalized, last);
            parent_path[last] = '\0';
            parent = tmpfs_ensure_dir(parent_path);
        }
    }
    if(parent < 0) return -1;
    if(tmpfs_files[parent].type != TMPFS_TYPE_DIR) return -1;

    int idx = tmpfs_alloc();
    if(idx < 0) return -1;

    tmpfs_files[idx].type = type;
    strncpy(tmpfs_files[idx].name, normalized, TMPFS_MAX_NAME);
    tmpfs_files[idx].size = 0;
    tmpfs_files[idx].parent = parent;
    tmpfs_files[idx].backing = idx;
    tmpfs_files[idx].nlink = 1;
    memset(tmpfs_files[idx].data, 0, TMPFS_MAX_SIZE);

    return idx;
}

// 外部声明的 file_alloc
extern file_t* file_alloc(void);
extern int fd_alloc(file_t* file);

// 打开文件
file_t* tmpfs_open(const char* path, uint32 flags)
{
    char normalized[TMPFS_MAX_NAME];
    normalize_path(path, normalized, TMPFS_MAX_NAME);
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
    safestrcpy(f->path, normalized, sizeof(f->path));
    f->status_flags = is_dir ? (OPEN_RDONLY | OPEN_DIRECTORY) : OPEN_RDWR;
    
    return f;
}

// 读取文件
int tmpfs_read(int idx, uint32 offset, void* buf, uint32 len)
{
    if(idx < 0 || idx >= TMPFS_MAX_FILES) return -1;
    if(tmpfs_files[idx].type != TMPFS_TYPE_FILE) return -1;

    int data_idx = tmpfs_data_index(idx);
    if(data_idx < 0) return -1;

    uint32 size = tmpfs_files[data_idx].size;
    if(offset >= size) return 0;
    if(offset + len > size) len = size - offset;

    memcpy(buf, tmpfs_files[data_idx].data + offset, len);
    return len;
}

// 写入文件
int tmpfs_write(int idx, uint32 offset, const void* buf, uint32 len)
{
    if(idx < 0 || idx >= TMPFS_MAX_FILES) return -1;
    if(tmpfs_files[idx].type != TMPFS_TYPE_FILE) return -1;

    int data_idx = tmpfs_data_index(idx);
    if(data_idx < 0) return -1;

    if(offset + len > TMPFS_MAX_SIZE) {
        len = TMPFS_MAX_SIZE - offset;
    }

    memcpy(tmpfs_files[data_idx].data + offset, buf, len);

    if(offset + len > tmpfs_files[data_idx].size) {
        tmpfs_files[data_idx].size = offset + len;
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
        return -1;
    }

    if(tmpfs_files[idx].type != TMPFS_TYPE_DIR) {
        return -1;
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
    int data_idx = tmpfs_data_index(idx);
    if(data_idx < 0) return 0;
    return tmpfs_files[data_idx].size;
}

int tmpfs_truncate(int idx)
{
    if(idx < 0 || idx >= TMPFS_MAX_FILES) return -1;
    if(tmpfs_files[idx].type != TMPFS_TYPE_FILE) return -1;

    int data_idx = tmpfs_data_index(idx);
    if(data_idx < 0) return -1;

    tmpfs_files[data_idx].size = 0;
    memset(tmpfs_files[data_idx].data, 0, TMPFS_MAX_SIZE);
    return 0;
}

// 获取 tmpfs 节点类型
int tmpfs_get_type(int idx)
{
    if(idx < 0 || idx >= TMPFS_MAX_FILES) return -1;
    return tmpfs_files[idx].type;
}

const char* tmpfs_get_name(int idx)
{
    if(idx < 0 || idx >= TMPFS_MAX_FILES) return NULL;
    if(tmpfs_files[idx].type == TMPFS_TYPE_UNUSED) return NULL;
    return tmpfs_files[idx].name;
}

int tmpfs_readdir(int dir_idx, uint32* cursor, char* name, int name_len, uint8* type, uint64* ino)
{
    if(dir_idx < 0 || dir_idx >= TMPFS_MAX_FILES) return -1;
    if(tmpfs_files[dir_idx].type != TMPFS_TYPE_DIR) return -1;
    if(cursor == NULL || name == NULL || name_len <= 0 || type == NULL || ino == NULL) return -1;

    uint32 start = *cursor;
    if(start < 1) start = 1;

    for(uint32 i = start; i < TMPFS_MAX_FILES; i++) {
        if(tmpfs_files[i].type == TMPFS_TYPE_UNUSED) continue;
        if(tmpfs_files[i].name[0] == '\0') continue;
        if(tmpfs_files[i].parent != (uint32)dir_idx) continue;

        const char* base = tmpfs_files[i].name;
        const char* slash = base;
        while(*slash != '\0') {
            if(*slash == '/' && slash[1] != '\0') {
                base = slash + 1;
            }
            slash++;
        }

        safestrcpy(name, base, name_len);
        *type = (tmpfs_files[i].type == TMPFS_TYPE_DIR) ? TMPFS_TYPE_DIR : TMPFS_TYPE_FILE;
        *ino = i;
        *cursor = i + 1;
        return 0;
    }

    return -1;
}

// 删除文件
int tmpfs_unlink(const char* path)
{
    char normalized[TMPFS_MAX_NAME];
    normalize_path(path, normalized, TMPFS_MAX_NAME);

    int idx = tmpfs_find(normalized);
    if(idx < 0 || idx == 0) return -1;

    if(tmpfs_files[idx].type == TMPFS_TYPE_DIR) {
        for(int i = 1; i < TMPFS_MAX_FILES; i++) {
            if(tmpfs_files[i].type != TMPFS_TYPE_UNUSED && tmpfs_files[i].parent == (uint32)idx) {
                return -1;
            }
        }
    }

    if(tmpfs_files[idx].type == TMPFS_TYPE_FILE) {
        int data_idx = tmpfs_data_index(idx);
        if(data_idx < 0) return -1;

        if(tmpfs_files[data_idx].nlink > 0) {
            tmpfs_files[data_idx].nlink--;
        }
        if(tmpfs_files[data_idx].nlink == 0) {
            tmpfs_files[data_idx].type = TMPFS_TYPE_UNUSED;
            tmpfs_files[data_idx].size = 0;
            tmpfs_files[data_idx].parent = 0;
            tmpfs_files[data_idx].backing = 0;
            tmpfs_files[data_idx].nlink = 0;
            memset(tmpfs_files[data_idx].data, 0, TMPFS_MAX_SIZE);
            memset(tmpfs_files[data_idx].name, 0, TMPFS_MAX_NAME);
        } else if(data_idx == idx) {
            tmpfs_files[idx].name[0] = '\0';
            tmpfs_files[idx].parent = 0;
            return 0;
        }
    }

    if(tmpfs_files[idx].type != TMPFS_TYPE_UNUSED) {
        tmpfs_files[idx].type = TMPFS_TYPE_UNUSED;
        tmpfs_files[idx].size = 0;
        tmpfs_files[idx].parent = 0;
        tmpfs_files[idx].backing = 0;
        tmpfs_files[idx].nlink = 0;
        memset(tmpfs_files[idx].data, 0, TMPFS_MAX_SIZE);
        memset(tmpfs_files[idx].name, 0, TMPFS_MAX_NAME);
    }
    return 0;
}

int tmpfs_link(const char* oldpath, const char* newpath)
{
    int oldidx = tmpfs_find(oldpath);
    if(oldidx < 0) return -1;
    if(tmpfs_files[oldidx].type != TMPFS_TYPE_FILE) return -1;

    int data_idx = tmpfs_data_index(oldidx);
    if(data_idx < 0) return -1;

    char normalized[TMPFS_MAX_NAME];
    normalize_path(newpath, normalized, TMPFS_MAX_NAME);
    if(tmpfs_find(normalized) >= 0) return -1;

    int parent = tmpfs_parent_index(normalized);
    if(parent < 0) return -1;
    if(tmpfs_files[parent].type != TMPFS_TYPE_DIR) return -1;

    int newidx = tmpfs_alloc();
    if(newidx < 0) return -1;

    tmpfs_files[newidx].type = TMPFS_TYPE_FILE;
    strncpy(tmpfs_files[newidx].name, normalized, TMPFS_MAX_NAME);
    tmpfs_files[newidx].size = 0;
    tmpfs_files[newidx].parent = parent;
    tmpfs_files[newidx].backing = data_idx;
    tmpfs_files[newidx].nlink = 0;
    tmpfs_files[data_idx].nlink++;
    memset(tmpfs_files[newidx].data, 0, TMPFS_MAX_SIZE);
    return 0;
}
