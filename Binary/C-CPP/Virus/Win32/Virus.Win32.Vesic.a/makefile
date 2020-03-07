   vir.exe : vir.c entry.h stub.h
       lc -O2 vir.c -s

   entry.h : asm\entry
       bin2inc asm\entry entry.h

   stub.h : asm\stub
       bin2inc asm\stub stub.h

   asm\entry : asm\entry.s
       nasm asm\entry.s -l asm\entry.lst

   asm\stub : asm\stub.s
       nasm asm\stub.s -l asm\stub.lst
