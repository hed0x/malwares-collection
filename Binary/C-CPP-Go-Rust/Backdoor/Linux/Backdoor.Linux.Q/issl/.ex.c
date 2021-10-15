#include "primegen.c"
#include "random.c"
#include "rsa.c"

int mpi2raw(MPI src, char *raw);
MPI raw2mpi(char *raw);

void pr_mpi(MPI x)
{
 int i;
 printf("%d-%d-%d-%d-%u - ",x->alloced,x->nlimbs,x->nbits,x->sign,x->flags);
 for (i=0;i<=x->alloced;i++)
  printf("%lu.",x->d[i]);

 printf("\n");
}

int
mpi2raw(MPI src, char *mpiraw)
{
 int msize = 20, dsize = src->alloced;
 memcpy(mpiraw, &dsize, sizeof(int));
 memcpy((unsigned char *)(mpiraw+sizeof(int)), src, msize);

 memcpy((unsigned char *)(mpiraw+sizeof(int)+msize), (unsigned char *)src->d, dsize * sizeof(mpi_limb_t));
 return msize+(dsize*sizeof(mpi_limb_t))+sizeof(int);
}

MPI
raw2mpi(char *mpiraw)
{
 int msize = 20, dsize = 0;
 MPI dst;
 memcpy(&dsize, mpiraw, sizeof(int));
 dst = mpi_alloc(dsize);
 memcpy((unsigned char *)dst, (unsigned char *)(mpiraw+sizeof(int)), msize);

 memcpy((unsigned char *)dst->d, (unsigned char *)(mpiraw+sizeof(int)+msize), dsize*sizeof(mpi_limb_t));
 return dst;
}

int
main()
{
 RSA_secret_key s;
 RSA_public_key p,x;
 unsigned char raw1[2048], raw2[2048];
 int rs = 0;

 generate(&s,256);
 p.n = s.n;
 p.e = s.e;

 if (!check_secret_key(&s)) rsa_log_fatal("somethings wrong\n");

 rs = mpi2raw (s.n,raw1);
 rs = mpi2raw (s.e,raw2);
 
 x.n = raw2mpi(raw1);
 x.e = raw2mpi(raw2);
 pr_mpi(x.n);
 pr_mpi(s.n);
 pr_mpi(x.e);
 pr_mpi(s.e);
s.n = x.n;
s.e = x.e;

 if (!check_secret_key(&s)) rsa_log_fatal("somethings wrong\n");
  else rsa_log_fatal("el8\n");

 return 0;
}
