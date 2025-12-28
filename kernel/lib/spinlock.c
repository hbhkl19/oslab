#include "lib/lock.h"
#include "lib/print.h"
#include "proc/proc.h"
#include "proc/cpu.h"
#include "riscv.h"
#include "dev/uart.h"

static void uart_puts(const char* s)
{
    while(*s) uart_putc_sync(*s++);
}

static void uart_print_uint(uint64 x)
{
    char buf[32];
    int i = 0;
    if(x == 0) {
        uart_putc_sync('0');
        return;
    }
    while(x && i < (int)sizeof(buf)) {
        buf[i++] = '0' + (x % 10);
        x /= 10;
    }
    while(i > 0) {
        uart_putc_sync(buf[--i]);
    }
}

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
  if(lk == NULL)
    return false;
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

// 获取自旋锁
void spinlock_acquire(spinlock_t *lk)
{    
  if(lk == NULL) {
    uint64 ra = (uint64)__builtin_return_address(0);
    printf("spinlock_acquire: lk is NULL (ra=%p)\n", ra);
    panic("spinlock_acquire: lk is NULL");
  }
  push_off(); // 关中断
  if(spinlock_holding(lk)) {
    // 重入获取同一把锁，直接报出锁名便于定位（用uart避免递归加锁）
    uart_puts("LOCK ");
    uart_puts(lk->name ? lk->name : "(null)");
    uart_puts(" cpu ");
    uart_print_uint(mycpuid());
    uart_puts(" holder ");
    uart_print_uint(lk->cpuid);
    uart_puts(" pid ");
    proc_t* p = myproc();
    if(p)
        uart_print_uint(p->pid);
    else
        uart_puts("none");
    uart_putc_sync('\n');
    panic("acquire_lock_twice");
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

/*-------------------------- 睡眠锁 ----------------------------*/

// 初始化睡眠锁
void sleeplock_init(sleeplock_t* lk, char* name)
{
    spinlock_init(&lk->lk, "sleeplock");
    lk->name = name;
    lk->locked = 0;
    lk->pid = 0;
}

// 获取睡眠锁(等待时会睡眠)
void sleeplock_acquire(sleeplock_t* lk)
{
    spinlock_acquire(&lk->lk);
    while(lk->locked) {
        proc_sleep(lk, &lk->lk);
    }
    lk->locked = 1;
    proc_t* p = myproc();
    lk->pid = p ? p->pid : -1;
    spinlock_release(&lk->lk);
}

// 释放睡眠锁
void sleeplock_release(sleeplock_t* lk)
{
    spinlock_acquire(&lk->lk);
    lk->locked = 0;
    lk->pid = 0;
    proc_wakeup(lk);
    spinlock_release(&lk->lk);
}

// 是否持有睡眠锁
bool sleeplock_holding(sleeplock_t* lk)
{
    return lk->locked && lk->pid == (myproc() ? myproc()->pid : -1);
}
