#include <aeskey.h>
#include <aes.h>
#include <crc32.h>
#include <cpu.h>
#include <config.h>
#include <console.h>
#include <bcrypt.h>

/*
    No need of good random since there is no weak aes keys (but weak algorithms...)
    if you think RDRAND is backdoored by the NSA, the NSA doesn't care about you, so you are safe
*/

#define IS_BCRYPT_ERROR(X)  ((X))
#define NOT_BCRYPT_ERROR(X) (!(X))

#define ROTL64(X, SHIFT) ((X << SHIFT) | (X >> (64 - SHIFT)))

typedef struct _XOROSHIRO_SEED {
    QWORD Salth;
    QWORD Seed[2];
} XOROSHIRO_SEED, *PXOROSHIRO_SEED;

BOOL
(* AesKeyGenerate)(
    OUT PAESKEY Key
    );

static XOROSHIRO_SEED XoroshiroSeed;

static
QWORD
FORCEINLINE
Xoroshiro128p(VOID)
{
    QWORD qw0 = XoroshiroSeed.Seed[0];
    QWORD qw1 = XoroshiroSeed.Seed[1];
    QWORD qw2 = (qw0 + qw1) ^ XoroshiroSeed.Salth;

    qw1 ^= qw0;
    XoroshiroSeed.Seed[0] = ROTL64(qw0, 24) ^ qw1 ^ (qw1 << 16);
    XoroshiroSeed.Seed[1] = ROTL64(qw1, 37); 

    return qw2;
}

BOOL
AesKeyGenerateXoroshiro(
    OUT PAESKEY Key
    )
{
    PRAGMA_LOOP_UNROLL
    for (ULONG_PTR i = 0; i != sizeof(AESKEY) / sizeof(QWORD); i++) {
        ((PQWORD)Key)[i] = Xoroshiro128p();
    }

    return TRUE;
}

BOOL
InitAesKeyGenerateXoroshiro(VOID)
{
    if (CpuFeatures.RdRand) {
        for (ULONG_PTR i = 0; i != sizeof(XoroshiroSeed) / sizeof(DWORD); i++) {
            while (!_rdrand32_step((PVOID)((PDWORD)&XoroshiroSeed + i)));
        }

        return TRUE;
    } else if (NOT_BCRYPT_ERROR(BCryptGenRandom(NULL, (PVOID)&XoroshiroSeed, sizeof(XoroshiroSeed), BCRYPT_USE_SYSTEM_PREFERRED_RNG))) {
        return TRUE;
    }

    ConsolePrint("Couldn't generate seed\n");

    return FALSE;
}

BOOL
AesKeyGenerateHardware(
    OUT PAESKEY Key
    )
{
    PRAGMA_LOOP_UNROLL
    for (ULONG_PTR i = 0; i != sizeof(AESKEY) / sizeof(DWORD); i++) {
        while (!_rdrand32_step((PVOID)&((PDWORD)Key)[i]));
    }

    return TRUE;
}

BOOL
AesKeyGenerateBCrypt(
    OUT PAESKEY Key
    )
{
    return NOT_BCRYPT_ERROR(BCryptGenRandom(NULL, (PVOID)Key, sizeof(AESKEY), BCRYPT_USE_SYSTEM_PREFERRED_RNG));
}
