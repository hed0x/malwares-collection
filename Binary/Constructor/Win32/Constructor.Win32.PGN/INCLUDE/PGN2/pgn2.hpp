
#ifndef __PGN2_HPP__
#define __PGN2_HPP__

#pragma pack(push)
#pragma pack(1)

#define MIN_PLUGIN_SIZE         64         // min compressed size

#define FL_PGN2_UNRESOLVED      0x00000001 // -- unresolved imports, disabled
#define FL_PGN2_INITIALIZED     0x00000002 // -- used to decide, call
                                           //    unload() or not, when
                                           //    replacing with new version
#define FL_PGN2_SEHERROR        0x00000004 // -- SEH error handled, disabled
#define FL_PGN2_DETACHED        0x00000008 // -- temporary, ==skip freevirt

#define pe_dynflags     pe_id              // FL_PGN2_xxx
#define pe_handleevent  pe_checksum
#define pe_priority     pe_datetime
#define pe_unloadcode   pe_loaderflags     // temporary
#define pe_pgnsubver    pe_reserved        // ==1

struct pgn2_header
{
DWORD pgn2_id;                          // CRC32('lowercased name')
DWORD pgn2_version;                     // 1,2,...
DWORD pgn2_compressed;                  // compressed data size
DWORD pgn2_decompressed;                // decompressed data size, PE format
// BYTE * compressed_size
};

// LDRWIN32.PluginList points to first plugin list entry
struct list_entry
{
pgn2_header*            list_phys;      // physical image
BYTE*                   list_virt;      // *PE_in_memory, virtual image
list_entry*             list_next;      // next list entry or NULL
};

#pragma pack(pop)

#endif // __PGN2_HPP__
