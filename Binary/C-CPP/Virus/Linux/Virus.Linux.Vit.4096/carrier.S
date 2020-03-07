   #include <asm/unistd.h>

   .text

   .global _start

   _start:
       xorl %ebx,%ebx
       movl $__NR_exit,%eax
       int $0x80
       int $3
