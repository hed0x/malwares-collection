;-----------------------------------------
     CLIENT_ID         STRUCT     ;NTDDK
      UniqueProcess    DWORD ?
      UniqueThread     DWORD ?
     CLIENT_ID         ENDS
;-----------------------------------------
      OBJ_INHERIT            = 00000002H
      OBJ_PERMANENT          = 00000010H
      OBJ_EXCLUSIVE          = 00000020H
      OBJ_CASE_INSENSITIVE   = 00000040H
      OBJ_OPENIF             = 00000080H
      OBJ_OPENLINK           = 00000100H
      OBJ_VALID_ATTRIBUTES   = 000001F2H

     OBJECT_ATTRIBUTES STRUCT          ;NTDDK
      Length_          DWORD ?
      RootDirectory    DWORD ?
      ObjectName       DWORD ?
      Attributes       DWORD ?
      SecurityDescriptor DWORD ?
      SecurityQualityOfService DWORD ?
     OBJECT_ATTRIBUTES ENDS
;-----------------------------------------
     TIME_FIELDS      STRUC DWORD       ;NTDDK
      Year            WORD  ?   ;range [1601...]
      Month           WORD  ?   ;range [1..12]
      Day             WORD  ?   ;range [1..31]
      Hour            WORD  ?   ;range [0..23]
      Minute          WORD  ?   ;range [0..59]
      Second          WORD  ?   ;range [0..59]
      Milliseconds    WORD  ?   ;range [0..999]
      Weekday         WORD  ?   ;range [0..6] == [Sunday..Saturday]
     TIME_FIELDS      ENDS
;-----------------------------------------
     ELAPSED_TIME_FIELDS    STRUCT DWORD  ;EliCZ
      Years           WORD  ?   ;RtlTTETF sets to 0
      Months          WORD  ?   ;RtlTTETF sets to 0
      Days            WORD  ?
      Hours           WORD  ?
      Minutes         WORD  ?
      Seconds         WORD  ?
      Milliseconds    WORD  ?
     ELAPSED_TIME_FIELDS    ENDS
;-----------------------------------------
   CurrentThread     EQU -2         ;in both 9x and NT
   NtCurrentProcess  EQU -1         ;in NT
   W9xCurrentProcess EQU 7FFFFFFFH  ;in W9X
;-----------------------------------------
     LPWSTR   TYPEDEF  DWORD

     UNICODE_STRING    STRUCT          ;NTDDK
      Length_          USHORT ?
      MaximumLength    USHORT ?
      Buffer           LPWSTR ?
     UNICODE_STRING    ENDS
;-----------------------------------------
      ;Flags:
      LDR_INITIALIZED  EQU  1

     PEB_LDR_DATA                             STRUCT   ;EliCZ
      cbsize                                  DWORD ?  ;00 == 24H
      Flags                                   DWORD ?  ;04
      Unknown8                                DWORD ?  ;08
      InLoadOrderModuleListHead               DWORD ?  ;0C
      PreviousInLoadOrderLdrEntry             DWORD ?  ;10
      InMemoryOrderModuleListHead             DWORD ?  ;14
      PreviousInMemoryOrderLdrEntry           DWORD ?  ;18
      InInitializationOrderModuleListHead     DWORD ?  ;1C
      PreviousInInitializationOrderLdrEntry   DWORD ?  ;20
     PEB_LDR_DATA                             ENDS     ;size 24H
;-----------------------------------------
     ;Flags:
      LDRP_STATIC_LINK              = 00000002H
      LDRP_IMAGE_DLL                = 00000004H
      LDRP_LOAD_IN_PROGRESS         = 00001000H
      LDRP_UNLOAD_IN_PROGRESS       = 00002000H
      LDRP_ENTRY_PROCESSED          = 00004000H
      LDRP_ENTRY_INSERTED           = 00008000H
      LDRP_CURRENT_LOAD             = 00010000H
      LDRP_FAILED_BUILTIN_LOAD      = 00020000H
      LDRP_DONT_CALL_FOR_THREADS    = 00040000H
      LDRP_PROCESS_ATTACH_CALLED    = 00080000H
      LDRP_DEBUG_SYMBOLS_LOADED     = 00100000H
      LDRP_IMAGE_NOT_AT_BASE        = 00200000H
      LDRP_WX86_IGNORE_MACHINETYPE  = 00400000H

     LDR_ENTRY                               STRUCT   ;EliCZ
      NextInLoadOrderLdrEntry                DWORD ?  ;00
      PreviousInLoadOrderLdrEntry            DWORD ?  ;04
      NextInMemoryOrderLdrEntry              DWORD ?  ;08
      PreviousInMemoryOrderLdrEntry          DWORD ?  ;0C
      NextInInitializationOrderLdrEntry      DWORD ?  ;10
      PreviousInInitializationOrderLdrEntry  DWORD ?  ;14
      ModuleBase                             DWORD ?  ;18
      EntryPoint                             DWORD ?  ;1C
      ModuleSize                             DWORD ?  ;20
      ModuleFileName                         UNICODE_STRING <>  ;24
      ModuleBaseName                         UNICODE_STRING <>  ;2C
      Flags                                  DWORD ?  ;34
      LoadCount                               WORD ?  ;38
      TlsIndex                                WORD ?  ;3A
      LdrpHashTableEntry0                    DWORD ?  ;3C
      LdrpHashTableEntry1                    DWORD ?  ;40
      TimeStamp                              DWORD ?  ;44
     LDR_ENTRY                               ENDS     ;size 48H
