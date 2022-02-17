   ////////x///////x///////x///////x///////x///////x///////x///////x///////x////

   #ifndef __MZ_HPP__
   #define __MZ_HPP__

   #pragma pack(push)
   #pragma pack(1)

   typedef struct MZ_STRUCT
   {
   short    mz_id;
   short    mz_last512;
   short    mz_num512;
   short    mz_relnum;
   short    mz_headersize;
   short    mz_minmem;
   short    mz_maxmem;
   short    mz_ss;
   short    mz_sp;
   short    mz_checksum;
   short    mz_ip;
   short    mz_cs;
   short    mz_relofs;
   short    mz_ovrnum;
   char    mz_reserved[32];
   int    mz_neptr;
   } MZ_HEADER;

   #pragma pack(pop)

   #endif // __MZ_HPP__

   ////////x///////x///////x///////x///////x///////x///////x///////x///////x////
