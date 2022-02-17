   ;‘¥à¢¨áë¥ ®¯¥à æ¨¨ (c) 1999 by RedArc

   ;---
   GoToBegin:
          mov ax,4200h
          sub cx,cx
          int IntConst ;“å®¤¨¬    ©¤¥®¥ ¬¥áâ® ¢ ä ©«¥
          ret
   ;---
   GoToEnd:
          sub dx,dx
          sub cx,cx
          mov ax,4202h
          int IntConst ;“å®¤¨¬ ¢ ª®¥æ ä ©« 
          ret
   ;---
   SetFAttr:
          lea dx,[bp+DTA_NEW+1eh]
          mov ax,4301h
          int IntConst ;Žç¨é ¥¬  âà¨¡ãâë ä ©« 
          ret
   ;---
   ZerroBuffer:
          push ax cx di
          mov cx,IndexBuff
          lea di,[bp-IndexBuff]
          xor ax,ax
          cld
          rep stosb
          pop di cx ax
          ret
   ;---
