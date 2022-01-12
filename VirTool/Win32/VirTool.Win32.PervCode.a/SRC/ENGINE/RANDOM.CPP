
DWORD randseed;

inline DWORD rnd(DWORD x)
{
  return (((randseed = randseed * 0x8088405 + 1) >> 16) * x) >> 16;
}
