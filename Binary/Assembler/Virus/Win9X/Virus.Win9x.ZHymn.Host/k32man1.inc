   ;get_kernel_base:       mov     ebx, 0BFF70000h
   ;                       retn

   ; output: CF=0 -- EBX=kernel base
   ;         CF=1 -- EBX unmodified

   get_kernel_base:        pusha

                           call    __seh_init
                           mov     esp, [esp+8]
   __not_found:            stc
                           jmp     __seh_exit
   __seh_init:             push    dword ptr fs:[0]
                           mov     fs:[0], esp

                           call    get_any_dll_addr
                           call    find_base

                           mov     edx, [ebx+3Ch]          ; PE header
                           mov     edx, [ebx+edx+80h]      ; ImportTableRVA
                           or      edx, edx
                           jz      __exit
   __cycle:                add     edx, 20
                           mov     ecx, [ebx+edx-20+0Ch]
                           jecxz   __exit
                           call    cmp_kernel32
                           jne     __cycle

                           mov     ecx, [ebx+edx-20+10h]   ; AddressTableRVA
                           jecxz   __exit
                           mov     ebx, [ebx+ecx]          ; kernel's proc addr
                           call    find_base
   __exit:
                           mov     ecx, [ebx+3Ch]          ; PE header
                           mov     ecx, [ebx+ecx+78h]      ; export table rva
                           jecxz   __not_found
                           mov     ecx, [ebx+ecx+0Ch]      ; NameRVA
                           jecxz   __not_found
                           call    cmp_kernel32
                           jne     __not_found

                           mov     [esp+8].popa_ebx, ebx
                           clc

   __seh_exit:             pop     dword ptr fs:[0]
                           pop     eax

                           popa
                           retn

   cmp_kernel32:           mov     eax, [ebx+ecx]
                           xor     eax, [ebx+ecx+4]
                           cmp     eax, 'NREK' xor '23LE'
                           retn

   get_any_dll_addr:       mov     eax, fs:[0]
   __cycle:                cmp     dword ptr [eax], -1
                           mov     ebx, [eax+4]
                           mov     eax, [eax]
                           jnz     __cycle
                           ret

   PROC_ALIGN              equ     65536

   find_base:              and     ebx, not (PROC_ALIGN-1)
                           add     ebx, PROC_ALIGN
   __cycle:                sub     ebx, PROC_ALIGN
                           mov     eax, [ebx]
                           neg     eax
                           cmp     ax, -'ZM'
                           jne     __cycle
                           ret
