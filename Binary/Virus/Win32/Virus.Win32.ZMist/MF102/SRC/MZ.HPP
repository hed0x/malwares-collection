
////////x///////x///////x///////x///////x///////x///////x///////x///////x////

#ifndef __MZ_HPP__
#define __MZ_HPP__

#pragma pack(push)
#pragma pack(1)

typedef struct MZ_STRUCT
{
WORD    mz_id;
WORD    mz_last512;
WORD    mz_num512;
WORD    mz_relnum;
WORD    mz_headersize;
WORD    mz_minmem;
WORD    mz_maxmem;
WORD    mz_ss;
WORD    mz_sp;
WORD    mz_checksum;
WORD    mz_ip;
WORD    mz_cs;
WORD    mz_relofs;
WORD    mz_ovrnum;
BYTE    mz_reserved[32];
DWORD   mz_neptr;
} MZ_HEADER;

#pragma pack(pop)

#endif // __MZ_HPP__

////////x///////x///////x///////x///////x///////x///////x///////x///////x////
