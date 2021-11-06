;
;                       . .: .:.. :.. .. .:.::. :. ..:
;                     <<-==ÜÛÛÛÛÛÜ=ÜÛÛÛÛÛÜ=ÜÛÛÛÛÛÜ===<
;                      .:: ÛÛÛ ÛÛÛ:ÛÛÛ ÛÛÛ.ÛÛÛ ÛÛÛ .:.
;                      . .:.ÜÜÜÛÛß.ßÛÛÛÛÛÛ.ÛÛÛÛÛÛÛ:..
;                       ...ÛÛÛÜÜÜÜ:ÜÜÜÜÛÛÛ:ÛÛÛ ÛÛÛ.::.
;                      >===ÛÛÛÛÛÛÛ=ÛÛÛÛÛÛß=ÛÛÛ ÛÛÛ=->>
;                     .: .:.. ..:. .: ..:.::. ::.. :.:.
;
;                              [29A INC files]
;                           Win32 API definitionz
;                            by Jacky Qwerty/29A
;
; Description
; ÄÄÄÄÄÄÄÄÄÄÄ
; This include file contains some  of the constantz and structurez needed to
; work with typical Win32 API functionz from inside ASM filez. This file can
; work only with TASM(32), of course. MASM sucks.. :P
;
; Disclaimer
; ÄÄÄÄÄÄÄÄÄÄ
; This file was built up by Jacky Qwerty from 29A. The author is not respon-
; sible for any problemz caused due to use/misuse of this file.
;
;
; (c) 1997. No rightz reserved. Use without permision >8P.


; ÄÄ´ Some global constantz ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

NULL                            EQU     0
FALSE                           EQU     0
TRUE                            EQU     1
MAX_PATH                        EQU     260
INVALID_HANDLE_VALUE            EQU     -1
STANDARD_RIGHTS_REQUIRED        EQU     000F0000h

; ÄÄ´ Desired access valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

GENERIC_READ                    EQU     80000000h
GENERIC_WRITE                   EQU     40000000h

; ÄÄ´ Share mode valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

FILE_SHARE_READ                 EQU     00000001h
FILE_SHARE_WRITE                EQU     00000002h

; ÄÄ´ Creation disposition valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

CREATE_NEW                      EQU     1
CREATE_ALWAYS                   EQU     2
OPEN_EXISTING                   EQU     3
OPEN_ALWAYS                     EQU     4
TRUNCATE_EXISTING               EQU     5

; ÄÄ´ File attributez and flag valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

FILE_ATTRIBUTE_READONLY         EQU     00000001h
FILE_ATTRIBUTE_HIDDEN           EQU     00000002h
FILE_ATTRIBUTE_SYSTEM           EQU     00000004h
FILE_ATTRIBUTE_DIRECTORY        EQU     00000010h
FILE_ATTRIBUTE_ARCHIVE          EQU     00000020h
FILE_ATTRIBUTE_NORMAL           EQU     00000080h
FILE_ATTRIBUTE_TEMPORARY        EQU     00000100h
FILE_ATTRIBUTE_ATOMIC_WRITE     EQU     00000200h
FILE_ATTRIBUTE_XACTION_WRITE    EQU     00000400h
FILE_ATTRIBUTE_COMPRESSED       EQU     00000800h
FILE_ATTRIBUTE_HAS_EMBEDDING    EQU     00001000h

FILE_FLAG_POSIX_SEMANTICS       EQU     01000000h
FILE_FLAG_BACKUP_SEMANTICS      EQU     02000000h
FILE_FLAG_DELETE_ON_CLOSE       EQU     04000000h
FILE_FLAG_SEQUENTIAL_SCAN       EQU     08000000h
FILE_FLAG_RANDOM_ACCESS         EQU     10000000h
FILE_FLAG_NO_BUFFERING          EQU     20000000h
FILE_FLAG_OVERLAPPED            EQU     40000000h
FILE_FLAG_WRITE_THROUGH         EQU     80000000h

