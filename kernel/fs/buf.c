#include "fs/buf.h"
#include "dev/vio.h"
#include "lib/lock.h"
#include "lib/print.h"
#include "lib/string.h"

#define N_BLOCK_BUF 64
#define BLOCK_NUM_UNUSED 0xFFFFFFFF
#define container_of(ptr, type, member) ((type *)((char *)(ptr) - (uint64)&(((type *)0)->member)))

// 将buf包装成双向循环链表的node
typedef struct buf_node {
    buf_t buf;
    struct buf_node* next;
    struct buf_node* prev;
} buf_node_t;

// buf cache
static buf_node_t buf_cache[N_BLOCK_BUF];
static buf_node_t head_buf; // ->next 已分配 ->prev 可分配
static spinlock_t lk_buf_cache; // 这个锁负责保护 链式结构 + buf_ref + block_num

// 链表操作
static void insert_head(buf_node_t* buf_node, bool head_next)
{
    // 离开
    if(buf_node->next && buf_node->prev) {
        buf_node->next->prev = buf_node->prev;
        buf_node->prev->next = buf_node->next;
    }

    // 插入
    if(head_next) { // 插入 head->next
        buf_node->prev = &head_buf;
        buf_node->next = head_buf.next;
        head_buf.next->prev = buf_node;
        head_buf.next = buf_node;        
    } else { // 插入 head->prev
        buf_node->next = &head_buf;
        buf_node->prev = head_buf.prev;
        head_buf.prev->next = buf_node;
        head_buf.prev = buf_node;
    }
}

// 初始化
void buf_init()
{
    spinlock_init(&lk_buf_cache, "buf_cache");
    head_buf.next = head_buf.prev = &head_buf;

    for(int i = 0; i < N_BLOCK_BUF; i++) {
        buf_node_t* node = &buf_cache[i];
        memset(&node->buf, 0, sizeof(buf_t));
        node->buf.block_num = BLOCK_NUM_UNUSED;
        node->buf.buf_ref = 0;
        node->buf.disk = false;
        node->buf.valid = false;
        node->buf.dirty = false;
        sleeplock_init(&node->buf.slk, "buffer");
        insert_head(node, true);
    }
}

/*
    首先假设这个block_num对应的block在内存中有备份, 找到它并上锁返回
    如果找不到, 尝试申请一个无人使用的buf, 去磁盘读取对应block并上锁返回
    如果没有空闲buf, panic报错
    (建议合并xv6的bget())
*/
buf_t* buf_read(uint32 block_num)
{
    buf_node_t* node;

    spinlock_acquire(&lk_buf_cache);

    // 缓存命中
    for(node = head_buf.next; node != &head_buf; node = node->next) {
        if(node->buf.block_num == block_num) {
            node->buf.buf_ref++;
            insert_head(node, true);
            spinlock_release(&lk_buf_cache);
            sleeplock_acquire(&node->buf.slk);
            if(node->buf.valid == false) {
                virtio_disk_rw(&node->buf, false);
                node->buf.valid = true;
            }
            return &node->buf;
        }
    }

    // 选择一个未被使用的buf(从尾部开始, 实现LRU)
    for(node = head_buf.prev; node != &head_buf; node = node->prev) {
        if(node->buf.buf_ref == 0) {
            uint32 old_block = node->buf.block_num;
            bool need_flush = node->buf.dirty && node->buf.valid && old_block != BLOCK_NUM_UNUSED;

            node->buf.buf_ref = 1;
            insert_head(node, true);
            spinlock_release(&lk_buf_cache);

            sleeplock_acquire(&node->buf.slk);
            if(need_flush) {
                virtio_disk_rw(&node->buf, true);
                node->buf.dirty = false;
            }

            node->buf.block_num = block_num;
            node->buf.valid = false;
            node->buf.dirty = false;
            node->buf.disk = false;

            virtio_disk_rw(&node->buf, false);
            node->buf.valid = true;
            return &node->buf;
        }
    }

    spinlock_release(&lk_buf_cache);
    panic("buf_read: no free buffer");
    return NULL;
}

// 写函数 (强制磁盘和内存保持一致)
void buf_write(buf_t* buf)
{
    assert(sleeplock_holding(&buf->slk), "buf_write: lock");
    virtio_disk_rw(buf, true);
    buf->dirty = false;
    buf->valid = true;
}

// buf 释放
void buf_release(buf_t* buf)
{
    assert(sleeplock_holding(&buf->slk), "buf_release: lock");

    if(buf->dirty) {
        buf_write(buf);
    }

    sleeplock_release(&buf->slk);

    spinlock_acquire(&lk_buf_cache);
    buf_node_t* node = container_of(buf, buf_node_t, buf);
    if(buf->buf_ref == 0)
        panic("buf_release: ref");
    buf->buf_ref--;
    if(buf->buf_ref == 0)
        insert_head(node, true);
    spinlock_release(&lk_buf_cache);
}

// 输出buf_cache的情况
void buf_print()
{
    DEBUG_LOG("\nbuf_cache (active entries):\n");
    spinlock_acquire(&lk_buf_cache);
    buf_node_t* buf = head_buf.next;
    int total = 0;
    while(buf != &head_buf)
    {
        buf_t* b = &buf->buf;
        if(b->block_num != BLOCK_NUM_UNUSED) {
            DEBUG_LOG("buf %d: ref=%d block=%d data[0..3]=%d %d %d %d\n",
                      (int)(buf - buf_cache), b->buf_ref, b->block_num,
                      b->data[0], b->data[1], b->data[2], b->data[3]);
            total++;
        }
        buf = buf->next;
    }
    DEBUG_LOG("active buf count = %d\n", total);
    spinlock_release(&lk_buf_cache);
}
