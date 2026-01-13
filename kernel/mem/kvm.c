/*
内核页表的创建 kvmmake
页表遍历 walk
建立映射 mappages
*/

#include "riscv.h"
#include "mem/pmem.h"
#include "mem/vmem.h"
#include "lib/string.h"
#include "lib/lock.h"
#include "memlayout.h"
#include "lib/print.h"  

static pgtbl_t kernel_pgtbl;

extern char etext[];

extern char trampoline[];

pte_t* vm_getpte(pgtbl_t pgtbl, uint64 va, bool alloc)
{
    if(va >= VA_MAX) 
    {
        panic("vm_getpte: virtual address out of bound");
    }

    for (int level = 2; level > 0; level--) {
        pte_t* pte = &pgtbl[VA_TO_VPN(va, level)];

        if (*pte & PTE_V) {
           pgtbl = (pgtbl_t)PTE_TO_PA(*pte);
        } 
        else 
        {
            if (alloc) {
                uint64 new_pgtbl = (uint64)pmem_alloc(true);  // 中间页表在内核
                if (new_pgtbl == 0) {
                    return NULL;
                }
                memset((void*)new_pgtbl, 0, PGSIZE);
                
                // new_pgtbl 是虚拟地址，在内核等值映射中 VA == PA
                *pte = PA_TO_PTE(new_pgtbl) | PTE_V;
                
                pgtbl = (pgtbl_t)new_pgtbl;  // 更新为新页表虚拟地址
            } else {
                return NULL;
            }
        }
    }
    return &pgtbl[VA_TO_VPN(va, 0)];
}


// vm_mappages: 在页表中创建一段虚拟地址到物理地址的映射
// - pgtbl: 目标页表
// - va:    虚拟地址起始
// - pa:    物理地址起始
// - len:   映射长度 (必须是 PGSIZE 的整数倍)
// - perm:  权限位 (PTE_R, PTE_W, PTE_X)
void vm_mappages(pgtbl_t pgtbl, uint64 va, uint64 pa, uint64 len, int perm) {
  if((va % PGSIZE) != 0){
    panic("mappages: va not aligned");}

  if((len % PGSIZE) != 0){
    panic("mappages: size not aligned");}

  if(len == 0){
    panic("mappages: size");}
  
    uint64 current_va = va;
    uint64 end_va = va + len;
    uint64 current_pa = pa;
    pte_t* pte;

    while (current_va < end_va) {
        // 1. 获取当前虚拟地址对应的最低级PTE的地址
        pte = vm_getpte(pgtbl, current_va, true);

        if (pte == NULL) {
            panic("vm_mappages: pmem_alloc failed");
        }
        if (*pte & PTE_V) {
            // 如果该PTE已存在映射, 这是不允许的
            panic("vm_mappages: remap");
        }

        // 2. 设置PTE, 包含物理页号, 权限位和有效位
        *pte = PA_TO_PTE(current_pa) | perm | PTE_V;

        // 3. 移动到下一个页面
        current_va += PGSIZE;
        current_pa += PGSIZE;
    }
}

// vm_unmappages: 在页表中解除一段地址映射
// - pgtbl:  目标页表
// - va:     虚拟地址起始
// - len:    映射长度
// - freeit: 是否释放映射对应的物理页面
void vm_unmappages(pgtbl_t pgtbl, uint64 va, uint64 len, bool freeit) {
    if ((va % PGSIZE) != 0) {
        panic("vm_unmappages: va not aligned");
    }
    if ((len % PGSIZE) != 0) {
        panic("vm_unmappages: length not aligned");
    }
    uint64 current_va = va;
    uint64 end_va = va + len;
    pte_t* pte;

    while (current_va < end_va) {
        // 1. 获取当前虚拟地址对应的最低级PTE的地址 (不分配新页表)
        pte = vm_getpte(pgtbl, current_va, false);

        if (pte != NULL && (*pte & PTE_V)) {
            // 2. 如果映射存在
            if (freeit) {
                // 3. 如果需要, 释放其对应的物理页
                uint64 pa = PTE_TO_PA(*pte);
                // 根据物理地址 pa 判断它属于哪个区域
                if (pa >= PG_ROUND_UP((uint64)ALLOC_BEGIN) && pa < PG_ROUND_UP((uint64)ALLOC_BEGIN) + 1024 * PGSIZE) {
                    // 物理地址在内核区
                    pmem_free(pa, true);
                } else if (pa >= PG_ROUND_UP((uint64)ALLOC_BEGIN) + 1024 * PGSIZE && pa < PHYSTOP) {
                    // 物理地址在用户区
                    pmem_free(pa, false);
                } else {
                    // 物理地址不在任何一个可管理区域内, 这是一个严重错误   
                    panic("vm_unmappages: pa out of any known region");
                }
            }
            // 4. 将PTE清零, 使映射失效
            *pte = 0;
        }

        // 5. 移动到下一个页面
        current_va += PGSIZE;
    }
}


