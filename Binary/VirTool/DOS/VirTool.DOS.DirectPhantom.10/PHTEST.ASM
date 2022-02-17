        .486
        MODEL   TINY
CSEG        SEGMENT PARA PUBLIC USE16 'CODE'
        ASSUME  CS:CSEG,DS:CSEG
        ORG 100H
START:
        PUSH    CS
        POP DS

        mov bx,1000h
        mov ah,4ah
        int 21h

        mov ah,48h
        mov bx,40h
        int 21h
        mov es,ax

        movzx   eax,ax
        rol eax,10h
        mov [TARGETPLACE],eax
        mov [RELOFFS],100h
        mov [DEST_CODE],0FFFFh
        mov [COUNTER],PrgLen

        call    PHANTOM

        mov si,offset PROG
        mov cx,PrgLen
        cld
        rep movsb

        call    JuNK_DOIT

;-----------------------------------------

        MOV AH,3CH
        XOR CX,CX
        MOV DX,OFFSET FILE
        INT 21H

        MOV BX,AX

        MOV AH,40H
        MOV CX,PrgLen
        add cx,[LenDecryptor]
        lds dx,[targetplace]
        INT 21H

        POP DS
        MOV AH,3EH
        INT 21H

        mov ax,4c00h
        int 21h

;----------------------------------------------------------------------------
PROG:
    CALL    PRN
    DB  13,10,'DirectPhantom v1.0 beta is real working !'
    DB  13,10,'$'
PRN:    POP DX
    MOV AH,9
    INT 21h
    MOV AX,4C00h
    INT 21h
PrgLen  equ $-PROG
;----------------------------------------------------------------------------
trchain:
ret

file        db 'phdemo.com',0
handle      dw 0

reloffs     dw 0
dest_code   dw 0
counter     dw 0
targetplace dd 0
lendecryptor    dw 0
        dd 0ffffffffh

include     phantom.asm

CSEG        ENDS
                END     START
