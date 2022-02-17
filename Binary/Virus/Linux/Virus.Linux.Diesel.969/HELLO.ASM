   ;---------------------------------------------------------------------------;
   ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<   HELLO.ASM   >>>>>>>>>>>>>>>>>>>>>>>>>>>> ;
   ;---------------------------------------------------------------------------;
   ;                                                                           ;
   ; This is a simple assembly program to explain you how to code in assembly  ;
   ; language under Linux. It must be compiled with TASM or MASM. However,     ;
   ; I guess it can be easily adapted to NASM. The program will display        ;
   ; "Hello" on the screen, and then exit with return code 42.                 ;
   ;                                                                           ;
   ; How to compile :                                                          ;
   ;                                                                           ;
   ;   TASM        HELLO.ASM                                                   ;
   ;   TLINK /3 /t HELLO,HELLO.                                                ;
   ;                                                                           ;
   ; Note that the Turbo Assembler (at least v3.1) can be runned under dosemu. ;
   ;                                                                           ;
   ;---------------------------------------------------------------------------;

   .386

   RADIX        16

   ASSUME       CS:CODE,DS:CODE

   CODE         SEGMENT

   ELF:

                db           07F, 'ELF', 1, 1, 1     ; Magic
                db           9 dup (0)
                dw           02                      ; Executable File
                dw           03                      ; Intel 80386
                dd           01                      ; ELF Version
                dd           MemBase + offset Start  ; Entrypoint
                dd           offset Program_Header   ; Program Header Offset
                dd           00                      ; Section Header Offset (None)
                dd           00                      ; Machine Flags (Unused)
                dw           34                      ; ELF Header Size
                dw           20                      ; Program Header Entry Size
                dw           01                      ; Number of Entries
                dw           00                      ; Section Header Entry Size
                dw           00                      ; Number of Entries
                dw           00                      ; Section Header Table Index

   Program_Header:

                dd           01                           ; Loadable Segment
                dd           00                           ; Physical Offset
                dd           MemBase                      ; Image Base VAddr
                dd           MemBase                      ; Same (Unused)
                dd           PhySize                      ; Physical Size
                dd           MemSize                      ; Memory Size
                dd           05                           ; Read / Exec
                dd           1000h                        ; Alignment

   Start:

                mov          ebx,offset Output + MemBase  ; Output
                mov          ecx,2                        ; Read / Write
                mov          eax,5                        ; Open
                int          80

                or           eax,eax                      ; Error ?
                js           short Exit

                mov          ebx,eax                      ; File Descriptor
                mov          ecx,offset String + MemBase  ; 'Hello'
                mov          edx,6                        ; Buffer Size
                mov          eax,4                        ; Write
                int          80

                mov          eax,6                        ; Close
                int          80

   Exit:

                mov          bl,42d
                mov          eax,1
                int          80

   Output       db           '/dev/stdout',0
   String       db           'Hello',0A

   Phy_End:

   Mem_End:

   PhySize      equ          offset Phy_End   ; Size of Initialized Code & Data
   MemSize      equ          offset Mem_End   ; PSize + Uninitialized Data
   MemBase      equ          08048000         ; Start of Memory Projection


   CODE         ENDS

   END          ELF

   ;---------------------------------------------------------------------------;
   ; <<<<<<<<<<<<<<   How To Make A System Call Under Linux   >>>>>>>>>>>>>>>> ;
   ;---------------------------------------------------------------------------;

      You should use some code like this :

         mov    ebx,1st Arg
         mov    ecx,2nd Arg
         mov    edx,3rd Arg
         mov    esi,4th Arg
         mov    edi,5th Arg
         mov    eax,SysCall Number (look at unistd.h)
         int    80

      eax will contain the return value. If negative, an error has occured.
      errno.h contains the list of error codes with their signification.

      Here's a brief list of the most used system calls numbers :

         01 - exit     02 - fork     03 - read     04 - write     05 - open
         06 - close    08 - creat    11 - execve   12 - chdir     15 - chmod
         19 - lseek    26 - ptrace   37 - kill     89 - readdir   90 - mmap

      You'll find more in unistd.h

      If you want to get information about a specific system call, like ptrace,
      type:  man 2 ptrace

   ;---------------------------------------------------------------------------;
