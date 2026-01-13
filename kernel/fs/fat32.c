#include "fs/fat32.h"
#include "fs/buf.h"
#include "lib/print.h"
#include "lib/string.h"

// 全局 FAT32 信息
static fat32_info_t fat32_info;

// 读取一个扇区的数据到 buf (sector 是相对于磁盘起始的扇区号)
// BLOCK_SIZE = 1024，FAT32_SECTOR_SIZE = 512
// 一个 block 包含 2 个 sector
static int fat32_read_sector_data(uint32 sector, void* dst)
{
    uint32 block_num = sector / (BLOCK_SIZE / FAT32_SECTOR_SIZE);
    uint32 offset_in_block = (sector % (BLOCK_SIZE / FAT32_SECTOR_SIZE)) * FAT32_SECTOR_SIZE;
    
    buf_t* buf = buf_read(block_num);
    if(buf == NULL) return -1;
    
    memcpy(dst, buf->data + offset_in_block, FAT32_SECTOR_SIZE);
    buf_release(buf);
    return 0;
}

// 初始化 FAT32 文件系统
int fat32_init()
{
    // 读取引导扇区 (扇区0)
    uint8 sector_buf[FAT32_SECTOR_SIZE];
    if(fat32_read_sector_data(0, sector_buf) < 0) {
        DEBUG_LOG("[fat32] Failed to read boot sector\n");
        return -1;
    }
    
    fat32_bpb_t* bpb = (fat32_bpb_t*)sector_buf;
    
    // 检查 FAT32 签名
    if(bpb->boot_sig != 0x29) {
        DEBUG_LOG("[fat32] Invalid boot signature: 0x%x\n", bpb->boot_sig);
        return -1;
    }
    
    // 检查 "FAT32" 标识
    if(strncmp((char*)bpb->fs_type, "FAT32", 5) != 0) {
        DEBUG_LOG("[fat32] Not a FAT32 filesystem\n");
        return -1;
    }
    
    // 解析 BPB 参数
    fat32_info.bytes_per_sector = bpb->bytes_per_sector;
    fat32_info.sectors_per_cluster = bpb->sectors_per_cluster;
    fat32_info.bytes_per_cluster = fat32_info.bytes_per_sector * fat32_info.sectors_per_cluster;
    fat32_info.reserved_sectors = bpb->reserved_sectors;
    fat32_info.num_fats = bpb->num_fats;
    fat32_info.fat_size = bpb->fat_size_32;
    fat32_info.fat_start = fat32_info.reserved_sectors;
    fat32_info.data_start = fat32_info.reserved_sectors + fat32_info.num_fats * fat32_info.fat_size;
    fat32_info.root_cluster = bpb->root_cluster;
    
    // 计算总簇数
    uint32 total_sectors = bpb->total_sectors_32;
    uint32 data_sectors = total_sectors - fat32_info.data_start;
    fat32_info.total_clusters = data_sectors / fat32_info.sectors_per_cluster;
    
    fat32_info.valid = true;
    
        DEBUG_LOG("[fat32] Initialized: %d bytes/sector, %d sectors/cluster\n",
            fat32_info.bytes_per_sector, fat32_info.sectors_per_cluster);
        DEBUG_LOG("[fat32] FAT start: %d, data start: %d, root cluster: %d\n",
            fat32_info.fat_start, fat32_info.data_start, fat32_info.root_cluster);
    
    return 0;
}

