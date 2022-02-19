.model Tiny
.Radix 16
.code
;HOPE Version 2.41b
;HOPEGEN v1.1

PUBLIC MAIN
EXTRN GENERATE:NEAR
EXTRN HOPE_END:NEAR

        ORG 0100
MAIN:

        MOV DX,OFFSET HOPEMSG
        MOV AX,0900
        INT 021

        MOV CX,032 ;50 Test files
lop:
        PUSH CX
        PUSH CS
        POP BX
        ADD BX,0110  ;To get past the end of the program (-010)

        MOV DI,0100
        MOV AX,DI
        AND AL,0F0   ;Get the amount of paras into AX
        SHR AX,4
        SUB BX,AX    ;Reduce the free segment
        MOV ES,BX    ;And change it
                     ;Will now generate the code at ES:DI
                     ;with a maximum waste of 15 bytes.
        
        MOV SI,OFFSET SIMULATE

        MOV CX,05    ;Copy simulated com file
        REP MOVSB    ;SI now = OFFSET PALIGNED

        MOV CX,09C                ;Bytes of code
        CALL GENERATE             ;Generates Normal and runs engine

        ;Save Generation
        ;ES:DI = Start of decryptor
        ;SI = Entire encrypted program size
        PUSH CS
        POP DS
      ;Make our COM file
        MOV AX,03C00
        MOV DX,OFFSET FILENAME
        XOR CX,CX
        INT 021

        PUSH AX
        MOV AX,0900
        INT 021
        POP AX

      ;Write to file
        ;Data Buffer (Start of program ES:DI)
        PUSH ES
        POP DS       ;Put ES:DI into DS:DX
        MOV DX,DI
        SUB DX,05    ;Subtract 5 so that our simulated file is written
        ADD SI,05    ;Add 5 to size to make up for it
        ;Number of bytes
        MOV CX,SI
        ;File Handle
        MOV BX,AX
        ;Function
        MOV AX,04000
        INT 021

        mov     ah,3E                   ;close the file
        int     21

        PUSH CS
        POP DS

        ;This bit stolen from TPE.

        mov     di,offset filename      ;adjust name for next file
        mov     bx,7                    ; (increment number)
incnum: inc     b[bx+di]
        cmp     b[bx+di],'9'
        jbe     numok
        mov     b[bx+di],'0'
        dec     bx
        jnz     incnum

numok:  pop     cx                      ;do it again...
        loop    lop

        MOV AX,04c00
        INT 021

HOPEMSG:
DB 'Generating 50 HOPE test files...',0D,0A,0A,'$'

FILENAME:
DB '00000000.COM',0,'   $'

;--------------------------------------------
;A jump to simulate an infection
     SIMULATE:
       JMP PALIGNED LONG
       INT 021
;--------------------------------------------

;The actual 'infection' generated, (without the Decryptors)
;Will be aligned to a para in new file.

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
        MOV BX,DX
        MOV DX,OFFSET MSG-OFFSET PALIGNED
        MOV AX,0900
        INT 021

        MOV SI,OFFSET BACKBYTES-OFFSET PALIGNED
        MOV [OFFSET TSEGMENT-OFFSET PALIGNED],BX ;Write old seg
        MOV ES,BX
        MOV DI,0100
        JMP CLEARCACHE SHORT
       CLEARCACHE:
        MOVSB
        MOVSB       ;Replace the 3 bytes
        MOVSB

        DB 0EA     ;Far Jump
        DW 0100
       TSEGMENT:
        DW ?
       MSG:
        DB 'This file encrypted with HOPE',0D,0A,'$'
       BACKBYTES:
        ;The MOV AX,04c00
        MOV AX,04c00
        DB 030 DUP 090
       GOBACK:

PESTART:
END MAIN
