        .486
        MODEL   TINY
CSEG        SEGMENT PARA PUBLIC USE16 'CODE'
        ASSUME  CS:CSEG,DS:CSEG
        ORG 100H
START:

        PUSH    CS
        POP DS

        mov bx,1000h
        mov ah,4Ah
        int 21h

        mov ah,48h
        mov bx,200h
        int 21h
        mov es,ax
        xor di,di

        mov cx,100
cycle:
        push    cx
        call    TRCHAIN
        mov eax,90909090h
        stosd
        pop cx
        loop    cycle

        mov al,0C3h
        stosb

        mov ah,3ch
        xor cx,cx
        mov dx,offset file
        int 21h

        mov bx,ax

        mov ah,40h
        mov cx,di
        push    ds
        push    es
        pop ds
        xor dx,dx
        int 21h

        pop ds
        mov ah,3eh
        int 21h

        mov ah,49h
        int 21h

        int 20h

file        db  'trash.com',0

dq 0FFFFFFFFFFFFFFFFh
;-----------------------------------------------------------------------------

reloffs     dw 0
dest_code   dw 0
counter     dw 0
targetplace dd 0
lendecryptor    dw 0

include     trash.asm
include     phantom.asm

CSEG        ENDS
                END     START