// 打印 FAT32 信息
void fat32_print_info()
{
    if(!fat32_info.valid) {
        DEBUG_LOG("[fat32] Not initialized\n");
        return;
    }
    DEBUG_LOG("=== FAT32 Info ===\n");
    DEBUG_LOG("Bytes per sector: %d\n", fat32_info.bytes_per_sector);
    DEBUG_LOG("Sectors per cluster: %d\n", fat32_info.sectors_per_cluster);
    DEBUG_LOG("Bytes per cluster: %d\n", fat32_info.bytes_per_cluster);
    DEBUG_LOG("Reserved sectors: %d\n", fat32_info.reserved_sectors);
    DEBUG_LOG("FAT start sector: %d\n", fat32_info.fat_start);
    DEBUG_LOG("FAT size (sectors): %d\n", fat32_info.fat_size);
    DEBUG_LOG("Data start sector: %d\n", fat32_info.data_start);
    DEBUG_LOG("Root cluster: %d\n", fat32_info.root_cluster);
    DEBUG_LOG("Total clusters: %d\n", fat32_info.total_clusters);
}

// 将簇号转换为扇区号
uint32 fat32_cluster_to_sector(uint32 cluster)
{
    // 簇号从2开始，所以要减2
    return fat32_info.data_start + (cluster - 2) * fat32_info.sectors_per_cluster;
}

// 获取下一个簇号
uint32 fat32_next_cluster(uint32 cluster)
{
    if(!fat32_info.valid || cluster < 2) return 0;
    
    // 计算 FAT 表中的位置
    uint32 fat_offset = cluster * 4;  // 每个 FAT 项 4 字节
    uint32 fat_sector = fat32_info.fat_start + (fat_offset / fat32_info.bytes_per_sector);
    uint32 offset_in_sector = fat_offset % fat32_info.bytes_per_sector;
    
    uint8 sector_buf[FAT32_SECTOR_SIZE];
    if(fat32_read_sector_data(fat_sector, sector_buf) < 0) return 0;
    
    // 读取 FAT 项
    uint32 next = *(uint32*)(sector_buf + offset_in_sector);
    next &= 0x0FFFFFFF;  // 只取低 28 位
    
    // 检查是否是结束标记
    if(next >= FAT32_EOC) return 0;
    if(next == FAT32_BAD) return 0;
    
    return next;
}

// 将普通文件名转换为 8.3 格式
void fat32_name_to_83(const char* name, char* name83)
{
    memset(name83, ' ', 11);
    
    int i = 0, j = 0;
    
    // 复制文件名部分 (最多8个字符)
    while(name[i] && name[i] != '.' && j < 8) {
        char c = name[i++];
        if(c >= 'a' && c <= 'z') c -= 32;  // 转大写
        name83[j++] = c;
    }
    
    // 跳过 '.' 之前的多余字符
    while(name[i] && name[i] != '.') i++;
    
    // 复制扩展名部分 (最多3个字符)
    if(name[i] == '.') {
        i++;
        j = 8;
        while(name[i] && j < 11) {
            char c = name[i++];
            if(c >= 'a' && c <= 'z') c -= 32;
            name83[j++] = c;
        }
    }
}

// 将 8.3 格式转换为普通文件名
void fat32_83_to_name(const uint8* name83, char* name)
{
    int i = 0, j = 0;
    
    // 复制文件名部分，去除尾部空格
    for(i = 0; i < 8 && name83[i] != ' '; i++) {
        char c = name83[i];
        if(c >= 'A' && c <= 'Z') c += 32;  // 转小写
        name[j++] = c;
    }
    
    // 复制扩展名部分
    if(name83[8] != ' ') {
        name[j++] = '.';
        for(i = 8; i < 11 && name83[i] != ' '; i++) {
            char c = name83[i];
            if(c >= 'A' && c <= 'Z') c += 32;
            name[j++] = c;
        }
    }
    
    name[j] = '\0';
}

// 计算短文件名校验和
static uint8 fat32_lfn_checksum(const uint8* name83)
{
    uint8 sum = 0;
    for(int i = 0; i < 11; i++) {
        sum = ((sum & 1) ? 0x80 : 0) + (sum >> 1) + name83[i];
    }
    return sum;
}

