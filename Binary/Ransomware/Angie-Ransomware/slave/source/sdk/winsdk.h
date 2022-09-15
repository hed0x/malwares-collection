#ifndef SDK_WINSDK_INCLUDED
#define SDK_WINSDK_INCLUDED

/*
    "patched" windows.h wannabe header that removes all beta features and gives steroids on weak types and defines
*/

#define _INC_WINDOWS

#define _WIN32_WINNT  0x0601
#define _WIN32_IE     0x0800
#define NTDDI_VERSION 0x06010000
#define WINVER        0x0601

#define PRAGMA_PACK_PUSH(X)            __pragma(pack(push, X))
#define PRAGMA_PACK_POP(X)             __pragma(pack(pop))
#define PRAGMA_WARNING_SUPPRESS(X)     __pragma(warning(suppress:X))
#define PRAGMA_WARNING_DISABLE(X)      __pragma(warning(disable:X))
#define PRAGMA_WARNING_PUSH            __pragma(warning(push))
#define PRAGMA_WARNING_POP             __pragma(warning(pop))
#define PRAGMA_WARNING_DISABLE_PUSH(X) __pragma(warning(push, disable:X))
#define PRAGMA_WARNING_DISABLE_POP(X)  __pragma(warning(pop))
#define PRAGMA_LOOP_NOUNROLL           __pragma(nounroll)
#define PRAGMA_LOOP_UNROLL             __pragma(unroll)
#define PRAGMA_LOOP_UNROLL_N(X)        __pragma(unroll(X))
#define PRAGMA_OPTIMIZATION_LEVEL(X)   __pragma(intel optimization_level X)
#define PRAGMA_MESSAGE(X)              __pragma(message(X))
#define PRAGMA_NOINLINE                __pragma(noinline)

#define DECLSPEC_NAKED                 __declspec(naked)
#define DECLSPEC_NOINLINE              __declspec(noinline)
#define DECLSPEC_NORETURN              __declspec(noreturn)
#define DECLSPEC_DEPRECATED            __declspec(deprecated)
#define DECLSPEC_DEPRECATED_S(X)       __declspec(deprecated(X))
#define DECLSPEC_ALIGN_8               __declspec(align(8))
#define DECLSPEC_ALIGN_16              __declspec(align(16))
#define DECLSPEC_ALIGN(X)              __declspec(align(X))
#define DECLSPEC_INTRIN_TYPE           __declspec(intrin_type)
#define DECLSPEC_SELECTANY             __declspec(selectany)
#define DECLSPEC_DLLIMPORT             __declspec(dllimport)
#define DECLSPEC_DLLEXPORT             __declspec(dllexport)
#define DECLSPEC_SELECTANY             __declspec(selectany)

#define CDECL      __cdecl
#define STDCALL    __stdcall
#define FASTCALL   __fastcall
#define VECTORCALL __vectorcall

#define INLINE      __inline
#define FORCEINLINE __forceinline

#include <windef.h>
#include <winbase.h>
#include <no_sal2.h>

#ifdef __INTELLISENSE__
    #undef VOID

    typedef void VOID;
#endif

#define IO
#define NON
#define OPT

#undef NULL
#undef INVALID_HANDLE_VALUE
#undef DECLARE_HANDLE
#undef C_ASSERT

#define C_ASSERT(X)                         \
    PRAGMA_WARNING_SUPPRESS(344)            \
    typedef char __C_ASSERT__[(X) ? 1 : -1]

#define FASTMUL2(X)  ((X) << 1)
#define FASTMUL4(X)  ((X) << 2)
#define FASTMUL8(X)  ((X) << 3)
#define FASTMUL16(X) ((X) << 4)

#define FASTDIV2(X)  ((X) >> 1)
#define FASTDIV4(X)  ((X) >> 2)
#define FASTDIV8(X)  ((X) >> 3)
#define FASTDIV16(X) ((X) >> 4)

#define FASTMOD2(X)  ((X) & 0x1)
#define FASTMOD4(X)  ((X) & 0x3)
#define FASTMOD8(X)  ((X) & 0x7)
#define FASTMOD16(X) ((X) & 0xF)

#define __TOTEXT(X) #X
#define TOTEXT(X)   __TOTEXT(X)

#ifndef DEBUG
    #undef DBG_UNREFERENCED_PARAMETER(P)
    #undef DBG_UNREFERENCED_LOCAL_VARIABLE(V)

    #define DBG_UNREFERENCED_PARAMETER(P)       PRAGMA_MESSAGE("DBG_UNREFERENCED_PARAMETER - " TOTEXT(X))
    #define DBG_UNREFERENCED_LOCAL_VARIABLE(V)  PRAGMA_MESSAGE("DBG_UNREFERENCED_LOCAL_VARIABLE - " TOTEXT(X))
#endif

#define SIGNED    signed
#define UNSIGNED  unsigned
#define VOLATILE  volatile

#define PTR64 __ptr64
#define PTR32 __ptr32

#define MAKELONG64(L, H) ((ULONG64)(((ULONG32)(L)) | ((ULONG64)H) << 32))

typedef ULONG64 QWORD, *PQWORD;

PRAGMA_WARNING_DISABLE_PUSH(344) // invalid redeclaration of type name X

typedef double      DOUBLE,   *PDOUBLE;
typedef long double DOUBLE64, *PDOUBLE64;

typedef SHORT  SHORT_PTR,  *PSHORT_PTR;
typedef LONG64 LONG64_PTR, *PLONG64_PTR;
typedef LONG32 LONG32_PTR, *PLONG32_PTR;

typedef USHORT  USHORT_PTR,  *PUSHORT_PTR;
typedef ULONG64 ULONG64_PTR, *PULONG64_PTR;
typedef ULONG32 ULONG32_PTR, *PULONG32_PTR;
typedef QWORD   QWORD_PTR,   *PQWORD_PTR;

typedef ULONG_PTR   DWORD_PTR,   *PDWORD_PTR;
typedef ULONG64_PTR DWORD64_PTR, *PDWORD64_PTR;
typedef ULONG32_PTR DWORD32_PTR, *PDWORD32_PTR;

typedef const void  CVOID;

typedef VOID *      PVOID;
typedef VOID *PTR64 PVOID64;
typedef VOID *PTR32 PVOID32;

typedef CVOID *      PCVOID;
typedef CVOID *PTR64 PCVOID64;
typedef CVOID *PTR32 PCVOID32;

#define NULL   ((PVOID  )((ULONG_PTR )0))
#define NULL64 ((PVOID64)(ULONG64_PTR)0))
#define NULL32 ((PVOID32)(ULONG32_PTR)0))

#define IS_NULL(X)  (!(X))
#define NOT_NULL(X) (X)

typedef PVOID   HANDLE,   *PHANDLE;
typedef PVOID64 HANDLE64, *PHANDLE64;
typedef PVOID32 HANDLE32, *PHANDLE32;

#define INVALID_HANDLE_VALUE   ((HANDLE  )(ULONG_PTR  )-1)
#define INVALID_HANDLE_VALUE64 ((HANDLE64)(ULONG64_PTR)-1)
#define INVALID_HANDLE_VALUE32 ((HANDLE32)(ULONG32_PTR)-1)

#define IS_INVALID_HANDLE(X)  ((X) == -1)
#define NOT_INVALID_HANDLE(X) ((X) != -1)

PRAGMA_WARNING_DISABLE_POP(344)

#define PAGE_SIZE 0x1000

#define NtCurrentProcess() ((HANDLE)(LONG_PTR)-1)
#define NtCurrentThread()  ((HANDLE)(LONG_PTR)-2)

#define APPLICATION_ERROR_MASK       0x20000000
#define ERROR_SEVERITY_SUCCESS       0x00000000
#define ERROR_SEVERITY_INFORMATIONAL 0x40000000
#define ERROR_SEVERITY_WARNING       0x80000000
#define ERROR_SEVERITY_ERROR         0xC0000000

typedef LONG NTSTATUS, *PNTSTATUS;

#define NT_SUCCESS(Status) (((NTSTATUS)(Status)) >= 0)

#if 0
    #define NT_INFORMATION(Status) (((NTSTATUS)(Status)) >= (LONG )0x40000000)
    #define NT_WARNING(Status)     (((NTSTATUS)(Status)) <  (LONG )0xC0000000)
    #define NT_ERROR(Status)       (((NTSTATUS)(Status)) >= (ULONG)0xC0000000)
#else
    #define NT_INFORMATION(Status) ((((ULONG)(Status)) >> 30) == 1)
    #define NT_WARNING(Status)     ((((ULONG)(Status)) >> 30) == 2)
    #define NT_ERROR(Status)       ((((ULONG)(Status)) >> 30) == 3)
#endif

typedef struct _UNICODE_STRING {
    USHORT Length;
    USHORT MaximumLength;
    PWSTR  Buffer;
} UNICODE_STRING, *PUNICODE_STRING, *PTR64 LPUNICODE_STRING;

typedef struct _UNICODE_STRING32 {
    USHORT       Length;
    USHORT       MaximumLength;
    WCHAR *PTR32 Buffer;
} UNICODE_STRING32, *PUNICODE_STRING32, *PTR64 LPUNICODE_STRING32;

typedef struct _UNICODE_STRING64 {
    USHORT       Length;
    USHORT       MaximumLength;
    WCHAR *PTR64 Buffer;
} UNICODE_STRING64, *PUNICODE_STRING64, *PTR64 LPUNICODE_STRING64;

