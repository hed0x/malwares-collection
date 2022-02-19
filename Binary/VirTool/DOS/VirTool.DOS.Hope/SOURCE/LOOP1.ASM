.model Tiny
.Radix 16
.code

;Use OPc rv,ev where possible (like TASM & A86)
;Desinged for HOPE v2.5b+

ASSUME CS:_TEXT,DS:_TEXT
PUBLIC LOOPSTART

LOOPSTART:

;-----------------LOOP Modules-----------------------
LOOP1:
DW OFFSET LOOP2
DB OFFSET LEND1-LST1
DB 00000000xB       ;No Reqs
DB 00000000xB       ;No Decrease of counter
DB 4
DB 00010000xB           ;Counter Hi 3
DB OFFSET L1MODRM1-LST1
DB 00000000xB           ;Counter Lo 3
DB OFFSET L1MODRM1-LST1
DB 11011100xB           ;Reversible + Opcode Reversible
DB OFFSET L1MODRM1-LST1
DB 10101010xB           ;Loop start address
DB OFFSET L1VAL1-LST1

        LST1:
         DB 0B     ;OR rv,ev
        L1MODRM1:
         DB 11000000xB
         ;     ^      rv
         ;        ^   ev
         DB 075    ;JNZ
        L1VAL1:
         DB -1      ;Offset of Loop start
        LEND1:

LOOP2:
DW OFFSET LOOP3
DB OFFSET LEND2-LST2
DB 00000000xB
DB 00010000xB     ;Decrease counter by 1
DB 2
DB 00000000xB     ;Counter lo 3
DB OFFSET L2OP1-LST2
DB 10101010xB
DB OFFSET L2VAL1-LST2

        LST2:
        L2OP1:
         DB 048   ;DEC + rv
         DB 075   ;JNZ
        L2VAL1:
         DB -1     ;Loop start offset
        LEND2:

LOOP3:
DW OFFSET LOOP4
DB OFFSET LEND3-LST3
DB 00000001xB       ;No Reqs/1 RSJ
DB 00000001xB       ;Decrease of counter by 1
DB 6
DB 00000000xB           ;Counter Lo 3
DB OFFSET L3OP1-LST3
DB 10010000xB           ;RSJ
DB OFFSET L3INS1-LST3
DB 00010000xB           ;Counter Hi 3
DB OFFSET L3MODRM1-LST3
DB 00000000xB           ;Counter Lo 3
DB OFFSET L3MODRM1-LST3
DB 11011100xB           ;Reversible + Reverse opcode
DB OFFSET L3MODRM1-LST3
DB 10101010xB           ;Loop start address
DB OFFSET L3VAL1-LST3

        LST3:
        L3OP1:
         DB 048
        L3INS1:
         DB 0B     ;OR rv,ev
        L3MODRM1:
         DB 11000000xB
         ;     ^      rv
         ;        ^   ev
         DB 075    ;JNZ
        L3VAL1:
         DB -1      ;Offset of Loop start
        LEND3:

LOOP4:
DW OFFSET LOOP5
DB OFFSET LEND4-LST4
DB 10000000xB       ;Requires CX is counter
DB 00010000xB       ;Decrease counter by 1
DB 1
DB 10101010xB           ;Loop start address
DB OFFSET L4VAL1-LST4

LST4:
        DB 0E2                  ;LOOP cb
       L4VAL1:
        DB -1
LEND4:

LOOP5:
DW OFFSET LOOP6
DB OFFSET LEND5-LST5
DB 00000001xB           ;1 RSJ
DB 0
DB 6
DB 00010000xB           ;Counter Hi 3
DB OFFSET L5MODRM1-LST5
DB 00000000xB           ;Counter Lo 3
DB OFFSET L5MODRM1-LST5
DB 11011100xB           ;Reversible + Opcode Reversible
DB OFFSET L5MODRM1-LST5
DB 01101100xB           ;Affected + 8 bit offset
DB OFFSET L5OFF1-LST5
DB 10010000xB           ;RSJ
DB OFFSET L5INS1-LST5
DB 10111010xB           ;16 bit Loop start address
DB OFFSET L5VAL1+1-LST5

LST5:
         DB 0B     ;OR rv,ev
     L5MODRM1:
         DB 11000000xB
         ;     ^      rv
         ;        ^   ev
         DB 074    ;JZ
     L5OFF1:
         DB 3      ;JZ OVER
     L5INS1:
         DB 0E9
     L5VAL1:
         DW 0

      ;CMP/OR Counter,Counter
      ;JZ OVER
      ;JMP START LONG
      ;OVER:
LEND5:

LOOP6:
DW OFFSET LOOP1
DB OFFSET LEND6-LST6
DB 10000001xB       ;Requires CX is counter, 1 RSJ
DB 00100000xB       ;Decrease counter by 2
DB 2
DB 10010000xB
DB OFFSET L6INS1-LST6
DB 10101010xB           ;Loop start address
DB OFFSET L6VAL1-LST6

LST6:
        DEC CX       ;We know CX is the counter
       L6INS1:
        DB 0E2       ;LOOP cb
       L6VAL1:
        DB -1
LEND6:

