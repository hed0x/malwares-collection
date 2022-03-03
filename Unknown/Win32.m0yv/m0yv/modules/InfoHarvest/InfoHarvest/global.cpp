#include "global.hpp"

void *operator new(size_t size)
{
	return VirtualAlloc(0, size, MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE);
}
void operator delete(void *p)
{
	VirtualFree(p, 0, MEM_RELEASE);
}

#ifdef _SLOW_POLYMORPHISM
DWORD global_data::dwSeed = 0;
#endif

module_data::msys_context *global_data::ctx = nullptr;