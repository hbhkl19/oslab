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

#define PROC_DEBUG 1

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
static proc_t* proczero;

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
    for(int i = 0; i < NPROC; i++) {
        proc_t* p = &procs[i];
        spinlock_acquire(&p->lk);
        if(p->state == UNUSED) {
            p->pid = alloc_pid();
            p->parent = NULL;
            p->exit_state = 0;
            p->sleep_space = NULL;
            p->heap_top = PGSIZE;
            p->ustack_pages = 1;

            // 分配内核栈
            p->kstack = (uint64)pmem_alloc(true);
            if(p->kstack == 0) {
                spinlock_release(&p->lk);
                return NULL;
            }

            // 分配 trapframe
            p->tf = (trapframe_t*)pmem_alloc(true);
            if(p->tf == NULL) {
                pmem_free(p->kstack, true);
                p->kstack = 0;
                spinlock_release(&p->lk);
                return NULL;
            }
            memset(p->tf, 0, PGSIZE);

            // 分配并初始化用户页表
            p->pgtbl = proc_pgtbl_init((uint64)p->tf);
            if(p->pgtbl == NULL) {
                pmem_free((uint64)p->tf, true);
                pmem_free(p->kstack, true);
                p->tf = NULL;
                p->kstack = 0;
                spinlock_release(&p->lk);
                return NULL;
            }

            // 设置内核上下文，调度到该进程时从 fork_return 开始
            memset(&p->ctx, 0, sizeof(p->ctx));
            p->ctx.ra = (uint64)fork_return;
            p->ctx.sp = p->kstack + PGSIZE;

            // 暂时标记为 SLEEPING，完成初始化后由调用者设置为 RUNNABLE
            p->state = SLEEPING;
            return p;
        }
        spinlock_release(&p->lk);
    }
    return NULL;
}

// 释放一个进程空间
// 释放pgtbl的整个地址空间
// 释放mmap_region到仓库
// 设置其余各个字段为合适初始值
// tips: 调用者需持有p->lk
void proc_free(proc_t* p)
{
    assert(spinlock_holding(&p->lk), "proc_free: lock");

    if(p->pgtbl) {
        uvm_destroy_pgtbl(p->pgtbl);
        p->pgtbl = NULL;
    }

    if(p->tf) {
        pmem_free((uint64)p->tf, true);
        p->tf = NULL;
    }

    if(p->kstack) {
        pmem_free(p->kstack, true);
        p->kstack = 0;
    }

    p->pid = -1;
    p->parent = NULL;
    p->exit_state = 0;
    p->sleep_space = NULL;
    p->heap_top = 0;
    p->ustack_pages = 0;
    p->state = UNUSED;
    memset(&p->ctx, 0, sizeof(p->ctx));
}

// 进程模块初始化
void proc_init()
{
    global_pid = 1;
    spinlock_init(&lk_pid, "pid");
    for(int i = 0; i < NPROC; i++) {
        spinlock_init(&procs[i].lk, "proc");
        procs[i].state = UNUSED;
        procs[i].pid = -1;
        procs[i].parent = NULL;
        procs[i].sleep_space = NULL;
        procs[i].pgtbl = NULL;
        procs[i].tf = NULL;
        procs[i].kstack = 0;
    }
    // 预留 proczero 为 procs[0]
    proczero = &procs[0];
    mmap_init();
}


// 进程复制
// UNUSED -> RUNNABLE
int proc_fork()
{
    proc_t* child = proc_alloc();
    if(child == NULL) {
        return -1;
    }

    proc_t* parent = myproc();
    spinlock_acquire(&parent->lk);

    // 复制用户页表与栈/堆信息
    uvm_copy_pgtbl(parent->pgtbl, child->pgtbl, parent->heap_top, parent->ustack_pages, NULL);
    child->heap_top = parent->heap_top;
    child->ustack_pages = parent->ustack_pages;

    // 复制 trapframe
    *(child->tf) = *(parent->tf);
    child->tf->a0 = 0; // 子进程返回 0

    child->parent = parent;
    child->state = RUNNABLE;

    int pid = child->pid;
#ifdef PROC_DEBUG
    printf("[proc] fork: parent=%d child=%d\n", parent->pid, pid);
#endif
    spinlock_release(&child->lk);
    spinlock_release(&parent->lk);
    return pid;
}

