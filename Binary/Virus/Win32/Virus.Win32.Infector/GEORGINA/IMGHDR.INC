; Made from winnt.h

;**************************************************************
;****                       SIGNATURES                     ****
;**************************************************************

IMAGE_DOS_SIGNATURE                     EQU     05A4Dh      ;  MZ
IMAGE_OS2_SIGNATURE                     EQU     0454Eh      ;  NE
IMAGE_OS2_SIGNATURE_LE                  EQU     0454Ch      ;  LE
IMAGE_VXD_SIGNATURE                     EQU     0454Ch      ;  LE
IMAGE_LX_SIGNATURE                      EQU     0584Ch      ;  LX
IMAGE_NT_SIGNATURE                      EQU     000004550h  ;  PE00

;**************************************************************
;****                   IMAGE FILE FLAGS                   ****
;**************************************************************

IMAGE_FILE_RELOCS_STRIPPED              EQU     00001h	;  relocation stripped 
IMAGE_FILE_EXECUTABLE_IMAGE             EQU     00002h	;  file is executable
IMAGE_FILE_LINE_NUMS_STRIPPED           EQU     00004h	;  line nunbers stripped
IMAGE_FILE_LOCAL_SYMS_STRIPPED          EQU     00008h	;  local symbols stripped
IMAGE_FILE_AGGRESIVE_WS_TRIM            EQU     00010h	;  agressively trim working set
IMAGE_FILE_BYTES_REVERSED_LO            EQU     00080h	;  bytes of machine word are reversed
IMAGE_FILE_32BIT_MACHINE                EQU     00100h	;  32 bit word machine.
IMAGE_FILE_DEBUG_STRIPPED               EQU     00200h	;  bebugging info stripped
IMAGE_FILE_REMOVABLE_RUN_FROM_SW        EQU     00400h	;  
IMAGE_FILE_NET_RUN_FROM_SWAP            EQU     00800h	;  
IMAGE_FILE_SYSTEM                       EQU     01000h  ;  system file.
IMAGE_FILE_DLL                          EQU     02000h  ;  file is a DLL.
IMAGE_FILE_BYTES_REVERSED_HI            EQU     08000h	;  bytes of machine word are reversed

;**************************************************************
;****                    MACHINE CONSTS                    ****
;**************************************************************

IMAGE_FILE_MACHINE_UNKNOWN              EQU     0
IMAGE_FILE_MACHINE_I386                 EQU     014ch   ;  Intel 386.
IMAGE_FILE_MACHINE_R3000                EQU     0162h   ;  MIPS little-endian, 0x160 big-endian
IMAGE_FILE_MACHINE_R4000                EQU     0166h   ;  MIPS little-endian
IMAGE_FILE_MACHINE_R10000               EQU     0168h   ;  MIPS little-endian
IMAGE_FILE_MACHINE_ALPHA                EQU     0184h   ;  Alpha_AXP
IMAGE_FILE_MACHINE_POWERPC              EQU     01F0h   ;  IBM PowerPC Little-Endian

;**************************************************************
;****                   SUBSYSTEM CONSTS                   ****
;**************************************************************

IMAGE_SUBSYSTEM_UNKNOWN                 EQU     0	;  unknown 
IMAGE_SUBSYSTEM_NATIVE                  EQU     1	;  native
IMAGE_SUBSYSTEM_WINDOWS_GUI             EQU     2	;  windows GUI
IMAGE_SUBSYSTEM_WINDOWS_CUI             EQU     3	;  windows CUI
IMAGE_SUBSYSTEM_OS2_CUI                 EQU     5	;  OS/2 CUI
IMAGE_SUBSYSTEM_POSIX_CUI               EQU     7	;  Posix CUI

;**************************************************************
;****                     MISC EQUATES                     ****
;**************************************************************

IMAGE_SIZEOF_SHORT_NAME                 EQU      8;
IMAGE_NUMBEROF_DIRECTORY_ENTRIES        EQU      16;
IMAGE_RESOURCE_NAME_IS_STRING           EQU      080000000h;
IMAGE_RESOURCE_DATA_IS_DIRECTORY        EQU      080000000h;
IMAGE_IMPORT_BY_ORDINAL                 EQU      080000000h;
IMAGE_EXPORT_BY_ORDINAL                 EQU      0FFFF0000h;
IMAGE_OFFSET_STRIP_HIGH                 EQU      07FFFFFFFh;
IMAGE_SIZEOF_STD_OPTIONAL_HEADER        EQU      01Ch
IMAGE_SIZEOF_NT_OPTIONAL32_HEADER       EQU      0E0h
IMAGE_NT_OPTIONAL_HDR32_MAGIC           EQU      01010b
IMAGE_NT_OPTIONAL_HDR64_MAGIC           EQU      10100b



