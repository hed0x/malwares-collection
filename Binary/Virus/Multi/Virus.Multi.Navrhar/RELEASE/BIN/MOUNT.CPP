#include <stdio.h>
#include <stdlib.h>

char module[10240];

#define _max(a, b) (((a)>(b)) ? a : b)

int main(int argc, char *args[] )
{
  FILE * f;
  int i, t;
  int len;
  int filelen;
  int total_data = 0, xpoz;

  printf("Independent module mounter\n");
  if (argc!=3) return 0;

  if (!(f=fopen(args[2], "rb"))) return 0;
  len = fread(module, 1, 10240, f);
  fclose(f);

  i = atoi(args[1]);

  f = fopen("loader.bin", "r+b");
  if (!f) return 0;


  fseek(f, i*4+8, SEEK_SET);
  fread(&t, 4, 1, f);
  if (t||i<0||i>31) {
    printf("Invalid module number\n");
    return 0;
  }

  if (*((int *) module)!=len-5) {
    printf("Invalid module version\n");
    return 0;
  }

  total_data = *((int *) &module[len-4]);


  fseek(f, 0, SEEK_END);
  filelen = ftell(f);
  fwrite(module, 1, len-4, f);
  fseek(f, i*4+8, SEEK_SET);
  fwrite(&filelen, 4, 1, f);

  fseek(f, 30*4+8, SEEK_SET);
  xpoz = filelen+len-4;
  fwrite(&xpoz, 1, 4, f);

  fseek(f, 31*4+8, SEEK_SET);
  fread(&xpoz, 1, 4, f);

  if (xpoz<total_data) xpoz = total_data;
  fseek(f, 31*4+8, SEEK_SET);
  fwrite(&xpoz, 4, 1, f);

  fclose(f);

  printf("Module successfuly mounted on %i at %08X\n", i, filelen);
  printf("Common buffer size: %08X    File len %i\n", xpoz, filelen+len-4);
  return 1;

}