// 进程放弃CPU的控制权
// RUNNING -> RUNNABLE
void proc_yield()
{
    proc_t* p = myproc();
    spinlock_acquire(&p->lk);
    p->state = RUNNABLE;
    proc_sched();
    spinlock_release(&p->lk);
}

// 等待一个子进程进入 ZOMBIE 状态
// 将退出的子进程的exit_state放入用户给的地址 addr
// 成功返回子进程pid，失败返回-1
int proc_wait(uint64 addr)
{
    proc_t* p = myproc();
    spinlock_acquire(&p->lk);
    for(;;) {
        int havekids = 0;
        for(int i = 0; i < NPROC; i++) {
            proc_t* cp = &procs[i];
        if(cp == p) {
            continue;
        }
        spinlock_acquire(&cp->lk);
        if(cp->parent == p) {
            havekids = 1;
            if(cp->state == ZOMBIE) {
                int pid = cp->pid;
#ifdef PROC_DEBUG
                printf("[proc] wait: reap child=%d exit_state=%d\n", pid, cp->exit_state);
#endif
                if(addr != 0) {
                    uvm_copyout(p->pgtbl, addr, (uint64)&cp->exit_state, sizeof(int));
                }
                proc_free(cp);
                spinlock_release(&cp->lk);
                    spinlock_release(&p->lk);
                    return pid;
                }
            }
            spinlock_release(&cp->lk);
        }

        if(!havekids) {
#ifdef PROC_DEBUG
            printf("[proc] wait: no children for pid=%d\n", p->pid);
#endif
            spinlock_release(&p->lk);
            return -1;
        }

        // 等待子进程退出
        proc_sleep(p, &p->lk);
    }
}

// 父进程退出，子进程认proczero做父，因为它永不退出
static void proc_reparent(proc_t* parent)
{
    for(int i = 0; i < NPROC; i++) {
        proc_t* p = &procs[i];
        if(p == parent) {
            continue;
        }
        spinlock_acquire(&p->lk);
        if(p->parent == parent) {
            p->parent = proczero;
        }
        spinlock_release(&p->lk);
    }
}

// 进程退出
void proc_exit(int exit_state)
{
    proc_t* p = myproc();
    if(p == proczero) {
        panic("proc_exit: proczero exit");
    }

    spinlock_acquire(&p->lk);
    p->exit_state = exit_state;

    // 处理孤儿进程
    proc_reparent(p);

    // 唤醒父进程
    if(p->parent) {
#ifdef PROC_DEBUG
        printf("[proc] exit: pid=%d exit_state=%d wake parent pid=%d\n", p->pid, exit_state, p->parent->pid);
#endif
        proc_wakeup(p->parent);
    }

    p->state = ZOMBIE;
    proc_sched();
    spinlock_release(&p->lk);
}

// 进程切换到调度器
// ps: 调用者保证持有当前进程的锁
void proc_sched()
{
    proc_t* p = myproc();
    cpu_t* c = mycpu();

    assert(spinlock_holding(&p->lk), "proc_sched: lock");
    assert(!intr_get(), "proc_sched: interruptible");

    c->proc = NULL;
    swtch(&p->ctx, &c->ctx);
    c->proc = p;
}

// 调度器
void proc_scheduler()
{
    cpu_t* c = mycpu();
    c->proc = NULL;
    for(;;) {
        intr_on();
        for(int i = 0; i < NPROC; i++) {
            proc_t* p = &procs[i];
            spinlock_acquire(&p->lk);
            if(p->state == RUNNABLE) {
                p->state = RUNNING;
#ifdef PROC_DEBUG
                printf("[proc] switch to pid=%d\n", p->pid);
#endif
                c->proc = p;
                swtch(&c->ctx, &p->ctx);
                c->proc = NULL;
            }
            spinlock_release(&p->lk);
        }
    }
}

