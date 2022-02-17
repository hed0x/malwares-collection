
#include <windows.h>

unsigned long randseed = GetTickCount();

inline unsigned long rnd(unsigned long x)
{
  return (randseed = randseed * 214013 + 2531011) % x;  // DISKREET consts
}