#define CONST_STRING(X)             \
    {                               \
        sizeof(X) - sizeof((X)[0]), \
        sizeof(X),                  \
        X                           \
    }

#define CONST_UNICODE_STRING CONST_STRING
#define CONST_ANSII_STRING   CONST_STRING

#define FILE_OPEN                    0x00000001
#define FILE_CREATE                  0x00000002
#define FILE_OPEN_IF                 0x00000003
#define FILE_OVERWRITE               0x00000004
#define FILE_OVERWRITE_IF            0x00000005

#define FILE_SYNCHRONOUS_IO_ALERT    0x00000010
#define FILE_SYNCHRONOUS_IO_NONALERT 0x00000020
#define FILE_NON_DIRECTORY_FILE      0x00000040
#define FILE_CREATE_TREE_CONNECTION  0x00000080
#define FILE_DIRECTORY_FILE          0x00000001

#define FILE_ANY_ACCESS     0
#define FILE_SPECIAL_ACCESS FILE_ANY_ACCESS
#define FILE_READ_ACCESS    FILE_READ_DATA
#define FILE_WRITE_ACCESS   FILE_WRITE_DATA

#define OBJ_INHERIT                         0x00000002
#define OBJ_PERMANENT                       0x00000010
#define OBJ_EXCLUSIVE                       0x00000020
#define OBJ_CASE_INSENSITIVE                0x00000040
#define OBJ_OPENIF                          0x00000080
#define OBJ_OPENLINK                        0x00000100
#define OBJ_KERNEL_HANDLE                   0x00000200
#define OBJ_FORCE_ACCESS_CHECK              0x00000400
#define OBJ_IGNORE_IMPERSONATED_DEVICEMAP   0x00000800
#define OBJ_DONT_REPARSE                    0x00001000
#define OBJ_VALID_ATTRIBUTES                0x00001FF2

typedef struct _OBJECT_ATTRIBUTES {
    ULONG Length;
    HANDLE RootDirectory;
    PUNICODE_STRING ObjectName;
    ULONG Attributes;
    PVOID SecurityDescriptor;
    PVOID SecurityQualityOfService;
} OBJECT_ATTRIBUTES, *POBJECT_ATTRIBUTES;

typedef struct _IO_STATUS_BLOCK {
    union {
        NTSTATUS Status;
        PVOID Pointer;
    };

    ULONG_PTR Information;
} IO_STATUS_BLOCK, *PIO_STATUS_BLOCK;

#define InitializeObjectAttributes(P, N, A, R, S)       \
    {                                                   \
        (P)->Length = sizeof(OBJECT_ATTRIBUTES);        \
        (P)->RootDirectory = R;                         \
        (P)->ObjectName = N;                            \
        (P)->Attributes = A;                            \
        (P)->SecurityDescriptor = S;                    \
        (P)->SecurityQualityOfService = NULL;           \
    }

#define RTL_CONSTANT_OBJECT_ATTRIBUTES(N, A) \
    {                                        \
        sizeof(OBJECT_ATTRIBUTES),           \
        NULL,                                \
        N,                                   \
        A,                                   \
        NULL,                                \
        NULL                                 \
    }

#define RTL_INIT_OBJECT_ATTRIBUTES(N, A) RTL_CONSTANT_OBJECT_ATTRIBUTES(N, A)

typedef enum _NT_PRODUCT_TYPE {
    NtProductWinNt    = 1,
    NtProductLanManNt = 2,
    NtProductServer   = 3
} NT_PRODUCT_TYPE;

typedef struct _KSYSTEM_TIMER {
    ULONG32 LowPart;
    LONG32  High1Part;
    LONG32  High2Part;
} KSYSTEM_TIME, *PKSYSTEM_TIME;

/* All "PF_*" are defined but not PROCESSOR_FEATURE_MAX :? */
#define PROCESSOR_FEATURE_MAX 64

#define USER_SHARED_DATA 0x7FFE0000

typedef struct _KUSER_SHARED_DATA {
    ULONG32 TickCountLowDeprecated;
    ULONG32 TickCountMultiplier;
    VOLATILE KSYSTEM_TIME InterruptTime;
    VOLATILE KSYSTEM_TIME SystemTime;
    VOLATILE KSYSTEM_TIME TimeZoneBias;
    UCHAR   Reserved1[0x04];
    WCHAR   NtSystemRoot[MAX_PATH];
    UCHAR   Reserved2[0x2C];
    NT_PRODUCT_TYPE NtProductType;
    BOOLEAN ProductTypeIsValid;
    UCHAR   Reserved3[0x01];
    USHORT  NativeProcessorArchitecture; /* Windows 8 and above */
    UCHAR   Reserved4[0x08];
    BOOLEAN ProcessorFeatures[PROCESSOR_FEATURE_MAX];
    UCHAR   Reserved5[0x0C];
    ULONG   AlternativeArchitecture;
    ULONG   BootId;
    BOOLEAN KdDebuggerEnabled;
    UCHAR   Reserved6[0x1C];
    ULONG   NumberOfPhysicalPages;
    BOOLEAN SafeBootMode;
    UCHAR   Reserved7[0x1B];
    ULONG   SystemCall;
    UCHAR   Reserved8[0x14];

    union {
        VOLATILE KSYSTEM_TIME TickCount;
        VOLATILE ULONG64 TickCountQuad;
    };
} KUSER_SHARED_DATA, *PKUSER_SHARED_DATA;

typedef struct _CLIENT_ID32 {
    ULONG32 UniqueProcess;
    ULONG32 UniqueThread;
} CLIENT_ID32, *PCLIENT_ID32;

typedef struct _CLIENT_ID64 {
    ULONG64 UniqueProcess;
    ULONG64 UniqueThread;
} CLIENT_ID64, *PCLIENT_ID64;

typedef struct _TEB32 {
    NT_TIB32 NtTib;
    PVOID32  EnvironmentPointer;
    CLIENT_ID32 ClientId;
    UCHAR    Reserved1[0x004];
    PVOID32  ThreadLocalStoragePointer;
    PVOID32  ProcessEnvironmentBlock;
    ULONG32  LastErrorValue;
    UCHAR    Reserved2[0x0088];
    PVOID    WOW32Reserved;
    UCHAR    Reserved3[0x0B30];
    ULONG32  LastStatusValue;
    UNICODE_STRING32 StaticUnicodeString;
    WCHAR    StaticUnicodeBuffer[MAX_PATH + 1];
    UCHAR    Reserved4[0x004];
    ULONG32  TlsSlots[TLS_MINIMUM_AVAILABLE];
    LIST_ENTRY32 TlsLinks;
    UCHAR    Reserved5[0x010];
    ULONG32  HardErrorMode;
} TEB32, *PTEB32;

typedef struct _TEB64 {
    NT_TIB64 NtTib;
    PVOID64  EnvironmentPointer;
    CLIENT_ID64 ClientId;
    UCHAR    Reserved1[0x0008];
    PVOID64  ThreadLocalStoragePointer;
    PVOID64  ProcessEnvironmentBlock;
    ULONG32  LastErrorValue;
    UCHAR    Reserved2[0x0094];
    PVOID64  WOW32Reserved;
    UCHAR    Reserved3[0x1148];
    ULONG32  LastStatusValue;
    UNICODE_STRING64 StaticUnicodeString;
    WCHAR    StaticUnicodeBuffer[MAX_PATH + 1];
    UCHAR    Reserved4[0x000E];
    ULONG64  TlsSlots[TLS_MINIMUM_AVAILABLE];
    LIST_ENTRY64 TlsLinks;
    UCHAR    Reserved5[0x0020];
    ULONG32  HardErrorMode;
} TEB64, *PTEB64;

#define FLG_STOP_ON_EXCEPTION           0x00000001
#define FLG_SHOW_LDR_SNAPS              0x00000002
#define FLG_DEBUG_INITIAL_COMMAND       0x00000004
#define FLG_STOP_ON_HUNG_GUI            0x00000008
#define FLG_HEAP_ENABLE_TAIL_CHECK      0x00000010
#define FLG_HEAP_ENABLE_FREE_CHECK      0x00000020
#define FLG_HEAP_VALIDATE_PARAMETERS    0x00000040
#define FLG_HEAP_VALIDATE_ALL           0x00000080
#define FLG_APPLICATION_VERIFIER        0x00000100
#define FLG_POOL_ENABLE_TAGGING         0x00000400
#define FLG_HEAP_ENABLE_TAGGING         0x00000800
#define FLG_USER_STACK_TRACE_DB         0x00001000
#define FLG_KERNEL_STACK_TRACE_DB       0x00002000
#define FLG_MAINTAIN_OBJECT_TYPELIST    0x00004000
#define FLG_HEAP_ENABLE_TAG_BY_DLL      0x00008000
#define FLG_DISABLE_STACK_EXTENSION     0x00010000
#define FLG_ENABLE_CSRDEBUG             0x00020000
#define FLG_ENABLE_KDEBUG_SYMBOL_LOAD   0x00040000
#define FLG_DISABLE_PAGE_KERNEL_STACKS  0x00080000
#define FLG_ENABLE_SYSTEM_CRIT_BREAKS   0x00100000
#define FLG_HEAP_DISABLE_COALESCING     0x00200000
#define FLG_ENABLE_CLOSE_EXCEPTIONS     0x00400000
#define FLG_ENABLE_EXCEPTION_LOGGING    0x00800000
#define FLG_ENABLE_HANDLE_TYPE_TAGGING  0x01000000
#define FLG_HEAP_PAGE_ALLOCS            0x02000000
#define FLG_DEBUG_INITIAL_COMMAND_EX    0x04000000
#define FLG_DISABLE_DBGPRINT            0x08000000
#define FLG_CRITSEC_EVENT_CREATION      0x10000000
#define FLG_LDR_TOP_DOWN                0x20000000
#define FLG_ENABLE_HANDLE_EXCEPTIONS    0x40000000
#define FLG_DISABLE_PROTDLLS            0x80000000
#define FLG_VALID_BITS                  0x7FFFFFFF

