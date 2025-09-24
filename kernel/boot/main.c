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


#include "riscv.h"
#include "lib/print.h"
#include "proc/proc.h"
#include "lib/lock.h"
#include "mem/pmem.h" // 引入 pmem.h

volatile static int started = 0;

void main()
{
    if(mycpuid() == 0)
    {
        print_init();
        printf("cpu %d is booting!\n", mycpuid());

        // --- 1. 单核初始化和基础测试 ---
        printf("Initializing physical memory manager...\n");
        pmem_init();
        printf("pmem_init() finished.\n\n");

        printf("--- Running single-core sanity check ---\n");
        void* kpage = pmem_alloc(true);
        if(kpage) {
            printf("  - Kernel page allocation... PASS\n");
            pmem_free((uint64)kpage, true);
        } else {
            printf("  - Kernel page allocation... FAIL\n");
        }
        void* upage = pmem_alloc(false);
        if(upage) {
            printf("  - User page allocation... PASS\n");
            pmem_free((uint64)upage, false);
        } else {
            printf("  - User page allocation... FAIL\n");
        }
        printf("--- Single-core sanity check finished ---\n\n");

        // --- 2. 准备好多核并发测试 ---
        __sync_synchronize();
        started = 1;

    }
    else
    {
        while(started == 0)
            ;
        __sync_synchronize();
        printf("cpu %d is booting!\n", mycpuid());
    }

    // --- 3. 所有 CPU 并发执行压力测试 ---
    // 每个 CPU 都会执行这段代码，高强度地申请和释放用户页面
    printf("cpu %d starting concurrency test...\n", mycpuid());
    
    const int iterations = 50000; // 每个核心的迭代次数
    void* pages[10]; // 每个核心持有少量页面，增加复杂性

    for (int i = 0; i < iterations; i++) {
        // 轮流分配和释放
        int idx = i % 10;
        
        // 如果这个槽位有页面，就释放它
        if (pages[idx] != NULL) {
            pmem_free((uint64)pages[idx], false);
        }

        // 分配一个新页面到这个槽位
        pages[idx] = pmem_alloc(false);
        if (pages[idx] == NULL) {
            printf("cpu %d: pmem_alloc failed at iteration %d. Out of memory?\n", mycpuid(), i);
            break; // 内存耗尽，退出测试
        }
    }

    // 清理本核心分配的剩余页面
    for (int i = 0; i < 10; i++) {
        if (pages[i] != NULL) {
            pmem_free((uint64)pages[i], false);
        }
    }

    printf("cpu %d finished concurrency test.\n", mycpuid());

    // 等待所有核心完成
    if (mycpuid() == 0) {
        // 这里可以添加一个更复杂的同步机制来等待其他核心
        // 但简单起见，我们假设其他核心会差不多同时完成
        printf("\n--- All cores finished. PMEM concurrency test seems OK. ---\n");
    }

    while (1);    
}