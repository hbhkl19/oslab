#include "proc/cpu.h"
#include "riscv.h"
#include "lib/lock.h"
static cpu_t cpus[NCPU];

cpu_t* mycpu(void)
{
  int id = r_tp();
  return &cpus[id];
}

int mycpuid(void) 
{
  int id = r_tp();
  return id;
}

proc_t* myproc(void)
{
    push_off();
    cpu_t* c = mycpu();    
    proc_t* p = c->proc;   
    pop_off();             
    return p;
}