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

        mov si,offset Demo
        mov cx,PrgLen
        cld
        rep movsb

        mov dx,offset File1
        call    WrFile

        push    cs
        pop ds

        call    JuNK_DOIT

        mov dx,offset File2
        call    WrFile

        mov ah,49h
        int 21h
        mov ax,4C00h
        int 21h
WrFile:
        mov ah,3Ch
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
        ret

;----------------------------------------------------------------------------
demo:
        CALL    Print
        DB  13,10,'DirectPhantom v2.0 with Ultimate TRASH !'
        DB  13,10,'$'
Print:      POP DX
        MOV AH,9
        INT 21h
        MOV AX,4C00h
        INT 21h
PrgLen      equ $ - demo

file1       db 'demo1.com',0
file2       db 'demo2.com',0
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
