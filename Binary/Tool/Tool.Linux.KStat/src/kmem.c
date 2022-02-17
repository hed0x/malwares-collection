/*
 * Name: kstat v.1.1 kmem.c
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

int kwrite(int des, unsigned long addr, void *buf, int len)
{
        int rlen;

        if(lseek(des, (off_t)addr, SEEK_SET) == -1)
                return -1;
        if((rlen = write(des, buf, len)) != len)
                return -1;
        return rlen;
}

int find_module_addr()
{
	char *module_names, *mname;
	size_t bufsize, ret;
	struct module_info info;

	module_names=malloc(bufsize = 256);
        retry_kern_symbol_load:
        if(query_module(NULL, QM_MODULES, module_names, bufsize, &ret)){
                if (errno == ENOSPC){
                        module_names=realloc(module_names, bufsize = ret);
                        goto retry_kern_symbol_load;
                }
                printf("find_module_addr: QM_MODULES error %d\n", errno);
                return -1;
        }
	
	mname = module_names;
	free(module_names);

	if (query_module(mname, QM_INFO, &info, sizeof(info), &ret)){
		printf("find_module_addr: QM_INFO error %d\n", errno);
                return -1;
        }
	return info.addr;
}
