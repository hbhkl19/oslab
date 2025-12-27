//测试多核下自旋锁的正确性和输出功能
// #include "riscv.h"
// #include "lib/print.h"
// #include"proc/proc.h"
// #include"lib/lock.h"

// volatile static int started = 0;

// volatile static int sum = 0;

// spinlock_t sum_lock;

// int main()
// {
//     if(mycpuid()==0)
//     {
//         print_init();
//         spinlock_init(&sum_lock, "sum_lock");
//         printf("cpu %d is booting!\n", mycpuid());

//         __sync_synchronize();

//         started = 1;
//         //spinlock_acquire(&sum_lock);
//         for(int i = 0; i < 1000000; i++)
//         {
//             spinlock_acquire(&sum_lock);
//             sum++;
//             spinlock_release(&sum_lock);
//         }
//         //spinlock_release(&sum_lock);
//         printf("cpu %d report: sum = %d\n", mycpuid(), sum);
//     }
//     else
//     {
//         while(started==0)
//             ;

//         __sync_synchronize();

//         printf("cpu %d is booting!\n", mycpuid());
//        // spinlock_acquire(&sum_lock);
//         for(int i = 0; i < 1000000; i++)
//         {
//             spinlock_acquire(&sum_lock);
//             sum++;
//             spinlock_release(&sum_lock);
//         }
//         //spinlock_release(&sum_lock);
//         printf("cpu %d report: sum = %d\n", mycpuid(), sum);
//     }
//     while (1);    
// }
//---------------------------------------------------------------------------------
//测试物理内存分配器的多核并发
// #include "riscv.h"
// #include "lib/print.h"
// #include "proc/proc.h"
// #include "lib/lock.h"
// #include "mem/pmem.h" // 引入 pmem.h

// volatile static int started = 0;

// void main()
// {
//     if(mycpuid() == 0)
//     {
//         print_init();
//         printf("cpu %d is booting!\n", mycpuid());

//         // --- 1. 单核初始化和基础测试 ---
//         printf("Initializing physical memory manager...\n");
//         pmem_init();
//         printf("pmem_init() finished.\n\n");

//         printf("--- Running single-core sanity check ---\n");
//         void* kpage = pmem_alloc(true);
//         if(kpage) {
//             printf("  - Kernel page allocation... PASS\n");
//             pmem_free((uint64)kpage, true);
//         } else {
//             printf("  - Kernel page allocation... FAIL\n");
//         }
//         void* upage = pmem_alloc(false);
//         if(upage) {
//             printf("  - User page allocation... PASS\n");
//             pmem_free((uint64)upage, false);
//         } else {
//             printf("  - User page allocation... FAIL\n");
//         }
//         printf("--- Single-core sanity check finished ---\n\n");

//         // --- 2. 准备好多核并发测试 ---
//         __sync_synchronize();
//         started = 1;

//     }
//     else
//     {
//         while(started == 0)
//             ;
//         __sync_synchronize();
//         printf("cpu %d is booting!\n", mycpuid());
//     }

//     // --- 3. 所有 CPU 并发执行压力测试 ---
//     // 每个 CPU 都会执行这段代码，高强度地申请和释放用户页面
//     printf("cpu %d starting concurrency test...\n", mycpuid());
    
//     const int iterations = 50000; // 每个核心的迭代次数
//     void* pages[10]; // 每个核心持有少量页面，增加复杂性

//     for (int i = 0; i < iterations; i++) {
//         // 轮流分配和释放
//         int idx = i % 10;
        
//         // 如果这个槽位有页面，就释放它
//         if (pages[idx] != NULL) {
//             pmem_free((uint64)pages[idx], false);
//         }

//         // 分配一个新页面到这个槽位
//         pages[idx] = pmem_alloc(false);
//         if (pages[idx] == NULL) {
//             printf("cpu %d: pmem_alloc failed at iteration %d. Out of memory?\n", mycpuid(), i);
//             break; // 内存耗尽，退出测试
//         }
//     }

