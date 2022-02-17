
// RANDOM.C - random number generator, 16-bit
// Copyright (C) 1998 Z0MBiE/29A

word rndword;           // current random word

word random(void);                   // get random word
word rnd(word range);                // get random word in range [0..range-1]
word rnd_minmax(word min, word max); // get random word in range [min..max]

word random(void)
  {
    asm
        mov     bx, rndword
        in      al, 40h         // system counters
        xor     bl, al
        in      al, 40h
        add     bh, al
        in      al, 41h
        sub     bl, al
        in      al, 41h
        xor     bh, al
        in      al, 42h
        add     bl, al
        in      al, 42h
        sub     bh, al
        mov     ax, bx
        rol     ax, 1
        xor     dx, dx
        mov     cx, 10007
        mul     cx
        inc     ax
        rol     ax, 1
        mov     rndword, ax
    end;
    return(_AX);
  }

word rnd(word range)
  {
    if (range == 0)
      return(0);
    else
      return(random() % range);
  }

word rnd_minmax(word min, word max)
  {
    return(rnd(max-min+1) + min);
  }
