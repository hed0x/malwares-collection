
include                 UUE.INC
include                 ..\..\INCLUDE\consts.inc

                        public  uuencode

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

hdr1                    db      'begin 644 '
hdr1_size               equ     $-hdr1

hdr2                    db      '`',13,10
                        db      'end',13,10
hdr2_size               equ     $-hdr2

                        .code

uuencode                proc    c
                        arg     ibuf
                        arg     isize
                        arg     obuf
                        arg     osizeptr
                        arg     fnameptr
                        pusha
                        cld

                        mov     edi, obuf

                        lea     esi, hdr1
                        mov     ecx, hdr1_size
                        rep     movsb

                        mov     esi, fnameptr
__cycle0:               lodsb
                        stosb
                        or      al, al
                        jnz     __cycle0
                        dec     edi

                        mov     ax, 0A0Dh
                        stosw

                        mov     esi, ibuf

__cycle1:               mov     ecx, 45
                        cmp     ecx, isize
                        jbe     __full
                        mov     ecx, isize
__full:
                        lea     eax, [ecx+32]
                        stosb

__cycle2:               call    __in
                        call    __in
                        call    __in

                        call    __out
                        call    __out
                        call    __out
                        call    __out

                        sub     ecx, 3
                        jg      __cycle2

                        mov     ax, 0A0Dh
                        stosw

                        cmp     isize, 0
                        jne     __cycle1

                        lea     esi, hdr2
                        mov     ecx, hdr2_size
                        rep     movsb

                        sub     edi, obuf
                        mov     eax, osizeptr
                        xchg    edi, eax
                        stosd

                        popa
                        ret

; 11111122 22223333 33444444

__in:                   shl     eax, 8
                        cmp     isize, 0
                        jz      __retn
                        dec     isize
                        lodsb
__retn:                 retn

__out:                  push    eax
                        shr     eax, 18
                        and     al, 111111b
                        add     al, 20h
                        cmp     al, 20h
                        jne     __stosb
                        mov     al, 60h
__stosb:                stosb
                        pop     eax
                        shl     eax, 6
                        retn

uuencode                endp

                        end
