
#ifndef __EXAMPLE_HPP__
#define __EXAMPLE_HPP__

#pragma pack(push)
#pragma pack(1)

#define EV_EXAMPLE_IN_EVENT        0x81192436
#define EV_EXAMPLE_OUT_EVENT       0x81192436+1

DWORD __cdecl example_proc(DWORD example_arg);

#pragma pack(pop)

#endif // __EXAMPLE_HPP__

