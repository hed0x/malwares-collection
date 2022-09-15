#ifndef __INCLUDE_WINSDK_H
#define __INCLUDE_WINSDK_H

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

#define IO
#define NON
#define OPT

#ifdef __INTELLISENSE__
    #undef VOID

    typedef void VOID;
#endif

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

typedef const void CVOID;

typedef VOID  *PVOID;
typedef CVOID *PCVOID;

#define IS_NULL(X)  (!(X))
#define NOT_NULL(X) (X)

#define IS_INVALID_HANDLE(X)  ((ULONG_PTR)(X) == -1)
#define NOT_INVALID_HANDLE(X) ((ULONG_PTR)(X) != -1)

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
} UNICODE_STRING, *PUNICODE_STRING;

#define CONST_STRING(X)             \
    {                               \
        sizeof(X) - sizeof((X)[0]), \
        sizeof(X),                  \
        X                           \
    }

#define CONST_UNICODE_STRING CONST_STRING
#define CONST_ANSII_STRING   CONST_STRING

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

#define InitializeObjectAttributes(P, N, A, R, S) { \
    (p)->Length = sizeof(OBJECT_ATTRIBUTES);        \
    (p)->RootDirectory = r;                         \
    (p)->Attributes = a;                            \
    (p)->ObjectName = n;                            \
    (p)->SecurityDescriptor = s;                    \
    (p)->SecurityQualityOfService = NULL;           \
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

#endif
