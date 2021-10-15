/* primegen.c - prime number generator
 *	Copyright (C) 1998 Free Software Foundation, Inc.
 *
 * This file is part of GnuPG.
 *
 * GnuPG is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * GnuPG is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA
 *
 * ***********************************************************************
 * The algorithm used to generate practically save primes is due to
 * Lim and Lee as described in the CRYPTO '97 proceedings (ISBN3540633847)
 * page 260.
 */

#include "config.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include "util.h"
#include "mpi.h"
#include "random.h"
/*#include "cipher.h"*/
#define DBG_CIPHER 1

static int no_of_small_prime_numbers;
static MPI gen_prime( unsigned	nbits, int mode, int randomlevel );
static int check_prime( MPI prime, MPI val_2 );
static int is_prime( MPI n, int steps, int *count );
static void m_out_of_n( char *array, int m, int n );

static void (*progress_cb) ( void *, int );
static void *progress_cb_data;

ushort
small_prime_numbers[] = {
    3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43,
    47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101,
    103, 107, 109, 113, 127, 131, 137, 139, 149, 151,
    157, 163, 167, 173, 179, 181, 191, 193, 197, 199,
    211, 223, 227, 229, 233, 239, 241, 251, 257, 263,
    269, 271, 277, 281, 283, 293, 307, 311, 313, 317,
    331, 337, 347, 349, 353, 359, 367, 373, 379, 383,
    389, 397, 401, 409, 419, 421, 431, 433, 439, 443,
    449, 457, 461, 463, 467, 479, 487, 491, 499, 503,
    509, 521, 523, 541, 547, 557, 563, 569, 571, 577,
    587, 593, 599, 601, 607, 613, 617, 619, 631, 641,
    643, 647, 653, 659, 661, 673, 677, 683, 691, 701,
    709, 719, 727, 733, 739, 743, 751, 757, 761, 769,
    773, 787, 797, 809, 811, 821, 823, 827, 829, 839,
    853, 857, 859, 863, 877, 881, 883, 887, 907, 911,
    919, 929, 937, 941, 947, 953, 967, 971, 977, 983,
    991, 997, 1009, 1013, 1019, 1021, 1031, 1033,
    1039, 1049, 1051, 1061, 1063, 1069, 1087, 1091,
    1093, 1097, 1103, 1109, 1117, 1123, 1129, 1151,
    1153, 1163, 1171, 1181, 1187, 1193, 1201, 1213,
    1217, 1223, 1229, 1231, 1237, 1249, 1259, 1277,
    1279, 1283, 1289, 1291, 1297, 1301, 1303, 1307,
    1319, 1321, 1327, 1361, 1367, 1373, 1381, 1399,
    1409, 1423, 1427, 1429, 1433, 1439, 1447, 1451,
    1453, 1459, 1471, 1481, 1483, 1487, 1489, 1493,
    1499, 1511, 1523, 1531, 1543, 1549, 1553, 1559,
    1567, 1571, 1579, 1583, 1597, 1601, 1607, 1609,
    1613, 1619, 1621, 1627, 1637, 1657, 1663, 1667,
    1669, 1693, 1697, 1699, 1709, 1721, 1723, 1733,
    1741, 1747, 1753, 1759, 1777, 1783, 1787, 1789,
    1801, 1811, 1823, 1831, 1847, 1861, 1867, 1871,
    1873, 1877, 1879, 1889, 1901, 1907, 1913, 1931,
    1933, 1949, 1951, 1973, 1979, 1987, 1993, 1997,
    1999, 2003, 2011, 2017, 2027, 2029, 2039, 2053,
    2063, 2069, 2081, 2083, 2087, 2089, 2099, 2111,
    2113, 2129, 2131, 2137, 2141, 2143, 2153, 2161,
    2179, 2203, 2207, 2213, 2221, 2237, 2239, 2243,
    2251, 2267, 2269, 2273, 2281, 2287, 2293, 2297,
    2309, 2311, 2333, 2339, 2341, 2347, 2351, 2357,
    2371, 2377, 2381, 2383, 2389, 2393, 2399, 2411,
    2417, 2423, 2437, 2441, 2447, 2459, 2467, 2473,
    2477, 2503, 2521, 2531, 2539, 2543, 2549, 2551,
    2557, 2579, 2591, 2593, 2609, 2617, 2621, 2633,
    2647, 2657, 2659, 2663, 2671, 2677, 2683, 2687,
    2689, 2693, 2699, 2707, 2711, 2713, 2719, 2729,
    2731, 2741, 2749, 2753, 2767, 2777, 2789, 2791,
    2797, 2801, 2803, 2819, 2833, 2837, 2843, 2851,
    2857, 2861, 2879, 2887, 2897, 2903, 2909, 2917,
    2927, 2939, 2953, 2957, 2963, 2969, 2971, 2999,
    3001, 3011, 3019, 3023, 3037, 3041, 3049, 3061,
    3067, 3079, 3083, 3089, 3109, 3119, 3121, 3137,
    3163, 3167, 3169, 3181, 3187, 3191, 3203, 3209,
    3217, 3221, 3229, 3251, 3253, 3257, 3259, 3271,
    3299, 3301, 3307, 3313, 3319, 3323, 3329, 3331,
    3343, 3347, 3359, 3361, 3371, 3373, 3389, 3391,
    3407, 3413, 3433, 3449, 3457, 3461, 3463, 3467,
    3469, 3491, 3499, 3511, 3517, 3527, 3529, 3533,
    3539, 3541, 3547, 3557, 3559, 3571, 3581, 3583,
    3593, 3607, 3613, 3617, 3623, 3631, 3637, 3643,
    3659, 3671, 3673, 3677, 3691, 3697, 3701, 3709,
    3719, 3727, 3733, 3739, 3761, 3767, 3769, 3779,
    3793, 3797, 3803, 3821, 3823, 3833, 3847, 3851,
    3853, 3863, 3877, 3881, 3889, 3907, 3911, 3917,
    3919, 3923, 3929, 3931, 3943, 3947, 3967, 3989,
    4001, 4003, 4007, 4013, 4019, 4021, 4027, 4049,
    4051, 4057, 4073, 4079, 4091, 4093, 4099, 4111,
    4127, 4129, 4133, 4139, 4153, 4157, 4159, 4177,
    4201, 4211, 4217, 4219, 4229, 4231, 4241, 4243,
    4253, 4259, 4261, 4271, 4273, 4283, 4289, 4297,
    4327, 4337, 4339, 4349, 4357, 4363, 4373, 4391,
    4397, 4409, 4421, 4423, 4441, 4447, 4451, 4457,
    4463, 4481, 4483, 4493, 4507, 4513, 4517, 4519,
    4523, 4547, 4549, 4561, 4567, 4583, 4591, 4597,
    4603, 4621, 4637, 4639, 4643, 4649, 4651, 4657,
    4663, 4673, 4679, 4691, 4703, 4721, 4723, 4729,
    4733, 4751, 4759, 4783, 4787, 4789, 4793, 4799,
    4801, 4813, 4817, 4831, 4861, 4871, 4877, 4889,
    4903, 4909, 4919, 4931, 4933, 4937, 4943, 4951,
    4957, 4967, 4969, 4973, 4987, 4993, 4999,
    0
};

