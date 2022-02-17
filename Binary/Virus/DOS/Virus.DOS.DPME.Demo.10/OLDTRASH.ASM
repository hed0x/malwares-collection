   REG_AX      equ 0      ; *¥£¨áâàë ¯® ¯®àï¤ªã
   REG_CX      equ 1
   REG_DX      equ 2
   REG_BX      equ 3
   REG_SP      equ 4
   REG_BP      equ 5
   REG_SI      equ 6
   REG_DI      equ 7


   Wbit        EQU 00000001B  ;*€‡*Ÿ„*Ž‘’œ Ž*…*€*„€ ‚ ŠŽ*
   Dbit        EQU 00000010B  ;*€**€‚‹…*ˆ… ‚ ŠŽ*
   Mode        EQU 00001100B  ;’ˆ* €„*…‘€–ˆˆ ‚ ŠŽ*
   JRQ     EQU 00010000B  ;”‹€ƒ *€*Ž’› *€„ JMP REL8
   PRQ     EQU 00100000B  ;”‹€ƒ *€*Ž’› *€„ PUSH/POP
   TRQ     EQU 01000000B  ;Œ“‘Ž* ‚‹ˆŸž™ˆ‰ *€ Flags,AX
   CRQ     EQU 10000000B  ;‡€**Ž‘ *€ CALL

   ;----------------- “¯à ¢«ïîé¨¥ ¤ ë¥ ------------------------
                        ; 7             0
   REG_USED    db  00010000b    ; DI SI BP SP BX DX CX AX

                        ; 7           3  2     0
   BT_FLAG     db  00000000B    ; CRQ  TRQ  PRQ  JRQ  MODE  D  W


   ; Œ€‘Šˆ ŠŽŒ€*„ ,ŠŽ’Ž*›… ŒŽƒ“’ €„*…‘Ž‚€’œ ‚ *€ŒŸ’œ ( CMP [BX],AL )

   ARI_MASK    DB  10000111B    ; ŠŽŒ€*„€ CMP
           DB  11111111B    ; ŠŽ*…– Œ€‘ŽŠ

   ; ’€*‹ˆ–€ Œ“‘Ž*€
   ; ”Ž*Œ€’ *€‰’€ ‘’€’“‘€:
   ;     7    6   5   4 3   2  1  0
   ;     TST  WPR 0   ROT   ADDBITS

   TST     EQU 10000000B   ; TEST REGISTER
   WPR     EQU 01000000B   ; Wbite PRESENT BIT
   WPLACE      EQU 00100000B   ; Wbite PLACE
   ROT     EQU 00011000B   ; ROTATE BY 0..3 BITES
   ADDBITS     EQU 00000111B   ; ADDING 0...7 BITES (REG/COP)

   TRASH_TAB   DB  10110000B,TST+WPR+WPLACE+7 ;MOV REG,IMM8/16
           DB  10010000B,TST+WPLACE+7     ;XCHG AX,REG
           DB  01000000B,TST+WPLACE+7     ;INC REG16
           DB  01001000B,TST+WPLACE+7     ;DEC REG16

           DB  00000100B,01011111B ;WPR,ROT=3,ADDBITS=0...7
                           ;ADD,OR,ADC,... AL/AX,IMM8/16

           DB  00100111B,00011011B ;ROT=3,ADDBITS=0...3
                           ;DAA,DAS,AAA,AAS

           DB  11111000B,5     ;STI,CLI,STD,CLD,STC,CLC
           DB  10011000B,0     ;CBW
           DB  11010111B,0     ;XLAT
           DB  11001100B,0     ;INT 3
           DB  10011110B,1     ;SAHF,LAHF
           DB  11110101B,0     ;CMC
   TR_TAB_END  EQU $

   JMP_ADDR    DW  0
   CALL_ADDR   DW  0FFFFH

   ;----------------------------------------------------------------------------
   RND     PROC        ; DL = RND (0..DL)  *®«ãç¨âì á«ãç ©ë© ¡ ©â

           PUSH    AX
           OR  DL,DL            ; RND(0..0)=0
           JZ  EXRND
           PUSH    DX

           INC DL          ; ¤«ï 0FFh ¥  ¤® +1
           JNZ OKK
           DEC DL
   OKK:
           MOV AX,0100H        ; à §¬¥à ¥¤¨¨ç®£® ®âà¥§ª 
           DIV DL
           NOT AH

           XCHG    AL,DL
           IN  AL,40H

           PUSH    CX
           XOR AL,55H
   OLD_RND     EQU $-1
           MOV CL,AL
           IN  AL,40H
           RCL AL,CL
           MOV BYTE PTR CS:[OLD_RND],AL
           POP CX

           CMP AL,AH     ; …á«¨ RND ¡®«ìè¥, ç¥¬ …¤Žâà*‚¥àåƒà ,
           JBE OKK1      ; â® ®¡à¥§ ¥¬ ¤® E¤Oâà*‚¥àåƒà 
           MOV AL,AH
   OKK1:
           XOR AH,AH         ; „¥«¨¬ ¯®«ãç¥ë© RND-¡ ©â   …¤¨¨ç.Žâà¥§®ª
           DIV DL
           POP DX
           MOV DL,AL
   EXRND:
           POP AX
           RETN
   RND     ENDP
   ;-------------------
   TABTRASH    PROC

           PUSH    SI
           TEST    [BT_FLAG],TRQ      ;TRASH REQUEST IS MASKED ?
           STC
           JNZ TR_EXIT

           MOV DL,(TR_TAB_END-TRASH_TAB)/2-1
           CALL    RND
           SHL DL,1
           MOVZX   BX,DL
           MOV SI,OFFSET TRASH_TAB

           MOV AX,[SI+BX]

           MOV DH,1        ; AX , BX , ...

           TEST    AH,WPR      ; **ˆ‘“’‘’‚“…’ *ˆ’ W ?
           JZ  ADDREG
           CALL    MAKE_W_BIT
           OR  [BT_FLAG],DL    ; “‘’€*Ž‚ˆŒ
           MOV DH,DL

           TEST    AH,WPLACE
           JZ  W_PLACE     ; W ‚ *“‹…‚ŽŒ *€‡*Ÿ„…
           SHL DL,3        ; W ‚ ’*…’œ…Œ *€‡*Ÿ„…
   W_PLACE:
           OR  AL,DL
   ADDREG:
           MOV DL,AH
           AND DL,ADDBITS    ; + RND *…ƒˆ‘’* ˆ‹ˆ —€‘’œ ŠŽŒ€*„›
           CALL    RND

           TEST    AH,TST      ; ’…‘’ˆ’œ *…ƒˆ‘’* ?
           JZ  NO_TST

           CALL    TEST_USED
           JNZ ADDREG
   NO_TST:
           MOV CL,AH
           AND CL,ROT      ; *€ ‘ŠŽ‹œŠŽ *Ž‚…**“’œ
           SHR CL,3

           SHL DL,CL         ; *Ž‚…**…Œ
           OR  AL,DL

           STOSB

           TEST    AH,WPR
           JZ  NO_ADD_IMM
           TEST    DH,DH
           JZ  IMMED8
           IN  AL,40H
           STOSB
   IMMED8:
           IN  AL,40H
           STOSB
   NO_ADD_IMM:
           POP SI
           AND [BT_FLAG],NOT Wbit     ; ‘**Ž‘ˆŒ W
           CLC
   TR_EXIT:    RET
   TABTRASH    ENDP
   ;-------------------
   MAKE_SUB    PROC

           TEST    [BT_FLAG],CRQ     ;CALL REQUEST SET ?
           JNZ ENDCALL

           MOV AL,0EBH
           STOSB
           MOV WORD PTR [JMP_CALL],DI
           INC DI

   ;        MOV     DL,3        ;TRASHLEN = RND (0...3)
   ;        CALL    TRASHCHAIN

           MOV [CALL_ADDR],DI

           OR  [BT_FLAG],CRQ
           JMP EXIT_CALL
   ENDCALL:
           TEST    [BT_FLAG],JRQ
           JZ  SKIP_JMP
           CALL    JMP_TRASH      ;‡€Š*Ž…Œ JUMP
   SKIP_JMP:
           TEST    [BT_FLAG],PRQ
           JZ  SKIP_STK
           CALL    STACK_TRASH    ;‡€Š*Ž…Œ PUSH/POP
   SKIP_STK:
           CALL    TABTRASH
           MOV AL,0C3H
           STOSB
           MOV BX,0000H
   JMP_CALL    EQU $-2
           MOV AX,DI
           SUB AX,BX
           DEC AL
           MOV ES:[BX],AL
           AND [BT_FLAG],NOT CRQ
   EXIT_CALL:
           CLC
           RET
   MAKE_SUB    ENDP
   ;-------------------
   MAKE_CALL   PROC

           TEST    [BT_FLAG],CRQ
           JNZ EXIT_CLL

           CMP WORD PTR [CALL_ADDR],0FFFFH
           JE  EXIT_CLL

           MOV BX,DI
           MOV AL,0E8H
           STOSB
           MOV AX,[CALL_ADDR]
           SUB AX,DI
           SUB AX,2
           STOSW
   EXIT_CLL:
           RET
   MAKE_CALL   ENDP
   ;-------------------
   JMP_TRASH   PROC

   ; ”®à¬ â ãá«®¢®£® ¯¥à¥å®¤  :
   ;
   ; 0111xxxx  -  ¡ ©â ª®¤  ®¯¥à æ¨¨ , ¢â®à®© ¡ ©â - á¬¥é¥¨¥ Rel8
   ;     ³
   ;     0 - jo   2 - jb   4 - je   6 - jbe  8 - js   A - jp   C - jl   E - jle
   ;     1 - jno  3 - jae  5 - jne  7 - ja   9 - jns  B - jnp  D - jge  F - jg


           test    [BT_FLAG],JRQ
           jnz AddRel8      ;‡ ª®ç¨¬ Jump

           mov al,01110000B     ;Jxx Rel8

           mov dl,0Fh
           call    RND

           or  al,dl   ;’¨¯ Jump'a £®â®¢

           stosb           ;á®åà ï¥¬ ¢ æ¥¯®çª¥
           mov [JMP_ADDR],di   ; ¤à¥á Rel8

           inc di
           or  [BT_FLAG],JRQ  ;“áâ ®¢¨¬ Jump Request
           ret
   AddRel8:
           mov ax,di
           mov bx,[JMP_ADDR]

           sub ax,bx
           dec al
           mov es:[bx],al

           and [BT_FLAG],not JRQ ;‘¡à®á¨¬ § ¯à®á   § ¢¥àè¥¨¥ Jmp'a
           ret

   JMP_TRASH   ENDP
   ;-------------------
   STACK_TRASH PROC

           TEST    [BT_FLAG],JRQ   ; …‘‹ˆ …‘’œ ”‹€ƒ JMP'a ,’Ž
           STC         ; „…‹€’œ PUSH/POP *…‹œ‡Ÿ
           JNZ EXIT_STK

           TEST    [BT_FLAG],CRQ   ; …‘‹ˆ …‘’œ ”‹€ƒ CALL'a ,’Ž
           STC         ; „…‹€’œ PUSH/POP *…‹œ‡Ÿ
           JNZ EXIT_STK

           MOV AL,01010000B
           TEST    [BT_FLAG],PRQ   ; PUSH/POP REQUEST IS SET ?
           JNZ INCSTACK

           MOV DL,7
           CALL    RND
           OR  AL,DL
           STOSB
           OR    [BT_FLAG],PRQ
           RET
   INCSTACK:
           OR  AL,00001000B    ; POP REG
   NXT_REG:
           MOV DL,7        ; *…ƒˆ‘’*
           CALL    RND
           MOV DH,1
           CALL    TEST_USED
           JNZ NXT_REG
           OR  AL,DL
           STOSB
           AND    [BT_FLAG],NOT PRQ    ; ‘**Ž‘ˆŒ ”‹€ƒ PUSH/POP
           CLC
   EXIT_STK:
           RET
   STACK_TRASH ENDP
   ;-------------------
   SHIFT_TRASH PROC

   ;‚Ž‡ŒŽ†*Ž ƒ…*…*…*ˆ… ŠŽŒ€*„ SAL ‘Ž ‘„‚ˆƒŽŒ —…*…‡ CL

           CALL    MAKE_W_BIT   ; ‘ƒ…*…*ˆŒ *€‡*Ÿ„*Ž‘’œ Ž*…*€*„€
           OR  [BT_FLAG],DL

           AND [BT_FLAG],NOT Dbit   ; ‘**Ž‘ˆŒ *ˆ’ *€**€‚‹…*ˆŸ

           MOV AL,DL
           OR  AL,11000000B     ; ŠŽ*

           MOV DL,1
           PUSH    DX

           CALL    RND  ; ‘„‚ˆƒ —…*…‡ CL ˆ‹ˆ IMM8
           SHL DL,1
           OR  AL,DL

           TEST    DL,DL
           POP DX
           JNZ SHIFT_CL
           CALL    RND
   SHIFT_CL:
           SHL DL,4     ; ‘„‚ˆƒ —…*…‡ IMM8 ˆ‹ˆ 1
           PUSHF
           OR  AL,DL

           STOSB

           OR  [BT_FLAG],Mode  ;*€‡*…˜€…Œ ’Ž‹œŠŽ *…ƒˆ‘’*Ž‚›… ‘„‚ˆƒˆ
           CALL    MAKE_MODE_RM
           POPF
           JNZ EXIT_SHIFT
           IN  AL,40H
           STOSB
   EXIT_SHIFT:
           AND [BT_FLAG],11110000B ;‘**Ž‘ˆŒ W,D,MODE *ˆ’› ŠŽ*'a
           RET
   SHIFT_TRASH ENDP
   ;-------------------
   ARI_IMMED_TRASH PROC

   ;€*ˆ”Œ…’ˆ—…‘Šˆ‰ Œ“‘Ž* ‘ *…*Ž‘*…„‘’‚…**›Œ Ž*…*€*„ŽŒ

           MOV AL,10000000B     ; ŠŽ*

           MOV DL,1
           CALL    RND  ; *ˆ’ S

           SHL DL,1     ; + *ˆ’ S
           TEST    DL,DL
           PUSHF        ; „‹Ÿ *€‡Œ…*€ Ž*…*€*„€
           OR  AL,DL

           PUSH    AX
           CALL    MAKE_W_BIT   ; ‘ƒ…*…*ˆŒ *€‡*Ÿ„*Ž‘’œ Ž*…*€*„€
           POP AX

           OR  [BT_FLAG],DL         ; “‘’€*Ž‚ˆŒ W *ˆ’
           AND [BT_FLAG],NOT Dbit   ; ‘**Ž‘ˆŒ *ˆ’ *€**€‚‹…*ˆŸ

           OR  AL,DL

           STOSB

           OR  [BT_FLAG],Mode  ; *…ƒˆ‘’*Ž‚€Ÿ €„*…‘€–ˆŸ
           CALL    MAKE_MODE_RM

           IN  AL,40H     ;*€‰’Ž‚›‰ Ž*…*€*„
           STOSB

           POPF               ;S=0 ?
           JNZ EXIT_ARI
           TEST    [BT_FLAG],Wbit     ;W=1 ?
           JZ  EXIT_ARI

           IN  AL,40H     ;‘‹Ž‚*›‰ Ž*…*€*„
           STOSB
   EXIT_ARI:
           AND [BT_FLAG],11110000B ;‘**Ž‘ˆŒ W,D,MODE *ˆ’› ŠŽ*'a
           RET
   ARI_IMMED_TRASH ENDP
   ;-------------------
   ARITHM_TRASH    PROC

   ;€*ˆ”Œ…’ˆ—…‘Šˆ‰ Œ“‘Ž* ‘ ŠŽ‘‚…**Ž‰ €„*…‘€–ˆ…‰

           CALL    MAKE_W_BIT

           MOV AL,DL
           OR  [BT_FLAG],AL    ; ‘Ž•*€*ˆŒ *ˆ’ W

           MOV DL,7    ; ŠŽ„ Ž*…*€–ˆˆ
           CALL    RND

           MOV BX,OFFSET ARI_MASK  ;**Ž‚…*Ÿ…Œ ŠŽŒ€*„“
           CALL    TYPE_CMD        ;*€ ‚Ž‡ŒŽ†*Ž‘’œ ˆ‘*Ž‹œ‡Ž‚€*ˆŸ
                           ;€„*…‘€–ˆˆ ‚ *€ŒŸ’œ
           PUSHF
           SHL DL,3
           OR  AL,DL
           MOV DL,1         ;ƒ…*…*ˆŒ *ˆ’ D
           POPF
           JC  OP_SIZE_REG

           CALL    RND  ;‚Ž‡ŒŽ†*Ž ˆ‘*Ž‹œ‡Ž‚€*ˆ… REG/MEM - REG
   OP_SIZE_REG:
           SHL DL,1         ; *ˆ’ D
           OR  [BT_FLAG],DL     ; „Ž*€‚‹Ÿ…Œ ‚ *…ƒˆ‘’* ŠŽ*' 
           OR  AL,DL

           STOSB        ;‘Ž•*€*ˆŒ ŠŽ*

           CALL    MAKE_MODE_RM

           AND [BT_FLAG],11110000B ;‘**Ž‘ˆŒ W,D,MODE *ˆ’› ŠŽ*'a
           RET
   ARITHM_TRASH    ENDP
   ;-------------------
   MAKE_W_BIT  PROC
   ;DL = Wbit
           PUSH    AX
           MOV DL,Wbit     ; *€‡*Ÿ„*Ž‘’œ
           MOV DH,0FH

           MOV AL,[REG_USED]   ; …‘‹ˆ ‚‘… *…ƒˆ‘’*› Ž*™.*€‡*€—…*ˆŸ
           AND AL,DH       ; ‡€*Ÿ’› ,’Ž W „Ž‹†…* *›’œ = 1
           CMP AL,DH
           JE  OP_SIZE16
           CALL    RND     ; *ˆ’ W=0 - AL , W=1 - AX
   OP_SIZE16:
           POP AX
           RET
   MAKE_W_BIT  ENDP
   ;-------------------
   MAKE_MODE_RM    PROC
   ;”Ž*Œˆ*“…’ ‚’Ž*Ž‰ *€‰’ ŠŽŒ€*„› - MODE REG/MEM

           TEST    [BT_FLAG],Dbit    ; *ˆ’ D=0 - €„*…‘“…Œ ‚ *€ŒŸ’œ
           JNZ TEST_REG      ; ‹ˆ*Ž …ƒŽ *…’

           MOV DL,7           ; *… *“„…Œ ’…‘’ˆ*Ž‚€’œ *…ƒˆ‘’*
           CALL    RND        ; ‹ˆ*Ž „Ž*Ž‹*ˆ’…‹œ*›‰ ŠŽ*
           JMP SECOND_BYTE
   TEST_REG:
           MOV DL,7
           CALL    RND        ; *ŽŒ…* *…ƒˆ‘’*€
           CALL    TEST_USED      ; ˆ‘*Ž‹œ‡“…’‘Ÿ ‹ˆ *…ƒˆ‘’* - ?
           JNZ TEST_REG
   SECOND_BYTE:
           XOR AL,AL    ; ƒ…*…*ˆŒ *€‰’

           SHL DL,3     ; *Ž‹… REG/ŠŽ*
           OR  AL,DL

           MOV BL,11000000B
           TEST    [BT_FLAG],Mode  ;*Ž‹… MODE “†… ‡€„€‹ˆ ?
           JNZ OPERAND_REG ;*…ƒˆ‘’*Ž‚€Ÿ €„*…‘€–ˆŸ

           MOV DL,3      ; *Ž‹… MODE
           CALL    RND
           MOV BL,DL
           ROR BL,2
   OPERAND_REG:
           MOV DL,7      ;*Ž‹… REG/MEM
           CALL    RND

           CMP BL,11000000B
           JNZ MAKE_REGMEM
                        ; *…ƒˆ‘’*Ž‚€Ÿ €„*…‘€–ˆŸ
           TEST    [BT_FLAG],Dbit   ; *ˆ’ D
           JNZ MAKE_REGMEM

           MOV DH,Wbit
           AND DH,[BT_FLAG]
   NXT_TST_REGMEM:
           CALL    TEST_USED
           JZ  MAKE_REGMEM
           MOV DL,7        ;*Ž„*€‡“Œ…‚€…’‘Ÿ —’Ž Ž„ˆ* ‚‘…-’€Šˆ …‘’œ
           CALL    RND
           JMP NXT_TST_REGMEM
   MAKE_REGMEM:
           OR  AL,DL    ; + REG/MEM
           OR  AL,BL    ; + MODE
           STOSB
           PUSH    AX

           CMP BL,00000000B     ;ˆ*„…Š‘*€Ÿ *…‡ „Ž*. Ž*…*€*„€
           JNE NXT_MODE
           CMP DL,00000110B     ;*…*Ž‘*…„‘’‚…**›‰ Ž*…*€*„ MEM
           JE  INDEX16
   NXT_MODE:
           CMP BL,01000000B     ;ˆ*„…Š‘*€Ÿ + IMM8
           JE  INDEX8
           CMP BL,10000000B
           JNE ARI_OUT
   INDEX16:                 ;ˆ*„…Š‘*€Ÿ + IMM16
           IN  AL,40H
           STOSB
   INDEX8:
           IN  AL,40H
           STOSB
   ARI_OUT:
           POP AX
           RET
   MAKE_MODE_RM    ENDP
   ;-------------------
   TEST_USED   PROC

   ; ZF=1 - *…ƒˆ‘’* *…ˆ‘*Ž‹œ‡“…’‘Ÿ
   ;
   ; DL - *ŽŒ…* *…ƒˆ‘’*€
   ; DH :
   ;      00 - *Ž‹“*…ƒˆ‘’*
   ;      01 - *…ƒˆ‘’*

           PUSH    AX
           MOV CL,DL
           TEST    DH,DH
           JZ  REG_SIZE8
   REG_SIZE16:
           MOV AH,1
           SHL AH,CL
           TEST    [REG_USED],AH
           JMP OK1
   REG_SIZE8:
           MOV AH,[REG_USED] ; Œ áª  ¨á¯®«ì§ã¥¬ëå ¯®«ãà¥£¨áâà®¢
           MOV AL,AH         ; BhChBlCl
           AND AL,0FH        ; | | | |
           SHR AH,4          ; 76543210
           OR  AH,AL         ;  | | | |
                         ;  DhAhDlAl
           MOV AL,1
           SHL AL,CL
           TEST    AH,AL
   OK1:
           POP AX
           RET
   TEST_USED   ENDP
   ;-------------------
   TYPE_CMD    PROC
   ;DL - ŠŽ„ ŠŽŒ€*„› (0...7)
   ;BX - ’€*‹ˆ–€ Œ€‘ŽŠ

   ;0xxx0xxxb - ¬ áª  (xxx-ª®¤ ª®¬ ¤ë)
   ;11111111b - ª®¥æ ¬ á®ª , ¨«¨ 7 ¡¨â ¢§¢¥¤¥
           PUSH     AX
   NEXT_MASK:
           CMP byte ptr [BX],0FFH
           STC
           JE  EXIT_CMD_1
           MOV AL,[BX]
           MOV AH,AL
           AND AH,00000111B
           CMP AH,DL
           JE  EXIT_CMD_0
           SHR AL,4
           INC BX
           CMP AL,DL
           JNE NEXT_MASK
   EXIT_CMD_0: CLC
   EXIT_CMD_1: POP AX
           RET
   TYPE_CMD    ENDP
