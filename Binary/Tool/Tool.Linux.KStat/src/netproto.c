/*
 * Name: kstat v.1.1 netproto.c
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
#include "netproto.h"

void show_netprotos()
{
	int kd, i=0;
	struct proto ops;

	kd=open(KMEM, O_RDONLY);
	printf("\nProbing %s at %p ...", TCP_PROT_OPS, (void*)TCP_PROT_ADDR);
        if(kread(kd, (unsigned long)TCP_PROT_ADDR, &ops, sizeof(struct proto)) == -1) err("kread error");	
	if((unsigned long)ops.recvmsg != TCP_RECV_ADDR){
 		printf("\nWARNING! %s at %p, should be at %p", TCP_RECV, ops.recvmsg, (void*)TCP_RECV_ADDR);
		i++;
	}
        if((unsigned long)ops.sendmsg != TCP_SEND_ADDR){
		printf("\nWARNING! %s at %p, should be at %p", TCP_SEND, ops.sendmsg, (void*)TCP_SEND_ADDR);
		i++;
	}
	if(!i)printf(" %s Functions OK.", TCP_PROT_OPS); else i=0;

        printf("\nProbing %s at %p ...", UDP_PROT_OPS, (void*)UDP_PROT_ADDR);
        if(kread(kd, (unsigned long)UDP_PROT_ADDR, &ops, sizeof(struct proto)) == -1) err("kread error");
        if((unsigned long)ops.recvmsg != UDP_RECV_ADDR){
                printf("\nWARNING! %s at %p, should be at %p", UDP_RECV, ops.recvmsg, (void*)UDP_RECV_ADDR);
                i++;
        }
        if((unsigned long)ops.sendmsg != UDP_SEND_ADDR){
                printf("\nWARNING! %s at %p, should be at %p", UDP_SEND, ops.sendmsg, (void*)UDP_SEND_ADDR);
                i++;
        }
        if(!i)printf(" %s Functions OK.",UDP_PROT_OPS); else i=0;

        printf("\nProbing %s at %p ...", RAW_PROT_OPS, (void*)RAW_PROT_ADDR);
        if(kread(kd, (unsigned long)RAW_PROT_ADDR, &ops, sizeof(struct proto)) == -1) err("kread error");
        if((unsigned long)ops.recvmsg != RAW_RECV_ADDR){
                printf("\nWARNING! %s at %p, should be at %p", RAW_RECV, ops.recvmsg, (void*)RAW_RECV_ADDR);
                i++;
        }
        if((unsigned long)ops.sendmsg != RAW_SEND_ADDR){
                printf("\nWARNING! %s at %p, should be at %p", RAW_SEND, ops.sendmsg, (void*)RAW_SEND_ADDR);
                i++;
        }
        if(!i)printf(" %s Functions OK.\n",RAW_PROT_OPS); else i=0;
}