void
register_primegen_progress ( void (*cb)( void *, int), void *cb_data )
{
    progress_cb = cb;
    progress_cb_data = cb_data;
}


static void
progress( int c )
{
    if ( progress_cb )
	progress_cb ( progress_cb_data, c );
    else
	fputc( c, stderr );
}


/****************
 * Generate a prime number (stored in secure memory)
 */
MPI
generate_secret_prime( unsigned  nbits )
{
    MPI prime;

    prime = gen_prime( nbits, 1, 2 );
    progress('\n');
    return prime;
}

MPI
generate_public_prime( unsigned  nbits )
{
    MPI prime;

    prime = gen_prime( nbits, 0, 2 );
    progress('\n');
    return prime;
}


/****************
 * We do not need to use the strongest RNG because we gain no extra
 * security from it - The prime number is public and we could also
 * offer the factors for those who are willing to check that it is
 * indeed a strong prime.
 *
 * mode 0: Standard
 *	1: Make sure that at least one factor is of size qbits.
 */
MPI
generate_elg_prime( int mode, unsigned pbits, unsigned qbits,
		    MPI g, MPI **ret_factors )
{
    int n;  /* number of factors */
    int m;  /* number of primes in pool */
    unsigned fbits; /* length of prime factors */
    MPI *factors; /* current factors */
    MPI *pool;	/* pool of primes */
    MPI q;	/* first prime factor (variable)*/
    MPI prime;	/* prime test value */
    MPI q_factor; /* used for mode 1 */
    byte *perms = NULL;
    int i, j;
    int count1, count2;
    unsigned nprime;
    unsigned req_qbits = qbits; /* the requested q bits size */
    MPI val_2  = mpi_alloc_set_ui( 2 );

    /* find number of needed prime factors */
    for(n=1; (pbits - qbits - 1) / n  >= qbits; n++ )
	;
    n--;
    if( !n || (mode==1 && n < 2) )
	log_fatal("can't gen prime with pbits=%u qbits=%u\n", pbits, qbits );
    if( mode == 1 ) {
	n--;
	fbits = (pbits - 2*req_qbits -1) / n;
	qbits =  pbits - req_qbits - n*fbits;
    }
    else {
	fbits = (pbits - req_qbits -1) / n;
	qbits = pbits - n*fbits;
    }
    if( DBG_CIPHER )
	log_debug("gen prime: pbits=%u qbits=%u fbits=%u/%u n=%d\n",
		    pbits, req_qbits, qbits, fbits, n  );
    prime = mpi_alloc( (pbits + BITS_PER_MPI_LIMB - 1) /  BITS_PER_MPI_LIMB );
    q = gen_prime( qbits, 0, 0 );
    q_factor = mode==1? gen_prime( req_qbits, 0, 0 ) : NULL;

    /* allocate an array to hold the factors + 2 for later usage */
    factors = m_alloc_clear( (n+2) * sizeof *factors );

    /* make a pool of 3n+5 primes (this is an arbitrary value) */
    m = n*3+5;
    if( mode == 1 )
	m += 5; /* need some more for DSA */
    if( m < 25 )
	m = 25;
    pool = m_alloc_clear( m * sizeof *pool );

    /* permutate over the pool of primes */
    count1=count2=0;
    do {
      next_try:
	if( !perms ) {
	    /* allocate new primes */
	    for(i=0; i < m; i++ ) {
		mpi_free(pool[i]);
		pool[i] = NULL;
	    }
	    /* init m_out_of_n() */
	    perms = m_alloc_clear( m );
	    for(i=0; i < n; i++ ) {
		perms[i] = 1;
		pool[i] = gen_prime( fbits, 0, 0 );
		factors[i] = pool[i];
	    }
	}
	else {
	    m_out_of_n( perms, n, m );
	    for(i=j=0; i < m && j < n ; i++ )
		if( perms[i] ) {
		    if( !pool[i] )
			pool[i] = gen_prime( fbits, 0, 0 );
		    factors[j++] = pool[i];
		}
	    if( i == n ) {
		m_free(perms); perms = NULL;
		progress('!');
		goto next_try;	/* allocate new primes */
	    }
	}

	mpi_set( prime, q );
	mpi_mul_ui( prime, prime, 2 );
	if( mode == 1 )
	    mpi_mul( prime, prime, q_factor );
	for(i=0; i < n; i++ )
	    mpi_mul( prime, prime, factors[i] );
	mpi_add_ui( prime, prime, 1 );
	nprime = mpi_get_nbits(prime);
	if( nprime < pbits ) {
	    if( ++count1 > 20 ) {
		count1 = 0;
		qbits++;
		progress('>');
		q = gen_prime( qbits, 0, 0 );
		goto next_try;
	    }
	}
	else
	    count1 = 0;
	if( nprime > pbits ) {
	    if( ++count2 > 20 ) {
		count2 = 0;
		qbits--;
		progress('<');
		q = gen_prime( qbits, 0, 0 );
		goto next_try;
	    }
	}
	else
	    count2 = 0;
    } while( !(nprime == pbits && check_prime( prime, val_2 )) );

    if( DBG_CIPHER ) {
	progress('\n');
	log_mpidump( "prime    : ", prime );
	log_mpidump( "factor  q: ", q );
	if( mode == 1 )
	    log_mpidump( "factor q0: ", q_factor );
	for(i=0; i < n; i++ )
	    log_mpidump( "factor pi: ", factors[i] );
	log_debug("bit sizes: prime=%u, q=%u", mpi_get_nbits(prime), mpi_get_nbits(q) );
	if( mode == 1 )
	    fprintf(stderr, ", q0=%u", mpi_get_nbits(q_factor) );
	for(i=0; i < n; i++ )
	    fprintf(stderr, ", p%d=%u", i, mpi_get_nbits(factors[i]) );
	progress('\n');
    }

    if( ret_factors ) { /* caller wants the factors */
	*ret_factors = m_alloc_clear( (n+2) * sizeof **ret_factors);
	if( mode == 1 ) {
	    i = 0;
	    (*ret_factors)[i++] = mpi_copy( q_factor );
	    for(; i <= n; i++ )
		(*ret_factors)[i] = mpi_copy( factors[i] );
	}
	else {
	    for(; i < n; i++ )
		(*ret_factors)[i] = mpi_copy( factors[i] );
	}
    }

    if( g ) { /* create a generator (start with 3)*/
	MPI tmp   = mpi_alloc( mpi_get_nlimbs(prime) );
	MPI b	  = mpi_alloc( mpi_get_nlimbs(prime) );
	MPI pmin1 = mpi_alloc( mpi_get_nlimbs(prime) );

	if( mode == 1 )
	    BUG(); /* not yet implemented */
	factors[n] = q;
	factors[n+1] = mpi_alloc_set_ui(2);
	mpi_sub_ui( pmin1, prime, 1 );
	mpi_set_ui(g,2);
	do {
	    mpi_add_ui(g, g, 1);
	    if( DBG_CIPHER ) {
		log_debug("checking g: ");
		mpi_print( stderr, g, 1 );
	    }
	    else
		progress('^');
	    for(i=0; i < n+2; i++ ) {
		/*fputc('~', stderr);*/
		mpi_fdiv_q(tmp, pmin1, factors[i] );
		/* (no mpi_pow(), but it is okay to use this with mod prime) */
		mpi_powm(b, g, tmp, prime );
		if( !mpi_cmp_ui(b, 1) )
		    break;
	    }
	    if( DBG_CIPHER )
		progress('\n');
	} while( i < n+2 );
	mpi_free(factors[n+1]);
	mpi_free(tmp);
	mpi_free(b);
	mpi_free(pmin1);
    }
    if( !DBG_CIPHER )
	progress('\n');

    m_free( factors );	/* (factors are shallow copies) */
    for(i=0; i < m; i++ )
	mpi_free( pool[i] );
    m_free( pool );
    m_free(perms);
    mpi_free(val_2);
    return prime;
}



