   ; elf
   %define PT_LOAD     1
   %define PT_DYNAMIC  2

   %define DT_PLTGOT   3
   %define DT_HASH         4
   %define DT_STRTAB       5
   %define DT_SYMTAB       6

   %define e_ident     0   ; 16
   %define e_type      16  ; 2
   %define e_machine   18  ; 2
   %define e_version   20  ; 2
   %define e_entry     24  ; 4
   %define e_phoff     28  ; 4
   %define e_shoff     32  ; 4
   %define e_flags     36  ; 4
   %define e_ehsize    40  ; 2
   %define e_phentsize 42  ; 2
   %define e_phnum     44  ; 2
   %define e_shentsize 46  ; 2
   %define e_shnum     48  ; 2
   %define e_shstrndx  50  ; 2
   ; phdr
   %define p_type      0   ; 4
   %define p_offset    4   ; 4
   %define p_vaddr     8   ; 4
   %define p_paddr     12  ; 4
   %define p_filesz    16  ; 4
   %define p_memsz     20  ; 4
   %define p_flags     24  ; 4
   %define p_align     28  ; 4
   ; shdr
   %define sh_name     0   ; 4
   %define sh_type     4   ; 4
   %define sh_flags    8   ; 4
   %define sh_addr     12  ; 4
   %define sh_offset   16  ; 4
   %define sh_size     20  ; 4
   %define sh_link     24  ; 4
   %define sh_info     28  ; 4
   %define sh_addralign    32  ; 4
   %define sh_entsize  36  ; 4

   %define MAP_ANONYMOUS   0x20
   %define MAP_SHARED  0x01
   %define MAP_PRIVATE 0x02

   %define PROT_READ   0x1
   %define PROT_WRITE  0x2
   %define PROT_EXEC   0x4


   %define O(x)    (x - main)
