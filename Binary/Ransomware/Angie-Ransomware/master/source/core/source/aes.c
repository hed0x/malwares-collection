#include <wmmintrin.h>
#include <aes.h>

/*
    TODO: realy old code, optimize
*/

ULONG AesExpandedKeySize;

VOID
(* AesEncryptBlock)(
    IO PVOID PlainText,
    IN PVOID Key
    );

VOID
(* AesDecryptBlock)(
    IO PVOID PlainText,
    IN PVOID Key
    );

VOID
(* AesLoadKey)(
    IN  PVOID Key,
    OUT PVOID ExpandedKey
    );

#define AES_STATE_COLUMS 4
#define AES_STATE_ROWS   4
#define AES_STATE_SIZE   16
#define AES_ROUNDS       10

static CONST BYTE cSbox[] = {
    0x63, 0x7C, 0x77, 0x7B, 0xF2, 0x6B, 0x6F, 0xC5, 0x30, 0x01, 0x67, 0x2B, 0xFE, 0xD7, 0xAB, 0x76,
    0xCA, 0x82, 0xC9, 0x7D, 0xFA, 0x59, 0x47, 0xF0, 0xAD, 0xD4, 0xA2, 0xAF, 0x9C, 0xA4, 0x72, 0xC0,
    0xB7, 0xFD, 0x93, 0x26, 0x36, 0x3F, 0xF7, 0xCC, 0x34, 0xA5, 0xE5, 0xF1, 0x71, 0xD8, 0x31, 0x15,
    0x04, 0xC7, 0x23, 0xC3, 0x18, 0x96, 0x05, 0x9A, 0x07, 0x12, 0x80, 0xE2, 0xEB, 0x27, 0xB2, 0x75,
    0x09, 0x83, 0x2C, 0x1A, 0x1B, 0x6E, 0x5A, 0xA0, 0x52, 0x3B, 0xD6, 0xB3, 0x29, 0xE3, 0x2F, 0x84,
    0x53, 0xD1, 0x00, 0xED, 0x20, 0xFC, 0xB1, 0x5B, 0x6A, 0xCB, 0xBE, 0x39, 0x4A, 0x4C, 0x58, 0xCF,
    0xD0, 0xEF, 0xAA, 0xFB, 0x43, 0x4D, 0x33, 0x85, 0x45, 0xF9, 0x02, 0x7F, 0x50, 0x3C, 0x9F, 0xA8,
    0x51, 0xA3, 0x40, 0x8F, 0x92, 0x9D, 0x38, 0xF5, 0xBC, 0xB6, 0xDA, 0x21, 0x10, 0xFF, 0xF3, 0xD2,
    0xCD, 0x0C, 0x13, 0xEC, 0x5F, 0x97, 0x44, 0x17, 0xC4, 0xA7, 0x7E, 0x3D, 0x64, 0x5D, 0x19, 0x73,
    0x60, 0x81, 0x4F, 0xDC, 0x22, 0x2A, 0x90, 0x88, 0x46, 0xEE, 0xB8, 0x14, 0xDE, 0x5E, 0x0B, 0xDB,
    0xE0, 0x32, 0x3A, 0x0A, 0x49, 0x06, 0x24, 0x5C, 0xC2, 0xD3, 0xAC, 0x62, 0x91, 0x95, 0xE4, 0x79,
    0xE7, 0xC8, 0x37, 0x6D, 0x8D, 0xD5, 0x4E, 0xA9, 0x6C, 0x56, 0xF4, 0xEA, 0x65, 0x7A, 0xAE, 0x08,
    0xBA, 0x78, 0x25, 0x2E, 0x1C, 0xA6, 0xB4, 0xC6, 0xE8, 0xDD, 0x74, 0x1F, 0x4B, 0xBD, 0x8B, 0x8A,
    0x70, 0x3E, 0xB5, 0x66, 0x48, 0x03, 0xF6, 0x0E, 0x61, 0x35, 0x57, 0xB9, 0x86, 0xC1, 0x1D, 0x9E,
    0xE1, 0xF8, 0x98, 0x11, 0x69, 0xD9, 0x8E, 0x94, 0x9B, 0x1E, 0x87, 0xE9, 0xCE, 0x55, 0x28, 0xDF,
    0x8C, 0xA1, 0x89, 0x0D, 0xBF, 0xE6, 0x42, 0x68, 0x41, 0x99, 0x2D, 0x0F, 0xB0, 0x54, 0xBB, 0x16
};

