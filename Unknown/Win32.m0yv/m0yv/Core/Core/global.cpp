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
//DWORD global_data::dwSeed = 0;
#endif
PWCHAR global_data::pwBotID = nullptr;
PWCHAR global_data::pwHardwareID = nullptr;
capsid_extended *global_data::pExtendedDataCopy = nullptr;
DWORD global_data::dwIntegrityLevel = SECURITY_MANDATORY_UNTRUSTED_RID;
#ifdef _DEBUG
PWCHAR global_data::pwFileName = nullptr;
#endif