typedef struct _PEB32 {
    BOOLEAN InheritedAddressSpace;
    BOOLEAN ReadImageFileExecOptions;
    BOOLEAN BeingDebugged;
    UCHAR   Reserved1[0x005];
    PVOID32 ImageBaseAddress;
    PVOID32 Ldr;
    PVOID32 ProcessParameters;
    UCHAR   Reserved2[0x004];
    PVOID32 ProcessHeap;
    UCHAR   Reserved3[0x03C];
    PVOID32 AnsiCodePageData;
    PVOID32 OemCodePageData;
    PVOID32 UnicodeCaseTableData;
    ULONG32 NumberOfProcessors;
    ULONG32 NtGlobalFlag;
    LARGE_INTEGER CriticalSectionTimeout;
    ULONG32 HeapSegmentReserve;
    ULONG32 HeapSegmentCommit;
    ULONG32 HeapDeCommitTotalFreeThreshold;
    ULONG32 HeapDeCommitFreeBlockThreshold;
    ULONG32 NumberOfHeaps;
    ULONG32 MaximumNumberOfHeaps;
    PVOID32 ProcessHeaps;
    UCHAR   Reserved4[0x010];
    ULONG32 OSMajorVersion;
    ULONG32 OSMinorVersion;
    USHORT  OSBuildNumber;
    USHORT  OSCSDVersion;
    ULONG32 OSPlatformId;
    ULONG32 ImageSubsystem;
    ULONG32 ImageSubsystemMajorVersion;
    ULONG32 ImageSubsystemMinorVersion;
    ULONG32 ActiveProcessAffinityMask;
    UCHAR   Reserved5[0x3B4];
    ULONG32 NtGlobalFlag2; /* Don't use under Windows 7 */
} PEB32, *PPEB32;

typedef struct _PEB64 {
    BOOLEAN InheritedAddressSpace;
    BOOLEAN ReadImageFileExecOptions;
    BOOLEAN BeingDebugged;
    UCHAR   Reserved1[0x009];
    PVOID64 ImageBaseAddress;
    PVOID64 Ldr;
    PVOID64 ProcessParameters;
    UCHAR   Reserved2[0x008];
    PVOID64 ProcessHeap;
    UCHAR   Reserved3[0x068];
    PVOID64 AnsiCodePageData;
    PVOID64 OemCodePageData;
    PVOID64 UnicodeCaseTableData;
    ULONG32 NumberOfProcessors;
    ULONG32 NtGlobalFlag;
    LARGE_INTEGER CriticalSectionTimeout;
    ULONG64 HeapSegmentReserve;
    ULONG64 HeapSegmentCommit;
    ULONG64 HeapDeCommitTotalFreeThreshold;
    ULONG64 HeapDeCommitFreeBlockThreshold;
    ULONG32 NumberOfHeaps;
    ULONG32 MaximumNumberOfHeaps;
    PVOID64 ProcessHeaps;
    UCHAR   Reserved4[0x020];
    ULONG32 OSMajorVersion;
    ULONG32 OSMinorVersion;
    USHORT  OSBuildNumber;
    USHORT  OSCSDVersion;
    ULONG32 OSPlatformId;
    ULONG32 ImageSubsystem;
    ULONG32 ImageSubsystemMajorVersion;
    ULONG32 ImageSubsystemMinorVersion;
    ULONG32 ActiveProcessAffinityMask;
    UCHAR   Reserved5[0x68C];
    ULONG32 NtGlobalFlag2; /* Don't use under Windows 7 */
} PEB64, *PPEB64;

typedef struct _PEB_LDR_DATA32 {
    ULONG32 Length;
    BOOLEAN Initialized;
    PVOID32 SsHandle;
    LIST_ENTRY32 InLoadOrderModuleList;
    LIST_ENTRY32 InMemoryOrderModuleList;
    LIST_ENTRY32 InInitializationOrderModuleList;
    PVOID32 EntryInProgress;
    BOOLEAN ShutdownInProgress;
    PVOID32 ShutdownThreadId;
} PEB_LDR_DATA32, *PPEB_LDR_DATA32;

typedef struct _PEB_LDR_DATA64 {
    ULONG32 Length;
    BOOLEAN Initialized;
    PVOID64 SsHandle;
    LIST_ENTRY64 InLoadOrderModuleList;
    LIST_ENTRY64 InMemoryOrderModuleList;
    LIST_ENTRY64 InInitializationOrderModuleList;
    PVOID64 EntryInProgress;
    BOOLEAN ShutdownInProgress;
    PVOID64 ShutdownThreadId;
} PEB_LDR_DATA64, *PPEB_LDR_DATA64;

typedef enum _LDR_DLL_LOAD_REASON {
    LoadReasonStaticDependency           =  0,
    LoadReasonStaticForwarderDependency  =  1,
    LoadReasonDynamicForwarderDependency =  2,
    LoadReasonDelayloadDependency        =  3,
    LoadReasonDynamicLoad                =  4,
    LoadReasonAsImageLoad                =  5,
    LoadReasonAsDataLoad                 =  6,
    LoadReasonEnclavePrimary             =  7,
    LoadReasonEnclaveDependency          =  8,
    LoadReasonUnknown                    = -1
} LDR_DLL_LOAD_REASON, *PLDR_DLL_LOAD_REASON;

typedef struct _LDR_DATA_TABLE_ENTRY32 {
    LIST_ENTRY32 InLoadOrderLinks;
    LIST_ENTRY32 InMemoryOrderLinks;
    LIST_ENTRY32 InInitializationOrderLinks;
    PVOID32 DllBase;
    PVOID32 EntryPoint;
    ULONG32 SizeOfImage;
    UNICODE_STRING32 FullDllName;
    UNICODE_STRING32 BaseDllName;

    union {
        ULONG32 Flags;

        struct {
            ULONG32 PackagedBinary          : 1;
            ULONG32 MarkedForRemoval        : 1;
            ULONG32 ImageDll                : 1;
            ULONG32 LoadNotificationsSent   : 1;
            ULONG32 TelemetryEntryProcessed : 1;
            ULONG32 ProcessStaticImport     : 1;
            ULONG32 InLegacyLists           : 1;
            ULONG32 InIndexes               : 1;
            ULONG32 ShimDll                 : 1;
            ULONG32 InExceptionTable        : 1;
            ULONG32 ReservedFlags1          : 2;
            ULONG32 LoadInProgress          : 1;
            ULONG32 LoadConfigProcessed     : 1;
            ULONG32 EntryProcessed          : 1;
            ULONG32 ProtectDelayLoad        : 1;
            ULONG32 ReservedFlags3          : 2;
            ULONG32 DontCallForThreads      : 1;
            ULONG32 ProcessAttachCalled     : 1;
            ULONG32 ProcessAttachFailed     : 1;
            ULONG32 CorDeferredValidate     : 1;
            ULONG32 CorImage                : 1;
            ULONG32 DontRelocate            : 1;
            ULONG32 CorILOnly               : 1;
            ULONG32 ChpeImage               : 1;
            ULONG32 ReservedFlags5          : 2;
            ULONG32 Redirected              : 1;
            ULONG32 ReservedFlags6          : 2;
            ULONG32 CompatDatabaseProcessed : 1;
        };
    };

    UCHAR Reserve1[0x58];

    /* Windows 8 and above */
    ULONG32 BaseNameHashValue;
    LDR_DLL_LOAD_REASON LoadReason;
} LDR_DATA_TABLE_ENTRY32, *PLDR_DATA_TABLE_ENTRY32;

