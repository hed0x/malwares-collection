/*
 * Name: kstat v.1.1 knetstat.c
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
 *
 * Bugfix:
 *		- same as in ps.c by DarkAngel
 */

#include "linux.h"


struct net_task {
	pid_t pid;
	int lastcfd;
};

char sname[16];
struct net_task ps[NR_TASKS];

void lookproto(unsigned char state)
{
        switch(state) {
                case 1:
                        printf("%15s", "ESTABLISHED ");
                        break;
                case 2:
                        printf("%16s", "SYN_SENT ");
                        break;
                case 3:
                        printf("%16s", "SYN_RECV ");
                        break;
                case 4:
                        printf("%16s", "FIN_WAIT1 ");
                        break;
                case 5:
                        printf("%16s", "FIN_WAIT2 ");
                        break;
                case 6:
                        printf("%16s", "TIME_WAIT ");
                        break;
                case 7:
                        printf("%16s", "CLOSE ");
                        break;
                case 8:
                        printf("%16s", "CLOSE_WAIT ");
                        break;
                case 9:
                        printf("%16s", "LAST_ACK ");
                        break;
                case 10:
                        printf("%16s", "LISTEN ");
                        break;
                case 11:
                        printf("%16s", "CLOSING ");
                        break;
                default:
                        break;
         }
}

#ifdef IPV6
void parse_sock6(struct in6_addr saddr, unsigned short sport, struct in6_addr daddr, unsigned short dport,
unsigned char state, unsigned char protocol, unsigned short type, pid_t pid, int fd)
{
	char *sad, *dad;

	switch(protocol) {
                case 6:
                        printf("%-5s", "tcp6");
                        break;
                case 17:
                        printf("%-5s", "udp6");
                        break;
                case 255:
                        printf("%-5s", "raw6");
                default:
                        break;
        }
        sad=ntoa6(saddr);
        printf("%18s:%-5d ", sad, sport);
        dad=ntoa6(daddr);
        printf("%18s:", dad);
	if(!dport) printf("*    "); else printf("%-5d ", dport);
	if(protocol == 6) lookproto(state); else printf("%16s", "");
	printf("%17s [%5s:%-6d %4s:%-4d]\n", sname, "Pid", pid, "Fd", fd);
}
#endif

void parse_sock4(unsigned long saddr, unsigned short sport, unsigned long daddr, unsigned short dport, 
unsigned char state, unsigned char protocol, unsigned short type, pid_t pid, int fd)
{
	char *sad, *dad;

	switch(protocol) {
		case 6:
			printf("%-5s", "tcp");
			break;
		case 17:
			printf("%-5s", "udp");
			break;
		case 255:
			printf("%-5s", "raw");
		default:
			break;
	}
	sad=ntoa(saddr); 
	printf("%18s:%-5d ", sad, sport);
	dad=ntoa(daddr);
	printf("%18s:", dad);
	if(!dport) printf("*    "); else printf("%-5d ", dport);
	if(protocol == 6) lookproto(state); else printf("%16s", "");
	printf("%17s [%5s:%-6d %4s:%-4d]\n", sname, "Pid", pid, "Fd", fd);
}

