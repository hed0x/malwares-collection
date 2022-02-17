;=         -  -         =;
; The Spy's Carry Method ;
;=         -  -         =;

.model tiny
.code
	org 100h
start:
	push cs
	push cs
	pop ds
	pop es

	mov cl,cfsets
	lea si,body
	mov di,si
	mov bl,key
	lea bp,encrypt
	xor dx,dx
decr:
	cmp cl,dl
	jz body
	cmp si,bp
	jz body
	clc

	lodsb
	sub al,bl
	stosb

	jc addone
	jmp decr

key	db	00h
cfsets	db	00h

addone:
	inc dl
	jmp decr
body:
	mov ah,9
	lea dx,msg
	int 21h
	jmp encrypt
msg	db 'TSCM Works!!','$'

encrypt:
	lea si,key
	in ax,40h
	db 0D5h,10h
	mov byte ptr [si],al
	mov bl,al
	in al,40h
	mov byte ptr [si+1],al
	mov cl,al
	lea bp,encrypt
	lea si,body
	mov di,si
	xor dx,dx
encr:
	cmp cl,dl
	jz exit
	cmp si,bp
	jz exit
	clc

	lodsb
	add al,bl
	stosb

	jc indl
	jmp encr

indl:
	inc dl
	jmp encr

fname	db 'carry.com',0
exit:
	mov ah,3Ch
	xor cx,cx
	lea dx,fname
	int 21h
	xchg ax,bx
	mov ah,40h
	mov cx,(last-start)
	lea dx,start
	int 21h
	mov ah,3Eh
	int 21h
	int 20h
last:
end start
