
%define origin 0x77770000

org origin

ehdr:
db 0x7F,"ELF",1,1,1,9, 0,0,0,0, 0,0,0,0 ; e_ident
                   ;^--now is FreeBSD-compatible
dw 2                                    ; e_type == ET_EXEC
dw 3                                    ; e_machine == EM_386
dd 1                                    ; e_version == EV_CURRENT
dd _start                               ; e_entry
dd phdr - ehdr                          ; e_phoff
dd 0                                    ; e_shoff
dd 0                                    ; e_flags
dw ehdrsize                             ; e_ehsize
dw phdrsize                             ; e_phentsize
dw 1                                    ; e_phnum
dw 0                                    ; e_shentsize
dw 0                                    ; e_shnum
dw 0                                    ; e_shstrndx
ehdrsize equ $ - ehdr
phdr:
dd 1                                    ; p_type == PT_LOAD
dd 0                                    ; p_offset
dd $$                                   ; p_vaddr
dd 0                                    ; p_paddr
dd physsize                             ; p_filesz
dd virtsize                             ; p_memsz
dd 7                                    ; p_flags
dd 4096                                 ; p_align
phdrsize equ $ - phdr
