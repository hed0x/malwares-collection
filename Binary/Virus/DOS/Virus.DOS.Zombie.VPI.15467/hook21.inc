   ; - -[HOOK21.INC] - - - - - - - - - - - - - - - - - - - - - - - - - - - - >8

   hook_21:        pusha
                   push    ds es

                   xor     si, si
                   mov     ds, si
                   les     bx, ds:[si+21h*4]
                   or      bx, bx
                   jz      @@1

                   mov     ax, in_id
                   int     21h
                   cmp     ax, out_id
                   je      @@1

                   mov     cs:old_21.offs, bx
                   mov     cs:old_21.segm, es

                   mov     ds:[si+21h*4].offs, offset int_21
                   mov     ds:[si+21h*4].segm, cs

   @@1:            pop     es ds
                   popa

                   ret