// 从 LFN 目录项中提取一个 Unicode 字符 (简化：只支持 ASCII)
static char fat32_lfn_char(uint16 unicode)
{
    if(unicode == 0xFFFF || unicode == 0) return '\0';
    if(unicode < 0x80) return (char)unicode;
    return '_';  // 非 ASCII 字符用下划线代替
}

// 从 LFN 目录项中提取字符到缓冲区
// 每个 LFN 项包含 13 个字符
static void fat32_extract_lfn_chars(fat32_lfn_entry_t* lfn, char* buf)
{
    int idx = 0;
    // name1: 5 个字符
    for(int i = 0; i < 5; i++) buf[idx++] = fat32_lfn_char(lfn->name1[i]);
    // name2: 6 个字符
    for(int i = 0; i < 6; i++) buf[idx++] = fat32_lfn_char(lfn->name2[i]);
    // name3: 2 个字符
    for(int i = 0; i < 2; i++) buf[idx++] = fat32_lfn_char(lfn->name3[i]);
}

// 读取一个簇的数据到缓冲区
static int fat32_read_cluster(uint32 cluster, void* buf)
{
    if(!fat32_info.valid || cluster < 2) return -1;
    
    uint32 start_sector = fat32_cluster_to_sector(cluster);
    uint8* dst = (uint8*)buf;
    
    // 每个 block 有 2 个 sector (BLOCK_SIZE=1024, SECTOR_SIZE=512)
    // 按 block 读取而不是按 sector
    uint32 sectors_per_block = BLOCK_SIZE / FAT32_SECTOR_SIZE;
    uint32 total_sectors = fat32_info.sectors_per_cluster;
    
    for(uint32 i = 0; i < total_sectors; i += sectors_per_block) {
        uint32 sector = start_sector + i;
        uint32 block_num = sector / sectors_per_block;
        
        buf_t* b = buf_read(block_num);
        if(b == NULL) return -1;
        
        // 复制整个 block 的数据
        uint32 copy_sectors = sectors_per_block;
        if(i + copy_sectors > total_sectors) {
            copy_sectors = total_sectors - i;
        }
        memcpy(dst + i * FAT32_SECTOR_SIZE, b->data, copy_sectors * FAT32_SECTOR_SIZE);
        buf_release(b);
    }
    
    return 0;
}

// 读取目录项 (从指定簇开始)
int fat32_read_dir(uint32 cluster, fat32_dirent_t* entries, int max_entries)
{
    if(!fat32_info.valid) return -1;
    
    int count = 0;
    uint32 cur_cluster = cluster;
    
    // 使用静态缓冲区避免栈溢出
    static uint8 cluster_buf[4096];  // 静态分配，避免栈溢出
    
    while(cur_cluster != 0 && cur_cluster < FAT32_EOC && count < max_entries) {
        if(fat32_read_cluster(cur_cluster, cluster_buf) < 0) {
            break;
        }
        
        int entries_per_cluster = fat32_info.bytes_per_cluster / sizeof(fat32_dirent_t);
        fat32_dirent_t* dir = (fat32_dirent_t*)cluster_buf;
        
        for(int i = 0; i < entries_per_cluster && count < max_entries; i++) {
            // 检查是否是空项或已删除
            if(dir[i].name[0] == 0x00) {
                // 后面没有更多项了
                goto done;
            }
            if(dir[i].name[0] == 0xE5) {
                // 已删除项，跳过
                continue;
            }
            // 跳过长文件名项和卷标
            if((dir[i].attr & FAT32_ATTR_LONG_NAME) == FAT32_ATTR_LONG_NAME) {
                continue;
            }
            if(dir[i].attr & FAT32_ATTR_VOLUME_ID) {
                continue;
            }
            
            entries[count++] = dir[i];
        }
        
        cur_cluster = fat32_next_cluster(cur_cluster);
    }
    
done:
    return count;
}

// 读取根目录
int fat32_read_root_dir(fat32_dirent_t* entries, int max_entries)
{
    return fat32_read_dir(fat32_info.root_cluster, entries, max_entries);
}

