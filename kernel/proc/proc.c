#include "lib/print.h"
#include "mem/pmem.h"
#include "mem/vmem.h"
#include "proc/cpu.h"
#include "proc/initcode.h"
#include "memlayout.h"
#include "proc/proc.h"
#include "lib/string.h"
#include "riscv.h"
#include "mem/mmap.h"
#include "proc/initcode.h"

// in trampoline.S
extern char trampoline[];

// in swtch.S
extern void swtch(context_t* old, context_t* new);

// in trap_user.c
extern void trap_user_return();
extern void trap_user_handler();

/*----------------本地变量------------------*/

// 进程数组
static proc_t procs[NPROC];


// 全局的pid和保护它的锁 
static int global_pid = 1;
static spinlock_t lk_pid;


// 申请一个pid(锁保护)
static int alloc_pid()
{
    int tmp = 0;
    spinlock_acquire(&lk_pid);
    assert(global_pid >= 0, "alloc_pid: overflow");
    tmp = global_pid++;
    spinlock_release(&lk_pid);
    return tmp;
}

// 释放锁 + 调用 trap_user_return
static void fork_return()
{
    // 由于调度器中上了锁，所以这里需要解锁
    proc_t* p = myproc();
    spinlock_release(&p->lk);
    trap_user_return();
}

// 返回一个未使用的进程空间
// 设置pid + 设置上下文中的ra和sp
// 申请tf和pgtbl使用的物理页
proc_t* proc_alloc()
{

}

// 释放一个进程空间
// 释放pgtbl的整个地址空间
// 释放mmap_region到仓库
// 设置其余各个字段为合适初始值
// tips: 调用者需持有p->lk
void proc_free(proc_t* p)
{

}

// 进程模块初始化
void proc_init()
{

}


// 进程复制
// UNUSED -> RUNNABLE
int proc_fork()
{

}

// 进程放弃CPU的控制权
// RUNNING -> RUNNABLE
void proc_yield()
{

}

// 等待一个子进程进入 ZOMBIE 状态
// 将退出的子进程的exit_state放入用户给的地址 addr
// 成功返回子进程pid，失败返回-1
int proc_wait(uint64 addr)
{

}

// 父进程退出，子进程认proczero做父，因为它永不退出
static void proc_reparent(proc_t* parent)
{

}

// 唤醒一个进程
static void proc_wakeup_one(proc_t* p)
{
    assert(spinlock_holding(&p->lk), "proc_wakeup_one: lock");
    if(p->state == SLEEPING && p->sleep_space == p) {
        p->state = RUNNABLE;
    }
}

// 进程退出
void proc_exit(int exit_state)
{

}

// 进程切换到调度器
// ps: 调用者保证持有当前进程的锁
void proc_sched()
{

}

// 调度器
void proc_scheduler()
{

}

// 进程睡眠在sleep_space
void proc_sleep(void* sleep_space, spinlock_t* lk)
{

}

// 唤醒所有在sleep_space沉睡的进程
void proc_wakeup(void* sleep_space)
{

}


/*--------------------------------------首个进程-------------------------------------------*/

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
void proc_make_first()
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

    proczero.tf->epc = 0x34; // 用户代码入口地址
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