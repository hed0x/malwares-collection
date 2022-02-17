/*
 * Name: kstat v.1.1 syscalls.c
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
#include "syscall.h"
#include "syscall_handler.h"

unsigned long *kmem_call_table[256], sc_addr, sct;
unsigned int kaddr;

struct {
        unsigned short limit;
        unsigned int base;
} __attribute__ ((packed)) idt;

struct {
        unsigned short off1;
        unsigned short sel;
        unsigned char none,flags;
        unsigned short off2;
} __attribute__ ((packed)) sc_idt;

void sc_handler_restore()
{
	int kd;

	sc_idt.off1 = IDT_OFF1;
	sc_idt.off2 = IDT_OFF2;

	kd=open(KMEM, O_RDONLY);
	if(kwrite(kd, idt.base+8*0x80, &sc_idt, sizeof(sc_idt)) == -1) err("kread error");
	printf("Done!\n");

	close(kd);
}

void check_handler()
{
	int kd;

        printf("\nLegal system_call handler should be at 0x%x ...", SYSTEM_CALL);
        kd=open(KMEM, O_RDONLY);
        asm ("sidt %0" : "=m" (idt));
        kread(kd, idt.base+8*0x80, &sc_idt, sizeof(sc_idt));
        sc_addr = (sc_idt.off2 << 16) | sc_idt.off1;

        if(sc_addr == SYSTEM_CALL) printf(" OK!\n");
        else {
                printf("\nWARNING New sys_call handler mapped to interrupt 0x80 at 0x%lx!\n\n", sc_addr);
                printf("Can't trust the new handler. Restoring the legal one ...");
                sc_handler_restore();
        }

	close(kd);
}

int check_sct()	
{
	int kd;
	char sch_code[100], *buf;

	kd=open(KMEM, O_RDONLY);
        printf("\nLegal sys_call_table should be at 0x%x ...", SYS_CALL_TABLE);
        kread(kd, sc_addr, sch_code, 100);
        buf = (char *) memmem(sch_code, 100, "\xff\x14\x85", 3);
        sct = *(unsigned *)(buf+3);
        if(sct == SYS_CALL_TABLE) {
                printf(" OK!\n");
		close(kd);
		return 0;
	}
        else {
                printf(" WARNING! sys_call_table hijacked!\n\n");
                printf("Checking sys_call_table array now at 0x%lx ...\n\n\n", sct);
		close(kd);
	
		return 1;
        }
	/* should not get here */
	return 0;
}

void show_syscalls(int replace)
{
	int kd, kd2, i, w=0, check;

	check_handler();
	check = check_sct();

	kd=open(KMEM, O_RDONLY);
	if(!check){
	   kaddr = SYS_CALL_TABLE;
	   if(kread(kd, (unsigned long)kaddr, &kmem_call_table, sizeof(kmem_call_table)) == -1) err("kread error");
	}
	else {
	   if(kread(kd, (unsigned long)sct, &kmem_call_table, sizeof(kmem_call_table)) == -1) err("kread error");
	}

	if(replace){
		printf("\nRestoring system calls addresses...\n\n");
		kd2=open(KMEM, O_WRONLY);
		if(!check) {
			if(kwrite(kd2, (unsigned long)kaddr, &calls, sizeof(calls)) == -1) err("kwrite error");
		} else {
			if(kwrite(kd2, (unsigned long)sct, &calls, sizeof(calls)) == -1) err("kwrite error");
		}
		return;
	}

	for(i=1; i < 256; i++)
		if(kmem_call_table[i]){
			if((unsigned long)kmem_call_table[i] != calls[i] && calls[i] != 0xffffffff && calls[i] != calls[0]){
				printf("\nsys_%-22s%16p", names[i], (void*)kmem_call_table[i]);
				printf(" WARNING! should be at %p", (void*)calls[i]);
				w++;
			}
		}
	if(!w) printf("\nNo System Call Address Modified\n");
	printf("\n");
}

void fingerprint_syscalls()
{
        int kd, i, x, w=0, check;
	char new_fingerp[FPRINT_SIZE];

	check_handler();
	check = check_sct();

	printf("\nProbing System Calls FingerPrints... ");
	kd=open(KMEM, O_RDONLY);
	if(!check) {
		kaddr = SYS_CALL_TABLE;
		if(kread(kd, (unsigned long)kaddr, &kmem_call_table, sizeof(kmem_call_table)) == -1) err("kread error");
	} else {
		if(kread(kd, (unsigned long)sct, &kmem_call_table, sizeof(kmem_call_table)) == -1) err("kread error");
	}
	for(i=1; i < 256; i++){
	   if(kmem_call_table[i]){
		if(kread(kd, (unsigned long)kmem_call_table[i], &new_fingerp, sizeof(new_fingerp)) == -1)
			err("kread error");
		if(strstr(new_fingerp, fingerprints[i]) == NULL) {
			w++;
			printf("\nWARNING! sys_%s modified:\n\t<", names[i]);
			for(x=0; x < FPRINT_SIZE; x++)
				printf("\\x%x", new_fingerp[x]&0x000000ff);
			printf("> instead of <");
			for(x=0; x < FPRINT_SIZE; x++)
                                printf("\\x%x", fingerprints[i][x]&0x000000ff);
			printf(">\n");
		}
	   }
	}
	if(!w)printf(" No System Call Modified!\n");
	printf("\n");
}
