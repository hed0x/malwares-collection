/*
 * Name: kstat v.1.1 util.c
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

void uso(char *str)
{
	printf("\nUsage: %s [-i iff] [-P] [-p pid] [-M] [-m addr] [-s 0|1] [-S] [-n] [-r] [-T]\n\n", str);
	printf("-i\tiff may be specified as a name (e.g. eth0)\n");
	printf("\tdisplays info about the queried interface\n\n");
	printf("-P\tdisplays all processes\n\n");
	printf("-p\tpid is the process id of the queried task\n\n");
	printf("-M\tdisplays the kernel's LKMs' linked list and scans stealth LKMs\n\n");
	printf("-m\taddr is the hex address of the queried module\n");
	printf("\tdisplays info about the module to be found at addr\n\n");
	printf("-s\tlooks for commonly hijacked system calls\n");
	printf("\t-s 0 checks for sys_calls hijacking\n");
	printf("\t-s 1 restores original sys_calls addresses\n\n");
	printf("-S\tchecks system calls fingerprints\n\n");
	printf("-n\tchecks commonly hijacked TCP/IP functions\n\n");
	printf("-r\tverifies commonly hijacked /proc functions\n\n");
	printf("-T\tdumps network connections with associated pids and descriptors\n\n");
	printf("\n");
	exit(0);
}

void err(char *str)
{
	printf("%s\n", str);
	exit(-1);
}

char *ntoa(unsigned long ip) {
        static char buff[18];
        char *p;
        p = (char *) &ip;
        sprintf(buff, "%d.%d.%d.%d",
                (p[0] & 255), (p[1] & 255), (p[2] & 255), (p[3] & 255));
        return(buff);
}

#ifdef IPV6
char *ntoa6(struct in6_addr addr) {
        static char buff[40];
	int j, w=1, len=0, i=1, lo=0;
	char x[16]={0,};

	for (j=0; j<16; j++) {
                if(j==15 && (!(x[14]) && !(x[13]) && !(x[12]))){
                        sprintf(buff+len, "::");
                        len+=2; lo++;
                }
		if(addr.s6_addr[j]){
			i++; x[j]=1;
			sprintf(buff+len, "%02x", (addr.s6_addr[j]));
                	len += 2;
		}
		if(!(w++%2) && (x[j] || (!(x[j]) && !(x[j-1]) && x[j-2])) && j<15){
			sprintf(buff+len, ":");
			len++;
		}
        }
	if(i==1 && !lo) sprintf(buff+len, "::");

	return(buff);
}
#endif
