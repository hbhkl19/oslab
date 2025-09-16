#include "riscv.h"
#include "lib/print.h"
#include"proc/proc.h"

volatile static int started = 0;

int main()
{
    if(mycpuid()==0)
    {
        print_init();
        printf("cpu %d is booting!\n", mycpuid());

        __sync_synchronize();

        started = 1;
    }
    else
    {
        while(started==0)
            ;

        __sync_synchronize();

        printf("cpu %d is booting!\n", mycpuid());
    }
    while (1);    
}