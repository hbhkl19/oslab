#include "fs/buf.h"
#include "fs/fs.h"
#include "fs/bitmap.h"
#include "lib/print.h"

extern super_block_t sb;

// search and set bit
static uint32 bitmap_search_and_set(uint32 bitmap_block)
{
    buf_t* buf = buf_read(bitmap_block);
    uint32 byte, shift;
    uint8 bit_cmp;

    for(byte = 0; byte < BLOCK_SIZE; byte++) {
        bit_cmp = 1;
        for(shift = 0; shift < 8; shift++) {
            if((buf->data[byte] & bit_cmp) == 0) {
                buf->data[byte] |= bit_cmp;
                buf->dirty = true;
                buf_write(buf);
                buf_release(buf);
                return byte * 8 + shift;
            }
            bit_cmp <<= 1;
        }
    }
    buf_release(buf);
    panic("bitmap_search_and_set: no free bit");
    return 0;
}

// unset bit
static void bitmap_unset(uint32 bitmap_block, uint32 num)
{
    buf_t* buf = buf_read(bitmap_block);
    uint32 byte = num / 8;
    uint32 shift = num % 8;
    buf->data[byte] &= ~(1 << shift);
    buf->dirty = true;
    buf_write(buf);
    buf_release(buf);
}

uint32 bitmap_alloc_block()
{
    uint32 idx = bitmap_search_and_set(sb.data_bitmap_start);
    uint32 bno = idx + sb.data_start;
    DEBUG_LOG("[bitmap] alloc data block %u\n", bno);
    return bno;
}

void bitmap_free_block(uint32 block_num)
{
    assert(block_num >= sb.data_start, "bitmap_free_block: invalid");
    bitmap_unset(sb.data_bitmap_start, block_num - sb.data_start);
    DEBUG_LOG("[bitmap] free data block %u\n", block_num);
}

uint16 bitmap_alloc_inode()
{
    uint16 inum = (uint16)bitmap_search_and_set(sb.inode_bitmap_start);
    DEBUG_LOG("[bitmap] alloc inode %u\n", inum);
    return inum;
}

void bitmap_free_inode(uint16 inode_num)
{
    bitmap_unset(sb.inode_bitmap_start, inode_num);
    DEBUG_LOG("[bitmap] free inode %u\n", inode_num);
}

// 打印所有已经分配出去的bit序号(序号从0开始)
// for debug
void bitmap_print(uint32 bitmap_block_num)
{
    uint8 bit_cmp;
    uint32 byte, shift;

    DEBUG_LOG("\nbitmap:\n");

    buf_t* buf = buf_read(bitmap_block_num);
    for(byte = 0; byte < BLOCK_SIZE; byte++) {
        bit_cmp = 1;
        for(shift = 0; shift <= 7; shift++) {
            if(bit_cmp & buf->data[byte])
               DEBUG_LOG("bit %d is alloced\n", byte * 8 + shift);
            bit_cmp = bit_cmp << 1;
        }
    }
    DEBUG_LOG("over\n");
    buf_release(buf);
}
