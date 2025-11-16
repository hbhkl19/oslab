#include "proc/cpu.h"
#include "mem/vmem.h"
#include "mem/pmem.h"
#include "mem/mmap.h"
#include "lib/string.h"
#include "lib/print.h"
#include "syscall/sysfunc.h"
#include "riscv.h"
#include "syscall/syscall.h"
#include "memlayout.h"

// 堆伸缩
// uint64 new_heap_top 新的堆顶 (如果是0代表查询, 返回旧的堆顶)
// 成功返回新的堆顶 失败返回-1
uint64 sys_brk()
{
    proc_t* p = myproc();
    uint64 new_break;
    
    // 从 a0 寄存器获取参数
    arg_uint64(0, &new_break);

    uint64 old_break = p->heap_top;

    if (new_break == 0) {
        // 用户只是查询当前堆顶
        
        //debug时使用
        printf("the brk is: 0x%lx\n", old_break);

        return old_break;
    }

    // 计算用户栈的底部，堆不能长到栈里
    uint64 ustack_bottom = TRAPFRAME - p->ustack_pages * PGSIZE;

    if (new_break > old_break) {
        // --- 增长堆 ---
        
        // 检查是否与栈碰撞
        // 我们检查向上取整的 new_break 是否会超过（或等于）栈底
        if (PG_ROUND_UP(new_break) > ustack_bottom) {
             return old_break; // 失败：与栈碰撞
        }
        
        uint32 len = new_break - old_break;
        uint64 result = uvm_heap_grow(p->pgtbl, old_break, len);
        
        // uvm_heap_grow 成功时返回 new_break, 失败时返回 old_break
        p->heap_top = result; 

        //debug时使用
        printf("the brk is: 0x%lx\n",result);

        return result;

    } else if (new_break < old_break) {
        // --- 缩小堆 ---
        
        // 堆不能缩小到初始代码/数据段以下
        // 在 proc_make_fisrt 中，heap_top 初始为 PGSIZE
        if (new_break < PGSIZE) {
            new_break = PGSIZE;
        }
        
        uint32 len = old_break - new_break;
        uint64 result = uvm_heap_ungrow(p->pgtbl, old_break, len);
        
        // uvm_heap_ungrow 总是成功并返回 new_break
        p->heap_top = result;

        //debug时使用
        printf("the brk is: 0x%lx\n",result);

        return result;
    }

    // new_break == old_break
    return old_break;
}

// 内存映射
// uint64 start 起始地址 (如果为0则由内核自主选择一个合适的起点, 通常是顺序扫描找到一个够大的空闲空间)
// uint32 len   范围(字节, 检查是否是page-aligned)
// 成功返回映射空间的起始地址, 失败返回-1
uint64 sys_mmap()
{
    return -1;
}

// 取消内存映射
// uint64 start 起始地址
// uint32 len   范围(字节, 检查是否是page-aligned)
// 成功返回0 失败返回-1
uint64 sys_munmap()
{
    return -1;
}

// copyin 测试 (int 数组)
// uint64 addr
// uint32 len
// 返回 0
uint64 sys_copyin()
{
    proc_t* p = myproc();
    uint64 addr;
    uint32 len;

    arg_uint64(0, &addr);
    arg_uint32(1, &len);

    int tmp;
    for(int i = 0; i < len; i++) {
        uvm_copyin(p->pgtbl, (uint64)&tmp, addr + i * sizeof(int), sizeof(int));
        printf("get a number from user: %d\n", tmp);
    }

    return 0;
}

// copyout 测试 (int 数组)
// uint64 addr
// 返回数组元素数量
uint64 sys_copyout()
{
    int L[5] = {1, 2, 3, 4, 5};
    proc_t* p = myproc();
    uint64 addr;

    arg_uint64(0, &addr);
    uvm_copyout(p->pgtbl, addr, (uint64)L, sizeof(int) * 5);

    return 5;
}

// copyinstr测试
// uint64 addr
// 成功返回0
uint64 sys_copyinstr()
{
    char s[64];

    arg_str(0, s, 64);
    printf("get str from user: %s\n", s);

    return 0;
}
