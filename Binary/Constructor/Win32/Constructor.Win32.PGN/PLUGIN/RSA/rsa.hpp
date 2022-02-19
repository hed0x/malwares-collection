
#ifndef __RSA_HPP__
#define __RSA_HPP__

#pragma pack(push)
#pragma pack(1)

void __cdecl modexp(int len,                           // key length, in BITs
                    BYTE* x,BYTE* a,BYTE* b,BYTE* m,   // x = (a^b) % m
                    BYTE* t1,                          // temporary
                    BYTE* t2);                         // temporary, 2*size
void __cdecl hash_z1(BYTE* ibuf, DWORD isize, BYTE* obuf, DWORD osize);

#pragma pack(pop)

#endif // __RSA_HPP__

