
        .model tiny
        .code
        org 100h

        extrn    mpe:near,mpeend:near,rndget:near,rndplainget:near,junkcode:near

start:
                mov ah,3ch
                xor cx,cx
                mov dx, offset file
                int 21h
                push ax
                mov al,00000001b
                mov si, offset prog
                mov cx, (endprog-prog)
                mov bp, 100h
                mov di, offset filler
                call mpe
                pop bx
                mov dx,offset filler
                mov ah, 40h
                int 21h
                mov ah, 3eh
                int 21h
                mov ah,9
                mov dx, offset msg
                int 21h
                int 20h
file            db '40hex.com',0
msg             db 'Run 40hex.com to decrypt and print a 40Hex(SmartLine) scripture$'
prog:           mov ah,9
                call $+3
delta:          pop dx
                add dx, (string-delta)
                int 21h
                int 20h
string          db 'I am KimInWoo. ',0dh,0ah
                db 'Please Join 40Hex(SmartLine)!! ',0dh,0ah
                db 'We Will Make better world!.$'
endprog:

filler          db   (endprog-prog+300h) dup(?)
end start
