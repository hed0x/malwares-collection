
#ifndef __UUE_HPP__
#define __UUE_HPP__

#pragma pack(push)
#pragma pack(1)

void __cdecl uuencode(BYTE*  ibuf,      // src buffer
                      DWORD  isize,     // src buffer size (min=3)
                      BYTE*  obuf,      // dst buffer
                      DWORD* osize,     // ptr to dst buffer size
                      char*  fname);    // filename

#pragma pack(pop)

#endif // __UUE_HPP__

