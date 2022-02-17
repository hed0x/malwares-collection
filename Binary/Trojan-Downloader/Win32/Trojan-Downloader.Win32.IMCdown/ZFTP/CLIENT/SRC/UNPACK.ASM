
                        model   tiny
                        p386
                        locals  __
                        jumps

                        .code

                        org     100h
start:

                        lea     si, packed
                        lea     di, unpacked
                        call    z_decode_asm

                        mov     ah, 3ch
                        xor     cx, cx
                        lea     dx, filename
                        int     21h
                        xchg    bx, ax

                        mov     ah, 40h
                        lea     dx, unpacked
                        mov     cx, packed.word ptr 4
                        int     21h

                        mov     ah, 3eh
                        int     21h

                        lea     sp, eof

                        mov     ah, 4ah
                        mov     bx, (eof-start+256+15)/16
                        int     21h

                        push    cs
                        push    6dh
                        push    cs
                        push    5dh
                        push    cs
                        push    80h
                        push    0

                        mov     ax, 4B00h
                        lea     dx, filename
                        mov     bx, sp
                        int     21h

error:                  mov     ah, 41h
                        lea     dx, filename
                        int     21h
                        jc      error

                        mov     ah, 4ch
                        int     21h

include                 Z_CODING\z_decode.i16

filename                db      'x.exe',0

packed:                 db      16384 dup (?)

unpacked:             ; ...

                        org     0f000h
eof:
                        end     start