typedef struct _LDR_DATA_TABLE_ENTRY64 {
    LIST_ENTRY64 InLoadOrderLinks;
    LIST_ENTRY64 InMemoryOrderLinks;
    LIST_ENTRY64 InInitializationOrderLinks;
    PVOID64 DllBase;
    PVOID64 EntryPoint;
    ULONG32 SizeOfImage;
    UNICODE_STRING64 FullDllName;
    UNICODE_STRING64 BaseDllName;

    union {
        ULONG32 Flags;
    
        struct {
            ULONG32 PackagedBinary          : 1;
            ULONG32 MarkedForRemoval        : 1;
            ULONG32 ImageDll                : 1;
            ULONG32 LoadNotificationsSent   : 1;
            ULONG32 TelemetryEntryProcessed : 1;
            ULONG32 ProcessStaticImport     : 1;
            ULONG32 InLegacyLists           : 1;
            ULONG32 InIndexes               : 1;
            ULONG32 ShimDll                 : 1;
            ULONG32 InExceptionTable        : 1;
            ULONG32 ReservedFlags1          : 2;
            ULONG32 LoadInProgress          : 1;
            ULONG32 LoadConfigProcessed     : 1;
            ULONG32 EntryProcessed          : 1;
            ULONG32 ProtectDelayLoad        : 1;
            ULONG32 ReservedFlags3          : 2;
            ULONG32 DontCallForThreads      : 1;
            ULONG32 ProcessAttachCalled     : 1;
            ULONG32 ProcessAttachFailed     : 1;
            ULONG32 CorDeferredValidate     : 1;
            ULONG32 CorImage                : 1;
            ULONG32 DontRelocate            : 1;
            ULONG32 CorILOnly               : 1;
            ULONG32 ChpeImage               : 1;
            ULONG32 ReservedFlags5          : 2;
            ULONG32 Redirected              : 1;
            ULONG32 ReservedFlags6          : 2;
            ULONG32 CompatDatabaseProcessed : 1;
        };
    };

    UCHAR Reserve1[0x9C];

    /* Windows 8 and above */
    ULONG32 BaseNameHashValue;
    LDR_DLL_LOAD_REASON LoadReason;
} LDR_DATA_TABLE_ENTRY64, *PLDR_DATA_TABLE_ENTRY64;

typedef struct _CURDIR32 {
    UNICODE_STRING32 DosPath;
    PVOID32 Handle;
} CURDIR32, *PCURDIR32;

typedef struct _CURDIR64 {
    UNICODE_STRING64 DosPath;
    PVOID64 Handle;
} CURDIR64, *PCURDIR64;

typedef struct _RTL_USER_PROCESS_PARAMETERS32 {
    ULONG32  MaximumLength;
    ULONG32  Length;
    ULONG32  Flags;
    ULONG32  DebugFlags;
    PVOID32  ConsoleHandle;
    ULONG32  ConsoleFlags;
    PVOID32  StandardInput;
    PVOID32  StandardOutput;
    PVOID32  StandardError;
    CURDIR32 CurrentDirectory;
    UNICODE_STRING32 DllPath;
    UNICODE_STRING32 ImagePathName;
    UNICODE_STRING32 CommandLine;
    PVOID32  Environment;
    PVOID32  Reserve1[0x91];
    ULONG32  EnvironmentSize;
    ULONG32  EnvironmentVersion;
} RTL_USER_PROCESS_PARAMETERS32, *PRTL_USER_PROCESS_PARAMETERS32;

typedef struct _RTL_USER_PROCESS_PARAMETERS64 {
    ULONG32  MaximumLength;
    ULONG32  Length;
    ULONG32  Flags;
    ULONG32  DebugFlags;
    PVOID64  ConsoleHandle;
    ULONG32  ConsoleFlags;
    PVOID64  StandardInput;
    PVOID64  StandardOutput;
    PVOID64  StandardError;
    CURDIR64 CurrentDirectory;
    UNICODE_STRING64 DllPath;
    UNICODE_STRING64 ImagePathName;
    UNICODE_STRING64 CommandLine;
    PVOID64  Environment;
    PVOID32  Reserve1[0xDA];
    ULONG64  EnvironmentSize;
    ULONG64  EnvironmentVersion;
} RTL_USER_PROCESS_PARAMETERS64, *PRTL_USER_PROCESS_PARAMETERS64;

#ifdef _M_AMD64
    typedef CURDIR64                      CURDIR;
    typedef CLIENT_ID64                   CLIENT_ID;
    typedef TEB64                         TEB;
    typedef PEB64                         PEB;
    typedef PEB_LDR_DATA64                PEB_LDR_DATA;
    typedef LDR_DATA_TABLE_ENTRY64        LDR_DATA_TABLE_ENTRY;
    typedef RTL_USER_PROCESS_PARAMETERS64 RTL_USER_PROCESS_PARAMETERS;
    
    typedef PCURDIR64                      PCURDIR;
    typedef PCLIENT_ID64                   PCLIENT_ID;
    typedef PTEB64                         PTEB;
    typedef PPEB64                         PPEB;
    typedef PPEB_LDR_DATA64                PPEB_LDR_DATA;
    typedef PLDR_DATA_TABLE_ENTRY64        PLDR_DATA_TABLE_ENTRY;
    typedef PRTL_USER_PROCESS_PARAMETERS64 PRTL_USER_PROCESS_PARAMETERS;
#else
    typedef CURDIR64                      CURDIR;
    typedef CLIENT_ID32                   CLIENT_ID;
    typedef TEB32                         TEB;
    typedef PEB32                         PEB;
    typedef PEB_LDR_DATA32                PEB_LDR_DATA;
    typedef LDR_DATA_TABLE_ENTRY32        LDR_DATA_TABLE_ENTRY;
    typedef RTL_USER_PROCESS_PARAMETERS32 RTL_USER_PROCESS_PARAMETERS;

    typedef PCURDIR32                      PCURDIR;
    typedef PCLIENT_ID32                   PCLIENT_ID;
    typedef PTEB32                         PTEB;
    typedef PPEB32                         PPEB;
    typedef PPEB_LDR_DATA32                PPEB_LDR_DATA;
    typedef PLDR_DATA_TABLE_ENTRY32        PLDR_DATA_TABLE_ENTRY;
    typedef PRTL_USER_PROCESS_PARAMETERS32 PRTL_USER_PROCESS_PARAMETERS;
#endif

#define THREAD_CREATE_FLAGS_CREATE_SUSPENDED        0x00000001
#define THREAD_CREATE_FLAGS_SKIP_THREAD_ATTACH      0x00000002 // ?
#define THREAD_CREATE_FLAGS_HIDE_FROM_DEBUGGER      0x00000004
#define THREAD_CREATE_FLAGS_HAS_SECURITY_DESCRIPTOR 0x00000010 // ?
#define THREAD_CREATE_FLAGS_ACCESS_CHECK_IN_TARGET  0x00000020 // ?
#define THREAD_CREATE_FLAGS_INITIAL_THREAD          0x00000080

#define PS_ATTRIBUTE_NUMBER_MASK 0x0000FFFF
#define PS_ATTRIBUTE_THREAD      0x00010000 // may be used with thread creation
#define PS_ATTRIBUTE_INPUT       0x00020000 // input only
#define PS_ATTRIBUTE_ADDITIVE    0x00040000 // "accumulated" e.g. bitmasks, counters, etc.

typedef enum _PS_ATTRIBUTE_NUMBER {
    PsAttributeParentProcess,                // in HANDLE
    PsAttributeDebugPort,                    // in HANDLE
    PsAttributeToken,                        // in HANDLE
    PsAttributeClientId,                     // out PCLIENT_ID
    PsAttributeTebAddress,                   // out PTEB *
    PsAttributeImageName,                    // in PWSTR
    PsAttributeImageInfo,                    // out PSECTION_IMAGE_INFORMATION
    PsAttributeMemoryReserve,                // in PPS_MEMORY_RESERVE
    PsAttributePriorityClass,                // in UCHAR
    PsAttributeErrorMode,                    // in ULONG
    PsAttributeStdHandleInfo,                // 10, in PPS_STD_HANDLE_INFO
    PsAttributeHandleList,                   // in PHANDLE
    PsAttributeGroupAffinity,                // in PGROUP_AFFINITY
    PsAttributePreferredNode,                // in PUSHORT
    PsAttributeIdealProcessor,               // in PPROCESSOR_NUMBER
    PsAttributeUmsThread,                    // ? in PUMS_CREATE_THREAD_ATTRIBUTES
    PsAttributeMitigationOptions,            // in UCHAR
    PsAttributeProtectionLevel,              // in ULONG
    PsAttributeSecureProcess,                // since THRESHOLD
    PsAttributeJobList,
    PsAttributeChildProcessPolicy,           // since THRESHOLD2
    PsAttributeAllApplicationPackagesPolicy, // since REDSTONE
    PsAttributeWin32kFilter,
    PsAttributeSafeOpenPromptOriginClaim,
    PsAttributeBnoIsolation,                 // PS_BNO_ISOLATION_PARAMETERS
    PsAttributeDesktopAppPolicy,             // in ULONG
    PsAttributeChpe,                         // since REDSTONE3
    PsAttributeMax
} PS_ATTRIBUTE_NUMBER;

typedef struct _PS_ATTRIBUTE {
    ULONG_PTR Attribute;
    SIZE_T    Size;
    PVOID     Value;
    PSIZE_T   ReturnLength;
} PS_ATTRIBUTE, *PPS_ATTRIBUTE;

typedef struct _PS_ATTRIBUTE_LIST {
    SIZE_T TotalLength;
    PS_ATTRIBUTE Attributes[ANYSIZE_ARRAY];
} PS_ATTRIBUTE_LIST, *PPS_ATTRIBUTE_LIST;

#define MS_TO_100NS(X) (X * (1000000 / 100))

typedef enum _KEY_VALUE_INFORMATION_CLASS {
    KeyValueBasicInformation,
    KeyValueFullInformation,
    KeyValuePartialInformation,
    KeyValueFullInformationAlign64,
    KeyValuePartialInformationAlign64,
    KeyValueLayerInformation,
    MaxKeyValueInfoClass
} KEY_VALUE_INFORMATION_CLASS;

