/*
  LDE32 example file
  
  disassemble kernel32 memory and dump it in hex form to console
*/

#include <stdio.h>

extern "C" void pascal DISASM_INIT(void* tableptr);
extern "C" int  pascal DISASM_MAIN(void* opcodeptr, void* tableptr);

void main()
{
  char* o;
  int s;
  char t[2048];
  DISASM_INIT(&t);
  for ((int)o=0xBFF72000, s=0; s!=-1; )
  {
    s = DISASM_MAIN(o, t);
    printf("%08X ",o);
    for (int i=0; i<(s&15); i++, o++) printf(" %02X", (unsigned char)*o);
    printf("\n");
  }
}
