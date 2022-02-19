   ;
   ; comment $
   ;
   ;                   Lord Julus presents the Win32 help series
   ;
   ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ; ÚÄ¿                                                                       ÚÄ¿
   ; ³ ³             This  is my  transformation of  the original WINNT.H      ³ ³
   ; ³ ³     file  from the Microsoft Windows SDK(C) for Windows  NT  5.0      ³ ³
   ; ³ ³     beta 2 and Windows 98, released on in Sept. 1998.                 ³ ³
   ; ³ ³     This  file  was   transformed  by  me  from  the original  C      ³ ³
   ; ³ ³     definition  into assembly language. You can use this file to      ³ ³
   ; ³ ³     quicken  up  writting your win32 programs in assembler.  You      ³ ³
   ; ³ ³     can use these files as you wish, as they are freeware.            ³ ³
   ; ³ ³                                                                       ³ ³
   ; ³ ³             However,  if  you find any mistake inside this file,      ³ ³
   ; ³ ³     it  is  probably due to the fact that I merely could see the      ³ ³
   ; ³ ³     monitor  while  converting  the  files. So, if you do notice      ³ ³
   ; ³ ³     something, please notify me on my e-mail address at:              ³ ³
   ; ³ ³                                                                       ³ ³
   ; ³ ³                   lordjulus@geocities.com                             ³ ³
   ; ³ ³                                                                       ³ ³
   ; ³ ³             Also, if you find any other useful stuff that can be      ³ ³
   ; ³ ³     included here, do not hesitate to tell me.                        ³ ³
   ; ³ ³                                                                       ³ ³
   ; ³ ³     Good luck,                                                        ³ ³
   ; ³ ³                                ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿              ³ ³
   ; ³ ³                                ³  Lord Julus (c) 1999  ³              ³ ³
   ; ³ ³                                ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ              ³ ³
   ; ³ ³                                                                       ³ ³
   ; ÀÄÙ                                                                       ÀÄÙ
   ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ;         $

   ;ÍÍÍÍÍÍµ EQUATES ÆÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   ;ÄÄÄÄÄÄ´ GENERAL ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

    UCHAR         EQU   <db>
    USHORT        EQU   <dw>
    UINT          EQU   <dd>
    ULONG         EQU   <dd>
    L             EQU   <LARGE>

    MAXCHAR       EQU   255
    MAXSHORT      EQU   32767
    MAXINT        EQU   2147483647
    MAXLONG       EQU   4924967295

    NULL          EQU   00h
    TRUE          EQU   01h
    FALSE         EQU   00h
    NOPARITY      EQU   00h
    ODDPARITY     EQU   01h
    EVENPARITY    EQU   02h
    MARKPARITY    EQU   03h
    SPACEPARITY   EQU   04h
    IGNORE        EQU   00h
    INFINITE      EQU   0FFFFFFFFh

   ;ÄÄÄÄÄÄ´ DRIVES ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

    DRIVE_UNKNOWN               EQU 0
    DRIVE_NO_ROOT_DIR           EQU 1
    DRIVE_REMOVABLE             EQU 2
    DRIVE_FIXED                 EQU 3
    DRIVE_REMOTE                EQU 4
    DRIVE_CDROM                 EQU 5
    DRIVE_RAMDISK               EQU 6

   ;ÄÄÄÄÄÄ´ DIFFERENT RIGHTS ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

    DELETE                      EQU   00010000h
    READ_CONTROL                EQU   00020000h
    WRITE_DAC                   EQU   00040000h
    WRITE_OWNER                 EQU   00080000h
    SYNCHRONIZE                 EQU   00100000h
    STANDARD_RIGHTS_REQUIRED    EQU   000F0000h
    STANDARD_RIGHTS_READ        EQU   READ_CONTROL
    STANDARD_RIGHTS_WRITE       EQU   READ_CONTROL
    STANDARD_RIGHTS_EXECUTE     EQU   READ_CONTROL
    STANDARD_RIGHTS_ALL         EQU   001F0000h
    SPECIFIC_RIGHTS_ALL         EQU   0000FFFFh
    ACCESS_SYSTEM_SECURITY      EQU   01000000h
    MAXIMUM_ALLOWED             EQU   02000000h

    GENERIC_READ                EQU   80000000h
    GENERIC_WRITE               EQU   40000000h
    GENERIC_EXECUTE             EQU   20000000h
    GENERIC_ALL                 EQU   10000000h

    PROCESS_TERMINATE           EQU   0001h
    PROCESS_CREATE_THREAD       EQU   0002h
    PROCESS_SET_SESSIONID       EQU   0004h
    PROCESS_VM_OPERATION        EQU   0008h
    PROCESS_VM_READ             EQU   0010h
    PROCESS_VM_WRITE            EQU   0020h
    PROCESS_DUP_HANDLE          EQU   0040h
    PROCESS_CREATE_PROCESS      EQU   0080h
    PROCESS_SET_QUOTA           EQU   0100h
    PROCESS_SET_INFORMATION     EQU   0200h
    PROCESS_QUERY_INFORMATION   EQU   0400h
    PROCESS_ALL_ACCESS          EQU   STANDARD_RIGHTS_REQUIRED OR \
                                      SYNCHRONIZE OR 0FFFh

    SECTION_QUERY               EQU 0001h
    SECTION_MAP_WRITE           EQU 0002h
    SECTION_MAP_READ            EQU 0004h
    SECTION_MAP_EXECUTE         EQU 0008h
    SECTION_EXTEND_SIZE         EQU 0010h
    SECTION_ALL_ACCESS          EQU STANDARD_RIGHTS_REQUIRED OR \
                                    SECTION_QUERY            OR \
                                    SECTION_MAP_WRITE        OR \
                                    SECTION_MAP_READ         OR \
                                    SECTION_MAP_EXECUTE      OR \
                                    SECTION_EXTEND_SIZE

   ;ÄÄÄÄÄÄ´ ACCESS FLAGS ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

    PAGE_NOACCESS               EQU 01h
    PAGE_READONLY               EQU 02h
    PAGE_READWRITE              EQU 04h
    PAGE_WRITECOPY              EQU 08h
    PAGE_EXECUTE                EQU 10h
    PAGE_EXECUTE_READ           EQU 20h
    PAGE_EXECUTE_READWRITE      EQU 40h
    PAGE_EXECUTE_WRITECOPY      EQU 80h
    PAGE_GUARD                  EQU 100h
    PAGE_NOCACHE                EQU 200h
    PAGE_WRITECOMBINE           EQU 400h
    MEM_COMMIT                  EQU 1000h
    MEM_RESERVE                 EQU 2000h
    MEM_DECOMMIT                EQU 4000h
    MEM_RELEASE                 EQU 8000h
    MEM_FREE                    EQU 10000h
    MEM_PRIVATE                 EQU 20000h
    MEM_MAPPED                  EQU 40000h
    MEM_RESET                   EQU 80000h
    MEM_TOP_DOWN                EQU 100000h
    MEM_WRITE_WATCH             EQU 200000h
    MEM_4MB_PAGES               EQU 80000000h
    SEC_FILE                    EQU 00800000h
    SEC_IMAGE                   EQU 01000000h
    SEC_VLM                     EQU 02000000h
    SEC_RESERVE                 EQU 04000000h
    SEC_COMMIT                  EQU 08000000h
    SEC_NOCACHE                 EQU 10000000h
    MEM_IMAGE                   EQU SEC_IMAGE


   ;ÄÄÄÄÄÄ´ CONTEXT ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

    CONTEXT_i386                EQU 00010000h
    CONTEXT_i486                EQU 00010000h

    CONTEXT_CONTROL             EQU  CONTEXT_i386 OR 00000001h
    CONTEXT_INTEGER             EQU  CONTEXT_i386 OR 00000002h
    CONTEXT_SEGMENTS            EQU  CONTEXT_i386 OR 00000004h
    CONTEXT_FLOATING_POINT      EQU  CONTEXT_i386 OR 00000008h
    CONTEXT_DEBUG_REGISTERS     EQU  CONTEXT_i386 OR 00000010h
    CONTEXT_EXTENDED_REGISTERS  EQU  CONTEXT_i386 OR 00000020h
    CONTEXT_FULL                EQU  CONTEXT_CONTROL OR CONTEXT_INTEGER OR \
                                     CONTEXT_SEGMENTS

   ;ÄÄÄÄÄÄ´ SEF ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

    SEF_DACL_AUTO_INHERIT              EQU 01h
    SEF_SACL_AUTO_INHERIT              EQU 02h
    SEF_DEFAULT_DESCRIPTOR_FOR_OBJECT  EQU 04h
    SEF_AVOID_PRIVILEGE_CHECK          EQU 08h
    SEF_AVOID_OWNER_CHECK              EQU 10h
    SEF_DEFAULT_OWNER_FROM_PARENT      EQU 20h
    SEF_DEFAULT_GROUP_FROM_PARENT      EQU 40h
    WT_EXECUTEDEFAULT                  EQU 00000000h
    WT_EXECUTEINIOTHREAD               EQU 00000001h
    WT_EXECUTEINUITHREAD               EQU 00000002h
    WT_EXECUTEINWAITTHREAD             EQU 00000004h
    WT_EXECUTEDELETEWAIT               EQU 00000008h
    WT_EXECUTEINLONGTHREAD             EQU 00000010h

   ;ÄÄÄÄÄÄ´ DLL ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

    DLL_PROCESS_ATTACH                 EQU 1
    DLL_THREAD_ATTACH                  EQU 2
    DLL_THREAD_DETACH                  EQU 3
    DLL_PROCESS_DETACH                 EQU 0

    DONT_RESOLVE_DLL_REFERENCES        EQU 00000001h
    LOAD_LIBRARY_AS_DATAFILE           EQU 00000002h
    LOAD_WITH_ALTERED_SEARCH_PATH      EQU 00000008h

    DDD_RAW_TARGET_PATH                EQU 00000001h
    DDD_REMOVE_DEFINITION              EQU 00000002h
    DDD_EXACT_MATCH_ON_REMOVE          EQU 00000004h
    DDD_NO_BROADCAST_SYSTEM            EQU 00000008h

   ;ÄÄÄÄÄÄ´ TERMINATION ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

    TC_NORMAL                          EQU 0
    TC_HARDERR                         EQU 1
    TC_GP_TRAP                         EQU 2
    TC_SIGNAL                          EQU 3

   ;ÄÄÄÄÄÄ´ EVENTS ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

    EVENTLOG_SEQUENTIAL_READ           EQU 0001h
    EVENTLOG_SEEK_READ                 EQU 0002h
    EVENTLOG_FORWARDS_READ             EQU 0004h
    EVENTLOG_BACKWARDS_READ            EQU 0008h

    EVENTLOG_SUCCESS                   EQU 0000h
    EVENTLOG_ERROR_TYPE                EQU 0001h
    EVENTLOG_WARNING_TYPE              EQU 0002h
    EVENTLOG_INFORMATION_TYPE          EQU 0004h
    EVENTLOG_AUDIT_SUCCESS             EQU 0008h
    EVENTLOG_AUDIT_FAILURE             EQU 0010h

    EVENTLOG_START_PAIRED_EVENT        EQU 0001h
    EVENTLOG_END_PAIRED_EVENT          EQU 0002h
    EVENTLOG_END_ALL_PAIRED_EVENTS     EQU 0004h
    EVENTLOG_PAIRED_EVENT_ACTIVE       EQU 0008h
    EVENTLOG_PAIRED_EVENT_INACTIVE     EQU 0010h

   ;ÄÄÄÄÄÄ´ DEBUG EVENTS ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

    EXCEPTION_DEBUG_EVENT              EQU 1
    CREATE_THREAD_DEBUG_EVENT          EQU 2
    CREATE_PROCESS_DEBUG_EVENT         EQU 3
    EXIT_THREAD_DEBUG_EVENT            EQU 4
    EXIT_PROCESS_DEBUG_EVENT           EQU 5
    LOAD_DLL_DEBUG_EVENT               EQU 6
    UNLOAD_DLL_DEBUG_EVENT             EQU 7
    OUTPUT_DEBUG_STRING_EVENT          EQU 8
    RIP_EVENT                          EQU 9

   ;ÄÄÄÄÄÄ´ DEBUG ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

    DBG_CONTINUE                       EQU 00010002h
    DBG_TERMINATE_THREAD               EQU 40010003h
    DBG_TERMINATE_PROCESS              EQU 40010004h
    DBG_CONTROL_C                      EQU 40010005h
    DBG_CONTROL_BREAK                  EQU 40010008h
    DBG_EXCEPTION_NOT_HANDLED          EQU 80010001h

   ;ÄÄÄÄÄÄ´ REGISTRY ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   ; Used when accessing the Windows Registry

    HKEY_CLASSES_ROOT       EQU 80000000h
    HKEY_CURRENT_USER       EQU 80000001h
    HKEY_LOCAL_MACHINE      EQU 80000002h
    HKEY_USERS              EQU 80000003h
    HKEY_PERFORMANCE_DATA   EQU 80000004h
    HKEY_CURRENT_CONFIG     EQU 80000005h
    HKEY_DYN_DATA           EQU 80000006h

    KEY_QUERY_VALUE         EQU 0001h
    KEY_SET_VALUE           EQU 0002h
    KEY_CREATE_SUB_KEY      EQU 0004h
    KEY_ENUMERATE_SUB_KEYS  EQU 0008h
    KEY_NOTIFY              EQU 0010h
    KEY_CREATE_LINK         EQU 0020h

    KEY_READ                EQU (STANDARD_RIGHTS_READ       OR\
                                 KEY_QUERY_VALUE            OR\
                                 KEY_ENUMERATE_SUB_KEYS     OR\
                                 KEY_NOTIFY)               AND\
                                 (NOT SYNCHRONIZE)

    KEY_WRITE               EQU (STANDARD_RIGHTS_WRITE      OR\
                                 KEY_SET_VALUE              OR\
                                 KEY_CREATE_SUB_KEY)       AND\
                                 (NOT SYNCHRONIZE)

    KEY_EXECUTE             EQU KEY_READ AND SYNCHRONIZE

    KEY_ALL_ACCESS          EQU (STANDARD_RIGHTS_ALL        OR\
                                 KEY_QUERY_VALUE            OR\
                                 KEY_SET_VALUE              OR\
                                 KEY_CREATE_SUB_KEY         OR\
                                 KEY_ENUMERATE_SUB_KEYS     OR\
                                 KEY_NOTIFY                 OR\
                                 KEY_CREATE_LINK)          AND\
                                 (NOT SYNCHRONIZE)


    REG_OPTION_NON_VOLATILE   EQU  00000000h   ; Key is preserved when system is rebooted
    REG_OPTION_VOLATILE       EQU  00000001h   ; Key is not preserved when system is rebooted
    REG_OPTION_CREATE_LINK    EQU  00000002h   ; Created key is a symbolic link
    REG_OPTION_BACKUP_RESTORE EQU  00000004h   ; open for backup or restore special access rules privilege required
    REG_OPTION_OPEN_LINK      EQU  00000008h   ; Open symbolic link
    REG_OPTION_RESERVED       EQU  00000000h   ;
    REG_LEGAL_OPTION          EQU  REG_OPTION_RESERVED            OR\
                                   REG_OPTION_NON_VOLATILE        OR\
                                   REG_OPTION_VOLATILE            OR\
                                   REG_OPTION_CREATE_LINK         OR\
                                   REG_OPTION_BACKUP_RESTORE      OR\
                                   REG_OPTION_OPEN_LINK

    REG_CREATED_NEW_KEY          EQU    00000001h   ; New Registry Key created
    REG_OPENED_EXISTING_KEY      EQU    00000002h   ; Existing Key opened
    REG_WHOLE_HIVE_VOLATILE      EQU    00000001h   ; Restore whole hive volatile
    REG_REFRESH_HIVE             EQU    00000002h   ; Unwind changes to last flush
    REG_NO_LAZY_FLUSH            EQU    00000004h   ; Never lazy flush this hive
    REG_NOTIFY_CHANGE_NAME       EQU    00000001h   ; Create or delete (child)
    REG_NOTIFY_CHANGE_ATTRIBUTES EQU    00000002h   ;
    REG_NOTIFY_CHANGE_LAST_SET   EQU    00000004h   ; time stamp
    REG_NOTIFY_CHANGE_SECURITY   EQU    00000008h   ;
    REG_LEGAL_CHANGE_FILTER      EQU    REG_NOTIFY_CHANGE_NAME          OR\
                                        REG_NOTIFY_CHANGE_ATTRIBUTES    OR\
                                        REG_NOTIFY_CHANGE_LAST_SET      OR\
                                        REG_NOTIFY_CHANGE_SECURITY

    REG_NONE                       EQU  0    ; No value type
    REG_SZ                         EQU  1    ; Unicode nul terminated string
    REG_EXPAND_SZ                  EQU  2    ; Unicode nul terminated string
    REG_BINARY                     EQU  3    ; Free form binary
    REG_DWORD                      EQU  4    ; 32-bit number
    REG_DWORD_LITTLE_ENDIAN        EQU  4    ; 32-bit number (same as REG_DWORD)
    REG_DWORD_BIG_ENDIAN           EQU  5    ; 32-bit number
    REG_LINK                       EQU  6    ; Symbolic Link (unicode)
    REG_MULTI_SZ                   EQU  7    ; Multiple Unicode strings
    REG_RESOURCE_LIST              EQU  8    ; Resource list in the resource map
    REG_FULL_RESOURCE_DESCRIPTOR   EQU  9    ; Resource list in the hardware description
    REG_RESOURCE_REQUIREMENTS_LIST EQU 10    ;

   ;ÄÄÄÄÄÄ´ SERVICES ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

    SERVICE_KERNEL_DRIVER        EQU   00000001h
    SERVICE_FILE_SYSTEM_DRIVER   EQU   00000002h
    SERVICE_ADAPTER              EQU   00000004h
    SERVICE_RECOGNIZER_DRIVER    EQU   00000008h
    SERVICE_DRIVER               EQU   SERVICE_KERNEL_DRIVER      OR\
                                       SERVICE_FILE_SYSTEM_DRIVER OR\
                                       SERVICE_RECOGNIZER_DRIVER

    SERVICE_WIN32_OWN_PROCESS    EQU   00000010h
    SERVICE_WIN32_SHARE_PROCESS  EQU   00000020h
    SERVICE_WIN32                EQU   SERVICE_WIN32_OWN_PROCESS  OR\
                                       SERVICE_WIN32_SHARE_PROCESS

    SERVICE_INTERACTIVE_PROCESS  EQU   00000100h

    SERVICE_TYPE_ALL             EQU   SERVICE_WIN32              OR \
                                       SERVICE_ADAPTER            OR \
                                       SERVICE_DRIVER             OR \
                                       SERVICE_INTERACTIVE_PROCESS

    SERVICE_BOOT_START           EQU   00000000h
    SERVICE_SYSTEM_START         EQU   00000001h
    SERVICE_AUTO_START           EQU   00000002h
    SERVICE_DEMAND_START         EQU   00000003h
    SERVICE_DISABLED             EQU   00000004h

    SERVICE_ERROR_IGNORE         EQU   00000000h
    SERVICE_ERROR_NORMAL         EQU   00000001h
    SERVICE_ERROR_SEVERE         EQU   00000002h
    SERVICE_ERROR_CRITICAL       EQU   00000003h

   ;ÄÄÄÄÄÄ´ WAIT ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

    WAIT_FAILED         EQU 0FFFFFFFFh
    WAIT_OBJECT_0       EQU STATUS_WAIT_0
    WAIT_ABANDONED      EQU STATUS_ABANDONED_WAIT_0
    WAIT_ABANDONED_0    EQU STATUS_ABANDONED_WAIT_0
    WAIT_IO_COMPLETION  EQU STATUS_USER_APC
    STILL_ACTIVE        EQU STATUS_PENDING
    CONTROL_C_EXIT      EQU STATUS_CONTROL_C_EXIT
    PROGRESS_CONTINUE   EQU 0
    PROGRESS_CANCEL     EQU 1
    PROGRESS_STOP       EQU 2
    PROGRESS_QUIET      EQU 3
    CALLBACK_CHUNK_FINISHED  EQU        00000000h
    CALLBACK_STREAM_SWITCH   EQU        00000001h

   ;ÄÄÄÄÄÄ´ PIPES ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

    PIPE_ACCESS_INBOUND      EQU    00000001h
    PIPE_ACCESS_OUTBOUND     EQU    00000002h
    PIPE_ACCESS_DUPLEX       EQU    00000003h
    PIPE_CLIENT_END          EQU    00000000h
    PIPE_SERVER_END          EQU    00000001h
    PIPE_WAIT                EQU    00000000h
    PIPE_NOWAIT              EQU    00000001h
    PIPE_READMODE_BYTE       EQU    00000000h
    PIPE_READMODE_MESSAGE    EQU    00000002h
    PIPE_TYPE_BYTE           EQU    00000000h
    PIPE_TYPE_MESSAGE        EQU    00000004h
    PIPE_UNLIMITED_INSTANCES EQU    255

   ;ÄÄÄÄÄÄ´ SECURITY ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

    SECURITY_CONTEXT_TRACKING  EQU 00040000h
    SECURITY_EFFECTIVE_ONLY    EQU 00080000h
    SECURITY_SQOS_PRESENT      EQU 00100000h
    SECURITY_VALID_SQOS_FLAGS  EQU 001F0000h

   ;ÄÄÄÄÄÄ´ HEAP ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

    HEAP_NO_SERIALIZE               EQU 00000001h
    HEAP_GROWABLE                   EQU 00000002h
    HEAP_GENERATE_EXCEPTIONS        EQU 00000004h
    HEAP_ZERO_MEMORY                EQU 00000008h
    HEAP_REALLOC_IN_PLACE_ONLY      EQU 00000010h
    HEAP_TAIL_CHECKING_ENABLED      EQU 00000020h
    HEAP_FREE_CHECKING_ENABLED      EQU 00000040h
    HEAP_DISABLE_COALESCE_ON_FREE   EQU 00000080h
    HEAP_CREATE_ALIGN_16            EQU 00010000h
    HEAP_CREATE_ENABLE_TRACING      EQU 00020000h
    HEAP_MAXIMUM_TAG                EQU 0FFFh
    HEAP_PSEUDO_TAG_FLAG            EQU 8000h
    HEAP_TAG_SHIFT                  EQU 18h

   ;ÄÄÄÄÄÄ´ UNICODE ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

    IS_TEXT_UNICODE_ASCII16             EQU   0001h
    IS_TEXT_UNICODE_REVERSE_ASCII16     EQU   0010h
    IS_TEXT_UNICODE_STATISTICS          EQU   0002h
    IS_TEXT_UNICODE_REVERSE_STATISTICS  EQU   0020h
    IS_TEXT_UNICODE_CONTROLS            EQU   0004h
    IS_TEXT_UNICODE_REVERSE_CONTROLS    EQU   0040h
    IS_TEXT_UNICODE_SIGNATURE           EQU   0008h
    IS_TEXT_UNICODE_REVERSE_SIGNATURE   EQU   0080h
    IS_TEXT_UNICODE_ILLEGAL_CHARS       EQU   0100h
    IS_TEXT_UNICODE_ODD_LENGTH          EQU   0200h
    IS_TEXT_UNICODE_DBCS_LEADBYTE       EQU   0400h
    IS_TEXT_UNICODE_NULL_BYTES          EQU   1000h
    IS_TEXT_UNICODE_UNICODE_MASK        EQU   000Fh
    IS_TEXT_UNICODE_REVERSE_MASK        EQU   00F0h
    IS_TEXT_UNICODE_NOT_UNICODE_MASK    EQU   0F00h
    IS_TEXT_UNICODE_NOT_ASCII_MASK      EQU   F000h

   ;ÄÄÄÄÄÄ´ COMPRESSION ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

    COMPRESSION_FORMAT_NONE         EQU  0000h
    COMPRESSION_FORMAT_DEFAULT      EQU  0001h
    COMPRESSION_FORMAT_LZNT1        EQU  0002h
    COMPRESSION_ENGINE_STANDARD     EQU  0000h
    COMPRESSION_ENGINE_MAXIMUM      EQU  0100h

   ;ÄÄÄÄÄÄ´ MAXIMUMS ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

    MAXLOGICALLOGNAMESIZE           EQU 256
    MAXIMUM_SUPPORTED_EXTENSION     EQU 512
    MAXIMUM_WAIT_OBJECTS            EQU 64
    MAXIMUM_SUSPEND_COUNT           EQU MAXCHAR
    MAXIMUM_PROCESSORS              EQU 32
    SIZE_OF_80387_REGISTERS         EQU 80
    MAX_PATH                        EQU 260

   ;ÄÄÄÄÄÄ´ STATUS ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

    STATUS_WAIT_0                    EQU 000000000h
    STATUS_ABANDONED_WAIT_0          EQU 000000080h
    STATUS_USER_APC                  EQU 0000000C0h
    STATUS_TIMEOUT                   EQU 000000102h
    STATUS_PENDING                   EQU 000000103h
    STATUS_SEGMENT_NOTIFICATION      EQU 040000005h
    STATUS_GUARD_PAGE_VIOLATION      EQU 080000001h
    STATUS_DATATYPE_MISALIGNMENT     EQU 080000002h
    STATUS_BREAKPOINT                EQU 080000003h
    STATUS_SINGLE_STEP               EQU 080000004h
    STATUS_ACCESS_VIOLATION          EQU 0C0000005h
    STATUS_IN_PAGE_ERROR             EQU 0C0000006h
    STATUS_INVALID_HANDLE            EQU 0C0000008h
    STATUS_NO_MEMORY                 EQU 0C0000017h
    STATUS_ILLEGAL_INSTRUCTION       EQU 0C000001Dh
    STATUS_NONCONTINUABLE_EXCEPTION  EQU 0C0000025h
    STATUS_INVALID_DISPOSITION       EQU 0C0000026h
    STATUS_ARRAY_BOUNDS_EXCEEDED     EQU 0C000008Ch
    STATUS_FLOAT_DENORMAL_OPERAND    EQU 0C000008Dh
    STATUS_FLOAT_DIVIDE_BY_ZERO      EQU 0C000008Eh
    STATUS_FLOAT_INEXACT_RESULT      EQU 0C000008Fh
    STATUS_FLOAT_INVALID_OPERATION   EQU 0C0000090h
    STATUS_FLOAT_OVERFLOW            EQU 0C0000091h
    STATUS_FLOAT_STACK_CHECK         EQU 0C0000092h
    STATUS_FLOAT_UNDERFLOW           EQU 0C0000093h
    STATUS_INTEGER_DIVIDE_BY_ZERO    EQU 0C0000094h
    STATUS_INTEGER_OVERFLOW          EQU 0C0000095h
    STATUS_PRIVILEGED_INSTRUCTION    EQU 0C0000096h
    STATUS_STACK_OVERFLOW            EQU 0C00000FDh
    STATUS_CONTROL_C_EXIT            EQU 0C000013Ah
    STATUS_FLOAT_MULTIPLE_FAULTS     EQU 0C00002B4h
    STATUS_FLOAT_MULTIPLE_TRAPS      EQU 0C00002B5h
    STATUS_ILLEGAL_VLM_REFERENCE     EQU 0C00002C0h
    STATUS_REG_NAT_CONSUMPTION       EQU 0C00002C9h

   ;ÄÄÄÄÄÄ´ THREADS ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

    THREAD_TERMINATE               EQU 0001h
    THREAD_SUSPEND_RESUME          EQU 0002h
    THREAD_GET_CONTEXT             EQU 0008h
    THREAD_SET_CONTEXT             EQU 0010h
    THREAD_SET_INFORMATION         EQU 0020h
    THREAD_QUERY_INFORMATION       EQU 0040h
    THREAD_SET_THREAD_TOKEN        EQU 0080h
    THREAD_IMPERSONATE             EQU 0100h
    THREAD_DIRECT_IMPERSONATION    EQU 0200h
    THREAD_ALL_ACCESS              EQU STANDARD_RIGHTS_REQUIRED OR\
                                   SYNCHRONIZE OR 3FFh

    THREAD_BASE_PRIORITY_LOWRT  EQU 15  ; value that gets a thread to LowRealtime-1
    THREAD_BASE_PRIORITY_MAX    EQU 2   ; maximum thread base priority boost
    THREAD_BASE_PRIORITY_MIN    EQU -2  ; minimum thread base priority boost
    THREAD_BASE_PRIORITY_IDLE   EQU -15 ; value that gets a thread to idle

    THREAD_PRIORITY_LOWEST          EQU THREAD_BASE_PRIORITY_MIN
    THREAD_PRIORITY_BELOW_NORMAL    EQU THREAD_PRIORITY_LOWEST+1
    THREAD_PRIORITY_NORMAL          EQU 0
    THREAD_PRIORITY_HIGHEST         EQU THREAD_BASE_PRIORITY_MAX
    THREAD_PRIORITY_ABOVE_NORMAL    EQU THREAD_PRIORITY_HIGHEST-1
    THREAD_PRIORITY_ERROR_RETURN    EQU MAXLONG

    THREAD_PRIORITY_TIME_CRITICAL   EQU THREAD_BASE_PRIORITY_LOWRT
    THREAD_PRIORITY_IDLE            EQU THREAD_BASE_PRIORITY_IDLE


   ;ÄÄÄÄÄÄ´ EVENT, MUTEX, SEMAPHORE ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

    EVENT_MODIFY_STATE      EQU 0002h
    EVENT_ALL_ACCESS        EQU STANDARD_RIGHTS_REQUIRED OR SYNCHRONIZE OR 3

    MUTANT_QUERY_STATE      EQU 0001h
    MUTANT_ALL_ACCESS       EQU STANDARD_RIGHTS_REQUIRED OR SYNCHRONIZE OR\
                                MUTANT_QUERY_STATE

    SEMAPHORE_MODIFY_STATE  EQU 0002h
    SEMAPHORE_ALL_ACCESS    EQU STANDARD_RIGHTS_REQUIRED OR SYNCHRONIZE OR 3

    MUTEX_MODIFY_STATE      EQU MUTANT_QUERY_STATE
    MUTEX_ALL_ACCESS        EQU MUTANT_ALL_ACCESS

    TIMER_QUERY_STATE       EQU 0001h
    TIMER_MODIFY_STATE      EQU 0002h
    TIMER_ALL_ACCESS        EQU STANDARD_RIGHTS_REQUIRED OR SYNCHRONIZE OR\
                                TIMER_QUERY_STATE OR TIMER_MODIFY_STATE

   ;ÄÄÄÄÄÄ´ PROCESSOR ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

    PROCESSOR_INTEL_386     EQU 386
    PROCESSOR_INTEL_486     EQU 486
    PROCESSOR_INTEL_PENTIUM EQU 586
    PROCESSOR_INTEL_IA64    EQU 2200
    PROCESSOR_MIPS_R4000    EQU 4000
    PROCESSOR_ALPHA_21064   EQU 21064
    PROCESSOR_PPC_601       EQU 601
    PROCESSOR_PPC_603       EQU 603
    PROCESSOR_PPC_604       EQU 604
    PROCESSOR_PPC_620       EQU 620
    PROCESSOR_HITACHI_SH3   EQU 10003   ; Windows CE
    PROCESSOR_HITACHI_SH3E  EQU 10004   ; Windows CE
    PROCESSOR_HITACHI_SH4   EQU 10005   ; Windows CE
    PROCESSOR_MOTOROLA_821  EQU 821     ; Windows CE
    PROCESSOR_SHx_SH3       EQU 103     ; Windows CE
    PROCESSOR_SHx_SH4       EQU 104     ; Windows CE
    PROCESSOR_STRONGARM     EQU 2577    ; Windows CE - A11
    PROCESSOR_ARM720        EQU 1824    ; Windows CE - 720
    PROCESSOR_ARM820        EQU 2080    ; Windows CE - 820
    PROCESSOR_ARM920        EQU 2336    ; Windows CE - 920
    PROCESSOR_ARM_7TDMI     EQU 70001   ; Windows CE

    PROCESSOR_ARCHITECTURE_INTEL   EQU 0
    PROCESSOR_ARCHITECTURE_MIPS    EQU 1
    PROCESSOR_ARCHITECTURE_ALPHA   EQU 2
    PROCESSOR_ARCHITECTURE_PPC     EQU 3
    PROCESSOR_ARCHITECTURE_SHX     EQU 4
    PROCESSOR_ARCHITECTURE_ARM     EQU 5
    PROCESSOR_ARCHITECTURE_IA64    EQU 6
    PROCESSOR_ARCHITECTURE_ALPHA64 EQU 7
    PROCESSOR_ARCHITECTURE_UNKNOWN EQU 0FFFFh

    PF_FLOATING_POINT_PRECISION_ERRATA  EQU 0
    PF_FLOATING_POINT_EMULATED          EQU 1
    PF_COMPARE_EXCHANGE_DOUBLE          EQU 2
    PF_MMX_INSTRUCTIONS_AVAILABLE       EQU 3
    PF_PPC_MOVEMEM_64BIT_OK             EQU 4
    PF_ALPHA_BYTE_INSTRUCTIONS          EQU 5
    PF_XMMI_INSTRUCTIONS_AVAILABLE      EQU 6
    PF_AMD3D_INSTRUCTIONS_AVAILABLE     EQU 7
    PF_RDTSC_INSTRUCTION_AVAILABLE      EQU 8
    SYSTEM_FLAG_REMOTE_BOOT_CLIENT      EQU 00000001h
    SYSTEM_FLAG_DISKLESS_CLIENT         EQU 00000002h

   ;ÄÄÄÄÄÄ´ FILES ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

    INVALID_HANDLE_VALUE  EQU -1
    INVALID_FILE_SIZE     EQU 0FFFFFFFFh
    STD_INPUT_HANDLE      EQU -10
    STD_OUTPUT_HANDLE     EQU -11
    STD_ERROR_HANDLE      EQU -12

    FILE_BEGIN            EQU 0         ; used by SetFilePos (shows from where
    FILE_CURRENT          EQU 1         ; to move)
    FILE_END              EQU 2         ;

    FILE_READ_DATA        EQU 0001h     ; file & pipe
    FILE_LIST_DIRECTORY   EQU 0001h     ; directory

    FILE_WRITE_DATA       EQU 0002h     ; file & pipe
    FILE_ADD_FILE         EQU 0002h     ; directory

    FILE_APPEND_DATA            EQU 0004h      ; file
    FILE_ADD_SUBDIRECTORY       EQU 0004h      ; directory
    FILE_CREATE_PIPE_INSTANCE   EQU 0004h      ; named pipe
    FILE_READ_EA                EQU 0008h      ; file & directory
    FILE_WRITE_EA               EQU 0010h      ; file & directory
    FILE_EXECUTE                EQU 0020h      ; file
    FILE_TRAVERSE               EQU 0020h      ; directory
    FILE_DELETE_CHILD           EQU 0040h      ; directory
    FILE_READ_ATTRIBUTES        EQU 0080h      ; all
    FILE_WRITE_ATTRIBUTES       EQU 0100h      ; all
    FILE_ALL_ACCESS             EQU STANDARD_RIGHTS_REQUIRED OR\
                                    SYNCHRONIZE OR 1FFh

    FILE_GENERIC_READ           EQU STANDARD_RIGHTS_READ     OR\
                                    FILE_READ_DATA           OR\
                                    FILE_READ_ATTRIBUTES     OR\
                                    FILE_READ_EA             OR\
                                    SYNCHRONIZE


    FILE_GENERIC_WRITE          EQU STANDARD_RIGHTS_WRITE    OR\
                                    FILE_WRITE_DATA          OR\
                                    FILE_WRITE_ATTRIBUTES    OR\
                                    FILE_WRITE_EA            OR\
                                    FILE_APPEND_DATA         OR\
                                    SYNCHRONIZE


    FILE_GENERIC_EXECUTE        EQU STANDARD_RIGHTS_EXECUTE  OR\
                                    FILE_READ_ATTRIBUTES     OR\
                                    FILE_EXECUTE             OR\
                                    SYNCHRONIZE

    FILE_SHARE_READ                     EQU 00000001h
    FILE_SHARE_WRITE                    EQU 00000002h
    FILE_SHARE_DELETE                   EQU 00000004h

    FILE_ATTRIBUTE_READONLY             EQU 00000001h
    FILE_ATTRIBUTE_HIDDEN               EQU 00000002h
    FILE_ATTRIBUTE_SYSTEM               EQU 00000004h
    FILE_ATTRIBUTE_DIRECTORY            EQU 00000010h
    FILE_ATTRIBUTE_ARCHIVE              EQU 00000020h
    FILE_ATTRIBUTE_DEVICE               EQU 00000040h
    FILE_ATTRIBUTE_NORMAL               EQU 00000080h
    FILE_ATTRIBUTE_TEMPORARY            EQU 00000100h
    FILE_ATTRIBUTE_SPARSE_FILE          EQU 00000200h
    FILE_ATTRIBUTE_REPARSE_POINT        EQU 00000400h
    FILE_ATTRIBUTE_COMPRESSED           EQU 00000800h
    FILE_ATTRIBUTE_OFFLINE              EQU 00001000h
    FILE_ATTRIBUTE_NOT_CONTENT_INDEXED  EQU 00002000h
    FILE_ATTRIBUTE_ENCRYPTED            EQU 00004000h

    FILE_NOTIFY_CHANGE_FILE_NAME        EQU 00000001h
    FILE_NOTIFY_CHANGE_DIR_NAME         EQU 00000002h
    FILE_NOTIFY_CHANGE_ATTRIBUTES       EQU 00000004h
    FILE_NOTIFY_CHANGE_SIZE             EQU 00000008h
    FILE_NOTIFY_CHANGE_LAST_WRITE       EQU 00000010h
    FILE_NOTIFY_CHANGE_LAST_ACCESS      EQU 00000020h
    FILE_NOTIFY_CHANGE_CREATION         EQU 00000040h
    FILE_NOTIFY_CHANGE_SECURITY         EQU 00000100h

    FILE_ACTION_ADDED                   EQU 00000001h
    FILE_ACTION_REMOVED                 EQU 00000002h
    FILE_ACTION_MODIFIED                EQU 00000003h
    FILE_ACTION_RENAMED_OLD_NAME        EQU 00000004h
    FILE_ACTION_RENAMED_NEW_NAME        EQU 00000005h

    MAILSLOT_NO_MESSAGE                 EQU -1
    MAILSLOT_WAIT_FOREVER               EQU -1

    FILE_CASE_SENSITIVE_SEARCH          EQU 00000001h
    FILE_CASE_PRESERVED_NAMES           EQU 00000002h
    FILE_UNICODE_ON_DISK                EQU 00000004h
    FILE_PERSISTENT_ACLS                EQU 00000008h
    FILE_FILE_COMPRESSION               EQU 00000010h
    FILE_VOLUME_QUOTAS                  EQU 00000020h
    FILE_SUPPORTS_SPARSE_FILES          EQU 00000040h
    FILE_SUPPORTS_REPARSE_POINTS        EQU 00000080h
    FILE_SUPPORTS_REMOTE_STORAGE        EQU 00000100h
    FILE_VOLUME_IS_COMPRESSED           EQU 00008000h
    FILE_SUPPORTS_OBJECT_IDS            EQU 00010000h
    FILE_SUPPORTS_ENCRYPTION            EQU 00020000h

    COPY_FILE_FAIL_IF_EXISTS            EQU 00000001h
    COPY_FILE_RESTARTABLE               EQU 00000002h
    COPY_FILE_OPEN_SOURCE_FOR_WRITE     EQU 00000004h

    REPLACEFILE_WRITE_THROUGH           EQU 00000001h
    REPLACEFILE_IGNORE_MERGE_ERRORS     EQU 00000002h

    FILE_FLAG_WRITE_THROUGH         EQU 80000000h
    FILE_FLAG_OVERLAPPED            EQU 40000000h
    FILE_FLAG_NO_BUFFERING          EQU 20000000h
    FILE_FLAG_RANDOM_ACCESS         EQU 10000000h
    FILE_FLAG_SEQUENTIAL_SCAN       EQU 08000000h
    FILE_FLAG_DELETE_ON_CLOSE       EQU 04000000h
    FILE_FLAG_BACKUP_SEMANTICS      EQU 02000000h
    FILE_FLAG_POSIX_SEMANTICS       EQU 01000000h
    FILE_FLAG_OPEN_REPARSE_POINT    EQU 00200000h
    FILE_FLAG_OPEN_NO_RECALL        EQU 00100000h

    FIND_FIRST_EX_CASE_SENSITIVE    EQU 00000001h

    MOVEFILE_REPLACE_EXISTING       EQU 00000001h
    MOVEFILE_COPY_ALLOWED           EQU 00000002h
    MOVEFILE_DELAY_UNTIL_REBOOT     EQU 00000004h
    MOVEFILE_WRITE_THROUGH          EQU 00000008h
    MOVEFILE_CREATE_HARDLINK        EQU 00000010h
    MOVEFILE_FAIL_IF_NOT_TRACKABLE  EQU 00000020h

    CREATE_NEW                      EQU 1
    CREATE_ALWAYS                   EQU 2
    OPEN_EXISTING                   EQU 3
    OPEN_ALWAYS                     EQU 4
    TRUNCATE_EXISTING               EQU 5

    LOCKFILE_FAIL_IMMEDIATELY       EQU 00000001h
    LOCKFILE_EXCLUSIVE_LOCK         EQU 00000002h

    HANDLE_FLAG_INHERIT             EQU 00000001h
    HANDLE_FLAG_PROTECT_FROM_CLOSE  EQU 00000002h

    HINSTANCE_ERROR                 EQU 32

    FILE_ENCRYPTABLE                EQU 0
    FILE_IS_ENCRYPTED               EQU 1
    FILE_SYSTEM_ATTR                EQU 2
    FILE_ROOT_DIR                   EQU 3
    FILE_SYSTEM_DIR                 EQU 4
    FILE_UNKNOWN                    EQU 5
    FILE_SYSTEM_NOT_SUPPORT         EQU 6
    FILE_USER_DISALLOWED            EQU 7
    FILE_READ_ONLY                  EQU 8

    FS_CASE_IS_PRESERVED            EQU FILE_CASE_PRESERVED_NAMES
    FS_CASE_SENSITIVE               EQU FILE_CASE_SENSITIVE_SEARCH
    FS_UNICODE_STORED_ON_DISK       EQU FILE_UNICODE_ON_DISK
    FS_PERSISTENT_ACLS              EQU FILE_PERSISTENT_ACLS
    FS_VOL_IS_COMPRESSED            EQU FILE_VOLUME_IS_COMPRESSED
    FS_FILE_COMPRESSION             EQU FILE_FILE_COMPRESSION
    FS_FILE_ENCRYPTION              EQU FILE_SUPPORTS_ENCRYPTION

    FILE_MAP_COPY                   EQU SECTION_QUERY
    FILE_MAP_WRITE                  EQU SECTION_MAP_WRITE
    FILE_MAP_READ                   EQU SECTION_MAP_READ
    FILE_MAP_ALL_ACCESS             EQU SECTION_ALL_ACCESS

    ; Open File flags

    OF_READ                         EQU 00000000h
    OF_WRITE                        EQU 00000001h
    OF_READWRITE                    EQU 00000002h
    OF_SHARE_COMPAT                 EQU 00000000h
    OF_SHARE_EXCLUSIVE              EQU 00000010h
    OF_SHARE_DENY_WRITE             EQU 00000020h
    OF_SHARE_DENY_READ              EQU 00000030h
    OF_SHARE_DENY_NONE              EQU 00000040h
    OF_PARSE                        EQU 00000100h
    OF_DELETE                       EQU 00000200h
    OF_VERIFY                       EQU 00000400h
    OF_CANCEL                       EQU 00000800h
    OF_CREATE                       EQU 00001000h
    OF_PROMPT                       EQU 00002000h
    OF_EXIST                        EQU 00004000h
    OF_REOPEN                       EQU 00008000h

    FILE_TYPE_UNKNOWN               EQU 0000h
    FILE_TYPE_DISK                  EQU 0001h
    FILE_TYPE_CHAR                  EQU 0002h
    FILE_TYPE_PIPE                  EQU 0003h
    FILE_TYPE_REMOTE                EQU 8000h

   ;ÄÄÄÄÄÄ´ PROCESS ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

    PROCESS_HEAP_REGION             EQU 0001h
    PROCESS_HEAP_UNCOMMITTED_RANGE  EQU 0002h
    PROCESS_HEAP_ENTRY_BUSY         EQU 0004h
    PROCESS_HEAP_ENTRY_MOVEABLE     EQU 0010h
    PROCESS_HEAP_ENTRY_DDESHARE     EQU 0020h

    DEBUG_PROCESS               EQU 00000001h
    DEBUG_ONLY_THIS_PROCESS     EQU 00000002h
    CREATE_SUSPENDED            EQU 00000004h
    DETACHED_PROCESS            EQU 00000008h
    CREATE_NEW_CONSOLE          EQU 00000010h

    NORMAL_PRIORITY_CLASS       EQU 00000020h
    IDLE_PRIORITY_CLASS         EQU 00000040h
    HIGH_PRIORITY_CLASS         EQU 00000080h
    REALTIME_PRIORITY_CLASS     EQU 00000100h

    CREATE_NEW_PROCESS_GROUP    EQU 00000200h
    CREATE_UNICODE_ENVIRONMENT  EQU 00000400h

    CREATE_SEPARATE_WOW_VDM     EQU 00000800h
    CREATE_SHARED_WOW_VDM       EQU 00001000h
    CREATE_FORCEDOS             EQU 00002000h

    BELOW_NORMAL_PRIORITY_CLASS EQU 00004000h
    ABOVE_NORMAL_PRIORITY_CLASS EQU 00008000h

    CREATE_DEFAULT_ERROR_MODE   EQU 04000000h
    CREATE_NO_WINDOW            EQU 08000000h

    PROFILE_USER                EQU 10000000h
    PROFILE_KERNEL              EQU 20000000h
    PROFILE_SERVER              EQU 40000000h

   ;ÄÄÄÄÄÄ´ SEM ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

    SEM_FAILCRITICALERRORS      EQU 0001h
    SEM_NOGPFAULTERRORBOX       EQU 0002h
    SEM_NOALIGNMENTFAULTEXCEPT  EQU 0004h
    SEM_NOOPENFILEERRORBOX      EQU 8000h

   ;ÄÄÄÄÄÄ´ MESSAGES ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

    FORMAT_MESSAGE_ALLOCATE_BUFFER EQU 00000100h
    FORMAT_MESSAGE_IGNORE_INSERTS  EQU 00000200h
    FORMAT_MESSAGE_FROM_STRING     EQU 00000400h
    FORMAT_MESSAGE_FROM_HMODULE    EQU 00000800h
    FORMAT_MESSAGE_FROM_SYSTEM     EQU 00001000h
    FORMAT_MESSAGE_ARGUMENT_ARRAY  EQU 00002000h
    FORMAT_MESSAGE_MAX_WIDTH_MASK  EQU 000000FFh

    MESSAGE_RESOURCE_UNICODE EQU 0001

   ;ÄÄÄÄÄÄ´ EXCEPTIONS ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

    EXCEPTION_NONCONTINUABLE            EQU 1
    EXCEPTION_MAXIMUM_PARAMETERS        EQU 15

    EXCEPTION_ACCESS_VIOLATION          EQU STATUS_ACCESS_VIOLATION
    EXCEPTION_DATATYPE_MISALIGNMENT     EQU STATUS_DATATYPE_MISALIGNMENT
    EXCEPTION_BREAKPOINT                EQU STATUS_BREAKPOINT
    EXCEPTION_SINGLE_STEP               EQU STATUS_SINGLE_STEP
    EXCEPTION_ARRAY_BOUNDS_EXCEEDED     EQU STATUS_ARRAY_BOUNDS_EXCEEDED
    EXCEPTION_FLT_DENORMAL_OPERAND      EQU STATUS_FLOAT_DENORMAL_OPERAND
    EXCEPTION_FLT_DIVIDE_BY_ZERO        EQU STATUS_FLOAT_DIVIDE_BY_ZERO
    EXCEPTION_FLT_INEXACT_RESULT        EQU STATUS_FLOAT_INEXACT_RESULT
    EXCEPTION_FLT_INVALID_OPERATION     EQU STATUS_FLOAT_INVALID_OPERATION
    EXCEPTION_FLT_OVERFLOW              EQU STATUS_FLOAT_OVERFLOW
    EXCEPTION_FLT_STACK_CHECK           EQU STATUS_FLOAT_STACK_CHECK
    EXCEPTION_FLT_UNDERFLOW             EQU STATUS_FLOAT_UNDERFLOW
    EXCEPTION_INT_DIVIDE_BY_ZERO        EQU STATUS_INTEGER_DIVIDE_BY_ZERO
    EXCEPTION_INT_OVERFLOW              EQU STATUS_INTEGER_OVERFLOW
    EXCEPTION_PRIV_INSTRUCTION          EQU STATUS_PRIVILEGED_INSTRUCTION
    EXCEPTION_IN_PAGE_ERROR             EQU STATUS_IN_PAGE_ERROR
    EXCEPTION_ILLEGAL_INSTRUCTION       EQU STATUS_ILLEGAL_INSTRUCTION
    EXCEPTION_NONCONTINUABLE_EXCEPTION  EQU STATUS_NONCONTINUABLE_EXCEPTION
    EXCEPTION_STACK_OVERFLOW            EQU STATUS_STACK_OVERFLOW
    EXCEPTION_INVALID_DISPOSITION       EQU STATUS_INVALID_DISPOSITION
    EXCEPTION_GUARD_PAGE                EQU STATUS_GUARD_PAGE_VIOLATION
    EXCEPTION_INVALID_HANDLE            EQU STATUS_INVALID_HANDLE

   ;ÄÄÄÄÄÄ´ VERSION ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

    VER_SERVER_NT                       EQU 80000000h
    VER_WORKSTATION_NT                  EQU 40000000h
    VER_SUITE_SMALLBUSINESS             EQU 00000001h
    VER_SUITE_ENTERPRISE                EQU 00000002h
    VER_SUITE_BACKOFFICE                EQU 00000004h
    VER_SUITE_COMMUNICATIONS            EQU 00000008h
    VER_SUITE_TERMINAL                  EQU 00000010h
    VER_SUITE_SMALLBUSINESS_RESTRICTED  EQU 00000020h
    VER_SUITE_EMBEDDEDNT                EQU 00000040h

    VER_PLATFORM_WIN32s                 EQU 0
    VER_PLATFORM_WIN32_WINDOWS          EQU 1
    VER_PLATFORM_WIN32_NT               EQU 2

    VER_EQUAL                           EQU 1
    VER_GREATER                         EQU 2
    VER_GREATER_EQUAL                   EQU 3
    VER_LESS                            EQU 4
    VER_LESS_EQUAL                      EQU 5
    VER_AND                             EQU 6
    VER_OR                              EQU 7

    VER_MINORVERSION                    EQU 0000001h
    VER_MAJORVERSION                    EQU 0000002h
    VER_BUILDNUMBER                     EQU 0000004h
    VER_PLATFORMID                      EQU 0000008h
    VER_SERVICEPACKMINOR                EQU 0000010h
    VER_SERVICEPACKMAJOR                EQU 0000020h
    VER_SUITENAME                       EQU 0000040h

   ;ÄÄÄÄÄÄ´ FILE IMAGES EQUATES ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

    IMAGE_DOS_SIGNATURE                  EQU 5A4Dh      ; MZ
    IMAGE_OS2_SIGNATURE                  EQU 454Eh      ; NE
    IMAGE_OS2_SIGNATURE_LE               EQU 454Ch      ; LE
    IMAGE_VXD_SIGNATURE                  EQU 454Ch      ; LE
    IMAGE_NT_SIGNATURE                   EQU 00004550h  ; PE00
    IMAGE_SIZEOF_FILE_HEADER             EQU 20     ;
    IMAGE_SIZEOF_MZ_HEADER               EQU 40h    ;

    ; PE File Characteristics

    IMAGE_FILE_RELOCS_STRIPPED           EQU 0001h  ; Relocation info stripped from file.
    IMAGE_FILE_EXECUTABLE_IMAGE          EQU 0002h  ; File is executable  (i.e. no unresolved externel references).
    IMAGE_FILE_LINE_NUMS_STRIPPED        EQU 0004h  ; Line nunbers stripped from file.
    IMAGE_FILE_LOCAL_SYMS_STRIPPED       EQU 0008h  ; Local symbols stripped from file.
    IMAGE_FILE_AGGRESIVE_WS_TRIM         EQU 0010h  ; Agressively trim working set
    IMAGE_FILE_LARGE_ADDRESS_AWARE       EQU 0020h  ; App can handle >2gb addresses
    IMAGE_FILE_BYTES_REVERSED_LO         EQU 0080h  ; Bytes of machine word are reversed.
    IMAGE_FILE_32BIT_MACHINE             EQU 0100h  ; 32 bit word machine.
    IMAGE_FILE_DEBUG_STRIPPED            EQU 0200h  ; Debugging info stripped from file in .DBG file
    IMAGE_FILE_REMOVABLE_RUN_FROM_SWAP   EQU 0400h  ; If Image is on removable media, copy and run from the swap file.
    IMAGE_FILE_NET_RUN_FROM_SWAP         EQU 0800h  ; If Image is on Net, copy and run from the swap file.
    IMAGE_FILE_SYSTEM                    EQU 1000h  ; System File.
    IMAGE_FILE_DLL                       EQU 2000h  ; File is a DLL.
    IMAGE_FILE_UP_SYSTEM_ONLY            EQU 4000h  ; File should only be run on a UP machine
    IMAGE_FILE_BYTES_REVERSED_HI         EQU 8000h  ; Bytes of machine word are reversed.

    ; PE Machine type

    IMAGE_FILE_MACHINE_UNKNOWN           EQU 0
    IMAGE_FILE_MACHINE_I386              EQU 014ch  ; Intel 386.
    IMAGE_FILE_MACHINE_R3000             EQU 0162h  ; MIPS little-endian, 160 big-endian
    IMAGE_FILE_MACHINE_R4000             EQU 0166h  ; MIPS little-endian
    IMAGE_FILE_MACHINE_R10000            EQU 0168h  ; MIPS little-endian
    IMAGE_FILE_MACHINE_WCEMIPSV2         EQU 0169h  ; MIPS little-endian WCE v2
    IMAGE_FILE_MACHINE_ALPHA             EQU 0184h  ; Alpha_AXP
    IMAGE_FILE_MACHINE_POWERPC           EQU 01F0h  ; IBM PowerPC Little-Endian
    IMAGE_FILE_MACHINE_SH3               EQU 01a2h  ; SH3 little-endian
    IMAGE_FILE_MACHINE_SH3E              EQU 01a4h  ; SH3E little-endian
    IMAGE_FILE_MACHINE_SH4               EQU 01a6h  ; SH4 little-endian
    IMAGE_FILE_MACHINE_ARM               EQU 01c0h  ; ARM Little-Endian
    IMAGE_FILE_MACHINE_THUMB             EQU 01c2h
    IMAGE_FILE_MACHINE_IA64              EQU 0200h  ; Intel 64
    IMAGE_FILE_MACHINE_MIPS16            EQU 0266h  ; MIPS
    IMAGE_FILE_MACHINE_MIPSFPU           EQU 0366h  ; MIPS
    IMAGE_FILE_MACHINE_MIPSFPU16         EQU 0466h  ; MIPS
    IMAGE_FILE_MACHINE_ALPHA64           EQU 0284h  ; ALPHA64
    IMAGE_FILE_MACHINE_AXP64             EQU IMAGE_FILE_MACHINE_ALPHA64

    IMAGE_NUMBEROF_DIRECTORY_ENTRIES     EQU 16
    IMAGE_SIZEOF_STD_OPTIONAL_HEADER     EQU 28
    IMAGE_SIZEOF_NT_OPTIONAL_HEADER      EQU 224
    IMAGE_NT_OPTIONAL_HDR_MAGIC          EQU 10bh

    IMAGE_SUBSYSTEM_UNKNOWN              EQU 0   ; Unknown subsystem.
    IMAGE_SUBSYSTEM_NATIVE               EQU 1   ; Image doesn't require a subsystem.
    IMAGE_SUBSYSTEM_WINDOWS_GUI          EQU 2   ; Image runs in the Windows GUI subsystem.
    IMAGE_SUBSYSTEM_WINDOWS_CUI          EQU 3   ; Image runs in the Windows character subsystem.
    IMAGE_SUBSYSTEM_OS2_CUI              EQU 5   ; image runs in the OS/2 character subsystem.
    IMAGE_SUBSYSTEM_POSIX_CUI            EQU 7   ; image runs in the Posix character subsystem.
    IMAGE_SUBSYSTEM_NATIVE_WINDOWS       EQU 8   ; image is a native Win9x driver.
    IMAGE_SUBSYSTEM_WINDOWS_CE_GUI       EQU 9   ; Image runs in the Windows CE subsystem.

    ; Directory Entries

    IMAGE_DIRECTORY_ENTRY_EXPORT         EQU 0    ; Export Directory
    IMAGE_DIRECTORY_ENTRY_IMPORT         EQU 1    ; Import Directory
    IMAGE_DIRECTORY_ENTRY_RESOURCE       EQU 2    ; Resource Directory
    IMAGE_DIRECTORY_ENTRY_EXCEPTION      EQU 3    ; Exception Directory
    IMAGE_DIRECTORY_ENTRY_SECURITY       EQU 4    ; Security Directory
    IMAGE_DIRECTORY_ENTRY_BASERELOC      EQU 5    ; Base Relocation Table
    IMAGE_DIRECTORY_ENTRY_DEBUG          EQU 6    ; Debug Directory
    IMAGE_DIRECTORY_ENTRY_ARCHITECTURE   EQU 7    ; Architecture Specific Data
    IMAGE_DIRECTORY_ENTRY_GLOBALPTR      EQU 8    ; RVA of GP
    IMAGE_DIRECTORY_ENTRY_TLS            EQU 9    ; TLS Directory
    IMAGE_DIRECTORY_ENTRY_LOAD_CONFIG    EQU 10   ; Load Configuration Directory
    IMAGE_DIRECTORY_ENTRY_BOUND_IMPORT   EQU 11   ; Bound Import Directory in headers
    IMAGE_DIRECTORY_ENTRY_IAT            EQU 12   ; Import Address Table
    IMAGE_DIRECTORY_ENTRY_DELAY_IMPORT   EQU 13   ; Delay Load Import Descriptors
    IMAGE_DIRECTORY_ENTRY_COM_DESCRIPTOR EQU 14   ; COM Runtime descriptor

    IMAGE_SIZEOF_SHORT_NAME              EQU 8
    IMAGE_SIZEOF_SECTION_HEADER          EQU 40

    ; Section Characteristics

    IMAGE_SCN_CNT_CODE                   EQU 00000020h  ; Section contains code.
    IMAGE_SCN_CNT_INITIALIZED_DATA       EQU 00000040h  ; Section contains initialized data.
    IMAGE_SCN_CNT_UNINITIALIZED_DATA     EQU 00000080h  ; Section contains uninitialized data.

    IMAGE_SCN_LNK_INFO                   EQU 00000200h  ; Section contains comments or some other type of information.
    IMAGE_SCN_LNK_REMOVE                 EQU 00000800h  ; Section contents will not become part of image.
    IMAGE_SCN_LNK_COMDAT                 EQU 00001000h  ; Section contents comdat.
    IMAGE_SCN_NO_DEFER_SPEC_EXC          EQU 00004000h  ; Reset speculative exceptions handling bits in the TLB entries for this section.
    IMAGE_SCN_GPREL                      EQU 00008000h  ; Section content can be accessed relative to GP
    IMAGE_SCN_MEM_FARDATA                EQU 00008000h
    IMAGE_SCN_MEM_PURGEABLE              EQU 00020000h
    IMAGE_SCN_MEM_16BIT                  EQU 00020000h
    IMAGE_SCN_MEM_LOCKED                 EQU 00040000h
    IMAGE_SCN_MEM_PRELOAD                EQU 00080000h

    IMAGE_SCN_ALIGN_1BYTES               EQU 00100000h  ;
    IMAGE_SCN_ALIGN_2BYTES               EQU 00200000h  ;
    IMAGE_SCN_ALIGN_4BYTES               EQU 00300000h  ;
    IMAGE_SCN_ALIGN_8BYTES               EQU 00400000h  ;
    IMAGE_SCN_ALIGN_16BYTES              EQU 00500000h  ; Default alignment if no others are specified.
    IMAGE_SCN_ALIGN_32BYTES              EQU 00600000h  ;
    IMAGE_SCN_ALIGN_64BYTES              EQU 00700000h  ;
    IMAGE_SCN_ALIGN_128BYTES             EQU 00800000h  ;
    IMAGE_SCN_ALIGN_256BYTES             EQU 00900000h  ;
    IMAGE_SCN_ALIGN_512BYTES             EQU 00A00000h  ;
    IMAGE_SCN_ALIGN_1024BYTES            EQU 00B00000h  ;
    IMAGE_SCN_ALIGN_2048BYTES            EQU 00C00000h  ;
    IMAGE_SCN_ALIGN_4096BYTES            EQU 00D00000h  ;
    IMAGE_SCN_ALIGN_8192BYTES            EQU 00E00000h  ;
    IMAGE_SCN_ALIGN_MASK                 EQU 00F00000h

    IMAGE_SCN_LNK_NRELOC_OVFL            EQU 01000000h  ; Section contains extended relocations.
    IMAGE_SCN_MEM_DISCARDABLE            EQU 02000000h  ; Section can be discarded.
    IMAGE_SCN_MEM_NOT_CACHED             EQU 04000000h  ; Section is not cachable.
    IMAGE_SCN_MEM_NOT_PAGED              EQU 08000000h  ; Section is not pageable.
    IMAGE_SCN_MEM_SHARED                 EQU 10000000h  ; Section is shareable.
    IMAGE_SCN_MEM_EXECUTE                EQU 20000000h  ; Section is executable.
    IMAGE_SCN_MEM_READ                   EQU 40000000h  ; Section is readable.
    IMAGE_SCN_MEM_WRITE                  EQU 80000000h  ; Section is writeable.

    IMAGE_SCN_SCALE_INDEX                EQU 00000001h  ; Tls index is scaled

    IMAGE_SIZEOF_SYMBOL                  EQU 18

    IMAGE_SYM_UNDEFINED                  EQU 0          ; Symbol is undefined or is common.
    IMAGE_SYM_ABSOLUTE                   EQU -1         ; Symbol is an absolute value.
    IMAGE_SYM_DEBUG                      EQU -2         ; Symbol is a special debug item.

    IMAGE_SYM_TYPE_NULL                  EQU 0000h  ; no type.
    IMAGE_SYM_TYPE_VOID                  EQU 0001h  ;
    IMAGE_SYM_TYPE_CHAR                  EQU 0002h  ; type character.
    IMAGE_SYM_TYPE_SHORT                 EQU 0003h  ; type short integer.
    IMAGE_SYM_TYPE_INT                   EQU 0004h  ;
    IMAGE_SYM_TYPE_LONG                  EQU 0005h  ;
    IMAGE_SYM_TYPE_FLOAT                 EQU 0006h  ;
    IMAGE_SYM_TYPE_DOUBLE                EQU 0007h  ;
    IMAGE_SYM_TYPE_STRUCT                EQU 0008h  ;
    IMAGE_SYM_TYPE_UNION                 EQU 0009h  ;
    IMAGE_SYM_TYPE_ENUM                  EQU 000Ah  ; enumeration.
    IMAGE_SYM_TYPE_MOE                   EQU 000Bh  ; member of enumeration.
    IMAGE_SYM_TYPE_BYTE                  EQU 000Ch  ;
    IMAGE_SYM_TYPE_WORD                  EQU 000Dh  ;
    IMAGE_SYM_TYPE_UINT                  EQU 000Eh  ;
    IMAGE_SYM_TYPE_DWORD                 EQU 000Fh  ;
    IMAGE_SYM_TYPE_PCODE                 EQU 8000h  ;

    IMAGE_SYM_DTYPE_NULL                EQU 0       ; no derived type.
    IMAGE_SYM_DTYPE_POINTER             EQU 1       ; pointer.
    IMAGE_SYM_DTYPE_FUNCTION            EQU 2       ; function.
    IMAGE_SYM_DTYPE_ARRAY               EQU 3       ; array.


    IMAGE_SYM_CLASS_END_OF_FUNCTION     EQU -1
    IMAGE_SYM_CLASS_NULL                EQU 0000h
    IMAGE_SYM_CLASS_AUTOMATIC           EQU 0001h
    IMAGE_SYM_CLASS_EXTERNAL            EQU 0002h
    IMAGE_SYM_CLASS_STATIC              EQU 0003h
    IMAGE_SYM_CLASS_REGISTER            EQU 0004h
    IMAGE_SYM_CLASS_EXTERNAL_DEF        EQU 0005h
    IMAGE_SYM_CLASS_LABEL               EQU 0006h
    IMAGE_SYM_CLASS_UNDEFINED_LABEL     EQU 0007h
    IMAGE_SYM_CLASS_MEMBER_OF_STRUCT    EQU 0008h
    IMAGE_SYM_CLASS_ARGUMENT            EQU 0009h
    IMAGE_SYM_CLASS_STRUCT_TAG          EQU 000Ah
    IMAGE_SYM_CLASS_MEMBER_OF_UNION     EQU 000Bh
    IMAGE_SYM_CLASS_UNION_TAG           EQU 000Ch
    IMAGE_SYM_CLASS_TYPE_DEFINITION     EQU 000Dh
    IMAGE_SYM_CLASS_UNDEFINED_STATIC    EQU 000Eh
    IMAGE_SYM_CLASS_ENUM_TAG            EQU 000Fh
    IMAGE_SYM_CLASS_MEMBER_OF_ENUM      EQU 0010h
    IMAGE_SYM_CLASS_REGISTER_PARAM      EQU 0011h
    IMAGE_SYM_CLASS_BIT_FIELD           EQU 0012h

    IMAGE_SYM_CLASS_FAR_EXTERNAL        EQU 0044h

    IMAGE_SYM_CLASS_BLOCK               EQU 0064h
    IMAGE_SYM_CLASS_FUNCTION            EQU 0065h
    IMAGE_SYM_CLASS_END_OF_STRUCT       EQU 0066h
    IMAGE_SYM_CLASS_FILE                EQU 0067h
    IMAGE_SYM_CLASS_SECTION             EQU 0068h
    IMAGE_SYM_CLASS_WEAK_EXTERNAL       EQU 0069h


    N_BTMASK                            EQU 000Fh
    N_TMASK                             EQU 0030h
    N_TMASK1                            EQU 00C0h
    N_TMASK2                            EQU 00F0h
    N_BTSHFT                            EQU 4
    N_TSHIFT                            EQU 2

    IMAGE_SIZEOF_AUX_SYMBOL             EQU 18

    IMAGE_COMDAT_SELECT_NODUPLICATES    EQU 1
    IMAGE_COMDAT_SELECT_ANY             EQU 2
    IMAGE_COMDAT_SELECT_SAME_SIZE       EQU 3
    IMAGE_COMDAT_SELECT_EXACT_MATCH     EQU 4
    IMAGE_COMDAT_SELECT_ASSOCIATIVE     EQU 5
    IMAGE_COMDAT_SELECT_LARGEST         EQU 6
    IMAGE_COMDAT_SELECT_NEWEST          EQU 7

    IMAGE_WEAK_EXTERN_SEARCH_NOLIBRARY  EQU 1
    IMAGE_WEAK_EXTERN_SEARCH_LIBRARY    EQU 2
    IMAGE_WEAK_EXTERN_SEARCH_ALIAS      EQU 3

    IMAGE_SIZEOF_RELOCATION         EQU 10

    IMAGE_REL_I386_ABSOLUTE         EQU 0000h  ; Reference is absolute, no relocation is necessary
    IMAGE_REL_I386_DIR16            EQU 0001h  ; Direct 16-bit reference to the symbols virtual address
    IMAGE_REL_I386_REL16            EQU 0002h  ; PC-relative 16-bit reference to the symbols virtual address
    IMAGE_REL_I386_DIR32            EQU 0006h  ; Direct 32-bit reference to the symbols virtual address
    IMAGE_REL_I386_DIR32NB          EQU 0007h  ; Direct 32-bit reference to the symbols virtual address, base not included
    IMAGE_REL_I386_SEG12            EQU 0009h  ; Direct 16-bit reference to the segment-selector bits of a 32-bit virtual address
    IMAGE_REL_I386_SECTION          EQU 000Ah
    IMAGE_REL_I386_SECREL           EQU 000Bh
    IMAGE_REL_I386_REL32            EQU 0014h  ; PC-relative 32-bit reference to the symbols virtual address

    IMAGE_SIZEOF_LINENUMBER               EQU 6
    IMAGE_SIZEOF_BASE_RELOCATION          EQU 8

    IMAGE_REL_BASED_ABSOLUTE              EQU 0
    IMAGE_REL_BASED_HIGH                  EQU 1
    IMAGE_REL_BASED_LOW                   EQU 2
    IMAGE_REL_BASED_HIGHLOW               EQU 3
    IMAGE_REL_BASED_HIGHADJ               EQU 4
    IMAGE_REL_BASED_MIPS_JMPADDR          EQU 5
    IMAGE_REL_BASED_SECTION               EQU 6
    IMAGE_REL_BASED_REL32                 EQU 7

    IMAGE_REL_BASED_MIPS_JMPADDR16        EQU 9
    IMAGE_REL_BASED_IA64_IMM64            EQU 9
    IMAGE_REL_BASED_DIR64                 EQU 10
    IMAGE_REL_BASED_HIGH3ADJ              EQU 11

    IMAGE_ORDINAL_FLAG                    EQU 80000000h

    IMAGE_RESOURCE_NAME_IS_STRING         EQU 80000000h
    IMAGE_RESOURCE_DATA_IS_DIRECTORY      EQU 80000000h

    IMAGE_DEBUG_TYPE_UNKNOWN          EQU 0
    IMAGE_DEBUG_TYPE_COFF             EQU 1
    IMAGE_DEBUG_TYPE_CODEVIEW         EQU 2
    IMAGE_DEBUG_TYPE_FPO              EQU 3
    IMAGE_DEBUG_TYPE_MISC             EQU 4
    IMAGE_DEBUG_TYPE_EXCEPTION        EQU 5
    IMAGE_DEBUG_TYPE_FIXUP            EQU 6
    IMAGE_DEBUG_TYPE_OMAP_TO_SRC      EQU 7
    IMAGE_DEBUG_TYPE_OMAP_FROM_SRC    EQU 8
    IMAGE_DEBUG_TYPE_BORLAND          EQU 9
    IMAGE_DEBUG_TYPE_RESERVED10       EQU 10

    IMAGE_DEBUG_MISC_EXENAME    EQU 1

    IMAGE_SEPARATE_DEBUG_SIGNATURE  EQU 04944h

    IMAGE_SEPARATE_DEBUG_FLAGS_MASK EQU 8000h
    IMAGE_SEPARATE_DEBUG_MISMATCH   EQU 8000h  ; when DBG was updated, the

   ;ÄÄÄÄÄÄ´ MEMORY ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

    ; G = GLOBAL
    ; L = LOCAL  (NB. IN WIN95/98/NT GLOBAL=LOCAL)

    GMEM_FIXED          EQU 0000h
    GMEM_MOVEABLE       EQU 0002h
    GMEM_NOCOMPACT      EQU 0010h
    GMEM_NODISCARD      EQU 0020h
    GMEM_ZEROINIT       EQU 0040h
    GMEM_MODIFY         EQU 0080h
    GMEM_DISCARDABLE    EQU 0100h
    GMEM_NOT_BANKED     EQU 1000h
    GMEM_SHARE          EQU 2000h
    GMEM_DDESHARE       EQU 2000h
    GMEM_NOTIFY         EQU 4000h
    GMEM_LOWER          EQU GMEM_NOT_BANKED
    GMEM_VALID_FLAGS    EQU 7F72h
    GMEM_INVALID_HANDLE EQU 8000h

    GHND                EQU (GMEM_MOVEABLE OR GMEM_ZEROINIT)
    GPTR                EQU (GMEM_FIXED OR GMEM_ZEROINIT)

    GMEM_DISCARDED      EQU 4000h
    GMEM_LOCKCOUNT      EQU 00FFh

    LMEM_FIXED          EQU 0000h
    LMEM_MOVEABLE       EQU 0002h
    LMEM_NOCOMPACT      EQU 0010h
    LMEM_NODISCARD      EQU 0020h
    LMEM_ZEROINIT       EQU 0040h
    LMEM_MODIFY         EQU 0080h
    LMEM_DISCARDABLE    EQU 0F00h
    LMEM_VALID_FLAGS    EQU 0F72h
    LMEM_INVALID_HANDLE EQU 8000h

    LHND                EQU (LMEM_MOVEABLE OR LMEM_ZEROINIT)
    LPTR                EQU (LMEM_FIXED OR LMEM_ZEROINIT)

    NONZEROLHND         EQU LMEM_MOVEABLE
    NONZEROLPTR         EQU LMEM_FIXED

    LMEM_DISCARDED      EQU 4000h
    LMEM_LOCKCOUNT      EQU 00FFh


   ;ÍÍÍÍÍÍµ STRUCTURES ÆÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   IMAGE_DOS_HEADER STRUC            ; DOS .EXE header
       MZ_magic      DW ?            ; Magic number
       MZ_cblp       DW ?            ; Bytes on last page of file
       MZ_cp         DW ?            ; Pages in file
       MZ_crlc       DW ?            ; Relocations
       MZ_cparhdr    DW ?            ; Size of header in paragraphs
       MZ_minalloc   DW ?            ; Minimum extra paragraphs needed
       MZ_maxalloc   DW ?            ; Maximum extra paragraphs needed
       MZ_ss         DW ?            ; Initial (relative) SS value
       MZ_sp         DW ?            ; Initial SP value
       MZ_csum       DW ?            ; Checksum
       MZ_ip         DW ?            ; Initial IP value
       MZ_cs         DW ?            ; Initial (relative) CS value
       MZ_lfarlc     DW ?            ; File address of relocation table
       MZ_ovno       DW ?            ; Overlay number
       MZ_res        DW 4 DUP(?)     ; Reserved words
       MZ_oemid      DW ?            ; OEM identifier (for MZ_oeminfo)
       MZ_oeminfo    DW ?            ; OEM information; MZ_oemid specific
       MZ_res2       DW 10 DUP(?)    ; Reserved words
       MZ_lfanew     DD ?            ; File address of new exe header
   IMAGE_DOS_HEADER ENDS             ;

   IMAGE_VXD_HEADER STRUC            ; Windows VXD header
       VXD_magic         DW ?        ; Magic number
       VXD_border        DB ?        ; The byte ordering for the VXD
       VXD_worder        DB ?        ; The word ordering for the VXD
       VXD_level         DD ?        ; The EXE format level for now = 0
       VXD_cpu           DW ?        ; The CPU type
       VXD_os            DW ?        ; The OS type
       VXD_ver           DD ?        ; Module version
       VXD_mflags        DD ?        ; Module flags
       VXD_mpages        DD ?        ; Module # pages
       VXD_startobj      DD ?        ; Object # for instruction pointer
       VXD_eip           DD ?        ; Extended instruction pointer
       VXD_stackobj      DD ?        ; Object # for stack pointer
       VXD_esp           DD ?        ; Extended stack pointer
       VXD_pagesize      DD ?        ; VXD page size
       VXD_lastpagesize  DD ?        ; Last page size in VXD
       VXD_fixupsize     DD ?        ; Fixup section size
       VXD_fixupsum      DD ?        ; Fixup section checksum
       VXD_ldrsize       DD ?        ; Loader section size
       VXD_ldrsum        DD ?        ; Loader section checksum
       VXD_objtab        DD ?        ; Object table offset
       VXD_objcnt        DD ?        ; Number of objects in module
       VXD_objmap        DD ?        ; Object page map offset
       VXD_itermap       DD ?        ; Object iterated data map offset
       VXD_rsrctab       DD ?        ; Offset of Resource Table
       VXD_rsrccnt       DD ?        ; Number of resource entries
       VXD_restab        DD ?        ; Offset of resident name table
       VXD_enttab        DD ?        ; Offset of Entry Table
       VXD_dirtab        DD ?        ; Offset of Module Directive Table
       VXD_dircnt        DD ?        ; Number of module directives
       VXD_fpagetab      DD ?        ; Offset of Fixup Page Table
       VXD_frectab       DD ?        ; Offset of Fixup Record Table
       VXD_impmod        DD ?        ; Offset of Import Module Name Table
       VXD_impmodcnt     DD ?        ; Number of entries in Import Module Name Table
       VXD_impproc       DD ?        ; Offset of Import Procedure Name Table
       VXD_pagesum       DD ?        ; Offset of Per-Page Checksum Table
       VXD_datapage      DD ?        ; Offset of Enumerated Data Pages
       VXD_preload       DD ?        ; Number of preload pages
       VXD_nrestab       DD ?        ; Offset of Non-resident Names Table
       VXD_cbnrestab     DD ?        ; Size of Non-resident Name Table
       VXD_nressum       DD ?        ; Non-resident Name Table Checksum
       VXD_autodata      DD ?        ; Object # for automatic data object
       VXD_debuginfo     DD ?        ; Offset of the debugging information
       VXD_debuglen      DD ?        ; The length of the debugging info. in bytes
       VXD_instpreload   DD ?        ;  Number of instance pages in preload section of VXD file
       VXD_instdemand    DD ?        ;  Number of instance pages in demand load section of VXD file
       VXD_heapsize      DD ?        ;  Size of heap - for 16-bit apps
       VXD_res3          DB 12 DUP(?); Reserved words
       VXD_winresoff     DD ?        ;
       VXD_winreslen     DD ?        ;
       VXD_devid         DW ?        ; Device ID for VxD
       VXD_ddkver        DW ?        ; DDK version for VxD
   IMAGE_VXD_HEADER ENDS             ;


   ;ÄÄÄÄÄÄÄÄÄÄ´  PORTABLE EXE HEADER STRUCTURES ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   IMAGE_FILE_HEADER STRUC            ; Portable Exe File
       PE_Magic                 DD ?  ;
       Machine                  DW ?  ; Machine type
       NumberOfSections         DW ?  ; Number of sections
       TimeDateStamp            DD ?  ; Date and Time
       PointerToSymbolTable     DD ?  ; Pointer to Symbols
       NumberOfSymbols          DD ?  ; Number of Symbols
       SizeOfOptionalHeader     DW ?  ; Size of Optional Header
       Characteristics          DW ?  ; File characteristics
   IMAGE_FILE_HEADER ENDS             ;

   IMAGE_FILE_HEADER_SIZE       EQU SIZE IMAGE_FILE_HEADER

   IMAGE_DATA_DIRECTORY STRUC                         ; Image data directory
       DD_VirtualAddress DD ?                         ; Virtual address
       DD_Size           DD ?                         ; Virtual size
   IMAGE_DATA_DIRECTORY ENDS                          ;

   IMAGE_DIRECTORY_ENTRIES STRUC                      ; All directories
       DE_Export           IMAGE_DATA_DIRECTORY    ?  ;
       DE_Import           IMAGE_DATA_DIRECTORY    ?  ;
       DE_Resource         IMAGE_DATA_DIRECTORY    ?  ;
       DE_Exception        IMAGE_DATA_DIRECTORY    ?  ;
       DE_Security         IMAGE_DATA_DIRECTORY    ?  ;
       DE_BaseReloc        IMAGE_DATA_DIRECTORY    ?  ;
       DE_Debug            IMAGE_DATA_DIRECTORY    ?  ;
       DE_Copyright        IMAGE_DATA_DIRECTORY    ?  ;
       DE_GlobalPtr        IMAGE_DATA_DIRECTORY    ?  ;
       DE_TLS              IMAGE_DATA_DIRECTORY    ?  ;
       DE_LoadConfig       IMAGE_DATA_DIRECTORY    ?  ;
       DE_BoundImport      IMAGE_DATA_DIRECTORY    ?  ;
       DE_IAT              IMAGE_DATA_DIRECTORY    ?  ;
   IMAGE_DIRECTORY_ENTRIES ENDS                       ;

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
       ENDS                                           ;

   IMAGE_SECTION_HEADER STRUC                  ; Section hdr.
       SH_Name                 DB IMAGE_SIZEOF_SHORT_NAME DUP(?) ; name
                               UNION           ;
       SH_PhysicalAddress      DD BYTE PTR ?   ; Physical address
       SH_VirtualSize          DD ?            ; Virtual size
                               ENDS            ;
       SH_VirtualAddress       DD BYTE PTR ?   ; Virtual address
       SH_SizeOfRawData        DD ?            ; Raw data size
       SH_PointerToRawData     DD BYTE PTR ?   ; pointer to raw data
       SH_PointerToRelocations DD BYTE PTR ?   ; ...
       SH_PointerToLinenumbers DD BYTE PTR ?   ; ...... not really used
       SH_NumberOfRelocations  DW ?            ; ....
       SH_NumberOfLinenumbers  DW ?            ; ..
       SH_Characteristics      DD ?            ; flags
   IMAGE_SECTION_HEADER ENDS                   ;

   ; Relocation format.

   IMAGE_RELOCATION_DATA   RECORD {            ; relocation data
       RD_RelocType        :4                  ; type
       RD_RelocOffset      :12    }            ; address

   IMAGE_BASE_RELOCATION   STRUC               ; base relocation
       BR_VirtualAddress   DD    ?             ; Virtual address
       BR_SizeOfBlock      DD    ?             ; size of relocation block
       BR_TypeOffset       IMAGE_RELOCATION_DATA 1 DUP (?) ; relocation data
   IMAGE_BASE_RELOCATION   ENDS                ;

   IMAGE_LINENUMBER STRUC         ; Line numbers
                           UNION  ;
       LN_SymbolTableIndex DD ?   ; Sym. tbl. index of func. name if Linenr is 0.
       LN_VirtualAddress   DD ?   ; Virtual address of line number.
                           ENDS   ;
       Linenumber          DW ?   ; Line number.
   IMAGE_LINENUMBER ENDS          ;

   IMAGE_EXPORT_DIRECTORY STRUC                    ; Export Directory type
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
   IMAGE_EXPORT_DIRECTORY ENDS                     ;

   IMAGE_IMPORT_BY_NAME STRUC                      ; Import by name data type
       IBN_Hint DW 0;                              ; Hint entry
       IBN_Name DB 1 DUP (?)                       ; name
   IMAGE_IMPORT_BY_NAME ENDS                       ;

   IMAGE_THUNK_DATA STRUC                          ; Thunk data
                           UNION                   ;
       TD_AddressOfData    DD IMAGE_IMPORT_BY_NAME PTR ? ; Ptr to IMAGE_IMPORT_BY_NAME structure
       TD_Ordinal          DD ?                    ; Ordinal ORed with IMAGE_ORDINAL_FLAG
       TD_Function         DD BYTE PTR ?           ; Ptr to function (i.e. Function address after program load)
       TD_ForwarderString  DD BYTE PTR ?           ; Ptr to a forwarded API function.
                           ENDS                    ;
   IMAGE_THUNK_DATA ENDS                           ;

   COMMENT $
   ; Thread Local Storage

   IMAGE_TLS_DIRECTORY32 STRUC
       TLS_StartAddressOfRawData DD BYTE PTR ?
       TLS_EndAddressOfRawData   DD BYTE PTR ?
       TLS_AddressOfIndex        DD BYTE PTR ?
       TLS_AddressOfCallBacks    DD IMAGE_TLS_CALLBACK PTR ?
       TLS_SizeOfZeroFill        DD 0
       TLS_Characteristics       DD 0
       ENDS
       $


   IMAGE_IMPORT_DESCRIPTOR STRUC           ; Import descryptor
                             UNION         ;
       ID_Characteristics    DD ?          ; 0 for last null import descriptor
       ID_OriginalFirstThunk DD IMAGE_THUNK_DATA PTR ? ; RVA to original unbound IAT
                             ENDS          ;
       ID_TimeDateStamp      DD ?          ; 0 if not bound,
                                           ; -1 if bound, and real date\time stamp
                                           ;    in IMAGE_DIRECTORY_ENTRY_BOUND_IMPORT (new BIND)
                                           ; O.W. date/time stamp of DLL bound to (Old BIND)
       ID_ForwarderChain     DD ?          ; -1 if no forwarders
       ID_Name               DD BYTE PTR ? ; RVA to name of imported DLL
       ID_FirstThunk         DD IMAGE_THUNK_DATA PTR ?  ; RVA to IAT (if bound this IAT has actual addresses)
   IMAGE_IMPORT_DESCRIPTOR ENDS

   IMAGE_BOUND_IMPORT_DESCRIPTOR STRUC       ;
       BID_TimeDateStamp               DD ?  ;
       BID_OffsetModuleName            DW ?  ;
       BID_NumberOfModuleForwarderRefs DW ?  ;
   IMAGE_BOUND_IMPORT_DESCRIPTOR ENDS        ;

   IMAGE_BOUND_FORWARDER_REF STRUC           ;
       BFR_TimeDateStamp     DD ?            ;
       BFR_OffsetModuleName  DW ?            ;
       BFR_Reserved          DW ?            ;
   IMAGE_BOUND_FORWARDER_REF ENDS            ;


   IMAGE_RESOURCE_DIRECTORY STRUC            ;
       RD_Characteristics      DD ?          ;
       RD_TimeDateStamp        DD ?          ;
       RD_MajorVersion         DW ?          ;
       RD_MinorVersion         DW ?          ;
       RD_NumberOfNamedEntries DW ?          ;
       RD_NumberOfIdEntries    DW ?          ;
   IMAGE_RESOURCE_DIRECTORY ENDS             ;


   IMAGE_RESOURCE_DIRECTORY_ENTRY STRUC      ;
           UNION                             ;
           STRUC                             ;
           RDE_Offset RECORD  {              ;
           RDE_NameOffset:31                 ;
           RDE_NameIsString:1 }              ;
           ENDS                              ;
           RDE_Name DD ?                     ;
           RDE_Id   DW ?                     ;
           ENDS                              ;
           UNION                             ;
           RDE_OffsetToData DD ?             ;
           STRUC                             ;
           RDE_Directory RECORD     {        ;
           RDE_OffsetToDirectory:31          ;
           RDE_DataIsDirectory:1    }        ;
           ENDS                              ;
           ENDS                              ;
   IMAGE_RESOURCE_DIRECTORY_ENTRY ENDS       ;

   IMAGE_RESOURCE_DIRECTORY_STRING STRUC     ;
       RDS_Length     DW ?                   ;
       RDS_NameString DB 1 DUP(?)            ;
   IMAGE_RESOURCE_DIRECTORY_STRING ENDS      ;

   IMAGE_RESOURCE_DIR_STRING_U STRUC         ;
       RDSU_Length     DW ?                  ;
       RDSU_NameString DB 1 DUP (?)          ;
       ENDS                                  ;

   IMAGE_RESOURCE_DATA_ENTRY STRUC           ;
       REDE_OffsetToData DD ?                ;
       REDE_Size         DD ?                ;
       REDE_CodePage     DD ?                ;
       REDE_Reserved     DD ?                ;
   IMAGE_RESOURCE_DATA_ENTRY ENDS            ;

   IMAGE_DEBUG_DIRECTORY STRUC               ;
       DD_Characteristics   DD ?             ;
       DD_TimeDateStamp     DD ?             ;
       DD_MajorVersion      DW ?             ;
       DD_MinorVersion      DW ?             ;
       DD_Type              DD ?             ;
       DD_SizeOfData        DD ?             ;
       DD_AddressOfRawData  DD BYTE PTR ?    ;
       DD_PointerToRawData  DD BYTE PTR ?    ;
   IMAGE_DEBUG_DIRECTORY ENDS                ;


   IMAGE_COFF_SYMBOLS_HEADER STRUC            ;
       CSH_NumberOfSymbols      DD ?          ;
       CSH_LvaToFirstSymbol     DD BYTE PTR ? ;
       CSH_NumberOfLinenumbers  DD ?          ;
       CSH_LvaToFirstLinenumber DD BYTE PTR ? ;
       CSH_RvaToFirstByteOfCode DD BYTE PTR ? ;
       CSH_RvaToLastByteOfCode  DD BYTE PTR ? ;
       CSH_RvaToFirstByteOfData DD BYTE PTR ? ;
       CSH_RvaToLastByteOfData  DD BYTE PTR ? ;
   IMAGE_COFF_SYMBOLS_HEADER ENDS             ;

   IMAGE_DEBUG_MISC STRUC         ;
       DM_DataType  DD ?          ; type of misc data, see defines
       DM_Length    DD ?          ; total length of record, rounded to four
       DM_Unicode   DB ?          ; TRUE if data is unicode string
       DM_Reserved  DB 3 DUP(?)   ;
       DM_Data      DB 1 DUP(?)   ; Actual data
   IMAGE_DEBUG_MISC ENDS          ;

   IMAGE_SEPARATE_DEBUG_HEADER STRUC         ;
       SDH_Signature           DW ?          ;
       SDH_Flags               DW ?          ;
       SDH_Machine             DW ?          ;
       SDH_Characteristics     DW ?          ;
       SDH_TimeDateStamp       DD ?          ;
       SDH_CheckSum            DD ?          ;
       SDH_ImageBase           DD BYTE PTR ? ;
       SDH_SizeOfImage         DD ?          ;
       SDH_NumberOfSections    DD ?          ;
       SDH_ExportedNamesSize   DD ?          ;
       SDH_DebugDirectorySize  DD ?          ;
       SDH_SectionAlignment    DD ?          ;
       SDH_Reserved            DD 2 DUP (?)  ;
   IMAGE_SEPARATE_DEBUG_HEADER ENDS          ;

   IMPORT_OBJECT_HEADER STRUC         ;
       OH_Sig1           DW ?         ; Must be IMAGE_FILE_MACHINE_UNKNOWN
       OH_Sig2           DW ?         ; Must be IMPORT_OBJECT_HDR_SIG2.
       OH_Version        DW ?         ;
       OH_Machine        DW ?         ;
       OH_TimeDateStamp  DD ?         ; Time/date stamp
       OH_SizeOfData     DD ?         ; particularly useful for incremental links
                         UNION        ;
       OH_Ordinal        DW ?         ; if grf & IMPORT_OBJECT_ORDINAL
       OH_Hint           DW ?         ;
                         ENDS         ;
       OH_ImportType RECORD         { ;
                   OH_Type : 2        ; IMPORT_TYPE
                   OH_NameType : 3    ; IMPORT_NAME_TYPE
                   OH_Reserved : 11 } ; Reserved. Must be zero.
   IMPORT_OBJECT_HEADER  ENDS         ;

   ;ÄÄÄÄÄÄÄÄÄÄ´  CONTEXT STRUCTURES ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   FLOATING_SAVE_AREA STRUC
       ControlWord   DD ?
       StatusWord    DD ?
       TagWord       DD ?
       ErrorOffset   DD ?
       ErrorSelector DD ?
       DataOffset    DD ?
       DataSelector  DD ?
       RegisterArea  DB SIZE_OF_80387_REGISTERS DUP(?)
       Cr0NpxState   DD ?
   FLOATING_SAVE_AREA ENDS

   CONTEXT STRUC
       CONTEXT_ContextFlags DD ?
       CONTEXT_Dr0          DD ?
       CONTEXT_Dr1          DD ?
       CONTEXT_Dr2          DD ?
       CONTEXT_Dr3          DD ?
       CONTEXT_Dr6          DD ?
       CONTEXT_Dr7          DD ?

       CONTEXT_FloatSave    FLOATING_SAVE_AREA ?

       CONTEXT_SegGs DD ?
       CONTEXT_SegFs DD ?
       CONTEXT_SegEs DD ?
       CONTEXT_SegDs DD ?

       CONTEXT_Edi DD ?
       CONTEXT_Esi DD ?
       CONTEXT_Ebx DD ?
       CONTEXT_Edx DD ?
       CONTEXT_Ecx DD ?
       CONTEXT_Eax DD ?

       CONTEXT_Ebp    DD ?
       CONTEXT_Eip    DD ?
       CONTEXT_SegCs  DD ?
       CONTEXT_EFlags DD ?
       CONTEXT_Esp    DD ?
       CONTEXT_SegSs  DD ?

       CONTEXT_ExtendedRegisters DB MAXIMUM_SUPPORTED_EXTENSION DUP(?)
   CONTEXT ENDS


   ;ÄÄÄÄÄÄÄÄÄÄ´  SEH EXCEPTION HANDLER STRUCTURES ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   EXCEPTION_RECORD STRUC
       ER_ExceptionCode        DD ?
       ER_ExceptionFlags       DD ?
       ER_ExceptionRecord      DD EXCEPTION_RECORD PTR ?
       ER_ExceptionAddress     DD BYTE PTR ?
       ER_NumberParameters     DD ?
       ER_ExceptionInformation DD EXCEPTION_MAXIMUM_PARAMETERS DUP(?)
   EXCEPTION_RECORD ENDS

   EXCEPTION_POINTERS STRUC                          ;
       EP_ExceptionRecord  DD EXCEPTION_RECORD PTR ? ; pointer to exception rec
       EP_ContextRecord    DD CONTEXT PTR ?          ; pointer to a context
   EXCEPTION_POINTERS ENDS                           ;

   ;ÄÄÄÄÄÄÄÄÄÄ´  MISCLANCELLOUS STRUCTURES ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   MEMORY_BASIC_INFORMATION STRUC            ;
       MBI_BaseAddress       DD BYTE PTR ?   ;
       MBI_AllocationBase    DD BYTE PTR ?   ;
       MBI_AllocationProtect DD ?            ;
       MBI_RegionSize        DD ?            ;
       MBI_State             DD ?            ;
       MBI_Protect           DD ?            ;
       MBI_Type              DD ?            ;
   MEMORY_BASIC_INFORMATION ENDS             ;

   FILE_NOTIFY_INFORMATION STRUC             ;
       FNI_NextEntryOffset DD ?              ;
       FNI_Action          DD ?              ;
       FNI_FileNameLength  DD ?              ;
       FNI_FileName        DB 1 DUP(?)       ;
   FILE_NOTIFY_INFORMATION ENDS              ;

   MESSAGE_RESOURCE_ENTRY STRUC              ;
       MRE_Length DW ?                       ;
       MRE_Flags  DW ?                       ;
       MRE_Text   DB 1 DUP(?)                ;
   MESSAGE_RESOURCE_ENTRY ENDS               ;

   MESSAGE_RESOURCE_BLOCK STRUC              ;
       MRB_LowId           DD ?              ;
       MRB_HighId          DD ?              ;
       MRB_OffsetToEntries DD ?              ;
   MESSAGE_RESOURCE_BLOCK ENDS               ;

   MESSAGE_RESOURCE_DATA STRUC                            ;
       MRD_NumberOfBlocks DD ?                            ;
       MRD_Blocks         MESSAGE_RESOURCE_BLOCK 1 DUP(?) ;
   MESSAGE_RESOURCE_DATA ENDS                             ;

   EVENTLOGRECORD STRUC
       ELR_Length               DD ?  ; Length of full record
       ELR_Reserved             DD ?  ; Used by the service
       ELR_RecordNumber         DD ?  ; Absolute record number
       ELR_TimeGenerated        DD ?  ; Seconds since 1-1-1970
       ELR_TimeWritten          DD ?  ; Seconds since 1-1-1970
       ELR_EventID              DD ?  ;
       ELR_EventType            DW ?  ;
       ELR_NumStrings           DW ?  ;
       ELR_EventCategory        DW ?  ;
       ELR_ReservedFlags        DW ?  ; For use with paired events (auditing)
       ELR_ClosingRecordNumber  DD ?  ; For use with paired events (auditing)
       ELR_StringOffset         DD ?  ; Offset from beginning of record
       ELR_UserSidLength        DD ?  ;
       ELR_UserSidOffset        DD ?  ;
       ELR_DataLength           DD ?  ;
       ELR_DataOffset           DD ?  ; Offset from beginning of record
   EVENTLOGRECORD ENDS                ;

   OVERLAPPED STRUC                   ;
       O_Internal     DD ?            ;
       O_InternalHigh DD ?            ;
       O_Offset       DD ?            ;
       O_OffsetHigh   DD ?            ;
       O_hEvent       DD ?            ;
   OVERLAPPED ENDS                    ;

   SECURITY_ATTRIBUTES STRUC                  ;
       SA_nLength              DD ?           ;
       SA_lpSecurityDescriptor DD BYTE PTR ?  ;
       SA_bInheritHandle       DB ?           ;
   SECURITY_ATTRIBUTES ENDS                   ;

   PROCESS_INFORMATION STRUC                  ;
       PI_hProcess    DD ?                    ;
       PI_hThread     DD ?                    ;
       PI_dwProcessId DD ?                    ;
       PI_dwThreadId  DD ?                    ;
   PROCESS_INFORMATION ENDS                   ;

   FILETIME STRUC                             ;
       FT_dwLowDateTime  DD ?                 ;
       FT_dwHighDateTime DD ?                 ;
   FILETIME ENDS                              ;

   SYSTEMTIME STRUC                           ;
       ST_wYear         DW ?                  ;
       ST_wMonth        DW ?                  ;
       ST_wDayOfWeek    DW ?                  ;
       ST_wDay          DW ?                  ;
       ST_wHour         DW ?                  ;
       ST_wMinute       DW ?                  ;
       ST_wSecond       DW ?                  ;
       ST_wMilliseconds DW ?                  ;
   SYSTEMTIME ENDS                            ;


   SYSTEM_INFO STRUC                           ;
                                      UNION    ;
       SI_dwOemId                     DW ?     ; Obsolete field...do not use
                                      STRUC    ;
       SI_wProcessorArchitecture      DW ?     ;
       SI_wReserved                   DW ?     ;
                                      ENDS     ;
                                      ENDS     ;
       SI_dwPageSize                  DD ?     ;
       SI_lpMinimumApplicationAddress DD BYTE PTR ?
       SI_lpMaximumApplicationAddress DD BYTE PTR ?
       SI_dwActiveProcessorMask       DD ?     ;
       SI_dwNumberOfProcessors        DD ?     ;
       SI_dwProcessorType             DD ?     ;
       SI_dwAllocationGranularity     DD ?     ;
       SI_wProcessorLevel             DW ?     ;
       SI_wProcessorRevision          DW ?     ;
   SYSTEM_INFO ENDS                            ;

   MEMORYSTATUS STRUC                          ;
       MS_dwLength         DD ?                ;
       MS_dwMemoryLoad     DD ?                ;
       MS_dwTotalPhys      DD ?                ;
       MS_dwAvailPhys      DD ?                ;
       MS_dwTotalPageFile  DD ?                ;
       MS_dwAvailPageFile  DD ?                ;
       MS_dwTotalVirtual   DD ?                ;
       MS_dwAvailVirtual   DD ?                ;
   MEMORYSTATUS ENDS                           ;

   EXCEPTION_DEBUG_INFO STRUC                  ;
       EDI_ExceptionRecord EXCEPTION_RECORD ?  ;
       EDI_dwFirstChance DD ?                  ;
   EXCEPTION_DEBUG_INFO ENDS                   ;

   THREAD_START_ROUTINE STRUC                  ; I wasn't able to find a right
                        DD BYTE PTR ?          ; definition for this one
   THREAD_START_ROUTINE ENDS                   ;

   CREATE_THREAD_DEBUG_INFO STRUC              ;
       CTDI_hThread            DD ?            ;
       CTDI_lpThreadLocalBase  DD BYTE PTR ?   ;
       CTDI_lpStartAddress     DD BYTE PTR THREAD_START_ROUTINE
   CREATE_THREAD_DEBUG_INFO ENDS               ;

   CREATE_PROCESS_DEBUG_INFO STRUC               ;
       CPDI_hFile                 DD ?           ;
       CPDI_hProcess              DD ?           ;
       CPDI_hThread               DD ?           ;
       CPDI_lpBaseOfImage         DD BYTE PTR ?  ;
       CPDI_dwDebugInfoFileOffset DD ?           ;
       CPDI_nDebugInfoSize        DD ?           ;
       CPDI_lpThreadLocalBase     DD BYTE PTR ?  ;
       CPDI_lpStartAddress        DD BYTE PTR THREAD_START_ROUTINE
       CPDI_lpImageName           DD BYTE PTR ?  ;
       CPDI_fUnicode              DW ?           ;
   CREATE_PROCESS_DEBUG_INFO ENDS                ;

   EXIT_THREAD_DEBUG_INFO STRUC                  ;
       ETDI_dwExitCode DD ?                      ;
   EXIT_THREAD_DEBUG_INFO  ENDS                  ;

   EXIT_PROCESS_DEBUG_INFO STRUC                 ;
       EPDI_dwExitCode DD ?                      ;
   EXIT_PROCESS_DEBUG_INFO ENDS                  ;

   LOAD_DLL_DEBUG_INFO STRUC                     ;
       LDDI_hFile                 DD ?           ;
       LDDI_lpBaseOfDll           DD BYTE PTR ?  ;
       LDDI_dwDebugInfoFileOffset DD ?           ;
       LDDI_nDebugInfoSize        DD ?           ;
       LDDI_lpImageName           DD BYTE PTR ?  ;
       LDDI_fUnicode              DW ?           ;
   LOAD_DLL_DEBUG_INFO ENDS                      ;

   UNLOAD_DLL_DEBUG_INFO STRUC                   ;
       UDDI_lpBaseOfDll DD BYTE PTR ?            ;
   UNLOAD_DLL_DEBUG_INFO ENDS                    ;

   OUTPUT_DEBUG_STRING_INFO STRUC                ;
       ODSI_lpDebugStringData DD BYTE PTR ?      ;
       ODSI_fUnicode           DW ?              ;
       ODSI_nDebugStringLength DW ?              ;
   OUTPUT_DEBUG_STRING_INFO ENDS                 ;

   RIP_INFO STRUC
       RIP_dwError dd ?
       RIP_dwType  dd ?
   RIP_INFO ENDS

   DEBUG_EVENT STRUC                                         ;
       DEV_dwDebugEventCode   DD ?                           ;
       DEV_dwProcessId        DD ?                           ;
       DEV_dwThreadId         DD ?                           ;
                              UNION                          ;
       DEV_Exception          EXCEPTION_DEBUG_INFO       ?   ;
       DEV_CreateThread       CREATE_THREAD_DEBUG_INFO   ?   ;
       DEV_CreateProcessInfo  CREATE_PROCESS_DEBUG_INFO  ?   ;
       DEV_ExitThread         EXIT_THREAD_DEBUG_INFO     ?   ;
       DEV_ExitProcess        EXIT_PROCESS_DEBUG_INFO    ?   ;
       DEV_LoadDll            LOAD_DLL_DEBUG_INFO        ?   ;
       DEV_UnloadDll          UNLOAD_DLL_DEBUG_INFO      ?   ;
       DEV_DebugString        OUTPUT_DEBUG_STRING_INFO   ?   ;
       DEV_RipInfo            RIP_INFO                   ?   ;
                              ENDS                           ;
   DEBUG_EVENT ENDS                                          ;


   PROCESS_HEAP_ENTRY STRUC               ;
       lpData            DD BYTE PTR ?    ;
       cbData            DD ?             ;
       cbOverhead        DB ?             ;
       iRegionIndex      DB ?             ;
       wFlags            DW ?             ;
                         UNION            ;
                         STRUC            ;
       hMem              DD ?             ;
       dwReserved        DD 3 DUP(?)      ;
                         ENDS             ;
                         STRUC            ;
       dwCommittedSize   DD ?             ;
       dwUnCommittedSize DD ?             ;
       lpFirstBlock      DD BYTE PTR ?    ;
       lpLastBlock       DD BYTE PTR ?    ;
                         ENDS             ;
                         ENDS             ;
   PROCESS_HEAP_ENTRY ENDS                ;


   STARTUPINFO STRUC                      ;
       STI_cb              DD ?           ;
       STI_lpReserved      DD BYTE PTR ?  ;
       STI_lpDesktop       DD BYTE PTR ?  ;
       STI_lpTitle         DD BYTE PTR ?  ;
       STI_dwX             DD ?           ;
       STI_dwY             DD ?           ;
       STI_dwXSize         DD ?           ;
       STI_dwYSize         DD ?           ;
       STI_dwXCountChars   DD ?           ;
       STI_dwYCountChars   DD ?           ;
       STI_dwFillAttribute DD ?           ;
       STI_dwFlags         DD ?           ;
       STI_wShowWindow     DW ?           ;
       STI_cbReserved2     DW ?           ;
       STI_lpReserved2     DD BYTE PTR ?  ;
       STI_hStdInput       DD ?           ;
       STI_hStdOutput      DD ?           ;
       STI_hStdError       DD ?           ;
   STARTUPINFO ENDS                       ;

   WIN32_FIND_DATA STRUC                           ;
       WFD_dwFileAttributes     DD ?               ;
       WFD_ftCreationTime       FILETIME ?         ;
       WFD_ftLastAccessTime     FILETIME ?         ;
       WFD_ftLastWriteTime      FILETIME ?         ;
       WFD_nFileSizeHigh        DD ?               ;
       WFD_nFileSizeLow         DD ?               ;
       WFD_dwReserved0          DD ?               ;
       WFD_dwReserved1          DD ?               ;
       WFD_cFileName            DB MAX_PATH DUP(?) ;
       WFD_cAlternateFileName   DB 14 DUP(?)       ;
   WIN32_FIND_DATA ENDS                            ;

   WIN32_FILE_ATTRIBUTE_DATA STRUC                 ;
       WFAD_dwFileAttributes    DD ?               ;
       WFAD_ftCreationTime      FILETIME ?         ;
       WFAD_ftLastAccessTime    FILETIME ?         ;
       WFAD_ftLastWriteTime     FILETIME ?         ;
       WFAD_nFileSizeHigh       DD ?               ;
       WFAD_nFileSizeLow        DD ?               ;
   WIN32_FILE_ATTRIBUTE_DATA ENDS                  ;

   ;      ³ Misclancellous Structures and Equates ³
   ;ÄÄÄÄÄÄ´ as they appear in the Windows.inc     ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;      ³ file from TASM 5.0 include directory. ³

   RECT    struc
           rcLeft          dw      ?
           rcTop           dw      ?
           rcRight         dw      ?
           rcBottom        dw      ?
   RECT    ends

   ;  Window Class structure

   WNDCLASS struc
           clsStyle        dw      ?       ; class style
           clsLpfnWndProc  dd      ?
           clsCbClsExtra   dw      ?
           clsCbWndExtra   dw      ?
           clsHInstance    dw      ?       ; instance handle
           clsHIcon        dw      ?       ; class icon handle
           clsHCursor      dw      ?       ; class cursor handle
           clsHbrBackground dw     ?       ; class background brush
           clsLpszMenuName dd      ?       ; menu name
           clsLpszClassName dd     ?       ; far ptr to class name
   WNDCLASS ends

   TEXTMETRIC struc
       tmHeight        dw      ?
       tmAscent        dw      ?
       tmDescent       dw      ?
       tmIntLeading    dw      ?
       tmExtLeading    dw      ?
       tmAveCharWidth  dw      ?
       tmMaxCharWidth  dw      ?
       tmWeight        dw      ?
       tmItalic        db      ?
       tmUnderlined    db      ?
       tmStruckOut     db      ?
       tmFirstChar     db      ?
       tmLastChar      db      ?
       tmDefaultChar   db      ?
       tmBreakChar     db      ?
       tmPitch         db      ?
       tmCharSet       db      ?
       tmOverhang      dw      ?
       tmAspectX       dw      ?
       tmAspectY       dw      ?
   TEXTMETRIC ends

   LF_FACESIZE     EQU     32

   LOGFONT struc
       lfHeight          dw   ?
       lfWidth           dw   ?
       lfEscapement      dw   ?
       lfOrientation     dw   ?
       lfWeight          dw   ?
       lfItalic          db   ?
       lfUnderline       db   ?
       lfStrikeOut       db   ?
       lfCharSet         db   ?
       lfOutPrecision    db   ?
       lfClipPrecision   db   ?
       lfQuality         db   ?
       lfPitchAndFamily  db   ?
       lfFaceName        db   LF_FACESIZE dup(?)
   LOGFONT ends

   LOGBRUSH struc
       lbStyle         dw ?
       lbColor         dd ?
       lbHatch         dw ?
   LOGBRUSH ends

   ;  Text Drawing modes

   TRANSPARENT     = 1
   OPAQUE          = 2

   ; Mapping Modes

   MM_TEXT         =   1
   MM_LOMETRIC     =   2
   MM_HIMETRIC     =   3
   MM_LOENGLISH    =   4
   MM_HIENGLISH    =   5
   MM_TWIPS        =   6
   MM_ISOTROPIC    =   7
   MM_ANISOTROPIC  =   8

   ; Coordinate Modes

   ABSOLUTE        =   1
   RELATIVE        =   2

   ;  Stock Logical Objects

   WHITE_BRUSH         =  0
   LTGRAY_BRUSH        =  1
   GRAY_BRUSH          =  2
   DKGRAY_BRUSH        =  3
   BLACK_BRUSH         =  4
   NULL_BRUSH          =  5
   HOLLOW_BRUSH        =  5
   WHITE_PEN           =  6
   BLACK_PEN           =  7
   NULL_PEN            =  8
   DOT_MARKER          =  9
   OEM_FIXED_FONT      = 10
   ANSI_FIXED_FONT     = 11
   ANSI_VAR_FONT       = 12
   SYSTEM_FONT         = 13
   DEVICE_DEFAULT_FONT = 14
   DEFAULT_PALETTE     = 15
   SYSTEM_FIXED_FONT   = 16

   ; Brush Styles

   BS_SOLID        =   0
   BS_NULL         =   1
   BS_HOLLOW       =   BS_NULL
   BS_HATCHED      =   2
   BS_PATTERN      =   3
   BS_INDEXED      =   4
   BS_DIBPATTERN   =   5

   ; Hatch Styles

   HS_HORIZONTAL   =   0       ; -----
   HS_VERTICAL     =   1       ; |||||
   HS_FDIAGONAL    =   2       ; \\\\\
   HS_BDIAGONAL    =   3       ; /////
   HS_CROSS        =   4       ; +++++
   HS_DIAGCROSS    =   5       ; xxxxx

   ; Pen Styles

   PS_SOLID        =   0
   PS_DASH         =   1       ; -------
   PS_DOT          =   2       ; .......
   PS_DASHDOT      =   3       ; _._._._
   PS_DASHDOTDOT   =   4       ; _.._.._
   PS_NULL         =   5
   PS_INSIDEFRAME  =   6

   ; Device Parameters for GetDeviceCaps()

   DRIVERVERSION =0     ; Device driver version
   TECHNOLOGY    =2     ; Device classification
   HORZSIZE      =4     ; Horizontal size in millimeters
   VERTSIZE      =6     ; Vertical size in millimeters
   HORZRES       =8     ; Horizontal width in pixels
   VERTRES       =10    ; Vertical width in pixels
   BITSPIXEL     =12    ; Number of bits per pixel
   PLANES        =14    ; Number of planes
   NUMBRUSHES    =16    ; Number of brushes the device has
   NUMPENS       =18    ; Number of pens the device has
   NUMMARKERS    =20    ; Number of markers the device has
   NUMFONTS      =22    ; Number of fonts the device has
   NUMCOLORS     =24    ; Number of colors the device supports
   PDEVICESIZE   =26    ; Size required for device descriptor
   CURVECAPS     =28    ; Curve capabilities
   LINECAPS      =30    ; Line capabilities
   POLYGONALCAPS =32    ; Polygonal capabilities
   TEXTCAPS      =34    ; Text capabilities
   CLIPCAPS      =36    ; Clipping capabilities
   RASTERCAPS    =38    ; Bitblt capabilities
   ASPECTX       =40    ; Length of the X leg
   ASPECTY       =42    ; Length of the Y leg
   ASPECTXY      =44    ; Length of the hypotenuse

   LOGPIXELSX    =88    ; Logical pixels/inch in X
   LOGPIXELSY    =90    ; Logical pixels/inch in Y

   SIZEPALETTE   =104   ; Number of entries in physical palette
   NUMRESERVED   =106   ; Number of reserved entries in palette
   COLORRES      =108   ; Actual color resolution

   ; Device Capability Masks:

   ; Device Technologies
   DT_PLOTTER       =   0  ;  Vector plotter
   DT_RASDISPLAY    =   1  ;  Raster display
   DT_RASPRINTER    =   2  ;  Raster printer
   DT_RASCAMERA     =   3  ;  Raster camera
   DT_CHARSTREAM    =   4  ;  Character-stream, PLP
   DT_METAFILE      =   5  ;  Metafile, VDM
   DT_DISPFILE      =   6  ;  Display-file

   ; Curve Capabilities

   CC_NONE          =   0  ;  Curves not supported
   CC_CIRCLES       =   1  ;  Can do circles
   CC_PIE           =   2  ;  Can do pie wedges
   CC_CHORD         =   4  ;  Can do chord arcs
   CC_ELLIPSES      =   8  ;  Can do ellipese
   CC_WIDE          =   16 ;  Can do wide lines
   CC_STYLED        =   32 ;  Can do styled lines
   CC_WIDESTYLED    =   64 ;  Can do wide styled lines
   CC_INTERIORS     =   128;  Can do interiors

   ; Line Capabilities

   LC_NONE          =   0  ;  Lines not supported
   LC_POLYLINE      =   2  ;  Can do polylines
   LC_MARKER        =   4  ;  Can do markers
   LC_POLYMARKER    =   8  ;  Can do polymarkers
   LC_WIDE          =   16 ;  Can do wide lines
   LC_STYLED        =   32 ;  Can do styled lines
   LC_WIDESTYLED    =   64 ;  Can do wide styled lines
   LC_INTERIORS     =   128;  Can do interiors

   ; Polygonal Capabilities

   PC_NONE          =   0  ;  Polygonals not supported
   PC_POLYGON       =   1  ;  Can do polygons
   PC_RECTANGLE     =   2  ;  Can do rectangles
   PC_WINDPOLYGON   =   4  ;  Can do winding polygons
   PC_TRAPEZOID     =   4  ;  Can do trapezoids
   PC_SCANLINE      =   8  ;  Can do scanlines
   PC_WIDE          =   16 ;  Can do wide borders
   PC_STYLED        =   32 ;  Can do styled borders
   PC_WIDESTYLED    =   64 ;  Can do wide styled borders
   PC_INTERIORS     =   128;  Can do interiors

   ; Polygonal Capabilities

   CP_NONE          =   0  ;  No clipping of output
   CP_RECTANGLE     =   1  ;  Output clipped to rects

   ; Text Capabilities

   TC_OP_CHARACTER  =   0001h ;  Can do OutputPrecision   CHARACTER
   TC_OP_STROKE     =   0002h ;  Can do OutputPrecision   STROKE
   TC_CP_STROKE     =   0004h ;  Can do ClipPrecision     STROKE
   TC_CR_90         =   0008h ;  Can do CharRotAbility    90
   TC_CR_ANY        =   0010h ;  Can do CharRotAbility    ANY
   TC_SF_X_YINDEP   =   0020h ;  Can do ScaleFreedom      X_YINDEPENDENT
   TC_SA_DOUBLE     =   0040h ;  Can do ScaleAbility      DOUBLE
   TC_SA_INTEGER    =   0080h ;  Can do ScaleAbility      INTEGER
   TC_SA_CONTIN     =   0100h ;  Can do ScaleAbility      CONTINUOUS
   TC_EA_DOUBLE     =   0200h ;  Can do EmboldenAbility   DOUBLE
   TC_IA_ABLE       =   0400h ;  Can do ItalisizeAbility  ABLE
   TC_UA_ABLE       =   0800h ;  Can do UnderlineAbility  ABLE
   TC_SO_ABLE       =   1000h ;  Can do StrikeOutAbility  ABLE
   TC_RA_ABLE       =   2000h ;  Can do RasterFontAble    ABLE
   TC_VA_ABLE       =   4000h ;  Can do VectorFontAble    ABLE
   TC_RESERVED      =   8000h

   ; Raster Capabilities

   RC_BITBLT        =   1      ;  Can do standard BLT.
   RC_BANDING       =   2      ;  Device requires banding support
   RC_SCALING       =   4      ;  Device requires scaling support
   RC_BITMAP64      =   8      ;  Device can support >64K bitmap
   RC_GDI20_OUTPUT  =   0010h  ;  has 2.0 output calls
   RC_DI_BITMAP     =   0080h  ;  supports DIB to memory
   RC_PALETTE       =   0100h  ;  supports a palette
   RC_DIBTODEV      =   0200h  ;  supports DIBitsToDevice
   RC_BIGFONT       =   0400h  ;  supports >64K fonts
   RC_STRETCHBLT    =   0800h  ;  supports StretchBlt
   RC_FLOODFILL     =   1000h  ;  supports FloodFill
   RC_STRETCHDIB    =   2000h  ;  supports StretchDIBits

   ; palette entry flags

   PC_RESERVED     = 1    ; palette index used for animation
   PC_EXPLICIT     = 2    ; palette index is explicit to device
   PC_NOCOLLAPSE   = 4    ; do not match color to system palette

   ; DIB color table identifiers

   DIB_RGB_COLORS  = 0    ; color table in RGBTriples
   DIB_PAL_COLORS  = 1    ; color table in palette indices

   ;constants for Get/SetSystemPaletteUse()

   SYSPAL_STATIC   = 1
   SYSPAL_NOSTATIC = 2

   ; constants for CreateDIBitmap

   CBM_INIT        = 4    ; initialize bitmap

   ; Bitmap format constants

   BI_RGB          = 0
   BI_RLE8         = 1
   BI_RLE4         = 2

   ANSI_CHARSET    = 0
   SYMBOL_CHARSET  = 2
   OEM_CHARSET     = 255

   ;  styles for CombineRgn

   RGN_AND  = 1
   RGN_OR   = 2
   RGN_XOR  = 3
   RGN_DIFF = 4
   RGN_COPY = 5

   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´           END OF FILE            ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   ;                             wasn't it obvious ? ;-)