typedef struct _KEY_VALUE_BASIC_INFORMATION {
    ULONG TitleIndex;
    ULONG Type;
    ULONG NameLength;
    WCHAR Name[ANYSIZE_ARRAY];
} KEY_VALUE_BASIC_INFORMATION, *PKEY_VALUE_BASIC_INFORMATION;

typedef struct _KEY_VALUE_FULL_INFORMATION {
    ULONG TitleIndex;
    ULONG Type;
    ULONG DataOffset;
    ULONG DataLength;
    ULONG NameLength;
    WCHAR Name[ANYSIZE_ARRAY];
} KEY_VALUE_FULL_INFORMATION, *PKEY_VALUE_FULL_INFORMATION;

typedef struct _KEY_VALUE_PARTIAL_INFORMATION {
    ULONG TitleIndex;
    ULONG Type;
    ULONG DataLength;
    UCHAR Data[ANYSIZE_ARRAY];
} KEY_VALUE_PARTIAL_INFORMATION, *PKEY_VALUE_PARTIAL_INFORMATION;

typedef LONG KPRIORITY;
typedef VOID IO_APC_ROUTINE, *PIO_APC_ROUTINE;

typedef enum _KWAIT_REASON {
    Executive,
    FreePage,
    PageIn,
    PoolAllocation,
    DelayExecution,
    Suspended,
    UserRequest,
    WrExecutive,
    WrFreePage,
    WrPageIn,
    WrPoolAllocation,
    WrDelayExecution,
    WrSuspended,
    WrUserRequest,
    WrSpare0,
    WrQueue,
    WrLpcReceive,
    WrLpcReply,
    WrVirtualMemory,
    WrPageOut,
    WrRendezvous,
    WrKeyedEvent,
    WrTerminated,
    WrProcessInSwap,
    WrCpuRateControl,
    WrCalloutStack,
    WrKernel,
    WrResource,
    WrPushLock,
    WrMutex,
    WrQuantumEnd,
    WrDispatchInt,
    WrPreempted,
    WrYieldExecution,
    WrFastMutex,
    WrGuardedMutex,
    WrRundown,
    WrAlertByThreadId,
    WrDeferredPreempt,
    WrPhysicalFault,
    MaximumWaitReason
} KWAIT_REASON, *PKWAIT_REASON;

