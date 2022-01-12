.model Tiny
.Radix 16
.code

;Designed for HOPE v2.2b or above

ASSUME CS:_TEXT,DS:_TEXT
PUBLIC INITSTART

;All modules should contain something like
;---------------------------------
;PUSH CS (if defined as setting DS=CS)
;POP DS  (if defined as setting DS=CS)
;MOV SEED, RANDOM NUMBER            (in any order)
;MOV COUNTER, CODESIZE/CODESIZE*2   (in any order)
;MOV POINTER, CODE OFFSET           (in any order)
;---------------------------------
;The specific header should define whether codesize or codesize*2 is used
;and whether DS is set to CS.
;RSJ's should be well littered between each instruction.
;-----------------INIT Modules-----------------------

INITSTART:

INIT1:
DW OFFSET INIT2         ;Next module
DB OFFSET INEND1-INST1  ;Code size
DB 00000100xB           ;No requirements / 4 RSJs
DB 01000010xB           ;Uses double code size, sets DS=CS
DB 0A                   ;10 codes
DB 10010000xB           ;RSJ
DB OFFSET IN1INS1-INST1
DB 10010000xB           ;RSJ
DB OFFSET IN1INS2-INST1
DB 00000001xB           ;Pointer Reg into lower 3 bits
DB OFFSET IN1MOV1-INST1
DB 10101000xB           ;Code Offset
DB OFFSET IN1VAL1+1-INST1
DB 10010000xB           ;RSJ
DB OFFSET IN1INS3-INST1
DB 00000000xB           ;Counter Reg into lower 3 bits
DB OFFSET IN1MOV2-INST1
DB 10101011xB           ;CodeSize * 2
DB OFFSET IN1VAL2+1-INST1
DB 10010000xB           ;RSJ
DB OFFSET IN1INS4-INST1
DB 00000010xB           ;Seed Reg into lower 3 bits
DB OFFSET IN1MOV3-INST1
DB 10110000xB           ;Randum Number
DB OFFSET IN1VAL3+1-INST1

       INST1:
        PUSH CS
       IN1INS1:
        POP DS
       IN1INS2:
       IN1MOV1:
        DB 0B8   ;MOV rv,iv (B8+rw) (Pointer)
       IN1VAL1:
        DW ?    ;Code offset
       IN1INS3:
       IN1MOV2:
        DB 0B8   ;MOV rv,iv (B8+rw) (Counter)
       IN1VAL2:
        DW ?    ;Codesize * 2
       IN1INS4:
       IN1MOV3:
        DB 0B8   ;MOV rv,iv (B8+rw) (Seed)
       IN1VAL3:
        DW ?    ;Random Number
       INEND1:

       ;PUSH CS
       ;POP DS
       ;MOV Pointer,Code Offset
       ;MOV Counter,Code Size*2
       ;MOV Seed,Random

INIT2:
DW OFFSET INIT3
DB OFFSET INEND2-INST2            
DB 00000100xB           ;No Req / 4 RSJs
DB 01000001xB           ;Code Size * 1, sets DS=CS
DB 0A
DB 10010000xB           ;RSJ
DB OFFSET IN2INS1-INST2
DB 00000010xB           ;Seed Reg into lower 3 bits
DB OFFSET IN2MOV1-INST2
DB 10110000xB           ;Randum Number
DB OFFSET IN2VAL1+1-INST2
DB 10010000xB           ;RSJ
DB OFFSET IN2INS2-INST2
DB 00000000xB           ;Counter Reg into lower 3 bits
DB OFFSET IN2MOV2-INST2
DB 10101001xB           ;CodeSize * 1
DB OFFSET IN2VAL2+1-INST2
DB 10010000xB           ;RSJ
DB OFFSET IN2INS3-INST2
DB 10010000xB           ;RSJ
DB OFFSET IN2INS4-INST2
DB 00000001xB           ;Pointer Reg into lower 3 bits
DB OFFSET IN2MOV3-INST2
DB 10101000xB           ;Code Offset
DB OFFSET IN2VAL3+1-INST2

       INST2:
        PUSH CS
       IN2INS1:
       IN2MOV1:
        DB 0B8   ;MOV rv,iv (B8+rw) (Seed)
       IN2VAL1:
        DW ?    ;Random Number
       IN2INS2:
       IN2MOV2:
        DB 0B8   ;MOV rv,iv (B8+rw) (Counter)
       IN2VAL2:
        DW ?    ;Codesize * 1
       IN2INS3:
        POP DS
       IN2INS4:
       IN2MOV3:
        DB 0B8   ;MOV rv,iv (B8+rw) (Pointer)
       IN2VAL3:
        DW ?    ;Code offset
       INEND2:

