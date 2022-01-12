.model Tiny
.Radix 16
.code
;HOPE Version 2.42b
;HOPEG2 v1.0

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
        ADD BX,0200  ;To get past the end of the program

        MOV DI,0100
        MOV AX,DI
        AND AL,0F0   ;Get the amount of paras into AX
        SHR AX,4
        SUB BX,AX    ;Reduce the free segment
        MOV ES,BX    ;And change it
                     ;Will now generate the code at ES:DI
                     ;with a maximum waste of 15 bytes.
        MOV SI,OFFSET PALIGNED
        MOV CX,064    ;Bytes of code to encrypt
        CALL GENERATE ;Generates decryptor and encrypts code

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

;The actual 'infection' generated, (without the Decryptors)
;This sample COM file is like the TPE test files.      
      
      PALIGNED:
        CALL AHEAD SHORT
       AHEAD:
        POP DX
	ADD DX,0A
	MOV AH,09
	INT 021
	INT 020
	
       MSG:
        DB 'Hello, World!',0D,0A,'$'
	DB (064) DUP (090)

      COMEND:
      
PESTART:
END MAIN
