/* permutation.h   algorithm that do permutations
 *
 * Gildo backdoor generator is copyright (C) 2002 Mauro Meneghin.
 * All rights reserved. The software is redistributable under
 * the licence given in the file "Licence" distributed in the
 * Gbkdoor archive.
 */


/* this will create all possible permutations
 * of a vector of pointers, the function
 * will give the next permutation until
 * one exist returning 0, otherwise returns -1
 */

/* how my algo works:
 *
 * counter is a unsigned number that you can image
 * as in base N and having N digits.
 * counter rappresent the permutation so:
 * his digit-0 value is the number of the 
 * first element of the permutation,
 * digit-1 (called position 1) gives the 
 * second element of the permutation, and
 * so on
 */



#ifndef _permutation_h_
#define _permutation_h_


#include <stdio.h>
#include <assert.h>
#include <stdlib.h>

/* having arrays bigger then this
 * will cause an assertion
 */
#define MAX_NUM_OF_ELEMENTS 9


class Permutation
{
/* counter is an index that address directly the
 * position of the elements into the current permutation
 * counter[i] are the various digits,
 * the most significan digits have littler i (position)
 */
int* counter;


/* N is the number of elements inside my
 * array to permute, it is the base of
 * counter too
 */
int N;

bool bIsValid;

public:  //user interface functions

Permutation(int Nelements=0);
~Permutation();

int initpermutation(int Nelements);

int nextpermutation();

int endpermutation();

void Dump();

int assign(void *original, void *permutated);

private:
int inline needtoincrement();
int inline increment(int index);
};



#endif



