     sseg segment stack
          db 160 dup (?)
     sseg ends
     cseg segment
     assume cs:cseg,ss:sseg
     z     proc far

       push ds

       jmp serg

   ;  **Žƒ*€ŒŒ€ Ž**€*Ž’Šˆ 20 **…*›‚€*ˆŸ
   pri20:

       jmp prod
   ;**Žƒ*€ŒŒ€ Ž**€*Ž’Šˆ ”“*Š–ˆˆ 4ch 21h **…*›‚€*ˆŸ
   pri21:
       cmp ah,4ch
       je ppp
       cmp ah,0h
       je ppp
       jne pi21
   ppp:    jmp prod
       nop
   pi20:   db 0eah
   aaa dw 0,0
   pi21:   db 0eah
   aaa1    dw 0,0
       db 0
   adr1    dw 0
   adr2    dw 0
   zad1    dw 0
   zpsp    dw 0
   hand    dw 5

   r   dw 0    ;*®«ë© à §¬¥à ã¯à ¢«ïîé¥© ç áâ¨ § ¤ ç¨ ¢ ¡ ©â å.
   r1  dw 0    ;* §¬¥à ¨á¯®«ï¥¬®© ç áâ¨ ¯¥à¢®© § ¤ ç¨.
   r11     dw 0
   rf1     dw 0    ;‘¬¥é¥¨¥ ¤® ¨á¯®«ï¥¬®© ç áâ¨ ¯¥à¢®© § ¤ ç¨.
   rf11    dw 0
   r20 dw 0    ;r+¯®«ë© à §¬¥à ¯¥à¢®© § ¤ ç¨
   r21 dw 0
   r2      dw 0    ;* §¬¥à ¨á¯®«ï¥¬®© ç áâ¨ ¢â®à®© § ¤ ç¨.
   r22     dw 0
   rf2     dw 0    ;‘¬¥é¥¨¥ ¤® ¨á¯®«ï¥¬®© ç áâ¨ ¢â®à®© § ¤ ç¨.
   rf22    dw 0
   tab1    dw 0    ;’ ¡«¨æ  ¯¥à¥¬¥é¥¨ï ¯¥à¢®© § ¤ ç¨
   tab11   dw 0
   tab2    dw 0    ;’ ¡«¨æ  ¯¥à¥¬¥é¥¨ï ¢â®à®© § ¤ ç¨
   tab22   dw 0
   nomz    dw 0

   zag     dw 0    ;0
   dz      dw 0    ;+2
   dz1     dw 0    ;+4
   cnt dw 0  ;—¨á«® í«¥¬¥â®¢ ¢ â ¡«¨æ¥ ¯¥à¥¬¥é¥¨ï +6
   dzag    dw 0  ;„«¨  § £®«®¢ª  ¢ ¯ à £à ä å +8
   min dw 0  ;¬¨¨¬ã¬ ¯ ¬ïâ¨ §  ª®æ®¬ ¯à®£à ¬¬ë   +0a
   max     dw 0  ;¬ ªá¨¬ã¬ +0c
   stek    dw 0    ;ss +0e
   stekr   dw 0    ;sp +10
   ksum    dw 0        +12
   starip   dw 0    ;ip    +14
   starcs   dw 0    ;cs    +16
   tab      dw 0    ;‘¬¥é¥¨¥ â ¡«¨æë ¯¥à¥¬¥é¥¨ï  +18
   over     dw 0    ;*®¬¥à  ®¢¥à«¥¥¢   +1a
        dw 0,0,0,0,0

   dddm   db 'r.exe',0,0,0,0,0,0,0,0,0,0,0
   adrds  dw 0
   adrss  dw 0
   adrsp  dw 0
   ;========================================================
   serg:   pop ds
      mov cs:adrss,ss
      mov cs:adrds,ds
      mov cs:adrsp,sp
   push ds
   push es
          ;
   ;=====================================================
   ;+++++++ *¥à¥å¢ â¨âì 20h ¯à¥àë¢ ¨¥ ++++++++++++++++++
   ;=====================================================
   cli
       push cs
       pop ds
       mov es,ax
       mov bx,20h*4
       mov ax,es:[bx]
           mov dx,es:[bx+2]
       mov aaa,ax
       mov aaa[2],dx
       mov es:[bx+2],cs
       mov ax,offset pri20
       mov es:[bx],ax
   ;=====================================================
   ;+++++++ *¥à¥å¢ â¨âì 21h ¯à¥àë¢ ¨¥ ++++++++++++++++++
   ;=====================================================
       push cs
       pop ds
       mov ax,0
       mov es,ax
       mov bx,21h*4
       mov ax,es:[bx]
           mov dx,es:[bx+2]
       mov aaa1,ax
       mov aaa1[2],dx
       mov es:[bx+2],cs
       mov ax,offset pri21
       mov es:[bx],ax
   sti
   pop es
   pop ds
       jmp start

   ;Ž‘*Ž‚*€Ÿ **Žƒ*€ŒŒ€
   start:
       push cs
       pop ds
   ;Ž¯à¥¤¥«¨âì ¬¥áâ® § £àã§ª¨ ¤«ï ¯¥à¢®© ¯à¨ª«¥¥®© § ¤ ç¨
   mov ax,offset fin
   ror ax,1
   ror ax,1
   ror ax,1
   ror ax,1
   and ax,0fffh
   push cs
   pop bx
   add bx,ax
   add bx,1
   mov ax,bx
       add ax,16h
       mov bx,ax
       add bx,10h
       mov zad1,bx
       mov cs:zpsp,ax
   ;==============================================================
   das:    push cs
       pop ds
       mov dx,offset dddm
       mov ax,3d00h
       int 21h     ;®âªàëâì ä ©«
       mov bx,ax   ;«®£¨ç¥áª¨© ®¬¥à
       mov hand,bx
   ;‚ë¯®«¨âì lseek   à §¬¥à § £àã¦¥®© § ¤ ç¨
   cmp nomz,0
   je da1
   mov dx,cs:r20
   mov cx,cs:r21
   jmp da2
   da1:    mov dx,cs:r
       mov cx,0
   da2:    mov ax,4200h
       mov bx,cs:hand
       int 21h
   ;*à®ç¨â âì § £®«®¢®ª á«¥¤ãîé¥© § ¤ ç¨
       mov ah,3fh
       mov dx,offset zag
       mov cx,1ch
       int 21h
   ;Ž¯à¥¤¥«¨âì ä ©«®¢®¥ á¬¥é¥¨¥ § £àã¦ ¥¬®£® ¬®¤ã«ï
   cmp nomz,0
   je da3
   mov cx,cs:rf22
   mov dx,cs:rf2
   jmp da4
   da3:    mov cx,cs:rf11
       mov dx,cs:rf1
   da4:    mov bx,cs:hand
       mov ax,4200h
       int 21h     ;¢ë¯®«¨âì lseek
   ;*à®ç¨â âì ¬®¤ã«ì ¢ ¯ ¬ïâì.
   cmp nomz,0
   je da5
   mov cx,cs:r2
   jmp da6
   da5:    mov cx,cs:r1
   da6:    mov ds,cs:zad1
       mov dx,0
       mov ah,3fh
       mov bx,cs:hand
       int 21h
       mov dx,ax

   ver1:
   cmp cs:nomz,0
   je da51
   mov ax,cs:r22
   jmp da61
   da51:   mov ax,cs:r11
   da61:   cmp ax,0
       je dal1
       sub ax,1
   cmp cs:nomz,0
   je da52
   mov cs:r22,ax
   jmp da62
   da52:   mov cs:r11,ax
   da62:
       mov ah,3fh
       mov cx,0fff0h
       int 21h
       mov ax,ds
       add ax,0fffh
       mov ds,ax
       jmp ver1
   dal1:
       push cs
       pop ds
   ;“áâ ®¢¨âì ãª § â¥«ì ä ©«     ç «® â ¡«¨æë ¯¥à¥¬¥é¥¨ï 1 § ¤ ç¨
   cmp nomz,0
   je da7
   mov dx,cs:tab2
   mov cx,cs:tab22
   jmp da8
   da7:    mov dx,cs:tab1
       mov cx,cs:tab11
   da8:    mov bx,cs:hand
       mov ax,4200h
       int 21h     ;¢ë¯®«¨âì lseek
   ;„«ï ª ¦¤®£® í«¥¬¥â  ¯¥à¥¬¥é¥¨ï ¢ë¯®«¨âì á«®¦¥¨¥
       mov cx,cs:cnt
       cmp cx,0
       je fff
   zikl:   push cx
   ;¯à®ç¨â âì  ¤à¥á ¢ ¯ ¬ïâì
               push cs
           pop ds
           mov dx,offset adr1
           mov ah,3fh
           mov cx,4
           mov bx,cs:hand
           int 21h
   ;------------------°--------------------
               ;‚ëç¨á«¨âì  ¤à¥á
       mov ax,cs:zad1
       mov bx,cs:adr2
       add ax,bx
               mov bx,cs:adr1
               push es
                   push ax
                   pop es
               mov ax,es:[bx]
                       push bx
               mov bx,cs:zad1
               add ax,bx
                       pop bx
               mov es:[bx],ax
               pop es
       pop cx
       sub cx,1
       cmp cx,0
       jne zikl
       nop
   ;§ ªàëâì Q ©«
   fff:      mov bx,cs:hand
         mov ah,3eh
         int 21h
   ;ˆ¨æ¨ «¨§¨à®¢ âì à¥£¨áâàë ¨ § ¯ãáâ¨âì ¯à®£à ¬¬ã
          mov ds,cs:adrds
          mov es,cs:adrds

           mov bx,cs:zpsp

   ;       mov es,bx
   ;       mov ds,bx

           mov bx,cs:zad1
           add bx,cs:stek
           mov ss,bx
           moÙ sp,cs:stekr

       mov bx,cs:zad1
       add bx,cs:starcs
       mov ax,cs:starip
       push bx
       push ax
       mov ax,0
       ret
       nop*
   prod:   nop

       pop ax
       pop ax
       pop ax
   ;*à®¢¥à¨âì ª ª ï § ¤ ç  § ¯ãáª « áì ¯¥à¢ ï ¨«¨ ¢â®à ï?
   cmp cs:nomz,0
   jne da
   add cs:nomz,1
   mov ss,cs:adrss
   mov sp,cs:adrsp

   mov es,cs:adrds
   mov bx,0ffffh
   mov ah,4ah
   int 21h
   mov es,cs:adrds
   mov ah,4ah
   int 21h

   ;mov ah,48h
   ;mov bx,0ffffh
   ;int 21h
   ;mov ah,48h
   ;int 21h
   ;mov cs:zad1,ax
   jmp das
   da:
   mov ss,cs:adrss
   mov sp,cs:adrsp
   mov ds,cs:adrds
   mov es,cs:adrds
       cli
       mov ax,0
       mov es,ax
       mov ax,cs:aaa
       mov bx,20h*4
       mov es:[bx],ax
       mov ax,cs:aaa[2]
       mov es:[bx+2],ax
       sti
       mov ax,0
       mov es,ax
       cli
       mov ax,cs:aaa1
       mov bx,21h*4
       mov es:[bx],ax
       mov ax,cs:aaa1[2]
       mov es:[bx+2],ax
       sti
       push cs
       pop ds
   ;   mov dx,offset xaxa
   ;   mov ah,9h
   ;   int 21h     ;¢ë¤ âì á®®¡é¥¨¥

       mov ax,4c00h
       int 21h
   xaxa    db " *à®£à ¬¬  N 1 ®âà ¡®â « $",0
       db 0,0,0,0
   fin:    ret
          cseg ends
     end z
