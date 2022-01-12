; SIMPLE POLYMORfIC LANGUAGE  Version 2.00 
; (c)1998 by ANAX, Greece.
;
; "HELLO1.ASM"
; This program calls the engine founded in hello.spl  
; which will create a simple routine. That routine prints the
; message "Hello World". Then writes that routine in a file called "hello.co_"



CODE SEGMENT
ASSUME CS:CODE,DS:CODE,ES:CODE

org 0100h
HELLO1:

;print message
	mov ah,9
	push cs
	pop ds
	mov dx,offset message
	int 21h

;create file
	mov ah,3Ch
	mov cx,0
	mov dx,offset filename
	int 21h
	mov bx,ax



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

;now the a routine is at DS:100h

;write the virus
	mov ah,40h
	mov cx,80h
	mov dx,100h
	int 21h

;close the file
	mov ah,3Eh
	int 21h	

;exit to dos
	mov ah,4Ch
	int 21h

message DB "HELLO1  -  Hello World",10,10,13
	db "This program demostrates the use of SPL v2.00",10,13
        db "It calls the engine:'hello.inc'and writes the output in",10,13
        db "the file: 'hello.co_'.",10,13
        db " $"     
filename db "hello.co_",0

;---------------------Here start SPL ----------------------
;Instead of copying the file HELLO.inc in our virus file,
;you can use the following command:

INCLUDE HELLO.INC
INCLUDE splVM.INC
INCLUDE splrand.INC


CODE ENDS
     END HELLO1                                                           
