.model Tiny
.Radix 16
.code

ASSUME CS:_TEXT,DS:_TEXT
PUBLIC JUNKSTART

;We use the form ARITH rv,ev throughout. (Like TASM generates)
;However can be reversed (completely through entire decryptor)

;Designed for HOPE 2.5b+
;-----------------Junk Modules-----------------------
JUNKSTART:

JUNK1:
DW OFFSET JUNK2
DB 1
DB 0
DB 0
DB 0


     NOP

JUNK2:
DW OFFSET JUNK3
DB 1      	
DB 0
DB 0
DB 0

    CLC

JUNK3:
DW OFFSET JUNK4
DB (OFFSET JEND3-JST3)
DB 00000010xB       ;One RS insertion
DB 00000001xB       ;Requires initialised
DB 6
DB 00001110xB       ;Any inited reg in lower + save
DB OFFSET J3MODRM1-JST3
DB 00110111xB       ;restore reg in upper
DB OFFSET J3MODRM1-JST3
DB 11011100xB       ;Reversible Opcode
DB OFFSET J3MODRM1-JST3
DB 01101100xB       ;Positive 8bit offset affected
DB OFFSET J3OFF1-JST3
DB 10010000xB     ;RSJ code
DB OFFSET J3INS1-JST3
DB 10010000xB     ;RSJ code
DB OFFSET J3INS2-JST3

  JST3:
         DB 0B      ;OR rv,ev
       J3MODRM1:
         DB 11000000xB
         DB 074     ;JZ cb
       J3OFF1:
         DB 0       ;Offset (jump over RSJ)
       J3INS1:
         ;JMP Lands here
       J3INS2:
  JEND3:

JUNK4:
DW OFFSET JUNK5
DB 2
DB 0
DB 0
DB 1
DB 00100010xB             ;Spare
DB OFFSET J4MODRM1-JST4   ;At the ModR/M

       JST4:
        DB 0D3         ;ROL ev,CL
       J4MODRM1:
        DB 11000000xB  ;ModR/M using reg instead of mem
        ;     ^        0 for ROL
        ;        ^     ev


JUNK5:
DW OFFSET JUNK6
DB 3
DB 00010000xB   ;Require AX is spare (Spare 1)
DB 0
DB 2
DB 11001010xB             ;Arith Operation Anytype
DB OFFSET J5OP1-JST5
DB 10110000xB
DB OFFSET J5VAL1+1-JST5

JST5:
   J5OP1:
     DB 05  ;Arith eAX,iv
   J5VAL1:
     DW ?
JEND5:


JUNK6:
DW OFFSET JUNK7
DB 2
DB 0
DB 0
DB 3

