#include "riscv.h"
#include "lib/print.h"
#include"proc/proc.h"
#include"lib/lock.h"

volatile static int started = 0;

volatile static int sum = 0;

spinlock_t sum_lock;

int main()
{
    if(mycpuid()==0)
    {
        print_init();
        spinlock_init(&sum_lock, "sum_lock");
        printf("cpu %d is booting!\n", mycpuid());

        __sync_synchronize();

        started = 1;
        //spinlock_acquire(&sum_lock);
        for(int i = 0; i < 1000000; i++)
        {
            spinlock_acquire(&sum_lock);
            sum++;
            spinlock_release(&sum_lock);
        }
        //spinlock_release(&sum_lock);
        printf("cpu %d report: sum = %d\n", mycpuid(), sum);
    }
    else
    {
        while(started==0)
            ;

        __sync_synchronize();

        printf("cpu %d is booting!\n", mycpuid());
       // spinlock_acquire(&sum_lock);
        for(int i = 0; i < 1000000; i++)
        {
            spinlock_acquire(&sum_lock);
            sum++;
            spinlock_release(&sum_lock);
        }
        //spinlock_release(&sum_lock);
        printf("cpu %d report: sum = %d\n", mycpuid(), sum);
    }
    while (1);    
}