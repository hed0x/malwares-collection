.model Tiny
.Radix 16
.code

Extrn CHOOSE_REG:NEAR
Extrn HEXDIS:NEAR
Extrn DECRYPTEND:NEAR

PUBLIC PRINTREGS
PUBLIC PRINTDECR

ASSUME CS:_TEXT,DS:_TEXT

;==========================================================================
;Print used regs

PRINTREGB:
        XOR DX,DX
        MOV DL,CL
        SHL DL,02
        ADD DX,OFFSET ALREG
        MOV AX,0900
        INT 021
        RET

PRINTREG:
        XOR DX,DX
        MOV DL,CL
        SHL DL,2
        ADD DX,OFFSET AXREG
        MOV AX,0900
        INT 021
        RET

PRINTREGS:
        XOR CX,CX
        CALL CHOOSE_REG
        MOV DX,offset Countmsg
        MOV AX,0900
        INT 021
        CALL PRINTREG

        MOV CX,01
        CALL CHOOSE_REG
        MOV DX,offset Pointmsg
        MOV AX,0900
        INT 021
        CALL PRINTREG

        MOV CX,02
        CALL CHOOSE_REG
        MOV DX,offset Seedmsg
        MOV AX,0900
        INT 021
        CALL PRINTREG

        MOV CX,03
      AGAIN:
        PUSH CX
        CALL CHOOSE_REG
        MOV DX,offset Sparemsg
        MOV AX,0900
        INT 021
        CALL PRINTREG
        POP CX
        INC CX
        CMP CX,07
        JNE AGAIN

        MOV CX,07
        CALL CHOOSE_REG
        MOV DX,offset SPINDEXmsg
        MOV AX,0900
        INT 021
        CALL PRINTREG
RET

AXREG:
DB '>AX$'
CXREG:
DB '>CX$'
DXREG:
DB '>DX$'
BXREG:
DB '>BX$'
SPREG:
DB '>SP$'
BPREG:
DB '>BP$'
SIREG:
DB '>SI$'
DIREG:
DB '>DI$'

ALREG:
DB '>AL$'
CLREG:
DB '>CL$'
DLREG:
DB '>DL$'
BLREG:
DB '>BL$'
AHREG:
DB '>AH$'
CHREG:
DB '>CH$'
DHREG:
DB '>DH$'
BHREG:
DB '>BH$'

Countmsg:
DB ' CNT $'
Pointmsg:
DB '   PTR $'
Seedmsg:
DB '   SED $'
Sparemsg:
DB '   SPR $'
SPINDEXmsg:
DB '   SDX $'


PRINTDECR:
;Prints from DI to DECRYPTEND

        MOV SI,DI               ;Start of decryptor
        MOV DI,[DECRYPTEND]     ;End of decryptor
       PRINTNEXT:
        ES MOV AL,b[SI]
        CALL HEXDIS
        INC SI
        CMP SI,DI
        JL PRINTNEXT

        MOV AX,0200
        MOV DL,0A
        INT 021
        MOV AX,0200
        MOV DL,0D
        INT 021

  RET