static CONST BYTE cInverseSbox[] = {
    0x52, 0x09, 0x6A, 0xD5, 0x30, 0x36, 0xA5, 0x38, 0xBF, 0x40, 0xA3, 0x9E, 0x81, 0xF3, 0xD7, 0xFB,
    0x7C, 0xE3, 0x39, 0x82, 0x9B, 0x2F, 0xFF, 0x87, 0x34, 0x8E, 0x43, 0x44, 0xC4, 0xDE, 0xE9, 0xCB,
    0x54, 0x7B, 0x94, 0x32, 0xA6, 0xC2, 0x23, 0x3D, 0xEE, 0x4C, 0x95, 0x0B, 0x42, 0xFA, 0xC3, 0x4E,
    0x08, 0x2E, 0xA1, 0x66, 0x28, 0xD9, 0x24, 0xB2, 0x76, 0x5B, 0xA2, 0x49, 0x6D, 0x8B, 0xD1, 0x25,
    0x72, 0xF8, 0xF6, 0x64, 0x86, 0x68, 0x98, 0x16, 0xD4, 0xA4, 0x5C, 0xCC, 0x5D, 0x65, 0xB6, 0x92,
    0x6C, 0x70, 0x48, 0x50, 0xFD, 0xED, 0xB9, 0xDA, 0x5E, 0x15, 0x46, 0x57, 0xA7, 0x8D, 0x9D, 0x84,
    0x90, 0xD8, 0xAB, 0x00, 0x8C, 0xBC, 0xD3, 0x0A, 0xF7, 0xE4, 0x58, 0x05, 0xB8, 0xB3, 0x45, 0x06,
    0xD0, 0x2C, 0x1E, 0x8F, 0xCA, 0x3F, 0x0F, 0x02, 0xC1, 0xAF, 0xBD, 0x03, 0x01, 0x13, 0x8A, 0x6B,
    0x3A, 0x91, 0x11, 0x41, 0x4F, 0x67, 0xDC, 0xEA, 0x97, 0xF2, 0xCF, 0xCE, 0xF0, 0xB4, 0xE6, 0x73,
    0x96, 0xAC, 0x74, 0x22, 0xE7, 0xAD, 0x35, 0x85, 0xE2, 0xF9, 0x37, 0xE8, 0x1C, 0x75, 0xDF, 0x6E,
    0x47, 0xF1, 0x1A, 0x71, 0x1D, 0x29, 0xC5, 0x89, 0x6F, 0xB7, 0x62, 0x0E, 0xAA, 0x18, 0xBE, 0x1B,
    0xFC, 0x56, 0x3E, 0x4B, 0xC6, 0xD2, 0x79, 0x20, 0x9A, 0xDB, 0xC0, 0xFE, 0x78, 0xCD, 0x5A, 0xF4,
    0x1F, 0xDD, 0xA8, 0x33, 0x88, 0x07, 0xC7, 0x31, 0xB1, 0x12, 0x10, 0x59, 0x27, 0x80, 0xEC, 0x5F,
    0x60, 0x51, 0x7F, 0xA9, 0x19, 0xB5, 0x4A, 0x0D, 0x2D, 0xE5, 0x7A, 0x9F, 0x93, 0xC9, 0x9C, 0xEF,
    0xA0, 0xE0, 0x3B, 0x4D, 0xAE, 0x2A, 0xF5, 0xB0, 0xC8, 0xEB, 0xBB, 0x3C, 0x83, 0x53, 0x99, 0x61,
    0x17, 0x2B, 0x04, 0x7E, 0xBA, 0x77, 0xD6, 0x26, 0xE1, 0x69, 0x14, 0x63, 0x55, 0x21, 0x0C, 0x7D
};

static CONST DWORD dwRoundConstantsSlow[11] = {
    0x8D, 0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x1B, 0x36
};

static CONST ULONG dwShiftIndex[] = { 0, 4, 8, 12, 1, 5, 9, 13, 2, 6, 10, 14, 3, 7, 11, 15 };

static
VOID
AddRoundKey(
    IN     ULONG dwRound,
    IN OUT PBYTE cState,
    IN     PBYTE cRoundKey
    )
{
    _mm_storeu_si128(
        (__m128i*)cState,
        _mm_xor_si128(
            _mm_loadu_si128((__m128i*)cState),
            _mm_loadu_si128((__m128i*)((ULONG_PTR)cRoundKey + dwRound * AES_STATE_COLUMS * 4))
        )
    );
}

static
VOID
SubBytes(
    IN OUT PBYTE cState
    )
{
    #pragma unroll
    for (ULONG i = 0; i != ARRAYSIZE(dwShiftIndex); i++)
    {
        cState[dwShiftIndex[i]] = cSbox[cState[dwShiftIndex[i]]];
    }
}

