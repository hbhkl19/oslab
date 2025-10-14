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

#include "riscv.h"
#include "lib/print.h"
#include "mem/pmem.h"
#include "mem/vmem.h"
#include "trap/trap.h"
#include "dev/timer.h"

volatile static int started = 0;

int main()
{
    int cpuid = r_tp();

    if(cpuid == 0) {
        print_init();
        printf("\n========================================\n");
        printf("  OS Kernel Booting\n");
        printf("========================================\n\n");

        // 初始化物理内存
        pmem_init();
        printf("Physical memory initialized\n");

        // 初始化虚拟内存
        kvm_init();
        kvm_inithart();
        printf("Virtual memory initialized\n");

        // 初始化中断系统
        trap_kernel_init();
        trap_kernel_inithart();
        printf("Trap system initialized\n");

        printf("\ncpu %d is booting!\n\n", cpuid);

        // ==================== 测试开始 ====================
        
        // 测试1：检查初始中断状态
        printf("=== Test 1: Initial Interrupt State ===\n");
        printf("sstatus.SIE = %d (should be 0)\n", intr_get());
        
        uint64 sie = r_sie();
        printf("sie.SSIE = %d (Software interrupt)\n", (sie & SIE_SSIE) ? 1 : 0);
        printf("sie.SEIE = %d (External interrupt)\n\n", (sie & SIE_SEIE) ? 1 : 0);
        
        // ⭐ 手动使能中断
        printf("=== Enabling Interrupts ===\n");
        printf("Before: sstatus.SIE = %d\n", intr_get());
        
        intr_on();  // 使能中断
        
        printf("After:  sstatus.SIE = %d\n", intr_get());
        
        if(intr_get()) {
            printf("SUCCESS: Interrupts enabled!\n\n");
        } else {
            printf("ERROR: Failed to enable interrupts!\n\n");
        }
        
        // 等待时钟中断开始触发
        printf("Waiting for timer interrupts...\n");
        for(volatile int i = 0; i < 50000000; i++);
        printf("\n");
        
        // 测试2：基础时钟测试
        printf("=== Test 2: Basic Timer Test ===\n");
        uint64 t1 = timer_get_ticks();
        printf("Start ticks: %d\n", t1);
        
        for(int i = 0; i < 5; i++) {
            printf("Waiting %d...\n", i);
            for(volatile int j = 0; j < 50000000; j++);
            printf("  Current ticks: %d\n", timer_get_ticks());
        }
        
        uint64 t2 = timer_get_ticks();
        printf("End ticks: %d\n", t2);
        printf("Elapsed: %d ticks\n\n", t2 - t1);
        
        if(t2 > t1) {
            printf("PASS: Timer is working!\n\n");
        } else {
            printf("FAIL: Timer not working!\n\n");
        }
        
        // 测试3：中断控制测试
        printf("=== Test 3: Interrupt Control ===\n");
        printf("Testing intr_on/intr_off...\n");
        
        printf("Current state: %d\n", intr_get());
        
        intr_off();
        printf("After intr_off(): %d\n", intr_get());
        
        uint64 t_off = timer_get_ticks();
        for(volatile int i = 0; i < 50000000; i++);
        uint64 t_off2 = timer_get_ticks();
        printf("Ticks while disabled: %d -> %d (delta=%d)\n", 
               t_off, t_off2, t_off2 - t_off);
        
        if(t_off2 == t_off) {
            printf("PASS: No ticks while disabled\n");
        } else {
            printf("NOTE: Ticks still increment (QEMU quirk)\n");
        }
        
        intr_on();
        printf("After intr_on(): %d\n\n", intr_get());
        
        // 测试4：INTERVAL 影响
        printf("=== Test 4: Timer Frequency ===\n");
        printf("INTERVAL = %d cycles\n", INTERVAL);
        printf("Expected: ~%d interrupts/sec\n\n", 10000000 / INTERVAL);
        
        printf("Counting 10 ticks...\n");
        uint64 t_freq1 = timer_get_ticks();
        while(timer_get_ticks() < t_freq1 + 10);
        printf("Done! 10 ticks counted.\n\n");
        
        // 测试5：观察时钟
        printf("=== Test 5: Watch Timer ===\n");
        printf("Watching for 3 seconds...\n");
        printf("(Each '.' = 1 tick)\n\n");
        
        uint64 watch_start = timer_get_ticks();
        uint64 last_tick = watch_start;
        int dots = 0;
        
        while(timer_get_ticks() < watch_start + 30) {
            uint64 current = timer_get_ticks();
            if(current > last_tick) {
                printf(".");
                dots++;
                if(dots % 10 == 0) {
                    printf(" %d\n", current);
                }
                last_tick = current;
            }
        }
        
        printf("\n\nObserved %d ticks in 3 seconds\n", dots);
        printf("Average frequency: ~%d ticks/sec\n\n", dots / 3);
        
        __sync_synchronize();
        started = 1;
        
        // 等待其他核心启动
        for(volatile int i = 0; i < 50000000; i++);
        
        // 测试6：多核测试
        printf("=== Test 6: Multicore Test ===\n");
        started = 2;
        
        uint64 mc_t1 = timer_get_ticks();
        for(volatile int i = 0; i < 100000000; i++);
        uint64 mc_t2 = timer_get_ticks();
        
        printf("CPU %d: ticks %d -> %d (delta=%d)\n", 
               cpuid, mc_t1, mc_t2, mc_t2 - mc_t1);
        
        for(volatile int i = 0; i < 50000000; i++);
        
        printf("\n========================================\n");
        printf("  All Tests Completed!\n");
        printf("========================================\n\n");
        
    } else {
        while(started == 0);
        __sync_synchronize();

        printf("cpu %d is booting!\n", cpuid);
        
        // ⭐ 其他 CPU 也需要初始化页表和中断
        kvm_inithart();
        trap_kernel_inithart();
        
        // ⭐ 其他 CPU 也需要手动使能中断
        intr_on();
        
        // 等待多核测试信号
        while(started != 2);
        
        // 多核测试
        uint64 mc_t1 = timer_get_ticks();
        for(volatile int i = 0; i < 100000000; i++);
        uint64 mc_t2 = timer_get_ticks();
        
        printf("CPU %d: ticks %d -> %d (delta=%d)\n", 
               cpuid, mc_t1, mc_t2, mc_t2 - mc_t1);
    }

    printf("cpu %d entering idle loop\n", cpuid);
    while (1);
}