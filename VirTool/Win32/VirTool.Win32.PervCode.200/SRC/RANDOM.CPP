
DWORD randseed;

inline DWORD rnd(DWORD x)
{
  return (((randseed = randseed * 214013 + 2531011) >> 16) * x) >> 16;
}
