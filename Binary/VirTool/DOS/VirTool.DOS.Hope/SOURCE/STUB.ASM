.model Tiny
.Radix 16
.code

PUBLIC MAIN
EXTRN RANDNUM:NEAR
EXTRN GENERATE:NEAR
EXTRN HOPE_END:NEAR
EXTRN PRINTREGS:NEAR
EXTRN PRINTDECR:NEAR

        ORG 0100
MAIN:
        MOV CX,0FFFF
       REDOTO:

        PUSH CX
        MOV DL, '>'
        MOV AX,0200
        INT 021
        MOV DL, '>'
        MOV AX,0200
        INT 021
        CALL PRINTREGS

        PUSH CS
        POP ES
        MOV DI,OFFSET HOPE_END+010  ;Offset in ES
        MOV SI,OFFSET PALIGNED
        MOV CX,060                ;64 Bytes of code
        CALL GENERATE             ;Generates Normal and runs engine
        CALL PRINTDECR

        PUSH ES
        POP AX                    ;Seg of engine
        MOV w[OFFSET JSEG],AX


        ;INT 3                    ;Uncomment to see the generations

        DB 09A                    ;Far Call
       JOFF:
        DW OFFSET HOPE_END+010
      JSEG:
        DW ?
        PUSH CS
        POP DS
        POP CX
      LOOP REDOTO
        MOV AX,04c00
        INT 021

;--------------------------------------------

      PALIGNED:
        CALL AHEAD SHORT
       AHEAD:
        POP BP
        SUB BP,3
        MOV BX,BP
        SHR BX,4
        PUSH CS
        POP DX
        ADD BX,DX
        MOV w[BP+(OFFSET GOSEG - OFFSET PALIGNED)],BX
        DB 0EA
       GOOFF:
        DW (OFFSET RETURNHERE - OFFSET PALIGNED)
       GOSEG:
        DW ?
       RETURNHERE:
        PUSH CS
        POP DS
        MOV DX,OFFSET MSG-OFFSET PALIGNED
        MOV AX,0900
        INT 021
        JMP GOBACK SHORT
       MSG:
        DB 'The code to print this was encrypted with HOPE',0D,0A,'$'
       GOBACK:
        DB 0CB ;RETF

END MAIN
