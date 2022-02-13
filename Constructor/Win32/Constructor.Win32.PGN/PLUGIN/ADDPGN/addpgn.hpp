
#ifndef __ADDPGN_HPP__
#define __ADDPGN_HPP__

#pragma pack(push)
#pragma pack(1)

#define EV_ADDPGN_GETKEY        0xA5FAD5DF

int __cdecl addpgn_attach(BYTE* buf, DWORD bufsize);

#pragma pack(pop)

#endif // __ADDPGN_HPP__

