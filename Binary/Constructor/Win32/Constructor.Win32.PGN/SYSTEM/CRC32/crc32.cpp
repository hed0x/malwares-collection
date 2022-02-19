
#include <windows.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <io.h>

#pragma hdrstop

#include "crc32.hpp"
#include "fuck_api.cpp"

DWORD hash(char* s)
{
  DWORD h = 0;
  while (*s)
  {
    h = (h<<7)|(h>>25);  // asm rol h, 7;
    h ^= (BYTE)*s++;
  }
  return h;
}

void main(int argc, char* argv[])
{
  init_fuckapi();

  printf("    --crc32--\n");
  for (int i=1; i<argc; i++)
    printf("%-40s %08X\n", argv[i], crc32(argv[i]));
  printf("    --hash--\n");
  for (int i=1; i<argc; i++)
    printf("%-40s %08X\n", argv[i], hash(argv[i]));
  printf("    --PGN2_FUCKAPI=Yes--\n");
  PGN2_FUCKAPI=1;
  for (int i=1; i<argc; i++)
    printf("%-40s %s\n", argv[i], fuck_api(argv[i]));
  printf("    --PGN2_FUCKAPI=Badly--\n");
  PGN2_FUCKAPI=2;
  for (int i=1; i<argc; i++)
    printf("%-40s %s\n", argv[i], fuck_api(argv[i]));
  printf("    --hash(PGN2_FUCKAPI=Badly)--\n");
  PGN2_FUCKAPI=2;
  for (int i=1; i<argc; i++)
    printf("%-40s %08X\n", argv[i], hash(fuck_api(argv[i])));
}