;-----------------------------------------
      ;Flags:
      PROCESS_PARAMETERS_NORMALIZED = 1 ;pointers in structure are absolute
      ;if PP is denormalized, pointers are self-relative

     PROCESS_PARAMETERS STRUCT   ;EliCZ
      Unknown00         DWORD ?  ;00 == 1000H
      Unknown04         DWORD ?  ;04
      Flags             DWORD ?  ;08
      Unknown0C         DWORD ?  ;0C
      CsrConsoleInfo    DWORD ?  ;10  for Csr calls
      Unknown14         DWORD ?  ;14
      StdInputHandle    DWORD ?  ;18
      StdOutputHandle   DWORD ?  ;1C
      StdErrorHandle    DWORD ?  ;20
      CurrentDirectory  UNICODE_STRING <>  ;24
      DirectoryFlags    DWORD ?  ;2C   == 18H
      SearchPath        UNICODE_STRING <>  ;30
      ImagePath         UNICODE_STRING <>  ;38
      CommandLine       UNICODE_STRING <>  ;40
      Environment       DWORD ?  ;48
      Unknown4C         DWORD ?  ;4C
      Unknown50         DWORD ?  ;50
      Unknown54         DWORD ?  ;54
      Unknown58         DWORD ?  ;58
      Unknown5C         DWORD ?  ;5C
      Unknown60         DWORD ?  ;60
      Unknown64         DWORD ?  ;64
      Unknown68         DWORD ?  ;68
      Unknown6C         DWORD ?  ;6C
      WindowTitle       UNICODE_STRING <>  ;70
      WindowStation     UNICODE_STRING <>  ;78
      CommandLine2      UNICODE_STRING <>  ;80  ??
      Unknown88         DWORD 82H DUP (?)  ;88
     PROCESS_PARAMETERS ENDS               ;size 290H
;-----------------------------------------
   ;dwFlags:
      INHERITED_ADDRESS_SPACE       = 00000001H
      READ_IMAGEFILE_EXEC_OPTIONS   = 00000100H
      BEING_DEBUGGED                = 00010000H

     PEB                            STRUCT   ;EliCZ
      dwFlags                       DWORD ?  ;00
      Unknown04                     DWORD ?  ;04  == -1
      ImageBaseAddress              DWORD ?  ;08
      PebLdrData                    DWORD ?  ;0C  == *PEB_LDR_DATA
      ProcessParameters             DWORD ?  ;10  == *PROCESS_PARAMETERS
      SubSystemData                 DWORD ?  ;14  == 0
      ProgramHeap                   DWORD ?  ;18
      LockingContext                DWORD ?  ;1C  == FastPebLock
      LockRoutine                   DWORD ?  ;20  == RtlEnterCriticalSection
      UnlockRoutine                 DWORD ?  ;24  == RtlLeaveCriticalSection
      DirChange                     DWORD ?  ;28  == 1
      Unknown2C                     DWORD ?  ;2C  == apfnDispatch
      Unknown30                     DWORD ?  ;30  == 0
      Unknown34                     DWORD ?  ;34  == 0
      Unknown38                     DWORD ?  ;38  == 0
      Unknown3C                     DWORD ?  ;3C  == 0
      Unknown40                     DWORD ?  ;40  == TlsBitMap
      Unknown44                     DWORD ?  ;44  == 3FH
      Unknown48                     DWORD ?  ;48  == 0
      ProgramHeap02                 DWORD ?  ;4C
      ProgramHeap02a                DWORD ?  ;50
      InProgramHeap02               DWORD ?  ;54
      AnsiCodePage                  DWORD ?  ;58
      OemCodePage                   DWORD ?  ;5C
      UnicodeCodePage               DWORD ?  ;60
      NumberProcessors              DWORD ?  ;64
      GlobalFlag                    DWORD ?  ;68
      Unknown6C                     DWORD ?  ;6C  == 0
      CritSectTimeout               DWORD ?  ;70
      Unknown74                     DWORD ?  ;74
      HeapSegmentReserve            DWORD ?  ;78
      HeapSegementCommit            DWORD ?  ;7C
      HeapDeCommitTotalFreeTreshold DWORD ?  ;80  == 10000H
      HeapDeCommitFreeBlockTreshold DWORD ?  ;84  == 1000H
      Unknown88                     DWORD ?  ;88
      Unknown8C                     DWORD ?  ;8C  == 386H
      Unknown90                     DWORD ?  ;90  == RtlpProcessHeapsListBuffer
      Unknown94                     DWORD ?  ;94
      Unknown98                     DWORD ?  ;98  == 0
      Unknown9C                     DWORD ?  ;9C  == 14H
      UnknownA0                     DWORD ?  ;A0  == LoaderLock
      dwMajorVersion                DWORD ?  ;A4
      dwMinorVersion                DWORD ?  ;A8
      dwBuildNumber                  WORD ?  ;AC
      CSDVersion                     WORD ?  ;AE
      dwPlatformId                  DWORD ?  ;B0
      Subsystem                     DWORD ?  ;B4
      MajorSusbsytemVersion         DWORD ?  ;B8
      MinorSusbsytemVersion         DWORD ?  ;BC
      ProcessAffinityMask           DWORD ?  ;C0
      UnknownC4                     DWORD  044H DUP (?) ;C4
      SessionId                     DWORD ?  ;1D4
      Unknown1D8                    DWORD ?  ;1D8
      Unknown1DC                    DWORD ?  ;1DC
      Unknown1E0                    DWORD ?  ;1E0
      Unknown1E4                    DWORD ?  ;1E4
     PEB                            ENDS     ;size 1E8H,  NT4 size 150H