void kvm_init() {
    // 1. 为顶级页表分配一个物理页
    kernel_pgtbl = (pgtbl_t)pmem_alloc(true);
    if (kernel_pgtbl == NULL) {
        panic("kvm_init: failed to allocate root page table");
    }
    memset(kernel_pgtbl, 0, PGSIZE);

    // 2. 映射硬件设备: UART
    // 将 UART 寄存器的物理地址映射到等值的虚拟地址
    vm_mappages(kernel_pgtbl, UART_BASE, UART_BASE, PGSIZE, PTE_R | PTE_W);
    
    // 2.5 映射 VirtIO MMIO 寄存器
    vm_mappages(kernel_pgtbl, VIRTIO_BASE, VIRTIO_BASE, PGSIZE, PTE_R | PTE_W);

    // 3. 映射硬件设备: PLIC
    // 将 PLIC 寄存器的物理地址区域映射到等值的虚拟地址
    vm_mappages(kernel_pgtbl, PLIC_BASE, PLIC_BASE, 0x400000, PTE_R | PTE_W);
    
    // 4. 映射内核代码段 (.text)
    // 权限为 可读 | 可执行 (R-X)
    vm_mappages(kernel_pgtbl, KERNEL_BASE, KERNEL_BASE, (uint64)etext - KERNEL_BASE, PTE_R | PTE_X);

    // 5. 映射内核数据段和剩余的所有物理内存
    // 权限为 可读 | 可写 (RW-)
    uint64 pa_for_data = (uint64)etext;
    vm_mappages(kernel_pgtbl, pa_for_data, pa_for_data, PHYSTOP - pa_for_data, PTE_R | PTE_W);

    // 6. 映射 trampoline (用于用户态和内核态切换)
    vm_mappages(kernel_pgtbl, TRAMPOLINE, (uint64)trampoline, PGSIZE, PTE_R | PTE_X);

    //目前缺少对内核栈的映射, 因为只有一个初始进程，之后记得补上！
}

// kvm_inithart: 在每个CPU核上启用分页
void kvm_inithart() {

    sfence_vma();
    // 1. 将内核页表的物理地址写入 satp 寄存器, 正式启用分页
    // MAKE_SATP 宏会将页表地址转换为 satp 需要的格式
    w_satp(MAKE_SATP(kernel_pgtbl));

    // 2. 刷新 TLB (Translation Lookaside Buffer)
    // 确保旧的/无效的地址翻译被清除
    sfence_vma();
}

// debug helper: 获取当前内核页表指针
pgtbl_t kvm_get_pgtbl()
{
    return kernel_pgtbl;
}



// for debug
// 输出页表内容
void vm_print(pgtbl_t pgtbl)
{
    // 顶级页表，次级页表，低级页表
    pgtbl_t pgtbl_2 = pgtbl, pgtbl_1 = NULL, pgtbl_0 = NULL;
    pte_t pte;

    DEBUG_LOG("level-2 pgtbl: pa = %p\n", pgtbl_2);
    for(int i = 0; i < PGSIZE / sizeof(pte_t); i++) 
    {
        pte = pgtbl_2[i];
        if(!((pte) & PTE_V)) continue;
        assert(PTE_CHECK(pte), "vm_print: pte check fail (1)");
        pgtbl_1 = (pgtbl_t)PTE_TO_PA(pte);
        DEBUG_LOG(".. level-1 pgtbl %d: pa = %p\n", i, pgtbl_1);
        
        for(int j = 0; j < PGSIZE / sizeof(pte_t); j++)
        {
            pte = pgtbl_1[j];
            if(!((pte) & PTE_V)) continue;
            assert(PTE_CHECK(pte), "vm_print: pte check fail (2)");
            pgtbl_0 = (pgtbl_t)PTE_TO_PA(pte);
            DEBUG_LOG(".. .. level-0 pgtbl %d: pa = %p\n", j, pgtbl_2);

            for(int k = 0; k < PGSIZE / sizeof(pte_t); k++) 
            {
                pte = pgtbl_0[k];
                if(!((pte) & PTE_V)) continue;
                assert(!PTE_CHECK(pte), "vm_print: pte check fail (3)");
                DEBUG_LOG(".. .. .. physical page %d: pa = %p flags = %d\n", k, (uint64)PTE_TO_PA(pte), (int)PTE_FLAGS(pte));                
            }
        }
    }
}
