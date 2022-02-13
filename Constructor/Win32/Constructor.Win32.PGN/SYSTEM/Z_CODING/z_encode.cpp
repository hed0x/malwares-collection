
#define MIN(a,b)        ((a)<(b)?(a):(b))
#define MAX(a,b)        ((a)>(b)?(a):(b))

int kind = 256;

void compress(BYTE* ibuf, DWORD isize, BYTE* obuf)
{
  BYTE* q = obuf + 8;

  DWORD code = 0, len = 0;

#define flush         {                        \
                        while (len >= 8)       \
                        {                      \
                          *q++ = code;         \
                          code >>= 8;          \
                          len -= 8;            \
                        }                      \
                      }

#define out_bit(x)    {                        \
                        code |= (x) << len++;  \
                        flush;                 \
                      }

#define out_byte(x)   {                        \
                        assert((x)<=255);      \
                        code |= (x) << len;    \
                        len += 8;              \
                        flush;                 \
                      }

  int i0=0;
  for (int i=0; i<isize; i++)
  {
    if ((i-i0>256)||(i==isize-1))
    {
      i0=i;
      printf("%3i%%\x0D",isize==0?0:i*100/isize);
    }

    DWORD c=0, z=7000, d=0;
    while ((ibuf[i+c]==0)&&(i+c<isize)&&(c+1<=255+4)) c++;
    if (c==2) z=7001;
    if (c==3) z=7002;
    if (c>=4) z=7003;

    if (c<2)
    {

      DWORD maxc=0, maxj=0;
      for (int j=MAX(i-kind,0); j<i; j++)
      {
        DWORD c=0;
        while ((ibuf[i+c] == ibuf[j+c]) && (j+c<i) && (c+1<=255+2)) c++;
        if (maxc<=c)
        {
          maxc=c;
          maxj=j;
        }
      }

      if (maxc>=2)
      {
        d = i - maxj - maxc;
        if (d <= 65535)
        if ((  (c<=5 ? 2+2:3+8) + 1 + (d<=255?8:16)  ) < maxc*8 )
        {
          c = maxc;
          if (c<=5) z=7004;
          if (c>=6) z=7005;
        }
      }

    }

    if (z==7000)
    {
      c=1;
      out_bit(0);
      out_byte(ibuf[i]);
    }
    if (z==7001)
    {
      out_bit(1);
      out_bit(1);
      out_bit(1);
      out_bit(0);
    }
    if (z==7002)
    {
      out_bit(1);
      out_bit(1);
      out_bit(1);
      out_bit(1);
      out_bit(0);
    }
    if (z==7003)
    {
      out_bit(1);
      out_bit(1);
      out_bit(1);
      out_bit(1);
      out_bit(1);
      out_byte(c-4);
    }
    if (z==7004)
    {
      out_bit(1);
      out_bit(0);
      out_bit( (c-2)>>1  );
      out_bit( (c-2)&1  );
    }
    if (z==7005)
    {
      out_bit(1);
      out_bit(1);
      out_bit(0);
      out_byte(c-2);
    }
    if ((z==7004)||(z==7005))
    {
      out_byte(d&255);
      if (d<=255)
      {
        out_bit(0);
      }
      else
      {
        out_bit(1);
        out_byte(d>>8);
      }
    }
    i+=c-1;

  }

  while (len!=0) out_bit(0);

  *(DWORD*)&obuf[0] = (q - obuf) - 8;
  *(DWORD*)&obuf[4] = isize;            // decompressed

  printf("%i --> %i, %i%%\n", isize, q-obuf, isize==0?0:(q-obuf)*100/isize);

}  //compress