;-----------------------------------------
     TEB                   STRUCT             ;NTDDK + EliCZ
      ExceptionList        DWORD ?            ;00
      StackBase            DWORD ?            ;04
      StackLimit           DWORD ?            ;08
      SubSystemTib         DWORD ?            ;0C
      UNION
       FiberData           DWORD ?            ;10
       Version             DWORD ?            ;10
      ENDS
      ArbitraryUserPointer DWORD ?            ;14
      Self                 DWORD ?            ;18
      EnvironmentPtr       DWORD ?            ;1C
      ClientId             CLIENT_ID <>       ;20
      RpcHandle            DWORD ?            ;28
      TlsStorage           DWORD ?            ;2C
      pPEB                 DWORD ?            ;30
      LastErrorValue       DWORD ?            ;34  Get/SetLastError
      OwnedLocksCount      DWORD ?            ;38  aka CountOfOwnedCriticalSections
      Unknown3C            DWORD ?            ;3C
      Win32ThreadInfo      DWORD ?            ;40
      Unknown44            DWORD 020H DUP (?) ;44
      Locale               DWORD ?            ;C4
      UnknownC8            DWORD 17BH DUP (?) ;C8
      RealClientId         CLIENT_ID <>       ;6B4
      Unknown6BC           DWORD ?            ;6BC
      GdiClientId          CLIENT_ID <>       ;6C0
      GdiThreadLocalInfo   DWORD ?            ;6C8
      Win32ClientInfo      DWORD ?            ;6CC  probably array
      Unknown6D0           DWORD 149H DUP (?) ;6D0
      LastStatusValue      DWORD ?            ;BF4
      WindowStation        UNICODE_STRING <>  ;BF8
      UnknownC00           DWORD 083H DUP (?) ;C00
      ThreadStack          DWORD ?            ;E0C
      UnknownE10           DWORD 043H DUP (?) ;E10
      RpcTls               DWORD ?            ;F1C  ptr to RPC_TLS
      UnknownF20           DWORD ?            ;F20
      UnknownF24           DWORD ?            ;F24
      HardErrorsMode       DWORD ?            ;F28
      UnknownF2C           DWORD 01BH DUP (?) ;F2C
      LogonLocale          DWORD ?            ;F98
      LogonLocale2         DWORD ?            ;F9C
      UnknownFA0           DWORD ?            ;FA0
     TEB                   ENDS               ;size FA4H,  NT4 size F88H
;-----------------------------------------
    ;Shared area in UM at 7FFE0000H, in KM at FFDF0000H
    ;of course read-only
     UP_KUSER_SHARED_DATA     = 7FFE0000H
     KUSER_SHARED_DATA        STRUCT             ;EliCZ
      TickCount               DWORD ?            ;00
      TickCountMultiplier     DWORD ?            ;04 ??
      ElapsedTime             QWORD ?            ;08
      ElapsedTimeCompareHigh  DWORD ?            ;10
      SystemTime              QWORD ?            ;14  LocalTime = SystemTime - TimeZoneBias
      SystemTimeCompareHigh   DWORD ?            ;1C
      TimeZoneBias            QWORD ?            ;20
      TimeZoneBiasCompareHigh DWORD ?            ;28
      ImageNumberLow           WORD ?            ;2C
      ImageNumberHigh          WORD ?            ;2E
      SystemRoot              WCHAR MAX_PATH DUP (?) ;30
      Unknown238              DWORD ?            ;238
      CryptoExponent          DWORD ?            ;23C
      TimeZoneId              DWORD ?            ;240
      Unknown244              DWORD 25H DUP (?)  ;244
     KUSER_SHARED_DATA        ENDS               ;size 2D8
;-----------------------------------------
     RPC_TLS               STRUCT             ;EliCZ
      fAsync               DWORD ?            ;00
      HandleToThread       DWORD ?            ;04
      HandleToThreadEvent  DWORD ?            ;08
      Context              DWORD ?            ;0C
      SecurityContext      DWORD ?            ;10
      BufferCacheArray     DWORD 008H DUP (?) ;14
      CancelTimeout        DWORD ?            ;34
      fCallCanceled        DWORD ?            ;38
      Unknown3C            DWORD ?            ;3C
      ExtendedStatus       DWORD ?            ;40
      SavedProcedure       DWORD ?            ;44
      SavedParameter       DWORD ?            ;48
      ActiveCall           DWORD ?            ;4C
      Unknown50            DWORD 004H DUP (?) ;50
     RPC_TLS               ENDS               ;size 60H
;-----------------------------------------
     SystemBasicInformation = 0
                                    ;EliCZ
     SYSTEM_BASIC_INFORMATION STRUCT DWORD
      Machine               DWORD ? ;pure fantasy; 0 = local ??
      MaximumIncrement      DWORD ?
      PageSize              DWORD ? ;1000
      PhysicalPages         DWORD ? ;KiloBytes = NoPages*(PageSize >> 0A)
      LowestPhysicalPage    DWORD ? ;1
      HighestPhysicalPage   DWORD ? ;1FFF
      AllocationGranularity DWORD ? ;10000
      LowestUserAddress     DWORD ? ;10000  ??
      HighestUserAddress    DWORD ? ;7FFEFFFF
      ActiveProcessors      DWORD ? ;mask
      NumberProcessors      BYTE  ?
     SYSTEM_BASIC_INFORMATION ENDS
