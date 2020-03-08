   L     equ Large
   NULL  equ L  0

   PROCESS_ALL_ACCESS      equ 0F0000h+00100000h+0FFFh
   MEM_COMMIT          equ 1000h
   GW_CHILD            equ 5
   WM_SETTEXT                      equ 0Ch
   WM_GETTEXT                      equ 0Dh

   DRIVE_REMOVABLE                 equ 2
   DRIVE_FIXED                     equ 3
   DRIVE_REMOTE                    equ 4
   DRIVE_CDROM                     equ 5
   DRIVE_RAMDISK                   equ 6

   MAX_PATH                        equ 260

   RESOURCE_GLOBALNET      equ 2h
   RESOURCE_CONNECTED              equ 1h

   RESOURCETYPE_DISK       equ 1h
   RESOURCETYPE_ANY                equ 0h

   RESOURCEUSAGE_CONNECTABLE       equ 1h
   RESOURCEUSAGE_CONTAINER         equ 2h

   ERROR_NO_MORE_ITEMS             equ 259

   AF_UNIX         equ    1
   AF_INET         equ    2

   SOCK_STREAM     equ    1
   SOCK_DGRAM      equ    2

   WSADATA        struc
    mVersion       dw      ?
    mHighVersion   dw      ?
    szDescription  db      257 dup (?)
    szSystemStatus db      129 dup (?)
    iMaxSockets    dw      ?
    iMaxUpdDg      dw      ?
    lpVendorInfo   dd      ?
   WSADATA        ends

   SOCKADDR       struc
    sin_family     dw      ?
    sin_port       dw      ?
    sin_addr       dd      ?
    sin_zero       db      8 dup (?)
   SOCKADDR       ends

   HOSTENT        struc
    h_name         dd      ?
    h_aliases      dd      ?
    h_addrtype     dw      ?
    h_lenght       dw      ?
    h_addr_list    dd      ?
    h_ip           dd      ?
   HOSTENT        ends

   NETRESOURCEA STRUCT
     dwScope           DWORD      ?
     dwType            DWORD      ?
     dwDisplayType     DWORD      ?
     dwUsage           DWORD      ?
     lpLocalName       DWORD      ?
     lpRemoteName      DWORD      ?
     lpComment         DWORD      ?
     lpProvider        DWORD      ?
   NETRESOURCEA ENDS

   WIN32_FIND_DATA STRUCT
     dwFileAttributes      DWORD     ?
     ftCreationTime        DWORD     ?,?
     ftLastAccessTime      DWORD     ?,?
     ftLastWriteTime       DWORD     ?,?
     nFileSizeHigh         DWORD     ?
     nFileSizeLow          DWORD     ?
     dwReserved0           DWORD     ?
     dwReserved1           DWORD     ?
     cFileName             BYTE MAX_PATH dup(?)
     cAlternate            BYTE 14 dup(?)
   WIN32_FIND_DATA ENDS

   PEHeaderOffset    EQU 3ch
   ;//////////define PE file header structrue
   ObjectTable       struc
      otName         db 8 dup(?)
      otVirtSize     dd ?
      otRVA          dd ?
      otPhysSize     dd ?
      otPhysOffset   dd ?
      otUnKnow0      dd ?
      otUnknow1      dd ?
      otUnknow2      dd ?
      otFlags        dd ?
   ObjectTable       ends
   ImportsTable      struc
    itApiList           dd ?
    itUnknow0           dd ?
    itUnknow1           dd ?
    itModuleName        dd ?
    itProcList          dd ?
   ImportsTable      ends

   ExportsTable      struc
   etUnKnown0           dd  000000h
   etUnKnown1           dd  000000h
   etUnKnown2           dd  000000h
   etModuleName         dd  40744eh
   etOrdinalBase        dd  000001h
   etExportAddrSum      dd  000d05h
   etExportNameSum      dd  000003h
   etExportAddrList     dd  404028h
   etExportNameList     dd  40743ch
   etExportOrdlList     dd  407448h  ;word list
   ExportsTable      ends

   PEFileHeader      struc
    fhPEFlag            dw 'PE'
    fhUnKnow0           dw ?
    fhCPU               dw ?
    fhObjectCount       dw ?
    fhFileTimeDate      dd ?
    fhSymbolsOffset     dd ?

    fhSymbolsCount      dd ?
    fhOpreateHeaderSize dw ?
    fhFlags             dw ? ;818E
    fhMagic             dw ?
    fhLinkerVersion     dw ?
    fhCodeSize          dd ?

    fhInitDataSize      dd ?
    fhUninitDataSize    dd ?
    fhEntryRVA          dd ?
    fhCodeBase          dd ?

    fhDataBase          dd ?
    fhImageBase         dd ?
    fhObjectAlign       dd ?
    fhFileAlign         dd ?

    fhOSVersion         dd ?
    fhUserVersion       dd ?
    fhSubSystemVersion  dd ?
    fhReserved0         dd ?

    fhImageSize         dd ?
    fhHeaderSize        dd ?
    fhCheckSum          dd ?
    fhSubSystem         dd ? ;02h:GDI,03h:Character

    fhStackReserve      dd ?
    fhStackCommit       dd ?
    fhHeapReserve       dd ?
    fhHeapCommit        dd ?


    fhUnKnow1           dd ?
    fhNumInterestingRVA dd ?
    fhExportsRVA        dd ?
    fhExportsSize       dd ?

    fhImportsRVA        dd ?
    fhImportsSize       dd ?
    fhResourcesRVA      dd ?
    fhResourcesSize     dd ?

    fhExceptionsRVA     dd ?
    fhExceptionsSize    dd ?
    fhSecurityRVA       dd ?
    fhSecuritySize      dd ?

    fhFixups            dd ?
    fhFixupsSize        dd ?
    fhDebug             dd ?
    fhDebugSize         dd ?

    fhDescription       dd ?
    fhDescriptionSize   dd ?
    fhTLS               dd ?
    fhTLSSize           dd ?

    fhCallBacks         dd ?
    fhCallBacksSzie     dd ?
    fhReserved1         dd ?,?

    fhReserved2         dd ?,?
    fhReserved3         dd ?,?

    fhReserved4         dd ?,?
    fhReserved5         dd ?,?

    fhReserved6         dd ?,?

    fhObjectTable00      ObjectTable <>
    fhObjectTable01      ObjectTable <>
    fhObjectTable02      ObjectTable <>
    fhObjectTable03      ObjectTable <>

   PEFileHeader      ends

   SystemTime        struc
      stYear         dw ?
      stMonth        dw ?
      stDayOfWeek    dw ?
      stDay          dw ?
      stHour         dW ?
      stMinute       dw ?
      stSecond       dw ?
      stMilliSecond  dw ?
   SystemTime        ends

   CONTEXT             STRUC
   cx_ContextFlags         DD ?
   ;CONTEXT_DEBUG_REGISTERS
   cx_Dr0              DD ?         ;04
   cx_Dr1              DD ?         ;08
   cx_Dr2              DD ?         ;0C
   cx_Dr3              DD ?         ;10
   cx_Dr6              DD ?         ;14
   cx_Dr7              DD ?         ;18
   ;CONTEXT_FLOATING_POINT
   cx_ControlWord          DD ?
   cx_StatusWord           DD ?
   cx_TagWord          DD ?
   cx_ErrorOffset          DD ?
   cx_ErrorSelector        DD ?
   cx_DataOffset           DD ?
   cx_DataSelector         DD ?
   cx_RegisterArea         DB 80 DUP (?)
   cx_Cr0NpxState          DD ?
   ;CONTEXT_SEGMENTS
   cx_SegGs            DD ?         ;8C
   cx_SegFs            DD ?         ;90
   cx_SegEs            DD ?         ;94
   cx_SegDs            DD ?         ;98
   ;CONTEXT_INTEGER
   cx_Edi              DD ?         ;9C
   cx_Esi              DD ?         ;A0
   cx_Ebx              DD ?         ;A4
   cx_Edx              DD ?         ;A8
   cx_Ecx              DD ?         ;AC
   cx_Eax              DD ?         ;B0
   ;CONTEXT_CONTROL
   cx_Ebp              DD ?         ;B4
   cx_Eip              DD ?         ;B8
   cx_SegCs            DD ?         ;BC
   cx_EFlags           DD ?         ;C0
   cx_Esp              DD ?         ;C4
   cx_SegSs            DD ?         ;C8
   CONTEXT             ENDS

   SystemTime        struc
      stYear         dw ?
      stMonth        dw ?
      stDayOfWeek    dw ?
      stDay          dw ?
      stHour         dW ?
      stMinute       dw ?
      stSecond       dw ?
      stMilliSecond  dw ?
   SystemTime        ends
