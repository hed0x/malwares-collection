/*
 * Name: kstat v.1.1 procsyms.c
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

#include "linux.h"
#include "procsyms.h"
#include <linux/proc_fs.h>

static struct procnetdent {
	char *name;
	unsigned long daddr;
	unsigned long get;
} *dp, pnet[]={
	{"snmp", snmp_DENTRY, snmp_GET_INFO},
	{"tcp", tcp_DENTRY, tcp_GET_INFO},
	{"udp", udp_DENTRY, udp_GET_INFO},
	{"raw", raw_DENTRY, raw_GET_INFO},
#ifdef IPV6
	{"tcp6", tcp6_DENTRY, tcp6_GET_INFO},
	{"udp6", udp6_DENTRY, udp6_GET_INFO},
	{"raw6", raw6_DENTRY, raw6_GET_INFO},
#endif
	{NULL,}
};

void show_procsyms()
{
	int kd, i=0;
	struct proc_dir_entry p;
	struct file_operations fop;
	struct inode_operations iop;
	unsigned int kaddr=0;

	kaddr=find_kmem_offset(PROC_ROOT);
        kd=open(KMEM, O_RDONLY);

	printf("\nProbing Common /proc File and Inode Operations at %p...", (void *)kaddr);
        if(kread(kd, (unsigned long)kaddr, &p, sizeof(struct proc_dir_entry)) == -1) err("kread error");
        if(kread(kd, (unsigned long)p.proc_fops, &fop, sizeof(struct file_operations)) == -1) err("kread error");
        if(kread(kd, (unsigned long)p.proc_iops, &iop, sizeof(struct inode_operations)) == -1) err("kread error");

	if((unsigned long)p.proc_fops != PROC_ROOT_FILE_OPS){
		i++;
                printf("\nWARNING! proc.FILE_OPS at %p, should be at %p", p.proc_fops, (void *)PROC_ROOT_FILE_OPS);
	}
	if((unsigned long)p.proc_iops != PROC_ROOT_INODE_OPS){
		i++;
                printf("\nWARNING! proc.INODE_OPS at %p, should be at %p", p.proc_iops, (void *)PROC_ROOT_INODE_OPS);
	}
	if((unsigned long)fop.readdir != PROC_ROOT_READDIR){
		i++;
		printf("\nWARNING! proc.FILE_OPS.readdir at %p, should be at %p", fop.readdir, (void *)PROC_ROOT_READDIR);
	}
	if((unsigned long)iop.lookup != PROC_ROOT_LOOKUP){
		i++;
                printf("\nWARNING! proc.INODE_OPS.lookup at %p, should be at %p", iop.lookup, (void *)PROC_ROOT_LOOKUP);
	}
	if(!i)printf(" OK!\n");

	printf("\nProbing Common /proc/net Dentries Operations...\n");
	for(dp = pnet; dp->name; dp++){
		i=0;
		printf("\n/proc/net/%-10s [%8p]\t", dp->name, (void *)dp->daddr);
		kaddr=dp->daddr;
		if(kread(kd, (unsigned long)kaddr, &p, sizeof(struct proc_dir_entry)) == -1) err("kread error");
		if(kread(kd, (unsigned long)p.proc_fops, &fop, sizeof(struct file_operations)) == -1) err("kread error");
		if((unsigned long)p.get_info != (unsigned long)dp->get){
			i++;
			printf("\n\tWARNING! get_info operation at %p, should be at %p", p.get_info, (void *)dp->get);
		}
		if((unsigned long)fop.write != PROC_FILE_WRITE){
			i++;
			printf("\n\tWARNING! write operation at %p, should be at %p", p.get_info, (void *)PROC_FILE_WRITE);
                }
		if(!i)printf(" OK!");
	}
	printf("\n");			
}