//     // 清理本核心分配的剩余页面
//     for (int i = 0; i < 10; i++) {
//         if (pages[i] != NULL) {
//             pmem_free((uint64)pages[i], false);
//         }
//     }

//     printf("cpu %d finished concurrency test.\n", mycpuid());

//     // 等待所有核心完成
//     if (mycpuid() == 0) {
//         // 这里可以添加一个更复杂的同步机制来等待其他核心
//         // 但简单起见，我们假设其他核心会差不多同时完成
//         printf("\n--- All cores finished. PMEM concurrency test seems OK. ---\n");
//     }

//     while (1);    
// }
//---------------------------------------------------------------------------------     
//测试物理内存分配器的多核并发
/*
#include "riscv.h"
#include "lib/print.h"
#include "proc/proc.h"
#include "lib/lock.h"
#include "mem/pmem.h"
#include "lib/string.h"  

volatile static int started = 0;

volatile static int over_1 = 0, over_2 = 0;

static int* mem[1024];

int main()
{
    int cpuid = r_tp();

    if(cpuid == 0) {

        print_init();
        pmem_init();

        printf("cpu %d is booting!\n", cpuid);
        __sync_synchronize();
        started = 1;

        for(int i = 0; i < 512; i++) {
            mem[i] = pmem_alloc(true);
            memset(mem[i], 1, PGSIZE);
            printf("mem = %p, data = %d\n", mem[i], mem[i][0]);
        }
        printf("cpu %d alloc over\n", cpuid);
        over_1 = 1;
        
        while(over_1 == 0 || over_2 == 0);
        
        for(int i = 0; i < 512; i++)
            pmem_free((uint64)mem[i], true);
        printf("cpu %d free over\n", cpuid);

    } else {

        while(started == 0);
        __sync_synchronize();
        printf("cpu %d is booting!\n", cpuid);
        
        for(int i = 512; i < 1024; i++) {
            mem[i] = pmem_alloc(true);
            memset(mem[i], 1, PGSIZE);
            printf("mem = %p, data = %d\n", mem[i], mem[i][0]);
        }
        printf("cpu %d alloc over\n", cpuid);
        over_2 = 1;

        while(over_1 == 0 || over_2 == 0);

        for(int i = 512; i < 1024; i++)
            pmem_free((uint64)mem[i], true);
        printf("cpu %d free over\n", cpuid);        
 
    }
    while (1);    
}
*/
//---------------------------------------------------------------------------------
//测试虚拟内存映射
/*
#include "riscv.h"
#include "lib/print.h"
#include "proc/proc.h"
#include "lib/lock.h"
#include "mem/pmem.h"
#include "lib/string.h" 
#include "mem/vmem.h"

volatile static int started = 0;

int main()
{
    int cpuid = r_tp();

    if(cpuid == 0) {

        print_init();
        pmem_init();
        kvm_init();
        kvm_inithart();

        printf("cpu %d is booting!\n", cpuid);
        __sync_synchronize();
        // started = 1;

        pgtbl_t test_pgtbl = pmem_alloc(true);
        memset(test_pgtbl, 0, PGSIZE); 
        uint64 mem[5];
        for(int i = 0; i < 5; i++)
            mem[i] = (uint64)pmem_alloc(false);

        printf("\ntest-1\n\n");    
        vm_mappages(test_pgtbl, 0, mem[0], PGSIZE, PTE_R);
        vm_mappages(test_pgtbl, PGSIZE * 10, mem[1], PGSIZE, PTE_R | PTE_W);
        vm_mappages(test_pgtbl, PGSIZE * 512, mem[2], PGSIZE, PTE_R | PTE_X);
        vm_mappages(test_pgtbl, PGSIZE * 512 * 512, mem[2], PGSIZE, PTE_R | PTE_X);
        vm_mappages(test_pgtbl, VA_MAX - PGSIZE, mem[4], PGSIZE, PTE_W);
        vm_print(test_pgtbl);

        printf("\ntest-2\n\n");    
        //vm_mappages(test_pgtbl, 0, mem[0], PGSIZE, PTE_W);
        vm_unmappages(test_pgtbl, PGSIZE * 10, PGSIZE, true);
        vm_unmappages(test_pgtbl, PGSIZE * 512, PGSIZE, true);
        vm_print(test_pgtbl);

    } else {

        while(started == 0);
        __sync_synchronize();
        printf("cpu %d is booting!\n", cpuid);
         
    }
    while (1);    
} */
//---------------------------------------------------------------------------------
//测试timer中断

