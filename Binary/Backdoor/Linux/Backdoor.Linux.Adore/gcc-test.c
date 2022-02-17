/* # gcc -c -O2 -Wall -I/usr/src/linux/include gcc-test.c
 * # insmod gcc-test.o
 * # id
 * If UID != 0 then your gcc is messy
 */
#define __KERNEL__
#define MODULE

#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/sched.h>
#include <linux/unistd.h>

extern void *sys_call_table[];

long (*o_getuid)();

long n_getuid()
{
	printk("%d %08x %08x\n", current->pid, current->euid, current->uid);
	return current->uid;
}


int init_module()
{
	o_getuid = sys_call_table[__NR_getuid32];
	sys_call_table[__NR_getuid32] = n_getuid;	
	return 0;
}


int cleanup_module()
{
	sys_call_table[__NR_getuid32] = o_getuid;
	return 0;
}

