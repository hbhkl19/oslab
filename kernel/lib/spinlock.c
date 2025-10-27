#include "lib/lock.h"
#include "lib/print.h"
#include "proc/proc.h"
#include "proc/cpu.h"
#include "riscv.h"

// 带层数叠加的关中断--当前允许中断
void push_off(void)
{
  int old = intr_get();

  // disable interrupts to prevent an involuntary context
  // switch while using mycpu().
  intr_off();

  if(mycpu()->noff == 0)
    mycpu()->origin = old;
  mycpu()->noff += 1;
}

// 带层数叠加的开中断--当前不允许中断
void pop_off(void)
{
  struct cpu *c = mycpu();
  if(intr_get())
    panic("pop_off - interruptible");
  if(c->noff < 1)
    panic("pop_off");
  c->noff -= 1;
  if(c->noff == 0 && c->origin)
    intr_on();
}

// 是否持有自旋锁
// 中断应当是关闭的
bool spinlock_holding(spinlock_t *lk)
{
  int r;
  r=(lk->locked && lk->cpuid==mycpuid());
  return r;
}

// 自选锁初始化
void spinlock_init(spinlock_t *lk, char *name)
{
  lk->name=name;
  lk->locked=0;
  lk->cpuid=-1;
}

// spinlock.c


static int strcmp_simple(const char *s1, const char *s2) {
    while (*s1 && (*s1 == *s2)) {
        s1++;
        s2++;
    }
    return *(const unsigned char*)s1 - *(const unsigned char*)s2;
}


// 获取自旋锁
void spinlock_acquire(spinlock_t *lk)
{    
  push_off(); // 关中断
  if(spinlock_holding(lk)) {
    // === 调试代码开始 ===
    // 通过比较锁的名称，让 panic 信息更具体
    if (strcmp_simple(lk->name, "pr") == 0) {
        panic("acquire_print_lock"); // panic 来自 printf
    } else if (strcmp_simple(lk->name, "sum_lock") == 0) {
        panic("acquire_sum_lock"); // panic 来自 for 循环
    } else {
        panic("acquire_unknown_lock");
    }
    // === 调试代码结束 ===
  }

  // 自旋等待锁
    while(__sync_lock_test_and_set(&lk->locked, 1) != 0)
    ;
  __sync_synchronize(); // 内存屏障，防止重排序

  // 成功获取锁
  lk->cpuid=mycpuid();
}


// 释放自旋锁
void spinlock_release(spinlock_t *lk)
{
  if(!spinlock_holding(lk))
    panic("release");

  lk->cpuid=-1;

  // 释放锁
  __sync_synchronize(); // 内存屏障，防止重排序
  __sync_lock_release(&lk->locked);

  pop_off(); // 开中断
}