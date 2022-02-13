
#ifndef __CRC32_HPP__
#define __CRC32_HPP__

DWORD __cdecl crc32(char* s)
{
  DWORD h=0xFFFFFFFF;
  while (*s)
  {
    h^=(BYTE)*s++;
    for (int j=0; j<8; j++)
      if (h&1) h=(h>>1)^0xEDB88320; else h>>=1;
  }
  return ~h;
}

/*
DWORD __cdecl crc32(char* s)
{
  asm
  {
     xor     eax, eax
     dec     eax
     mov     edx, s
@@1: cmp     byte ptr [edx], 0
     je      @@4
     xor     al, [edx]
     mov     bl, 8
@@2: shr     eax, 1
     jnc     @@3
     xor     eax, 0EDB88320h
@@3: dec     bl
     jnz     @@2
     inc     edx
     jmp     @@1
@@4: not     eax
  }
  return _EAX;
}
*/

#endif // __CRC32_HPP__
