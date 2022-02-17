
                        .model  tiny
                        .386
                        .code
                        org     100h
start:

                        lea     si, end_of_loader
                        lea     bx, getbyte

                        mov     di, 6666h       ; runner
                        push    di

                        xor     dx, dx
                        xor     bp, bp

cycle:
                        call    bx
                        xchg    cx, ax
                        jcxz    c2

c1:                     call    bx
                        stosb
                        loop    c1
c2:
                        call    bx
                        xchg    cx, ax

                        xor     al, al
                        rep     stosb

                        jmp     cycle

getbyte:                xchg    cx, bp
getbyte2:
                        lodsb
                        mov     ah, al

                        cmp     ah, 32
                        je      rt

                        mov     al, 64
                        dec     ax
                        cmp     ah, '_'
                        je      @@yy
                        dec     ax
                        cmp     ah, '-'
                        je      @@yy
                        cmp     ah, 'a'
                        jae     @@x1
                        cmp     ah, 'A'
                        jae     @@x2
;                       cmp     ah, '0'
;                       jb      getbyte

@@x3:                   sub     ah, '0'-(('a'-10-26)-('A'-10))-('A'-10)
@@x1:                   sub     ah, ('a'-10-26)-('A'-10)
@@x2:                   sub     ah, 'A'-10
@@xx:
                        mov     al, ah

@@yy:                   xor     ah, ah
                        shl     ax, cl

                        or      dx, ax
                        add     cl, 6

                        cmp     cl, 8
                        nop
                        nop
                        jb      getbyte2
                        sub     cl, 8

                        mov     ax, dx
                        shr     dx, 8

                        xor     ah, ah

                        xchg    cx, bp
                        retn

rt:
                        pop     cx ; ret. addr
                        retn

end_of_loader:

                        end     start
