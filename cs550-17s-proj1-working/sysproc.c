#include "types.h"
#include "x86.h"
#include "defs.h"
#include "date.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"

int ticketp = 0, stridep = 0;

int
transfer_tickets(int pid, int tickets){
  int ret = 0;
  argint(0,&pid);
  argint(1,&tickets);
  if(tickets < 0)
    return -1;
  ret = transferTickets(pid,tickets); 
  return ret;
}

int
tickets_owned(void){
  ticketp = STRIDE_TOTAL_TICKETS/countActiveProcess();
  stridep = STRIDE_TOTAL_TICKETS/ticketp;
  setTicketValue(ticketp); 
  setStrideValue(stridep);
  return 0;
}

int
set_sched(int sched){
  argint(0,&sched);
  if(sched == 1){
  	runScheduler = 1;
  }else{
  	runScheduler = 0;
  }
  return 0;
}

int
fork_winner(int w){
  argint(0,&w);
  raceWinner = w;
  return 0;
}

int 
sys_halt_now(void){
  outw(0xB004, 0x0|0x2000);
  return 0;
}


int
sys_fork(void)
{
  return fork();
}

int
sys_exit(void)
{
  exit();
  return 0;  // not reached
}

int
sys_wait(void)
{
  return wait();
}

int
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
  return kill(pid);
}

int
sys_getpid(void)
{
  return proc->pid;
}

int
sys_sbrk(void)
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = proc->sz;
  if(growproc(n) < 0)
    return -1;
  return addr;
}

int
sys_sleep(void)
{
  int n;
  uint ticks0;
  
  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
    if(proc->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
  uint xticks;
  
  acquire(&tickslock);
  xticks = ticks;
  release(&tickslock);
  return xticks;
}

extern int sched_trace_enabled;
int sys_enable_sched_trace(void)
{
  if (argint(0, &sched_trace_enabled) < 0)
  {
    cprintf("enable_sched_trace() failed!\n");
  }

  return 0;
}
