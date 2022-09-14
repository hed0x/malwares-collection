#include <aes.h>

VOID
(* AesEncrypt)(
    IN PVOID   PlainText,
    IN SIZE_T  cbPlainText,
    IN PAESKEY Key
    ) = (PVOID)RTLP_LCG_NATIVE;

VOID
(* AesDecrypt)(
    IN PVOID   PlainText,
    IN SIZE_T  cbPlainText,
    IN PAESKEY Key
    ) = (PVOID)RTLP_LCG_NATIVE;

VOID
(* AesLoadKey)(
    IN  PVOID PlainKey,
    IN  PVOID Iv,
    OUT PAESKEY Key
    ) = (PVOID)RTLP_LCG_NATIVE;

/*
    TODO: realy old code, optimize more
*/

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
    IN OUT PBYTE State,
    IN     PBYTE cRoundKey
    )
{
    _mm_storeu_si128(
        (__m128i*)State,
        _mm_xor_si128(
            _mm_loadu_si128((__m128i*)State),
            _mm_loadu_si128((__m128i*)((ULONG_PTR)cRoundKey + dwRound * AES_STATE_COLUMS * 4))
        )
    );
}

static
VOID
SubBytes(
    IN OUT PBYTE State
    )
{
    #pragma unroll
    for (ULONG i = 0; i != ARRAYSIZE(dwShiftIndex); i++)
    {
        State[dwShiftIndex[i]] = cSbox[State[dwShiftIndex[i]]];
    }
}

static
VOID
InverseSubBytes(
    IN OUT PBYTE State
    )
{
    #pragma unroll
    for (ULONG i = 0; i != ARRAYSIZE(dwShiftIndex); i++)
    {
        State[dwShiftIndex[i]] = cInverseSbox[State[dwShiftIndex[i]]];
    }
}

static
VOID
ShiftRows(
    IN OUT PBYTE State
    )
{
    BYTE Temp = State[ 1];
    State[ 1] = State[ 5];
    State[ 5] = State[ 9];
    State[ 9] = State[13];
    State[13] = Temp;
    Temp      = State[ 2];
    State[ 2] = State[10];
    State[10] = Temp;
    Temp      = State[ 6];
    State[ 6] = State[14];
    State[14] = Temp;
    Temp      = State[ 3];
    State[ 3] = State[15];
    State[15] = State[11];
    State[11] = State[ 7];
    State[ 7] = Temp;
}

static
VOID
InverseShiftRows(
    IN OUT PBYTE State
    )
{
    BYTE Temp = State[13];
    State[13] = State[ 9];
    State[ 9] = State[ 5];
    State[ 5] = State[ 1];
    State[ 1] = Temp;
    Temp      = State[ 2];
    State[ 2] = State[10];
    State[10] = Temp;
    Temp      = State[ 6];
    State[ 6] = State[14];
    State[14] = Temp;
    Temp      = State[ 3];
    State[ 3] = State[ 7];
    State[ 7] = State[11];
    State[11] = State[15];
    State[15] = Temp;
}

static
VOID
MixColumns(
    IN OUT PBYTE State
    )
{
    #define MATH(X) ((X << 1) ^ (((X >> 7) & 1) * 0x1B))

    BYTE Temp1;
    BYTE Temp2;
    BYTE Temp3;

    for (ULONG i = 0; i != AES_STATE_COLUMS * AES_STATE_ROWS; i += AES_STATE_ROWS) {
        Temp3 = State[i + 0];
        Temp1 = State[i + 0] ^ State[i + 1] ^ State[i + 2] ^ State[i + 3];
        Temp2 = State[i + 0] ^ State[i + 1];
        Temp2 = MATH(Temp2);
        State[i + 0] ^= Temp2 ^ Temp1;
        Temp2 = State[i + 1] ^ State[i + 2];
        Temp2 = MATH(Temp2);
        State[i + 1] ^= Temp2 ^ Temp1;
        Temp2 = State[i + 2] ^ State[i + 3];
        Temp2 = MATH(Temp2);
        State[i + 2] ^= Temp2 ^ Temp1;
        Temp2 = State[i + 3] ^ Temp3;
        Temp2 = MATH(Temp2);
        State[i + 3] ^= Temp2 ^ Temp1;
    }

    #undef MATH
}

