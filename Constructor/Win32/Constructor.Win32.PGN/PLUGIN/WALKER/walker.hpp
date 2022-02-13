
#ifndef __WALKER_HPP__
#define __WALKER_HPP__

#pragma pack(push)
#pragma pack(1)

#define EV_WALKER_PATCHED       0xE8915C1E

int __cdecl walker_main(int __cdecl callback1(char* fname),
                        int __cdecl callback2(BYTE* buf, DWORD size));

#pragma pack(pop)

#endif // __WALKER_HPP__

