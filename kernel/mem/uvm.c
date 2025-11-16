#include "mem/mmap.h"
#include "mem/pmem.h"
#include "mem/vmem.h"
#include "proc/cpu.h"
#include "lib/print.h"
#include "lib/string.h"
#include "memlayout.h"
#include "riscv.h"

// // 连续虚拟空间的复制(在uvm_copy_pgtbl中使用)
// static void copy_range(pgtbl_t old, pgtbl_t new, uint64 begin, uint64 end)
// {
//     uint64 va, pa, page;
//     int flags;
//     pte_t* pte;

//     for(va = begin; va < end; va += PGSIZE)
//     {
//         pte = vm_getpte(old, va, false);
//         assert(pte != NULL, "uvm_copy_pgtbl: pte == NULL");
//         assert((*pte) & PTE_V, "uvm_copy_pgtbl: pte not valid");
        
//         pa = (uint64)PTE_TO_PA(*pte);
//         flags = (int)PTE_FLAGS(*pte);

//         page = (uint64)pmem_alloc(false);
//         memmove((char*)page, (const char*)pa, PGSIZE);
//         vm_mappages(new, va, page, PGSIZE, flags);
//     }
// }




// // 两个 mmap_region 区域合并
// // 保留一个 释放一个 不操作 next 指针
// // 在uvm_munmap里使用
// static void mmap_merge(mmap_region_t* mmap_1, mmap_region_t* mmap_2, bool keep_mmap_1)
// {
//     // 确保有效和紧临
//     assert(mmap_1 != NULL && mmap_2 != NULL, "mmap_merge: NULL");
//     assert(mmap_1->begin + mmap_1->npages * PGSIZE == mmap_2->begin, "mmap_merge: check fail");
    
//     // merge
//     if(keep_mmap_1) {
//         mmap_1->npages += mmap_2->npages;
//         mmap_region_free(mmap_2);
//     } else {
//         mmap_2->begin -= mmap_1->npages * PGSIZE;
//         mmap_2->npages += mmap_1->npages;
//         mmap_region_free(mmap_1);
//     }
// }

// // 打印以 mmap 为首的 mmap 链
// // for debug
// void uvm_show_mmaplist(mmap_region_t* mmap)
// {
//     mmap_region_t* tmp = mmap;
//     printf("\nmmap allocable area:\n");
//     if(tmp == NULL)
//         printf("NULL\n");
//     while(tmp != NULL) {
//         printf("allocable region: %p ~ %p\n", tmp->begin, tmp->begin + tmp->npages * PGSIZE);
//         tmp = tmp->next;
//     }
// }

// // 递归释放 页表占用的物理页 和 页表管理的物理页
// // ps: 顶级页表level = 3, level = 0 说明是页表管理的物理页
// static void destroy_pgtbl(pgtbl_t pgtbl, uint32 level)
// {

// }

// // 页表销毁：trapframe 和 trampoline 单独处理
// void uvm_destroy_pgtbl(pgtbl_t pgtbl)
// {

// }

// // 拷贝页表 (拷贝并不包括trapframe 和 trampoline)
// void uvm_copy_pgtbl(pgtbl_t old, pgtbl_t new, uint64 heap_top, uint32 ustack_pages, mmap_region_t* mmap)
// {
//     /* step-1: USER_BASE ~ heap_top */

//     /* step-2: ustack */

//     /* step-3: mmap_region */
// }

// // 在用户页表和进程mmap链里 新增mmap区域 [begin, begin + npages * PGSIZE)
// // 页面权限为perm
// void uvm_mmap(uint64 begin, uint32 npages, int perm)
// {
//     if(npages == 0) return;
//     assert(begin % PGSIZE == 0, "uvm_mmap: begin not aligned");

//     // 修改 mmap 链 (分情况的链式操作)

//     // 修改页表 (物理页申请 + 页表映射)

// }

// // 在用户页表和进程mmap链里释放mmap区域 [begin, begin + npages * PGSIZE)
// void uvm_munmap(uint64 begin, uint32 npages)
// {
//     if(npages == 0) return;
//     assert(begin % PGSIZE == 0, "uvm_munmap: begin not aligned");

//     // new mmap_region 的产生

//     // 尝试合并 mmap_region

//     // 页表释放

// }





// 用户堆空间增加, 返回新的堆顶地址 (注意栈顶最大值限制)
// 在这里无需修正 p->heap_top
uint64 uvm_heap_grow(pgtbl_t pgtbl, uint64 heap_top, uint32 len)
{
    uint64 new_heap_top = heap_top + len;

    // 计算需要映射的虚拟地址范围
    uint64 va_start = PG_ROUND_UP(heap_top);
    uint64 va_end = PG_ROUND_UP(new_heap_top);

    if (va_start >= va_end) { 
        // 无需分配新页面(例如，增长在当前页内)
        return new_heap_top;
    }

    // 遍历所有需要分配的新页面
    for(uint64 va = va_start; va < va_end; va += PGSIZE) {
        // 分配一个用户物理页 (false = not in kernel)
        void* page = pmem_alloc(false); 
        
        if(page == NULL) {
            // 内存不足 (Out of Memory)
            printf("uvm_heap_grow: pmem_alloc failed (out of memory)\n");
            // 回滚：释放此调用中已分配的所有页面
            vm_unmappages(pgtbl, va_start, va - va_start, true);
            return heap_top; // 返回旧的堆顶，表示失败
        }
        
        // 将新分配的物理页清零
        memset(page, 0, PGSIZE);
        
        // 建立映射 (R | W | U)
        vm_mappages(pgtbl, va, (uint64)page, PGSIZE, PTE_R | PTE_W | PTE_U);
    }

    return new_heap_top;
}

// 用户堆空间减少, 返回新的堆顶地址
// 在这里无需修正 p->heap_top
uint64 uvm_heap_ungrow(pgtbl_t pgtbl, uint64 heap_top, uint32 len)
{
    uint64 new_heap_top = heap_top - len;

    // 计算需要解除映射的虚拟地址范围
    uint64 va_start_to_free = PG_ROUND_UP(new_heap_top);
    uint64 va_end_to_free = PG_ROUND_UP(heap_top); 

    if(va_start_to_free < va_end_to_free) {
        // 如果新的向上取整地址 < 旧的向上取整地址，说明至少可以释放一个页面
        vm_unmappages(pgtbl, va_start_to_free, va_end_to_free - va_start_to_free, true);
    }

    return new_heap_top;
}

// 用户态地址空间[src, src+len) 拷贝至 内核态地址空间[dst, dst+len)
// 注意: src dst 不一定是 page-aligned
void uvm_copyin(pgtbl_t pgtbl, uint64 dst, uint64 src, uint32 len)
{

}

// 内核态地址空间[src, src+len） 拷贝至 用户态地址空间[dst, dst+len)
void uvm_copyout(pgtbl_t pgtbl, uint64 dst, uint64 src, uint32 len)
{

}

// 用户态字符串拷贝到内核态
// 最多拷贝maxlen字节, 中途遇到'\0'则终止
// 注意: src dst 不一定是 page-aligned
void uvm_copyin_str(pgtbl_t pgtbl, uint64 dst, uint64 src, uint32 maxlen)
{

}