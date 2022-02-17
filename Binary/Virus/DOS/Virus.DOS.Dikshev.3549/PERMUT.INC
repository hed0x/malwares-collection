   ;*à®æ¥¤ãàë ¤«ï ¯¥à¬ãâ æ¨¨ (c) 1999 by RedArc

   ;--- ‡ ¯¨áì ¯¥à¥å®¤ -¯ãáâëèª¨.
   Jump:
       push ax bx
       call _Calc_Rnd16
       mov al,0e9h
       stosb
       xchg bx,ax
       stosw
       pop bx ax
       ret

   ;--- *®«ãç¥¨¥ á®áâ®ï¨ï ä« £  ¤«ï ¡«®ª 
   ;Input:  al - block
   ;Output: al - range
   Get_Flag:
       push si bx
       mov bx,ax
       lea si,[bp+TabelleFlags]
       mov ah,0
       add si,ax
       mov al,byte ptr ds:[si]
       mov bl,al
       xchg bx,ax
       pop bx si
       ret

   ;--- ‚ëáâ ¢«¥¨¥ ä« £  ¤«ï ¡«®ª 
   ;Input:  al - block
   ;Output: none
   Put_Flag:
       push ax si
       mov ah,0
       lea si,[bp+TabelleFlags]
       add si,ax
       mov byte ptr ds:[si],1
       pop si ax
       ret

   ;--- Š «ìªã«ïæ¨ï ¯¥à¥å®¤ 
   ;Input:  si -  ¤à¥á ¬¥âª¨ ¤«ï ¯¥à¥å®¤ 
   ;        di -  ¤à¥á ª®¬ ¤ë ¯¥à¥å®¤ 
   ;        bx -  ¤à¥á  ç «  ¡ãä¥à 
   ;Output: none
   CalcJump:
            push ax bx cx dx
            mov ax,di
            mov dx,si
            sub ax,bx
            sub dx,bx
            cmp ax,dx
            jl JumpDown
   JumpUp:
            mov cx,0ffffh
            sub ax,dx
            sub cx,ax
            sub cx,2
            xchg dx,cx
            jmp FormJump
   JumpDown:
            add ax,3
            sub dx,ax
   FormJump:
            mov word ptr ds:[di+1],dx
            pop dx cx bx ax
            ret
