#include "riscv.h"
#include "dev/timer.h"

void main();

// Minimal UART polling print (avoids dependency on init order)
static inline void uart_puts(const char* s)
{
  volatile uint8* thr = (uint8*)0x10000000;   // Transmit Holding Register
  volatile uint8* lsr = (uint8*)0x10000005;   // Line Status Register
  while(*s) {
    while(((*lsr) & 0x20) == 0); // wait for THR empty
    *thr = *s++;
  }
}

__attribute__ ((aligned (16))) uint8 CPU_stack[4096 * NCPU];


void start()
{
  // 在 S 模式下，OpenSBI 已经完成跳转，直接进入主内核
  int id = r_tp();   // hartid 已由 entry 保存到 tp (OpenSBI 传入 a0)
  w_tp(id);
  main();
  while(1);
}

/*取消S模式对时钟中断的委托
void
timerinit()
{
  // enable supervisor-mode timer interrupts.
  w_mie(r_mie() | MIE_STIE);
  
  // enable the sstc extension (i.e. stimecmp).
  w_menvcfg(r_menvcfg() | (1L << 63)); 
  
  // allow supervisor to use stimecmp and time.
  w_mcounteren(r_mcounteren() | 2);
  
  // ask for the very first timer interrupt.
  w_stimecmp(r_time() + 1000000);
}*/
