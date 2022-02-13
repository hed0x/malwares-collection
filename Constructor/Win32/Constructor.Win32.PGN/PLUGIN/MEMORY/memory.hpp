
#ifndef __MEMORY_HPP__
#define __MEMORY_HPP__

#pragma pack(push)
#pragma pack(1)

BYTE* __stdcall malloc(DWORD size);            // returns 0 if error
void  __stdcall mfree (BYTE* memptr);

#pragma pack(pop)

#endif // __MEMORY_HPP__
