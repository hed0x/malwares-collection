/*
 * Name: kstat v.1.1 main.c
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

int main(int argc, char**argv)
{
	int opt, pid;
	unsigned long first;

	if(argc<2) uso(argv[0]);

	while((opt = getopt(argc, argv, "i:p:PMm:s:SnrTvVh?")) != -1) {
		switch(opt)
		{
			case 'i':
				iff=optarg;
				iff_stat();
				break;
			case 'p':
				pid=atoi(optarg);
				show_ps(1, pid);
				break;
			case 'P':
				show_ps(0);
				break;
			case 'M':
				show_lkms();
				break;
			case 'm':
				first=strtoul(optarg,NULL,0);
				probe_slkm(first);
				break;
			case 's':
				if(1 == atoi(optarg))
				show_syscalls(1);
				else if(!(atoi(optarg)))
				show_syscalls(0);
				else printf("\n-s 0 or -s 1 only.\n\n");
				break;
			case 'S':
				fingerprint_syscalls();
				break;
                        case 'T':
                                show_netstat();
                                break;
			case 'n':
				show_netprotos();
				break;
			case 'r':
				show_procsyms();
				break;
			case 'v':
				printf("\nI'm a very shy tool. I don't like to be too much verbose.\n");
				printf("Please bear with me, but I'll be verbose as usual...\n\n");
				break;
			case 'V':
				printf("\nDid anyone say \"MD5\" ?!\n\n");
				exit(0);
				break;
			case 'h':
			case '?':
				uso(argv[0]);
				exit(0);
				break;
                        default:
                                exit(0);
                                break;
                }
        }

	printf("\n");
	exit(0);
}
