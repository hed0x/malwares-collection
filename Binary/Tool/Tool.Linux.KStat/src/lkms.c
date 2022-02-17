/*
 * Name: kstat v.1.1 lkms.c
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

int show_lkms()
{
	int kd, i, kd2;
	unsigned long addr=0, kaddr=0, bottom=0xff000000, end=0, probe;
	struct module modk, pmodk;
	char name[50], name2[50];
	ssize_t count;

	system("insmod knull");

	addr=find_module_addr();
	kaddr=find_kmem_offset(IOPORT)-HEXOFF;
	kd=open(KMEM, O_RDONLY);
	if(kread(kd, (unsigned long)addr, &modk, sizeof(struct module)) == -1) err("kread error");
	if(kread(kd, (unsigned long)modk.name, &name, 50) == -1) err("kread error");
	printf("Module              Address           Size");
	printf("\n%-20s%8p%12ld\n", name, (void*)addr, modk.size);

	for(i=0;(unsigned long)modk.next != kaddr;modk.next=pmodk.next,i++){
		memset(&pmodk, 0, sizeof(struct module));
		if(kread(kd, (unsigned long)modk.next, &pmodk, sizeof(struct module)) == -1) err("kread error");
		if(kread(kd, (unsigned long)pmodk.name, &name2, 50) == -1) err("kread error");
		if(pmodk.flags) printf("%-20s%8p%12ld\n", name2, modk.next, pmodk.size);
		if((unsigned long)modk.next < bottom) bottom = (unsigned long)modk.next;
		end = (unsigned long)modk.next;
	}

	system("rmmod knull");

	printf("\nDo you want to scan memory for LKMs ? [y] "); fflush(NULL);
	if((i=getchar())=='\n' || i=='y' || i=='Y') { 
		printf("Insert initial address: [%p] ", (void *)bottom - 0x80000); fflush(NULL) ;
		count=read(0, name, 12); name[count-1]='\0';
		if(name[0]=='\0') 
			bottom -= 0x80000;
		else bottom = strtoul(name, NULL, 16);
		addr += 0x1000000;
		printf("\nSearching Kernel Memory for LKMs from %p to %p\n\n", (void *)bottom, (void *)addr);
		for( ;bottom < addr ; bottom++) {
			if(kread(kd, (unsigned long)bottom, &modk, sizeof(struct module)) == -1) break;
			if(modk.size_of_struct == pmodk.size_of_struct)
		   		if(!(modk.flags & MOD_UNINITIALIZED))
					switch(modk.flags){
						case 1:
						case 3:
						case 5:
						case 7:
						case 9:
						case 11:	
						case 13:
						case 15:
						case 17:
						case 19:
						case 21:
						case 23:
						case 25:
						case 27:
						case 29:
						case 31: 
							printf("%p\n", (void *)bottom);
							break;
						default:
							break;
					}
		}

		printf("\nInsert address to probe: "); fflush(NULL);
		count=read(0, name, 12); name[count-1]='\0';
		probe = strtoul(name, NULL, 16);
		if(!probe) return(1);
		else probe_slkm(probe);

		printf("\nDo you want to make this LKM removable ? [y] "); fflush(NULL);
		if((i=getchar())=='\n' || i=='y' || i=='Y'){
			kd2 = open("/dev/kmem", O_WRONLY);
			if(kread(kd, (unsigned long)end, &modk, sizeof(struct module)) == -1) err("kread error");
			(unsigned long) modk.next = probe;
			if(kwrite(kd2, (unsigned long)end, &modk, sizeof(struct module)) == -1) err("kwrite error");

			if(kread(kd, (unsigned long)probe, &modk, sizeof(struct module)) == -1) err("kread error");
			(unsigned long) modk.next = kaddr;
			if(kwrite(kd2, (unsigned long)probe, &modk, sizeof(struct module)) == -1) err("kwrite error");
		}
	}
	return(1);
}

int probe_slkm(unsigned long addr)
{
	int kd;
	struct module stealth;
	struct module_symbol syms;
	char name[50], name2[100];

        kd=open(KMEM, O_RDONLY);
	if(kread(kd, (unsigned long)addr, &stealth, sizeof(struct module)) == -1) err("kread error");
	if(kread(kd, (unsigned long)stealth.name, &name, 50) == -1) err("kread error");
	printf("\nProbing memory at %p\n\n", (void*)addr);
	printf("Name:\t%s\n", name);
	printf("Size:\t%ld\n", stealth.size);
	printf("Flags:\t");
	if(stealth.flags & MOD_UNINITIALIZED)
		printf("MOD_UNINITIALIZED ");
	if(stealth.flags & MOD_RUNNING)
		printf("MOD_RUNNING ");
	if(stealth.flags & MOD_DELETED)
		printf("MOD_DELETED ");
	if(stealth.flags & MOD_AUTOCLEAN)
		printf("MOD_DELETED ");
	if(stealth.flags & MOD_AUTOCLEAN)
		printf("MOD_AUTOCLEAN ");
	if(stealth.flags & MOD_VISITED)
		printf("MOD_VISITED ");
	if(stealth.flags & MOD_USED_ONCE)
		printf("MOD_USED_ONCE ");
	if(stealth.flags & MOD_JUST_FREED)
		printf("MOD_JUST_FREED ");
	printf("\n");
	if(kread(kd, (unsigned long)stealth.syms, &syms, sizeof(struct module_symbol)) == -1) err("kread error");
	if(kread(kd, (unsigned long)syms.name, &name2, 100) == -1) err("kread error");
	printf("First Registered Symbol:\t%s at %p\n\n", name2, (void*)syms.value);
	return(0);
}