; ÄÄ´ Protection and other valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

SECTION_QUERY                   EQU     00000001h
SECTION_MAP_WRITE               EQU     00000002h
SECTION_MAP_READ                EQU     00000004h
SECTION_MAP_EXECUTE             EQU     00000008h
SECTION_EXTEND_SIZE             EQU     00000010h

SECTION_ALL_ACCESS              EQU     STANDARD_RIGHTS_REQUIRED OR \
                                        SECTION_QUERY            OR \
                                        SECTION_MAP_WRITE        OR \
                                        SECTION_MAP_READ         OR \
                                        SECTION_MAP_EXECUTE      OR \
                                        SECTION_EXTEND_SIZE

FILE_MAP_COPY                   EQU     SECTION_QUERY
FILE_MAP_WRITE                  EQU     SECTION_MAP_WRITE
FILE_MAP_READ                   EQU     SECTION_MAP_READ
FILE_MAP_ALL_ACCESS             EQU     SECTION_ALL_ACCESS

PAGE_NOACCESS                   EQU     00000001h
PAGE_READONLY                   EQU     00000002h
PAGE_READWRITE                  EQU     00000004h
PAGE_WRITECOPY                  EQU     00000008h
PAGE_EXECUTE                    EQU     00000010h
PAGE_EXECUTE_READ               EQU     00000020h
PAGE_EXECUTE_READWRITE          EQU     00000040h
PAGE_EXECUTE_WRITECOPY          EQU     00000080h
PAGE_GUARD                      EQU     00000100h
PAGE_NOCACHE                    EQU     00000200h
MEM_COMMIT                      EQU     00001000h
MEM_RESERVE                     EQU     00002000h
MEM_DECOMMIT                    EQU     00004000h
MEM_RELEASE                     EQU     00008000h
MEM_FREE                        EQU     00010000h
MEM_PRIVATE                     EQU     00020000h
MEM_MAPPED                      EQU     00040000h
MEM_TOP_DOWN                    EQU     00100000h
SEC_FILE                        EQU     00800000h
SEC_IMAGE                       EQU     01000000h
SEC_RESERVE                     EQU     04000000h
SEC_COMMIT                      EQU     08000000h
SEC_NOCACHE                     EQU     10000000h
MEM_IMAGE                       EQU     SEC_IMAGE

; ÄÄ´ Code Page valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

CP_ACP                          EQU     0       ; ANSI code page
CP_OEMCP                        EQU     1       ; OEM  code page
CP_MACCP                        EQU     2       ; MAC  code page

; ÄÄ´ Message Box suport valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

MB_OK                           EQU     00000000h
MB_OKCANCEL                     EQU     00000001h
MB_ABORTRETRYIGNORE             EQU     00000002h
MB_YESNOCANCEL                  EQU     00000003h
MB_YESNO                        EQU     00000004h
MB_RETRYCANCEL                  EQU     00000005h
MB_TYPEMASK                     EQU     0000000Fh

MB_ICONHAND                     EQU     00000010h
MB_ICONQUESTION                 EQU     00000020h
MB_ICONEXCLAMATION              EQU     00000030h
MB_ICONASTERISK                 EQU     00000040h
MB_ICONMASK                     EQU     000000F0h

MB_ICONINFORMATION              EQU     MB_ICONASTERISK
MB_ICONSTOP                     EQU     MB_ICONHAND

MB_DEFBUTTON1                   EQU     00000000h
MB_DEFBUTTON2                   EQU     00000100h
MB_DEFBUTTON3                   EQU     00000200h
MB_DEFMASK                      EQU     00000F00h

MB_APPLMODAL                    EQU     00000000h
MB_SYSTEMMODAL                  EQU     00001000h
MB_TASKMODAL                    EQU     00002000h

MB_NOFOCUS                      EQU     00008000h

