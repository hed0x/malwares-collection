
// MZ.H - MZ header
// Copyright (C) 1998 Z0MBiE/29A

typedef struct mzheader
  {
    word        id;                 // MZ
    word        last512;
    word        num512;
    word        relnum;
    word        headersize;
    word        minmem;
    word        maxmem;
    word        ss;
    word        sp;
    word        checksum;
    word        ip;
    word        cs;
    word        relofs;
    word        ovrnum;
    byte        unused[32];
    dword       neptr;
  } mzheader;