static
VOID
InverseMixColumns(
    IN OUT PBYTE State
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
        BYTE Temp1 = State[i + 0];
        BYTE Temp2 = State[i + 1];
        BYTE Temp3 = State[i + 2];
        BYTE Temp4 = State[i + 3];

        State[i + 0] = INVERSEMATH(Temp1, 0xE) ^ INVERSEMATH(Temp2, 0xB) ^ INVERSEMATH(Temp3, 0xD) ^ INVERSEMATH(Temp4, 0x9);
        State[i + 1] = INVERSEMATH(Temp1, 0x9) ^ INVERSEMATH(Temp2, 0xE) ^ INVERSEMATH(Temp3, 0xB) ^ INVERSEMATH(Temp4, 0xD);
        State[i + 2] = INVERSEMATH(Temp1, 0xD) ^ INVERSEMATH(Temp2, 0x9) ^ INVERSEMATH(Temp3, 0xE) ^ INVERSEMATH(Temp4, 0xB);
        State[i + 3] = INVERSEMATH(Temp1, 0xB) ^ INVERSEMATH(Temp2, 0xD) ^ INVERSEMATH(Temp3, 0x9) ^ INVERSEMATH(Temp4, 0xE);
    }

    #undef MATH
    #undef INVERSEMATH
}

PRAGMA_WARNING_DISABLE_PUSH(167) // argument of type "X" is incompatible with parameter of type "X"

VOID
SlowAesEncrypt(
    IN PVOID   PlainText,
    IN SIZE_T  cbPlainText,
    IN PAESKEY Key
    )
{
    M128I xwIv = Key->xwIv;

    if (FASTMOD16(cbPlainText)) {
        cbPlainText = (cbPlainText & (MAXSIZE_T ^ 0xF)) + 0x10;
    }

    while (cbPlainText) {
        xwIv = _mm_xor_si128(xwIv, *(PM128I)PlainText);
        AddRoundKey(0, &xwIv, &Key->cAesKey);

        for (ULONG i = 1; i != AES_ROUNDS; i++) {
            SubBytes(&xwIv);
            ShiftRows(&xwIv);
            MixColumns(&xwIv);
            AddRoundKey(i, &xwIv, &Key->cAesKey);
        }

        SubBytes(&xwIv);
        ShiftRows(&xwIv);
        AddRoundKey(AES_ROUNDS, &xwIv, &Key->cAesKey);

        *((PM128I)PlainText)++ = xwIv;
        cbPlainText -= sizeof(M128);
    }
}

VOID
SlowAesDecrypt(
    IN PVOID   PlainText,
    IN SIZE_T  cbPlainText,
    IN PAESKEY Key
    )
{
    M128I xwIv = Key->xwIv;

    if (FASTMOD16(cbPlainText)) {
        cbPlainText = (cbPlainText & (MAXSIZE_T ^ 0xF)) + 0x10;
    }

    while (cbPlainText) {
        AddRoundKey(AES_ROUNDS, PlainText, &Key->cAesKey);

        for (ULONG i = AES_ROUNDS - 1; i > 0; i--) {
            InverseShiftRows(PlainText);
            InverseSubBytes(PlainText);
            AddRoundKey(i, PlainText, &Key->cAesKey);
            InverseMixColumns(PlainText);
        }

        InverseShiftRows(PlainText);
        InverseSubBytes(PlainText);
        AddRoundKey(0, PlainText, &Key->cAesKey);

        xwIv = *((PM128I)PlainText)++ = _mm_xor_si128(xwIv, *(PM128I)PlainText);
        cbPlainText -= sizeof(M128);
    }
}

PRAGMA_WARNING_DISABLE_POP(167)