static
VOID
InverseSubBytes(
    IN OUT PBYTE cState
    )
{
    #pragma unroll
    for (ULONG i = 0; i != ARRAYSIZE(dwShiftIndex); i++)
    {
        cState[dwShiftIndex[i]] = cInverseSbox[cState[dwShiftIndex[i]]];
    }
}

static
VOID
ShiftRows(
    IN OUT PBYTE cState
    )
{
    BYTE cReg  = cState[ 1];
    cState[ 1] = cState[ 5];
    cState[ 5] = cState[ 9];
    cState[ 9] = cState[13];
    cState[13] = cReg;
    cReg       = cState[ 2];
    cState[ 2] = cState[10];
    cState[10] = cReg;
    cReg       = cState[ 6];
    cState[ 6] = cState[14];
    cState[14] = cReg;
    cReg       = cState[ 3];
    cState[ 3] = cState[15];
    cState[15] = cState[11];
    cState[11] = cState[ 7];
    cState[ 7] = cReg;
}

static
VOID
InverseShiftRows(
    IN OUT PBYTE cState
    )
{
    BYTE cReg  = cState[13];
    cState[13] = cState[ 9];
    cState[ 9] = cState[ 5];
    cState[ 5] = cState[ 1];
    cState[ 1] = cReg;
    cReg       = cState[ 2];
    cState[ 2] = cState[10];
    cState[10] = cReg;
    cReg       = cState[ 6];
    cState[ 6] = cState[14];
    cState[14] = cReg;
    cReg       = cState[ 3];
    cState[ 3] = cState[ 7];
    cState[ 7] = cState[11];
    cState[11] = cState[15];
    cState[15] = cReg;
}

static
VOID
MixColumns(
    IN OUT PBYTE cState
    )
{
    #define MATH(X) ((X << 1) ^ (((X >> 7) & 1) * 0x1B))

    BYTE cReg1;
    BYTE cReg2;
    BYTE cReg3;

    for (ULONG i = 0; i != AES_STATE_COLUMS * AES_STATE_ROWS; i += AES_STATE_ROWS) {
        cReg3 = cState[i + 0];
        cReg1 = cState[i + 0] ^ cState[i + 1] ^ cState[i + 2] ^ cState[i + 3];
        cReg2 = cState[i + 0] ^ cState[i + 1];
        cReg2 = MATH(cReg2);
        cState[i + 0] ^= cReg2 ^ cReg1;
        cReg2 = cState[i + 1] ^ cState[i + 2];
        cReg2 = MATH(cReg2);
        cState[i + 1] ^= cReg2 ^ cReg1;
        cReg2 = cState[i + 2] ^ cState[i + 3];
        cReg2 = MATH(cReg2);
        cState[i + 2] ^= cReg2 ^ cReg1;
        cReg2 = cState[i + 3] ^ cReg3;
        cReg2 = MATH(cReg2);
        cState[i + 3] ^= cReg2 ^ cReg1;
    }

    #undef MATH
}

static
VOID
InverseMixColumns(
    IN OUT PBYTE cState
    )
{
    #define MATH(X) ((X << 1) ^ (((X >> 7) & 1) * 0x1B))

    #define INVERSEMATH(X, Y)                             \
        (                                                 \
            (((Y >> 0) & 1) * X) ^                        \
            (((Y >> 1) & 1) * MATH(X)) ^                  \
            (((Y >> 2) & 1) * MATH(MATH(X))) ^            \
            (((Y >> 3) & 1) * MATH(MATH(MATH(X)))) ^      \
            (((Y >> 4) & 1) * MATH(MATH(MATH(MATH(X)))))  \
        )

    for (ULONG i = 0; i != AES_STATE_COLUMS * AES_STATE_ROWS; i += AES_STATE_ROWS) {
        BYTE cReg1 = cState[i + 0];
        BYTE cReg2 = cState[i + 1];
        BYTE cReg3 = cState[i + 2];
        BYTE cReg4 = cState[i + 3];

        cState[i + 0] = INVERSEMATH(cReg1, 0xE) ^ INVERSEMATH(cReg2, 0xB) ^ INVERSEMATH(cReg3, 0xD) ^ INVERSEMATH(cReg4, 0x9);
        cState[i + 1] = INVERSEMATH(cReg1, 0x9) ^ INVERSEMATH(cReg2, 0xE) ^ INVERSEMATH(cReg3, 0xB) ^ INVERSEMATH(cReg4, 0xD);
        cState[i + 2] = INVERSEMATH(cReg1, 0xD) ^ INVERSEMATH(cReg2, 0x9) ^ INVERSEMATH(cReg3, 0xE) ^ INVERSEMATH(cReg4, 0xB);
        cState[i + 3] = INVERSEMATH(cReg1, 0xB) ^ INVERSEMATH(cReg2, 0xD) ^ INVERSEMATH(cReg3, 0x9) ^ INVERSEMATH(cReg4, 0xE);
    }

    #undef MATH
    #undef INVERSEMATH
}

