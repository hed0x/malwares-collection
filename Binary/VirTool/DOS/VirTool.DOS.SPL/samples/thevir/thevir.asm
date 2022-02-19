; SIMPLE POLYMORfIC LANGUAGE  Version 2.00 
; (c)1998 by ANAX, Greece.
;
; "THEVIR.ASM"
; This program calls the engine founded in thevir.spl and prints 
; what the engine returns.


CODE SEGMENT
ASSUME CS:CODE,DS:CODE,ES:CODE

org 0100h
THEVIR:


;create the two buffers in DS and ES
;MSDOS reserve all the merory for a program, so all memory
;from my PSP up to 640k is mine.
	mov ax,cs 
	add ax,512  ;keep 8192bytes for the program           
	mov ds,ax   
        add ax,512  ;keep another 8192 for DS buffer  
        mov es,ax   ;the rest, goes to ES buffer

;randomize all variables 
	call splrand

;call the engine
	mov dx,cs
        mov si,offset spldata
	call splVM

;now a text sould be at DS:0000h
;print it!

mov ah,09h
mov dx,0
int 21h

;exit to dos
	mov ah,4Ch
	int 21h

;---------------------Here start SPL ----------------------
;Instead of copying the file thevir.inc in your virus file,
;you can use the following command:

INCLUDE splVM.INC
INCLUDE splrand.INC
INCLUDE thevir.INC
;---------------------Here ends SPL -----------------------

CODE ENDS
     END THEVIR          