INIT3:
DW OFFSET INIT4
DB OFFSET INEND3-INST3
DB 00000100xB          ;No Requirments/4 insertions
DB 00000010xB          ;Uses Double code size, Doesn't set DS=CS
DB 0A                  ;10 codes
DB 00000010xB           ;Seed reg in lower 3 field
DB OFFSET IN3OP1-INST3
DB 10110000xB           ;Randum Number
DB OFFSET IN3VAL1+1-INST3
DB 10010000xB           ;RSJ
DB OFFSET IN3INS1-INST3
DB 00000000xB           ;Counter reg in lower 3 field
DB OFFSET IN3OP2-INST3
DB 10111001xB           ;Code Size * 1
DB OFFSET IN3VAL2+1-INST3
DB 10010000xB           ;RSJ
DB OFFSET IN3INS2-INST3
DB 00000001xB           ;Pointer reg in lower 3 field
DB OFFSET IN3OP3-INST3
DB 10101000xB           ;Code Offset
DB OFFSET IN3VAL3+1-INST3
DB 10010000xB           ;RSJ
DB OFFSET IN3INS3-INST3
DB 00000000xB           ;Counter reg in lower 3 field
DB OFFSET IN3MODRM1-INST3

       INST3:

       IN3OP1:
        DB 0B8   ;MOV rv,iv (B8+rw) (Seed)
       IN3VAL1:
        DW ?    ;Random Number

       IN3INS1:

       IN3OP2:
        DB 0B8   ;MOV rv,iv (B8+rw) (Counter)
       IN3VAL2:
        DW ?    ;Code Size * 1

       IN3INS2:

       IN3OP3:
        DB 0B8   ;MOV rv,iv (B8+rw) (Pointer)
       IN3VAL3:
        DW ?    ;Code Offset

       IN3INS3:

        DB 0D1   ;SHL ev,1  to make CodeSize * 2
       IN3MODRM1:
        DB 11100000xB    ;/4 /r

       INEND3:


INIT4:
DW OFFSET INIT1
DB OFFSET INEND4-INST4
DB 00000010xB          ;No Requirments / 2 RSJ's
DB 00000010xB          ;Uses Double code size, DOESN'T set DS=CS
DB 08                  ;8 codes

DB 00000000xB         ;Counter reg in lower 3 bits
DB OFFSET IN4OP1-INST4
DB 10101011xB         ;CodeSize * 2
DB OFFSET IN4VAL1+1-INST4
DB 10010000xB           ;RSJ
DB OFFSET IN4INS1-INST4
DB 00000001xB         ;Pointer reg in lower 3 bits
DB OFFSET IN4OP2-INST4
DB 10101000xB         ;Code Offset
DB OFFSET IN4VAL2+1-INST4
DB 10010000xB           ;RSJ
DB OFFSET IN4INS2-INST4
DB 00000010xB         ;Seed reg in lower 3 bits
DB OFFSET IN4OP3-INST4
DB 10110000xB         ;Randum Number
DB OFFSET IN4VAL3+1-INST4

INST4:
  IN4OP1:
   DB 0B8          ;Here we use the B8 opcode (better)
  IN4VAL1:
   DW ?            ;Will be replace with MOV counter, Double Code Size
  IN4INS1:
  IN4OP2:
   DB 0B8
  IN4VAL2:
   DW ?            ;Will be replaced with MOV Pointer, offset to code
  IN4INS2:
  IN4OP3:
   DB 0B8          ;Could have used the C7 opcode, but this is better
  IN4VAL3:
   DW ?            ;Will be replaced with MOV Seed, Random
INEND4:
