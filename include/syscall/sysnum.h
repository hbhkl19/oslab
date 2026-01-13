#ifndef __SYSNUM_H__
#define __SYSNUM_H__

// ============ Linux/RISC-V 标准系统调用号 ============
// 参考: user/lib/arch/riscv/syscall_ids.h.in

// 文件系统
#define SYS_getcwd          17
#define SYS_dup             23
#define SYS_dup3            24
#define SYS_fcntl           25
#define SYS_ioctl           29
#define SYS_mkdirat         34
#define SYS_unlinkat        35
#define SYS_linkat          37
#define SYS_umount2         39
#define SYS_mount           40
#define SYS_chdir           49
#define SYS_openat          56
#define SYS_close           57
#define SYS_pipe2           59
#define SYS_getdents64      61
#define SYS_lseek           62
#define SYS_read            63
#define SYS_write           64
#define SYS_fstat           80

// 进程
#define SYS_exit            93
#define SYS_exit_group      94
#define SYS_set_tid_address 96
#define SYS_nanosleep       101
#define SYS_sched_yield     124
#define SYS_times           153
#define SYS_uname           160
#define SYS_gettimeofday    169
#define SYS_getpid          172
#define SYS_getppid         173
#define SYS_gettid          178

// 内存
#define SYS_brk             214
#define SYS_munmap          215
#define SYS_clone           220
#define SYS_execve          221
#define SYS_mmap            222
#define SYS_mprotect        226
#define SYS_wait4           260

// ============ 调试用系统调用 (高编号避免冲突) ============
#define SYS_print           500
#define SYS_alloc_block     501
#define SYS_free_block      502
#define SYS_read_block      503
#define SYS_write_block     504
#define SYS_release_block   505
#define SYS_show_buf        506

// 旧系统调用号映射（兼容现有initcode，后续删除）
#define SYS_open_old        508
#define SYS_mkdir_old       509
#define SYS_getdir_old      510
#define SYS_link_old        511
#define SYS_unlink_old      512
#define SYS_fork_old        513
#define SYS_wait_old        514
#define SYS_exec_old        515
#define SYS_sleep_old       516

#endif