// 不区分大小写的字符串比较
static int fat32_strcasecmp(const char* s1, const char* s2)
{
    while(*s1 && *s2) {
        char c1 = *s1, c2 = *s2;
        if(c1 >= 'A' && c1 <= 'Z') c1 += 32;
        if(c2 >= 'A' && c2 <= 'Z') c2 += 32;
        if(c1 != c2) return c1 - c2;
        s1++; s2++;
    }
    return *s1 - *s2;
}

// 在目录中查找文件 (支持长文件名)
int fat32_lookup(uint32 dir_cluster, const char* name, fat32_dirent_t* out)
{
    if(!fat32_info.valid) return -1;
    
    // 准备 8.3 格式用于匹配短文件名
    char name83[11];
    fat32_name_to_83(name, name83);
    
    uint32 cur_cluster = dir_cluster;
    static uint8 cluster_buf[4096];
    
    // 长文件名构建缓冲区
    static char lfn_buf[FAT32_LFN_MAX_LEN];
    static char lfn_parts[20][13];  // 最多 20 个 LFN 项，每项 13 字符
    int lfn_count = 0;
    uint8 lfn_checksum = 0;
    
    while(cur_cluster != 0 && cur_cluster < FAT32_EOC) {
        if(fat32_read_cluster(cur_cluster, cluster_buf) < 0) {
            break;
        }
        
        int entries_per_cluster = fat32_info.bytes_per_cluster / sizeof(fat32_dirent_t);
        fat32_dirent_t* dir = (fat32_dirent_t*)cluster_buf;
        
        for(int i = 0; i < entries_per_cluster; i++) {
            // 检查是否是空项
            if(dir[i].name[0] == 0x00) {
                return -1;  // 后面没有更多项了
            }
            // 已删除项，跳过并重置 LFN
            if(dir[i].name[0] == 0xE5) {
                lfn_count = 0;
                continue;
            }
            
            // 长文件名项
            if((dir[i].attr & FAT32_ATTR_LONG_NAME) == FAT32_ATTR_LONG_NAME) {
                fat32_lfn_entry_t* lfn = (fat32_lfn_entry_t*)&dir[i];
                int order = lfn->order & 0x1F;  // 去掉 0x40 标志
                
                if(lfn->order & FAT32_LFN_LAST_MASK) {
                    // 这是 LFN 序列的最后一项（实际是第一个出现的）
                    lfn_count = order;
                    lfn_checksum = lfn->checksum;
                    memset(lfn_parts, 0, sizeof(lfn_parts));
                }
                
                if(order >= 1 && order <= 20 && lfn->checksum == lfn_checksum) {
                    fat32_extract_lfn_chars(lfn, lfn_parts[order - 1]);
                }
                continue;
            }
            
            // 跳过卷标
            if(dir[i].attr & FAT32_ATTR_VOLUME_ID) {
                lfn_count = 0;
                continue;
            }
            
            // 这是一个短文件名项，检查是否匹配
            bool matched = false;
            
            // 首先尝试长文件名匹配
            if(lfn_count > 0) {
                // 验证校验和
                if(lfn_checksum == fat32_lfn_checksum(dir[i].name)) {
                    // 组装完整的长文件名
                    int pos = 0;
                    for(int j = 0; j < lfn_count; j++) {
                        for(int k = 0; k < 13 && lfn_parts[j][k] != '\0'; k++) {
                            if(pos < FAT32_LFN_MAX_LEN - 1) {
                                lfn_buf[pos++] = lfn_parts[j][k];
                            }
                        }
                    }
                    lfn_buf[pos] = '\0';
                    
                    // 不区分大小写比较
                    if(fat32_strcasecmp(lfn_buf, name) == 0) {
                        matched = true;
                    }
                }
            }
            
            // 如果长文件名未匹配，尝试短文件名匹配
            if(!matched && memcmp(dir[i].name, name83, 11) == 0) {
                matched = true;
            }
            
            if(matched) {
                if(out) *out = dir[i];
                return 0;
            }
            
            // 重置 LFN 状态
            lfn_count = 0;
        }
        
        cur_cluster = fat32_next_cluster(cur_cluster);
    }
    
    return -1;  // 未找到
}

