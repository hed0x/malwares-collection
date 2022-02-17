
.model	tiny
.code
.startup
jmp	install

text	db	"Hallo Hacker",0ah,0dh,"$"
dreier	dd	0
dosint	dd	0


write	proc	near
mov	ah,09
mov	dx,offset text
int	21h
ret
write	endp

new3	proc	near
int	60h
int	61h
call	write
jmp	dword	ptr cs:[dreier]
new3	endp


egon2	proc	near
sub	byte	ptr [int21+1],60
ret
egon2	endp

egon	proc	near
sub	byte	ptr [hugo+4],10h
ret
egon	endp

install:
mov	ax,3521h
int	21h
mov	word	ptr dosint,bx
mov	word	ptr dosint+2,es


mov	ax,3503h
call	dword	ptr cs:[dosint]
mov	word	ptr dreier,bx
mov	word	ptr dreier+2,es

mov	dx,offset new3
push	cs
pop	ds
mov	ax,2503h
call	dword	ptr cs:[dosint]
push	ds
push	ax
push	bx
push	cs
pop	ds
call	egon
hugo:
	add	byte ptr [label_+1],30h
label_:
	mov	ah,2ch
call	egon2
int21:
	int	93
pop	bx
pop	ax
pop	dx
call	write


mov	ax,4ch
call	dword	ptr cs:[dosint]
end


