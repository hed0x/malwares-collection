   L           equ <LARGE>
   NULL            equ L 0


   MAX_PATH            equ 260
   INVALID_HANDLE_VALUE        equ -1

   REG_SZ          equ 1
   HKEY_CLASSES_ROOT   equ 80000000h
   KEY_ALL_ACCESS      equ 0000003Fh
   HKEY_LOCAL_MACHINE  equ 80000002h

   PROCESS_ALL_ACCESS      equ 001F0FFFh

   _import_directory_entry     struc
   ImportFlags     dd  0
   TimeDateStamp       dd  0
   majorversion        dw  0
   minorversion        dw  0
   NameRVA         dd  0
   LookupTableRVA      dd  0
   AddressTableRVA     dd  0
   _import_directory_entry     ends


   POINTAPI    struc
   x   dd  0
   y   dd  0
   POINTAPI    ends

   PROCESSENTRY32      struc
       dwSize          dd  ?
       cntUsage        dd  ?
       th32ProcessID       dd  ?
       th32DefaultHeapID   dd  ?
       th32ModuleID        dd  ?
       cntThreads      dd  ?
       th32ParentProcessID dd  ?
       pcPriClassBase      dd  ?
       dwFlags         dd  ?
       szExeFile       db  260 dup (?)
   PROCESSENTRY32      ends

   SizeOfProcessEntry32    equ size    PROCESSENTRY32


   RECT    struc
       Left    dd  ?
       Top dd  ?
       Right   dd  ?
       Bottom  dd  ?
   RECT    ends

   FILETIME                        STRUC
           FT_dwLowDateTime        DD ?
           FT_dwHighDateTime       DD ?
   FILETIME                        ENDS

   WIN32_FIND_DATA                 STRUC
           dwFileAttributes    DD ?
           ftCreationTime      FILETIME ?
           ftLastAccessTime    FILETIME ?
           ftLastWriteTime     FILETIME ?
           nFileSizeHigh       DD ?
           nFileSizeLow        DD ?
           dwReserved0         DD ?
           dwReserved1         DD ?
           szFileName          DB MAX_PATH DUP (?)
           szAlternateFileName DB 13 DUP (?)
                                   DB 3 DUP (?)    ; dword padding
   WIN32_FIND_DATA                 ENDS

   SIZEOF_WIN32_FIND_DATA  EQU     SIZE WIN32_FIND_DATA


   MEMORY_BASIC_INFORMATION    struc
       BaseAddress     dd  ?   ; base address of region
       AllocationBase      dd  ?   ; allocation base address
       AllocationProtect   dd  ?   ; initial access protection
       RegionSize      dd  ?   ; size, in bytes, of region
       State           dd  ?   ; committed, reserved, free
       Protect         dd  ?   ; current access protection
       Type            dd  ?   ; type of pages
   MEMORY_BASIC_INFORMATION    ends



   FILE_ATTRIBUTE_READONLY             equ   L 1h
   FILE_ATTRIBUTE_HIDDEN           equ   L 2h
   FILE_ATTRIBUTE_NORMAL               equ   L 80h
   FILE_ATTRIBUTE_TEMPORARY    equ 100h


   TH32CS_SNAPHEAPLIST equ 1h
   TH32CS_SNAPPROCESS  equ 2h
   TH32CS_SNAPTHREAD   equ 4h
   TH32CS_SNAPMODULE   equ 8h
   TH32CS_INHERIT      equ 80000000h

   PAGE_NOACCESS                   EQU     00000001h
   PAGE_READONLY                   EQU     00000002h
   PAGE_READWRITE                  EQU     00000004h
   PAGE_WRITECOPY                  EQU     00000008h
   PAGE_EXECUTE                    EQU     00000010h
   PAGE_EXECUTE_READ               EQU     00000020h
   PAGE_EXECUTE_READWRITE          EQU     00000040h
   PAGE_EXECUTE_WRITECOPY          EQU     00000080h
   PAGE_GUARD                      EQU     00000100h
   PAGE_NOCACHE                    EQU     00000200h

   IMAGE_SCN_MEM_EXECUTE       equ 20000000h
   IMAGE_SCN_MEM_READ      equ 40000000h
   IMAGE_SCN_MEM_WRITE     equ 80000000h
   IMAGE_SCN_CNT_INITIALIZED_DATA  equ 00000040h

   OPEN_EXISTING       equ 3
   FILE_BEGIN      equ 0
   OF_READWRITE        equ 2
   MAX_PATH        equ 260
   CREATE_NEW      equ 1
   FILE_SHARE_READ     equ 1
   PAGE_READWRITE      equ 00000004h
   GENERIC_READ        equ 80000000h
   GENERIC_WRITE       equ 40000000h
   FILE_MAP_WRITE      equ 2
   FILE_MAP_READ       equ 4



   ObjectHeader    struc
   ObjectName      db  8 dup(?)    ; null-padded string identifying section
   PhysicalSize        dd  ?       ; physical size
   RVA         dd  ?       ; RVA to be loaded to
   VirtualSize     dd  ?       ; virtual size (physical size rounded up to object alignement)
   PhysicalOffset      dd  ?       ; offset in file of data
   Reserved        db  12 dup(0)
   Flags           dd  ?       ; section flags
   ObjectHeader    ends


   SYSTEMTIME  struc
   wYear       dw  ?
   wMonth      dw  ?
   wDayOfWeek  dw  ?
   wDay        dw  ?
   wHour       dw  ?
   wMinute     dw  ?
   wSecond     dw  ?
   wMilliseconds   dw  ?
   SYSTEMTIME  ends

   OSVERSIONINFO   struc
   dwOSVersionInfoSize dw  ?
   dwMajorVersion      dw  ?
   dwMinorVersion      dw  ?
   dwBuildNumber       dw  ?
   dwPlatformId        dw  ?
   szCSDVersion        db  128 dup(?)
   OSVERSIONINFO   ends