;-----------------------------------------
     SystemProcessorInformation = 1
                                      ;EliCZ
     SYSTEM_PROCESSOR_INFORMATION STRUCT DWORD
      Architecture        WORD  ?
      Level               WORD  ?
      Revision            WORD  ?
      Reserved06          WORD  ? ;alignment
      FeatureBits         DWORD ?
     SYSTEM_PROCESSOR_INFORMATION ENDS

     FB_FASTSYSCALL       EQU  1000H
;-----------------------------------------
     SystemPerformanceInformation = 2
                                      ;EliCZ
     SYSTEM_PERFORMANCE_INFORMATION STRUCT DWORD
      IdleTime                QWORD ?  ;00
      ReadTransferCount       QWORD ?  ;08  ;Io data
      WriteTransferCount      QWORD ?  ;10
      OtherTransferCount      QWORD ?  ;18
      ReadOperationCount      DWORD ?  ;20
      WriteOperationCount     DWORD ?  ;24
      OtherOperationCount     DWORD ?  ;28
      AvailablePages          DWORD ?  ;2C  ;Mm data
      TotalCommittedPages     DWORD ?  ;30
      TotalCommitLimit        DWORD ?  ;34
      PeakCommitment          DWORD ?  ;38
      MemInfoCounter00        DWORD ?  ;3C
      MemInfoCounter01        DWORD ?  ;40
      MemInfoCounter02        DWORD ?  ;44
      MemInfoCounter03        DWORD ?  ;48
      MemInfoCounter04        DWORD ?  ;4C
      MemInfoCounter05        DWORD ?  ;50
      MemInfoCounter06        DWORD ?  ;54
      MemInfoCounter07        DWORD ?  ;58
      MemInfoCounter08        DWORD ?  ;5C
      MemInfoCounter09        DWORD ?  ;60
      MemInfoCounter10        DWORD ?  ;64
      MemInfoCounter11        DWORD ?  ;68
      MemInfoCounter12        DWORD ?  ;6C
      PagedPoolSize           DWORD ?  ;70
      NonpagedPoolSize        DWORD ?  ;74
      PoolUsage02             DWORD ?  ;78
      PoolUsage03             DWORD ?  ;7C
      PoolUsage05             DWORD ?  ;80
      PoolUsage06             DWORD ?  ;84
      TotalFreeSystemPtes     DWORD ?  ;88
      SystemCodePage          DWORD ?  ;8C
      TotalSystemDriverPages  DWORD ?  ;90
      TotalSystemCodePages    DWORD ?  ;94
      PoolUsage07             DWORD ?  ;98
      PoolUsage04             DWORD ?  ;9C
      UnknownA0               DWORD ?  ;A0
      SystemCachePage         DWORD ?  ;A4
      PagedPoolUsage          DWORD ?  ;A8
      SystemDriverPage        DWORD ?  ;AC
      FastReadNoWait          DWORD ?  ;B0  ;Cc data
      FastReadWait            DWORD ?  ;B4
      FastReadResourceMiss    DWORD ?  ;B8
      FastReadNotPossible     DWORD ?  ;BC
      FastMdlReadNoWait       DWORD ?  ;C0
      FastMdlReadWait         DWORD ?  ;C4
      FastMdlReadResourceMiss DWORD ?  ;C8
      FastMdlReadNotPossible  DWORD ?  ;CC
      MapDataNoWait           DWORD ?  ;D0
      MapDataWait             DWORD ?  ;D4
      MapDataNoWaitMiss       DWORD ?  ;D8
      MapDataWaitMiss         DWORD ?  ;DC
      PinMappedDataCount      DWORD ?  ;E0
      PinReadNoWait           DWORD ?  ;E4
      PinReadWait             DWORD ?  ;E8
      PinReadNoWaitMiss       DWORD ?  ;EC
      PinReadWaitMiss         DWORD ?  ;F0
      CopyReadNoWait          DWORD ?  ;F4
      CopyReadWait            DWORD ?  ;F8
      CopyReadNoWaitMiss      DWORD ?  ;FC
      CopyReadWaitMiss        DWORD ?  ;100
      MdlReadNoWait           DWORD ?  ;104
      MdlReadWait             DWORD ?  ;108
      MdlReadNoWaitMiss       DWORD ?  ;10C
      MdlReadWaitMiss         DWORD ?  ;110
      ReadAheadIos            DWORD ?  ;114
      LazyWriteIos            DWORD ?  ;118
      LazyWritePages          DWORD ?  ;11C
      DataFlushes             DWORD ?  ;120
      DataPages               DWORD ?  ;124
      ContextSwaps            DWORD ?  ;128  yes!
      PCRB4AC                 DWORD ?  ;12C  don't know
      PCRB4B8                 DWORD ?  ;130  don't know
      SyscallsCalled          DWORD ?  ;134  yes!
     SYSTEM_PERFORMANCE_INFORMATION ENDS
;-----------------------------------------
     SystemTimeInformation    = 3
                                      ;EliCZ
     SYSTEM_TIME_INFORMATION STRUCT
      BootTime            QWORD ?
      SystemTime          QWORD ?
      TimeZoneBias        QWORD ?
      CurrentTimeZoneId   QWORD ?
      BootTimeBias        QWORD ?
      InterruptTimeBias   QWORD ?
     SYSTEM_TIME_INFORMATION ENDS
;-----------------------------------------
     SystemPathInformation = 4  ;available via shared user data