;**************************************************************
;****                   IMAGE_DOS_HEADER                   ****
;**************************************************************

IMAGE_DOS_HEADER STRUC
    e_magic                   DW      ?        ; Magic number
    e_cblp                    DW      ?        ; Bytes on last page of file
    e_cp                      DW      ?        ; Pages in file
    e_crlc                    DW      ?        ; Relocations
    e_cparhdr                 DW      ?        ; Size of header in paragraphs
    e_minalloc                DW      ?        ; Minimum extra paragraphs needed
    e_maxalloc                DW      ?        ; Maximum extra paragraphs needed
    e_ss                      DW      ?        ; Initial (relative) SS value
    e_sp                      DW      ?        ; Initial SP value
    e_csum                    DW      ?        ; Checksum
    e_ip                      DW      ?        ; Initial IP value
    e_cs                      DW      ?        ; Initial (relative) CS value
    e_lfarlc                  DW      ?        ; File address of relocation table
    e_ovno                    DW      ?        ; Overlay number
    e_res                     DW 4  DUP( ? )    ; Reserved words
    e_oemid                   DW      ?        ; OEM identifier
    e_oeminfo                 DW      ?        ; OEM information
    e_res2                    DW 10 DUP( ? )    ; Reserved words
    e_lfanew                  DD      ?        ; Address of PE header
IMAGE_DOS_HEADER  ENDS

;**************************************************************
;****                  IMAGE_FILE_HEADER                   ****
;**************************************************************

IMAGE_FILE_HEADER  STRUC
Machine                       DW      ? ; 6
NumberOfSections              DW      ? ; 8
TimeDateStamp                 DD      ? ; 12
PointerToSymbolTable          DD      ? ; 16
NumberOfSymbols               DD      ? ; 20
SizeOfOptionalHeader          DW      ? ; 22
ImgFlags                      DW      ? ; 24
IMAGE_FILE_HEADER ENDS
IMAGE_FILE_HEADER_            EQU     2+2+4+4+4+2+2

;**************************************************************
;****                  IMAGE_DATA_DIRECTORY                ****
;**************************************************************

IMAGE_DATA_DIRECTORY                   STRUC
VirtualAddress      DD      ?
Size                DD      ?
IMAGE_DATA_DIRECTORY                   ENDS
IMAGE_DATA_DIRECTORY_         EQU     4+4

;**************************************************************
;****                IMAGE_OPTIONAL_HEADER                 ****
;**************************************************************

IMAGE_OPTIONAL_HEADER STRUC
;-----------------Optional header -  Standard fields.
Magic                         DW      ?
MajorLinkerVersion            DB      ?
MinorLinkerVersion            DB      ?
SizeOfCode                    DD      ?
SizeOfInitializedData         DD      ?
SizeOfUninitializedData       DD      ?
AddressOfEntryPoint           DD      ?
BaseOfCode                    DD      ?
BaseOfData                    DD      ?
;-----------------Optional header -  NT additional fields.
ImageBase                     DD      ?
SectionAlignment              DD      ?
FileAlignment                 DD      ?
MajorOperatingSystemVersion   DW      ?
MinorOperatingSystemVersion   DW      ?
MajorImageVersion             DW      ?
MinorImageVersion             DW      ?
MajorSubsystemVersion         DW      ?
MinorSubsystemVersion         DW      ?
Win32VersionValue             DD      ?
SizeOfImage                   DD      ?
SizeOfHeaders                 DD      ?
CheckSum                      DD      ?
Subsystem                     DW      ?
DllCharacteristics            DW      ?
SizeOfStackReserve            DD      ?
SizeOfStackCommit             DD      ?
SizeOfHeapReserve             DD      ?
SizeOfHeapCommit              DD      ?
LoaderFlags                   DD      ?
NumberOfRvaAndSizes           DD      ?
DataDirectory       IMAGE_DATA_DIRECTORY  IMAGE_NUMBEROF_DIRECTORY_ENTRIES DUP ( <> )
IMAGE_OPTIONAL_HEADER   ENDS

;**************************************************************
;****                    IMAGE_NT_HEADERS                  ****
;**************************************************************

