
// SIGnature MANager

#include <windows.h>
#pragma hdrstop

namespace PLUGIN {
extern "C" {

#include "..\..\INCLUDE\mz.hpp"
#include "..\..\INCLUDE\pe.hpp"
#include "..\LDRWIN32\ldrwin32.hpp"
#include "..\MISTFALL\mistfall.hpp"
#include "..\DEBUG\debug.hpp"
#include "..\FILEIO\fileio.hpp"
#include "..\MEMORY\memory.hpp"
#include "..\UTIL\util.hpp"

////////x///////x///////x///////x///////x///////x///////x///////x///////x////

#define MAX_SIG_SIZE    (4*1024*1024)   // 4M, max size of signature database
#define C_SIGSIZE       8               // # of bytes per signature

#define SIG_SORTED                      // sorted signatures
//#define DUMP_MSG

////////x///////x///////x///////x///////x///////x///////x///////x///////x////

void __fastcall my_memcpy(void *dest, void *src, DWORD n)
{
  while (n--) *((BYTE*)dest)++ = *((BYTE*)src)++;
}

int __fastcall my_memcmp(BYTE *s1, BYTE *s2, DWORD n)
{
  while (n--)
  {
    int res = *s1++ - *s2++;
    if (res)
      return res;
  };
  return 0;
}

void __fastcall my_memmove(char *dest, char *src, DWORD n)
{
  if (dest < src)
    while (n--) *dest++ = *src++;
  else
    while (n--) dest[n] = src[n];
}

void __fastcall my_memset(void *dest, int c, DWORD n)
{
  while (n--) *((BYTE*)dest)++ = c;
}

////////x///////x///////x///////x///////x///////x///////x///////x///////x////

char sigfile[512];
BYTE* sigptr = NULL;
DWORD sigsize, sigsize0;

int is_sig(BYTE* x)
{
#ifdef SIG_SORTED

  if (sigsize==0) return 0;
  DWORD a=0, b=sigsize-C_SIGSIZE;
  int va = my_memcmp(x, &sigptr[a], C_SIGSIZE);
  if (va<0) return 0;
  if (va==0) return 1;
  int vb = my_memcmp(x, &sigptr[b], C_SIGSIZE);
  if (vb>0) return 0;
  if (vb==0) return 1;
  for (;;)
  {
    DWORD c = (((a/C_SIGSIZE) + (b/C_SIGSIZE)) / 2) * C_SIGSIZE;
    int vc = my_memcmp(x, &sigptr[c], C_SIGSIZE);
    if (vc == 0) return 1;
    if ((c == a) || (c == b)) return 0;
    if (vc < 0) b = c;
    if (vc > 0) a = c;
  }

#else // !SIG_SORTED

  for (DWORD j=0; j<sigsize; j+=C_SIGSIZE)
  {
    if (*(DWORD*)x == *(DWORD*)&sigptr[j])
    if (my_memcmp(x, &sigptr[j], C_SIGSIZE) == 0)
      return 1;
  }
  return 0;

#endif // SIG_SORTED
}

void insert_sig(BYTE* x, DWORD o)
{
  if (o<sigsize)
    my_memmove(&sigptr[o+C_SIGSIZE], &sigptr[o], sigsize-o);
  my_memcpy(&sigptr[o], x, C_SIGSIZE);
  sigsize += C_SIGSIZE;
}

void add_sig(BYTE* x)
{
#ifdef SIG_SORTED

//printf("add: %02X %02X %02X\n",x[0],x[1],x[2]);

  if (sigsize==0)
  {
    insert_sig(x,0);
    return;
  }

  DWORD a=0, b=sigsize-C_SIGSIZE;
  int va = my_memcmp(x, &sigptr[a], C_SIGSIZE);
  if (va < 0)
  {
    insert_sig(x, a);
    return;
  }
  int vb = my_memcmp(x, &sigptr[b], C_SIGSIZE);
  if (vb > 0)
  {
    insert_sig(x, b+C_SIGSIZE);
    return;
  }
  for (;;)
  {
    DWORD c = (((a/C_SIGSIZE) + (b/C_SIGSIZE)) / 2) * C_SIGSIZE;
    if ((c == a) || (c == b))
    {
      insert_sig(x, b);
      return;
    }
    int vc = my_memcmp(x, &sigptr[c], C_SIGSIZE);
    if (vc < 0) b = c;
    if (vc > 0) a = c;
  }

#else // !SIG_SORTED

  my_memcpy(&sigptr[sigsize], x, C_SIGSIZE);
  sigsize += C_SIGSIZE;

#endif // SIG_SORTED
}

void sig_init()
{
  uniquefname(sigfile, 0x98444A80);    // crc32('sigman')

#ifdef DUMP_MSG
  printf("- loading signature table %s\n", sigfile);
#endif

  if (sigptr != NULL) return;

  DWORD f = fopen_ro(sigfile);
  sigsize0 = sigsize = f == NULL ? 0 : fgetsize(f);
  sigptr = (BYTE*) malloc(MAX_SIG_SIZE);
  if (f)
  {
    fread(f, sigptr, sigsize, 0);
    fclose(f);
  }
} //sig_init

void sig_done()
{
#ifdef DUMP_MSG
  printf("- writing signature table %s\n", sigfile);
#endif
  if (sigsize != sigsize0)
  {
    sigsize0 = sigsize;
    DWORD f=fcreate(sigfile);
    if (f)
    {
      fwrite(f, sigptr, sigsize, 0);
      fclose(f);
    }
  }

  mfree(sigptr);
  sigptr=NULL;

} //sig_done

// returns: (when action==0)
//     0      --if success
//  non-zero  --if error

int __export __cdecl sigman(
            PE_HEADER*      /*pe*/,
            PE_OBJENTRY*    oe,
            BYTE*           memb,
            DWORD*          flag,
            DWORD           action              // 0==before, 1==after
            )
{

  if (action==0)
  {
    sig_init();

#ifdef DUMP_MSG
    printf("- analyzing signatures\n");
#endif

    int count=0;
    for (DWORD i=oe[0].oe_virtrva;
         i < oe[0].oe_virtrva + oe[0].oe_physsize;
         i++)
    {
      if (is_sig(&memb[i]))
      {
        flag[i] |= FL_SIGNATURE | FL_NEXT;
        count++;
      }
    }//for i
#ifdef DUMP_MSG
    printf("- applied signatures: %i\n", count);
#endif
  }

  if (action==1)
  {
#ifdef DUMP_MSG
    printf("- analyzing new signatures\n");
#endif

    int count=0;
    if (sigsize+C_SIGSIZE <= MAX_SIG_SIZE)
    for (DWORD i=oe[0].oe_virtrva;
         i < oe[0].oe_virtrva + oe[0].oe_physsize;
         i++)
    if (flag[i] & FL_LABEL)
    if (flag[i] & (FL_CREF|FL_DREF))
    if (flag[i] & FL_OPCODE)
    if (memb[i+C_SIGSIZE-1] != memb[i+C_SIGSIZE-2])
    {
      for (DWORD j=0; j<C_SIGSIZE; j++)
        if (flag[i+j] & (FL_HAVEREL|FL_STOP|FL_DATA|FL_FIXUP|FL_RVA))
          goto c1;
      if (!is_sig(&memb[i]))
      {
        add_sig(&memb[i]);
        count++;
        if (sigsize+C_SIGSIZE > MAX_SIG_SIZE) break;
      }
c1:
    }
#ifdef DUMP_MSG
    printf("- new signatures: %i\n", count);
#endif

    sig_done();
  }

  return 0;             // 0==success
} //sigman

////////x///////x///////x///////x///////x///////x///////x///////x///////x////

int __export __cdecl unload(int why)
{
  mfree(sigptr);
  return 0;
}

void __cdecl EntryPoint(DWORD)
{
}

////////x///////x///////x///////x///////x///////x///////x///////x///////x////

}; // extern "C"
}; // namespace PLUGIN