// 根据路径查找文件
int fat32_lookup_path(const char* path, fat32_dirent_t* out)
{
    if(!fat32_info.valid) return -1;
    if(path == NULL || path[0] == '\0') return -1;
    
    // 跳过开头的 '/' 或 './'
    const char* p = path;
    while(*p == '/' || (*p == '.' && *(p+1) == '/')) {
        if(*p == '.') p++;  // 跳过 '.'
        while(*p == '/') p++;  // 跳过 '/'
    }
    
    if(*p == '\0') {
        // 根目录
        if(out) {
            memset(out, 0, sizeof(fat32_dirent_t));
            out->attr = FAT32_ATTR_DIRECTORY;
            out->cluster_high = (fat32_info.root_cluster >> 16) & 0xFFFF;
            out->cluster_low = fat32_info.root_cluster & 0xFFFF;
        }
        return 0;
    }
    
    uint32 cur_cluster = fat32_info.root_cluster;
    fat32_dirent_t entry;
    
    while(*p) {
        // 提取路径组件
        char component[64];
        int i = 0;
        while(*p && *p != '/' && i < 63) {
            component[i++] = *p++;
        }
        component[i] = '\0';
        
        // 跳过 '/'
        while(*p == '/') p++;
        
        // 在当前目录中查找
        if(fat32_lookup(cur_cluster, component, &entry) < 0) {
            return -1;  // 未找到
        }
        
        // 如果还有更多路径组件，必须是目录
        if(*p && !(entry.attr & FAT32_ATTR_DIRECTORY)) {
            return -1;  // 不是目录
        }
        
        // 获取下一个目录的簇号
        cur_cluster = ((uint32)entry.cluster_high << 16) | entry.cluster_low;
    }
    
    if(out) *out = entry;
    return 0;
}

// 打开文件
int fat32_open(const char* path, fat32_file_t* file)
{
    if(!fat32_info.valid || file == NULL) return -1;
    
    fat32_dirent_t entry;
    if(fat32_lookup_path(path, &entry) < 0) {
        return -1;
    }
    
    file->cluster = ((uint32)entry.cluster_high << 16) | entry.cluster_low;
    file->size = entry.file_size;
    file->pos = 0;
    file->attr = entry.attr;
    file->is_dir = (entry.attr & FAT32_ATTR_DIRECTORY) != 0;
    
    return 0;
}

// 读取文件
int fat32_read(fat32_file_t* file, void* buf, uint32 size)
{
    if(!fat32_info.valid || file == NULL || buf == NULL) return -1;
    
    // 不允许读取超过文件大小（目录除外）
    if(!file->is_dir && file->pos >= file->size) return 0;
    if(!file->is_dir && file->pos + size > file->size) {
        size = file->size - file->pos;
    }
    
    uint8* dst = (uint8*)buf;
    uint32 total_read = 0;
    uint32 cluster = file->cluster;
    uint32 pos = file->pos;
    
    // 跳到当前位置所在的簇
    uint32 cluster_offset = pos / fat32_info.bytes_per_cluster;
    for(uint32 i = 0; i < cluster_offset && cluster != 0; i++) {
        cluster = fat32_next_cluster(cluster);
    }
    
    if(cluster == 0 || cluster >= FAT32_EOC) return 0;
    
    // 簇内偏移
    uint32 offset_in_cluster = pos % fat32_info.bytes_per_cluster;
    
    // 使用静态缓冲区避免栈溢出
    static uint8 cluster_buf[4096];
    
    while(size > 0 && cluster != 0 && cluster < FAT32_EOC) {
        if(fat32_read_cluster(cluster, cluster_buf) < 0) break;
        
        uint32 can_read = fat32_info.bytes_per_cluster - offset_in_cluster;
        if(can_read > size) can_read = size;
        
        memcpy(dst, cluster_buf + offset_in_cluster, can_read);
        
        dst += can_read;
        total_read += can_read;
        size -= can_read;
        file->pos += can_read;
        
        offset_in_cluster = 0;  // 后续簇从头开始
        cluster = fat32_next_cluster(cluster);
    }
    
    return total_read;
}

