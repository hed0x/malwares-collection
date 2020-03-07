   #
   # ELF Header structure: buffer variant
   #

   elf_header:
   e_ident:        .skip 16, 0     # 00 01 02 03 04 05 06 07 08 09 0a 0B 0c 0d 0f
                                   # holds the magic values 0x7f,'ELF' and some
                                   # flags
   e_type:         .word 0         # 10 11
                                   # this word contains the file type (core,
                                   # exe, ...)
   e_machine:      .word 0         # 12 13
                                   # give the machine needed for running (3 = x86)
   e_version:      .int 0          # 14 15 16 17
                                   # ELF header version. Currently 1.
   e_entry:        .int 0          # 18 19 1a 1b
                                   # virtual address of entry point.
   e_phoff:        .int 0          # 1c 1d 1e 1f
                                   # program header offset
   e_shoff:        .int 0          # 20 21 22 23
                                   # sections header offset
   e_flags:        .int 0          # 24 25 26 27
                                   # some other flags (processor specific nfos)
   e_ehsize:       .word 0         # 28 29
                                   # size of the ELF header
   e_phentsize:    .word 0         # 2a 2b
                                   # size of one entry in the program header
   e_phnum:        .word 0         # 2c 2d
                                   # number of entrys in the program header
   e_shentsize:    .word 0         # 2e 2f
                                   # size of one entry in the section header
   e_shnum:        .word 0         # 30 31
                                   # number of entrys in the section header
   e_shstrndx:     .word 0         # 32 33
                                   # give the entry number of the name string
                                   # section (if exists)
   elf_header_size = . - elf_header
