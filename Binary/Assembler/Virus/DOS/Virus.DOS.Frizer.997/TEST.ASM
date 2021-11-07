.model tiny
.386
.code
.startup
org 100h
s:
db 1000h dup ('ê')
mov ah,8
mov ah,9
nop
lea dx,mes
nop
int 21h
nop
int 20h
mes db 'Hello, I`m Myxa ',13,10,'$'
xor bp,bp
e:
end
