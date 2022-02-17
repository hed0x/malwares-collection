/*
 * Name: kstat v.1.1 ps.c
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
 * Bug Fixes:
 *		- 2 previous bugs by Xenion and DarkAngel
 *		- pid = 0 on hashpid by DarkAngel
 */

#include "linux.h"

#define cap_Raised(c, flag)	(cap_t(c) & CAP_TO_MASK(flag) & CAP_BOUND)

struct our_task {
	pid_t pid;
	pid_t ppid;
	uid_t uid;
	gid_t gid;
	char name[16];
	struct task_struct *ptr;
};
struct our_task ps[NR_TASKS];

void dumpsocket(struct sock sk, unsigned long number)
{
	char *saddr, *daddr;

	switch(sk.family) {
		case 1:
			printf("AF_UNIX\t\t[%lu]\n", number);
			break;
		case 2:
			saddr=ntoa(sk.rcv_saddr);
        		printf("%s:%d\t",  saddr, sk.num);
			daddr=ntoa(sk.daddr);
			printf(" %s:%d\n", daddr, ntohs(sk.dport));
			break;
		case 3:
			printf("AF_AX25\t\t[%lu]\n", number);
			break;
		case 4:
			printf("AF_IPX\t\t[%lu]\n", number);
			break;
		case 5:
			printf("AF_APPLETALK\t\t[%lu]\n", number);
			break;
#ifdef IPV6
		case 10:
			saddr=ntoa6(sk.net_pinfo.af_inet6.rcv_saddr);
			printf("%s:%d\t",  saddr, sk.num);
			daddr=ntoa6(sk.net_pinfo.af_inet6.daddr);
			printf(" %s:%d\n", daddr, ntohs(sk.dport));
			break;
#endif
		case 17:
			printf("AF_PACKET\t\t[%lu]\n", number);
			break;
		default:
			printf("SOCKET\t\t[%lu]\n", number);
			break;
	}
}

