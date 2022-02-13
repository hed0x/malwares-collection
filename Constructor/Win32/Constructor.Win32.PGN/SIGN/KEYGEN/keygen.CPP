
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>
#include <windows.h>
#include <conio.h>
#include <io.h>

#pragma hdrstop

//#define REDUNDANT_INFO

DWORD START_E = 50001;
DWORD END_E   = 0;

#include "..\..\INCLUDE\RSA\CPP\vlong.cpp"
#include "..\..\INCLUDE\RSA\CPP\rsa.cpp"

unsigned long randseed = 0x12345678;
unsigned long my_random(unsigned long range)
{
  randseed = randseed * 214013 + 2531011;
  return ((randseed >> 16) * range) >> 16;
}

void fdump_vlong_bin(FILE*f, const vlong &x)
{
  unsigned u = x.value->z * 4;
  fwrite(&u, 1,4, f);
  fwrite(&x.value->a[0], sizeof(x.value->a[0]),x.value->z, f);
}

void help()
{
  printf("syntax:\n");
  printf("  KEYGEN KEYDIR\\ [keylen [start_e [end_e]]]\n");
  printf("\n");
  printf("    KEYDIR\\   -- output directory with key stuff\n");
  printf("    keylen    -- key length, in bits. 64-bit aligned.\n");
  printf("                 use 128/256/512/1024 values to faster calculations\n");
  printf("    start_e   -- initial low exponent value\n");
  printf("    end_e     -- maximal low exponent value\n");
  exit(0);
}

void main(int argc, char* argv[])
{
  randseed ^= GetTickCount();

  printf("RSA KEYGEN (CPP) -- (x) 2000-2001\n\n");

  if (argc<=1) help();

  char* keydir = (char*)malloc(256);
  strcpy(keydir, argv[1]);
  if (keydir[strlen(keydir)-1]!='\\') strcat(keydir, "\\");

#define makefname(x, y)  \
  char* x = (char*)malloc(260); strcpy(x, keydir); strcat(x, y);

  makefname(seckey, "secret.rsa");
  makefname(pubkey, "public.rsa");

  if ( (!access(seckey,0)) ||
       (!access(pubkey,0)) )
  {
    printf("þ keys alredy exists. replace? (Y/N): ");
    if ((getch()|0x20)=='y')
    {
      printf("Yes\n");
    }
    else
    {
      printf("No\n");
      exit(0);
    }
  }

  unsigned long keylen = 256;
  unsigned long keyhash;

  if (argc>2) keylen  = atol(argv[2]);
  if (argc>3) START_E = atol(argv[3]);
  if (argc>4) END_E =   atol(argv[4]);

  if (keylen<32) keylen=32;
  if (keylen>4096) keylen=4096; // takes too much time

  private_key key;

  unsigned long rsize = (keylen+15)/16;
  char* r1 = (char*)malloc(rsize+1);
  char* r2 = (char*)malloc(rsize+1);
  r1[rsize]=0;
  r2[rsize]=0;


  printf("þ enter random key sequence...\n");

  int n_iter = 0;
restart:

  char c0;
  for (int j=0; j<2; j++)
  for (unsigned long i=0; i<rsize; i++)
  {
    printf("%5i of %5i\x0D",j*rsize+i,rsize*2);
    unsigned long t = GetTickCount();
    char c;
    if (n_iter==0)
    {
      for(;;)
      {
        c = getch();
        if (c!=c0) break;
      }
      c0=c;
    }
    else
      c = 0x55;
    t -= GetTickCount();
    t ^= (t >> 8) ^ (t >> 16);
    c ^= t ^ my_random(256) + i;
    c += c==0;
    if (j) r1[i]=c; else r2[i]=c;
  }
  n_iter++;

  printf("þ generating %i-bit keys...\n", keylen);

  r1[0] |= 0xc0;
  r2[0] |= 0xc0;

  key.create(r1,r2);

  printf("  e = %i\n", key.e.value->a[0]);

  if (END_E != 0)
  if (key.e.value->a[0] > END_E)
    goto restart;

  vlong d = modinv( key.e, (key.p-(vlong)1)*(key.q-(vlong)1) );

/*  printf("d=");
  for (int i=0; i<d.value->z; i++)
    printf("%08X ",d.value->a[i]);
  printf("\n");
  printf("n=");
  for (int i=0; i<key.m.value->z; i++)
    printf("%08X ",key.m.value->a[i]);
  printf("\n"); */

#define MAX(a,b)        a>b?a:b
  unsigned long maxlen = MAX(key.m.value->z, d.value->z);
  assert(maxlen == keylen/32);

  keyhash = 0;
  for (unsigned i=0; i<key.m.value->z; i++) keyhash ^= key.m.value->a[i];

  FILE*f;

  printf("þ writing %s...\n", pubkey);
  f=fopen(pubkey,"wb");
  assert(f);
  fwrite(&keyhash, 1,4, f);
  fwrite(&keylen, 1,4, f);
  fdump_vlong_bin(f,key.m);
  fdump_vlong_bin(f,key.e);
  fclose(f);

  printf("þ writing %s...\n", seckey);
  f=fopen(seckey,"wb");
  assert(f);
  fwrite(&keyhash, 1,4, f);
  fwrite(&keylen, 1,4, f);
  fdump_vlong_bin(f,key.m);
  fdump_vlong_bin(f,d);
#ifdef REDUNDANT_INFO
  fdump_vlong_bin(f,key.e);
  fdump_vlong_bin(f,key.p);
  fdump_vlong_bin(f,key.q);
  fdump_vlong_bin(f,u);
  fdump_vlong_bin(f,dp);
  fdump_vlong_bin(f,dq);
#endif
  fclose(f);

  printf("þ testing key (encrypting/decrypting string)...\n");
  vlong x = from_str("motherfucker");
  vlong y = key.encrypt(x);
  vlong z = key.decrypt(y);
  printf(((x.value->z==z.value->z)&&(x.value->a[0]==z.value->a[0])) ?
         "þ success\n":"***ERROR***\n");

  printf("þ dont forget to recompile key-dependent plugins\n");

}
