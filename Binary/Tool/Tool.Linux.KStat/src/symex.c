/*
 * Name: kstat v.1.1 symex.c
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

int find_kmem_offset(char *sym_name)
{
        struct new_module_symbol *syms, *s;
        size_t ret, bufsize, nsymbols, j;

        syms=malloc(bufsize = sizeof(struct new_module_symbol));
        retry_kern_symbol_load:
        if(query_module(NULL, QM_SYMBOLS, syms, bufsize, &ret)){
                if (errno == ENOSPC){
                        syms =(struct new_module_symbol *)realloc(syms, bufsize = ret);
                        goto retry_kern_symbol_load;
                }
                printf("find_kmem_offset: QM_SYMBOLS error %d\n", errno);
                return -1;
        }
        nsymbols = ret;

        for (j = 0, s = syms; j < nsymbols; ++j, ++s){
                if(strstr((char *)syms+s->name, sym_name)){
                        free(syms);
                        return s->value;
                }
        }
        printf("%s Kmem Offset Not Found\n\n", sym_name);
        free(syms);
        return -1;
}

int kread(int des, unsigned long addr, void *buf, int len)
{
        int rlen;

        if(lseek(des, (off_t)addr, SEEK_SET) == -1)
                return -1;
        if((rlen = read(des, buf, len)) != len)
                return -1;
        return rlen;
}

int main()
{
	FILE *fd, *wd;
	int kd, i=0, x=0;
	unsigned int kaddr;
	unsigned long *syscall_table[256], system_call_addr, sys_call_table_addr;
        char stringa[80], nome[30], *buf, def[7], fingerp[FPRINT_SIZE], sch_code[100];
	struct proto ops;

	kd=open("/dev/kmem", O_RDONLY);
        asm ("sidt %0" : "=m" (idt));
        kread(kd, idt.base+8*0x80, &sc_idt, sizeof(sc_idt));
        system_call_addr = (sc_idt.off2 << 16) | sc_idt.off1;
        kread(kd, system_call_addr, sch_code, 100);
        buf = (char *) memmem(sch_code, 100, "\xff\x14\x85", 3);
        sys_call_table_addr = *(unsigned *)(buf+3);

	fd=fopen("include/syscall.h", "w");
	fprintf(fd, "unsigned long calls[256]={");

	if(kread(kd, (unsigned long)sys_call_table_addr, &syscall_table, sizeof(syscall_table)) == -1) {
		printf("kread error\n");
		exit(-1);
	}

	for(i=0; i<256; i++)
		fprintf(fd, "%p,", (void*)syscall_table[i]);

	fseek(fd, -1, 1);
	fprintf(fd, "};\n");

        wd=fopen("/usr/include/asm/unistd.h", "r");
        fprintf(fd, "\n\nchar *names[256]={\"ni_syscall\",");
        while((buf=fgets(stringa, 80, wd)))
                if(strstr(stringa, "__NR_"))
                        if(strstr(stringa, "#define")){
                                sscanf(stringa, "%s %s %i", def, nome, &i);
                                if(i==x+1)
                                        fprintf(fd, "\"%s\",", nome+5);
                                else fprintf(fd, "\"ni_syscall\",\"%s\",", nome+5);
                                x=i;
                        }
        fseek(fd, -1, 1);
        fprintf(fd, "};\n");
        fclose(wd);

	fprintf(fd, "\n\nchar *fingerprints[256]={\n");
	for(i=0; i<256; i++){
		if(kread(kd, (unsigned long)syscall_table[i], &fingerp, sizeof(fingerp)) == -1) err("kread error");
		fprintf(fd, "\"");
		for(x=0; x < FPRINT_SIZE; x++)
			fprintf(fd, "\\x%x", fingerp[x]&0x000000ff);
		fprintf(fd, "\",");

	}
        fseek(fd, -1, 1); 
        fprintf(fd, "};\n");	
	fclose(fd);

        system("/sbin/insmod ./procex.o");
        fd=fopen("/proc/kstat_proc_syms", "r");
        wd=fopen("include/procsyms.h", "w");
        while((buf=fgets(stringa, 80, fd))) {
                fprintf(wd, "#define ");
                fputs(stringa, wd);
        }

        fclose(fd);
        fclose(wd);
        system("/sbin/rmmod procex");

	kaddr=find_kmem_offset(INETOPS)-TCPOFF;
        if(kread(kd, (unsigned long)kaddr, &ops, sizeof(struct proto)) == -1) {
                printf("kread error1\n");
                exit(-1);
        }
	fd=fopen("include/netproto.h", "w");
	fprintf(fd, "#define TCP_PROT_OPS\t\"tcp_prot\"\n#define TCP_PROT_ADDR\t%p\n", (void*)kaddr);
	fprintf(fd, "#define TCP_SEND\t\"tcp_sendmsg\"\n#define TCP_SEND_ADDR\t%p\n", (void*)ops.sendmsg);
	fprintf(fd, "#define TCP_RECV\t\"tcp_recvmsg\"\n#define TCP_RECV_ADDR\t%p\n", (void*)ops.recvmsg);

	kaddr=find_kmem_offset(INETOPS)-UDPOFF;
        if(kread(kd, (unsigned long)kaddr, &ops, sizeof(struct proto)) == -1) {
                printf("kread error1\n");
                exit(-1);
        }
        fprintf(fd, "#define UDP_PROT_OPS\t\"udp_prot\"\n#define UDP_PROT_ADDR\t%p\n", (void*)kaddr);
        fprintf(fd, "#define UDP_SEND\t\"udp_sendmsg\"\n#define UDP_SEND_ADDR\t%p\n", (void*)ops.sendmsg);
        fprintf(fd, "#define UDP_RECV\t\"udp_recvmsg\"\n#define UDP_RECV_ADDR\t%p\n", (void*)ops.recvmsg);

        kaddr=find_kmem_offset(INETOPS)-RAWOFF;
        if(kread(kd, (unsigned long)kaddr, &ops, sizeof(struct proto)) == -1) {
                printf("kread error1\n");
                exit(-1);
        }
        fprintf(fd, "#define RAW_PROT_OPS\t\"raw_prot\"\n#define RAW_PROT_ADDR\t%p\n", (void*)kaddr);
        fprintf(fd, "#define RAW_SEND\t\"raw_sendmsg\"\n#define RAW_SEND_ADDR\t%p\n", (void*)ops.sendmsg);
        fprintf(fd, "#define RAW_RECV\t\"raw_recvmsg\"\n#define RAW_RECV_ADDR\t%p\n", (void*)ops.recvmsg);

	fclose(fd);

	fd=fopen("include/syscall_handler.h", "w");
	kaddr=find_kmem_offset(SYSCALL);
	fprintf(fd, "#define SYSTEM_CALL\t\t%p\n", (void *)system_call_addr);
	if(kaddr == sys_call_table_addr || kaddr == -1)
	fprintf(fd, "#define SYS_CALL_TABLE\t\t%p\n", (void *)sys_call_table_addr);
	else { printf("\nWARNING! Mismatch between your kernel sys_call_table symbol\n");
		printf("and running system_call handler. Maybe this kernel has already been\n");
		printf("patched or sys_call_table symbol can't be found.\n");
		printf("Legal symbol: 0x%x - Running address: 0x%lx\n", kaddr, sys_call_table_addr);
		printf("KSTAT output might be untrustable ! Using 0x%lx ...\n", sys_call_table_addr);
		sleep(3);
	}
	fprintf(fd, "#define SC_TABLE_PTR\t\t%p\n", (void *)(system_call_addr+(buf-sch_code)+3));
	fprintf(fd, "#define IDT_OFF1\t\t0x%x\n", sc_idt.off1);
	fprintf(fd, "#define IDT_OFF2\t\t0x%x\n", sc_idt.off2);
	fclose(fd);

	close(kd);
	exit(0);
}