VOID
SlowAesEncryptBlock(
    IN PVOID pPlainText,
    IN PVOID pRoundpKey
    )
{
    AddRoundKey(0, pPlainText, pRoundpKey);

    for (ULONG i = 1; i != AES_ROUNDS; i++) {
        SubBytes(pPlainText);
        ShiftRows(pPlainText);
        MixColumns(pPlainText);
        AddRoundKey(i, pPlainText, pRoundpKey);
    }

    SubBytes(pPlainText);
    ShiftRows(pPlainText);
    AddRoundKey(AES_ROUNDS, pPlainText, pRoundpKey);
}

VOID
SlowAesDecryptBlock(
    IN PVOID pPlainText,
    IN PVOID pRoundpKey
    )
{
    AddRoundKey(AES_ROUNDS, pPlainText, pRoundpKey);

    for (ULONG i = AES_ROUNDS - 1; i > 0; i--) {
        InverseShiftRows(pPlainText);
        InverseSubBytes(pPlainText);
        AddRoundKey(i, pPlainText, pRoundpKey);
        InverseMixColumns(pPlainText);
    }

    InverseShiftRows(pPlainText);
    InverseSubBytes(pPlainText);
    AddRoundKey(0, pPlainText, pRoundpKey);
}

VOID
SlowAesLoadKey(
    IN  PVOID Key,
    OUT PVOID ExpandedKey
    )
{
    BYTE Temp[4];

    _mm_storeu_si128((PM128I)ExpandedKey, _mm_loadu_si128((PM128I)Key));

    for (ULONG i = 4; i != AES_STATE_COLUMS * (AES_ROUNDS + 1); i++) {
        *((PDWORD32)&Temp) = *((PDWORD32)((ULONG_PTR)ExpandedKey + (i - 1) * 4));

        if (i % 4 == 0) {
            *((PDWORD32)&Temp) = _lrotr(*((PDWORD32)&Temp), 8);

            Temp[0] = cSbox[Temp[0]];
            Temp[1] = cSbox[Temp[1]];
            Temp[2] = cSbox[Temp[2]];
            Temp[3] = cSbox[Temp[3]];
            Temp[0] = Temp[0] ^ dwRoundConstantsSlow[i / 4];
        }

        *((PDWORD32)((ULONG_PTR)ExpandedKey + i * 4)) = (*((PDWORD32)((ULONG_PTR)ExpandedKey + (i - 4) * 4)) ^ *((PDWORD32)&Temp));
    }
}

VOID
FastAesEncryptBlock(
    IO PVOID PlainText,
    IN PVOID Key
    )
{
    M128I xwBlock = _mm_loadu_si128((PM128I)PlainText);
    xwBlock = _mm_xor_si128       (xwBlock, ((PM128I)Key)[ 0]);
    xwBlock = _mm_aesenc_si128    (xwBlock, ((PM128I)Key)[ 1]);
    xwBlock = _mm_aesenc_si128    (xwBlock, ((PM128I)Key)[ 2]);
    xwBlock = _mm_aesenc_si128    (xwBlock, ((PM128I)Key)[ 3]);
    xwBlock = _mm_aesenc_si128    (xwBlock, ((PM128I)Key)[ 4]);
    xwBlock = _mm_aesenc_si128    (xwBlock, ((PM128I)Key)[ 5]);
    xwBlock = _mm_aesenc_si128    (xwBlock, ((PM128I)Key)[ 6]);
    xwBlock = _mm_aesenc_si128    (xwBlock, ((PM128I)Key)[ 7]);
    xwBlock = _mm_aesenc_si128    (xwBlock, ((PM128I)Key)[ 8]);
    xwBlock = _mm_aesenc_si128    (xwBlock, ((PM128I)Key)[ 9]);
    xwBlock = _mm_aesenclast_si128(xwBlock, ((PM128I)Key)[10]);
    _mm_storeu_si128((PM128I)PlainText, xwBlock);
}

