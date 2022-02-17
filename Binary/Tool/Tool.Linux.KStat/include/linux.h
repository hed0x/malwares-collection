/*
 * Name: kstat v.1.1 linux.h
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

#define NR_TASKS PID_MAX

#define __KERNEL__
#include <linux/netdevice.h>
#include <linux/inetdevice.h>
#include <net/ipv6.h>
#include <net/if_inet6.h>
#include <linux/if_arp.h>
#include <net/sock.h>
#include <linux/sched.h>
#include <linux/capability.h>
#include <linux/module.h>
#include <linux/types.h>
#undef __KERNEL__

#include <errno.h>
#include <getopt.h>
#include <linux/version.h>

#include "libc.h"

#define KMEM		"/dev/kmem"
#define DEV_BASE_OFF	"dev_base"
#define TASK_OFF	"init_task"
#define SYSCALL		"sys_call_table"
#define IOPORT		"ioport_resource"
#define INETOPS		"inet_stream_ops"
#define PROC_ROOT	"proc_root"

/* 
 * TCPOFF is inet_stream_ops - tcp_prot
 * UDPOFF is inet_stream_ops - udp_prot
 * RAWOFF is inet_stream_ops - raw_prot
 * HEXOFF is ioport_resource - kernel_module
 */
#if LINUX_VERSION_CODE == KERNEL_VERSION(2,4,18)
#define TCPOFF  3136
#define UDPOFF  2656
#define RAWOFF  2848
#define HEXOFF  184
#elif LINUX_VERSION_CODE >= KERNEL_VERSION(2,4,16)
#define TCPOFF  3136
#define UDPOFF  2656
#define RAWOFF  2848
#define HEXOFF	188
#elif LINUX_VERSION_CODE >= KERNEL_VERSION(2,4,7)
#define TCPOFF  3136
#define UDPOFF  2656
#define RAWOFF  2848
#define HEXOFF	156
#else
#define TCPOFF  3136
#define UDPOFF  2656
#define RAWOFF  2848
#define HEXOFF	160
#endif

#define FPRINT_SIZE	10

int errno, fd;
char *iff, name[10];

void uso(char*);
int find_kmem_offset(char*);
int find_module_addr();
int kread(int, unsigned long, void*, int);
int kwrite(int, unsigned long, void*, int);
void err(char*);
int iff_stat();
char *ntoa(unsigned long);
char *ntoa6(struct in6_addr);
void dumpsocket(struct sock, unsigned long);
void relink_pcb(struct task_struct *, int, int);
int show_ps(int, ...);
int show_lkms();
int probe_slkm(unsigned long);
int find_maddr(char*);
void check_handler();
int check_sct();
void sc_handler_restore();
void show_syscalls(int);
void fingerprint_syscalls();
void show_netprotos();
void show_procsyms();
void procs_net(struct task_struct);
void show_netstat();
void parse_sock4(unsigned long, unsigned short, unsigned long, unsigned short, \
unsigned char, unsigned char, unsigned short, pid_t, int);
void parse_sock6(struct in6_addr, unsigned short, struct in6_addr, unsigned short, \
unsigned char, unsigned char, unsigned short, pid_t, int);
void lookproto(unsigned char);

/* PLEASE NOTE THAT FOLLOWING IS A STRIPPED DOWN VERSION FROM MODUTILS */

struct new_module_symbol
{
  unsigned long value;
  unsigned long name;
};

struct new_module_info
{
  unsigned long address;
  unsigned long size;
  unsigned long flags;
};

struct module_stat {
        char *name;
        unsigned long addr;
        unsigned long modstruct;
	unsigned long size;
        unsigned long flags;
        long usecount;
        size_t nsyms;
        struct module_symbol *syms;
        size_t nrefs;
        struct module_stat **refs;
        unsigned long status;
};

int query_module(const char *name, int which, void *buf, size_t bufsize,
                 size_t *ret);

/* Values for query_module's which.  */

#define QM_MODULES      1
#define QM_DEPS         2
#define QM_REFS         3
#define QM_SYMBOLS      4
#define QM_INFO         5

/* END FROM MODUTILS */
