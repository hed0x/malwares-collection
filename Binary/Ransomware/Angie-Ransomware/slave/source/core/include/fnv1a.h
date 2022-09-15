#ifndef FNV1A_INCLUDED
#define FNV1A_INCLUDED

#define FNV1A_X32_PRIME 0x001000193
#define FNV1A_X32_BASIS 0x0811C9DC5

static
DWORD
FORCEINLINE
Fnv1AHashStringA(
    IN PSTR szBuffer
    )
{
    DWORD dwHash = FNV1A_X32_BASIS;

    while (*szBuffer) {
        dwHash ^= *szBuffer++;
        dwHash *= FNV1A_X32_PRIME;
    }

    return dwHash;
}

static
DWORD
FORCEINLINE
Fnv1AHashStringW(
    IN PWSTR szBuffer
    )
{
    DWORD dwHash = FNV1A_X32_BASIS;

    while (*szBuffer) {
        dwHash ^= (BYTE)*szBuffer++;
        dwHash *= FNV1A_X32_PRIME;
    }

    return dwHash;
}

static
DWORD
FORCEINLINE
Fnv1AHashBuffer(
    IN PVOID  pBuffer,
    IN SIZE_T cbBuffer
    )
{
    DWORD dwHash = FNV1A_X32_BASIS;

    for (ULONG_PTR i = 0; i != cbBuffer; i++) {
        dwHash ^= ((PBYTE)pBuffer)[i];
        dwHash *= FNV1A_X32_PRIME;
    }

    return dwHash;
}

#endif