VOID
SlowAesLoadKey(
    IN  PVOID PlainKey,
    IN  PVOID Iv,
    OUT PAESKEY Key
    )
{
    BYTE Temp[4];

    Key->xwIv        = *(PM128I)Iv;
    Key->xwAesKey[0] = *(PM128I)PlainKey;

    for (ULONG i = 4; i != AES_STATE_COLUMS * (AES_ROUNDS + 1); i++) {
        *(PDWORD32)&Temp = *((PDWORD32)((ULONG_PTR)Key->cAesKey + (i - 1) * 4));

        if (i % 4 == 0) {
            *(PDWORD32)&Temp = _lrotr(*(PDWORD32)&Temp, 8);

            Temp[0] = cSbox[Temp[0]];
            Temp[1] = cSbox[Temp[1]];
            Temp[2] = cSbox[Temp[2]];
            Temp[3] = cSbox[Temp[3]];
            Temp[0] = Temp[0] ^ dwRoundConstantsSlow[i / 4];
        }

        Key->dwAesKey[i] = (*((PDWORD32)((ULONG_PTR)Key->cAesKey + (i - 4) * 4)) ^ *((PDWORD32)&Temp));
    }
}

VOID
FastAesEncrypt(
    IN PVOID   PlainText,
    IN SIZE_T  cbPlainText,
    IN PAESKEY Key
    )
{
    M128I xwIv = Key->xwIv;

    if (FASTMOD16(cbPlainText)) {
        cbPlainText = (cbPlainText & (MAXSIZE_T ^ 0xF)) + 0x10;
    }

    while (cbPlainText) {
        xwIv = _mm_xor_si128(xwIv, *((PM128I)PlainText));
        xwIv = _mm_xor_si128       (xwIv, Key->xwAesNiKey[ 0]);
        xwIv = _mm_aesenc_si128    (xwIv, Key->xwAesNiKey[ 1]);
        xwIv = _mm_aesenc_si128    (xwIv, Key->xwAesNiKey[ 2]);
        xwIv = _mm_aesenc_si128    (xwIv, Key->xwAesNiKey[ 3]);
        xwIv = _mm_aesenc_si128    (xwIv, Key->xwAesNiKey[ 4]);
        xwIv = _mm_aesenc_si128    (xwIv, Key->xwAesNiKey[ 5]);
        xwIv = _mm_aesenc_si128    (xwIv, Key->xwAesNiKey[ 6]);
        xwIv = _mm_aesenc_si128    (xwIv, Key->xwAesNiKey[ 7]);
        xwIv = _mm_aesenc_si128    (xwIv, Key->xwAesNiKey[ 8]);
        xwIv = _mm_aesenc_si128    (xwIv, Key->xwAesNiKey[ 9]);
        xwIv = _mm_aesenclast_si128(xwIv, Key->xwAesNiKey[10]);
        
        *((PM128I)PlainText)++ = xwIv;
        cbPlainText -= sizeof(M128);
    }
}

