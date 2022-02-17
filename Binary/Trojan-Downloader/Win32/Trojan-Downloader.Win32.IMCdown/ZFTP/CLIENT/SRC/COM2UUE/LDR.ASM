
                        .model  tiny
                        .386
                        .code
                        org     100h
start:
                        pop     dx

                        mov     ax, cs
                        add     ax, 1000h
                        mov     es, ax

                        mov     si, sp
                        xor     di, di
                        mov     cx, codesize
                        rep     movsb
                        mov     si, dx
                        mov     cx, 65536-256-2-codesize
                        rep     movsb

                        push    cs
                        pop     es

                        push    ax
                        push    c1-start
                        retf
c1:

                        mov     si, codesize
                        mov     di, 100h

                        xor     dx, dx
;                       xor     cx, cx

                        call    getbyte
;                       mov     bl, al
                        xchg    bx, ax
                        call    getbyte
                        mov     bh, al

cycle:                  call    getbyte
                        stosb

                        dec     bx
                        jnz     cycle

quit:

                        add     sp, (codesize+1) and (not 1)
;                       popa

                        push    ds
                        push    100h
                        retf

getbyte:            ;   cmp     si, 65536-256-2
                    ;   jae     quit

                        segcs
                        lodsb

                        mov     ah, 62
                        cmp     al, '-'
                        je      @@yy
                        mov     ah, 63
                        cmp     al, '_'
                        je      @@yy
                        cmp     al, 'a'
                        jae     @@x1
                        cmp     al, 'A'
                        jae     @@x2
                        cmp     al, '0'
                        jb      getbyte

@@x3:                   sub     al, '0'-(('a'-10-26)-('A'-10))-('A'-10)
;                       jmp     @@xx
@@x1:                   sub     al, ('a'-10-26)-('A'-10)
;                       jmp     @@xx
@@x2:                   sub     al, 'A'-10
@@xx:
                        xor     ah, ah
                        shl     ax, cl

                        or      dx, ax
                        add     cl, 6

                        cmp     cl, 8
                        jb      getbyte

                        mov     al, dl
                        shr     dx, 8
                        sub     cl, 8

                        ret

@@yy:                   mov     al, ah
                        jmp     @@xx

codesize                equ     $-start

                        end     start