void procs_net(struct task_struct taskk)
{
        struct files_struct files_ptr;
        struct file *f, fd;
        struct dentry dentry;
        struct inode inode;
        struct sock sk;
        umode_t type;
	int kd, cfd, lastpid=0;

	kd=open(KMEM, O_RDONLY);

	if(kread(kd, (unsigned long)taskk.files, &files_ptr, sizeof(struct files_struct)) == -1){
		printf("%d", taskk.pid);
        	err("kread error1");
	}
        for(cfd=0,f=&fd ;cfd<files_ptr.max_fds; cfd++){
        	if(kread(kd, (unsigned long)files_ptr.fd++, &f, sizeof(fd))== -1) err("kread error2");
                if(f){
                	if(kread(kd, (unsigned long)f, &fd, sizeof(struct file)) == -1) err("kread error3");
                        if(fd.f_dentry)
                        if(kread(kd, (unsigned long)fd.f_dentry, &dentry, sizeof(struct dentry)) == -1)
                        	err("kread error4");
                        if(dentry.d_inode)
                           	if(kread(kd, (unsigned long)dentry.d_inode, &inode, sizeof(struct inode)) == -1)
                                err("kread error6");
                        type = inode.i_mode & S_IFMT;
                        switch(type){
                        	case S_IFSOCK:
                                	lastpid=taskk.pid;
                                	if(kread(kd, (unsigned long)inode.u.socket_i.sk, &sk, sizeof(struct sock)) == -1)
                                        	err("kread errorZ");
                                	if((!ps[lastpid].pid || cfd > ps[lastpid].lastcfd) && sk.family == 2){
                                        	parse_sock4(sk.rcv_saddr, sk.num, sk.daddr, ntohs(sk.dport), sk.state,
                                                	sk.protocol, sk.type, taskk.pid, cfd);
                                        	ps[lastpid].pid=lastpid;
                                        	ps[lastpid].lastcfd=cfd;
                                	}
#ifdef IPV6
                                	else if((!ps[lastpid].pid || cfd > ps[lastpid].lastcfd) && sk.family == 10){
                                        	parse_sock6(sk.net_pinfo.af_inet6.rcv_saddr, sk.num,
                                                	sk.net_pinfo.af_inet6.daddr, ntohs(sk.dport), sk.state,
                                                	sk.protocol, sk.type, taskk.pid, cfd);
                                        	ps[lastpid].pid=lastpid;
                                        	ps[lastpid].lastcfd=cfd;
                                	}
#endif
                                	break;
                             default:
                                	break;
                        }
                }
        }

	close(kd);
}

void show_netstat()
{
	unsigned long addr, swapper;
	struct task_struct task, taskk, htask, *wow, **ht, *check;
	struct task_struct *mypidhash[PIDHASH_SZ];
	unsigned int kstat_addr=0, hash_addr=0; 
	int kd, i;
	char dones[NR_TASKS];

        for(i=1; i < NR_TASKS; i++) ps[i].pid=0; 
	memset(dones, 0, sizeof(dones));

	check=(struct task_struct *)kstat_addr=find_kmem_offset(TASK_OFF);
	hash_addr=find_kmem_offset("pidhash");

	kd=open(KMEM, O_RDONLY);
	if(kread(kd, (unsigned long)kstat_addr, &task, sizeof(struct task_struct)) == -1) err("kread error");
	if(kread(kd, (unsigned long)hash_addr, &mypidhash, sizeof(mypidhash)) == -1) err("kread error");
	addr=swapper=(unsigned long)&task;

     	printf("\nActive Internet connections (servers and established)\n\n");
  
	for(i=1; i < NR_TASKS; i++){
		if(kread(kd, (unsigned long)addr, &taskk, sizeof(struct task_struct)) == -1) err("kread error");
		if(kread(kd,(unsigned long)taskk.comm, &sname, 15) == -1) err("kread error"); sname[16]='\0';
		if(taskk.files) {
		  	dones[taskk.pid]++;
			procs_net(taskk);
		}
	  addr=(unsigned long)taskk.next_task;
	}

	printf("\nChecking stealth processes...\n\n"); fflush(NULL);
        for(i=1; i < NR_TASKS; i++) {
        	ht = &mypidhash[pid_hashfn(i)]; wow = *ht;
                if((struct task_struct *)wow) {
                	if(kread(kd, (unsigned long)wow, &htask, sizeof(struct task_struct)) == -1) continue;
                        if(!dones[htask.pid]) {
			 	if(wow!=check){
		           		if(kread(kd, (unsigned long)htask.comm, &sname, 15) == -1) err("kread error");
			   		sname[16]='\0';
			   		if(htask.files) {
                                		dones[htask.pid]++;
						procs_net(htask);
                           		}
			  	}
			}
		}
        }
	printf("\nDone!\n");
}
