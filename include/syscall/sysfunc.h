#ifndef __SYSFUNC_H__
#define __SYSFUNC_H__

#include "common.h"
#include "fs/file.h"

// ============ 辅助函数 ============
int fd_alloc(file_t* file);   // 分配文件描述符

// ============ 进程相关 ============
uint64 sys_clone();       // 220 - 创建进程 (替代fork)
uint64 sys_fork();        // 兼容旧接口
uint64 sys_exec();        // 221 - execve
uint64 sys_wait4();       // 260 - 等待子进程
uint64 sys_wait();        // 兼容旧接口
uint64 sys_exit();        // 93/94 - 退出
uint64 sys_getpid();      // 172 - 获取进程ID
uint64 sys_getppid();     // 173 - 获取父进程ID
uint64 sys_gettid();      // 178 - 获取线程ID
uint64 sys_sched_yield(); // 124 - 让出CPU
uint64 sys_nanosleep();   // 101 - 睡眠
uint64 sys_sleep();       // 兼容旧接口
uint64 sys_set_tid_address(); // 96

// ============ 时间相关 ============
uint64 sys_gettimeofday(); // 169
uint64 sys_times();        // 153

// ============ 系统信息 ============
uint64 sys_uname();        // 160

// ============ 内存相关 ============
uint64 sys_brk();          // 214
uint64 sys_mmap();         // 222
uint64 sys_munmap();       // 215
uint64 sys_mprotect();     // 226

// ============ 文件系统相关 ============
uint64 sys_openat();       // 56 - 打开文件 (替代open)
uint64 sys_open();         // 兼容旧接口
uint64 sys_close();        // 57
uint64 sys_read();         // 63
uint64 sys_write();        // 64
uint64 sys_lseek();        // 62
uint64 sys_dup();          // 23
uint64 sys_dup3();         // 24 - dup带flags
uint64 sys_fstat();        // 80
uint64 sys_getcwd();       // 17 - 获取当前目录
uint64 sys_chdir();        // 49
uint64 sys_mkdirat();      // 34 - 创建目录 (替代mkdir)
uint64 sys_mkdir();        // 兼容旧接口
uint64 sys_unlinkat();     // 35 - 删除文件 (替代unlink)
uint64 sys_unlink();       // 兼容旧接口
uint64 sys_linkat();       // 37 - 硬链接 (替代link)
uint64 sys_link();         // 兼容旧接口
uint64 sys_getdents64();   // 61 - 读目录项
uint64 sys_getdir();       // 兼容旧接口
uint64 sys_pipe2();        // 59 - 管道
uint64 sys_mount();        // 40
uint64 sys_umount2();      // 39
uint64 sys_fcntl();        // 25
uint64 sys_ioctl();        // 29

// ============ 调试相关 ============
uint64 sys_print();
uint64 sys_alloc_block();
uint64 sys_free_block();
uint64 sys_read_block();
uint64 sys_write_block();
uint64 sys_release_block();
uint64 sys_show_buf();

#endif
