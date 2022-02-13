
                        model   tiny
                        p386
                        locals  __
                        jumps

                        .code

                        org     100h
start:

                        org     6666h

                        mov     ah, 3ch
                        xor     cx, cx
                        lea     dx, filename
                        int     21h
                        xchg    bx, ax

                        mov     ah, 40h
                        lea     dx, packed
                        mov     cx, 4096
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

                        mov     ah, 4ch
                        int     21h

filename                db      'x.exe',0

packed:                 db      ?

                        org     0f000h
eof:
                        end     start
