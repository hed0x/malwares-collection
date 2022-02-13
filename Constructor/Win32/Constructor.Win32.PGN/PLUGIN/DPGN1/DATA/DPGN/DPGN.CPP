
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>
#include <conio.h>
#include <io.h>
#include <windows.h>

#pragma hdrstop

void help()
{
  printf("syntax:\n");
  printf("  DPGN infile<.pgn>\n");
  exit(0);
}

void main(int argc, char* argv[])
{
  printf("DPGN -- 'DELAYED PLUGIN' ENCRYPTOR -- (x) 2000-2001\n\n");

  if (argc!=2) help();

  char* hashfile1 = "file1";
  char* hashfile2 = "file2";
  char* datafile = strdup(argv[1]);
  char* outfile = "dpgndata.inc";
  char* rsakey = "KEY\\DPGN\\secret.rsa";

  printf("þ reading hashfile %s\n", hashfile1);

  FILE*f=fopen(hashfile1, "rb");
  assert(f);
  unsigned long hashlen = filelength(fileno(f));
  unsigned char* hash = (char*)calloc(1,hashlen);
  assert(fread(hash, 1,hashlen, f)==hashlen);
  fclose(f);

  printf("þ reading plugin %s\n", datafile);

  f=fopen(datafile, "rb");
  assert(f);
  unsigned long datalen = filelength(fileno(f));
  unsigned char* data = (char*)calloc(1,datalen);
  assert(fread(data, 1,datalen, f)==datalen);
  fclose(f);

  printf("þ encrypting (datalen=%i, hashlen=%i)\n", datalen, hashlen);

  for (unsigned i=0; i<datalen; i++)
    data[i] ^= hash[i%hashlen];

  printf("þ reading hashfile %s\n", hashfile2);

  f=fopen(hashfile2, "rb");
  assert(f);
  assert(hashlen+4==(unsigned)filelength(fileno(f)));
  assert(fread(hash, 1,hashlen, f)==hashlen);
  unsigned long hashcsum;
  assert(fread(&hashcsum, 1,4, f)==4);
  fclose(f);

  printf("þ reading rsa key %s\n", rsakey);

  unsigned char* rsa_m = (char*)calloc(1,hashlen);
  unsigned char* rsa_d = (char*)calloc(1,hashlen);
  f=fopen(rsakey, "rb");
  assert(f);
  unsigned long keyhash, keylen;
  assert(fread(&keyhash, 1,4, f)==4);
  assert(fread(&keylen,  1,4, f)==4);
  assert(keylen/8 == hashlen);
  unsigned long t;
  assert(fread(&t, 1,4, f)==4);
  assert(fread(rsa_m, 1,t, f)==t);
  assert(fread(&t, 1,4, f)==4);
  assert(fread(rsa_d, 1,t, f)==t);
  fclose(f);

  printf("þ writing %s\n", outfile);

  f=fopen(outfile, "wb");
  assert(f);
  fprintf(f, "; GENERATED FILE. DO NOT EDIT!\n");
  fprintf(f, "\n");

  fprintf(f, "dpgn_info:\n\n");

//  fprintf(f, "dpgn_id                 dd      0%08Xh\n",
//      keylen ^ *(DWORD*)&hash[0] ^ *(DWORD*)&rsa_d[0] ^
//      *(DWORD*)&rsa_m[0] ^ hashcsum ^ datalen ^ *(DWORD*)&data[0]  );
  fprintf(f, "dpgn_keylen             dd      %-6i       ; in BITs\n", keylen);
  fprintf(f, "dpgn_keysize            dd      %-6i       ; in BYTEs\n", keylen / 8);
  fprintf(f, "dpgn_rsa_x:             ; base, ==file2\n");
  for (unsigned i=0; i<hashlen; i++)
  {
    if ((i%8)==0) fprintf(f, "db ");
    fprintf(f, "0%02Xh", hash[i]);
    if (((i%8)==7)||(i==hashlen-1)) fprintf(f, "\n"); else fprintf(f,",");
  }
  fprintf(f, "dpgn_rsa_d:             ; exponent\n");
  for (unsigned i=0; i<hashlen; i++)
  {
    if ((i%8)==0) fprintf(f, "db ");
    fprintf(f, "0%02Xh", rsa_d[i]);
    if (((i%8)==7)||(i==hashlen-1)) fprintf(f, "\n"); else fprintf(f,",");
  }
  fprintf(f, "dpgn_rsa_m:             ; modulus\n");
  for (unsigned i=0; i<hashlen; i++)
  {
    if ((i%8)==0) fprintf(f, "db ");
    fprintf(f, "0%02Xh", rsa_m[i]);
    if (((i%8)==7)||(i==hashlen-1)) fprintf(f, "\n"); else fprintf(f,",");
  }

  fprintf(f, "dpgn_checksum           dd      0%08Xh\n", hashcsum);
  fprintf(f, "dpgn_datasize           dd      %i\n", datalen);
  fprintf(f, "dpgn_data:              ; encrypted\n");
  for (unsigned i=0; i<datalen; i++)
  {
    if ((i%8)==0) fprintf(f, "db ");
    fprintf(f, "0%02Xh", data[i]);
    if (((i%8)==7)||(i==datalen-1)) fprintf(f, "\n"); else fprintf(f,",");
  }
  fprintf(f, "\n");

  fclose(f);

}
