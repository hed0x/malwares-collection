
#ifndef __SIGMAN_HPP__
#define __SIGMAN_HPP__

#pragma pack(push)
#pragma pack(1)

int __cdecl sigman(
            PE_HEADER*      pe,
            PE_OBJENTRY*    oe,
            BYTE*           memb,
            DWORD*          flag,
            DWORD           action);            // 0==before, 1==after

#pragma pack(pop)

#endif // __SIGMAN_HPP__