/* TODO: cleanup */
typedef enum _SYSTEM_INFORMATION_CLASS {
    SystemBasicInformation,                               // : SYSTEM_BASIC_INFORMATION
    SystemProcessorInformation,                           // : SYSTEM_PROCESSOR_INFORMATION
    SystemPerformanceInformation,                         // : SYSTEM_PERFORMANCE_INFORMATION
    SystemTimeOfDayInformation,                           // : SYSTEM_TIMEOFDAY_INFORMATION
    SystemPathInformation,                                // not implemented
    SystemProcessInformation,                             // : SYSTEM_PROCESS_INFORMATION
    SystemCallCountInformation,                           // : SYSTEM_CALL_COUNT_INFORMATION
    SystemDeviceInformation,                              // : SYSTEM_DEVICE_INFORMATION
    SystemProcessorPerformanceInformation,                // : SYSTEM_PROCESSOR_PERFORMANCE_INFORMATION
    SystemFlagsInformation,                               // : SYSTEM_FLAGS_INFORMATION
    SystemCallTimeInformation,                            // 10, not implemented
    SystemModuleInformation,                              // : RTL_PROCESS_MODULES
    SystemLocksInformation,
    SystemStackTraceInformation,
    SystemPagedPoolInformation,                           // not implemented
    SystemNonPagedPoolInformation,                        // not implemented
    SystemHandleInformation,                              // : SYSTEM_HANDLE_INFORMATION
    SystemObjectInformation,                              // : SYSTEM_OBJECTTYPE_INFORMATION mixed with SYSTEM_OBJECT_INFORMATION
    SystemPageFileInformation,                            // : SYSTEM_PAGEFILE_INFORMATION
    SystemVdmInstemulInformation,
    SystemVdmBopInformation,                              // 20, not implemented
    SystemFileCacheInformation,                           // : SYSTEM_FILECACHE_INFORMATION; s (requires SeIncreaseQuotaPrivilege) (info for WorkingSetTypeSystemCache)
    SystemPoolTagInformation,                             // : SYSTEM_POOLTAG_INFORMATION
    SystemInterruptInformation,                           // : SYSTEM_INTERRUPT_INFORMATION
    SystemDpcBehaviorInformation,                         // : SYSTEM_DPC_BEHAVIOR_INFORMATION; s: SYSTEM_DPC_BEHAVIOR_INFORMATION (requires SeLoadDriverPrivilege)
    SystemFullMemoryInformation,                          // not implemented
    SystemLoadGdiDriverInformation,                       // s (kernel-mode only)
    SystemUnloadGdiDriverInformation,                     // s (kernel-mode only)
    SystemTimeAdjustmentInformation,                      // : SYSTEM_QUERY_TIME_ADJUST_INFORMATION; s: SYSTEM_SET_TIME_ADJUST_INFORMATION (requires SeSystemtimePrivilege)
    SystemSummaryMemoryInformation,                       // not implemented
    SystemMirrorMemoryInformation,                        // 30, s (requires license value "Kernel-MemoryMirroringSupported") (requires SeShutdownPrivilege)
    SystemPerformanceTraceInformation,                    // s
    SystemObsolete0,                                      // not implemented
    SystemExceptionInformation,                           // : SYSTEM_EXCEPTION_INFORMATION
    SystemCrashDumpStateInformation,                      // s (requires SeDebugPrivilege)
    SystemKernelDebuggerInformation,                      // : SYSTEM_KERNEL_DEBUGGER_INFORMATION
    SystemContextSwitchInformation,                       // : SYSTEM_CONTEXT_SWITCH_INFORMATION
    SystemRegistryQuotaInformation,                       // : SYSTEM_REGISTRY_QUOTA_INFORMATION; s (requires SeIncreaseQuotaPrivilege)
    SystemExtendServiceTableInformation,                  // s (requires SeLoadDriverPrivilege) // loads win32k only
    SystemPrioritySeperation,                             // s (requires SeTcbPrivilege)
    SystemVerifierAddDriverInformation,                   // 40, s (requires SeDebugPrivilege)
    SystemVerifierRemoveDriverInformation,                // s (requires SeDebugPrivilege)
    SystemProcessorIdleInformation,                       // : SYSTEM_PROCESSOR_IDLE_INFORMATION
    SystemLegacyDriverInformation,                        // : SYSTEM_LEGACY_DRIVER_INFORMATION
    SystemCurrentTimeZoneInformation,
    SystemLookasideInformation,                           // : SYSTEM_LOOKASIDE_INFORMATION
    SystemTimeSlipNotification,                           // s (requires SeSystemtimePrivilege)
    SystemSessionCreate,                                  // not implemented
    SystemSessionDetach,                                  // not implemented
    SystemSessionInformation,                             // not implemented
    SystemRangeStartInformation,                          // 50, q
    SystemVerifierInformation,                            // : SYSTEM_VERIFIER_INFORMATION; s (requires SeDebugPrivilege)
    SystemVerifierThunkExtend,                            // s (kernel-mode only)
    SystemSessionProcessInformation,                      // : SYSTEM_SESSION_PROCESS_INFORMATION
    SystemLoadGdiDriverInSystemSpace,                     // s (kernel-mode only) (same as SystemLoadGdiDriverInformation)
    SystemNumaProcessorMap,
    SystemPrefetcherInformation,                          // : PREFETCHER_INFORMATION; s: PREFETCHER_INFORMATION // PfSnQueryPrefetcherInformation
    SystemExtendedProcessInformation,                     // : SYSTEM_PROCESS_INFORMATION
    SystemRecommendedSharedDataAlignment,
    SystemComPlusPackage,                                 // ; s
    SystemNumaAvailableMemory,                            // 60
    SystemProcessorPowerInformation,                      // : SYSTEM_PROCESSOR_POWER_INFORMATION
    SystemEmulationBasicInformation,
    SystemEmulationProcessorInformation,
    SystemExtendedHandleInformation,                      // : SYSTEM_HANDLE_INFORMATION_EX
    SystemLostDelayedWriteInformation,                    // : ULONG
    SystemBigPoolInformation,                             // : SYSTEM_BIGPOOL_INFORMATION
    SystemSessionPoolTagInformation,                      // : SYSTEM_SESSION_POOLTAG_INFORMATION
    SystemSessionMappedViewInformation,                   // : SYSTEM_SESSION_MAPPED_VIEW_INFORMATION
    SystemHotpatchInformation,                            // ; s
    SystemObjectSecurityMode,                             // 70, q
    SystemWatchdogTimerHandler,                           // s (kernel-mode only)
    SystemWatchdogTimerInformation,                       // (kernel-mode only); s (kernel-mode only)
    SystemLogicalProcessorInformation,                    // : SYSTEM_LOGICAL_PROCESSOR_INFORMATION
    SystemWow64SharedInformationObsolete,                 // not implemented
    SystemRegisterFirmwareTableInformationHandler,        // s (kernel-mode only)
    SystemFirmwareTableInformation,                       // not implemented
    SystemModuleInformationEx,                            // : RTL_PROCESS_MODULE_INFORMATION_EX
    SystemVerifierTriageInformation,                      // not implemented
    SystemSuperfetchInformation,                          // : SUPERFETCH_INFORMATION; s: SUPERFETCH_INFORMATION // PfQuerySuperfetchInformation
    SystemMemoryListInformation,                          // 80, q: SYSTEM_MEMORY_LIST_INFORMATION; s: SYSTEM_MEMORY_LIST_COMMAND (requires SeProfileSingleProcessPrivilege)
    SystemFileCacheInformationEx,                         // : SYSTEM_FILECACHE_INFORMATION; s (requires SeIncreaseQuotaPrivilege) (same as SystemFileCacheInformation)
    SystemThreadPriorityClientIdInformation,              // s: SYSTEM_THREAD_CID_PRIORITY_INFORMATION (requires SeIncreaseBasePriorityPrivilege)
    SystemProcessorIdleCycleTimeInformation,              // : SYSTEM_PROCESSOR_IDLE_CYCLE_TIME_INFORMATION[]
    SystemVerifierCancellationInformation,                // not implemented // name:wow64:whNT32QuerySystemVerifierCancellationInformation
    SystemProcessorPowerInformationEx,                    // not implemented
    SystemRefTraceInformation,                            // ; s // ObQueryRefTraceInformation
    SystemSpecialPoolInformation,                         // ; s (requires SeDebugPrivilege) // MmSpecialPoolTag, then MmSpecialPoolCatchOverruns != 0
    SystemProcessIdInformation,                           // : SYSTEM_PROCESS_ID_INFORMATION
    SystemErrorPortInformation,                           // s (requires SeTcbPrivilege)
    SystemBootEnvironmentInformation,                     // 90, q: SYSTEM_BOOT_ENVIRONMENT_INFORMATION
    SystemHypervisorInformation,                          // ; s (kernel-mode only)
    SystemVerifierInformationEx,                          // ; s
    SystemTimeZoneInformation,                            // s (requires SeTimeZonePrivilege)
    SystemImageFileExecutionOptionsInformation,           // s: SYSTEM_IMAGE_FILE_EXECUTION_OPTIONS_INFORMATION (requires SeTcbPrivilege)
    SystemCoverageInformation,                            // ; s // name:wow64:whNT32QuerySystemCoverageInformation; ExpCovQueryInformation
    SystemPrefetchPatchInformation,                       // not implemented
    SystemVerifierFaultsInformation,                      // s (requires SeDebugPrivilege)
    SystemSystemPartitionInformation,                     // : SYSTEM_SYSTEM_PARTITION_INFORMATION
    SystemSystemDiskInformation,                          // : SYSTEM_SYSTEM_DISK_INFORMATION
    SystemProcessorPerformanceDistribution,               // 100, q: SYSTEM_PROCESSOR_PERFORMANCE_DISTRIBUTION
    SystemNumaProximityNodeInformation,
    SystemDynamicTimeZoneInformation,                     // ; s (requires SeTimeZonePrivilege)
    SystemCodeIntegrityInformation,                       // // SeCodeIntegrityQueryInformation
    SystemProcessorMicrocodeUpdateInformation,            // s
    SystemProcessorBrandString,                           // // HaliQuerySystemInformation -> HalpGetProcessorBrandString, info class 23
    SystemVirtualAddressInformation,                      // : SYSTEM_VA_LIST_INFORMATION[]; s: SYSTEM_VA_LIST_INFORMATION[] (requires SeIncreaseQuotaPrivilege) // MmQuerySystemVaInformation
    SystemLogicalProcessorAndGroupInformation,            // : SYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX // since WIN7 // KeQueryLogicalProcessorRelationship
    SystemProcessorCycleTimeInformation,                  // : SYSTEM_PROCESSOR_CYCLE_TIME_INFORMATION[]
    SystemStoreInformation,                               // ; s // SmQueryStoreInformation
    SystemRegistryAppendString,                           // 110, s: SYSTEM_REGISTRY_APPEND_STRING_PARAMETERS
    SystemAitSamplingValue,                               // s: ULONG (requires SeProfileSingleProcessPrivilege)
    SystemVhdBootInformation,                             // : SYSTEM_VHD_BOOT_INFORMATION
    SystemCpuQuotaInformation,                            // ; s // PsQueryCpuQuotaInformation
    SystemNativeBasicInformation,                         // not implemented
    SystemSpare1,                                         // not implemented
    SystemLowPriorityIoInformation,                       // : SYSTEM_LOW_PRIORITY_IO_INFORMATION
    SystemTpmBootEntropyInformation,                      // : TPM_BOOT_ENTROPY_NT_RESULT // ExQueryTpmBootEntropyInformation
    SystemVerifierCountersInformation,                    // : SYSTEM_VERIFIER_COUNTERS_INFORMATION
    SystemPagedPoolInformationEx,                         // : SYSTEM_FILECACHE_INFORMATION; s (requires SeIncreaseQuotaPrivilege) (info for WorkingSetTypePagedPool)
    SystemSystemPtesInformationEx,                        // 120, q: SYSTEM_FILECACHE_INFORMATION; s (requires SeIncreaseQuotaPrivilege) (info for WorkingSetTypeSystemPtes)
    SystemNodeDistanceInformation,
    SystemAcpiAuditInformation,                           // : SYSTEM_ACPI_AUDIT_INFORMATION // HaliQuerySystemInformation -> HalpAuditQueryResults, info class 26
    SystemBasicPerformanceInformation,                    // : SYSTEM_BASIC_PERFORMANCE_INFORMATION // name:wow64:whNtQuerySystemInformation_SystemBasicPerformanceInformation
    SystemQueryPerformanceCounterInformation,             // : SYSTEM_QUERY_PERFORMANCE_COUNTER_INFORMATION // since WIN7 SP1
    SystemSessionBigPoolInformation,                      // since WIN8
    SystemBootGraphicsInformation,
    SystemScrubPhysicalMemoryInformation,
    SystemBadPageInformation,
    SystemProcessorProfileControlArea,
    SystemCombinePhysicalMemoryInformation,               // 130
    SystemEntropyInterruptTimingCallback,
    SystemConsoleInformation,
    SystemPlatformBinaryInformation,
    SystemThrottleNotificationInformation,
    SystemHypervisorProcessorCountInformation,
    SystemDeviceDataInformation,
    SystemDeviceDataEnumerationInformation,
    SystemMemoryTopologyInformation,
    SystemMemoryChannelInformation,
    SystemBootLogoInformation,                             // 140
    SystemProcessorPerformanceInformationEx,               // : SYSTEM_PROCESSOR_PERFORMANCE_INFORMATION_EX // since WINBLUE
    SystemSpare0,
    SystemSecureBootPolicyInformation,
    SystemPageFileInformationEx,                           // : SYSTEM_PAGEFILE_INFORMATION_EX
    SystemSecureBootInformation,
    SystemEntropyInterruptTimingRawInformation,
    SystemPortableWorkspaceEfiLauncherInformation,
    SystemFullProcessInformation,                          // : SYSTEM_PROCESS_INFORMATION with SYSTEM_PROCESS_INFORMATION_EXTENSION (requires admin)
    SystemKernelDebuggerInformationEx,                     // : SYSTEM_KERNEL_DEBUGGER_INFORMATION_EX
    SystemBootMetadataInformation,                         // 150
    SystemSoftRebootInformation,
    SystemElamCertificateInformation,
    SystemOfflineDumpConfigInformation,
    SystemProcessorFeaturesInformation,                    // : SYSTEM_PROCESSOR_FEATURES_INFORMATION
    SystemRegistryReconciliationInformation,
    SystemEdidInformation,
    SystemManufacturingInformation,                        // : SYSTEM_MANUFACTURING_INFORMATION // since THRESHOLD
    SystemEnergyEstimationConfigInformation,               // : SYSTEM_ENERGY_ESTIMATION_CONFIG_INFORMATION
    SystemHypervisorDetailInformation,                     // : SYSTEM_HYPERVISOR_DETAIL_INFORMATION
    SystemProcessorCycleStatsInformation,                  // : SYSTEM_PROCESSOR_CYCLE_STATS_INFORMATION // 160
    SystemVmGenerationCountInformation,
    SystemTrustedPlatformModuleInformation,                // : SYSTEM_TPM_INFORMATION
    SystemKernelDebuggerFlags,
    SystemCodeIntegrityPolicyInformation,
    SystemIsolatedUserModeInformation,
    SystemHardwareSecurityTestInterfaceResultsInformation,
    SystemSingleModuleInformation,                         // : SYSTEM_SINGLE_MODULE_INFORMATION
    SystemAllowedCpuSetsInformation,
    SystemDmaProtectionInformation,
    SystemInterruptCpuSetsInformation,
    SystemSecureBootPolicyFullInformation,
    SystemCodeIntegrityPolicyFullInformation,
    SystemAffinitizedInterruptProcessorInformation,
    SystemRootSiloInformation,                             // : SYSTEM_ROOT_SILO_INFORMATION
    MaxSystemInfoClass
} SYSTEM_INFORMATION_CLASS, *PSYSTEM_INFORMATION_CLASS;

typedef struct _SYSTEM_THREAD_INFORMATION {
    LARGE_INTEGER KernelTime;
    LARGE_INTEGER UserTime;
    LARGE_INTEGER CreateTime;
    ULONG WaitTime;
    PVOID StartAddress;
    CLIENT_ID ClientId;
    KPRIORITY Priority;
    LONG  BasePriority;
    ULONG ContextSwitches;
    ULONG ThreadState;
    KWAIT_REASON WaitReason;
} SYSTEM_THREAD_INFORMATION, *PSYSTEM_THREAD_INFORMATION;

