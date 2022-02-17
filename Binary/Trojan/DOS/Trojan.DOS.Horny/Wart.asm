code    segment
    assume cs:code, ds:code
    org 100h
vlength equ (resi_leap-start+15)/16
start:
jmp resi_leap
old_int9    dd  ?

my_int9:
push    ax
push    cx
push    ds
in  al,60h
cmp al,35
je  wart_growth
cmp al,104
je  wart_growth
cmp al,20
je  wart_growth

cmp al,116
je  wart_growth

jmp bye_bye

wart_growth:
mov al,192
out 43h,al
mov ax,1000
out 42h,al
mov al,ah
out 42h,al
in  al,61h
mov ah,al
or  al,03
out 61h,al
mov cx,19000
pause:
loop    pause
mov al,ah
out 61h,al


bye_bye:
pop ds
pop cx
pop ax
jmp cs:old_int9

resi_leap:
cli
mov ax,3509h
int 21h
mov word ptr old_int9,bx
mov word ptr old_int9+2,es
mov ax,2509h
mov dx,offset my_int9
int 21h
mov ah,31h
mov dx,vlength
sti
int 21h

wart        db  'Horny Toad!',10,13

code    ends
    end start