// 关闭文件
int fat32_close(fat32_file_t* file)
{
    if(file == NULL) return -1;
    memset(file, 0, sizeof(fat32_file_t));
    return 0;
}

// 从指定簇和偏移量读取数据（供 file_read 使用）
// 支持读取到内核空间或用户空间
int fat32_read_at(uint32 start_cluster, uint32 file_size, uint32 offset, 
                  void* dst, uint32 size, bool to_user, pgtbl_t pgtbl)
{
    if(!fat32_info.valid || start_cluster < 2) return -1;
    
    // 检查边界
    if(offset >= file_size) return 0;
    if(offset + size > file_size) {
        size = file_size - offset;
    }
    
    uint32 cluster = start_cluster;
    
    // 跳到当前位置所在的簇
    uint32 cluster_offset = offset / fat32_info.bytes_per_cluster;
    for(uint32 i = 0; i < cluster_offset && cluster != 0; i++) {
        cluster = fat32_next_cluster(cluster);
    }
    
    if(cluster == 0 || cluster >= FAT32_EOC) return 0;
    
    // 簇内偏移
    uint32 offset_in_cluster = offset % fat32_info.bytes_per_cluster;
    
    // 使用静态缓冲区
    static uint8 cluster_buf[4096];
    
    uint8* kern_dst = (uint8*)dst;
    uint64 user_dst = (uint64)dst;
    uint32 total_read = 0;
    
    while(size > 0 && cluster != 0 && cluster < FAT32_EOC) {
        if(fat32_read_cluster(cluster, cluster_buf) < 0) break;
        
        uint32 can_read = fat32_info.bytes_per_cluster - offset_in_cluster;
        if(can_read > size) can_read = size;
        
        if(to_user) {
            // 复制到用户空间
            uvm_copyout(pgtbl, user_dst, (uint64)(cluster_buf + offset_in_cluster), can_read);
            user_dst += can_read;
        } else {
            // 复制到内核空间
            memcpy(kern_dst, cluster_buf + offset_in_cluster, can_read);
            kern_dst += can_read;
        }
        
        total_read += can_read;
        size -= can_read;
        
        offset_in_cluster = 0;  // 后续簇从头开始
        cluster = fat32_next_cluster(cluster);
    }
    
    return total_read;
}

// 列出根目录 (调试用)
void fat32_list_root()
{
    if(!fat32_info.valid) {
        DEBUG_LOG("[fat32] Not initialized\n");
        return;
    }
    
    static fat32_dirent_t entries[64];  // 静态分配避免栈溢出
    int count = fat32_read_root_dir(entries, 64);
    
    DEBUG_LOG("=== FAT32 Root Directory (%d entries) ===\n", count);
    for(int i = 0; i < count; i++) {
        char name[13];
        fat32_83_to_name(entries[i].name, name);
        
        char type = (entries[i].attr & FAT32_ATTR_DIRECTORY) ? 'd' : '-';
        uint32 size = entries[i].file_size;
        
        DEBUG_LOG("%c %d %s\n", type, size, name);
    }
}

