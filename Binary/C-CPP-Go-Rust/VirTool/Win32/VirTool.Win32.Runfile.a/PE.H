
// PE.H - PE header & objecttable
// Copyright (C) 1998 Z0MBiE/29A

typedef struct peheader
  {
    dword               id;                 // 00 01 02 03
    word                cputype;            // 04 05
    word                numofobjects;       // 06 07
    dword               timedatestamp;      // 08 09 0A 0B
    dword               coffptr;            // 0C 0D 0E 0F
    dword               coffsize;           // 10 11 12 13
    word                ntheadersize;       // 14 15
    word                flags;              // 16 17
    // nt header below
    word                magic;              // 18 19
    byte                linkmajor;          // 1A
    byte                linkminor;          // 1B
    dword               sizeofcode;         // 1C 1D 1E 1F
    dword               sizeofidata;        // 20 21 22 23
    dword               sizeofudata;        // 24 25 26 27
    dword               entrypointrva;      // 28 29 2A 2B
    dword               baseofcode;         // 2C 2D 2E 2F
    dword               baseofdata;         // 30 31 32 33
    dword               imagebase;          // 34 35 36 37
    dword               objectalign;        // 38 39 3A 3B
    dword               filealign;          // 3C 3D 3E 3F
    word                osmajor;            // 40 41
    word                osminor;            // 42 43
    word                usermajor;          // 44 45
    word                userminor;          // 46 47
    word                subsysmajor;        // 48 49
    word                subsysminor;        // 4A 4B
    dword               reserved;           // 4C 4D 4E 4F
    dword               imagesize;          // 50 51 52 53
    dword               headersize;         // 54 55 56 56
    dword               checksum;           // 58 59 5A 5B
    word                subsystem;          // 5C 5D
    word                dllflags;           // 5E 5F
    dword               stackreserve;       // 60 61 62 63
    dword               stackcommit;        // 64 65 66 67
    dword               heapreserve;        // 67 60 6A 6B
    dword               heapcommit;         // 6C 6D 6E 6F
    dword               loaderflags;        // 70 71 72 73
    dword               numofrvaandsizes;   // 74 75 76 77
    // rva and sizes
    dword               exportrva;          // 78 79 7A 7B
    dword               exportsize;         // 7C 7D 7E 7F
    dword               importrva;          // 80 81 82 83
    dword               importsize;         // 84 85 86 87
    dword               resourcerva;        // 88 89 8A 8B
    dword               resourcesize;       // 8C 8D 8E 8F
    dword               exceptionrva;       // 90 91 92 93
    dword               exceptionsize;      // 94 95 96 97
    dword               securityrva;        // 98 99 9A 9B
    dword               securitysize;       // 9C 9D 9E 9F
    dword               fixuprva;           // A0 A1 A2 A3
    dword               fixupsize;          // A4 A5 A6 A7
    dword               debugrva;           // A8 A9 AA AB
    dword               debugsize;          // AC AD AE AF
    dword               descriptionrva;     // B0 B1 B2 B3
    dword               descriptionsize;    // B4 B5 B6 B7
    dword               machinerva;         // B8 B9 BA BB
    dword               machinesize;        // BC BD BE BF
    dword               tlsrva;             // C0 C1 C2 C3
    dword               tlssize;            // C4 C5 C6 C7
    dword               loadconfigrva;      // C8 C9 CA CB
    dword               loadconfigsize;     // CC CD CE CF
    byte                reserved_1[8];      // D0 D1 D2 D3 D4 D5 D6 D7
    dword               iatrva;             // D8 D9 DA DB
    dword               iatsize;            // DC DD DE DF
    byte                reserved_2[8];      // E0 E1 E2 E3 E4 E5 E6 E7
    byte                reserved_3[8];      // E8 E9 EA EB EC ED EE EF
    byte                reserved_4[8];      // F0 F1 F2 F3 F4 F5 F6 F7
    // --------- total size = 0xF8 ---------
  } peheader;

typedef struct objentry
  {
    char                name[8];            // 00 01 02 03 04 05 06 07
    dword               virtualsize;        // 08 09 0A 0B
    dword               sectionrva;         // 0C 0D 0E 0F
    dword               physicalsize;       // 10 11 12 13
    dword               physicaloffset;     // 14 15 16 17
    byte                reserved[0x0C];     // 18 19 1A 1B 1C 1D 1E 1F 20 21 22 23
    dword               objectflags;        // 24 25 26 27
    // --------- total size = 0x28 ---------
  } objentry;