DB 00100100xB             ;Any Register  ->Allows MOV ax,ax :(
DB OFFSET J6MODRM1-JST6   ;At the ModR/M bits 0-2 (ev)
DB 00110010xB             ;Any Spare into upper 3 bits
DB OFFSET J6MODRM1-JST6   ;At the ModR/M
DB 11011100xB             ;Reversible + OPCODE reversible
DB OFFSET J6MODRM1-JST6   ;At the ModR/M

       JST6:
        DB 08B         ;MOV rv,ev
       J6MODRM1:
        DB 11000000xB  ;ModR/M using reg instead of mem
        ;     ^        rv
        ;        ^     ev


JUNK7:
DW OFFSET JUNK8
DB 2
DB 0
DB 0
DB 3
DB 01001000xB             ;Rand H/L of Any General Register
DB OFFSET J7MODRM1-JST7   ;At the ModR/M bits 0-2
DB 01011001xB             ;Rand H/L of Any spare general into upper 3 bits
DB OFFSET J7MODRM1-JST7   ;At the ModR/M
DB 11011100xB             ;Reversible
DB OFFSET J7MODRM1-JST7

       JST7:
        DB 08A         ;MOV rb,eb
       J7MODRM1:
        DB 11000000xB  ;ModR/M using reg instead of mem
        ;     ^        rv
        ;        ^     ev

JUNK8:
DW OFFSET JUNK9
DB OFFSET JEND8-JST8    ;Size
DB 0
DB 0
DB 2              ;Number of codes in header
DB 11000000xB  	;INC/DEC/NEG/NOT without save
DB OFFSET J8MODRM1-JST8
DB 00100010xB	;Spare into lower field
DB OFFSET J8MODRM1-JST8

JST8:
   DB 0FF
  J8MODRM1:
   DB 11000000xB   ;INC/DEC/NEG/NOT Spare+Seed Register
JEND8:


JUNK9:
DW OFFSET JUNK10
DB 02
DB 0
DB 0
DB 4
DB 11001010xB             ;Arith Operation Anytype
DB OFFSET J9OP1-JST9
DB 00110010xB             ;Spare register
DB OFFSET J9MODRM1-JST9   ;At the ModR/M bits 3-5
DB 00100100xB             ;Any register
DB OFFSET J9MODRM1-JST9   ;At the ModR/M bits 0-2
DB 11011100xB             ;Reversible code
DB OFFSET J9MODRM1-JST9   ;At the modr/m

       JST9:
       J9OP1:
         DB 00000011xB          ;16 bit arith (rv,ev)
       J9MODRM1:
         DB 11000000xB   ;MODR/M

JUNK10:
DW OFFSET JUNK11
DB 03
DB 0
DB 0
DB 02

DB 00100011xB               ;Any Spare+Seed into lower 3 bits
DB OFFSET JST10-JST10       ;At the OP
DB 10110000xB               ;16 bit random number
DB OFFSET J10IMM1+1-JST10   ;At the immediate

       JST10:
        DB 0B8         ;MOV rv,iv (B8+rw iv)
       J10IMM1:
        DW ?

JUNK11:
DW OFFSET JUNK12
DB 04
DB 0
DB 0
DB 03

DB 00100010xB               ;Any Spare into lower 3 bits
DB OFFSET J11MODRM1-JST11   ;At the Modr/m
DB 11001010xB               ;Any Arith
DB OFFSET J11MODRM1-JST11
DB 10110000xB               ;16 bit random number
DB OFFSET J11IMM1+1-JST11   ;At the immediate

       JST11:
        DB 081         ;ARITH ev,iv
       J11MODRM1:
        DB 11000000xB  ;/Arth /r
       J11IMM1:
        DW ?

JUNK12:
DW OFFSET JUNK13
DB (OFFSET JEND12-JST12)
DB 00000010xB          ;2 RSJ Insertions
DB 0
DB 5
DB 01101100xB       ;Positive 8bit offset affected
DB OFFSET J12OFF1+1-JST12
DB 10010000xB       ;RSJ
DB OFFSET J12INS1-JST12
DB 01101100xB       ;Positive 8bit offset affected
DB OFFSET J12OFF2+1-JST12
DB 10010000xB       ;RS junk
DB OFFSET J12INS2-JST12
DB 01101000xB       ;Negative affected offset
DB OFFSET J12OFF3+1-JST12

      JST12:
      J12OFF1:
       JMP J12INS2 SHORT
      J12INS1:
      J12OFF2:
       JMP JEND12 SHORT
      J12INS2:
      J12OFF3:
       JMP J12INS1 SHORT
      JEND12:

JUNK13:
DW OFFSET JUNK14
DB (OFFSET JEND13-JST13)
DB 0
DB 0
DB 2
DB 01011001xB       ;Spare R H/L General Reg into Upper bit of ModR/M
DB OFFSET J13MODRM1-JST13
DB 10110000xB       ;Random Value 16 bit
DB OFFSET J13VAL1+1-JST13

      JST13:
         DB 08A              ;MOV rb,eb
       J13MODRM1:
         DB 00000110xB       ;MODR/M for eb 16 bit address
       J13VAL1:
         DW 0
      JEND13:
 
JUNK14:
DW OFFSET JUNK15
DB 08
DB 00000001xB
DB 0
DB 7

DB 00101100xB               ;Any register + Save
DB OFFSET J14MODRM1-JST14   ;At the ModR/M bits 0-2
DB 11001001xB               ;Save arith
DB OFFSET J14MODRM1-JST14   
DB 10110001xB               ;Rand Gen 1
DB OFFSET J14VAL1+1-JST14
DB 10010000xB               ;RSJ
DB OFFSET J14INS1-JST14     
DB 11010000xB               ;Restore Arith
DB OFFSET J14MODRM2-JST14   
DB 00100111xB               ;Restore Register
DB OFFSET J14MODRM2-JST14   ;At the ModR/M bits 0-2
DB 10110001xB               ;Rand Gen 1
DB OFFSET J14VAL2+1-JST14

       JST14:
        DB 081        ;Arith ev,iv
       J14MODRM1:
        DB 11000000xB ;Upper field holds arith operation
       J14VAL1:
        DW ?          ;Immediate
       J14INS1:
        DB 081        ;Arith ev,iv
       J14MODRM2:
        DB 11000000xB ;ModR/M using reg instead of mem
       J14VAL2:
        DW ?          ;Immediate

JUNK15:
DW OFFSET JUNK16
DB 4
DB 0
DB 0
DB 3

DB 00100011xB               ;Any Spare+Seed
DB OFFSET J15MODRM1-JST15   ;At the ModR/M bits 0-2
DB 11001000xB               ;Limited Arith without save to table
DB OFFSET J15MODRM1-JST15   ;At the ModR/M
DB 10110000xB               ;16 bit random number
DB OFFSET J15IMM1+1-JST15   ;At the immediate

       JST15:
        DB 081         ;ARITH ev,iv
       J15MODRM1:
        DB 11000000xB  ;/Arth /r
       J15IMM1:
        DW ?

JUNK16:
DW OFFSET JUNK17
DB (OFFSET JEND16-JST16)
DB 00000010xB              ;2 RSJ
DB 0
DB 4

DB 01101100xB
DB OFFSET J16OFF1+1-JST16
DB 10010000xB
DB OFFSET J16INS1-JST16
DB 10010000xB
DB OFFSET J16INS2-JST16
DB 01111000xB
DB OFFSET J16OFF2+1-JST16

        JST16:
        J16OFF1:
          JMP J16LAB1 SHORT
        J16INS1:
          RET
        J16LAB1:
        J16INS2:
          DB 0E8        ;CALL
        J16OFF2:
          DW -3         ;-3 to get 'up there'
        JEND16:

JUNK17:
DW OFFSET JUNK18
DB (OFFSET JEND17-JST17)  ;Size
DB 0
DB 0
DB 0   ;Number of codes in header

JST17:
   CLD
JEND17:


JUNK18:
DW OFFSET JUNK19
DB 1              ;Size
DB 0              ;Gen mod header
DB 0              ;Specific mod header
DB 2              ;Number of codes in header
DB 00100011xB     ;Any Spare+seed
DB OFFSET J18OP1-JST18
DB 11011001xB     ;Opcode adjust INC/DEC register opcode
DB OFFSET J18OP1-JST18

JST18:
       J18OP1: 
	DB 040      ;DEC/INC Spare+seed
JEND18:

JUNK19:
DW OFFSET JUNK20
DB 2              ;Size
DB 00000001xB     ;Gen mod header
DB 0              ;Specific mod header
DB 3              ;Number of codes in header
DB 00100000xB     ;PUSH Any
DB OFFSET JST19-JST19
DB 10010000xB     ;Random Size Junk Code
DB OFFSET J19INS1-JST19
DB 00100001xB     ;POP Spare
DB OFFSET J19INS1-JST19

JST19:
        PUSH AX   ;(AX is used cause it is register 0 but it will be replaced)
       J19INS1:
        POP AX
JEND19:

JUNK20:
DW OFFSET JUNK21
DB 2              ;Size
DB 0              ;Gen mod header
DB 0              ;Specific mod header
DB 2              ;Number of codes in header
DB 00100001xB     ;Any spare
DB OFFSET J20MODRM1-JST20
DB 00110001xB     ;Any spare in bits 3-5
DB OFFSET J20MODRM1-JST20

JST20:
        DB 087    ;XCHG rv,ev
       J20MODRM1:
        DB 11000000xB
JEND20:


JUNK21:
DW OFFSET JUNK22
DB OFFSET JEND21-JST21
DB 00000001xB     ;1 RSJ
DB 0
DB 2
DB 01101100xB
DB OFFSET J21OFF1-JST21
DB 10000000xB           ;Garbage Numbers
DB OFFSET J21INS1-JST21

JST21:
        DB 0EB ;JMP short
       J21OFF1:
        DB 0
       J21INS1:
JEND21:

JUNK22:
DW OFFSET JUNK23
DB OFFSET JEND22-JST22
DB 00010000xB        ;Requires AX is spare
DB 0
DB 1
DB 00100100xB        ;Any register (are acutally the 8 bit regs)
DB OFFSET J22MODRM1-JST22

JST22:

    DB 0F6   ;MUL AL,eb -> AX
   J22MODRM1:
    DB 11100000xB

JEND22:


JUNK23:
DW OFFSET JUNK24
DB (OFFSET JEND23-JST23)
DB 0
DB 0
DB 2
DB 00110010xB       ;Spare reg in rv field
DB OFFSET J23MODRM1-JST23
DB 10110000xB       ;Random Value 16 bit
DB OFFSET J23VAL1+1-JST23

      JST23:
         DB 08B              ;MOV rv,ev
       J23MODRM1:
         DB 00000110xB       ;MODR/M for ev 16 bit address
       J23VAL1:
         DW 0
      JEND23:

JUNK24:
DW OFFSET JUNK25
DB (OFFSET JEND24-JST24)
DB 00000010xB
DB 00000001xB
DB 6
DB 01101100xB
DB OFFSET J24OFF1-JST24
DB 10010000xB
DB OFFSET J24INS1-JST24
DB 01101100xB
DB OFFSET J24OFF2-JST24
DB 10010000xB
DB OFFSET J24INS2-JST24
DB 00000010xB
DB OFFSET J24OP1-JST24
DB 01101000xB
DB OFFSET J24OFF3-JST24

JST24:

       DB 0EB
     J24OFF1:
       DB 2
     J24INS1:
       DB 0EB
     J24OFF2:
       DB 3
     J24INS2:
     J24OP1:
       DB 048
       DB 075
     J24OFF3:
       DB -4

       ;  JMP OVER
       ;UP:
       ;  Junk 5
       ;  JMP DOWN
       ;OVER:
       ;  RSJ
       ;  DEC SEED
       ;  JNZ UP
       ;DOWN:

JEND24:

JUNK25:
DW OFFSET JUNK1
DB (OFFSET JEND25-JST25)
DB 00000010xB              ;2 RSJ
DB 0
DB 4

DB 01111100xB             ;16 bit positive affected
DB OFFSET (J25OFF1+1)-JST25
DB 10000000xB             ;RSJ Garbage Numbers
DB OFFSET J25INS1-JST25
DB 10010000xB             ;RSJ
DB OFFSET J25INS2-JST25
DB 00100011xB       ;Spare+seed reg in lower field
DB OFFSET J25MODRM1-JST25

        JST25:
          DB 0E8        ;CALL
        J25OFF1:
          DW 0         ;to get 'down there'
        J25INS1:
        J25INS2:
        J25MODRM1:
          DB 058        ;POP rv
        JEND25:

