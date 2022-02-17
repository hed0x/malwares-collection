	.model tiny
	.code
	org  100h
start:
	mov  ax,3D00h
	call LoadName
db	'Normal.bot',0
LoadName:
	pop  dx
	int  21h
	jnc  NoError
	jmp  Error
NoError:
	xchg ax,bx
	mov  ax,4200h
	xor  cx,cx
	xor  dx,dx
	int  21h
	mov  ah,3Fh
	mov  cx,200h
	mov  dx,offset normal
	int  21h
	cmp  ax,cx
	jne  Error
	mov  ax,201h
	mov  dx,080h
	mov  bx,offset mbr
	mov  cx,1
	int  13h
	mov  cl,4
	lea  si,[bx+01aeh]
next:
	add  si,10h
	cmp  byte ptr [si],dl
	loopnz next
	jcxz no_boot
	mov  al,byte ptr [si+4]
	cmp  al,1
	jz   dos12
	cmp  al,4
	jb   no_boot
	cmp  al,6
	ja   no_boot
dos12:
	mov  ax,301h
	mov  bx,offset normal
	mov  dh,byte ptr [si+1]
	mov  cx,word ptr [si+2]
	int  13h
Success:
	call Load
db	'Boot sector is restored!','$'
Error:
	call Load
db	'Disk reading error!','$'
no_boot:
	call Load
db	'No active DOS partition found!','$'
Load:
	pop  dx
Show:
	push cs
	pop  ds
	mov  ah,9h
	int  21h
	ret
normal:
	db   200h dup (?)
mbr:
	db   200h dup (?)
end start