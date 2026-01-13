#include "lib/print.h"
#include "trap/trap.h"
#include "proc/cpu.h"
#include "mem/vmem.h"
#include "memlayout.h"
#include "riscv.h"
#include "syscall/sysnum.h"
#include "syscall/syscall.h"

// in trampoline.S
extern char trampoline[];      // 内核和用户切换的代码
extern char user_vector[];     // 用户触发trap进入内核
extern char user_return[];     // trap处理完毕返回用户

// in trap.S
extern char kernel_vector[];   // 内核态trap处理流程

// in trap_kernel.c
extern char* interrupt_info[16]; // 中断错误信息
extern char* exception_info[16]; // 异常错误信息

// 在user_vector()里面调用
// 用户态trap处理的核心逻辑
void trap_user_handler()
{
    uint64 sepc = r_sepc();          // 记录了发生异常时的pc值
    uint64 sstatus = r_sstatus();    // 与特权模式和中断相关的状态信息
    uint64 scause = r_scause();      // 引发trap的原因
    uint64 stval = r_stval();        // 发生trap时保存的附加信息(不同trap不一样)
    proc_t* p = myproc();

    // 确认trap来自U-mode
    assert((sstatus & SSTATUS_SPP) == 0, "trap_user_handler: not from u-mode");

    w_stvec((uint64)kernel_vector); // 切换到内核trap处理入口

    p->tf->epc = sepc;
    //p->tf->sstatus = sstatus;

    if(scause & (1UL << 63)) {
        // 中断
        int interrupt_id = scause & 0xf;
        switch(interrupt_id) {
            case 1: {
                // S-mode 软件中断 (转发的时钟中断，旧方式)
                w_sip(r_sip() & ~2);
                timer_interrupt_handler();
                if(myproc() != 0 && myproc()->state == RUNNING) {
                    proc_yield();
                }
                break;
            }
            case 5: {
                // S-mode 定时器中断（使用 SBI 定时器）
                timer_interrupt_handler();
                if(myproc() != 0 && myproc()->state == RUNNING) {
                    proc_yield();
                }
                break;
            }
            default:
                printf("User interrupt: %s\n", interrupt_info[interrupt_id]);
                panic("User interrupt not implemented");
        }

    }
    else {
        // 异常
        int exception_id = scause & 0xf;
        
        switch(exception_id) {
            case 8: {
                // system call
                
                p->tf->epc += 4;
                // 现在已经修改了 epc，可以安全地开中断
                // 因为后续如果发生中断，不会改变我们保存的 epc 值
                intr_on();

                syscall();
                // 关中断，准备返回用户态
                intr_off();
                break;
            }
            
            // ========== 情况2：非法指令 ==========
            case 2: {
                printf("Illegal instruction at sepc=0x%lx\n", sepc);
                printf("Instruction bytes: 0x%x\n", stval);
                panic("User illegal instruction");
                break;
            }
            
            // ========== 情况3：加载页错误 ==========
            case 13: {
                printf("Load page fault at address 0x%lx, sepc=0x%lx\n", stval, sepc);
                panic("User load page fault");
                break;
            }
            
            // ========== 情况4：存储页错误 ==========
            case 15: {
                printf("Store page fault at address 0x%lx, sepc=0x%lx\n", stval, sepc);
                panic("User store page fault");
                break;
            }
            
            // ========== 情况5：其他异常 ==========
            default: {
                printf("User exception: cause=%d, pc=0x%lx, stval=0x%lx\n", exception_id, p->tf->epc, stval);               
                if(exception_id < 16 && exception_info[exception_id]) {
                    printf("Exception: %s\n", exception_info[exception_id]);
                }
                panic("Unknown user exception");
                break;
            }
        }
    }
    trap_user_return();
}

// 调用user_return()
// 内核态返回用户态
void trap_user_return()
{
    proc_t* p = myproc();
    // 调度器切入时持有进程锁，进入用户态前释放
    if(spinlock_holding(&p->lk))
        spinlock_release(&p->lk);
    intr_off();
    uint64 trampoline_uservec = TRAMPOLINE + (user_vector - trampoline);
    w_stvec(trampoline_uservec);

    p->tf->kernel_satp= r_satp();         // 保存内核的页表
    p->tf->kernel_sp  = p->kstack + PGSIZE; // 保存内核栈顶
    p->tf->kernel_trap= (uint64)trap_user_handler; // 保存内核trap处理函数入口
    p->tf->kernel_hartid = r_tp();        // 保存内核hartid

    uint64 sstatus = r_sstatus();
    sstatus &= ~SSTATUS_SPP;              // 设置为用户态
    sstatus |= SSTATUS_SPIE;              // 使能用户态中断
    w_sstatus(sstatus);

    w_sepc(p->tf->epc);
    uint64 satp= MAKE_SATP(p->pgtbl);

    uint64 user_return_func = TRAMPOLINE + ((uint64)user_return - (uint64)trampoline);
    ((void (*)(uint64,uint64))user_return_func)(TRAPFRAME, satp);

    panic("trap_user_return: should not reach here");
}
