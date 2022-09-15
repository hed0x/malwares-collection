#ifndef NTAPI_INCLUDED
#define NTAPI_INCLUDED

#define NTAPISTUB     \
    DECLSPEC_NAKED    \
    DECLSPEC_NOINLINE \
    NTAPI

NTSTATUS
NTAPISTUB
NtClose(
    IN HANDLE Handle
    );

NTSTATUS
NTAPISTUB
NtAllocateVirtualMemory(
    IN HANDLE    ProcessHandle,
    IO PVOID    *BaseAddress,
    IN ULONG_PTR ZeroBits,
    IO PSIZE_T   RegionSize,
    IN ULONG     AllocationType,
    IN ULONG     Protect
    );

NTSTATUS
NTAPISTUB
NtFreeVirtualMemory(
    IN HANDLE  ProcessHandle,
    IO PVOID  *BaseAddress,
    IO PSIZE_T RegionSize,
    IN ULONG   FreeType
    );

NTSTATUS
NTAPISTUB
NtWriteVirtualMemory(
    IN      HANDLE  ProcessHandle,
    IN      PVOID   BaseAddress,
    IN      PVOID   Buffer,
    IN      ULONG   NumberOfBytesToWrite,
    OUT OPT PULONG  NumberOfBytesWritten
    );

NTSTATUS
NTAPISTUB
NtFlushInstructionCache(
    IN HANDLE ProcessHandle,
    IN PVOID  BaseAddress,
    IN ULONG  NumberOfBytesToFlush
    );

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
    );

NTSTATUS
NTAPISTUB
NtOpenProcess(
    OUT PHANDLE            ProcessHandle,
    IN  ACCESS_MASK        DesiredAccess,
    NON POBJECT_ATTRIBUTES ObjectAttributes,
    IN  PCLIENT_ID         ClientId
    );

NTSTATUS
NTAPISTUB
NtQuerySystemInformation(
    IN  SYSTEM_INFORMATION_CLASS SystemInformationClass,
    OUT PVOID                    SystemInformation,
    IN  ULONG                    SystemInformationLength,
    OUT PULONG                   ReturnLength
    );

NTSTATUS
NTAPISTUB
NtQueryInformationProcess(
    IN  HANDLE           ProcessHandle,
    IN  PROCESSINFOCLASS ProcessInformationClass,
    OUT PVOID            ProcessInformation,
    IN  ULONG            ProcessInformationLength,
    OUT PULONG           ReturnLength
    );

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
    );

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
    );

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
    );

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
    );

#endif