;-----------------------------------------
     SystemProcessInformation = 5
                                      ;EliCZ
     THREAD_INFO_OFFSET    EQU 024H
     THREAD_INFO_SIZE      EQU 040H
     NT4_PROCESS_INFO_SIZE EQU 088H
     NT5_PROCESS_INFO_SIZE EQU 0B8H

    ;Thread states:
     TS_INITIALIZED    EQU 0
     TS_READY          EQU 1
     TS_RUNNING        EQU 2
     TS_STANDBY        EQU 3
     TS_TERMINATED     EQU 4
     TS_WAITING        EQU 5
     TS_TRANSITION     EQU 6
     TS_MAX            EQU 7

   ;see KWAIT
    ;Wait reasons (TS_WAITING):
     WR_EXECUTIVE      EQU 0
     WR_FREEPAGE       EQU 1
     WR_PAGEIN         EQU 2
     WR_POOLALLOC      EQU 3
     WR_DELAYEXEC      EQU 4
     WR_SUSPENDED      EQU 5
     WR_USERREQUEST    EQU 6
     ;7=0, 8=1, ... 13=6
     WR_EXECUTIVE_     EQU 7
     WR_FREEPAGE_      EQU 8
     WR_PAGEIN_        EQU 9
     WR_POOLALLOC_     EQU 10
     WR_DELAYEXEC_     EQU 11
     WR_SUSPENDED_     EQU 12
     WR_USERREQUEST_   EQU 13
     WR_EVENTPAIRHIGH  EQU 14
     WR_EVENTPAIRLOW   EQU 15  ;user wait for work queue
     WR_LPCRECEIVE     EQU 16
     WR_LPCREPLY       EQU 17
     WR_VIRTMEMORY     EQU 18
     WR_PAGEOUT        EQU 19
     WR_SPARE1         EQU 20
     WR_SPARE2         EQU 21
     WR_SPARE3         EQU 22
     WR_SPARE4         EQU 23
     WR_SPARE5         EQU 24
     WR_SPARE6         EQU 25
     WR_SPARE7         EQU 26
     WR_MAX            EQU 27


     SYSTEM_THREAD_INFORMATION STRUCT  ;size THREAD_INFO_SIZE
      KernelTime       QWORD ?           ;00
      UserTime         QWORD ?           ;08
      CreateTime       QWORD ?           ;10
      TickCount        DWORD ?           ;18
      StartAddress     DWORD ?           ;1C
      ClientId         CLIENT_ID <>      ;20
      DynamicPriority  DWORD ?           ;28
      BasePriority     DWORD ?           ;2C
      ContextSwitches  DWORD ?           ;30
      State            DWORD ?           ;34
      WaitReason       DWORD ?           ;38
      Reserved3C       DWORD ?           ;3C
     SYSTEM_THREAD_INFORMATION ENDS

     ;every process info is in block
     ;Unfortunately I lost my notes on missing structure members (context switches,
     ;faults, starting addresses, user and kernel time, working set size,number of handles..)

     NT4_SYSTEM_PROCESS_INFORMATION STRUCT
      SizeOfBlock                DWORD ?           ;00 NULL for info end
      ThreadCount                DWORD ?           ;04 number of threads in this block
      Reserved08                 DWORD 06H DUP (?) ;08
      CreateTime                 QWORD ?           ;20
      UserTime                   QWORD ?           ;28
      KernelTime                 QWORD ?           ;30
      ProcessName                UNICODE_STRING <> ;38
      Priority                   DWORD ?           ;40
      ProcessId                  DWORD ?           ;44
      ParentProcessId            DWORD ?           ;48
      HandleCount                DWORD ?           ;4C
      SessionId                  DWORD ?           ;50 ??
      Reserved54                 DWORD ?           ;54
      PeakVirtualSize            DWORD ?           ;58
      VirtualSize                DWORD ?           ;5C
      PageFaultCount             DWORD ?           ;60
      PeakWorkingSetSize         DWORD ?           ;64
      WorkingSetSize             DWORD ?           ;68
      QuotaPeakPagedPoolUsage    DWORD ?           ;6C
      QuotaPagedPoolUsage        DWORD ?           ;70
      QuotaPeakNonPagedPoolUsage DWORD ?           ;74
      QuotaNonPagedPoolUsage     DWORD ?           ;78
      PagefileUsage              DWORD ?           ;7C
      PeakPagefileUsage          DWORD ?           ;80
      PrivatePages               DWORD ?           ;84
      ;follows array of SYSTEM_THREAD_INFORMATIONs
      ThreadInformation SYSTEM_THREAD_INFORMATION <> ;88
     NT4_SYSTEM_PROCESS_INFORMATION ENDS

     NT5_SYSTEM_PROCESS_INFORMATION STRUCT
      SizeOfBlock                DWORD ?           ;00 NULL for info end
      ThreadCount                DWORD ?           ;04 number of threads in this block
      Reserved08                 DWORD 06H DUP (?) ;08
      CreateTime                 QWORD ?           ;20
      UserTime                   QWORD ?           ;28
      KernelTime                 QWORD ?           ;30
      ProcessName                UNICODE_STRING <> ;38
      Priority                   DWORD ?           ;40
      ProcessId                  DWORD ?           ;44
      ParentProcessId            DWORD ?           ;48
      HandleCount                DWORD ?           ;4C
      SessionId                  DWORD ?           ;50 ??
      Reserved54                 DWORD ?           ;54
      PeakVirtualSize            DWORD ?           ;58
      VirtualSize                DWORD ?           ;5C
      PageFaultCount             DWORD ?           ;60
      PeakWorkingSetSize         DWORD ?           ;64
      WorkingSetSize             DWORD ?           ;68
      QuotaPeakPagedPoolUsage    DWORD ?           ;6C
      QuotaPagedPoolUsage        DWORD ?           ;70
      QuotaPeakNonPagedPoolUsage DWORD ?           ;74
      QuotaNonPagedPoolUsage     DWORD ?           ;78
      PagefileUsage              DWORD ?           ;7C
      PeakPagefileUsage          DWORD ?           ;80
      PrivatePages               DWORD ?           ;84
      ReadOperationCount         QWORD ?           ;88
      WriteOperationCount        QWORD ?           ;90
      OtherOperationCount        QWORD ?           ;98
      ReadTransferCount          QWORD ?           ;A0
      WriteTransferCount         QWORD ?           ;A8
      OtherTransferCount         QWORD ?           ;B0
      ;follows array of SYSTEM_THREAD_INFORMATIONs
      ThreadInformation SYSTEM_THREAD_INFORMATION <> ;B8
     NT5_SYSTEM_PROCESS_INFORMATION ENDS

   IFDEF NT4
     SYSTEM_PROCESS_INFORMATION TEXTEQU <NT4_SYSTEM_PROCESS_INFORMATION>
   ELSE
     SYSTEM_PROCESS_INFORMATION TEXTEQU <NT5_SYSTEM_PROCESS_INFORMATION>
   ENDIF
