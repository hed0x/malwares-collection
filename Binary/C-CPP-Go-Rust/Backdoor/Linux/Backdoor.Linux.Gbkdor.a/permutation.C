/* permutation.C   algorithm that do permutations
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


#include "permutation.h"



Permutation::Permutation(int Nelements=0)
{
  initpermutation(Nelements);
}

Permutation::~Permutation()
{
  endpermutation();
}




/* call this function first!
 * set counter and N to initial value,
 * alloc memory for validdigit,
 * returns 0 on success
 */
int Permutation::initpermutation(int Nelements)
{
  int i;     //digit position 
  int store; //digit to store at positon i, offset j
  bIsValid=false;
  if(Nelements<=0 || Nelements>MAX_NUM_OF_ELEMENTS) return -1;
  counter=(int*)malloc(Nelements*sizeof(int));
  if(counter==NULL) return -1; //error on memory
  N=Nelements; 
  for(i=0;i<N;i++)
    counter[i]=i;  //initial counter=0123..N-1 (base N)
  bIsValid=true;
  return 0;  
}


/* nextpermutation() is the user interface function
 * to get the next permutation into counter
 * return 0 on success
 */
int Permutation::nextpermutation()
{
  int i;
  if(bIsValid==false || increment(N-1)==-1) return -1;  //already at the maximum
  while((i=needtoincrement())!=-1)
  {
    if(increment(i)==-1) return -1;  //already at the maximum
  
  }
  return 0;
}


/* needtoincrement(), [never call this from outside, is private]
 * return the littler significant position (i)
 * of the digit to increment if already exists that 
 * digit(counter[i]) assigned to a highter priority one j<i
 */
int inline Permutation::needtoincrement()
{
  int i,j;
  for(i=N-1;i>=0;i--)
  {
    for(j=0;j<i;j++)
    {
      if(counter[j]==counter[i])
      { 
        return i;
      }
    }
  }
  return -1;  //no need to increment
}


/* increment() [never call this from outside, is private]
 * increment counter starting from digit at position index
 * and considering counter as a base N number
 */
int inline Permutation::increment(int index) //increment the digit index
{
  int i;
  for(i=index;i>=0;i--)
  {
    if(counter[i]+1<N)
    {
      counter[i]++;
      return 0;
    }else
    {
      counter[i]=0;  //there is a carriage
    }
  }
  return -1;  //the maximum is been reached
}


/* endpermutation() must be called
 * only upon end of the use of the permutation
 * functions, to release resources
 * return 0 on success
 */
int Permutation::endpermutation()
{
  int i;
  if(bIsValid==false || counter==NULL) return -1;
  free(counter);
  return 0;
}


/* Dump() print the 
 * content of counter
 */
void Permutation::Dump()
{
  int i;
  if(bIsValid==false)
  {
    fprintf(stderr, "not a valid permutation\n");
    return;
  }
  printf("counter is: ");
  for(i=0;i<N;i++) printf("%d ", counter[i]);
  printf("\n");
}


/* assign will give you the real permutated
 * array (permutated) accordingly to counter,
 * the original array must be provided too,
 * and the 2 arrays must be previously allocated
 */
int Permutation::assign(void *original, void *permutated)
{
  int i;
  void **o=(void**)original,
       **p=(void**)permutated;
  if(bIsValid==false) return -1;
  for(i=0;i<N;i++)
    p[i]=o[counter[i]];
  return 0;
}

  
