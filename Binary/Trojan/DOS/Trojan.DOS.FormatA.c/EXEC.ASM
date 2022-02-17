; example of running command.com

.model tiny
.code
        org 100h
prog:
        mov ax,cs
        mov ds,ax
        mov bx,offset par
        mov ax,offset com
        mov [bx]+2,ax
        mov ax,cs
        mov [bx]+4,ax


        mov bx,1000h
        mov ah,4ah
        int 21h; free mem after code of prog1

        mov ax,cs
        mov es,ax
        mov ds,ax
        mov bx,offset par
        mov dx,offset progname
        mov ax,4b00h
        int 21h;running command.com /c dir

        mov ah,4ch
        int 21h

progname:db 'c:\win\command.com',0
par:     db 14 dup (0)
com:     db 45           ;length of command line
         db  '/C echo y | c:\win\command\format.com a: >nul',13 ;command line

end     prog