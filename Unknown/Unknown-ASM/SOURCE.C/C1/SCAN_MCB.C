
// scan_mcb.c

#include"v.h"
#include"v_std.h"

int scan_mcb(int first)
{ // returns 0 if already present
  // seg to copy if not present
  struct MCB far * Block;
  unsigned int far *pres;
  Block = MK_FP(first,0);

  while( Block->type != 'Z' )   // not last
  Block = MK_FP(FP_SEG(Block) + Block->Size + 1 ,  0);

  pres = MK_FP( FP_SEG(Block) + 1, (unsigned) &presence );
  if( *pres == presence )  return 0; // Already;
  

  Block->Size -= ( BodySize / 16u + 1);
  Block->type = 'M';           	// middle
  Block = MK_FP(FP_SEG(Block) + Block->Size + 1, 0);
  Block->type = 'Z';
  Block->Owner = FP_SEG(Block) + 1;  	// itself
  Block->Size  = BodySize / 16u ;
  return FP_SEG(Block) + 1;
  }

void copy_body(int seg)
  { 
char far * dst;
char far * src;
dst = MK_FP(seg,0);
src = MK_FP(_CS,0);
while(FP_OFF(dst) < (unsigned) &end_of_program) *dst++ = *src++;  
return;
}