IMAGE_NT_HEADERS  STRUC
Signature                     DD      ? ; 4
FileHeader         IMAGE_FILE_HEADER <?>
OptionalHeader     IMAGE_OPTIONAL_HEADER <?>
IMAGE_NT_HEADERS ENDS

;**************************************************************
;****                    DIRECTORY ENTRIES                 ****
;**************************************************************

IMAGE_DIRECTORY_ENTRY_EXPORT            EQU     0       ;  Export Directory
IMAGE_DIR_EXPORT            EQU   IMAGE_DIRECTORY_ENTRY_EXPORT*IMAGE_DATA_DIRECTORY_
IMAGE_DIRECTORY_ENTRY_IMPORT            EQU     1       ;  Import Directory
IMAGE_DIR_IMPORT            EQU   IMAGE_DIRECTORY_ENTRY_IMPORT*IMAGE_DATA_DIRECTORY_
IMAGE_DIRECTORY_ENTRY_RESOURCE          EQU     2       ;  Resource Directory
IMAGE_DIR_RESOURCE          EQU   IMAGE_DIRECTORY_ENTRY_RESOURCE*IMAGE_DATA_DIRECTORY_
IMAGE_DIRECTORY_ENTRY_EXCEPTION         EQU     3       ;  Exception Directory
IMAGE_DIR_EXCEPTION         EQU   IMAGE_DIRECTORY_ENTRY_EXCEPTION*IMAGE_DATA_DIRECTORY_
IMAGE_DIRECTORY_ENTRY_SECURITY          EQU     4       ;  Security Directory
IMAGE_DIR_SECURITY          EQU   IMAGE_DIRECTORY_ENTRY_SECURITY*IMAGE_DATA_DIRECTORY_
IMAGE_DIRECTORY_ENTRY_BASERELOC         EQU     5       ;  Base Relocation Table
IMAGE_DIR_RELOC             EQU   IMAGE_DIRECTORY_ENTRY_BASERELOC*IMAGE_DATA_DIRECTORY_
IMAGE_DIRECTORY_ENTRY_DEBUG             EQU     6       ;  Debug Directory
IMAGE_DIR_DEBUG             EQU   IMAGE_DIRECTORY_ENTRY_DEBUG*IMAGE_DATA_DIRECTORY_
IMAGE_DIRECTORY_ENTRY_COPYRIGHT         EQU     7       ;  Description String
IMAGE_DIR_COPYRIGHT         EQU   IMAGE_DIRECTORY_ENTRY_COPYRIGHT*IMAGE_DATA_DIRECTORY_
IMAGE_DIRECTORY_ENTRY_GLOBALPTR         EQU     8       ;  Machine Value (MIPS GP)
IMAGE_DIR_GLOBALPTR         EQU   IMAGE_DIRECTORY_ENTRY_GLOBALPTR*IMAGE_DATA_DIRECTORY_
IMAGE_DIRECTORY_ENTRY_TLS               EQU     9       ;  TLS Directory
IMAGE_DIR_TLS               EQU   IMAGE_DIRECTORY_ENTRY_TLS*IMAGE_DATA_DIRECTORY_
IMAGE_DIRECTORY_ENTRY_LOAD_CONFI        EQU     10	;  Load Configuration Directory
IMAGE_DIR_LOAD_CONFI        EQU   IMAGE_DIRECTORY_ENTRY_LOAD_CONFI*IMAGE_DATA_DIRECTORY_
IMAGE_DIRECTORY_ENTRY_BOUND_IMPO        EQU     11	;  Bound Import Directory in headers
IMAGE_DIRY_BOUND_IMPO       EQU   IMAGE_DIRECTORY_ENTRY_BOUND_IMPO*IMAGE_DATA_DIRECTORY_
IMAGE_DIRECTORY_ENTRY_IAT               EQU     12	;  Import Address Table
IMAGE_DIR_IAT               EQU   IMAGE_DIRECTORY_ENTRY_IAT*IMAGE_DATA_DIRECTORY_
IMAGE_DIRECTORY_ENTRY_DELAY_IMPORT      EQU     13	;  Delay Load Import Descriptors
IMAGE_DIRECTORY_DELAY       EQU   IMAGE_DIRECTORY_ENTRY_DELAY_IMPORT*IMAGE_DATA_DIRECTORY_
IMAGE_DIRECTORY_ENTRY_COM_DESCRIPTOR    EQU     14      ;  COM Runtime descriptor
IMAGE_DIRECTORY_COM         EQU   IMAGE_DIRECTORY_ENTRY_COM_DESCRIPTOR*IMAGE_DATA_DIRECTORY_


