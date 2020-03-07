   ; ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
   ; º  Linear Executable (LE) format structures and definitions.     º
   ; º  Compatible with Turbo Assembler (c) and Macro Assembler (c).  º
   ; º  Written by Horned Beast/VADER (c) 1999.                       º
   ; ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½

   ;ÄÄ¶ LE_magic value ÇÄÄ
   IMAGE_VXD_SIGNATURE  = 454Ch     ;'LE'

   ;ÄÄ¶ LE_border values ÇÄÄ
   IMAGE_VXD_LEBO       = 0         ;Little Endian Byte Order
   IMAGE_VXD_BEBO       = 1         ;Big Endian Byte Order

   ;ÄÄ¶ LE_worder values ÇÄÄ
   IMAGE_VXD_LEWO       = 0         ;Little Endian Word Order
   IMAGE_VXD_BEWO       = 1         ;Big Endian Word Order

   ;ÄÄ¶ LE_level value ÇÄÄ
   IMAGE_VXD_LEVEL      = 0         ;32-bit format level

   ;ÄÄ¶ LE_cpu values ÇÄÄ
   IMAGE_VXD_CPU_286    = 1         ;Intel 80286 or upwardly compatible
   IMAGE_VXD_CPU_386    = 2         ;Intel 80386 or upwardly compatible
   IMAGE_VXD_CPU_486    = 3         ;Intel 80486 or upwardly compatible
   IMAGE_VXD_CPU_586    = 4         ;Intel Pentium or upwardly compatible

   ;ÄÄ¶ LE_os values ÇÄÄ
   IMAGE_VXD_OS_UNKNOWN = 0         ;Unknown (any "new-format" OS)
   IMAGE_VXD_OS_OS2     = 1         ;Microsoft/IBM OS/2
   IMAGE_VXD_OS_WINDOWS = 2         ;Microsoft Windows
   IMAGE_VXD_OS_DOS4    = 3         ;Microsoft MS-DOS 4.x
   IMAGE_VXD_OS_DEV386  = 4         ;Microsoft Windows 386 (default)

   ;ÄÄ¶ LE_mflags values ÇÄÄ
   ;
   ; High word has the following format:
   ;
   ; 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0  - bit no
   ;     |                             | |
   ;     |                             | +--- Protected memory library module
   ;     |                             +----- Device driver
   ;     +----------------------------------- Per-Process Library Termination
   ;
   ; Low word has the following format:
   ;
   ; 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0  - bit no
   ;  |     |          | |     | | | |
   ;  |     |          | |     | | | +------- Per-Process Library
   ;  |     |          | |     | | |          Initialization
   ;  |     |          | |     | | +--------- System DLL (internal fixups
   ;  |     |          | |     | |            discarded)
   ;  |     |          | |     | +----------- No Internal Fixups
   ;  |     |          | |     +------------- No External Fixups
   ;  |     |          | +------------------- Incompatible with PM Windowing
   ;  |     |          +--------------------- Compatible with PM Windowing
   ;  |     |                                 Uses PM Windowing API
   ;  |     +-------------------------------- Module not Loadable
   ;  +-------------------------------------- Library module

   IMAGE_VXD_LIBINIT    = 00000004h ;Per-Process Library Initialization
   IMAGE_VXD_SYSDLL     = 00000008h ;System DLL (internal fixups discarded)
   IMAGE_VXD_NOINTFIX   = 00000010h ;NO Internal Fixups
   IMAGE_VXD_NOEXTFIX   = 00000020h ;NO External Fixups
   IMAGE_VXD_APPMASK    = 00000300h ;Application Type Mask
   IMAGE_VXD_NOPMW      = 00000100h ;Incompatible with PM Windowing
   IMAGE_VXD_PMW        = 00000200h ;Compatible with PM Windowing
   IMAGE_VXD_PMAPI      = 00000300h ;Uses PM Windowing API
   IMAGE_VXD_NOLOAD     = 00002000h ;Module not Loadable
   IMAGE_VXD_NOTP       = 00008000h ;Library Module
   IMAGE_VXD_PROTDLL    = 00010000h ;Protected memory library module
   IMAGE_VXD_DEVICE     = 00020000h ;Device driver
   IMAGE_VXD_MODMASK    = 00038000h ;Module type mask
   IMAGE_VXD_MODEXE     = 00000000h ;.EXE module
   IMAGE_VXD_MODDLL     = 00008000h ;.DLL module
   IMAGE_VXD_MODPROTDLL = 00018000h ;Protected memory library module
   IMAGE_VXD_MODPDEV    = 00020000h ;Physical device driver
   IMAGE_VXD_MODVDEV    = 00028000h ;Virtual device driver (VxD)
   IMAGE_VXD_MODDLVDEV  = 00038000h ;Dynamically-loadable VxD
   IMAGE_VXD_LIBTERM    = 40000000h ;Per-Process Library Termination

   IMAGE_VAR_OFFSET  STRUC ;Variable offset
                     UNION ;16 or 32-bit offset
     VO_offset16     DW ?  ;16-bit offset
     VO_offset32     DD ?  ;32-bit offset
                     ENDS
   IMAGE_VAR_OFFSET  ENDS

   ;ÄÄ¶ OH_flags values ÇÄÄ
   ;
   ; High word of dword flag field is not used.
   ; Low word has the following format:
   ;
   ; 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0  - bit no
   ;  |  |  |  |     | | | | | | | | | | |
   ;  |  |  |  |     | | | | | | | | | | +--- Readable Object
   ;  |  |  |  |     | | | | | | | | | +----- Writeable Object
   ;  |  |  |  |     | | | | | | | | +------- Executable Object
   ;  |  |  |  |     | | | | | | | +--------- Resource Object
   ;  |  |  |  |     | | | | | | +----------- Object is Discardable
   ;  |  |  |  |     | | | | | +------------- Object is Shared
   ;  |  |  |  |     | | | | +--------------- Object has preload pages
   ;  |  |  |  |     | | | +----------------- Object has invalid pages
   ;  |  |  |  |     | | +------------------- Object is permanent and swappable
   ;  |  |  |  |     | +--------------------- Object is permanent and resident
   ;  |  |  |  |     +----------------------- Object is permanent and long
   ;  |  |  |  |                              locable
   ;  |  |  |  +----------------------------- 16:16 alias required (80x86
   ;  |  |  |                                 specific)
   ;  |  |  +-------------------------------- Big/Default bit setting (80x86
   ;  |  |                                    specific)
   ;  |  +----------------------------------- Object is conforming for code
   ;  |                                       (80x86 specific)
   ;  +-------------------------------------- Object I/O privilege level
   ;                                          (80x86 specific)

   IMAGE_OBJ_READ       = 0001h ;Readable Object
   IMAGE_OBJ_WRITE      = 0002h ;Writeable Object
   IMAGE_OBJ_EXEC       = 0004h ;Executable Object
   IMAGE_OBJ_RSRC       = 0008h ;Resource Object
   IMAGE_OBJ_DISCARD    = 0010h ;Object is Discardable
   IMAGE_OBJ_SHARED     = 0020h ;Object is Shared
   IMAGE_OBJ_PRELOAD    = 0040h ;Object has preload pages
   IMAGE_OBJ_INVALID    = 0080h ;Object has invalid pages
   IMAGE_OBJ_TYPEMASK   = 0700h ;Object type mask
   IMAGE_OBJ_LNKNONPERM = 0600h ;Object is nonpermanent - should be
   IMAGE_OBJ_NONPERM    = 0000h ;zero but LINK386 uses 6
   IMAGE_OBJ_PERM       = 0100h ;Object is permanent and swappable
   IMAGE_OBJ_RESIDENT   = 0200h ;Object is permanent and resident
   IMAGE_OBJ_CONTIG     = 0300h ;Object is resident and contiguous
   IMAGE_OBJ_DYNAMIC    = 0400h ;Object is permanent and long locable
   IMAGE_OBJ_RESERVED   = 0800h ;Reserved
   IMAGE_OBJ_ALIAS16    = 1000h ;16:16 alias required (80x86 specific)
   IMAGE_OBJ_BIGDEF     = 2000h ;Big/Default bit setting (80x86 specific)
   IMAGE_OBJ_CONFORM    = 4000h ;Object is conforming for code (80x86 specific)
   IMAGE_OBJ_IOPL       = 8000h ;Object I/O privilege level (80x86 specific)

   IMAGE_OBJECT_HEADER  STRUC ;Object table entry
     OH_size            DD ?  ;Object virtual size
     OH_base            DD ?  ;Object base virtual address
     OH_flags           DD ?  ;Attribute flags
     OH_pagemap         DD ?  ;Object page map index
     OH_mapsize         DD ?  ;Number of entries in object page map
     OH_reserved        DD ?  ;Reserved
   IMAGE_OBJECT_HEADER  ENDS

   ;ÄÄ¶ OPH_flags values ÇÄÄ
   IMAGE_PAGE_VALID     = 0     ;Valid Physical Page
   IMAGE_PAGE_ITERDATA  = 1     ;Iterated Data Page
   IMAGE_PAGE_INVALID   = 2     ;Invalid Page
   IMAGE_PAGE_ZEROED    = 3     ;Zero Filled Page
   IMAGE_PAGE_RANGE     = 4     ;Range of pages
   IMAGE_PAGE_ITERDATA2 = 5     ;Iterated Data Page Type II

   IMAGE_OBJECT_PAGE_HEADER  STRUC ;Object page map entry
     OPH_highpage            DW ?  ;High page number
     OPH_lowpage             DB ?  ;Low page number
     OPH_flags               DB ?  ;Per-page attributes
   IMAGE_OBJECT_PAGE_HEADER  ENDS

   IMAGE_RESOURCE_HEADER  STRUC ;Resource table entry
     RH_type              DW ?  ;Resource type
     RH_name              DW ?  ;Resource name
     RH_cb                DD ?  ;Resource size
     RH_obj               DW ?  ;Object number
     RH_offset            DD ?  ;Offset within object
   IMAGE_RESOURCE_HEADER  ENDS

   ;ÄÄ¶ EB_type values ÇÄÄ
   IMAGE_BND_EMPTY      = 00h   ;Empty bundle
   IMAGE_BND_ENTRY16    = 01h   ;16-bit offset entry point
   IMAGE_BND_GATE16     = 02h   ;286 call gate (16-bit IOPL)
   IMAGE_BND_ENTRY32    = 03h   ;32-bit offset entry point
   IMAGE_BND_ENTRYFWD   = 04h   ;Forwarder entry point
   IMAGE_BND_TYPEINFO   = 80h   ;Typing information present flag

   IMAGE_ENTRY_BUNDLE  STRUC ;Entry bundle
     EB_cnt            DB ?  ;Number of entries in this bundle
     EB_type           DB ?  ;Bundle type
     EB_obj            DW ?  ;Object number
   IMAGE_ENTRY_BUNDLE  ENDS

   IMAGE_CALLGATE  STRUC ;Call gate format
     CG_offset     DW ?  ;Offset in segment
     CG_callgate   DW ?  ;Call gate selector
   IMAGE_CALLGATE  ENDS

   IMAGE_FORWARDER  STRUC ;Forwarder format
     FWD_modord     DW ?  ;Module ordinal number
     FWD_value      DD ?  ;Proc name offset or ordinal
   IMAGE_FORWARDER  ENDS

   ;ÄÄ¶ Possible entry sizes ÇÄÄ
   IMAGE_ENT_FIXENT16   = 3
   IMAGE_ENT_FIXENT32   = 5
   IMAGE_ENT_GATEENT16  = 5
   IMAGE_ENT_FWDENT     = 7

   ;ÄÄ¶ EH_flags values ÇÄÄ
   ;
   ; 7 6 5 4 3 2 1 0  - bit no
   ; | | | | | | | |
   ; | | | | | | | +--- exported entry
   ; | | | | | | +----- uses shared data
   ; +-+-+-+-+-+------- parameter word count

   IMAGE_ENT_EXPORT     = 001h  ;Exported entry
   IMAGE_ENT_SHARED     = 002h  ;Uses shared data
   IMAGE_ENT_PARAMS     = 0F8h  ;Parameter word count mask

   IMAGE_ENTRY_HEADER  STRUC               ;Entry format - follows bundle
     EH_flags          DB ?                ;Entry point flags
                       UNION               ;Variable entry
     EH_offset         IMAGE_VAR_OFFSET <> ;16-bit/32-bit offset entry
     EH_callgate       IMAGE_CALLGATE <>   ;286 (16-bit) call gate
     EH_fwd            IMAGE_FORWARDER <>  ;Forwarder
                       ENDS
   IMAGE_ENTRY_HEADER  ENDS

   IMAGE_FIXUP_PAGE_HEADER  STRUC ;Fixup page table entry
     FPH_offset             DD ?  ;Offset within fixup record table
   IMAGE_FIXUP_PAGE_HEADER  ENDS

   IMAGE_FIXUP_HEADER  STRUC               ;Single fixup
     FH_soff           DW ?                ;Source offset
     FH_obj            DB ?                ;Target object number
     FH_offset         IMAGE_VAR_OFFSET <> ;Target offset
   IMAGE_FIXUP_HEADER  ENDS

   IMAGE_FIXUP_CHAIN  STRUC               ;Fixup chain
     FC_srccount      DB ?                ;Number of source offsets
     FC_obj           DB ?                ;Target object number
     FC_offset        IMAGE_VAR_OFFSET <> ;Target offset
   IMAGE_FIXUP_CHAIN  ENDS

   ;ÄÄ¶ Possible relocation sizes ÇÄÄ
   IMAGE_RLC_INTSIZE16  = 7
   IMAGE_RLC_INTSIZE32  = 9
   IMAGE_RLC_LISTSIZE16 = 6
   IMAGE_RLC_LISTSIZE32 = 8

   ;ÄÄ¶ FR_stype values ÇÄÄ
   ;
   ; 7 6 5 4 3 2 1 0  - bit no
   ;     | | | | | |
   ;     | | +-+-+-+--- Source type
   ;     | +----------- Fixup to 16:16 alias
   ;     +------------- List of source offsets follow fixup record

   IMAGE_RLC_ST_STYPE   = 0Fh   ;Source type mask
   IMAGE_RLC_ST_SBYTE   = 00h   ;low byte (8-bits)
   IMAGE_RLC_ST_SSEG    = 02h   ;16-bit segment (16-bits)
   IMAGE_RLC_ST_SPTR    = 03h   ;16:16 pointer (32-bits)
   IMAGE_RLC_ST_SOFF    = 05h   ;16-bit offset (16-bits)
   IMAGE_RLC_ST_PTR48   = 06h   ;16:32 pointer (48-bits)
   IMAGE_RLC_ST_OFF32   = 07h   ;32-bit offset (32-bits)
   IMAGE_RLC_ST_SOFF32  = 08h   ;32-bit self-relative offset (32-bits)
   IMAGE_RLC_ST_ALIAS   = 10h   ;Fixup to alias
   IMAGE_RLC_ST_CHAIN   = 20h   ;List of source offsets follow fixup record

   ;ÄÄ¶ FR_flags values ÇÄÄ
   ;
   ; 7 6 5 4 3 2 1 0  - bit no
   ; | | | |   | | |
   ; | | | |   | +-+--- Reference type
   ; | | | |   +------- Additive fixup
   ; | | | +----------- 32-bit Target Offset Flag (1 - 32-bit; 0 - 16-bit)
   ; | | +------------- 32-bit Additive Flag (1 - 32-bit; 0 - 16-bit)
   ; | +--------------- 16-bit Object/Module ordinal (1 - 16-bit; 0 - 8-bit)
   ; +----------------- 8-bit import ordinal (1 - 8-bit;
   ;                                          0 - IMAGE_RLC_32BITOFF toggles
   ;                                              between 16 and 32 bit
   ;                                              ordinal)

   IMAGE_RLC_RTYPE      = 03h   ;Reference type mask
   IMAGE_RLC_RINT       = 00h   ;Internal reference
   IMAGE_RLC_RORD       = 01h   ;Import by ordinal
   IMAGE_RLC_RNAM       = 02h   ;Import by name
   IMAGE_RLC_RENT       = 03h   ;Internal entry table fixup
   IMAGE_RLC_ADD        = 04h   ;Additive fixup
   IMAGE_RLC_32BITOFF   = 10h   ;32-bit Target Offset
   IMAGE_RLC_32BITADD   = 20h   ;32-bit Additive fixup
   IMAGE_RLC_16OBJMOD   = 40h   ;16-bit Object/Module ordinal
   IMAGE_RLC_8BITORD    = 80h   ;8-bit import ordinal

   IMAGE_FIXUP_RECORD  STRUC                 ;Relocation item
     FR_stype          DB ?                  ;Source type
     FR_flags          DB ?                  ;Flag byte
                       UNION                 ;Variable fixup data
     FR_fixup          IMAGE_FIXUP_HEADER <> ;Single fixup
     FR_chain          IMAGE_FIXUP_CHAIN <>  ;Fixup chain
                       ENDS
   IMAGE_FIXUP_RECORD  ENDS

   IMAGE_VAR_NAME  STRUC        ;(Non-)resident name table entry
     VN_len        DB ?         ;Number of bytes in string
     VN_string     DB 1 DUP (?) ;Text of string (variable size)
     VN_ord        DW ?         ;Ordinal number
   IMAGE_VAR_NAME  ENDS

   IMAGE_VXD_HEADER  STRUC         ;Windows VXD header
     LE_magic        DW ?          ;Magic number
     LE_border       DB ?          ;The byte ordering for the VXD
     LE_worder       DB ?          ;The word ordering for the VXD
     LE_level        DD ?          ;The EXE format level for now = 0
     LE_cpu          DW ?          ;The CPU type
     LE_os           DW ?          ;The OS type
     LE_ver          DD ?          ;Module version
     LE_mflags       DD ?          ;Module flags
     LE_mpages       DD ?          ;Module # pages
     LE_startobj     DD ?          ;Object # for instruction pointer
     LE_eip          DD ?          ;Extended instruction pointer
     LE_stackobj     DD ?          ;Object # for stack pointer
     LE_esp          DD ?          ;Extended stack pointer
     LE_pagesize     DD ?          ;VXD page size
     LE_lastpagesize DD ?          ;Last page size in VXD
     LE_fixupsize    DD ?          ;Fixup section size
     LE_fixupsum     DD ?          ;Fixup section checksum
     LE_ldrsize      DD ?          ;Loader section size
     LE_ldrsum       DD ?          ;Loader section checksum
     LE_objtab       DD ?          ;Object table offset
     LE_objcnt       DD ?          ;Number of objects in module
     LE_objmap       DD ?          ;Object page map offset
     LE_itermap      DD ?          ;Object iterated data map offset
     LE_rsrctab      DD ?          ;Offset of Resource Table
     LE_rsrccnt      DD ?          ;Number of resource entries
     LE_restab       DD ?          ;Offset of resident name table
     LE_enttab       DD ?          ;Offset of Entry Table
     LE_dirtab       DD ?          ;Offset of Module Directive Table
     LE_dircnt       DD ?          ;Number of module directives
     LE_fpagetab     DD ?          ;Offset of Fixup Page Table
     LE_frectab      DD ?          ;Offset of Fixup Record Table
     LE_impmod       DD ?          ;Offset of Import Module Name Table
     LE_impmodcnt    DD ?          ;Number of entries in Import Module Name
                                   ;Table
     LE_impproc      DD ?          ;Offset of Import Procedure Name Table
     LE_pagesum      DD ?          ;Offset of Per-Page Checksum Table
     LE_datapage     DD ?          ;Offset of Enumerated Data Pages
     LE_preload      DD ?          ;Number of preload pages
     LE_nrestab      DD ?          ;Offset of Non-resident Names Table
     LE_cbnrestab    DD ?          ;Size of Non-resident Name Table
     LE_nressum      DD ?          ;Non-resident Name Table Checksum
     LE_autodata     DD ?          ;Object # for automatic data object
     LE_debuginfo    DD ?          ;Offset of the debugging information
     LE_debuglen     DD ?          ;The length of the debugging info. in bytes
     LE_instpreload  DD ?          ;Number of instance pages in preload section
                                   ;of VXD file
     LE_instdemand   DD ?          ;Number of instance pages in demand load
                                   ;section of VXD file
     LE_heapsize     DD ?          ;Size of heap - for 16-bit apps
     LE_res3         DB 12 DUP (?) ;Reserved words
     LE_winresoff    DD ?          ;Offset of Windows Resources
     LE_winreslen    DD ?          ;Size of Windows Resources
     LE_devid        DW ?          ;Device ID for VxD
     LE_ddkver       DW ?          ;DDK version for VxD
   IMAGE_VXD_HEADER  ENDS

   ;ÄÄ¶ Constant structure sizes ÇÄÄ
   IMAGE_SIZEOF_OBJECT_HEADER       = SIZE IMAGE_OBJECT_HEADER
   IMAGE_SIZEOF_OBJECT_PAGE_HEADER  = SIZE IMAGE_OBJECT_PAGE_HEADER
   IMAGE_SIZEOF_RESOURCE_HEADER     = SIZE IMAGE_RESOURCE_HEADER
   IMAGE_SIZEOF_ENTRY_BUNDLE        = SIZE IMAGE_ENTRY_BUNDLE
   IMAGE_SIZEOF_CALLGATE            = SIZE IMAGE_CALLGATE
   IMAGE_SIZEOF_FORWARDER           = SIZE IMAGE_FORWARDER
   IMAGE_SIZEOF_FIXUP_PAGE_HEADER   = SIZE IMAGE_FIXUP_PAGE_HEADER
   IMAGE_SIZEOF_VXD_HEADER          = SIZE IMAGE_VXD_HEADER
