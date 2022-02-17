/* rsa.c  -  RSA function
 *	Copyright (c) 1997,1998,1999 by Werner Koch (dd9jn)
 ***********************************************************************
 * ATTENTION: This code should not be exported to the United States
 * nor should it be used there without a license agreement with PKP.
 * The RSA algorithm is protected by U.S. Patent #4,405,829 which
 * expires on September 20, 2000!
 ***********************************************************************
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
 * WERNER KOCH BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 * Except as contained in this notice, the name of Werner Koch shall not be
 * used in advertising or otherwise to promote the sale, use or other dealings
 * in this Software without prior written authorization from Werner Koch.
 */

/* How to compile:
 *
	 gcc -Wall -O2 -shared -fPIC -o rsa rsa.c
 */

#include "rsa.h"

/* configuration stuff */
#ifdef __alpha__
  #define SIZEOF_UNSIGNED_LONG 8
#else
  #define SIZEOF_UNSIGNED_LONG 4
#endif

#if defined(__mc68000__) || defined (__sparc__) || defined (__PPC__) \
    || (defined(__mips__) && (defined(MIPSEB) || defined (__MIPSEB__)) ) \
    || defined(__hpux__)  /* should be replaced by the macro for the PA */
  #define BIG_ENDIAN_HOST 1
#else
  #define LITTLE_ENDIAN_HOST 1
#endif

/* end configurable stuff */

#ifndef DIM
  #define DIM(v) (sizeof(v)/sizeof((v)[0]))
  #define DIMof(type,member)   DIM(((type *)0)->member)
#endif

#define is_RSA(a) ((a)>=1 && (a)<=3)

#define BAD_ALGO  4
#define BAD_KEY   7
#define BAD_SIGN  8

/* imports */
MPI  g10m_new( unsigned nbits );
MPI  g10m_new_secure( unsigned nbits );
void g10m_release( MPI a );
void g10m_set( MPI w, MPI u);
void g10m_set_ui( MPI w, unsigned long u);
void g10m_set_buffer( MPI a, const char *buffer, unsigned nbytes, int sign );
MPI  g10m_copy( MPI a );
void g10m_swap( MPI a, MPI b);
unsigned g10m_get_nbits( MPI a );
unsigned g10m_get_size( MPI a );
int  g10m_cmp( MPI u, MPI v );
void g10m_add_ui(MPI w, MPI u, unsigned long v );
void g10m_sub_ui(MPI w, MPI u, unsigned long v );
void g10m_mul( MPI w, MPI u, MPI v);
void g10m_fdiv_q( MPI quot, MPI dividend, MPI divisor );
void g10m_powm( MPI res, MPI base, MPI exp, MPI mod);
int  g10m_gcd( MPI g, MPI a, MPI b );
int  g10m_invm( MPI x, MPI u, MPI v );


MPI generate_secret_prime( unsigned  nbits );
byte *get_random_bits( size_t nbits, int level, int secure );

void
test_keys( RSA_secret_key *sk, unsigned nbits )
{
    RSA_public_key pk;
    MPI test = g10m_new( nbits );
    MPI out1 = g10m_new( nbits );
    MPI out2 = g10m_new( nbits );

    pk.n = sk->n;
    pk.e = sk->e;
    {	char *p = get_random_bits( nbits, 0, 0 );
	g10m_set_buffer( test, p, (nbits+7)/8, 0 );
	g10_free(p);
    }

    public( out1, test, &pk );
    secret( out2, out1, sk );
    if( g10m_cmp( test, out2 ) )
	rsa_log_fatal("RSA operation: public, secret failed\n");
    secret( out1, test, sk );
    public( out2, out1, &pk );
    if( g10m_cmp( test, out2 ) )
	rsa_log_fatal("RSA operation: secret, public failed\n");
    g10m_release( test );
    g10m_release( out1 );
    g10m_release( out2 );
}

/****************
 * Generate a key pair with a key of size NBITS
 * Returns: 2 structures filles with all needed values
 */