// 进程睡眠在sleep_space
void proc_sleep(void* sleep_space, spinlock_t* lk)
{
    proc_t* p = myproc();

    // 切换到睡眠前持有自己的锁
    if(lk != &p->lk) {
        spinlock_acquire(&p->lk);
        spinlock_release(lk);
    }

    p->sleep_space = sleep_space;
    p->state = SLEEPING;

    proc_sched();

    p->sleep_space = NULL;

    // 醒来后恢复原先的锁
    if(lk != &p->lk) {
        spinlock_release(&p->lk);
        spinlock_acquire(lk);
    } else {
        spinlock_release(&p->lk);
        spinlock_acquire(lk);
    }
}

// 唤醒所有在sleep_space沉睡的进程
void proc_wakeup(void* sleep_space)
{
    proc_t* self = myproc();
    for(int i = 0; i < NPROC; i++) {
        proc_t* p = &procs[i];
        if(p == self) {
            continue;
        }
        spinlock_acquire(&p->lk);
        if(p->state == SLEEPING && p->sleep_space == sleep_space) {
            p->state = RUNNABLE;
        }
        spinlock_release(&p->lk);
    }
}


/*--------------------------------------首个进程-------------------------------------------*/

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
    proc_t* p = proczero;
    spinlock_acquire(&p->lk);

    // pid 设置
    p->pid = 0;
    p->parent = NULL;

    uint64 kstack = (uint64)pmem_alloc(true); // 分配内核栈
    if (kstack == 0)
        panic("proc_make_first: kstack alloc failed");
    p->kstack = kstack;

    p->tf = (trapframe_t*)pmem_alloc(true); // 分配trapframe
    if (p->tf == 0)
        panic("proc_make_first: trapframe alloc failed");
    memset(p->tf, 0, PGSIZE);


    p->pgtbl = proc_pgtbl_init((uint64)p->tf);
    if(p->pgtbl == 0)
        panic("proc_make_first: pgtbl init failed");

    uint64 ustack_page = (uint64)pmem_alloc(false); // 用户物理页
    if (ustack_page == 0)
        panic("proc_make_first: ustack alloc failed");
    // 将用户栈映射到 TRAPFRAME 下方
    vm_mappages(p->pgtbl, TRAPFRAME - PGSIZE, ustack_page, PGSIZE, PTE_R | PTE_W | PTE_U);
    p->ustack_pages = 1;

    assert(initcode_len <= PGSIZE, "proc_make_first: initcode too big\n");

    // 映射 initcode
    uint64 initcode_page = (uint64)pmem_alloc(false); // 用户物理页
    if (initcode_page == 0)
        panic("proc_make_first: initcode alloc failed");
    // 拷贝 initcode 到物理页
    memcpy((void*)initcode_page, initcode, initcode_len);
    // 映射
    vm_mappages(p->pgtbl, 0, initcode_page, PGSIZE, PTE_R | PTE_W | PTE_X | PTE_U);

    p->heap_top = PGSIZE; // 代码段后面一页开始是堆

    p->tf->epc = 0x60; // 用户代码入口地址
    p->tf->kernel_satp = r_satp(); // 内核页表

    p->tf->kernel_sp = p->kstack + PGSIZE; // 内核栈顶
    p->tf->kernel_trap = (uint64)trap_user_handler; // 进入内核的入口地址
    p->tf->kernel_hartid = r_tp(); // hartid
    p->tf->sp=TRAPFRAME;



    // 内核字段设置
    // (5) 设置内核上下文 (为swtch做准备) [cite: 109]
    memset(&p->ctx, 0, sizeof(p->ctx));
    p->ctx.ra = (uint64)fork_return; // swtch返回后, 跳转到fork_return
    p->ctx.sp = p->kstack + PGSIZE; // 内核栈顶

    p->state = RUNNABLE;
    spinlock_release(&p->lk);
}
