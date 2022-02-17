; Hi Ralph !
; Simple STACK trick! (by lado)
; Sucks all known debugger ! (DEBUG,TD,SST,MMD)
; ASM by rar

.model  tiny
.data
.code
org     100h
.startup

start:
;--------------
body:   xor     ax,ax
        jmp     start1
                                        ;
                                        ;
                                        ;
                                        ;program body
                                        ;
                                        ;
                                        ;
aaab:   jmp     short cont
;--------------
start1: int     12h
        mov     bp,sp
        mov     al,byte ptr [bp-6]

        mov     bx,offset body
        mov     cx,start1-body-2
bont:   xor     byte ptr [bx],al
        inc     bx
        loop    bont

        sub     word ptr [bp-6],2+(start1-aaab)
        sub     sp,6
        iret
;--------------
cont:
        mov     ah, 9
        call    next

db      "Stack  Trick #1 - Passed!$"
next:   pop     dx
        int     21h
        int     20h
.data
END