;-----------------------------------------
     SystemSyscallInformation = 9

     ;Pointer in shadow table (at offset 4) must not be NULL (when this becomes?)
     ;Copied are dwords from this pointer

     SYSTEM_SYSCALL_INFORMATION STRUCT  ;EliCZ
      SizeOfBlock         DWORD ?
      SyscallTables       DWORD ?
      SizeOfTable00       DWORD ?  ;in dwords
      ;etc.. SizeOfTable(SyscallTables-1)
      ;follow copied tables:
      ;Table00 DWORD SizeOfTable00 DUP (?)
      ;etc.. Table(SyscallTables-1) DWORD SizeOfTable(SyscallTables-1) DUP (?)
     SYSTEM_SYSCALL_INFORMATION ENDS
;-----------------------------------------
     SystemGlobalFlagInformation = 9

     GF_SOE        = 00000001H ;Stop On Exception
     GF_SLS        = 00000002H ;Show Loader Snaps
     GF_DIC        = 00000004H ;Debug Initial Command
     GF_SHG        = 00000008H ;Stop on Hung GUI
     GF_HTC        = 00000010H ;Enable heap tail checking
     GF_HFC        = 00000020H ;Enable heap free checking
     GF_HPC        = 00000040H ;Enable heap parameter checking
     GF_HVC        = 00000080H ;Enable heap validation on call
     GF_PTC        = 00000100H ;Enable pool tail checking
     GF_PFC        = 00000200H ;Enable pool free checking
     GF_PTG        = 00000400H ;Enable pool tagging
     GF_HTG        = 00000800H ;Enable heap tagging
     GF_UST        = 00001000H ;Create user mode stack trace DB
     GF_KST        = 00002000H ;Create kernel mode stack trace DB
     GF_OTL        = 00004000H ;Maintain a list of objects for each type
     GF_HTD        = 00008000H ;Enable Heap Tagging By DLL
     GF_IDP        = 00010000H ;unused
     GF_D32        = 00020000H ;Enable debugging of Win32 Subsystem
     GF_KSL        = 00040000H ;Enable loading of kernel debugger symbols
     GF_DPS        = 00080000H ;Disable paging of kernel stacks
     GF_HAT        = 00100000H ;Enable Heap API Call Tracing
     GF_DHC        = 00200000H ;Disable Heap Coalesce on Free
     GF_ECE        = 00400000H ;Enable Close Exception
     GF_EEL        = 00800000H ;Enable Exception Logging
     GF_EOT        = 01000000H ;Enable Object Handle Type Tagging
     GF_HPA        = 02000000H ;Place heap allocations at ends of pages
     GF_DWL        = 04000000H ;Debug WINLOGON
     GF_DDP        = 08000000H ;Disable kernel mode DbgPrint output
     GF_ECC        = 10000000H ;Early CritSec Event Creation
     GF_DPD        = 80000000H ;Disable protected DLL verification

     FLG_STOP_ON_EXCEPTION           = GF_SOE
     FLG_SHOW_LDR_SNAPS              = GF_SLS
     FLG_DEBUG_INITIAL_COMMAND       = GF_DIC
     FLG_STOP_ON_HUNG_GUI            = GF_SHG

     FLG_HEAP_ENABLE_TAIL_CHECK      = GF_HTC ;user mode only
     FLG_HEAP_ENABLE_FREE_CHECK      = GF_HFC ;user mode only
     FLG_HEAP_VALIDATE_PARAMETERS    = GF_HPC ;user mode only
     FLG_HEAP_VALIDATE_ALL           = GF_HVC ;user mode only

     FLG_POOL_ENABLE_TAIL_CHECK      = GF_PTC ;kernel mode only
     FLG_POOL_ENABLE_FREE_CHECK      = GF_PFC ;kernel mode only
     FLG_POOL_ENABLE_TAGGING         = GF_PTG ;kernel mode only

     FLG_USER_STACK_TRACE_DB         = GF_UST ;user mode and x86 only
     FLG_KERNEL_STACK_TRACE_DB       = GF_KST ;kernel mode and x86 only
     FLG_MAINTAIN_OBJECT_TYPELIST    = GF_OTL ;kernel mode only
     FLG_WIN95_MODE                  = GF_HTD ;user mode and kernel mode

     FLG_IGNORE_DEBUG_PRIV           = GF_IDP ;kernel mode only
     FLG_ENABLE_CSRDEBUG             = GF_D32
     FLG_ENABLE_KDEBUG_SYMBOL_LOAD   = GF_KSL 
     FLG_DISABLE_PAGE_KERNEL_STACKS  = GF_DPS

     FLG_VALID_BITS                  = 000FF7FFH

     SYSTEM_GLOBALFLAG_INFORMATION STRUCT  ;EliCZ
      GlobalFlag             DWORD ?
     SYSTEM_GLOBALFLAG_INFORMATION ENDS
