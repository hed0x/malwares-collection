   ; - -[RND.INC]- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - >8

                   ; random number generator

                   ; output: ax=random(65536)
                   ;         zf=rnd(2)

   random:         push    bx
                   mov     bx, 1234h
   lastword        rndword
                   in      al, 40h
                   xor     bl, al
                   in      al, 40h
                   add     bh, al
                   in      al, 41h
                   sub     bl, al
                   in      al, 41h
                   xor     bh, al
                   in      al, 42h
                   add     bl, al
                   in      al, 42h
                   sub     bh, al
                   mov     cs:rndword, bx
                   xchg    bx, ax
                   pop     bx
                   test    al, 1
                   ret

                   ; input:  ax
                   ; output: ax=random(ax)
                   ;         zf=rnd(2)

   rnd:            push    bx
                   push    dx
                   xchg    bx, ax
                   call    random
                   xor     dx, dx
                   div     bx
                   xchg    dx, ax
                   pop     dx
                   pop     bx
                   test    al, 1
                   ret