static MPI
gen_prime( unsigned  nbits, int secret, int randomlevel )
{
    unsigned  nlimbs;
    MPI prime, ptest, pminus1, val_2, val_3, result;
    int i;
    unsigned x, step;
    unsigned count1, count2;
    int *mods;

    if( 0 && DBG_CIPHER )
	log_debug("generate a prime of %u bits ", nbits );

    if( !no_of_small_prime_numbers ) {
	for(i=0; small_prime_numbers[i]; i++ )
	    no_of_small_prime_numbers++;
    }
    mods = m_alloc( no_of_small_prime_numbers * sizeof *mods );
    /* make nbits fit into MPI implementation */
    nlimbs = (nbits + BITS_PER_MPI_LIMB - 1) /	BITS_PER_MPI_LIMB;
    val_2  = mpi_alloc_set_ui( 2 );
    val_3 = mpi_alloc_set_ui( 3);
    prime  = secret? mpi_alloc_secure( nlimbs ): mpi_alloc( nlimbs );
    result = mpi_alloc_like( prime );
    pminus1= mpi_alloc_like( prime );
    ptest  = mpi_alloc_like( prime );
    count1 = count2 = 0;
    for(;;) {  /* try forvever */
	int dotcount=0;

	/* generate a random number */
	{   char *p = get_random_bits( nbits, randomlevel, secret );
	    mpi_set_buffer( prime, p, (nbits+7)/8, 0 );
	    m_free(p);
	}

	/* set high order bit to 1, set low order bit to 1 */
	mpi_set_highbit( prime, nbits-1 );
	mpi_set_bit( prime, 0 );

	/* calculate all remainders */
	for(i=0; (x = small_prime_numbers[i]); i++ )
	    mods[i] = mpi_fdiv_r_ui(NULL, prime, x);

	/* now try some primes starting with prime */
	for(step=0; step < 20000; step += 2 ) {
	    /* check against all the small primes we have in mods */
	    count1++;
	    for(i=0; (x = small_prime_numbers[i]); i++ ) {
		while( mods[i] + step >= x )
		    mods[i] -= x;
		if( !(mods[i] + step) )
		    break;
	    }
	    if( x )
		continue;   /* found a multiple of an already known prime */

	    mpi_add_ui( ptest, prime, step );

	    /* do a faster Fermat test */
	    count2++;
	    mpi_sub_ui( pminus1, ptest, 1);
	    mpi_powm( result, val_2, pminus1, ptest );
	    if( !mpi_cmp_ui( result, 1 ) ) { /* not composite */
		/* perform stronger tests */
		if( is_prime(ptest, 5, &count2 ) ) {
		    if( !mpi_test_bit( ptest, nbits-1 ) ) {
			progress('\n');
			log_debug("overflow in prime generation\n");
			break; /* step loop, continue with a new prime */
		    }

		    mpi_free(val_2);
		    mpi_free(val_3);
		    mpi_free(result);
		    mpi_free(pminus1);
		    mpi_free(prime);
		    m_free(mods);
		    return ptest;
		}
	    }
	    if( ++dotcount == 10 ) {
		progress('.');
		dotcount = 0;
	    }
	}
	progress(':'); /* restart with a new random value */
    }
}

