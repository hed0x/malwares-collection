// malloc/free work unstable when sending packets due to limited heap size. 
// they were replaced by VirtualAlloc/VirtualFree 

#include "stdafx.h"

char *valloc(DWORD num)
{
	return (char*) VirtualAlloc(NULL, num, 
		MEM_COMMIT, PAGE_READWRITE);
}

BOOL vfree(void *p)
{
	return VirtualFree(p, 0, MEM_RELEASE);
}