int show_ps(int q, ...)
{
	va_list ap;
	unsigned long offset, addr, swapper;
	struct task_struct task, taskk, ptaskk, *wow, **ht, htask, *check;
	struct task_struct *mypidhash[PIDHASH_SZ];
	struct files_struct files_ptr;
	struct fs_struct fs;
	struct file *f, fd;
	struct dentry dentry, root;
	struct inode inode;
	struct sock sk;
	unsigned int kstat_addr=0, hash_addr=0;
	int kd, i, pid=0, lastpid=0, done=0, cfd, len, buflen;
	char name[16], hname[16], fname[255], dirname[255], tmpname[255], rootdir[255];
	char *nptr, *dir, dones[NR_TASKS];
	umode_t type;

        va_start(ap, q);
        pid=va_arg(ap, int);

        for(i=1; i < 10; i++)
		ps[i].pid=0;

	check=(struct task_struct *)kstat_addr=find_kmem_offset(TASK_OFF);
	hash_addr=find_kmem_offset("pidhash");

	kd=open(KMEM, O_RDONLY);
	if(kread(kd, (unsigned long)kstat_addr, &task, sizeof(struct task_struct)) == -1) err("kread error");
	if(kread(kd, (unsigned long)hash_addr, &mypidhash, sizeof(mypidhash)) == -1) err("kread error");
	addr=swapper=(unsigned long)&task;

     	if(!q) printf(" PID\t  PPID\t  UID\t  GID\t  COMMAND\n");
  
	for(i=1; i < NR_TASKS; i++){
		if(kread(kd, (unsigned long)addr, &taskk, sizeof(struct task_struct)) == -1) err("kread error");
		if(kread(kd,(unsigned long)taskk.comm, &name, 15) == -1) err("kread error");
		name[16]='\0';
		if(kread(kd,(unsigned long)taskk.p_pptr,&ptaskk,sizeof(struct task_struct))==-1) err("kread error");
		if(taskk.pid == pid){
DUMP:			printf("Name:\t%s\n", name);
			printf("State:\t");
			if(!taskk.state)printf("R (running)\n");
			if(taskk.state==4)printf("Z (zombie)\n");
			if((taskk.state>0&&taskk.state<4)||(taskk.state>4&&taskk.state<16))
				printf("S (sleeping)\n");
			if(taskk.state==16)printf("SW (swapping)\n");
			printf("Pid:\t%d\n", taskk.pid);
			if(kread(kd,(unsigned long)taskk.p_pptr, &ptaskk, sizeof(struct task_struct))==-1)
				err("kread error");
			if(kread(kd,(unsigned long)ptaskk.comm, &name, 15) == -1) err("kread error");
			printf("PPid:\t%d (%s)\n", ptaskk.pid, name);
			printf("Uid:\t%d\t%d\t%d\t%d\n", taskk.uid, taskk.euid, taskk.suid, taskk.fsuid);
			printf("Gid:\t%d\t%d\t%d\t%d\n", taskk.gid, taskk.egid, taskk.sgid, taskk.fsgid);
			printf("Flags:\t");
			if(taskk.flags&PF_ALIGNWARN)printf("PF_ALIGNWARN ");
			if(taskk.flags&PF_STARTING)printf("PF_STARTING ");
			if(taskk.flags&PF_EXITING)printf("PF_EXITING ");
			if(taskk.flags&PF_FORKNOEXEC)printf("PF_FORKNOEXEC ");
			if(taskk.flags&PF_SUPERPRIV)printf("PF_SUPERPRIV ");
			if(taskk.flags&PF_DUMPCORE)printf("PF_DUMPCORE ");
			if(taskk.flags&PF_SIGNALED)printf("PF_SIGNALED ");
			if(taskk.flags&PF_MEMALLOC)printf("PF_MEMALLOC ");
			if(taskk.flags&PF_USEDFPU)printf("PF_USEDFPU ");
                        if(taskk.flags&PT_PTRACED)printf("PT_PTRACED ");
                        if(taskk.flags&PT_TRACESYS)printf("PT_TRACESYS ");
			if(taskk.flags&PT_DTRACE)printf("PF_DTRACE ");
                        if(taskk.flags&PT_TRACESYSGOOD)printf("PF_TRACESYSGOOD ");
                        if(taskk.flags&PT_PTRACE_CAP)printf("PF_PTRACE_CAP ");
			printf("\nCrucial Capabilities Check\n");
			if(cap_Raised(taskk.cap_effective, CAP_DAC_OVERRIDE))
				printf("\tCan override every restriction regarding fs\n");
			if(cap_Raised(taskk.cap_effective, CAP_SETPCAP))
				printf("\tCan transfer capabilities to every pid\n");
			if(cap_Raised(taskk.cap_effective, CAP_LINUX_IMMUTABLE))
				printf("\tCan modify immutable(+i) and append-only(+a) flags\n");
			if(cap_Raised(taskk.cap_effective, CAP_NET_ADMIN))
				printf("\tCan modify network and firewall configuration\n");
			if(cap_Raised(taskk.cap_effective, CAP_NET_RAW))
				printf("\tCan access RAW sockets\n");
			if(cap_Raised(taskk.cap_effective, CAP_SYS_MODULE))
				printf("\tCan insert and remove LKMs\n");
			if(cap_Raised(taskk.cap_effective, CAP_SYS_ADMIN))
				printf("\tCan modify system configuration and access devices\n");
			printf("Open Files\n");
			if(kread(kd, (unsigned long)taskk.files, &files_ptr, sizeof(struct files_struct)) == -1)
				err("kread error1");
			for(cfd=0,f=&fd;cfd<files_ptr.max_fds;cfd++){
				if(kread(kd, (unsigned long)files_ptr.fd++, &f, sizeof(fd))== -1) err("kread error2");
				if(f)
				if(kread(kd, (unsigned long)f, &fd, sizeof(struct file)) == -1) err("kread error3");
				if(fd.f_dentry)
				if(kread(kd, (unsigned long)fd.f_dentry, &dentry, sizeof(struct dentry)) == -1)
					err("kread error4");
				if(dentry.d_name.name)
				if(kread(kd, (unsigned long)dentry.d_name.name, &fname, 255) == -1) err("kread error5");
				if(dentry.d_inode)
				if(kread(kd, (unsigned long)dentry.d_inode, &inode, sizeof(struct inode)) == -1)
					err("kread error6");
				if(kread(kd, (unsigned long)taskk.fs, &fs, sizeof(struct fs_struct)) == -1) err("kread error7");
				if(kread(kd, (unsigned long)fs.root, &root, sizeof(struct dentry)) == -1) err("kread error8");
				if(kread(kd, (unsigned long)root.d_name.name, &rootdir, 255) == -1) err("kread error9");
			     if(f){
				offset = (unsigned long)dentry.d_parent;
				buflen = 255;
				nptr = (char*)dirname+buflen;
				*--nptr = '\0';
				buflen--;
				dir = nptr-1;
				*dir = '/';
				for(;;){
				int namelen;
				struct dentry parent;
                                if(kread(kd, offset, &parent, sizeof(struct dentry)) == -1) err("kread errorX");
                                if(kread(kd, (unsigned long)parent.d_name.name, &tmpname, 255) == -1) err("kread errorY");
				if(!strcmp(tmpname, rootdir)) break;
				namelen = parent.d_name.len;
				buflen -= namelen+1;
				if(buflen < 0) break;
				nptr -= namelen;
				memcpy(nptr, tmpname, namelen);
				*--nptr = '/';
				dir = nptr;
				offset = (unsigned long)parent.d_parent;
				}
			      }
				  if(f){
					printf("\t%d\t", cfd);
					type = inode.i_mode & S_IFMT;
					switch(type){
					case S_IFBLK:
						printf("BLOCK\t");
						break;
					case S_IFCHR:
						printf("CHAR\t");
						break;
					case S_IFDIR:
						printf("DIR\t");
						break;
					case S_IFIFO:
						printf("FIFO\t");
						break;
					case S_IFREG:
						printf("REGULAR\t");
						break;
					case S_IFLNK:
						printf("LINK\t");
						break;
					case S_IFSOCK:
						if(kread(kd,(unsigned long)inode.u.socket_i.sk,&sk,sizeof(struct sock)) == -1)
							err("kread errorZ");
						dumpsocket(sk, inode.i_ino);
						break;
					default:
						break;
					}
					len=dentry.d_name.len;
					fname[len]='\0';
					if(len<3&&fname[0]=='.'){
					if(len==1 || (len==2&&fname[0]=='.'));
					} else if(type!=S_IFSOCK)printf("\t%s/%s\n", dir, fname);
				  }
				}
				printf("\n");
				exit(0);
			}
                        if(taskk.pid>0){
                                ps[i].pid=taskk.pid;
                                ps[i].ppid=ptaskk.pid;
                                ps[i].uid=taskk.uid;
                                ps[i].gid=taskk.gid;
                                strncpy(ps[i].name, name, 15);
                                ps[i].name[16]='\0';
				ps[i].ptr=(struct task_struct *)addr;
                        }
			addr=(unsigned long)taskk.next_task;
		}
		if(q) {
			printf("\nDo you want to scan at which address ? "); fflush(NULL);
                	len=read(0, name, 12); name[len-1]='\0';
                	if(name[0]=='\0') {
				printf("\n");
				exit(0);
			}
                	else addr = strtoul(name, NULL, 16);
                	if(kread(kd, (unsigned long)addr, &taskk, sizeof(struct task_struct))==-1) err("kread error");
			if(kread(kd, (unsigned long)taskk.comm, &name, 15)==-1) err("kread error");
                	goto DUMP;
		}

/* lame but working sort */	
	if(!q){
		memset(dones, 0, sizeof(dones));
        	for(i=1; i < NR_TASKS; i++)
			if(ps[i].pid && ps[i].pid > lastpid) {
				printf(" %d\t  %d\t  %d\t  %d\t  %s\n", ps[i].pid, ps[i].ppid, ps[i].uid, ps[i].gid,
					ps[i].name);
				lastpid = ps[i].pid;
				dones[lastpid]++;
			   	if(done++==NR_TASKS) exit(0);
			   }

		printf("\n\nChecking pids... ");
		for(i=1; i < NR_TASKS; i++) {
			ht = &mypidhash[pid_hashfn(i)]; wow = *ht;
			if((struct task_struct *)wow) {
				if(kread(kd, (unsigned long)wow, &htask, sizeof(struct task_struct)) == -1) err("kread error");
				if(kread(kd, (unsigned long)wow->comm, &hname, 15) == -1) err("kread error");
				hname[16]='\0';
				if(!dones[htask.pid]) {	
					if(wow!=check)printf("\nPossible stealth process with pid:%d\tname:%s at %p", 
						htask.pid, hname, wow);
					dones[htask.pid]++;
				}
			}
		}
		printf("  Done!\n");
   	}

	va_end(ap);
	printf("\n");
	exit(0);
}
