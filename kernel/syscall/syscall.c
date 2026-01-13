#include "lib/print.h"
#include "proc/cpu.h"
#include "mem/mmap.h"
#include "mem/vmem.h"
#include "syscall/syscall.h"
#include "syscall/sysnum.h"
#include "syscall/sysfunc.h"

// 系统调用 - 使用 switch-case 处理稀疏的系统调用号
void syscall()
{
    proc_t* p = myproc();
    uint64 num = p->tf->a7;
    uint64 ret = -1;

    if(debug_log_enabled && p->pid == 0) {
        printf("[syscall] pid=0 syscall=%lu\n", num);
    }

    switch(num) {
        // ============ 文件系统 ============
        case SYS_getcwd:        ret = sys_getcwd(); break;
        case SYS_dup:           ret = sys_dup(); break;
        case SYS_dup3:          ret = sys_dup3(); break;
        case SYS_mkdirat:       ret = sys_mkdirat(); break;
        case SYS_unlinkat:      ret = sys_unlinkat(); break;
        case SYS_linkat:        ret = sys_linkat(); break;
        case SYS_umount2:       ret = sys_umount2(); break;
        case SYS_mount:         ret = sys_mount(); break;
        case SYS_chdir:         ret = sys_chdir(); break;
        case SYS_openat:        ret = sys_openat(); break;
        case SYS_close:         ret = sys_close(); break;
        case SYS_pipe2:         ret = sys_pipe2(); break;
        case SYS_getdents64:    ret = sys_getdents64(); break;
        case SYS_lseek:         ret = sys_lseek(); break;
        case SYS_read:          ret = sys_read(); break;
        case SYS_write:         ret = sys_write(); break;
        case SYS_fstat:         ret = sys_fstat(); break;
        case SYS_fcntl:         ret = sys_fcntl(); break;
        case SYS_ioctl:         ret = sys_ioctl(); break;
        
        // ============ 进程 ============
        case SYS_exit:
        case SYS_exit_group:    sys_exit(); break; // 不返回
        case SYS_set_tid_address: ret = sys_set_tid_address(); break;
        case SYS_nanosleep:     ret = sys_nanosleep(); break;
        case SYS_sched_yield:   ret = sys_sched_yield(); break;
        case SYS_times:         ret = sys_times(); break;
        case SYS_uname:         ret = sys_uname(); break;
        case SYS_gettimeofday:  ret = sys_gettimeofday(); break;
        case SYS_getpid:        ret = sys_getpid(); break;
        case SYS_getppid:       ret = sys_getppid(); break;
        case SYS_gettid:        ret = sys_gettid(); break;
        case SYS_clone:         ret = sys_clone(); break;
        case SYS_execve:        ret = sys_exec(); break;
        case SYS_wait4:         ret = sys_wait4(); break;
        
        // ============ 内存 ============
        case SYS_brk:           ret = sys_brk(); break;
        case SYS_munmap:        ret = sys_munmap(); break;
        case SYS_mmap:          ret = sys_mmap(); break;
        case SYS_mprotect:      ret = sys_mprotect(); break;
        
        // ============ 调试 ============
        case SYS_print:         ret = sys_print(); break;
        case SYS_alloc_block:   ret = sys_alloc_block(); break;
        case SYS_free_block:    ret = sys_free_block(); break;
        case SYS_read_block:    ret = sys_read_block(); break;
        case SYS_write_block:   ret = sys_write_block(); break;
        case SYS_release_block: ret = sys_release_block(); break;
        case SYS_show_buf:      ret = sys_show_buf(); break;
        
        // ============ 旧接口兼容（后续删除） ============
        case SYS_open_old:      ret = sys_open(); break;
        case SYS_mkdir_old:     ret = sys_mkdir(); break;
        case SYS_getdir_old:    ret = sys_getdir(); break;
        case SYS_link_old:      ret = sys_link(); break;
        case SYS_unlink_old:    ret = sys_unlink(); break;
        case SYS_fork_old:      ret = sys_fork(); break;
        case SYS_wait_old:      ret = sys_wait(); break;
        case SYS_exec_old:      ret = sys_exec(); break;
        case SYS_sleep_old:     ret = sys_sleep(); break;
        
        default:
            printf("pid %d: Unknown syscall: %ld\n", p->pid, num);
            ret = -1;
    }
    
    p->tf->a0 = ret;
}

/*
    其他用于读取传入参数的函数
    参数分为两种,第一种是数据本身,第二种是指针
    第一种使用tf->ax传递
    第二种使用uvm_copyin 和 uvm_copyinstr 进行传递
*/

// 读取 n 号参数,它放在 an 寄存器中
static uint64 arg_raw(int n)
{   
    proc_t* proc = myproc();
    switch(n) {
        case 0:
            return proc->tf->a0;
        case 1:
            return proc->tf->a1;
        case 2:
            return proc->tf->a2;
        case 3:
            return proc->tf->a3;
        case 4:
            return proc->tf->a4;
        case 5:        
            return proc->tf->a5;
        default:
            panic("arg_raw: illegal arg num");
            return -1;
    }
}

// 读取 n 号参数, 作为 uint32 存储
void arg_uint32(int n, uint32* ip)
{
    *ip = arg_raw(n);
}

// 读取 n 号参数, 作为 uint64 存储
void arg_uint64(int n, uint64* ip)
{
    *ip = arg_raw(n);
}

// 读取 n 号参数指向的字符串到 buf, 字符串最大长度是 maxlen
void arg_str(int n, char* buf, int maxlen)
{
    proc_t* p = myproc();
    uint64 addr;
    arg_uint64(n, &addr);

    uvm_copyin_str(p->pgtbl, (uint64)buf, addr, maxlen);
}