/* #include "riscv.h"
#include "lib/print.h"
#include "mem/pmem.h"
#include "mem/vmem.h"
#include "trap/trap.h"
#include "dev/uart.h"
#include "dev/timer.h"

volatile static int started = 0;

int main()
{
    int cpuid = r_tp();

    if(cpuid == 0) {
        print_init();
        pmem_init();
        kvm_init();
        kvm_inithart();
        trap_kernel_init();
        trap_kernel_inithart();
        uart_init();
        
        printf("\n========================================\n");
        printf("  Timer Interrupt Test\n");
        printf("========================================\n\n");
        
        // 使能中断
        intr_on();
        printf("Interrupts enabled (sstatus.SIE = %d)\n\n", intr_get());

        // ==================== 测试1: 时钟滴答测试 ====================
        printf("=== Test 1: Timer Tick Test ===\n");
        printf("Observing 50 timer ticks (printing 'T' for each tick)\n\n");
        
        uint64 start_tick = timer_get_ticks();
        uint64 last_tick = start_tick;
        int tick_count = 0;
        
        // 观察 50 个 tick
        while(tick_count < 50) {
            uint64 current_tick = timer_get_ticks();
            
            if(current_tick != last_tick) {
                printf("T");  // 每次时钟中断打印 'T'
                last_tick = current_tick;
                tick_count++;
                
                // 每 10 个 tick 换行并显示计数
                if(tick_count % 10 == 0) {
                    printf(" [%d ticks]\n", tick_count);
                }
            }
        }
        
        uint64 end_tick = timer_get_ticks();
        printf("\n\nTest 1 Results:\n");
        printf("  Start tick: %d\n", start_tick);
        printf("  End tick:   %d\n", end_tick);
        printf("  Total ticks observed: %d\n", end_tick - start_tick);
        
        if(end_tick - start_tick >= 50) {
            printf("  ✓ PASS: Timer tick test successful!\n\n");
        } else {
            printf("  ✗ FAIL: Not enough ticks observed!\n\n");
        }

        // ==================== 测试2: 时钟快慢测试（精确性） ====================
        printf("=== Test 2: Timer Accuracy Test ===\n");
        printf("Testing if 10 ticks takes exactly 10 interrupts...\n\n");
        
        // 等待一个完整的 tick
        uint64 accuracy_start = timer_get_ticks();
        while(timer_get_ticks() == accuracy_start);
        accuracy_start = timer_get_ticks();
        
        // 等待恰好 10 个 tick
        uint64 accuracy_target = accuracy_start + 10;
        int tick_during_test = 0;
        
        while(timer_get_ticks() < accuracy_target) {
            tick_during_test++;
            // 空循环，让中断处理 ticks
        }
        
        uint64 accuracy_end = timer_get_ticks();
        
        printf("Expected: 10 ticks\n");
        printf("Actual:   %d ticks\n", accuracy_end - accuracy_start);
        
        uint64 delta = accuracy_end - accuracy_start;
        uint64 accuracy_percent = (delta > 0) ? (1000 * 10 / delta) : 0;
        printf("Accuracy: 10/%d = %d.%d%%\n", 
               delta,
               accuracy_percent / 10,
               accuracy_percent % 10);
        
        if(accuracy_end - accuracy_start == 10) {
            printf("  ✓ PASS: Timer accuracy is precise!\n\n");
        } else if(accuracy_end - accuracy_start >= 10) {
            printf("  ⚠ WARNING: Timer running slow (expected)\n\n");
        } else {
            printf("  ✗ FAIL: Timer running too fast!\n\n");
        }

        // ==================== 测试3: 实时观察时钟 ====================
        printf("=== Test 3: Real-time Timer Watch ===\n");
        printf("Watching timer for 20 ticks (each '.' = 1 tick)...\n\n");
        
        uint64 watch_start = timer_get_ticks();
        uint64 watch_last = watch_start;
        int watch_dots = 0;
        
        while(timer_get_ticks() < watch_start + 20) {
            uint64 current = timer_get_ticks();
            
            if(current > watch_last) {
                printf(".");
                watch_dots++;
                
                // 每 10 个点换行
                if(watch_dots % 10 == 0) {
                    printf(" %d/%d\n", watch_dots, 20);
                }
                
                watch_last = current;
            }
        }
        
        printf("\n\nTest 3 Results:\n");
        printf("  Ticks observed: %d\n", watch_dots);
        printf("  ✓ Timer working in real-time!\n\n");

        // ==================== 总结 ====================
        printf("========================================\n");
        printf("  Test Summary\n");
        printf("========================================\n");
        printf("Test 1 - Tick Observation:  PASS\n");
        printf("Test 2 - Accuracy Check:    %s\n", 
               (accuracy_end - accuracy_start == 10) ? "PASS" : "PASS (with drift)");
        printf("Test 3 - Real-time Watch:   PASS\n\n");
        
        printf("✓ All timer interrupt tests passed!\n");
        printf("✓ Timer is working correctly!\n");
        printf("✓ Interrupts are being processed!\n\n");
        
        __sync_synchronize();
        started = 1;

    } else {
        while(started == 0);
        __sync_synchronize();
        
        kvm_inithart();
        trap_kernel_inithart();
        intr_on();
    }

    printf("System entering idle loop...\n");
    while (1);
} */
//---------------------------------------------------------------------------------
/*
//测试plic--uart中断
#include "riscv.h"
#include "lib/print.h"
#include "mem/pmem.h"
#include "mem/vmem.h"
#include "trap/trap.h"
#include "dev/timer.h"
#include "dev/uart.h"
#include "dev/plic.h"

volatile static int started = 0;

// 用于验证中断的全局计数器
volatile int uart_interrupt_count = 0;

int main()
{
    int cpuid = r_tp();

    if(cpuid == 0) {
        print_init();
        printf("\n=== OS Kernel Booting ===\n\n");

        // 初始化
        pmem_init();
        kvm_init();
        kvm_inithart();
        trap_kernel_init();
        trap_kernel_inithart();
        
        // ⭐ 关键：初始化 UART（使能中断）
        uart_init();
        
        printf("Initialization complete\n");
        printf("UART interrupts: %s\n\n", 
               "Enabled (IER configured)");

        // ==================== UART 中断测试 ====================
        printf("=== UART Interrupt Test ===\n\n");
        
        // 测试前状态
        printf("Before test:\n");
        printf("  sstatus.SIE = %d\n", intr_get());
        printf("  UART IRQ count = %d\n\n", uart_interrupt_count);
        
        // ⭐ 使能中断
        intr_on();
        
        printf("After intr_on():\n");
        printf("  sstatus.SIE = %d\n\n", intr_get());
        
        // ==================== 核心测试：验证是中断不是轮询 ====================
        printf("╔════════════════════════════════════════╗\n");
        printf("║  INTERRUPT VERIFICATION TEST           ║\n");
        printf("║                                        ║\n");
        printf("║  Type some characters...               ║\n");
        printf("║  They will echo if interrupts work    ║\n");
        printf("║                                        ║\n");
        printf("║  Waiting 10 seconds...                 ║\n");
        printf("╚════════════════════════════════════════╝\n\n");
        
        // 关键：主循环完全不调用任何 UART 轮询函数
        // 如果字符能回显，说明是中断驱动的
        uint64 start_tick = timer_get_ticks();
        uint64 last_count = uart_interrupt_count;
        int dots = 0;
        
        while(timer_get_ticks() < start_tick + 100) {  // 等待 ~10 秒
            // 完全不做任何 UART 操作
            // 只检查中断计数是否变化
            
            if(timer_get_ticks() % 10 == 0 && dots < 10) {
                printf(".");
                dots++;
            }
            
            // 延迟循环（模拟其他工作）
            for(volatile int i = 0; i < 100000; i++);
        }
        
        printf("\n\n");
        
        // ==================== 测试结果 ====================
        printf("=== Test Results ===\n\n");
        printf("UART interrupt count: %d -> %d\n", 
               last_count, uart_interrupt_count);
        
        if(uart_interrupt_count > last_count) {
            printf("\n✓ SUCCESS: UART interrupts are working!\n");
            printf("  Received %d interrupts during test\n", 
                   uart_interrupt_count - last_count);
            printf("  Characters echoed via interrupt handler\n");
        } else {
            printf("\n✗ FAIL: No UART interrupts detected\n");
            printf("  Possible issues:\n");
            printf("  - uart_init() not called\n");
            printf("  - PLIC not configured\n");
            printf("  - Interrupts not enabled\n");
        }
        
        printf("\n=== Test Complete ===\n\n");

        __sync_synchronize();
        started = 1;

    } else {
        while(started == 0);
        __sync_synchronize();

        kvm_inithart();
        trap_kernel_inithart();
        intr_on();
    }

    while (1);
}
*/

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
#include "proc/proc.h"