;-----------------------------------------
     SystemLoadedModuleInformation = 11

     SYSTEM_LOADEDMODULE STRUCT      ;EliCZ
      Unknown00       DWORD ?  ;00
      Unknown04       DWORD ?  ;04
      ModuleBase      DWORD ?  ;08
      ModuleSize      DWORD ?  ;0C
      Unknown10       DWORD ?  ;10
      Unknown14       DWORD ?  ;14
      Unknown18        WORD ?  ;18
      BaseNameOffset   WORD ?  ;1A
      ModuleFileName  CHAR 100H DUP (?) ;1C always ansi
     SYSTEM_LOADEDMODULE ENDS

     SYSTEM_LOADEDMODULE_INFORMATION STRUCT
      ModuleCount     DWORD ?
     ;follows array of SYSTEM_LOADEDMODULE structures
      ModuleInformation  SYSTEM_LOADEDMODULE <>  ;04
     SYSTEM_LOADEDMODULE_INFORMATION ENDS
;-----------------------------------------
     SystemHandleInformation = 16

      OT_DIRECTORY     = 02
      OT_SYMLINK       = 03
      OT_TOKEN         = 04
      OT_PROCESS       = 05
      OT_THREAD        = 06
      OT_JOB           = 07
      OT_EVENT         = 08
      OT_EVENTPAIR     = 09
      OT_MUTANT        = 10
      ;channel auditalarm ?
      OT_SEMAPHORE     = 12
      OT_TIMER         = 13
      OT_PROFILE       = 14
      OT_WINSTATION    = 15
      OT_DESKTOP       = 16
      OT_SECTION       = 17
      OT_KEY           = 18
      OT_PORT          = 19
      OT_WAIT          = 20
      OT_ADAPTER       = 21
      OT_CONTINUATION  = 22
      OT_DEVICE        = 23
      ;channel auditalarm ?
      OT_IOCOMPLETION  = 25
      OT_FILE          = 26

     SYSTEM_HANDLE    STRUCT   ;EliCZ
      ProcessId       DWORD ?
      ObjectType       BYTE ?
      Flags            BYTE ? ;0..7
      Handle           WORD ?
      ObjectPointer   DWORD ?
      Access          DWORD ?
     SYSTEM_HANDLE    ENDS

     SYSTEM_HANDLE_INFORMATION STRUCT
      HandleCount        DWORD ?
     ;follows array of SYSTEM_HANDLE structures
      HandleInformation  SYSTEM_HANDLE <>
     SYSTEM_HANDLE_INFORMATION ENDS
;-----------------------------------------
     SystemObjectInformation = 17  ;to be done

     SYSTEM_OBJECT_INFORMATION STRUCT  ;EliCZ
     SYSTEM_OBJECT_INFORMATION ENDS
;-----------------------------------------
     SystemPageFileInformation = 18

     SYSTEM_PAGEFILE_INFORMATION STRUCT ;EliCZ
      SizeOfBlock       DWORD ?    ;00  NULL for info end
      CurrentSize       DWORD ?    ;04  in pages
      TotalUsedPages    DWORD ?    ;08  in pages
      PeakUsedPages     DWORD ?    ;0C  in pages
      PagefileName      UNICODE_STRING <> ;10
     SYSTEM_PAGEFILE_INFORMATION ENDS
;-----------------------------------------
     SystemDebuggerInformation = 35

     SYSTEM_DEBUGGER_INFORMATION STRUCT  ;EliCZ
      KernelDebuggerEnabled    BYTE ?   ;i386kd
      KernelDebuggerNotPresent BYTE ?
     SYSTEM_DEBUGGER_INFORMATION ENDS
;-----------------------------------------
     SystemSingleProcessInformation = 53  ;NT5+

     SYSTEM_SESSIONPROCESS_INFORMATION STRUCT  ;EliCZ
      SessionId               DWORD ?
      BufferSize              DWORD ?
      Buffer                  DWORD ?   ;ptr to SYSTEM_PROCESS_INFORMATION
     SYSTEM_SESSIONPROCESS_INFORMATION ENDS
;-----------------------------------------
     ProcessBasicInformation  = 0

     PROCESS_BASIC_INFORMATION STRUCT  ;NTDDK
      ExitStatus       DWORD ?
      PebBaseAddress   DWORD ?
      AffinityMask     DWORD ?
      BasePriority     DWORD ?
      UniqueProcessId  DWORD ?
      InheritedFromUniqueProcessId DWORD ?
     PROCESS_BASIC_INFORMATION ENDS
;-----------------------------------------
     ProcessQuotaLimits = 1

     QUOTA_LIMITS  STRUCT   ;NTDDK corrected by EliCZ: size must be 20H
      PagedPoolLimit         DWORD ?
      NonPagedPoolLimit      DWORD ?
      MinimumWorkingSetSize  DWORD ?
      MaximumWorkingSetSize  DWORD ?
      PagefileLimit          DWORD ?
      Reserved14             DWORD ?   ;added (probably qword alignment)
      TimeLimit              QWORD ?
     QUOTA_LIMITS  ENDS
