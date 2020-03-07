   ; By using this file, you agree to the terms and conditions set
   ; forth in the COPYING file which can be found at the top level
   ; of this distribution.
   ;
   %define SYS_exit    1
   %define SYS_fork    2
   %define SYS_write   4
   %define SYS_open    5
   %define SYS_close   6
   %define SYS_lseek   19
   %define SYS_nice    34
   %define SYS_brk     45
   %define SYS_signal  48
   %define SYS_setsid  66
   %define SYS_readdir 89
   %define SYS_mmap    90
   %define SYS_munmap  91
   %define SYS_ftruncate   93
   %define SYS_mprotect    125
   %define SYS_mmap2   192

   %define PROT_READ   0x01
   %define PROT_WRITE  0x02
   %define PROT_EXEC   0x04
   %define PROT_NONE   0x00

   %define MAP_SHARED  0x01
   %define MAP_PRIVATE 0x02
   %define MAP_ANONYMOUS   0x20

   %define sz_dirent   268
   %define dirent_filename 10
