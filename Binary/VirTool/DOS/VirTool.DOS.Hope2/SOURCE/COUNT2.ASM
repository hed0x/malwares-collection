.model Tiny
.Radix 16
.code

;Designed for HOPE 2.1+

ASSUME CS:_TEXT,DS:_TEXT
PUBLIC COUNTSTART

COUNTSTART:

;-----------------COUNT Modules-----------------------
COUNT1:
DW OFFSET COUNT2
DB OFFSET CNTEND1-CNTST1
DB 00000010xB  ;No requirements / 2 RSJs
DB 00100000xB  ;Decrease counter by 2, Increase Pointer by 2 (so zero crypt)
DB 5
DB 00000001xB          ;Pointer reg in bits 0-2
DB OFFSET CNT1MODRM1-CNTST1
DB 10010000xB
DB OFFSET CNT1INS1-CNTST1
DB 00000000xB          ;Counter reg in bits 0-2
DB OFFSET CNT1OP1-CNTST1
DB 10010000xB
DB OFFSET CNT1INS2-CNTST1
DB 00000000xB          ;Counter reg in bits 0-2
DB OFFSET CNT1OP2-CNTST1

        CNTST1:
         DB 083        ;ADD ev,ib
        CNT1MODRM1:
         DB 11000000xB ;/0 /r
         DB 02         ;Increase Pointer by 2
        CNT1INS1:
        CNT1OP1:
         DB 048        ;DEC rv
        CNT1INS2:
        CNT1OP2:
         DB 048        ;DEC rv
        CNTEND1:

COUNT2:
DW OFFSET COUNT3
DB OFFSET CNTEND2-CNTST2
DB 00000010xB
DB 00010000xB          ;Decrease counter by 1, Increase Index by 2 (so zero)
DB 5
DB 00000000xB          ;Counter reg in bits 0-2
DB OFFSET CNT2OP1-CNTST2
DB 10010000xB
DB OFFSET CNT2INS1-CNTST2
DB 00000001xB          ;Pointer reg in bits 0-2
DB OFFSET CNT2OP2-CNTST2
DB 10010000xB
DB OFFSET CNT2INS2-CNTST2
DB 00000001xB          ;Pointer reg in bits 0-2
DB OFFSET CNT2OP3-CNTST2

        CNTST2:
        CNT2OP1:
         DB 048        ;DEC rv
        CNT2INS1:
        CNT2OP2:
         DB 040        ;INC rv
        CNT2INS2:
        CNT2OP3:
         DB 040        ;INC rv
        CNTEND2:

COUNT3:
DW OFFSET COUNT4
DB OFFSET CNTEND3-CNTST3
DB 00000001xB
DB 00000000xB          ;Decrease Counter by 0, Increase Index by 2 (so zero)
DB 3
DB 00000001xB          ;Pointer reg in bits 0-2
DB OFFSET CNT3OP1-CNTST3
DB 10010000xB
DB OFFSET CNT3INS1-CNTST4
DB 00000001xB          ;Pointer reg in bits 0-2
DB OFFSET CNT3OP2-CNTST3
 
        CNTST3:
        CNT3OP1:
         DB 040        ;INC rv
        CNT3INS1:
        CNT3OP2:
         DB 040        ;INC rv
        CNTEND3:

COUNT4:
DW OFFSET COUNT5
DB OFFSET CNTST4-CNTEND4
DB 00000010xB
DB 00100100xB          ;Decrease Counter by 2, Increase Pointer by 1 (so 1)
DB 5
DB 00000000xB          ;Counter reg in bits 0-2
DB OFFSET CNT4OP1-CNTST4
DB 10010000xB
DB OFFSET CNT4INS1-CNTST4
DB 00000001xB          ;Pointer reg in bits 0-2
DB OFFSET CNT4OP2-CNTST4
DB 10010000xB
DB OFFSET CNT4INS2-CNTST4
DB 00000000xB          ;Counter reg in bits 0-2
DB OFFSET CNT4OP3-CNTST4

        CNTST4:
        CNT4OP1:
         DB 048        ;DEC rv
        CNT4INS1:
        CNT4OP2:
         DB 040        ;INC rv
        CNT4INS2:
        CNT4OP3:
         DB 048        ;DEC rv
        CNTEND4:

COUNT5:
DW OFFSET COUNT6
DB OFFSET CNTEND5-CNTST5
DB 00000001xB
DB 00010100xB        ;Decrease Counter by 1, Need to Increase Ptr extra 1
DB 3
DB 00000000xB
DB OFFSET CNT5OP1-CNTST5    ;Counter
DB 10010000xB
DB OFFSET CNT5INS1-CNTST5   ;RSJ
DB 00000001xB
DB OFFSET CNT5OP2-CNTST5    ;Pointer

        CNTST5:
        CNT5OP1:
         DB 048      ;DEC rv
        CNT5INS1:
        CNT5OP2:
         DB 040      ;INC rv
        CNTEND5:


COUNT6:
DW OFFSET COUNT7
DB OFFSET CNTEND6-CNTST6
DB 00000000xB
DB 00000100xB        ;Decrease Counter by 0, Increase Pointer by 1
DB 1
DB 00000001xB        ;Pointer
DB OFFSET CNT6OP1-CNTST6

        CNTST6:
        CNT6OP1:
         DB 040      ;INC rv
        CNTEND6:

COUNT7:
DW OFFSET COUNT8
DB OFFSET CNTEND7-CNTST7
DB 00000010xB
DB 00100000xB        ;Decrease Counter by 2, Increase Pointer by 2 (so zero)
DB 6
DB 00000001xB          ;Pointer reg in bits 0-2
DB OFFSET CNT7OP1-CNTST7
DB 00000000xB          ;Counter reg in bits 0-2
DB OFFSET CNT7OP2-CNTST7
DB 10010000xB
DB OFFSET CNT7INS1-CNTST7
DB 00000000xB          ;Counter reg in bits 0-2
DB OFFSET CNT7OP3-CNTST7
DB 00000001xB          ;Pointer reg in bits 0-2
DB OFFSET CNT7OP4-CNTST7
DB 10010000xB
DB OFFSET CNT7INS2-CNTST7

        CNTST7:
        CNT7OP1:
         DB 040        ;INC +rv
        CNT7OP2:
         DB 048        ;DEC +rv
        CNT7INS1:      ;RSJ
        CNT7OP3:
         DB 048        ;DEC +rv
        CNT7INS2:      ;RSJ
        CNT7OP4:
         DB 040        ;INC +rv
        CNTEND7:

COUNT8:
DW OFFSET COUNT1
DB OFFSET JEND8-JST8
DB 10000010xB       ;Reqs CX is count, 2 RSJs
DB 00010100xB       ;Dec count by 1, inc pointer by 1, so 1
DB 4
DB 00000001xB       ;Pointer
DB OFFSET J8OP1-JST8
DB 10010000xB       ;RSJ
DB OFFSET J8INS1-JST8
DB 01101100xB       ;Reloc
DB OFFSET J8OFF1-JST8
DB 10010000xB       ;RSJ
DB OFFSET J8INS2-JST8

JST8:
    J8OP1:
     DB 040
    J8INS1:
     DB 0E2    ;LOOP
    J8OFF1:
     DB 0
    J8INS2:
JEND8:
