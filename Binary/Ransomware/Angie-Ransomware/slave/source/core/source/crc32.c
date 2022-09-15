#include <crc32.h>

DWORD
(* Crc32SumBuffer)(
    IN PVOID  pBuffer,
    IN SIZE_T cbBuffer
    ) = (PVOID)RTLP_LCG_NATIVE;

DWORD
FastCrc32SumBuffer(
    IN PVOID  pBuffer,
    IN SIZE_T cbBuffer
    )
{
    DWORD dwCrc = 0xFFFFFFFF;

    for (ULONG_PTR i = 0; i != cbBuffer; i++) {
        dwCrc = _mm_crc32_u8(dwCrc, ((PBYTE)pBuffer)[i]);
    }

    return ~dwCrc;
}

#define CRC32_POLYNOMIAL 0x82F63B78

DWORD
SlowCrc32SumBuffer(
    IN PVOID  pBuffer,
    IN SIZE_T cbBuffer
    )
{
    DWORD dwCrc = 0xFFFFFFFF;

    for (ULONG_PTR i = 0; i != cbBuffer; i++) {
        dwCrc ^= ((PBYTE)pBuffer)[i];

        for (ULONG_PTR y = 0; y != 8; y++) {
            dwCrc = dwCrc & 1 ? (dwCrc >> 1) ^ CRC32_POLYNOMIAL : dwCrc  >> 1;
        }
    }

    return ~dwCrc;
}
