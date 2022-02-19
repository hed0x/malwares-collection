
; This is [SDFE] GEN v2.0
; Written by Zhuge Jin in Taipei, Taiwan.
; (C) Copyright TPVO . , 1995.

        .286
        .MODEL TINY
        .CODE

        extrn SDFE:near,SDFE_E:near

msg_addr equ OFFSET msg-OFFSET proc_start-3

        org 0100h

start:
        mov ah,09h
        mov dx,OFFSET gen_msg
        int 21h

        mov ax,OFFSET SDFE_E+000fh
        shr ax,04h
        mov bx,cs
        add bx,ax
        mov es,bx
        mov cx,0050

gen_l1:
        push cx

        mov ah,3ch
        xor cx,cx
        mov dx,OFFSET file_name
        int 21h

        xchg bx,ax
        mov cx,OFFSET proc_end-OFFSET proc_start
        mov dx,OFFSET proc_start

        push bx

        mov bx,0100h

        in ax,40h
        and ax,0007h
        mov bp,ax

        mov ax,0000h

        call SDFE

        pop bx

        mov ah,40h
        int 21h

        mov ah,3eh
        int 21h

        push cs
        pop ds

        mov bx,OFFSET file_no
        inc byte ptr ds:[bx+0001h]
        cmp byte ptr ds:[bx+0001h],'9'
        jbe gen_l2
        inc byte ptr ds:[bx]
        mov byte ptr ds:[bx+0001h],'0'

gen_l2:
        pop cx
        loop gen_l1

        mov ah,4ch
        int 21h

file_name db 'T'
file_no db '00.COM',00h
gen_msg db 0dh,0ah,'Generates 50 [SDFE] encrypted test files...',0dh,0ah,'$'

proc_start:
        call $+0003h
        pop dx
        add dx,msg_addr
        mov ah,09h
        int 21h
        int 20h

msg db 'This is a [SDFE] test file!$'

proc_end:

        END start

