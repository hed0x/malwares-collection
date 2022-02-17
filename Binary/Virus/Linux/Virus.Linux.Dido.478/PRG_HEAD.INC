   #
   # Program header table entry: buffer variant
   #

   prg_header:
   p_type:         .int 0  # 00 01 02 03
                           # type of segment
   p_offset:       .int 0  # 04 05 06 07
                           # offset in file where to start the segment at
   p_vaddr:        .int 0  # 08 08 0a 0b
                           # its virtual adress in memory
   p_addr:         .int 0  # 0c 0d 0e 0f
                           # physical adress (if relevant, else equ to p_vaddr)
   p_filesz:       .int 0  # 10 11 12 13
                           # size of data, started from offset
   p_memsz:        .int 0  # 14 15 16 17
                           # size of the segment in memory
   p_flagz:        .int 0  # 18 19 1a 1b
                           # segment flags (rwx perms)
   p_align:        .int 0  # 1c 1d 1e 1f
                           # alignment
   prg_header_size = . - prg_header