// 测试读取文件内容
void fat32_test_read_file(const char* path)
{
    DEBUG_LOG("\n[fat32] Testing read file: %s\n", path);
    
    fat32_file_t file;
    if(fat32_open(path, &file) < 0) {
        DEBUG_LOG("[fat32] Failed to open %s\n", path);
        return;
    }
    
    DEBUG_LOG("[fat32] File opened: size=%d, cluster=%d\n", file.size, file.cluster);
    
    // 读取前 256 字节或整个文件
    static uint8 buf[256];
    uint32 to_read = file.size < 256 ? file.size : 256;
    
    int n = fat32_read(&file, buf, to_read);
    if(n > 0) {
        DEBUG_LOG("[fat32] Read %d bytes:\n", n);
        // 打印为文本或十六进制
        bool is_text = true;
        for(int i = 0; i < n && i < 64; i++) {
            if(buf[i] != 0 && (buf[i] < 0x20 || buf[i] > 0x7e) && buf[i] != '\n' && buf[i] != '\r' && buf[i] != '\t') {
                is_text = false;
                break;
            }
        }
        
        if(is_text) {
            // 打印文本
            for(int i = 0; i < n; i++) {
                if(buf[i] == 0) break;
                DEBUG_LOG("%c", buf[i]);
            }
            DEBUG_LOG("\n");
        } else {
            // 打印十六进制 (ELF头等)
            DEBUG_LOG("[fat32] Hex dump (first 32 bytes):\n");
            for(int i = 0; i < 32 && i < n; i++) {
                DEBUG_LOG("%x ", buf[i]);
                if((i + 1) % 16 == 0) DEBUG_LOG("\n");
            }
            DEBUG_LOG("\n");
        }
    } else {
        DEBUG_LOG("[fat32] Read failed or empty file\n");
    }
    
    fat32_close(&file);
}

// 获取根目录簇号
uint32 fat32_get_root_cluster()
{
    if(!fat32_info.valid) return 0;
    return fat32_info.root_cluster;
}