VOID
FastAesDecryptBlock(
    IO PVOID CipherText,
    IN PVOID Key
    )
{
    M128I xwBlock = _mm_loadu_si128((PM128I)CipherText);
    xwBlock = _mm_xor_si128       (xwBlock, ((PM128I)Key)[10]);
    xwBlock = _mm_aesdec_si128    (xwBlock, ((PM128I)Key)[11]);
    xwBlock = _mm_aesdec_si128    (xwBlock, ((PM128I)Key)[12]);
    xwBlock = _mm_aesdec_si128    (xwBlock, ((PM128I)Key)[13]);
    xwBlock = _mm_aesdec_si128    (xwBlock, ((PM128I)Key)[14]);
    xwBlock = _mm_aesdec_si128    (xwBlock, ((PM128I)Key)[15]);
    xwBlock = _mm_aesdec_si128    (xwBlock, ((PM128I)Key)[16]);
    xwBlock = _mm_aesdec_si128    (xwBlock, ((PM128I)Key)[17]);
    xwBlock = _mm_aesdec_si128    (xwBlock, ((PM128I)Key)[18]);
    xwBlock = _mm_aesdec_si128    (xwBlock, ((PM128I)Key)[19]);
    xwBlock = _mm_aesdeclast_si128(xwBlock, ((PM128I)Key)[ 0]);
    _mm_storeu_si128((PM128I)CipherText, xwBlock);
}

static
M128I
FORCEINLINE
KeyExpansion(
    IN M128I xwKey,
    IN M128I xwKeyGenerated
    )
{
    xwKeyGenerated = _mm_shuffle_epi32(xwKeyGenerated, _MM_SHUFFLE(3, 3, 3, 3));
    xwKey = _mm_xor_si128(xwKey, _mm_slli_si128(xwKey, 4));
    xwKey = _mm_xor_si128(xwKey, _mm_slli_si128(xwKey, 4));
    xwKey = _mm_xor_si128(xwKey, _mm_slli_si128(xwKey, 4));

    return _mm_xor_si128(xwKey, xwKeyGenerated);
}

VOID
FastAesLoadKey(
    IN  PVOID Key,
    OUT PVOID ExpandedKey
    )
{
    PM128I KeySchedule = ExpandedKey;
    KeySchedule[ 0] = _mm_loadu_si128((PM128I)Key);
    KeySchedule[ 1] = KeyExpansion(KeySchedule[0], _mm_aeskeygenassist_si128(KeySchedule[0], 0x01));
    KeySchedule[ 2] = KeyExpansion(KeySchedule[1], _mm_aeskeygenassist_si128(KeySchedule[1], 0x02));
    KeySchedule[ 3] = KeyExpansion(KeySchedule[2], _mm_aeskeygenassist_si128(KeySchedule[2], 0x04));
    KeySchedule[ 4] = KeyExpansion(KeySchedule[3], _mm_aeskeygenassist_si128(KeySchedule[3], 0x08));
    KeySchedule[ 5] = KeyExpansion(KeySchedule[4], _mm_aeskeygenassist_si128(KeySchedule[4], 0x10));
    KeySchedule[ 6] = KeyExpansion(KeySchedule[5], _mm_aeskeygenassist_si128(KeySchedule[5], 0x20));
    KeySchedule[ 7] = KeyExpansion(KeySchedule[6], _mm_aeskeygenassist_si128(KeySchedule[6], 0x40));
    KeySchedule[ 8] = KeyExpansion(KeySchedule[7], _mm_aeskeygenassist_si128(KeySchedule[7], 0x80));
    KeySchedule[ 9] = KeyExpansion(KeySchedule[8], _mm_aeskeygenassist_si128(KeySchedule[8], 0x1B));
    KeySchedule[10] = KeyExpansion(KeySchedule[9], _mm_aeskeygenassist_si128(KeySchedule[9], 0x36));

    KeySchedule[11] = _mm_aesimc_si128(KeySchedule[9]);
    KeySchedule[12] = _mm_aesimc_si128(KeySchedule[8]);
    KeySchedule[13] = _mm_aesimc_si128(KeySchedule[7]);
    KeySchedule[14] = _mm_aesimc_si128(KeySchedule[6]);
    KeySchedule[15] = _mm_aesimc_si128(KeySchedule[5]);
    KeySchedule[16] = _mm_aesimc_si128(KeySchedule[4]);
    KeySchedule[17] = _mm_aesimc_si128(KeySchedule[3]);
    KeySchedule[18] = _mm_aesimc_si128(KeySchedule[2]);
    KeySchedule[19] = _mm_aesimc_si128(KeySchedule[1]);
}
