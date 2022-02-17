
////////x///////x///////x///////x///////x///////x///////x///////x///////x////

#ifndef __PE_HPP__
#define __PE_HPP__

#pragma pack(push)
#pragma pack(1)

typedef struct PE_STRUCT
{
DWORD   pe_id;                  // 00 01 02 03
WORD    pe_cputype;             // 04 05
WORD    pe_numofobjects;        // 06 07
DWORD   pe_datetime;            // 08 09 0A 0B
DWORD   pe_coffptr;             // 0C 0D 0E 0F
DWORD   pe_coffsize;            // 10 11 12 13
WORD    pe_ntheadersize;        // 14 15
WORD    pe_flags;               // 16 17
        // NT_Header {
WORD    pe_magic;               // 18 19
BYTE    pe_linkmajor;           // 1A
BYTE    pe_linkminor;           // 1B
DWORD   pe_sizeofcode;          // 1C 1D 1E 1F
DWORD   pe_sizeofidata;         // 20 21 22 23
DWORD   pe_sizeofudata;         // 24 25 26 27
DWORD   pe_entrypointrva;       // 28 29 2A 2B
DWORD   pe_baseofcode;          // 2C 2D 2E 2F
DWORD   pe_baseofdata;          // 30 31 32 33
DWORD   pe_imagebase;           // 34 35 36 37
DWORD   pe_objectalign;         // 38 39 3A 3B
DWORD   pe_filealign;           // 3C 3D 3E 3F
WORD    pe_osmajor;             // 40 41
WORD    pe_osminor;             // 42 43
WORD    pe_usermajor;           // 44 45
WORD    pe_userminor;           // 46 47
WORD    pe_subsysmajor;         // 48 49
WORD    pe_subsysminor;         // 4A 4B
DWORD   pe_reserved;            // 4C 4D 4E 4F
DWORD   pe_imagesize;           // 50 51 52 53
DWORD   pe_headersize;          // 54 55 56 56
DWORD   pe_checksum;            // 58 59 5A 5B
WORD    pe_subsystem;           // 5C 5D
WORD    pe_dllflags;            // 5E 5F
DWORD   pe_stackreserve;        // 60 61 62 63
DWORD   pe_stackcommit;         // 64 65 66 67
DWORD   pe_heapreserve;         // 68 69 6A 6B
DWORD   pe_heapcommit;          // 6C 6D 6E 6F
DWORD   pe_loaderflags;         // 70 71 72 73
DWORD   pe_numofrvaandsizes;    // 74 75 76 77
        // rva and sizes
DWORD   pe_exportrva;           // 78 79 7A 7B
DWORD   pe_exportsize;          // 7C 7D 7E 7F
DWORD   pe_importrva;           // 80 81 82 83
DWORD   pe_importsize;          // 84 85 86 87
DWORD   pe_resourcerva;         // 88 89 8A 8B
DWORD   pe_resourcesize;        // 8C 8D 8E 8F
DWORD   pe_exceptionrva;        // 90 91 92 93
DWORD   pe_exceptionsize;       // 94 95 96 97
DWORD   pe_securityrva;         // 98 99 9A 9B
DWORD   pe_securitysize;        // 9C 9D 9E 9F
DWORD   pe_fixuprva;            // A0 A1 A2 A3
DWORD   pe_fixupsize;           // A4 A5 A6 A7
DWORD   pe_debugrva;            // A8 A9 AA AB
DWORD   pe_debugsize;           // AC AD AE AF
DWORD   pe_descriptionrva;      // B0 B1 B2 B3
DWORD   pe_descriptionsize;     // B4 B5 B6 B7
DWORD   pe_machinerva;          // B8 B9 BA BB
DWORD   pe_machinesize;         // BC BD BE BF
DWORD   pe_tlsrva;              // C0 C1 C2 C3
DWORD   pe_tlssize;             // C4 C5 C6 C7
DWORD   pe_loadconfigrva;       // C8 C9 CA CB
DWORD   pe_loadconfigsize;      // CC CD CE CF
BYTE    pe_reserved_1[8];       // D0 D1 D2 D3  D4 D5 D6 D7
DWORD   pe_iatrva;              // D8 D9 DA DB
DWORD   pe_iatsize;             // DC DD DE DF
BYTE    pe_reserved_2[8];       // E0 E1 E2 E3  E4 E5 E6 E7
BYTE    pe_reserved_3[8];       // E8 E9 EA EB  EC ED EE EF
BYTE    pe_reserved_4[8];       // F0 F1 F2 F3  F4 F5 F6 F7
// ---- total size == 0xF8 ---------
} PE_HEADER;

typedef struct PE_OBJENTRY_STRUCT
{
BYTE    oe_name[8];             // 00 01 02 03  04 05 06 07
DWORD   oe_virtsize;            // 08 09 0A 0B
DWORD   oe_virtrva;             // 0C 0D 0E 0F
DWORD   oe_physsize;            // 10 11 12 13
DWORD   oe_physoffs;            // 14 15 16 17
BYTE    oe_reserved[0x0C];      // 18 19 1A 1B   1C 1D 1E 1F  20 21 22 23
DWORD   oe_objectflags;         // 24 25 26 27
// ---- total size == 0x28 ---------
} PE_OBJENTRY;

typedef struct PE_EXPORT_STRUCT
{
DWORD   ex_flags;               // 00 01 02 03
DWORD   ex_datetime;            // 04 05 06 07
WORD    ex_major_ver;           // 08 09
WORD    ex_minor_ver;           // 0A 0B
DWORD   ex_namerva;             // 0C 0D 0E 0F
DWORD   ex_ordinalbase;         // 10 11 12 13
DWORD   ex_numoffunctions;      // 14 15 16 17
DWORD   ex_numofnamepointers;   // 18 19 1A 1B
DWORD   ex_addresstablerva;     // 1C 1D 1E 1F
DWORD   ex_namepointersrva;     // 20 21 22 23
DWORD   ex_ordinaltablerva;     // 24 25 26 27
// ---- total size == 0x28 ---------
} PE_EXPORT;

typedef struct PE_IMPORT_STRUCT
{
DWORD   im_lookup;              // 00
DWORD   im_datetime;            // 04  ?
DWORD   im_forward;             // 08  -1
DWORD   im_name;                // 0C
DWORD   im_addresstable;        // 10
// ---- total size == 0x14 ---------
} PE_IMPORT;

typedef struct PE_FIXUP_STRUCT
{
DWORD   fx_pagerva;             // 00 01 02 03
DWORD   fx_blocksize;           // 04 05 06 07
WORD    fx_typeoffs[];          // 08 09 .. ..
} PE_FIXUP;

#pragma pack(pop)

#endif // __PE_HPP__

////////x///////x///////x///////x///////x///////x///////x///////x///////x////
