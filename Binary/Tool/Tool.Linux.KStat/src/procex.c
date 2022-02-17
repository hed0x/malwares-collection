/*
 * Name: kstat v.1.1 procex.c
 * Date: Sun Feb 10 02:49:49 CET 2002
 * Author: FuSyS [fusys@s0ftpj.org, fusys@sikurezza.org]
 *
 * SoftProject Digital Security for Y2K
 * Sikurezza.org - Italian Security Mailinglist
 *
 * MOJITO-WARE LICENSE - This source code is like "THE BEER-WARE LICENSE" by
 * Poul-Henning Kamp <phk@FreeBSD.ORG> but you can give me in return a mojito.
 *
 * Tested on: Slackware 8 Linux MaNTRa 2.4.16 #4 i686 unknown
 */

#define __KERNEL__
#define MODULE

#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/config.h>
#include <linux/types.h>
#include <linux/fs.h>
#include <linux/proc_fs.h>

#define FILE_OPS      proc_fops
#define INODE_OPS     proc_iops

char *pnet[]={"snmp","tcp","udp","raw"
#ifdef IPV6
,"tcp6","udp6","raw6"
#endif
,NULL};

MODULE_LICENSE("GPL");

static int proc_calc_metrics(char *page, char **start, off_t off,
                                 int count, int *eof, int len)
{
        if (len <= off+count) *eof = 1;
        *start = page + off;
        len -= off;
        if (len>count) len = count;
        if (len<0) len = 0;
        return len;
}

int get_kstat_proc_syms(char *page)
{
	int len, i, w=0;
	struct proc_dir_entry *s;

	s=proc_net->subdir->next;
	len=sprintf(page, "PROC_ROOT_READDIR\t0x%p\n", (void*)proc_root.FILE_OPS->readdir);
	len+=sprintf(page+len, "PROC_ROOT_LOOKUP\t0x%p\n", (void*)proc_root.INODE_OPS->lookup);
	len+=sprintf(page+len, "PROC_ROOT_FILE_OPS\t0x%p\n", (void*)proc_root.FILE_OPS);
	len+=sprintf(page+len, "PROC_ROOT_INODE_OPS\t0x%p\n", (void*)proc_root.INODE_OPS);
	len+=sprintf(page+len, "PROC_FILE_OPS\t\t0x%p\n", (void*)s->FILE_OPS);

        for( ; s != NULL; s=s->next)
                for(i=0; pnet[i]; i++)
                        if(!strcmp(s->name, pnet[i])){
				if(!w++)len+=sprintf(page+len, "PROC_FILE_WRITE\t\t0x%p\n", (void*)s->FILE_OPS->write);
				len+=sprintf(page+len, "%s_DENTRY\t\t0x%p\n", pnet[i], (void*)s);
				len+=sprintf(page+len, "%s_GET_INFO\t\t0x%p\n", pnet[i], (void*)s->get_info);
			}
	return len;
}

static int kstat_proc_syms_read(char *page, char **start, off_t off, int count, int *eof, void *data)
{
	int len = get_kstat_proc_syms(page);
	return proc_calc_metrics(page, start, off, count, eof, len);
}

int init_module(void) {

	create_proc_read_entry("kstat_proc_syms", 0, NULL, (void *)kstat_proc_syms_read, NULL);
        return 0;
}

void cleanup_module(void) {

	remove_proc_entry("kstat_proc_syms", &proc_root);
}
