
#ifndef __RANDOM_HPP__
#define __RANDOM_HPP__

#pragma pack(push)
#pragma pack(1)

DWORD __stdcall rnd(DWORD range);
DWORD __stdcall rnd_eax();
DWORD __stdcall rnd_byte();
DWORD __stdcall rnd_dword();
DWORD __stdcall rnd_2();
DWORD __stdcall rnd_3();
DWORD __stdcall rnd_8();
void  __stdcall rnd_zf();

#pragma pack(pop)

#endif // __RANDOM_HPP__