/****************
 * Returns: true if this may be a prime
 */
static int
check_prime( MPI prime, MPI val_2 )
{
    int i;
    unsigned x;
    int count=0;

    /* check against small primes */
    for(i=0; (x = small_prime_numbers[i]); i++ ) {
	if( mpi_divisible_ui( prime, x ) )
	    return 0;
    }

    /* a quick fermat test */
    {
	MPI result = mpi_alloc_like( prime );
	MPI pminus1 = mpi_alloc_like( prime );
	mpi_sub_ui( pminus1, prime, 1);
	mpi_powm( result, val_2, pminus1, prime );
	mpi_free( pminus1 );
	if( mpi_cmp_ui( result, 1 ) ) { /* if composite */
	    mpi_free( result );
	    progress('.');
	    return 0;
	}
	mpi_free( result );
    }

    /* perform stronger tests */
    if( is_prime(prime, 5, &count ) )
	return 1; /* is probably a prime */
    progress('.');
    return 0;
}


/****************
 * Return true if n is probably a prime
 */
static int
is_prime( MPI n, int steps, int *count )
{
    MPI x = mpi_alloc( mpi_get_nlimbs( n ) );
    MPI y = mpi_alloc( mpi_get_nlimbs( n ) );
    MPI z = mpi_alloc( mpi_get_nlimbs( n ) );
    MPI nminus1 = mpi_alloc( mpi_get_nlimbs( n ) );
    MPI a2 = mpi_alloc_set_ui( 2 );
    MPI q;
    unsigned i, j, k;
    int rc = 0;
    unsigned nbits = mpi_get_nbits( n );

    mpi_sub_ui( nminus1, n, 1 );

    /* find q and k, so that n = 1 + 2^k * q */
    q = mpi_copy( nminus1 );
    k = mpi_trailing_zeros( q );
    mpi_tdiv_q_2exp(q, q, k);

    for(i=0 ; i < steps; i++ ) {
	++*count;
	if( !i ) {
	    mpi_set_ui( x, 2 );
	}
	else {
	    /*mpi_set_bytes( x, nbits-1, get_random_byte, 0 );*/
	    {	char *p = get_random_bits( nbits, 0, 0 );
		mpi_set_buffer( x, p, (nbits+7)/8, 0 );
		m_free(p);
	    }
	    /* make sure that the number is smaller than the prime
	     * and keep the randomness of the high bit */
	    if( mpi_test_bit( x, nbits-2 ) ) {
		mpi_set_highbit( x, nbits-2 ); /* clear all higher bits */
	    }
	    else {
		mpi_set_highbit( x, nbits-2 );
		mpi_clear_bit( x, nbits-2 );
	    }
	    assert( mpi_cmp( x, nminus1 ) < 0 && mpi_cmp_ui( x, 1 ) > 0 );
	}
	mpi_powm( y, x, q, n);
	if( mpi_cmp_ui(y, 1) && mpi_cmp( y, nminus1 ) ) {
	    for( j=1; j < k && mpi_cmp( y, nminus1 ); j++ ) {
		mpi_powm(y, y, a2, n);
		if( !mpi_cmp_ui( y, 1 ) )
		    goto leave; /* not a prime */
	    }
	    if( mpi_cmp( y, nminus1 ) )
		goto leave; /* not a prime */
	}
	progress('+');
    }
    rc = 1; /* may be a prime */

  leave:
    mpi_free( x );
    mpi_free( y );
    mpi_free( z );
    mpi_free( nminus1 );
    mpi_free( q );

    return rc;
}


