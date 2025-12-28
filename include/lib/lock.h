#ifndef __LOCK_H__
#define __LOCK_H__

#include "common.h"

typedef struct spinlock {
    int locked;
    char* name;
    int cpuid;
} spinlock_t;

// 睡眠锁: 允许在等待时让出CPU
typedef struct sleeplock {
    spinlock_t lk;   // 内部使用的自旋锁
    char* name;      // 锁名(便于调试)
    int locked;      // 是否持有
    int pid;         // 持有该锁的进程pid
} sleeplock_t;

void push_off();
void pop_off();

void spinlock_init(spinlock_t* lk, char* name);
void spinlock_acquire(spinlock_t* lk);
void spinlock_release(spinlock_t* lk);
bool spinlock_holding(spinlock_t* lk); 

void sleeplock_init(sleeplock_t* lk, char* name);
void sleeplock_acquire(sleeplock_t* lk);
void sleeplock_release(sleeplock_t* lk);
bool sleeplock_holding(sleeplock_t* lk);

#endif
