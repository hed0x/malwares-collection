#ifndef CRC32_INCLUDED
#define CRC32_INCLUDED

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

#endif