void
generate( RSA_secret_key *sk, unsigned nbits )
{
    MPI p, q; /* the two primes */
    MPI d;    /* the private key */
    MPI u;
    MPI t1, t2;
    MPI n;    /* the public key */
    MPI e;    /* the exponent */
    MPI phi;  /* helper: (p-a)(q-1) */
    MPI g;
    MPI f;

    /* select two (very secret) primes */
    p = generate_secret_prime( nbits / 2 );
    q = generate_secret_prime( nbits / 2 );
    if( g10m_cmp( p, q ) > 0 ) /* p shall be smaller than q (for calc of u)*/
	g10m_swap(p,q);
    /* calculate Euler totient: phi = (p-1)(q-1) */
    t1 = g10m_new_secure( g10m_get_size(p) );
    t2 = g10m_new_secure( g10m_get_size(p) );
    phi = g10m_new_secure( nbits );
    g	= g10m_new_secure( nbits  );
    f	= g10m_new_secure( nbits  );
    g10m_sub_ui( t1, p, 1 );
    g10m_sub_ui( t2, q, 1 );
    g10m_mul( phi, t1, t2 );
    g10m_gcd(g, t1, t2);
    g10m_fdiv_q(f, phi, g);
    /* multiply them to make the private key */
    n = g10m_new( nbits );
    g10m_mul( n, p, q );
    /* find a public exponent  */
    e = g10m_new(6);
    g10m_set_ui( e, 17); /* start with 17 */
    while( !g10m_gcd(t1, e, phi) ) /* (while gcd is not 1) */
	g10m_add_ui( e, e, 2);
    /* calculate the secret key d = e^1 mod phi */
    d = g10m_new( nbits );
    g10m_invm(d, e, f );
    /* calculate the inverse of p and q (used for chinese remainder theorem)*/
    u = g10m_new( nbits );
    g10m_invm(u, p, q );

    g10m_release(t1);
    g10m_release(t2);
    g10m_release(phi);
    g10m_release(f);
    g10m_release(g);

    sk->n = n;
    sk->e = e;
    sk->p = p;
    sk->q = q;
    sk->d = d;
    sk->u = u;

    /* now we can test our keys (this should never fail!) */
    test_keys( sk, nbits - 64 );
}


/****************
 * Test wether the secret key is valid.
 * Returns: true if this is a valid key.
 */
int
check_secret_key( RSA_secret_key *sk )
{
    int rc;
    MPI temp = g10m_new( g10m_get_size(sk->p)*2 );

    g10m_mul(temp, sk->p, sk->q );
    rc = g10m_cmp( temp, sk->n );
    g10m_release(temp);
    return !rc;
}



/****************
 * Public key operation. Encrypt INPUT with PKEY and put result into OUTPUT.
 *
 *	c = m^e mod n
 *
 * Where c is OUTPUT, m is INPUT and e,n are elements of PKEY.
 */
void
public(MPI output, MPI input, RSA_public_key *pkey )
{
    if( output == input ) { /* powm doesn't like output and input the same */
	MPI x = g10m_new( g10m_get_size(input)*2 );
	g10m_powm( x, input, pkey->e, pkey->n );
	g10m_set(output, x);
	g10m_release(x);
    }
    else
	g10m_powm( output, input, pkey->e, pkey->n );
}

/****************
 * Secret key operation. Encrypt INPUT with SKEY and put result into OUTPUT.
 *
 *	m = c^d mod n
 *
 * Where m is OUTPUT, c is INPUT and d,n are elements of PKEY.
 *
 * FIXME: We should better use the Chinese Remainder Theorem
 */
void
secret(MPI output, MPI input, RSA_secret_key *skey )
{
  if( output == input ) { /* powm doesn't like output and input the same */
	MPI x = g10m_new( g10m_get_size(input)*2 );
	g10m_powm( x, input, skey->d, skey->n );
	g10m_set(output, x);
	g10m_release(x);
    }
    else
     g10m_powm( output, input, skey->d, skey->n );
}

void pr_mpi(MPI x)
{
 int i;

 printf("%d-%d-%d-%d-%u - ",x->alloced,x->nlimbs,x->nbits,x->sign,x->flags);
 fflush(stdout);

 for (i=0;i<x->alloced;i++)
  {
  printf("%lu.",x->d[i]);
  fflush(stdout);
  }

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
 if (dsize > 1000000)
  {
   rsa_log("Oversized MPI allocation requested by peer (lame hack attempt or protocol anomaly).\n");
   dsize = 1000000;
  }
 dst = mpi_alloc(dsize);
 if (!dst)
  return NULL;
 memcpy((unsigned char *)dst, (unsigned char *)(mpiraw+sizeof(int)), msize);
 memcpy((unsigned char *)dst->d, (unsigned char *)(mpiraw+sizeof(int)+msize),dsize*sizeof(mpi_limb_t));
 return dst;
}