; ÄÄ´ Some general Win32 related structurez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

FILETIME                        STRUC
        FT_dwLowDateTime        DD ?
        FT_dwHighDateTime       DD ?
FILETIME                        ENDS

WIN32_FIND_DATA                 STRUC
        WFD_dwFileAttributes    DD ?
        WFD_ftCreationTime      FILETIME ?
        WFD_ftLastAccessTime    FILETIME ?
        WFD_ftLastWriteTime     FILETIME ?
        WFD_nFileSizeHigh       DD ?
        WFD_nFileSizeLow        DD ?
        WFD_dwReserved0         DD ?
        WFD_dwReserved1         DD ?
        WFD_szFileName          DB MAX_PATH DUP (?)
        WFD_szAlternateFileName DB 13 DUP (?)
                                DB 3 DUP (?)    ; dword padding
WIN32_FIND_DATA                 ENDS

SIZEOF_WIN32_FIND_DATA  EQU     SIZE WIN32_FIND_DATA

; ÄÄ´ Context related stuff (i386, i486) ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

; The following flagz control the contentz of the CONTEXT structure:

CONTEXT_i386    EQU     00010000h       ; This assumes that i386 and i486
CONTEXT_i486    EQU     00010000h       ;   have identical context recordz.

CONTEXT_CONTROL         EQU (CONTEXT_i386 OR 01h) ; SS:SP, CS:IP, FLAGS, BP.
CONTEXT_INTEGER         EQU (CONTEXT_i386 OR 02h) ; AX, BX, CX, DX, SI, DI.
CONTEXT_SEGMENTS        EQU (CONTEXT_i386 OR 04h) ; DS, ES, FS, GS.
CONTEXT_FLOATING_POINT  EQU (CONTEXT_i386 OR 08h) ; 387 state
CONTEXT_DEBUG_REGISTERS EQU (CONTEXT_i386 OR 10h) ; DB 0-3,6,7

CONTEXT_FULL            EQU (CONTEXT_CONTROL OR CONTEXT_INTEGER OR \
                             CONTEXT_SEGMENTS)

; Size of the 80387 save area, which is in the context frame:

SIZE_OF_80387_REGISTERS         EQU     80

FLOATING_SAVE_AREA              STRUC
        ControlWord             DD      ?
        StatusWord              DD      ?
        TagWord                 DD      ?
        ErrorOffset             DD      ?
        ErrorSelector           DD      ?
        DataOffset              DD      ?
        DataSelector            DD      ?
        RegisterArea            DB      SIZE_OF_80387_REGISTERS DUP (?)
        Cr0NpxState             DD      ?
FLOATING_SAVE_AREA              ENDS

; Context Frame:

CONTEXT                         STRUC

; The flags valuez - within the ContextFlags field - control the
; contentz of the CONTEXT structure.
;
; If the context record is used as an input parameter, then
; for each portion of the context record controlled by a flag
; whose value is set, it is asumed that that portion of the
; context record contains valid context. If the context record
; is being used to modify a threadz context, then only that
; portion of the threadz context will be modified.
;
; If the context record is used as an IN OUT parameter to capture
; the context of a thread, then only those portionz of the thread's
; context corresponding to set flags will be returned.
;
; The context record is never used as an OUT only parameter.

        CONTEXT_ContextFlags    DD      ?

; This section is specified/returned if CONTEXT_DEBUG_REGISTERS is
; set in ContextFlags. Note that CONTEXT_DEBUG_REGISTERS is NOT
; included in CONTEXT_FULL:

        CONTEXT_Dr0             DD      ?
        CONTEXT_Dr1             DD      ?
        CONTEXT_Dr2             DD      ?
        CONTEXT_Dr3             DD      ?
        CONTEXT_Dr6             DD      ?
        CONTEXT_Dr7             DD      ?

