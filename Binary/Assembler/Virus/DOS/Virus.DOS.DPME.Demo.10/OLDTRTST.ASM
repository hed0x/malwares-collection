           .486
           MODEL   TINY
   CSEG        SEGMENT PARA PUBLIC USE16 'CODE'
           ASSUME  CS:CSEG,DS:CSEG
           ORG 100H
   START:
           PUSH    CS
           POP DS

           MOV AX,9000H
           MOV ES,AX
           XOR DI,DI
           MOV CX,20H
   STORE:
           PUSH    CX

           MOV CX,10H
   QQQ:
           PUSH    CX
           MOV SI,OFFSET TAB

           MOV DL,(ENDTAB-TAB)/2-1
           CALL    RND

           SHL DL,1
           XOR DH,DH
           MOV BX,DX
           CALL    DS:[SI+BX]
           POP CX
           LOOP    QQQ
                        ;*€**€‚‹…*ˆ… ‡€‚…*˜…*ˆŸ
           TEST    [BT_FLAG],JRQ    ;JRQ->PRQ->CRQ
           JZ  RRR
           CALL    JMP_TRASH
   RRR:
           TEST    [BT_FLAG],PRQ
           JZ  RRR2
           CALL    STACK_TRASH
   RRR2:
           TEST    [BT_FLAG],CRQ
           JZ  RRR3
           CALL    MAKE_SUB
   RRR3:
           MOV AX,09090H
           STOSW
           STOSW
           POP CX
           LOOP    STORE
   ;-----------------------------------------

           MOV AH,3CH
           XOR CX,CX
           MOV DX,OFFSET FILE
           INT 21H

           MOV BX,AX

           MOV AH,40H
           MOV CX,DI
           PUSH    DS
           PUSH    ES
           POP DS
           XOR DX,DX
           INT 21H

           POP DS
           MOV AH,3EH
           INT 21H

           INT 20H
   ;-----------------------------------------

   TAB     DW  OFFSET ARITHM_TRASH
           DW  OFFSET TABTRASH
           DW  OFFSET STACK_TRASH
           DW  OFFSET SHIFT_TRASH
           DW  OFFSET ARI_IMMED_TRASH
           DW  OFFSET JMP_TRASH
           DW  OFFSET MAKE_SUB
           DW  OFFSET MAKE_CALL
   ENDTAB      EQU $

   FILE        DB  'TRASH.dat',0

   INCLUDE     oldtrash.ASM

   CSEG        ENDS
                   END     START
