#include <memory.h>

HANDLE ProcessHeap;

VOID
InitMemoryManagment(VOID)
{
    ProcessHeap = GetProcessHeap();
}