; This section is specified/returned if the
; ContextFlags word contains the flag CONTEXT_FLOATING_POINT:

        CONTEXT_FloatSave       FLOATING_SAVE_AREA      ?

; This section is specified/returned if the
; ContextFlags word contains the flag CONTEXT_SEGMENTS:

        CONTEXT_SegGs           DD      ?
        CONTEXT_SegFs           DD      ?
        CONTEXT_SegEs           DD      ?
        CONTEXT_SegDs           DD      ?

; This section is specified/returned if the
; ContextFlags word contains the flag CONTEXT_INTEGER:

        CONTEXT_Edi             DD      ?
        CONTEXT_Esi             DD      ?
        CONTEXT_Ebx             DD      ?
        CONTEXT_Edx             DD      ?
        CONTEXT_Ecx             DD      ?
        CONTEXT_Eax             DD      ?

; This section is specified/returned if the
; ContextFlags word contains the flag CONTEXT_CONTROL:

        CONTEXT_Ebp             DD      ?
        CONTEXT_Eip             DD      ?
        CONTEXT_SegCs           DD      ?       ; MUST BE SANITIZED
        CONTEXT_EFlags          DD      ?       ; MUST BE SANITIZED
        CONTEXT_Esp             DD      ?
        CONTEXT_SegSs           DD      ?

CONTEXT                         ENDS

; ÄÄ´ Structured Exception Handling (SEH) related stuff ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

; This structure is the one pointed to by FS:[0]:

EXCEPTIONREGISTRATIONRECORD     STRUC   ; != EXCEPTION_RECORD structure
        ERR_prev_structure      DD      EXCEPTIONREGISTRATIONRECORD PTR ?
        ERR_ExceptionHandler    DD      BYTE PTR ? ; CODE PTR
        ; These are the minimun fieldz required for proper OS operation
        ; Other undocumented fieldz exist for Microsoft and Borland compilerz
EXCEPTIONREGISTRATIONRECORD     ENDS

; Exception record definition:

EXCEPTION_MAXIMUM_PARAMETERS    EQU     15      ; max # of except paramz

EXCEPTION_RECORD                STRUC
        ER_ExceptionCode        DD      ?
        ER_ExceptionFlags       DD      ?
        ER_ExceptionRecord      DD      EXCEPTION_RECORD PTR ?
        ER_ExceptionAddress     DD      BYTE PTR ? ; CODE PTR
        ER_NumberParameters     DD      ?
        ER_ExceptionInformation DD      EXCEPTION_MAXIMUM_PARAMETERS DUP (?)
EXCEPTION_RECORD                ENDS

EXCEPTION_POINTERS              STRUC
        EP_ExceptionRecord      DD      EXCEPTION_RECORD PTR ?
        EP_ContextRecord        DD      CONTEXT PTR ?
EXCEPTION_POINTERS              ENDS

; Other SEH related constantz and return valuez:

EXCEPTION_EXECUTE_HANDLER       EQU     1
EXCEPTION_CONTINUE_SEARCH       EQU     0
EXCEPTION_CONTINUE_EXECUTION    EQU     -1

EXCEPTION_ACCESS_VIOLATION              EQU     0C0000005h
EXCEPTION_DATATYPE_MISALIGNMENT         EQU     080000002h
EXCEPTION_BREAKPOINT                    EQU     080000003h
EXCEPTION_SINGLE_STEP                   EQU     080000004h
EXCEPTION_ARRAY_BOUNDS_EXCEEDED         EQU     0C000008Ch
EXCEPTION_FLT_DENORMAL_OPERAND          EQU     0C000008Dh
EXCEPTION_FLT_DIVIDE_BY_ZERO            EQU     0C000008Eh
EXCEPTION_FLT_INEXACT_RESULT            EQU     0C000008Fh
EXCEPTION_FLT_INVALID_OPERATION         EQU     0C0000090h
EXCEPTION_FLT_OVERFLOW                  EQU     0C0000091h
EXCEPTION_FLT_STACK_CHECK               EQU     0C0000092h
EXCEPTION_FLT_UNDERFLOW                 EQU     0C0000093h
EXCEPTION_INT_DIVIDE_BY_ZERO            EQU     0C0000094h
EXCEPTION_INT_OVERFLOW                  EQU     0C0000095h
EXCEPTION_PRIV_INSTRUCTION              EQU     0C0000096h
EXCEPTION_IN_PAGE_ERROR                 EQU     0C0000006h
EXCEPTION_ILLEGAL_INSTRUCTION           EQU     0C000001Dh
EXCEPTION_NONCONTINUABLE_EXCEPTION      EQU     0C0000025h
EXCEPTION_STACK_OVERFLOW                EQU     0C00000FDh
EXCEPTION_INVALID_DISPOSITION           EQU     0C0000026h
EXCEPTION_GUARD_PAGE                    EQU     080000001h

; Useful structure to access the "Except_Handler" function argumentz:

Except_Handler                  STRUC
        EH_Dummy                DD      ?                    ; Ret address
        EH_ExceptionRecord      DD      EXCEPTION_RECORD PTR ?
        EH_EstablisherFrame     DD      BYTE PTR ?
        EH_ContextRecord        DD      CONTEXT PTR ?
        EH_DispatcherContext    DD      BYTE PTR ?
Except_Handler                  ENDS

; The following macroz "@SEH_SetupFrame" and "@SEH_RemoveFrame" are limited
; assembler versionz of the _try and _except keywordz used in C language.
; They provide fast and powerful "Structured Exception Handling" support
; for Win32 applicationz in a few linez of code. Though Microsoft seems
; intent on hiding the details of OS-level structured exception handling,
; this code relies on documented featurez of the Win32 API implementation
; and as such it works in both Windoze 95 and Windoze NT.

@SEH_SetupFrame macro   ExceptionHandler
                local   set_new_eh
                call    set_new_eh
                mov     esp,[esp.EH_EstablisherFrame]
                ExceptionHandler
    set_new_eh: xor     edx,edx         ; Setup new SEH frame
                push    dword ptr fs:[edx]
                mov     fs:[edx],esp
endm

; The ExceptionHandler argument in the @SEH_SetupFrame macro definition
; can be a single instruction or another macro containing several of them.

@SEH_RemoveFrame macro
                 xor    edx,edx         ; Remove new SEH frame and set old
                 pop    dword ptr fs:[edx]
                 pop    edx
endm

comment #
// Exception disposition return values.

typedef enum _EXCEPTION_DISPOSITION {
    ExceptionContinueExecution,
    ExceptionContinueSearch,
    ExceptionNestedException,
    ExceptionCollidedUnwind
} EXCEPTION_DISPOSITION;

EXCEPTION_DISPOSITION __cdecl _except_handler (
    struct _EXCEPTION_RECORD *ExceptionRecord,
    void * EstablisherFrame,
    struct _CONTEXT *ContextRecord,
    void * DispatcherContext
    );
#

; ÄÄ´ Some Win32 function prototypez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

comment *
HANDLE  CreateFileA
  (ptr)  lpFileName             ; ptr to name of file
         dwDesiredAccess        ; access (read-write) mode
         dwShareMode            ; share mode
  (ptr)  lpSecurityAttributes   ; ptr to SECURITY_ATTRIBUTES struc
         dwCreationDisposition  ; how to create
         dwFlagsAndAttributes   ; file and flag attributez
  (hnd)  hTemplateFile          ; handle to file with attributez to copy

Returns: opened handle if ok, INVALID_HANDLE_VALUE if error.

; dwDesiredAccess valuez:

GENERIC_READ
GENERIC_WRITE

; dwShareMode valuez:

0 ; not shared
FILE_SHARE_READ
FILE_SHARE_WRITE

; dwCreationDisposition valuez:

