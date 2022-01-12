.model Tiny
.Radix 16
.code

;Designed for HOPE v2.5b+

;Use OPc rv,ev where possible (like TASM)

ASSUME CS:_TEXT,DS:_TEXT
PUBLIC CRYPTSTART

CRYPTSTART:

;-----------------CRYPT Modules-----------------------
CRYPT1:          ;24 bytes total
DW OFFSET CRYPT2
DB OFFSET CREND1-CRST1
DB 00001001xB    ;reqs DS=CS/ 1 RSJ
DB 00000000xB    ;Does not increase index
DB 7

DB 00000001xB                   ;Pointer  (Low 3 bits)
DB OFFSET CR1MODRM1-CRST1
DB 00010111xB                   ;SPINDEX  (Hi 3 bits)
DB OFFSET CR1MODRM1-CRST1
DB 11011100xB                   ;Reversible
DB OFFSET CR1MODRM1-CRST1
DB 10010000xB                   ;RSJ
DB OFFSET CR1INS1-CRST1
DB 11001100xB                   ;Arith Operation with save to table
DB OFFSET CR1OP1-CRST1
DB 00001111xB                   ;[SPINDEX] into Lo 3
DB OFFSET CR1MODRM2-CRST1
DB 00010010xB                   ;Seed into Hi 3
DB OFFSET CR1MODRM2-CRST1

        CRST1:
          DB 08B        ;Mov rv,ev (MOV SPINDEX,Pointer)
        CR1MODRM1:
          DB 11000000xB	;Register type MODRM
        CR1INS1:
        CR1OP1:
          DB 00000001xB ;Arith ev,rv (word) Arith oper
	CR1MODRM2:  
          DB 00000000xB	;Index type MODRM
        CREND1:


CRYPT2:
DW OFFSET CRYPT3
DB OFFSET CREND2-CRST2
DB 00001011xB    ;reqs DS=CS/ 3 rsjs
DB 00000100xB    ;Increases point
DB 0D            ;13 codes

DB 00000001xB                   ;Pointer  (LO 3 bits)
DB OFFSET CR2MODRM1-CRST2
DB 00010111xB                   ;SPINDEX  (Hi 3)
DB OFFSET CR2MODRM1-CRST2
DB 11011100xB                   ;Reversible
DB OFFSET CR2MODRM1-CRST2

DB 10010000xB                   ;RSJ
DB OFFSET CR2INS1-CRST2
DB 00000111xB                   ;SPINDEX  (Low 3) for INC SPX
DB OFFSET CR2OP1-CRST2
DB 10010000xB                   ;RSJ
DB OFFSET CR2INS2-CRST2
DB 11001100xB                   ;Arith Operation with save to table
DB OFFSET CR2OP2-CRST2
DB 00001111xB                   ;[SPINDEX] into Lo 3
DB OFFSET CR2MODRM2-CRST2
DB 00010010xB                   ;Seed into Hi 3
DB OFFSET CR2MODRM2-CRST2
DB 10010000xB                   ;RSJ
DB OFFSET CR2INS3-CRST2

DB 00010001xB                   ;Pointer  (Hi 3 bits)
DB OFFSET CR2MODRM3-CRST2
DB 00000111xB                   ;SPINDEX  (Lo 3)
DB OFFSET CR2MODRM3-CRST2
DB 11011100xB                   ;Reversible
DB OFFSET CR2MODRM3-CRST2

	CRST2:
          DB 08B        ;Mov rv,ev (MOV SPINDEX,Pointer)
        CR2MODRM1:
          DB 11000000xB	;Register type MODRM
        CR2INS1:
        CR2OP1: 
          DB 040        ;INC
	CR2INS2:
        CR2OP2:  
          DB 00000001xB ;ADD [ev],rv (word) Arith [SPINDEX],Seed
	CR2MODRM2:  
          DB 00000000xB	;Index type MODRM
        CR2INS3:
          DB 08B        ;Mov rv,ev (MOV Pointer,SPINDEX)
        CR2MODRM3:
          DB 11000000xB	;Register type MODRM
        CREND2:


CRYPT3:
DW OFFSET CRYPT4
DB OFFSET CREND3-CRST3
DB 00001010xB  ;reqs DS=CS/2 RSJs
DB 00000100xB  ;Increase Pointer by 1
DB 9
DB 00000001xB  			;Pointer
DB OFFSET CR3OP1-CRST3
DB 10010000xB                   ;RSJ
DB OFFSET CR3INS1-CRST3
DB 00000001xB                   ;Pointer  (Lo 3 bits)
DB OFFSET CR3MODRM1-CRST3
DB 00010111xB                   ;SPINDEX  (Hi 3)
DB OFFSET CR3MODRM1-CRST3
DB 11011100xB                   ;Reversible
DB OFFSET CR3MODRM1-CRST3
DB 10010000xB                   ;RSJ
DB OFFSET CR3INS2-CRST3
DB 11001100xB                   ;Arith Crypt with save to table
DB OFFSET CR3OP2-CRST3
DB 00001111xB                   ;[SPINDEX] into Lo 3
DB OFFSET CR3MODRM2-CRST3
DB 00010010xB                   ;Seed into Hi 3
DB OFFSET CR3MODRM2-CRST3


	CRST3:
	CR3OP1:
	 DB 040
        CR3INS1:
         DB 08B         ;MOV rv,ev
	CR3MODRM1:
	 DB 11000000xB	;Reg type Modr/m
        CR3INS2:
        CR3OP2:
	 DB 00000001xB	;16 bit Crypt
	CR3MODRM2:
	 DB 00000000xB	;Index type Modr/m
	CREND3:
	
CRYPT4:
DW OFFSET CRYPT5
DB OFFSET CREND4-CRST4
DB 00001001xB   ;reqs DS=CS / 1 RSJ
DB 00000000xB
DB 6
DB 00000001xB                   ;Pointer  (Lo 3 bits)
DB OFFSET CR4MODRM1-CRST4
DB 00010111xB                   ;SPINDEX  (Hi 3)
DB OFFSET CR4MODRM1-CRST4
DB 11011100xB                   ;Reversible
DB OFFSET CR4MODRM1-CRST4
DB 10010000xB                   ;RSJ
DB OFFSET CR4INS1-CRST4
DB 00001111xB                   ;[SPINDEX]  (Low 3)
DB OFFSET CR4MODRM2-CRST4
DB 11000100xB                   ;INC/DEC type of crypt with save
DB OFFSET CR4MODRM2-CRST4

        CRST4:
	  DB 08B        ;Mov rv,ev (MOV SPINDEX,Pointer)
        CR4MODRM1:
          DB 11000000xB	;Register type MODRM
        CR4INS1:
          DB 0FF         ;INC/DEC [SPX]
        CR4MODRM2:
          DB 00000000xB
        CREND4:

CRYPT5:
DW OFFSET CRYPT6
DB OFFSET CREND5-CRST5
DB 00001010xB                   ;reqs DS=CS / 2 RSJs
DB 00000000xB                   ;Doesn't increase Pointer
DB 9

DB 00000001xB                   ;Pointer  (Lo 3 bits)
DB OFFSET CR5MODRM1-CRST5
DB 00010111xB                   ;SPINDEX  (Hi 3)
DB OFFSET CR5MODRM1-CRST5
DB 11011100xB                   ;Reversible
DB OFFSET CR5MODRM1-CRST5
DB 10010000xB                   ;RSJ
DB OFFSET CR5INS1-CRST5
DB 00000111xB                   ;INC SPX
DB OFFSET CR5OP1-CRST5
DB 10010000xB                   ;RSJ
DB OFFSET CR5INS2-CRST5
DB 11001100xB                   ;Arith Operation with save to table
DB OFFSET CR5OP2-CRST5
DB 00001111xB                   ;[SPINDEX] into Lo 3
DB OFFSET CR5MODRM2-CRST5
DB 00010010xB                   ;Seed into Hi 3
DB OFFSET CR5MODRM2-CRST5

        CRST5:
          DB 08B        ;Mov rv,ev (MOV SPINDEX,Pointer)
        CR5MODRM1:
          DB 11000000xB	;Register type MODRM
        CR5INS1:
        CR5OP1:
          DB 040
        CR5INS2:
        CR5OP2:
          DB 00000001xB ;ADD ev,rv (word) Arith oper
        CR5MODRM2:  
          DB 00000000xB	;Index type MODRM
        CREND5:

CRYPT6:
DW OFFSET CRYPT7
DB OFFSET CREND6-CRST6
DB 00101011xB                   ;Requires Seed is general reg and DS=CS
DB 00000000xB                   ;Doesn't increase Pointer
DB 0D
DB 00000001xB                   ;Pointer  (Lo 3 bits)
DB OFFSET CR6MODRM1-CRST6
DB 00010111xB                   ;SPINDEX  (Hi 3)
DB OFFSET CR6MODRM1-CRST6
DB 11011100xB                   ;Reversible
DB OFFSET CR6MODRM1-CRST6
DB 10010000xB                   ;RSJ
DB OFFSET CR6INS1-CRST6
DB 11001100xB                   ;Arith Operation with save to table
DB OFFSET CR6OP1-CRST6
DB 00001111xB                   ;[SPINDEX] into Lo 3
DB OFFSET CR6MODRM2-CRST6
DB 01011111xB                   ;Random H/L Seed into Hi 3 + save
DB OFFSET CR6MODRM2-CRST6
DB 10010000xB                   ;RSJ
DB OFFSET CR6INS2-CRST6
DB 00000111xB                   ;SPX into lo 3
DB OFFSET CR6OP2-CRST6
DB 10010000xB                   ;RSJ
DB OFFSET CR6INS3-CRST6
DB 11001100xB                   ;Arith Operation with save to table
DB OFFSET CR6OP3-CRST6
DB 00001111xB                   ;[SPINDEX] into Lo 3
DB OFFSET CR6MODRM3-CRST6
DB 01010011xB                   ;Restore byte as complement H/L
DB OFFSET CR6MODRM3-CRST6

        CRST6:
          DB 08B        ;Mov rv,ev (MOV SPINDEX,Pointer)
        CR6MODRM1:
          DB 11000000xB	;Register type MODRM
        CR6INS1:
        CR6OP1:
          DB 00000000xB ;Arith eb,(rb + save)
        CR6MODRM2:
          DB 00000000xB ;Index type MODRM
        CR6INS2:
        CR6OP2:
          DB 040        ;INC Spindex
        CR6INS3:
        CR6OP3:
          DB 00000000xB ;Arith eb,(rb - restore)
        CR6MODRM3:
          DB 00000000xB ;Index type MODRM
        CREND6:

        ;MOV SPX,PNT
        ;ARITH b[SPX],b SEED RH/L
        ;INC SPX
        ;ARITH b[SPX],b SEED Comp H/L

CRYPT7:
DW OFFSET CRYPT8
DB OFFSET CREND7-CRST7
DB 00000010xB    ;DOESN'T req DS=CS/ 2 RSJs
DB 00000100xB    ;Increases index by 1
DB 9

DB 00000001xB
DB OFFSET CR7OP1-CRST7
DB 10010000xB                   ;RSJ
DB OFFSET CR7INS1-CRST7
DB 00000001xB                   ;Pointer  (Lo 3 bits)
DB OFFSET CR7MODRM1-CRST7
DB 00010111xB                   ;SPINDEX  (Hi 3)
DB OFFSET CR7MODRM1-CRST7
DB 11011100xB                   ;Reversible
DB OFFSET CR7MODRM1-CRST7
DB 10010000xB                   ;RSJ
DB OFFSET CR7INS2-CRST7
DB 11001100xB                   ;Arith Operation with save to table
DB OFFSET CR7OP2-CRST7
DB 00001111xB                   ;[SPINDEX] into Lo 3
DB OFFSET CR7MODRM2-CRST7
DB 00010010xB                   ;Seed into Hi 3
DB OFFSET CR7MODRM2-CRST7

CRST7:
        CR7OP1:
          DB 040
        CR7INS1:
          DB 08B        ;Mov rv,ev (MOV SPINDEX,Pointer)
        CR7MODRM1:
          DB 11000000xB	;Register type MODRM
        CR7INS2:
          DB 02E        ;CS Override
        CR7OP2:
          DB 00000001xB ;Arith ev,rv (word) Arith oper
        CR7MODRM2:  
          DB 00000000xB	;Index type MODRM
CREND7:

CRYPT8:
DW OFFSET CRYPT1
DB OFFSET CREND8-CRST8
DB 00000001xB    ;DOESN'T req DS=CS/ 2 RSJs
DB 00000000xB    ;Increases index by 0
DB 7

DB 00000001xB                   ;Pointer  (Lo 3 bits)
DB OFFSET CR8MODRM1-CRST8
DB 00010111xB                   ;SPINDEX  (HI 3)
DB OFFSET CR8MODRM1-CRST8
DB 11011100xB                   ;Reversible Opcode
DB OFFSET CR8MODRM1-CRST8
DB 10010000xB                   ;RSJ
DB OFFSET CR8INS1-CRST8
DB 11001100xB                   ;Arith Operation with save to table
DB OFFSET CR8OP2-CRST8
DB 00001111xB                   ;[SPINDEX] into Lo 3
DB OFFSET CR8MODRM2-CRST8
DB 00010010xB                   ;Seed into Hi 3
DB OFFSET CR8MODRM2-CRST8

CRST8:
          DB 08B        ;Mov rv,ev (MOV SPINDEX,Pointer)
        CR8MODRM1:
          DB 11000000xB	;Register type MODRM
        CR8INS1:
          DB 02E        ;CS Override
        CR8OP2:
          DB 00000001xB ;Arith ev,rv (word) Arith oper
        CR8MODRM2:  
          DB 00000000xB	;Index type MODRM
CREND8:


