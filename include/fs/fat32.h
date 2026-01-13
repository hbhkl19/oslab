#ifndef __FAT32_H__
#define __FAT32_H__

#include "common.h"
#include "fs/buf.h"
#include "mem/vmem.h"  // for pagetable_t

// FAT32 常量
#define FAT32_SECTOR_SIZE   512
#define FAT32_EOC           0x0FFFFFF8  // End of cluster chain
#define FAT32_FREE          0x00000000  // Free cluster
#define FAT32_BAD           0x0FFFFFF7  // Bad cluster

// FAT32 目录项属性
#define FAT32_ATTR_READ_ONLY  0x01
#define FAT32_ATTR_HIDDEN     0x02
#define FAT32_ATTR_SYSTEM     0x04
#define FAT32_ATTR_VOLUME_ID  0x08
#define FAT32_ATTR_DIRECTORY  0x10
#define FAT32_ATTR_ARCHIVE    0x20
#define FAT32_ATTR_LONG_NAME  0x0F

// FAT32 BPB (BIOS Parameter Block)
typedef struct __attribute__((packed)) {
    uint8  jmp_boot[3];        // 跳转指令
    uint8  oem_name[8];        // OEM 名称
    uint16 bytes_per_sector;   // 每扇区字节数 (通常512)
    uint8  sectors_per_cluster;// 每簇扇区数
    uint16 reserved_sectors;   // 保留扇区数
    uint8  num_fats;           // FAT 表数量 (通常2)
    uint16 root_entry_count;   // FAT12/16 根目录项数 (FAT32为0)
    uint16 total_sectors_16;   // 总扇区数 (小于64K)
    uint8  media_type;         // 媒体类型
    uint16 fat_size_16;        // FAT12/16 每FAT扇区数 (FAT32为0)
    uint16 sectors_per_track;  // 每磁道扇区数
    uint16 num_heads;          // 磁头数
    uint32 hidden_sectors;     // 隐藏扇区数
    uint32 total_sectors_32;   // 总扇区数 (大于64K)
    
    // FAT32 扩展字段
    uint32 fat_size_32;        // 每个FAT的扇区数
    uint16 ext_flags;          // 扩展标志
    uint16 fs_version;         // 文件系统版本
    uint32 root_cluster;       // 根目录起始簇号
    uint16 fs_info;            // FSInfo 扇区号
    uint16 backup_boot;        // 备份引导扇区号
    uint8  reserved[12];       // 保留
    uint8  drive_number;       // 驱动器号
    uint8  reserved1;          // 保留
    uint8  boot_sig;           // 扩展引导标志
    uint32 volume_id;          // 卷序列号
    uint8  volume_label[11];   // 卷标
    uint8  fs_type[8];         // 文件系统类型 "FAT32   "
} fat32_bpb_t;

// FAT32 短目录项 (32字节)
typedef struct __attribute__((packed)) {
    uint8  name[11];           // 8.3 文件名
    uint8  attr;               // 属性
    uint8  nt_reserved;        // NT 保留
    uint8  create_time_tenth;  // 创建时间的10ms单位
    uint16 create_time;        // 创建时间
    uint16 create_date;        // 创建日期
    uint16 access_date;        // 最后访问日期
    uint16 cluster_high;       // 起始簇号高16位
    uint16 modify_time;        // 修改时间
    uint16 modify_date;        // 修改日期
    uint16 cluster_low;        // 起始簇号低16位
    uint32 file_size;          // 文件大小
} fat32_dirent_t;

// FAT32 长文件名目录项 (32字节)
typedef struct __attribute__((packed)) {
    uint8  order;              // 顺序号 (0x01-0x14, 最后一个带 0x40 标志)
    uint16 name1[5];           // 字符 1-5 (Unicode)
    uint8  attr;               // 属性 (固定为 0x0F)
    uint8  type;               // 类型 (固定为 0)
    uint8  checksum;           // 短文件名校验和
    uint16 name2[6];           // 字符 6-11 (Unicode)
    uint16 cluster_low;        // 固定为 0
    uint16 name3[2];           // 字符 12-13 (Unicode)
} fat32_lfn_entry_t;

// 长文件名最大长度 (13字符/项 * 20项)
#define FAT32_LFN_MAX_LEN 260
#define FAT32_LFN_LAST_MASK 0x40

// FAT32 文件系统信息 (内存中)
typedef struct {
    uint32 bytes_per_sector;   // 每扇区字节数
    uint32 sectors_per_cluster;// 每簇扇区数
    uint32 bytes_per_cluster;  // 每簇字节数
    uint32 reserved_sectors;   // 保留扇区数
    uint32 fat_start;          // FAT 起始扇区
    uint32 fat_size;           // FAT 大小 (扇区数)
    uint32 num_fats;           // FAT 数量
    uint32 data_start;         // 数据区起始扇区
    uint32 root_cluster;       // 根目录起始簇号
    uint32 total_clusters;     // 总簇数
    bool   valid;              // 是否有效
} fat32_info_t;

// FAT32 打开的文件 (用于读取)
typedef struct {
    uint32 cluster;            // 当前簇号
    uint32 size;               // 文件大小
    uint32 pos;                // 当前位置
    uint8  attr;               // 属性
    bool   is_dir;             // 是否是目录
} fat32_file_t;

// 初始化
int fat32_init();

// 簇操作
uint32 fat32_cluster_to_sector(uint32 cluster);
uint32 fat32_next_cluster(uint32 cluster);

// 目录操作
int fat32_read_root_dir(fat32_dirent_t* entries, int max_entries);
int fat32_read_dir(uint32 cluster, fat32_dirent_t* entries, int max_entries);
int fat32_lookup(uint32 dir_cluster, const char* name, fat32_dirent_t* out);
int fat32_lookup_path(const char* path, fat32_dirent_t* out);

// 文件操作
int fat32_open(const char* path, fat32_file_t* file);
int fat32_read(fat32_file_t* file, void* buf, uint32 size);
int fat32_close(fat32_file_t* file);
int fat32_read_at(uint32 start_cluster, uint32 file_size, uint32 offset, 
                  void* dst, uint32 size, bool to_user, pgtbl_t pgtbl);

// 目录遍历 (带长文件名)
uint32 fat32_get_root_cluster();
int fat32_readdir(uint32 dir_cluster, uint32 offset, char* name_out, 
                  uint32* size_out, uint8* type_out, uint32* next_offset);

// 工具函数
void fat32_name_to_83(const char* name, char* name83);
void fat32_83_to_name(const uint8* name83, char* name);

// 调试
void fat32_print_info();
void fat32_list_root();
void fat32_test_read_file(const char* path);

#endif