CREATE_NEW
CREATE_ALWAYS
OPEN_EXISTING
OPEN_ALWAYS
TRUNCATE_EXISTING

; dwFlagsAndAttributes valuez:

FILE_ATTRIBUTE_READONLY
FILE_ATTRIBUTE_HIDDEN
FILE_ATTRIBUTE_SYSTEM
FILE_ATTRIBUTE_ARCHIVE
FILE_ATTRIBUTE_NORMAL
FILE_ATTRIBUTE_COMPRESSED

FILE_FLAG_WRITE_THROUGH
FILE_FLAG_OVERLAPPED
FILE_FLAG_NO_BUFFERING
FILE_FLAG_RANDOM_ACCESS
FILE_FLAG_SEQUENTIAL_SCAN
FILE_FLAG_DELETE_ON_CLOSE
FILE_FLAG_BACKUP_SEMANTICS
FILE_FLAG_POSIX_SEMANTICS

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

HANDLE CreateFileMappingA
  (hnd)  hFile                          ; file handle to map
  (ptr)  lpFileMappingAttributes        ; ptr to SECURITY_ATTRIBUTES struc
         flProtect                      ; protection for mapping object
         dwMaximumSizeHigh              ; high-order 32 bitz of object size
         dwMaximumSizeLow               ; low-order 32 bitz of object size
  (ptr)  lpName                         ; name of file-mapping object
  
Returns: handle to file-mapping object if ok, NULL if error.

; flProtect valuez:

PAGE_READONLY
PAGE_READWRITE
PAGE_WRITECOPY

SEC_COMMIT 
SEC_IMAGE  
SEC_NOCACHE
SEC_RESERVE

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

LPVOID MapViewOfFile
  (hnd)  hFileMappingObject     ; mapping object to map into address space
         dwDesiredAccess        ; access mode
         dwFileOffsetHigh       ; high-order 32 bitz of file offset
         dwFileOffsetLow        ; low-order 32 bitz of file offset
         dwNumberOfBytesToMap   ; number of bytez to map
         
Returns: starting address of the mapped view if ok, NULL if error.

; dwDesiredAccess:

FILE_MAP_WRITE
FILE_MAP_READ
FILE_MAP_ALL_ACCESS
FILE_MAP_COPY

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

HANDLE FindFirstFileA
  (ptr)  lpFileName             ; ptr to name of file to search for
  (ptr)  lpFindFileData         ; ptr to WIN32_FIND_DATA struc

Returns: opened handle if ok, INVALID_HANDLE_VALUE if error.
         it also fills structure pointed by lpFindFileData on return.

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
*

; ÄÄ´ Some macroz for most common functionz ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

@OpenFile       macro   ; open file with r/o or r/w access, not shared
                        ; on input: ECX = desired access, EDX = pszFileName
                xor     eax,eax
                push    eax                             ; 0
                push    FILE_ATTRIBUTE_NORMAL
                push    OPEN_EXISTING
                push    eax                             ; NULL
                push    eax                             ; 0
                push    ecx             ; desired access
                push    edx             ; pszFileName
                call    CreateFileA
endm

@OpenFileR      macro pszFileName ; Open file for r/o access, not shared
                xor     eax,eax
                push    eax                             ; 0
                push    FILE_ATTRIBUTE_NORMAL
                push    OPEN_EXISTING
                push    eax                             ; NULL
                push    eax                             ; 0
                push    GENERIC_READ
                push    pszFileName
                call    CreateFileA
endm

@OpenFileW      macro pszFileName ; Open file for r/w access, not shared
                xor     eax,eax
                push    eax                             ; 0
                push    FILE_ATTRIBUTE_NORMAL
                push    OPEN_EXISTING
                push    eax                             ; NULL
                push    eax                             ; 0
                push    GENERIC_READ OR GENERIC_WRITE
                push    pszFileName
                call    CreateFileA
endm
