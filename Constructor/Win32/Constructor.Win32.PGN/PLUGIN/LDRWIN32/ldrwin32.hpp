
#ifndef __LDRWIN32_HPP__
#define __LDRWIN32_HPP__

#include "..\..\INCLUDE\PGN2\pgn2.hpp"

#pragma pack(push)
#pragma pack(1)

#define EV_LDRWIN32_STARTUP     0x8F8135D1+0                       // r3
#define EV_LDRWIN32_ATTACHED    0x8F8135D1+1                       // r3
#define EV_LDRWIN32_SEHERROR    0x8F8135D1+2                       // r3
#define EV_LDRWIN32_DETACHED    0x8F8135D1+3                       // r3

#define UT_UNINSTALL            1
#define UT_UPDATE               2

struct ldrwin32_info_struct
{
  BYTE* ldrwin32_ptr;           // pointer to loader (.bin)
  DWORD ldrwin32_size;          // size of loader
  DWORD ldrwin32_entry;         // relative to loader_start
};

int __cdecl Event(DWORD EventID, DWORD UserParam);

ldrwin32_info_struct* __cdecl ldrwin32_getinfo();
int  __cdecl ldrwin32_copy(DWORD startup_event);                 // r3
int  __cdecl ldrwin32_attach(BYTE* plugin, BYTE* maxsize);       // r3
    // PGN2 [PGN2 [...]] <DD_0>
void __cdecl ldrwin32_detach_me();                               // r3
list_entry* __cdecl GetPluginList();
char* __cdecl uniquestr(char* buf, DWORD size, DWORD id);

#pragma pack(pop)

#endif // __LDRWIN32_HPP__