static void
m_out_of_n( char *array, int m, int n )
{
    int i=0, i1=0, j=0, jp=0,  j1=0, k1=0, k2=0;

    if( !m || m >= n )
	return;

    if( m == 1 ) { /* special case */
	for(i=0; i < n; i++ )
	    if( array[i] ) {
		array[i++] = 0;
		if( i >= n )
		    i = 0;
		array[i] = 1;
		return;
	    }
	BUG();
    }

    for(j=1; j < n; j++ ) {
	if( array[n-1] == array[n-j-1] )
	    continue;
	j1 = j;
	break;
    }

    if( m & 1 ) { /* m is odd */
	if( array[n-1] ) {
	    if( j1 & 1 ) {
		k1 = n - j1;
		k2 = k1+2;
		if( k2 > n )
		    k2 = n;
		goto leave;
	    }
	    goto scan;
	}
	k2 = n - j1 - 1;
	if( k2 == 0 ) {
	    k1 = i;
	    k2 = n - j1;
	}
	else if( array[k2] && array[k2-1] )
	    k1 = n;
	else
	    k1 = k2 + 1;
    }
    else { /* m is even */
	if( !array[n-1] ) {
	    k1 = n - j1;
	    k2 = k1 + 1;
	    goto leave;
	}

	if( !(j1 & 1) ) {
	    k1 = n - j1;
	    k2 = k1+2;
	    if( k2 > n )
		k2 = n;
	    goto leave;
	}
      scan:
	jp = n - j1 - 1;
	for(i=1; i <= jp; i++ ) {
	    i1 = jp + 2 - i;
	    if( array[i1-1]  ) {
		if( array[i1-2] ) {
		    k1 = i1 - 1;
		    k2 = n - j1;
		}
		else {
		    k1 = i1 - 1;
		    k2 = n + 1 - j1;
		}
		goto leave;
	    }
	}
	k1 = 1;
	k2 = n + 1 - m;
    }
  leave:
    array[k1-1] = !array[k1-1];
    array[k2-1] = !array[k2-1];
}

