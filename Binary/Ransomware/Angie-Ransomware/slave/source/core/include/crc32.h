#ifndef CRC32_INCLUDED
#define CRC32_INCLUDED

#include <config.h>

extern
DWORD
(* Crc32SumBuffer)(
    IN PVOID  pBuffer,
    IN SIZE_T cbBuffer
    );

DWORD
FastCrc32SumBuffer(
    IN PVOID  pBuffer,
    IN SIZE_T cbBuffer
    );

DWORD
SlowCrc32SumBuffer(
    IN PVOID  pBuffer,
    IN SIZE_T cbBuffer
    );

static
VOID
FORCEINLINE
InitCrc32(VOID)
{
    $DLOG1(DLG_FLT_INFO, "Initializing CRC32");
    $DLOG3(DLG_FLT_DEFAULT, Config.Features.bSSE5 ? "Using CRC32 instructions" : "Using the slow method");

    Crc32SumBuffer = Config.Features.bSSE5 ? FastCrc32SumBuffer : SlowCrc32SumBuffer;

    $DLOG2(DLG_FLT_INFO, "Done");
}

#endif