;**************************************************************
;****                  IMAGE_SECTION_HEADER                ****
;**************************************************************

IMAGE_SECTION_HEADER                   STRUC   
SName                	DB      8 DUP ( ? )
SVirtualSize            DD	?
SVirtualAddress      	DD      ?
SizeOfRawData       	DD      ?
PointerToRawData    	DD      ?
PointerToRelocations    DD      ?
PointerToLinenumbers    DD      ?
NumberOfRelocations 	DW      ?
NumberOfLinenumbers 	DW      ?
SFlags		     	DD      ?
IMAGE_SECTION_HEADER                   ENDS
IMAGE_SECTION_HEADER_      EQU 28h

;**************************************************************
;****                IMAGE_IMPORT_DESCRIPTOR               ****
;**************************************************************

IMAGE_IMPORT_DESCRIPTOR            STRUC
 OrigFirstThunk               DD    ?
 TimeDateStamp                DD    ?
 ForwarderChain               DD    ?
 NameRVA                      DD    ?
 FirstThunk                   DD    ?
IMAGE_IMPORT_DESCRIPTOR            ENDS
IMAGE_IMPORT_DESCRIPTOR_      EQU 5*4           

;**************************************************************
;****                IMAGE_EXPORT_DIRECTORY                ****
;**************************************************************

IMAGE_EXPORT_DIRECTORY STRUCT 
  eFlags                    DD      ?
  eTimeDateStamp            DD      ?
  MajorVersion              DW      ?
  MinorVersion              DW      ?
  eNameRVA                  DD      ?
  BaseOrdinal               DD      ?
  NumberOfFunctions         DD      ?
  NumberOfNames             DD      ?
  AddressOfFunctions        DD      ?
  AddressOfNames            DD      ?
  AddressOfNameOrdinals     DD      ?
IMAGE_EXPORT_DIRECTORY ENDS

;**************************************************************
;****                SECTION CHARACTERISTICS               ****
;**************************************************************

IMAGE_SCN_TYPE_REG                      EQU  0000000000  
IMAGE_SCN_TYPE_DSECT                    EQU  0000000001  
IMAGE_SCN_TYPE_NOLOAD                   EQU  0000000002  
IMAGE_SCN_TYPE_GROUP                    EQU  0000000004  
IMAGE_SCN_TYPE_NO_PAD                   EQU  000000008h  
IMAGE_SCN_TYPE_COPY                     EQU  0000000010  
IMAGE_SCN_CNT_CODE                      EQU  000000020h  ; code
IMAGE_SCN_CNT_INITIALIZED_DATA          EQU  000000040h  ; initialized data
IMAGE_SCN_CNT_UNINITIALIZED_DATA        EQU  000000080h  ; uninitialized data
IMAGE_SCN_LNK_OTHER                     EQU  000000100h   
IMAGE_SCN_LNK_INFO                      EQU  000000200h  ; other type of information.
IMAGE_SCN_TYPE_OVER                     EQU  0000000400   
IMAGE_SCN_LNK_REMOVE                    EQU  000000800h  ; not part of image
IMAGE_SCN_LNK_COMDAT                    EQU  000001000h  ; comdat
IMAGE_SCN_MEM_PROTECTED                 EQU  0000004000  
IMAGE_SCN_MEM_FARDATA                   EQU  000008000h
IMAGE_SCN_MEM_SYSHEAP                   EQU  0000010000  
IMAGE_SCN_MEM_PURGEABLE                 EQU  000020000h
IMAGE_SCN_MEM_16BIT                     EQU  000020000h
IMAGE_SCN_MEM_LOCKED                    EQU  000040000h
IMAGE_SCN_MEM_PRELOAD                   EQU  000080000h
IMAGE_SCN_ALIGN_1BYTES                  EQU  000100000h
IMAGE_SCN_ALIGN_2BYTES                  EQU  000200000h
IMAGE_SCN_ALIGN_4BYTES                  EQU  000300000h
IMAGE_SCN_ALIGN_8BYTES                  EQU  000400000h
IMAGE_SCN_ALIGN_16BYTES                 EQU  000500000h  ; default alignment 
IMAGE_SCN_ALIGN_32BYTES                 EQU  000600000h
IMAGE_SCN_ALIGN_64BYTES                 EQU  000700000h
IMAGE_SCN_LNK_NRELOC_OVFL               EQU  001000000h  ; extended relocations.
IMAGE_SCN_MEM_DISCARDABLE               EQU  002000000h  ; discardeable.
IMAGE_SCN_MEM_NOT_CACHED                EQU  004000000h  ; not cachable.
IMAGE_SCN_MEM_NOT_PAGED                 EQU  008000000h  ; not pageable.
IMAGE_SCN_MEM_SHARED                    EQU  010000000h  ; shareable.
IMAGE_SCN_MEM_EXECUTE                   EQU  020000000h  ; executable.
IMAGE_SCN_MEM_READ                      EQU  040000000h  ; readable.
IMAGE_SCN_MEM_WRITE                     EQU  080000000h  ; writeable.
IMAGE_SCN_MEM_NOT_DISCARDABLE           EQU  0FDFFFFFFh