VOID
FastAesDecrypt(
    IN PVOID   PlainText,
    IN SIZE_T  cbPlainText,
    IN PAESKEY Key
    )
{
    M128I xwIv = Key->xwIv;

    if (FASTMOD16(cbPlainText)) {
        cbPlainText = (cbPlainText & (MAXSIZE_T ^ 0xF)) + 0x10;
    }

    while (cbPlainText) {
        M128I xwBlock = *(PM128I)PlainText;
        xwBlock = _mm_xor_si128       (xwBlock, Key->xwAesNiKey[10]);
        xwBlock = _mm_aesdec_si128    (xwBlock, Key->xwAesNiKey[11]);
        xwBlock = _mm_aesdec_si128    (xwBlock, Key->xwAesNiKey[12]);
        xwBlock = _mm_aesdec_si128    (xwBlock, Key->xwAesNiKey[13]);
        xwBlock = _mm_aesdec_si128    (xwBlock, Key->xwAesNiKey[14]);
        xwBlock = _mm_aesdec_si128    (xwBlock, Key->xwAesNiKey[15]);
        xwBlock = _mm_aesdec_si128    (xwBlock, Key->xwAesNiKey[16]);
        xwBlock = _mm_aesdec_si128    (xwBlock, Key->xwAesNiKey[17]);
        xwBlock = _mm_aesdec_si128    (xwBlock, Key->xwAesNiKey[18]);
        xwBlock = _mm_aesdec_si128    (xwBlock, Key->xwAesNiKey[19]);
        xwBlock = _mm_aesdeclast_si128(xwBlock, Key->xwAesNiKey[ 0]);

        xwIv = *((PM128I)PlainText)++ = _mm_xor_si128(xwIv, xwBlock);
        cbPlainText -= sizeof(M128);
    }
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
    IN  PVOID PlainKey,
    IN  PVOID Iv,
    OUT PAESKEY Key
    )
{
    Key->xwIv = *(PM128I)Iv;
    Key->xwAesNiKey[ 0] = *(PM128I)PlainKey;
    Key->xwAesNiKey[ 1] = KeyExpansion(Key->xwAesNiKey[0], _mm_aeskeygenassist_si128(Key->xwAesNiKey[0], 0x01));
    Key->xwAesNiKey[ 2] = KeyExpansion(Key->xwAesNiKey[1], _mm_aeskeygenassist_si128(Key->xwAesNiKey[1], 0x02));
    Key->xwAesNiKey[ 3] = KeyExpansion(Key->xwAesNiKey[2], _mm_aeskeygenassist_si128(Key->xwAesNiKey[2], 0x04));
    Key->xwAesNiKey[ 4] = KeyExpansion(Key->xwAesNiKey[3], _mm_aeskeygenassist_si128(Key->xwAesNiKey[3], 0x08));
    Key->xwAesNiKey[ 5] = KeyExpansion(Key->xwAesNiKey[4], _mm_aeskeygenassist_si128(Key->xwAesNiKey[4], 0x10));
    Key->xwAesNiKey[ 6] = KeyExpansion(Key->xwAesNiKey[5], _mm_aeskeygenassist_si128(Key->xwAesNiKey[5], 0x20));
    Key->xwAesNiKey[ 7] = KeyExpansion(Key->xwAesNiKey[6], _mm_aeskeygenassist_si128(Key->xwAesNiKey[6], 0x40));
    Key->xwAesNiKey[ 8] = KeyExpansion(Key->xwAesNiKey[7], _mm_aeskeygenassist_si128(Key->xwAesNiKey[7], 0x80));
    Key->xwAesNiKey[ 9] = KeyExpansion(Key->xwAesNiKey[8], _mm_aeskeygenassist_si128(Key->xwAesNiKey[8], 0x1B));
    Key->xwAesNiKey[10] = KeyExpansion(Key->xwAesNiKey[9], _mm_aeskeygenassist_si128(Key->xwAesNiKey[9], 0x36));

    Key->xwAesNiKey[11] = _mm_aesimc_si128(Key->xwAesNiKey[9]);
    Key->xwAesNiKey[12] = _mm_aesimc_si128(Key->xwAesNiKey[8]);
    Key->xwAesNiKey[13] = _mm_aesimc_si128(Key->xwAesNiKey[7]);
    Key->xwAesNiKey[14] = _mm_aesimc_si128(Key->xwAesNiKey[6]);
    Key->xwAesNiKey[15] = _mm_aesimc_si128(Key->xwAesNiKey[5]);
    Key->xwAesNiKey[16] = _mm_aesimc_si128(Key->xwAesNiKey[4]);
    Key->xwAesNiKey[17] = _mm_aesimc_si128(Key->xwAesNiKey[3]);
    Key->xwAesNiKey[18] = _mm_aesimc_si128(Key->xwAesNiKey[2]);
    Key->xwAesNiKey[19] = _mm_aesimc_si128(Key->xwAesNiKey[1]);
}
