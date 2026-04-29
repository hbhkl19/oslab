//测试初始进程
/*
 * main.c
 * 内核主入口
 * 负责初始化所有子系统并启动第一个进程
 */

#include "riscv.h"
#include "lib/print.h"
#include "mem/pmem.h"
#include "mem/vmem.h"
#include "trap/trap.h"
#include "dev/timer.h"
#include "dev/uart.h"
#include "dev/plic.h"
#include "dev/vio.h"
#include "fs/fs.h"
#include "fs/file.h"
#include "fs/fat32.h"
#include "fs/tmpfs.h"
#include "proc/proc.h"

// 标志，用于通知其他核心初始化已完成
volatile static int started = 0;
volatile static int boot_hart = -1;

int main()
{
    // 获取当前 CPU (hart) 的 ID
    // start.c 已经将 hart id 写入了 tp 寄存器
    int cpuid = r_tp();

    if(__sync_bool_compare_and_swap(&boot_hart, -1, cpuid)) {
        // 第一个进入 main 的 hart 负责初始化所有全局系统
        
        print_init(); // 初始化 printf
        DEBUG_LOG("\n=== RISC-V OS Kernel Lab 6 ===\n\n");

        DEBUG_LOG("Initializing pmem (Physical Memory)...\n");
        pmem_init();    // 初始化物理内存分配器
        
        DEBUG_LOG("Initializing kvm (Kernel Virtual Memory)...\n");
        kvm_init();     // 创建内核页表
        
        DEBUG_LOG("Initializing kvm_inithart (boot hart paging)...\n");
        kvm_inithart(); // 在 boot hart 上启用分页

        DEBUG_LOG("Initializing trap_kernel_init (Traps)...\n");
        trap_kernel_init(); // 初始化陷阱(timer, plic)

        DEBUG_LOG("Initializing trap_kernel_inithart (boot hart traps)...\n");
        trap_kernel_inithart(); // 设置 boot hart 的 stvec 和 plic
        
        DEBUG_LOG("Initializing uart (Serial Device)...\n");
        uart_init();    // 初始化 UART
        DEBUG_LOG("Initializing virtio_disk (Disk Device)...\n");
        virtio_disk_init(); // 初始化磁盘
        DEBUG_LOG("Enabling interrupts before FS init...\n");
        intr_on();     // 需要中断支持virtio完成磁盘IO
        
        // 初始化 buf 缓存
        extern void buf_init();
        buf_init();
        
        DEBUG_LOG("Initializing FAT32 file system...\n");
        if(fat32_init() == 0) {
            file_init();    // 初始化文件表和设备列表
            tmpfs_init();   // 初始化内存文件系统
            fat32_list_root();  // 列出根目录 (调试)
            
            // 测试读取文件
            fat32_test_read_file("/text.txt");   // 测试读取文本文件
            fat32_test_read_file("/brk");        // 测试读取短文件名 ELF
            fat32_test_read_file("/gettimeofday"); // 测试长文件名
            
            DEBUG_LOG("\nFAT32 test complete. Continuing to boot...\n");
        } else {
            // FAT32 初始化失败，尝试原来的文件系统
            DEBUG_LOG("FAT32 init failed, trying simple fs...\n");
            fs_init();
            file_init();
        }
        
        DEBUG_LOG("Initialization complete on boot hart %d.\n\n", cpuid);

        proc_init();    // 初始化进程表
        proc_make_first(); // 创建第一个用户进程
        
        // 唤醒其他核心
        __sync_synchronize();
        
        started = 1;
        proc_scheduler();

    } else {
        // 其他核心 (CPU 1...N)
        
        // 等待 boot hart 完成初始化
        while(started == 0);
        __sync_synchronize();

        DEBUG_LOG("CPU %d hart starting...\n", cpuid);
        
        // 初始化此核心的虚拟内存
        kvm_inithart(); // 在此 CPU 上启用分页
        
        // 初始化此核心的陷阱处理
        trap_kernel_inithart(); // 设置此 CPU 的 stvec 和 plic
        
        DEBUG_LOG("CPU %d finished init.\n", cpuid);

        intr_on();
        proc_scheduler();
    }

    while (1);
}
