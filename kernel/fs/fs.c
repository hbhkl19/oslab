#include "fs/fs.h"
#include "fs/buf.h"
#include "fs/bitmap.h"
#include "fs/inode.h"
#include "fs/dir.h"
#include "lib/string.h"
#include "lib/print.h"

// 超级块在内存的副本
super_block_t sb;

#define FS_MAGIC 0x12345678
#define SB_BLOCK_NUM 0
#ifndef FS_TEST
#define FS_TEST 0   // 0:正常启动, 1:路径测试, 2:目录测试, 3:inode读写测试
#endif

// test4 用到的辅助
static uint8 t_str[BLOCK_SIZE * 2] __attribute__((unused));
static uint8 t_tmp[BLOCK_SIZE * 2] __attribute__((unused));
static bool __attribute__((unused)) blockcmp(uint8* a, uint8* b)
{
    for(int i = 0; i < BLOCK_SIZE * 2; i++) {
        if(a[i] != b[i]) return false;
    }
    return true;
}

// 输出super_block的信息
static void sb_print()
{
    DEBUG_LOG("\nsuper block information:\n");
    DEBUG_LOG("magic = %x\n", sb.magic);
    DEBUG_LOG("block size = %d\n", sb.block_size);
    DEBUG_LOG("inode blocks = %d\n", sb.inode_blocks);
    DEBUG_LOG("data blocks = %d\n", sb.data_blocks);
    DEBUG_LOG("total blocks = %d\n", sb.total_blocks);
    DEBUG_LOG("inode bitmap start = %d\n", sb.inode_bitmap_start);
    DEBUG_LOG("inode start = %d\n", sb.inode_start);
    DEBUG_LOG("data bitmap start = %d\n", sb.data_bitmap_start);
    DEBUG_LOG("data start = %d\n", sb.data_start);
}

// 文件系统初始化
void fs_init()
{
    DEBUG_LOG("[fs] entering fs_init\n");
    buf_init();
    DEBUG_LOG("[fs] buf_init done\n");

    buf_t* buf; 
    buf = buf_read(SB_BLOCK_NUM);
    DEBUG_LOG("[fs] super block read start\n");
    memmove(&sb, buf->data, sizeof(sb));
    assert(sb.magic == FS_MAGIC, "fs_init: magic");
    assert(sb.block_size == BLOCK_SIZE, "fs_init: block size");
    buf_release(buf);
    DEBUG_LOG("[fs] super block loaded\n");
    sb_print();

    inode_init();
    DEBUG_LOG("[fs] inode_init done\n");

#if FS_TEST == 1
    // 路径测试
    inode_t* ip = inode_alloc(INODE_ROOT);
    inode_t* ip_1 = inode_create(FT_DIR, 0, 0);
    inode_t* ip_2 = inode_create(FT_DIR, 0, 0);
    inode_t* ip_3 = inode_create(FT_FILE, 0, 0);

    inode_lock(ip);
    inode_lock(ip_1);
    inode_lock(ip_2);
    inode_lock(ip_3);

    dir_add_entry(ip, ip_1->inode_num, "user");
    dir_add_entry(ip_1, ip_2->inode_num, "work");
    dir_add_entry(ip_2, ip_3->inode_num, "hello.txt");
    
    inode_write_data(ip_3, 0, 11, "hello world", false);

    inode_unlock(ip_3);
    inode_unlock(ip_2);
    inode_unlock(ip_1);
    inode_unlock(ip);

    char* path = "/user/work/hello.txt";
    char name[DIR_NAME_LEN];
    inode_t* tmp_1 = path_to_pinode(path, name);
    inode_t* tmp_2 = path_to_inode(path);

    assert(tmp_1 != NULL, "tmp1 = NULL");
    assert(tmp_2 != NULL, "tmp2 = NULL");
    DEBUG_LOG("[fs_test1] name = %s\n", name);

    inode_lock(tmp_1);
    inode_print(tmp_1);
    inode_unlock_free(tmp_1);

    inode_lock(tmp_2);
    inode_print(tmp_2);
    char strbuf[12];
    strbuf[11] = 0;
    inode_read_data(tmp_2, 0, tmp_2->size, strbuf, false);
    DEBUG_LOG("[fs_test1] read: %s\n", strbuf);
    inode_unlock_free(tmp_2);

    DEBUG_LOG("[fs_test1] over\n");
    while (1); 
#elif FS_TEST == 2
    // 目录测试
    inode_t* ip = inode_alloc(INODE_ROOT);    
    inode_lock(ip);

    dir_print(ip);
    
    dir_add_entry(ip, 1, "a.txt");
    dir_add_entry(ip, 2, "b.txt");
    dir_add_entry(ip, 3, "c.txt");
    
    dir_print(ip);

    assert(dir_search_entry(ip, "b.txt") == 2, "error-1");

    dir_delete_entry(ip, "a.txt");
   
    dir_print(ip);
    
    dir_add_entry(ip, 1, "d.txt");    
    
    dir_print(ip);
    
    assert(dir_add_entry(ip, 4, "d.txt") == BLOCK_SIZE, "error-2");
    
    inode_unlock(ip);

    DEBUG_LOG("[fs_test2] over\n");

    while (1); 
#elif FS_TEST == 3
    // inode读写测试
    uint32 ret = 0;

    for(int i = 0; i < BLOCK_SIZE * 2; i++)
        t_str[i] = i;

    inode_t* nip = inode_create(FT_FILE, 0, 0);
    inode_lock(nip);
    
    inode_print(nip);

    ret = inode_write_data(nip, 0, BLOCK_SIZE / 2, t_str, false);
    assert(ret == BLOCK_SIZE / 2, "inode_write_data: fail");

    ret = inode_write_data(nip, BLOCK_SIZE / 2, BLOCK_SIZE + BLOCK_SIZE / 2, t_str + BLOCK_SIZE / 2, false);
    assert(ret == BLOCK_SIZE +  BLOCK_SIZE / 2, "inode_write_data: fail");

    ret = inode_read_data(nip, 0, BLOCK_SIZE * 2, t_tmp, false);
    assert(ret == BLOCK_SIZE * 2, "inode_read_data: fail");

    inode_print(nip);
    
    inode_unlock_free(nip);

    if(blockcmp(t_tmp, t_str) == true)
        DEBUG_LOG("[fs_test3] success\n");
    else
        DEBUG_LOG("[fs_test3] fail\n");

    while (1); 
#endif
}