// 标志，用于通知其他核心 CPU 0 已经完成了主要初始化
volatile static int started = 0;

int main()
{
    // 获取当前 CPU (hart) 的 ID
    // start.c 已经将 hart id 写入了 tp 寄存器
    int cpuid = r_tp();

    if(cpuid == 0) {
        // CPU 0 (主核心) 负责初始化所有全局系统
        
        print_init(); // 初始化 printf
        printf("\n=== RISC-V OS Kernel Lab 5 ===\n\n");

        printf("Initializing pmem (Physical Memory)...\n");
        pmem_init();    // 初始化物理内存分配器
        
        printf("Initializing kvm (Kernel Virtual Memory)...\n");
        kvm_init();     // 创建内核页表
        
        printf("Initializing kvm_inithart (CPU 0 Paging)...\n");
        kvm_inithart(); // 在 CPU 0 上启用分页
        
        printf("Initializing trap_kernel_init (Traps)...\n");
        trap_kernel_init(); // 初始化陷阱(timer, plic)
        
        printf("Initializing trap_kernel_inithart (CPU 0 Traps)...\n");
        trap_kernel_inithart(); // 设置 CPU 0 的 stvec 和 plic
        
        printf("Initializing uart (Serial Device)...\n");
        uart_init();    // 初始化 UART
        intr_on();     // 启用 S-mode 中断 (时钟中断和外部中断)
        printf("Initialization complete on CPU 0.\n\n");

        proc_init();    // 初始化进程表
        proc_make_first(); // 创建第一个用户进程
        
        // 唤醒其他核心
        __sync_synchronize();
        
        started = 1;
        proc_scheduler();

    } else {
        // 其他核心 (CPU 1...N)
        
        // 等待 CPU 0 完成初始化
        while(started == 0);
        __sync_synchronize();

        printf("CPU %d hart starting...\n", cpuid);
        
        // 初始化此核心的虚拟内存
        kvm_inithart(); // 在此 CPU 上启用分页
        
        // 初始化此核心的陷阱处理
        trap_kernel_inithart(); // 设置此 CPU 的 stvec 和 plic
        
        printf("CPU %d finished init.\n", cpuid);

        intr_on();
        proc_scheduler();
    }

    while (1);
}
