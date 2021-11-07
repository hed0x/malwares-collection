   IMAGE_DOS_SIGNATURE     equ     5A4Dh           ; MZ
   IMAGE_OS2_SIGNATURE     equ     454Eh           ; NE
   IMAGE_OS2_SIGNATURE_LE  equ     454Ch           ; LE
   IMAGE_VXD_SIGNATURE     equ     454Ch           ; LE
   IMAGE_NT_SIGNATURE      equ     00004550h       ; PE00


   ; dos exe header
   exe_header      struc
   eh_sign         dw      ?       ;   0
   eh_sect_mod     dw      ?       ;   2
   eh_sects        dw      ?       ;   4
   eh_rels         dw      ?       ;   6
   eh_header_para  dw      ?       ;   8
   eh_min_mem_para dw      ?       ;   A
   eh_max_mem_para dw      ?       ;   C
   eh_ss           dw      ?       ;   E
   eh_sp           dw      ?       ;  10
   eh_checksum     dw      ?       ;  12
   eh_ip           dw      ?       ;  14
   eh_cs           dw      ?       ;  16
   eh_1st_rel      dw      ?       ;  18
   eh_ovl_num      dw      ?       ;  1A
   eh_reserved     dw      4 dup(?) ; 1C
   eh_oemid        dw      ?       ;  24
   eh_oeminfo      dw      ?       ;  26
   eh_reserved2    dw      10 dup(?) ;28
   eh_neh_ofs      dd      ?       ;  3C
   exe_header      ends


   ; Win16 new exe header
   new_exe_header  struc
   neh_sign        dw      ?
   neh_linker_ver  dw      ?
   neh_entry_tb_ofs dw     ?
   neh_entry_tb_size dw    ?
   neh_crc         dd      ?
   neh_prog_flags  db      ?
   neh_app_flags   db      ?
   neh_auto_data_seg_index dw ?
   neh_init_loc_heap_size dw ?
   neh_init_stack_size dw  ?
   neh_ip          dw      ?
   neh_cs          dw      ?
   neh_sp          dw      ?
   neh_ss          dw      ?
   neh_seg_count   dw      ?
   neh_mod_ref_count dw    ?
   neh_nresid_name_size dw ?
   neh_seg_tb_ofs  dw      ?
   neh_resrc_tb_ofs dw     ?
   neh_resid_name_tb_ofs dw ?
   neh_mod_ref_ofs dw      ?
   neh_import_name_tb_ofs dw ?
   neh_nresid_name_tb_ofs dd ?
   neh_movable_entry_count dw ?
   neh_align_shift dw      ?
   neh_resrc_tb_entry_count dw ?
   neh_opert_system db     ?
   neg_exe_flags   db      ?
   neg_ret_thunk_ofs dw    ?
   neh_seg_ref_thunk_ofs dw ?
   neh_mini_code_swap_size dw ?
   neh_expect_win_ver dw   ?
   new_exe_header  ends


   ; dos device driver header
   sys_header      struc
   sh_next_ptr     dd      ?
   sh_attr         dw      ?
   sh_strat        dw      ?
   sh_int          dw      ?
   sh_name         db      8 dup(?)
   sys_header      ends


   IMAGE_FILE_HEADER struc
     Machine               dw      ?
     NumberOfSections      dw      ?
     TimeDateStamp         dd      ?
     PointerToSymbloTable  dd      ?
     NumberOfSymbols       dd      ?
     SizeOfOptionalHeader  dw      ?
     Characteristics       dw      ?
   IMAGE_FILE_HEADER ends

   IMAGE_SIZEOF_FILE_HEADER        equ     20

   IMAGE_FILE_RELOCS_STRIPPED      equ     0001h   ; Relocation info stripped from file.
   IMAGE_FILE_EXECUTABLE_IMAGE     equ     0002h   ; File is executable  (i.e. no unresolved externel references).
   IMAGE_FILE_LINE_NUMS_STRIPPED   equ     0004h   ; Line nunbers stripped from file.
   IMAGE_FILE_LOCAL_SYMS_STRIPPED  equ     0008h   ; Local symbols stripped from file.
   IMAGE_FILE_AGGRESIVE_WS_TRIM    equ     0010h   ; Agressively trim working set
   IMAGE_FILE_BYTES_REVERSED_LO    equ     0080h   ; Bytes of machine word are reversed.
   IMAGE_FILE_32BIT_MACHINE        equ     0100h   ; 32 bit word machine.
   IMAGE_FILE_DEBUG_STRIPPED       equ     0200h   ; Debugging info stripped from file in .DBG file
   IMAGE_FILE_REMOVABLE_RUN_FROM_SWAP equ  0400h   ; If Image is on removable media, copy and run from the swap file.
   IMAGE_FILE_NET_RUN_FROM_SWAP    equ     0800h   ; If Image is on Net, copy and run from the swap file.
   IMAGE_FILE_SYSTEM               equ     1000h   ; System File.
   IMAGE_FILE_DLL                  equ     2000h   ; File is a DLL.
   IMAGE_FILE_UP_SYSTEM_ONLY       equ     4000h   ; File should only be run on a UP machine
   IMAGE_FILE_BYTES_REVERSED_HI    equ     8000h   ; Bytes of machine word are reversed.

   IMAGE_FILE_MACHINE_UNKNOWN equ  0
   IMAGE_FILE_MACHINE_I386    equ  14Ch    ; Intel 386.
   IMAGE_FILE_MACHINE_R3000   equ  162h    ; MIPS little-endian, 0x160 big-endian
   IMAGE_FILE_MACHINE_R4000   equ  166h    ; MIPS little-endian
   IMAGE_FILE_MACHINE_R10000  equ  168h    ; MIPS little-endian
   IMAGE_FILE_MACHINE_ALPHA   equ  184h    ; Alpha_AXP
   IMAGE_FILE_MACHINE_POWERPC equ  1F0h    ; IBM PowerPC Little-Endian


   IMAGE_DATA_DIRECTORY struc
     iddVirtualAddress     dd      ?
     iddSize               dd      ?
   IMAGE_DATA_DIRECTORY ends

   IMAGE_NUMBEROF_DIRECTORY_ENTRIES equ    16

   IMAGE_OPTIONAL_HEADER struc
     Magic                         dw      ?
     MajorLinkerVersion            db      ?
     MinorLinkerVersion            db      ?
     SizeOfCode                    dd      ?
     SizeOfInitializedData         dd      ?
     SizeOfUninitializedData       dd      ?
     AddressOfEntryPoint           dd      ?
     BaseOfCode                    dd      ?
     BaseOfData                    dd      ?
     ImageBase                     dd      ?
     SectionAlignment              dd      ?
     FileAlignment                 dd      ?
     MajorOperatingSystemVersion   dw      ?
     MinorOperatingSystemVersion   dw      ?
     MajorImageVersion             dw      ?
     MinorImageVersion             dw      ?
     MajorSubsystemVersion         dw      ?
     MinorSubsystemVersion         dw      ?
     Win32VersionValue             dd      ?
     SizeOfImage                   dd      ?
     SizeOfHeaders                 dd      ?
     CheckSum                      dd      ?
     Subsystem                     dw      ?
     DllCharacteristics            dw      ?
     SizeOfStackReserve            dd      ?
     SizeOfStackCommit             dd      ?
     SizeOfHeapReserve             dd      ?
     SizeOfHeapCommit              dd      ?
     LoaderFlags                   dd      ?
     NumberOfRvaAndSizes           dd      ?
     DataDirectory                 IMAGE_DATA_DIRECTORY \
                                     IMAGE_NUMBEROF_DIRECTORY_ENTRIES dup(?)
   IMAGE_OPTIONAL_HEADER ends

   IMAGE_NT_OPTIONAL_HDR_MAGIC     equ     10bh
   IMAGE_ROM_OPTIONAL_HDR_MAGIC    equ     107h

   ; Subsystem Values
   IMAGE_SUBSYSTEM_UNKNOWN     equ 0       ; Unknown subsystem.
   IMAGE_SUBSYSTEM_NATIVE      equ 1       ; Image doesn't require a subsystem.
   IMAGE_SUBSYSTEM_WINDOWS_GUI equ 2       ; Image runs in the Windows GUI subsystem.
   IMAGE_SUBSYSTEM_WINDOWS_CUI equ 3       ; Image runs in the Windows character subsystem.
   IMAGE_SUBSYSTEM_OS2_CUI     equ 5       ; image runs in the OS/2 character subsystem.
   IMAGE_SUBSYSTEM_POSIX_CUI   equ 7       ; image run  in the Posix character subsystem.
   IMAGE_SUBSYSTEM_RESERVED8   equ 8       ; image run  in the 8 subsystem.

   ; Directory Entries
   IMAGE_DIRECTORY_ENTRY_EXPORT       equ  0   ; Export Directory
   IMAGE_DIRECTORY_ENTRY_IMPORT       equ  1   ; Import Directory
   IMAGE_DIRECTORY_ENTRY_RESOURCE     equ  2   ; Resource Directory
   IMAGE_DIRECTORY_ENTRY_EXCEPTION    equ  3   ; Exception Directory
   IMAGE_DIRECTORY_ENTRY_SECURITY     equ  4   ; Security Directory
   IMAGE_DIRECTORY_ENTRY_BASERELOC    equ  5   ; Base Relocation Table
   IMAGE_DIRECTORY_ENTRY_DEBUG        equ  6   ; Debug Directory
   IMAGE_DIRECTORY_ENTRY_COPYRIGHT    equ  7   ; Description String
   IMAGE_DIRECTORY_ENTRY_GLOBALPTR    equ  8   ; Machine Value (MIPS GP)
   IMAGE_DIRECTORY_ENTRY_TLS          equ  9   ; TLS Directory
   IMAGE_DIRECTORY_ENTRY_LOAD_CONFIG  equ 10   ; Load Configuration Directory
   IMAGE_DIRECTORY_ENTRY_BOUND_IMPORT equ 11   ; Bound Import Directory in headers
   IMAGE_DIRECTORY_ENTRY_IAT          equ 12   ; Import Address Table

   IMAGE_NT_HEADERS struc
     Signature     dd      ?
     FileHeader    IMAGE_FILE_HEADER ?
    OptionalHeader IMAGE_OPTIONAL_HEADER ?
   IMAGE_NT_HEADERS ends


   ; Section header format.
   IMAGE_SIZEOF_SHORT_NAME equ     8

   misc union
     PhysicalAddress       dd      ?
     VirtualSize           dd      ?
   misc ends

   IMAGE_SECTION_HEADER struc
     Name                  db      IMAGE_SIZEOF_SHORT_NAME dup(?)
     Misc                  misc    ?
     VirtualAddress        dd      ?
     SizeOfRawData         dd      ?
     PointerToRawData      dd      ?
     PointerToRelocations  dd      ?
     PointerToLinenumbers  dd      ?
     NumberOfRelocations   dw      ?
     NumberOfLinenumbers   dw      ?
     SectionCharacteristics dd     ?
   IMAGE_SECTION_HEADER ends

   IMAGE_SIZEOF_SECTION_HEADER     equ     40

   ; Section characteristics.
   IMAGE_SCN_TYPE_NO_PAD           equ     00000008h  ; Reserved.

   IMAGE_SCN_CNT_CODE              equ     00000020h  ; Section contains code.
   IMAGE_SCN_CNT_INITIALIZED_DATA  equ     00000040h  ; Section contains initialized data.
   IMAGE_SCN_CNT_UNINITIALIZED_DATA equ    00000080h  ; Section contains uninitialized data.

   IMAGE_SCN_LNK_OTHER             equ     00000100h  ; Reserved.
   IMAGE_SCN_LNK_INFO              equ     00000200h  ; Section contains comments or some other type of information.
   IMAGE_SCN_LNK_REMOVE            equ     00000800h  ; Section contents will not become part of image.
   IMAGE_SCN_LNK_COMDAT            equ     00001000h  ; Section contents comdat.

   IMAGE_SCN_MEM_FARDATA           equ     00008000h
   IMAGE_SCN_MEM_PURGEABLE         equ     00020000h
   IMAGE_SCN_MEM_16BIT             equ     00020000h
   IMAGE_SCN_MEM_LOCKED            equ     00040000h
   IMAGE_SCN_MEM_PRELOAD           equ     00080000h

   IMAGE_SCN_ALIGN_1BYTES          equ     00100000h  ;
   IMAGE_SCN_ALIGN_2BYTES          equ     00200000h  ;
   IMAGE_SCN_ALIGN_4BYTES          equ     00300000h  ;
   IMAGE_SCN_ALIGN_8BYTES          equ     00400000h  ;
   IMAGE_SCN_ALIGN_16BYTES         equ     00500000h  ; Default alignment if no others are specified.
   IMAGE_SCN_ALIGN_32BYTES         equ     00600000h  ;
   IMAGE_SCN_ALIGN_64BYTES         equ     00700000h  ;

   IMAGE_SCN_LNK_NRELOC_OVFL       equ     01000000h  ; Section contains extended relocations.
   IMAGE_SCN_MEM_DISCARDABLE       equ     02000000h  ; Section can be discarded.
   IMAGE_SCN_MEM_NOT_CACHED        equ     04000000h  ; Section is not cachable.
   IMAGE_SCN_MEM_NOT_PAGED         equ     08000000h  ; Section is not pageable.
   IMAGE_SCN_MEM_SHARED            equ     10000000h  ; Section is shareable.
   IMAGE_SCN_MEM_EXECUTE           equ     20000000h  ; Section is executable.
   IMAGE_SCN_MEM_READ              equ     40000000h  ; Section is readable.
   IMAGE_SCN_MEM_WRITE             equ     80000000h  ; Section is writeable.


   ; Export Format
   IMAGE_EXPORT_DIRECTORY struc
     ExportCharacteristics dd      ?
     TimeDateStamp         dd      ?
     MajorVersion          dw      ?
     MinorVersion          dw      ?
     ExportName            dd      ?
     Base                  dd      ?
     NumberOfFunctions     dd      ?
     NumberOfNames         dd      ?
     AddressOfFunctions    dd      ?
     AddressOfNames        dd      ?
     AddressOfNameOrdinals dd      ?
   IMAGE_EXPORT_DIRECTORY ends


   ; Import Format
   IMAGE_IMPORT_BY_NAME struc
     Hint          dw      ?
     ImportFuncName db     ?
   IMAGE_IMPORT_BY_NAME ends

   IMAGE_THUNK_DATA union
     ForwarderString       dd      ?
     Function              dd      ?
     Ordinal               dd      ?
     AddressOfData         dd      ?
   IMAGE_THUNK_DATA ends

   IMAGE_ORDINAL_FLAG      equ     0x80000000

   IMAGE_IMPORT_DESCRIPTOR struc
     OriginalFirstThunk IMAGE_THUNK_DATA ? ; RVA to original unbound IAT
     TimeDateStamp      dd ?               ; 0 if not bound,
                                           ; -1 if bound, and real date\time stamp
                                           ;     in IMAGE_DIRECTORY_ENTRY_BOUND_IMPORT (new BIND)
                                           ; O.W. date/time stamp of DLL bound to (Old BIND)
     ForwarderChain     dd ?               ; -1 if no forwarders
     ImportName         dd ?
     FirstThunk IMAGE_THUNK_DATA ?         ; RVA to IAT (if bound this IAT has actual addresses)
   IMAGE_IMPORT_DESCRIPTOR ends