typedef struct _SYSTEM_PROCESS_INFORMATION
{
    ULONG NextEntryOffset;
    ULONG NumberOfThreads;
    LARGE_INTEGER WorkingSetPrivateSize;  // since VISTA
    ULONG HardFaultCount;                 // since WIN7
    ULONG NumberOfThreadsHighWatermark;   // since WIN7
    ULONGLONG CycleTime;                  // since WIN7
    LARGE_INTEGER CreateTime;
    LARGE_INTEGER UserTime;
    LARGE_INTEGER KernelTime;
    UNICODE_STRING ImageName;
    KPRIORITY BasePriority;
    HANDLE UniqueProcessId;
    HANDLE InheritedFromUniqueProcessId;
    ULONG  HandleCount;
    ULONG  SessionId;
    ULONG_PTR UniqueProcessKey;           // since VISTA (requires SystemExtendedProcessInformation)
    SIZE_T PeakVirtualSize;
    SIZE_T VirtualSize;
    ULONG  PageFaultCount;
    SIZE_T PeakWorkingSetSize;
    SIZE_T WorkingSetSize;
    SIZE_T QuotaPeakPagedPoolUsage;
    SIZE_T QuotaPagedPoolUsage;
    SIZE_T QuotaPeakNonPagedPoolUsage;
    SIZE_T QuotaNonPagedPoolUsage;
    SIZE_T PagefileUsage;
    SIZE_T PeakPagefileUsage;
    SIZE_T PrivatePageCount;
    LARGE_INTEGER ReadOperationCount;
    LARGE_INTEGER WriteOperationCount;
    LARGE_INTEGER OtherOperationCount;
    LARGE_INTEGER ReadTransferCount;
    LARGE_INTEGER WriteTransferCount;
    LARGE_INTEGER OtherTransferCount;
    SYSTEM_THREAD_INFORMATION Threads[ANYSIZE_ARRAY]; // SystemProcessInformation
    // SYSTEM_EXTENDED_THREAD_INFORMATION Threads[ANYSIZE_ARRAY]; // SystemExtendedProcessinformation
    // SYSTEM_EXTENDED_THREAD_INFORMATION + SYSTEM_PROCESS_INFORMATION_EXTENSION // SystemFullProcessInformation
} SYSTEM_PROCESS_INFORMATION, *PSYSTEM_PROCESS_INFORMATION;

typedef enum _PROCESSINFOCLASS {
    ProcessBasicInformation,                     // q: PROCESS_BASIC_INFORMATION, PROCESS_EXTENDED_BASIC_INFORMATION
    ProcessQuotaLimits,                          // qs: QUOTA_LIMITS, QUOTA_LIMITS_EX
    ProcessIoCounters,                           // q: IO_COUNTERS
    ProcessVmCounters,                           // q: VM_COUNTERS, VM_COUNTERS_EX, VM_COUNTERS_EX2
    ProcessTimes,                                // q: KERNEL_USER_TIMES
    ProcessBasePriority,                         // s: KPRIORITY
    ProcessRaisePriority,                        // s: ULONG
    ProcessDebugPort,                            // q: HANDLE
    ProcessExceptionPort,                        // s: PROCESS_EXCEPTION_PORT
    ProcessAccessToken,                          // s: PROCESS_ACCESS_TOKEN
    ProcessLdtInformation,                       // qs: PROCESS_LDT_INFORMATION // 10
    ProcessLdtSize,                              // s: PROCESS_LDT_SIZE
    ProcessDefaultHardErrorMode,                 // qs: ULONG
    ProcessIoPortHandlers,                       // (kernel-mode only)
    ProcessPooledUsageAndLimits,                 // q: POOLED_USAGE_AND_LIMITS
    ProcessWorkingSetWatch,                      // q: PROCESS_WS_WATCH_INFORMATION[]; s: void
    ProcessUserModeIOPL,
    ProcessEnableAlignmentFaultFixup,            // s: BOOLEAN
    ProcessPriorityClass,                        // qs: PROCESS_PRIORITY_CLASS
    ProcessWx86Information,
    ProcessHandleCount,                          // q: ULONG, PROCESS_HANDLE_INFORMATION // 20
    ProcessAffinityMask,                         // s: KAFFINITY
    ProcessPriorityBoost,                        // qs: ULONG
    ProcessDeviceMap,                            // qs: PROCESS_DEVICEMAP_INFORMATION, PROCESS_DEVICEMAP_INFORMATION_EX
    ProcessSessionInformation,                   // q: PROCESS_SESSION_INFORMATION
    ProcessForegroundInformation,                // s: PROCESS_FOREGROUND_BACKGROUND
    ProcessWow64Information,                     // q: ULONG_PTR
    ProcessImageFileName,                        // q: UNICODE_STRING
    ProcessLUIDDeviceMapsEnabled,                // q: ULONG
    ProcessBreakOnTermination,                   // qs: ULONG
    ProcessDebugObjectHandle,                    // q: HANDLE // 30
    ProcessDebugFlags,                           // qs: ULONG
    ProcessHandleTracing,                        // q: PROCESS_HANDLE_TRACING_QUERY; s: size 0 disables, otherwise enables
    ProcessIoPriority,                           // qs: IO_PRIORITY_HINT
    ProcessExecuteFlags,                         // qs: ULONG
    ProcessResourceManagement,                   // ProcessTlsInformation // PROCESS_TLS_INFORMATION
    ProcessCookie,                               // q: ULONG
    ProcessImageInformation,                     // q: SECTION_IMAGE_INFORMATION
    ProcessCycleTime,                            // q: PROCESS_CYCLE_TIME_INFORMATION // since VISTA
    ProcessPagePriority,                         // q: PAGE_PRIORITY_INFORMATION
    ProcessInstrumentationCallback,              // qs: PROCESS_INSTRUMENTATION_CALLBACK_INFORMATION // 40
    ProcessThreadStackAllocation,                // s: PROCESS_STACK_ALLOCATION_INFORMATION, PROCESS_STACK_ALLOCATION_INFORMATION_EX
    ProcessWorkingSetWatchEx,                    // q: PROCESS_WS_WATCH_INFORMATION_EX[]
    ProcessImageFileNameWin32,                   // q: UNICODE_STRING
    ProcessImageFileMapping,                     // q: HANDLE (input)
    ProcessAffinityUpdateMode,                   // qs: PROCESS_AFFINITY_UPDATE_MODE
    ProcessMemoryAllocationMode,                 // qs: PROCESS_MEMORY_ALLOCATION_MODE
    ProcessGroupInformation,                     // q: USHORT[]
    ProcessTokenVirtualizationEnabled,           // s: ULONG
    ProcessConsoleHostProcess,                   // q: ULONG_PTR // ProcessOwnerInformation
    ProcessWindowInformation,                    // q: PROCESS_WINDOW_INFORMATION // 50
    ProcessHandleInformation,                    // q: PROCESS_HANDLE_SNAPSHOT_INFORMATION // since WIN8
    ProcessMitigationPolicy,                     // s: PROCESS_MITIGATION_POLICY_INFORMATION
    ProcessDynamicFunctionTableInformation,
    ProcessHandleCheckingMode,                   // qs: ULONG; s: 0 disables, otherwise enables
    ProcessKeepAliveCount,                       // q: PROCESS_KEEPALIVE_COUNT_INFORMATION
    ProcessRevokeFileHandles,                    // s: PROCESS_REVOKE_FILE_HANDLES_INFORMATION
    ProcessWorkingSetControl,                    // s: PROCESS_WORKING_SET_CONTROL
    ProcessHandleTable,                          // since WINBLUE
    ProcessCheckStackExtentsMode,
    ProcessCommandLineInformation,               // q: UNICODE_STRING // 60
    ProcessProtectionInformation,                // q: PS_PROTECTION
    ProcessMemoryExhaustion,                     // PROCESS_MEMORY_EXHAUSTION_INFO // since THRESHOLD
    ProcessFaultInformation,                     // PROCESS_FAULT_INFORMATION
    ProcessTelemetryIdInformation,               // PROCESS_TELEMETRY_ID_INFORMATION
    ProcessCommitReleaseInformation,             // PROCESS_COMMIT_RELEASE_INFORMATION
    ProcessDefaultCpuSetsInformation,
    ProcessAllowedCpuSetsInformation,
    ProcessSubsystemProcess,
    ProcessJobMemoryInformation,                 // PROCESS_JOB_MEMORY_INFO
    ProcessInPrivate,                            // since THRESHOLD2 // 70
    ProcessRaiseUMExceptionOnInvalidHandleClose,
    ProcessIumChallengeResponse,
    ProcessChildProcessInformation,              // PROCESS_CHILD_PROCESS_INFORMATION
    ProcessHighGraphicsPriorityInformation,
    ProcessSubsystemInformation,                 // q: SUBSYSTEM_INFORMATION_TYPE // since REDSTONE2
    ProcessEnergyValues,                         // PROCESS_ENERGY_VALUES, PROCESS_EXTENDED_ENERGY_VALUES
    ProcessActivityThrottleState,                // PROCESS_ACTIVITY_THROTTLE_STATE
    ProcessActivityThrottlePolicy,               // PROCESS_ACTIVITY_THROTTLE_POLICY
    ProcessWin32kSyscallFilterInformation,
    ProcessDisableSystemAllowedCpuSets,          // 80
    ProcessWakeInformation,                      // PROCESS_WAKE_INFORMATION
    ProcessEnergyTrackingState,                  // PROCESS_ENERGY_TRACKING_STATE
    ProcessManageWritesToExecutableMemory,       // MANAGE_WRITES_TO_EXECUTABLE_MEMORY // since REDSTONE3
    ProcessCaptureTrustletLiveDump,
    ProcessTelemetryCoverage,
    ProcessEnclaveInformation,
    ProcessEnableReadWriteVmLogging,             // PROCESS_READWRITEVM_LOGGING_INFORMATION
    ProcessUptimeInformation,                    // PROCESS_UPTIME_INFORMATION
    ProcessImageSection,
    ProcessDebugAuthInformation,                 // since REDSTONE4 // 90
    ProcessSystemResourceManagement,             // PROCESS_SYSTEM_RESOURCE_MANAGEMENT
    ProcessSequenceNumber,                       // q: ULONGLONG
    ProcessLoaderDetour,                         // since REDSTONE5
    ProcessSecurityDomainInformation,            // PROCESS_SECURITY_DOMAIN_INFORMATION
    ProcessCombineSecurityDomainsInformation,    // PROCESS_COMBINE_SECURITY_DOMAINS_INFORMATION
    ProcessEnableLogging,                        // PROCESS_LOGGING_INFORMATION
    ProcessLeapSecondInformation,                // PROCESS_LEAP_SECOND_INFORMATION
    MaxProcessInfoClass
} PROCESSINFOCLASS, *PPROCESSINFOCLASS;