;-----------------------------------------
     ProcessIoCounters  = 2

     IO_COUNTERS  STRUCT  ;NTDDK corrected by EliCZ: NT4 :NOT_SUPPORTED, NT5: long integers
      ReadOperationCount   QWORD ? ;DWORD ?
      WriteOperationCount  QWORD ? ;DWORD ?
      OtherOperationCount  QWORD ? ;DWORD ?
      ReadTransferCount    QWORD ?
      WriteTransferCount   QWORD ?
      OtherTransferCount   QWORD ?
     IO_COUNTERS  ENDS
;-----------------------------------------
     ProcessVmCounters = 3

     VM_COUNTERS  STRUCT           ;NTDDK
      PeakVirtualSize               DWORD ?
      VirtualSize                   DWORD ?
      PageFaultCount                DWORD ?
      PeakWorkingSetSize            DWORD ?
      WorkingSetSize                DWORD ?
      QuotaPeakPagedPoolUsage       DWORD ?
      QuotaPagedPoolUsage           DWORD ?
      QuotaPeakNonPagedPoolUsage    DWORD ?
      QuotaNonPagedPoolUsage        DWORD ?
      PagefileUsage                 DWORD ?
      PeakPagefileUsage             DWORD ?
     VM_COUNTERS   ENDS
;-----------------------------------------
     ProcessTimes = 4

     KERNEL_USER_TIMES STRUCT  ;NTDDK
      CreateTime    QWORD ?
      ExitTime      QWORD ?
      KernelTime    QWORD ?
      UserTime      QWORD ?
     KERNEL_USER_TIMES ENDS
;-----------------------------------------
     ProcessPooledUsageAndLimits = 14

     POOLED_USAGE_AND_LIMITS STRUCT ;NTDDK
      PeakPagedPoolUsage       DWORD ?
      PagedPoolUsage           DWORD ?
      PagedPoolLimit           DWORD ?
      PeakNonPagedPoolUsage    DWORD ?
      NonPagedPoolUsage        DWORD ?
      NonPagedPoolLimit        DWORD ?
      PeakPagefileUsage        DWORD ?
      PagefileUsage            DWORD ?
      PagefileLimit            DWORD ?
     POOLED_USAGE_AND_LIMITS ENDS
;-----------------------------------------
     ProcessWorkingSetWatch = 15

     PROCESS_WS_WATCH_INFORMATION STRUCT ;NTDDK
      FaultingPc  DWORD ?
      FaultingVa  DWORD ?
     PROCESS_WS_WATCH_INFORMATION ENDS
;-----------------------------------------
     ProcessDeviceMap = 23

     PROCESS_DEVICEMAP_INFORMATION STRUCT ;NTDDK
        DriveMap  DWORD ?
        DriveType WCHAR 32 DUP (?)
     PROCESS_DEVICEMAP_INFORMATION ENDS
;-----------------------------------------
     ThreadBasicInformation  = 0

     THREAD_BASIC_INFORMATION STRUCT    ;EliCZ
      ExitStatus       DWORD ?
      TebBaseAddress   DWORD ?
      ClientId         CLIENT_ID <>
      AffinityMask     DWORD ?
      BasePriority     DWORD ?
      DynamicPriority  DWORD ?
     THREAD_BASIC_INFORMATION ENDS
;-----------------------------------------
     ABOVE2GB          EQU 08000000H   ;for Windows 9x VirtualAlloc. (c) Matt Pietrek
;-----------------------------------------
     SE_MIN_WELL_KNOWN_PRIVILEGE       = 2
     SE_CREATE_TOKEN_PRIVILEGE         = 2
     SE_ASSIGNPRIMARYTOKEN_PRIVILEGE   = 3
     SE_LOCK_MEMORY_PRIVILEGE          = 4
     SE_INCREASE_QUOTA_PRIVILEGE       = 5
     SE_UNSOLICITED_INPUT_PRIVILEGE    = 6
     SE_MACHINE_ACCOUNT_PRIVILEGE      = 6
     SE_TCB_PRIVILEGE                  = 7
     SE_SECURITY_PRIVILEGE             = 8
     SE_TAKE_OWNERSHIP_PRIVILEGE       = 9
     SE_LOAD_DRIVER_PRIVILEGE          = 10
     SE_SYSTEM_PROFILE_PRIVILEGE       = 11
     SE_SYSTEMTIME_PRIVILEGE           = 12
     SE_PROF_SINGLE_PROCESS_PRIVILEGE  = 13
     SE_INC_BASE_PRIORITY_PRIVILEGE    = 14
     SE_CREATE_PAGEFILE_PRIVILEGE      = 15
     SE_CREATE_PERMANENT_PRIVILEGE     = 16
     SE_BACKUP_PRIVILEGE               = 17
     SE_RESTORE_PRIVILEGE              = 18
     SE_SHUTDOWN_PRIVILEGE             = 19
     SE_DEBUG_PRIVILEGE                = 20
     SE_AUDIT_PRIVILEGE                = 21
     SE_SYSTEM_ENVIRONMENT_PRIVILEGE   = 22
     SE_CHANGE_NOTIFY_PRIVILEGE        = 23
     SE_REMOTE_SHUTDOWN_PRIVILEGE      = 24
     SE_UNDOCK_PRIVILEGE               = 25
     SE_SYNC_AGENT_PRIVILEGE           = 26
     SE_ENABLE_DELEGATION_PRIVILEGE    = 27
     SE_MAX_WELL_KNOWN_PRIVILEGE       = SE_ENABLE_DELEGATION_PRIVILEGE

     ;For RtlAdjustPrivilege:
     ADJUST_CURRENT_PROCESS            = 0
     ADJUST_CURRENT_THREAD             = 1
;-----------------------------------------
