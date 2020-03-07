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
        jc  exit

        mov ah,48h
        mov bx,40h
        int 21h
        jc  exit
        mov es,ax

        movzx   eax,ax
        rol eax,10h
        mov [TARGETPLACE],eax
        mov [RELOFFS],100h
        mov [DEST_CODE],0FFFFh
        mov [COUNTER],PrgLen

        call    PHANTOM

        mov si,offset Demo
        mov cx,PrgLen
        cld
        rep movsb

        call    JuNK_DOIT

        mov ah,3Ch
        mov dx,offset FILE
        xor cx,cx
        int 21h

        mov bx,ax

        mov ah,40h
        mov cx,PrgLen
        add cx,[LenDecryptor]
        lds dx,[targetplace]
        int 21h

        mov ah,3Eh
        int 21h

        sti
        mov es,word ptr cs:[targetplace+2]
        mov ah,49h
        int 21h
exit:
        mov ax,4C00h
        int 21h

;----------------------------------------------------------------------------
demo:
        call    Print
        db  13,10,'DirectPhantom v2.1 with SUB & CALL Trash !'
        db  13,10,'$'
Print:      pop dx
        mov ah,9
        int 21h
        mov ax,4C00h
        int 21h
PrgLen      equ $ - demo

FILE        db 'phdemo.com',0
        dq 0ffffffffffffffffh
;----------------------------------------------------------------------------

reloffs     dw 0
dest_code   dw 0
counter     dw 0
targetplace dd 0
lendecryptor    dw 0

include     phantom.asm
include     trash.asm

CSEG        ENDS
                END     START