typedef struct _PROCESS_DEVICEMAP_INFORMATION {
    union {
        struct {
            HANDLE DirectoryHandle;
        } Set;

        struct {
            ULONG DriveMap;
            UCHAR DriveType[32];
        } Query;
    };
} PROCESS_DEVICEMAP_INFORMATION, *PPROCESS_DEVICEMAP_INFORMATION;

#define PROCESS_LUID_DOSDEVICES_ONLY 0x00000001

typedef struct _PROCESS_DEVICEMAP_INFORMATION_EX {
    union {
        struct {
            HANDLE DirectoryHandle;
        } Set;

        struct {
            ULONG DriveMap;
            UCHAR DriveType[32];
        } Query;
    };

    ULONG Flags;
} PROCESS_DEVICEMAP_INFORMATION_EX, *PPROCESS_DEVICEMAP_INFORMATION_EX;

typedef enum _FILE_INFORMATION_CLASS {
    FileDirectoryInformation = 1,             // FILE_DIRECTORY_INFORMATION
    FileFullDirectoryInformation,             // FILE_FULL_DIR_INFORMATION
    FileBothDirectoryInformation,             // FILE_BOTH_DIR_INFORMATION
    FileBasicInformation,                     // FILE_BASIC_INFORMATION
    FileStandardInformation,                  // FILE_STANDARD_INFORMATION
    FileInternalInformation,                  // FILE_INTERNAL_INFORMATION
    FileEaInformation,                        // FILE_EA_INFORMATION
    FileAccessInformation,                    // FILE_ACCESS_INFORMATION
    FileNameInformation,                      // FILE_NAME_INFORMATION
    FileRenameInformation,                    // FILE_RENAME_INFORMATION // 10
    FileLinkInformation,                      // FILE_LINK_INFORMATION
    FileNamesInformation,                     // FILE_NAMES_INFORMATION
    FileDispositionInformation,               // FILE_DISPOSITION_INFORMATION
    FilePositionInformation,                  // FILE_POSITION_INFORMATION
    FileFullEaInformation,                    // FILE_FULL_EA_INFORMATION
    FileModeInformation,                      // FILE_MODE_INFORMATION
    FileAlignmentInformation,                 // FILE_ALIGNMENT_INFORMATION
    FileAllInformation,                       // FILE_ALL_INFORMATION
    FileAllocationInformation,                // FILE_ALLOCATION_INFORMATION
    FileEndOfFileInformation,                 // FILE_END_OF_FILE_INFORMATION // 20
    FileAlternateNameInformation,             // FILE_NAME_INFORMATION
    FileStreamInformation,                    // FILE_STREAM_INFORMATION
    FilePipeInformation,                      // FILE_PIPE_INFORMATION
    FilePipeLocalInformation,                 // FILE_PIPE_LOCAL_INFORMATION
    FilePipeRemoteInformation,                // FILE_PIPE_REMOTE_INFORMATION
    FileMailslotQueryInformation,             // FILE_MAILSLOT_QUERY_INFORMATION
    FileMailslotSetInformation,               // FILE_MAILSLOT_SET_INFORMATION
    FileCompressionInformation,               // FILE_COMPRESSION_INFORMATION
    FileObjectIdInformation,                  // FILE_OBJECTID_INFORMATION
    FileCompletionInformation,                // FILE_COMPLETION_INFORMATION // 30
    FileMoveClusterInformation,               // FILE_MOVE_CLUSTER_INFORMATION
    FileQuotaInformation,                     // FILE_QUOTA_INFORMATION
    FileReparsePointInformation,              // FILE_REPARSE_POINT_INFORMATION
    FileNetworkOpenInformation,               // FILE_NETWORK_OPEN_INFORMATION
    FileAttributeTagInformation,              // FILE_ATTRIBUTE_TAG_INFORMATION
    FileTrackingInformation,                  // FILE_TRACKING_INFORMATION
    FileIdBothDirectoryInformation,           // FILE_ID_BOTH_DIR_INFORMATION
    FileIdFullDirectoryInformation,           // FILE_ID_FULL_DIR_INFORMATION
    FileValidDataLengthInformation,           // FILE_VALID_DATA_LENGTH_INFORMATION
    FileShortNameInformation,                 // FILE_NAME_INFORMATION // 40
    FileIoCompletionNotificationInformation,  // FILE_IO_COMPLETION_NOTIFICATION_INFORMATION // since VISTA
    FileIoStatusBlockRangeInformation,        // FILE_IOSTATUSBLOCK_RANGE_INFORMATION
    FileIoPriorityHintInformation,            // FILE_IO_PRIORITY_HINT_INFORMATION
    FileSfioReserveInformation,               // FILE_SFIO_RESERVE_INFORMATION
    FileSfioVolumeInformation,                // FILE_SFIO_VOLUME_INFORMATION
    FileHardLinkInformation,                  // FILE_LINKS_INFORMATION
    FileProcessIdsUsingFileInformation,       // FILE_PROCESS_IDS_USING_FILE_INFORMATION
    FileNormalizedNameInformation,            // FILE_NAME_INFORMATION
    FileNetworkPhysicalNameInformation,       // FILE_NETWORK_PHYSICAL_NAME_INFORMATION
    FileIdGlobalTxDirectoryInformation,       // FILE_ID_GLOBAL_TX_DIR_INFORMATION // since WIN7 // 50
    FileIsRemoteDeviceInformation,            // FILE_IS_REMOTE_DEVICE_INFORMATION
    FileUnusedInformation,
    FileNumaNodeInformation,                  // FILE_NUMA_NODE_INFORMATION
    FileStandardLinkInformation,              // FILE_STANDARD_LINK_INFORMATION
    FileRemoteProtocolInformation,            // FILE_REMOTE_PROTOCOL_INFORMATION
    FileRenameInformationBypassAccessCheck,   //(kernel-mode only); FILE_RENAME_INFORMATION // since WIN8
    FileLinkInformationBypassAccessCheck,     //(kernel-mode only); FILE_LINK_INFORMATION
    FileVolumeNameInformation,                // FILE_VOLUME_NAME_INFORMATION
    FileIdInformation,                        // FILE_ID_INFORMATION
    FileIdExtdDirectoryInformation,           // FILE_ID_EXTD_DIR_INFORMATION
    FileReplaceCompletionInformation,         // FILE_COMPLETION_INFORMATION // since WINBLUE
    FileHardLinkFullIdInformation,            // FILE_LINK_ENTRY_FULL_ID_INFORMATION
    FileIdExtdBothDirectoryInformation,       // FILE_ID_EXTD_BOTH_DIR_INFORMATION // since THRESHOLD
    FileDispositionInformationEx,             // FILE_DISPOSITION_INFO_EX // since REDSTONE
    FileRenameInformationEx,
    FileRenameInformationExBypassAccessCheck,
    FileDesiredStorageClassInformation,       // FILE_DESIRED_STORAGE_CLASS_INFORMATION // since REDSTONE2
    FileStatInformation,                      // FILE_STAT_INFORMATION
    FileMemoryPartitionInformation,           // FILE_MEMORY_PARTITION_INFORMATION // since REDSTONE3
    FileStatLxInformation,                    // FILE_STAT_LX_INFORMATION // since REDSTONE4
    FileCaseSensitiveInformation,             // FILE_CASE_SENSITIVE_INFORMATION
    FileLinkInformationEx,                    //since REDSTONE5
    FileLinkInformationExBypassAccessCheck,
    FileStorageReserveIdInformation,
    FileCaseSensitiveInformationForceAccessCheck,
    FileMaximumInformation
} FILE_INFORMATION_CLASS, *PFILE_INFORMATION_CLASS;

#endif
