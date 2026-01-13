// 标准输出和报错机制
#include <stdarg.h>
#include "lib/print.h"
#include "lib/lock.h"
#include "dev/uart.h"
#include"riscv.h"  // 包含 push_off 的定义

volatile int panicking = 0; // printing a panic message
volatile int panicked = 0;
int debug_log_enabled = 0; // runtime debug print switch (0: off by default)

static spinlock_t print_lk;

static char digits[] = "0123456789abcdef";

// 内部函数：打印一个整数
static void printint(long long xx, int base, int sign)
{
  char buf[20];
  int i;
  unsigned long long x;
  int neg=0;

  if(sign && (xx < 0)) {
    x = -xx;
    neg=1;
  } else {
    x = xx;
  }

  i = 0;
  do {
    buf[i++] = digits[x % base];
  } while((x /= base) != 0);

  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    uart_putc_sync(buf[i]);
}

// 内部函数：打印一个指针
static void printptr(uint64 x)
{
  int i;
  uart_putc_sync('0');
  uart_putc_sync('x');
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    uart_putc_sync(digits[x >> (sizeof(uint64) * 8 - 4)]);
}


void print_init(void)
{
    spinlock_init(&print_lk, "pr");
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
  va_list ap;
  int i, cx, c0, c1, c2;
  char *s;

  if(panicking == 0)
    spinlock_acquire(&print_lk);

  va_start(ap, fmt);
  for(i = 0; (cx = fmt[i] & 0xff) != 0; i++){
    if(cx != '%'){
      uart_putc_sync(cx); // 修改点: consputc -> uart_putc_sync
      continue;
    }
    i++;
    c0 = fmt[i+0] & 0xff;
    c1 = c2 = 0;
    if(c0) c1 = fmt[i+1] & 0xff;
    if(c1) c2 = fmt[i+2] & 0xff;
    if(c0 == 'd'){
      printint(va_arg(ap, int), 10, 1);
    } else if(c0 == 'l' && c1 == 'd'){
      printint(va_arg(ap, long), 10, 1);
      i += 1;
    } else if(c0 == 'l' && c1 == 'l' && c2 == 'd'){
      printint(va_arg(ap, long long), 10, 1);
      i += 2;
    } else if(c0 == 'u'){
      printint(va_arg(ap, uint32), 10, 0);
    } else if(c0 == 'l' && c1 == 'u'){
      printint(va_arg(ap, unsigned long), 10, 0);
      i += 1;
    } else if(c0 == 'l' && c1 == 'l' && c2 == 'u'){
      printint(va_arg(ap, uint64), 10, 0);
      i += 2;
    } else if(c0 == 'x'){
      printint(va_arg(ap, uint32), 16, 0);
    } else if(c0 == 'l' && c1 == 'x'){
      printint(va_arg(ap, unsigned long), 16, 0);
      i += 1;
    } else if(c0 == 'l' && c1 == 'l' && c2 == 'x'){
      printint(va_arg(ap, uint64), 16, 0);
      i += 2;
    } else if(c0 == 'p'){
      printptr(va_arg(ap, uint64));
    } else if(c0 == 'c'){
      uart_putc_sync(va_arg(ap, int));
    } else if(c0 == 's'){
      if((s = va_arg(ap, char*)) == 0)
        s = "(null)";
      for(; *s; s++)
        uart_putc_sync(*s); 
    } else if(c0 == '%'){
      uart_putc_sync('%');
    } else if(c0 == 0){
      break;
    } else {
      // Print unknown % sequence to draw attention.
      uart_putc_sync('%'); 
      uart_putc_sync(c0); 
    }

  }
  va_end(ap);

  if(panicking == 0)
    spinlock_release(&print_lk);

}

void panic(const char *s)
{
  push_off();  
  // 阶段1：进入“正在崩溃”状态，让printf绕过锁
  panicking = 1;
  
  printf("panic: %s\n", s);
  
  // 阶段2：进入“已崩溃”状态，冻结所有其他CPU的输出
  panicked = 1; 
  
  for(;;) // 进入死循环，冻结当前CPU
    ;
}

void assert(bool condition, const char* warning)
{
  if (!condition) {
    panic(warning);
  }
}
