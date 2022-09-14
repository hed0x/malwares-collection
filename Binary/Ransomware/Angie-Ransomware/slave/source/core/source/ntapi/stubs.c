#include <config.h>
#include <fastcall.h>
#include <ntapi.h>
#include "ntapi.h"

enum {
    Teb32Wow64ReservedOffset = FIELD_OFFSET(TEB32, WOW32Reserved)
};

#if SCFG_CORE_NTAPI_INIT_USE_PROCLOAD == ON
    #define NTAPI_STUB_SOURCE(PROCINDEX, ARGSIZE)                                \
        {                                                                        \
            __asm { jmp dword ptr NtapiSyscallsAddressStorage[PROCINDEX << 2] }; \
        }
#else
    #define NTAPI_STUB_SOURCE(PROCINDEX, ARGSIZE)                                     \
        {                                                                             \
            __asm { cmp dword ptr [Config.NtVersion.bIsDeprecated], TRUE           }; \
            __asm { jne L1                                                         }; \
            __asm { jmp dword ptr NtapiSyscallsAddressStorage[PROCINDEX << 2]      }; \
        L1:                                                                           \
            __asm { mov eax, dword ptr NtapiSyscallsAddressStorage[PROCINDEX << 2] }; \
            __asm { and dword ptr [Config.Cpu.bUnderWow64], 0xFFFFFFFF             }; \
            __asm { jnz L2                                                         }; \
            __asm { call KiFastSystemCall                                          }; \
            __asm { ret ARGSIZE                                                    }; \
        L2:                                                                           \
            __asm { cmp dword ptr [Config.NtVersion.dwCommonIndex], 0              }; \
            __asm { je L3                                                          }; \
            __asm { call dword ptr fs:[Teb32Wow64ReservedOffset]                   }; \
            __asm { ret ARGSIZE                                                    }; \
        L3:                                                                           \
            __asm { xor ecx, ecx                                                   }; \
            __asm { lea edx, [esp + 4]                                             }; \
            __asm { call dword ptr fs:[Teb32Wow64ReservedOffset]                   }; \
            __asm { add esp, 4                                                     }; \
            __asm { ret ARGSIZE                                                    }; \
        }
#endif

PRAGMA_WARNING_DISABLE_PUSH(869) // parameter "X" was never referenced

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
NtClose(
    IN HANDLE Handle
    )
{
    NTAPI_STUB_SOURCE(__COUNTER__, 0x04);
}

NTSTATUS
NTAPISTUB
NtCreateMutant(
    OUT    PHANDLE             MutantHandle,
    IN     ACCESS_MASK         DesiredAccess,
    IN OPT POBJECT_ATTRIBUTES  ObjectAttributes,
    IN     BOOLEAN             InitialOwner
    )
{
    NTAPI_STUB_SOURCE(__COUNTER__, 0x10);
}

NTSTATUS
NTAPISTUB
NtOpenMutant(
    OUT PHANDLE            MutantHandle,
    IN  ACCESS_MASK        DesiredAccess,
    IN  POBJECT_ATTRIBUTES ObjectAttributes
    )
{
    NTAPI_STUB_SOURCE(__COUNTER__, 0x0C);
    
}

NTSTATUS
NTAPISTUB
NtDelayExecution(
    IN BOOLEAN        Alertable,
    IN PLARGE_INTEGER DelayInterval
    )
{
    NTAPI_STUB_SOURCE(__COUNTER__, 0x08);
}

NTSTATUS
NTAPISTUB
NtOpenKey(
    OUT PHANDLE            KeyHandle,
    IN  ACCESS_MASK        DesiredAccess,
    IN  POBJECT_ATTRIBUTES ObjectAttributes
    )
{
    NTAPI_STUB_SOURCE(__COUNTER__, 0x0C);
}

NTSTATUS
NTAPISTUB
NtQueryValueKey(
    IN  HANDLE                      KeyHandle,
    IN  PUNICODE_STRING             ValueName,
    IN  KEY_VALUE_INFORMATION_CLASS KeyValueInformationClass,
    OUT PVOID                       KeyValueInformation,
    IN  ULONG                       Length,
    OUT PULONG                      ResultLength
    )
{
    NTAPI_STUB_SOURCE(__COUNTER__, 0x18);
}

PRAGMA_WARNING_DISABLE_POP(869)
