
#ifndef __AAVPATCH_HPP__
#define __AAVPATCH_HPP__

#pragma pack(push)
#pragma pack(1)

int __cdecl patch_buf(BYTE* buf,
                      DWORD bufsize,
                      int   useMZ       // use MZ/PE/NE/...-checking patch
                     ); // return # bytes patched

#pragma pack(pop)

#endif // __AAVPATCH_HPP__

