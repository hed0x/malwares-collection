;-> some ntoskrnl.exe prototypes <-  by yoda
;-------------------------------------------

NonPagedPool               EQU 000000000h
PagedPool                  EQU 000000001h

DbgPrint                   PROTO C :DWORD, :VARARG
RtlInitUnicodeString       PROTO :DWORD, :DWORD
IoCreateDevice             PROTO :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD
IoDeleteDevice             PROTO :DWORD
IoCreateSymbolicLink       PROTO :DWORD, :DWORD
IoDeleteSymbolicLink       PROTO :DWORD
@IofCompleteRequest@8      PROTO SYSCALL :DWORD, :DWORD
IoCompleteRequest          EQU @IofCompleteRequest@8           ; Does someone know how to avoid this ?
_KeServiceDescriptorTable  PROTO SYSCALL
ExAllocatePool             PROTO :DWORD, :DWORD
ExFreePool                 PROTO :LPVOID
MmIsAddressValid           PROTO :LPVOID