FALSE   =       0
TRUE    =       1
NULL    =       0
MAX_PATH =      260
UCHAR TYPEDEF BYTE

CREATE_NEW                           equ 1
CREATE_ALWAYS                        equ 2
OPEN_EXISTING                        equ 3
OPEN_ALWAYS                          equ 4
TRUNCATE_EXISTING                    equ 5

GENERIC_READ                         equ 80000000h
GENERIC_WRITE                        equ 40000000h
GENERIC_EXECUTE                      equ 20000000h
GENERIC_ALL                          equ 10000000h

WIN32_FIND_DATA struc
                dwFileAttributes    dd   0
                ftCreationTime      dd   0,0
                ftLastAccessTime    dd   0,0
                ftLastWriteTime     dd   0,0
                nFileSizeHigh       dd   0
                nFileSizeLow        dd   0
                dwReserved0         dd   0
                dwReserved1         dd   0
                cFileName           db   MAX_PATH dup(0)
                cAlternateFileName  db   14 dup(0)
WIN32_FIND_DATA ends

API MACRO a
   extrn a:proc
   call a
ENDM

STARTUPINFO STRUCT
  cb                DWORD      ?
  lpReserved        DWORD      ?
  lpDesktop         DWORD      ?
  lpTitle           DWORD      ?
  dwX               DWORD      ?
  dwY               DWORD      ?
  dwXSize           DWORD      ?
  dwYSize           DWORD      ?
  dwXCountChars     DWORD      ?
  dwYCountChars     DWORD      ?
  dwFillAttribute   DWORD      ?
  dwFlags           DWORD      ?
  wShowWindow       WORD       ?
  cbReserved2       WORD       ?
  lpReserved2       DWORD      ?
  hStdInput         DWORD      ?
  hStdOutput        DWORD      ?
  hStdError         DWORD      ?
STARTUPINFO ENDS

PROCESS_INFORMATION STRUCT
  hProcess      DWORD      ?
  hThread       DWORD      ?
  dwProcessId   DWORD      ?
  dwThreadId    DWORD      ?
PROCESS_INFORMATION ENDS

FILE_ATTRIBUTE_READONLY              equ 1h
FILE_ATTRIBUTE_HIDDEN                equ 2h
FILE_ATTRIBUTE_SYSTEM                equ 4h
FILE_ATTRIBUTE_DIRECTORY             equ 10h
FILE_ATTRIBUTE_ARCHIVE               equ 20h
FILE_ATTRIBUTE_NORMAL                equ 80h
FILE_ATTRIBUTE_TEMPORARY             equ 100h
FILE_ATTRIBUTE_COMPRESSED            equ 800h

STD_INPUT_HANDLE                     equ -10
STD_OUTPUT_HANDLE                    equ -11
STD_ERROR_HANDLE                     equ -12
