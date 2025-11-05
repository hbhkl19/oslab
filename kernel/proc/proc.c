#include "lib/print.h"
#include "mem/pmem.h"
#include "mem/vmem.h"
#include "proc/cpu.h"
#include "proc/initcode.h"
#include "memlayout.h"
#include "proc/proc.h"
#include "lib/string.h"
#include "riscv.h"

// in trampoline.S
extern char trampoline[];

// in swtch.S
extern void swtch(context_t* old, context_t* new);

// in trap_user.c
extern void trap_user_return();
extern void trap_user_handler();

// 第一个进程
static proc_t proczero;

// 获得一个初始化过的用户页表
// 完成了trapframe 和 trampoline 的映射
pgtbl_t proc_pgtbl_init(uint64 trapframe)
{
    // 1. 分配用户页表的根页面
    pgtbl_t pgtbl = (pgtbl_t)pmem_alloc(false); //从内核池拿一页物理页
    if (pgtbl == NULL) {
        panic("proc_pgtbl_init: pmem_alloc failed");
    }
    memset(pgtbl, 0, PGSIZE);

    // 2. 映射 trampoline（用户地址空间最高页）
    //    内核地址空间中的 trampoline 也映射到同一物理页
    //    这样用户态和内核态都能访问同一份代码
    vm_mappages(pgtbl, TRAMPOLINE, (uint64)trampoline, PGSIZE, PTE_R | PTE_X);

    // 3. 映射 trapframe（trampoline 下方一页）
    //    保存用户寄存器状态的结构体
    vm_mappages(pgtbl, TRAPFRAME, trapframe, PGSIZE, PTE_R | PTE_W);

    return pgtbl;
}

/*
    第一个用户态进程的创建
    它的代码和数据位于initcode.h的initcode数组

    第一个进程的用户地址空间布局:
    trapoline   (1 page)
    trapframe   (1 page)
    ustack      (1 page)
    .......
                        <--heap_top
    code + data (1 page)
    empty space (1 page) 最低的4096字节 不分配物理页，同时不可访问
*/
void proc_make_fisrt()
{
    
    // pid 设置
    proczero.pid = 0;

    uint64 kstack = (uint64)pmem_alloc(true); // 分配内核栈
    if (kstack == 0)
        panic("proc_make_first: kstack alloc failed");
    proczero.kstack = kstack;

    proczero.tf = (trapframe_t*)pmem_alloc(true); // 分配trapframe
    if (proczero.tf == 0)
        panic("proc_make_first: trapframe alloc failed");
    memset(proczero.tf, 0, PGSIZE);


    proczero.pgtbl = proc_pgtbl_init((uint64)proczero.tf);
    if(proczero.pgtbl == 0)
        panic("proc_make_first: pgtbl init failed");

    uint64 ustack_page = (uint64)pmem_alloc(false); // 用户物理页
    if (ustack_page == 0)
        panic("proc_make_first: ustack alloc failed");
    // 将用户栈映射到 TRAPFRAME 下方
    vm_mappages(proczero.pgtbl, TRAPFRAME - PGSIZE, ustack_page, PGSIZE, PTE_R | PTE_W | PTE_U);
    proczero.ustack_pages = 1;

    assert(initcode_len <= PGSIZE, "proc_make_first: initcode too big\n");

    // 映射 initcode
    uint64 initcode_page = (uint64)pmem_alloc(false); // 用户物理页
    if (initcode_page == 0)
        panic("proc_make_first: initcode alloc failed");
    // 拷贝 initcode 到物理页
    memcpy((void*)initcode_page, initcode, initcode_len);
    // 映射
    vm_mappages(proczero.pgtbl, 0, initcode_page, PGSIZE, PTE_R | PTE_X | PTE_U);

    proczero.heap_top = PGSIZE; // 代码段后面一页开始是堆

    proczero.tf->epc = 0; // 用户代码入口地址
    proczero.tf->kernel_satp = r_satp(); // 内核页表

    proczero.tf->kernel_sp = proczero.kstack + PGSIZE; // 内核栈顶
    proczero.tf->kernel_trap = (uint64)trap_user_handler; // 进入内核的入口地址
    proczero.tf->kernel_hartid = r_tp(); // hartid
    proczero.tf->sp=TRAPFRAME;



    // 内核字段设置
    // (5) 设置内核上下文 (为swtch做准备) [cite: 109]
    memset(&proczero.ctx, 0, sizeof(proczero.ctx));
    proczero.ctx.ra = (uint64)trap_user_return; // swtch返回后, 跳转到trap_user_return
    proczero.ctx.sp = proczero.kstack + PGSIZE; // 内核栈顶
 
     // 上下文切换
    // (6) 设置CPU当前进程, 并切换
    printf("proc_make_first: switching to proczero...\n");
    cpu_t* c = mycpu();
    c->proc = &proczero;
    swtch(&c->ctx, &proczero.ctx);
    // pagetable 初始化

    // ustack 映射 + 设置 ustack_pages 

    // data + code 映射

    // 设置 heap_top

    // tf字段设置

    // 内核字段设置

    // 上下文切换
}