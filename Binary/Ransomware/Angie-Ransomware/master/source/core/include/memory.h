#ifndef MEMORY_INCLUDED
#define MEMORY_INCLUDED

#include <console.h>

#define PROCESS_HEAP_SIZE PAGE_SIZE

extern HANDLE ProcessHeap;

static
PVOID
FORCEINLINE
MmHeapAlloc(
    IN SIZE_T AllocSize
    )
{
    return HeapAlloc(ProcessHeap, 0, AllocSize);
}

static
PVOID
FORCEINLINE
MmVirtualAlloc(
    IN SIZE_T AllocSize
    )
{
    return VirtualAlloc(NULL, AllocSize, MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE);
}


static
PVOID
FORCEINLINE
MmAlloc(
    IN SIZE_T AllocSize
    )
{
    PVOID Block = NULL;

    if (AllocSize <= 0x400) {
        Block = MmHeapAlloc(AllocSize);
    }

    if (IS_NULL(Block)) {
        if (IS_NULL(Block = MmVirtualAlloc(AllocSize))) {
            ConsolePrint("Not enough memory!");
            ExitProcess(0);
        }
    }

    return Block;
}

static
VOID
FORCEINLINE
MmFree(
    IN PVOID Block
    )
{
    if (NOT_NULL(Block)) {
        if ((ULONG_PTR)Block & 0xFFF) {
            HeapFree(ProcessHeap, 0, Block);
        } else {
            VirtualFree(Block, 0, MEM_RELEASE);
        }
    }
}

VOID
InitMemoryManagment(VOID);

#endif