// 目录遍历函数 (带长文件名支持)
// dir_cluster: 目录起始簇号
// offset: 当前偏移 (用于记录遍历位置)
// name_out: 输出文件名 (需要至少 256 字节)
// size_out: 输出文件大小
// type_out: 输出类型 (DT_REG=8, DT_DIR=4)
// next_offset: 输出下一个项的偏移
// 返回: 0 成功, -1 结束, -2 错误
int fat32_readdir(uint32 dir_cluster, uint32 offset, char* name_out, 
                  uint32* size_out, uint8* type_out, uint32* next_offset)
{
    if(!fat32_info.valid || dir_cluster < 2) return -2;
    
    static uint8 cluster_buf[4096];
    static char lfn_parts[20][13];
    static char lfn_buf[FAT32_LFN_MAX_LEN];
    
    uint32 cur_cluster = dir_cluster;
    uint32 cur_offset = 0;
    int lfn_count = 0;
    uint8 lfn_checksum = 0;
    
    // 跳过之前的簇
    uint32 entries_per_cluster = fat32_info.bytes_per_cluster / sizeof(fat32_dirent_t);
    uint32 skip_clusters = offset / entries_per_cluster;
    uint32 skip_entries = offset % entries_per_cluster;
    
    for(uint32 i = 0; i < skip_clusters && cur_cluster != 0 && cur_cluster < FAT32_EOC; i++) {
        cur_cluster = fat32_next_cluster(cur_cluster);
    }
    
    if(cur_cluster == 0 || cur_cluster >= FAT32_EOC) return -1;
    
    cur_offset = skip_clusters * entries_per_cluster;
    
    while(cur_cluster != 0 && cur_cluster < FAT32_EOC) {
        if(fat32_read_cluster(cur_cluster, cluster_buf) < 0) {
            return -2;
        }
        
        fat32_dirent_t* dir = (fat32_dirent_t*)cluster_buf;
        uint32 start_i = (cur_offset == skip_clusters * entries_per_cluster) ? skip_entries : 0;
        
        for(uint32 i = start_i; i < entries_per_cluster; i++) {
            uint32 entry_offset = cur_offset + i;
            
            // 检查空项
            if(dir[i].name[0] == 0x00) {
                return -1;  // 目录结束
            }
            // 已删除项
            if(dir[i].name[0] == 0xE5) {
                lfn_count = 0;
                continue;
            }
            
            // 长文件名项
            if((dir[i].attr & FAT32_ATTR_LONG_NAME) == FAT32_ATTR_LONG_NAME) {
                fat32_lfn_entry_t* lfn = (fat32_lfn_entry_t*)&dir[i];
                int order = lfn->order & 0x1F;
                
                if(lfn->order & FAT32_LFN_LAST_MASK) {
                    lfn_count = order;
                    lfn_checksum = lfn->checksum;
                    memset(lfn_parts, 0, sizeof(lfn_parts));
                }
                
                if(order >= 1 && order <= 20 && lfn->checksum == lfn_checksum) {
                    // 提取字符
                    int idx = 0;
                    for(int j = 0; j < 5; j++) {
                        uint16 c = lfn->name1[j];
                        lfn_parts[order-1][idx++] = (c == 0xFFFF || c == 0) ? '\0' : (c < 0x80 ? (char)c : '_');
                    }
                    for(int j = 0; j < 6; j++) {
                        uint16 c = lfn->name2[j];
                        lfn_parts[order-1][idx++] = (c == 0xFFFF || c == 0) ? '\0' : (c < 0x80 ? (char)c : '_');
                    }
                    for(int j = 0; j < 2; j++) {
                        uint16 c = lfn->name3[j];
                        lfn_parts[order-1][idx++] = (c == 0xFFFF || c == 0) ? '\0' : (c < 0x80 ? (char)c : '_');
                    }
                }
                continue;
            }
            
            // 跳过卷标
            if(dir[i].attr & FAT32_ATTR_VOLUME_ID) {
                lfn_count = 0;
                continue;
            }
            
            // 这是一个有效的短文件名项
            // 检查是否有对应的长文件名
            if(lfn_count > 0) {
                // 验证校验和
                uint8 sum = 0;
                for(int j = 0; j < 11; j++) {
                    sum = ((sum & 1) ? 0x80 : 0) + (sum >> 1) + dir[i].name[j];
                }
                if(sum == lfn_checksum) {
                    // 组装长文件名
                    int pos = 0;
                    for(int j = 0; j < lfn_count; j++) {
                        for(int k = 0; k < 13 && lfn_parts[j][k] != '\0'; k++) {
                            if(pos < FAT32_LFN_MAX_LEN - 1) {
                                lfn_buf[pos++] = lfn_parts[j][k];
                            }
                        }
                    }
                    lfn_buf[pos] = '\0';
                    strncpy(name_out, lfn_buf, FAT32_LFN_MAX_LEN);
                } else {
                    // 校验和不匹配，使用短文件名
                    fat32_83_to_name(dir[i].name, name_out);
                }
            } else {
                // 没有长文件名，使用短文件名
                fat32_83_to_name(dir[i].name, name_out);
            }
            
            // 跳过 "." 和 ".."
            if(strncmp(name_out, ".", 2) == 0 || strncmp(name_out, "..", 3) == 0) {
                lfn_count = 0;
                continue;
            }
            
            // 填充输出
            if(size_out) *size_out = dir[i].file_size;
            if(type_out) *type_out = (dir[i].attr & FAT32_ATTR_DIRECTORY) ? 4 : 8;  // DT_DIR=4, DT_REG=8
            if(next_offset) *next_offset = entry_offset + 1;
            
            lfn_count = 0;
            return 0;  // 成功找到一项
        }
        
        cur_offset += entries_per_cluster;
        cur_cluster = fat32_next_cluster(cur_cluster);
    }
    
    return -1;  // 目录结束
}