;**************************************************************
;****                 IMAGE_BASE_RELOCATION                ****
;**************************************************************

IMAGE_BASE_RELOCATION              STRUC
  RVirtualAddress         DD      0
  SizeOfBlock             DD      8
  TypeOffset              DW      ?
IMAGE_BASE_RELOCATION              ENDS   
IMAGE_BASE_RELOCATION_                  EQU  8

;**************************************************************
;****              IMAGE BASE RELOCATION TYPES             ****
;**************************************************************

IMAGE_REL_BASED_ABSOLUTE                EQU  0
IMAGE_REL_BASED_HIGH                    EQU  1
IMAGE_REL_BASED_LOW                     EQU  2
IMAGE_REL_BASED_HIGHLOW                 EQU  3
IMAGE_REL_BASED_HIGHADJ                 EQU  4


;**************************************************************
;****               IMAGE_RESOURCE_DIRECTORY               ****
;**************************************************************

IMAGE_RESOURCE_DIRECTORY            STRUC
  Flags                        DD   ?
  TimeDateStamp                DD   ?
  MajorVersion                 DW   ?
  MinorVersion                 DW   ?
  NumberOfNamedEntries         DW   ?
  NumberOfIdEntries            DW   ?
IMAGE_RESOURCE_DIRECTORY            ENDS
IMAGE_RESOURCE_DIRECTORY_               EQU 4+4+2+2+2+2


;**************************************************************
;****           IMAGE_RESOURCE_DIRECTORY_ENTRY             ****
;**************************************************************

IMAGE_RESOURCE_DIRECTORY_ENTRY      STRUCT 
  NameID                       DD   ?
  OffsetToData                 DD   ?
IMAGE_RESOURCE_DIRECTORY_ENTRY      ENDS
IMAGE_RESOURCE_DIRECTORY_ENTRY_         EQU 4+4

;**************************************************************
;****            IMAGE_RESOURCE_DIR_STRING_U               ****
;**************************************************************

IMAGE_RESOURCE_DIR_STRING_U         STRUC
 wLength                      DW   0
 NameString                   DW   ?
IMAGE_RESOURCE_DIR_STRING_U         ENDS

;**************************************************************
;****             IMAGE_RESOURCE_DATA_ENTRY                ****
;**************************************************************

IMAGE_RESOURCE_DATA_ENTRY           STRUC 
 rdOffsetToData                DD   ? 
 rdSize                        DD   ? 
 rdCodePage                    DD   ? 
 rdReserved                    DD   ? 
IMAGE_RESOURCE_DATA_ENTRY           ENDS

;**************************************************************
;****                  RESOURCE TYPES                      ****
;**************************************************************

RT_NEWRESOURCE                       EQU 00002000h
RT_ERROR                             EQU 00007fffh
RT_CURSOR                            EQU 000000001
RT_BITMAP                            EQU 000000002
RT_ICON                              EQU 000000003
RT_MENU                              EQU 000000004
RT_DIALOG                            EQU 000000005
RT_STRING                            EQU 000000006
RT_FONTDIR                           EQU 000000007
RT_FONT                              EQU 000000008
RT_ACCELERATORS                      EQU 000000009
RT_RCDATA                            EQU 0000000010
RT_MESSAGETABLE                      EQU 0000000011
RT_GROUP_CURSOR                      EQU 0000000012
RT_GROUP_ICON                        EQU 0000000014
RT_VERSION                           EQU 0000000016
RT_NEWBITMAP                         EQU (RT_BITMAP | RT_NEWRESOURCE)
RT_NEWMENU                           EQU (RT_MENU   | RT_NEWRESOURCE)
RT_NEWDIALOG                         EQU (RT_DIALOG | RT_NEWRESOURCE)



