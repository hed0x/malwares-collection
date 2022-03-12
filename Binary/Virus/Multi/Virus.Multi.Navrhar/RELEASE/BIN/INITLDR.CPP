#include <stdio.h>

char buf[10240];

void main()
{
  FILE *f = fopen("xxx.bin", "rb");
  int len;

  if (!f) return;

  fseek(f, 0x200, SEEK_SET);
  len = fread(buf, 1, 10240, f);
  fclose(f);

  f = fopen("loader.bin", "w+b");
  fwrite(buf, 1, len, f);
  fclose(f);

  printf("Loader initialization successed\n");

}
