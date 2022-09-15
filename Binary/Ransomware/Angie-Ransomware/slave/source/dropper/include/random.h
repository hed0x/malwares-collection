#ifndef RANDOM_INCLUDED
#define RANDOM_INCLUDED

extern QWORD RandomSeed[2];

static
VOID
FORCEINLINE
InitRandom(VOID)
{
    RandomSeed[0] = *(PQWORD)&RtlpUserShared()->SystemTime;

    #if RTLP_LCG_GENERATE % 2
        RandomSeed[1] = *(PQWORD)&RtlpUserShared()->InterruptTime;
    #else
        RandomSeed[1] = *(PQWORD)&RtlpUserShared()->TickCount;
    #endif
}

static
DWORD
FORCEINLINE
RandomNext32(VOID)
{
    #ifdef _ADM64_
        #define ROTL64(X, SHIFT) _rotl64(X, SHIFT)
    #else
        #define ROTL64(X, SHIFT) ((X << SHIFT) | (X >> (64 - SHIFT)))
    #endif

    QWORD qw0 = RandomSeed[0];
    QWORD qw1 = RandomSeed[1];
    QWORD qw2 = qw0 + qw1;

    qw1 ^= qw0;
    RandomSeed[0] = ROTL64(qw0, 24) ^ qw1 ^ (qw1 << 16);
    RandomSeed[1] = ROTL64(qw1, 37); 

    #undef ROTL64s

    return (DWORD)qw2;
}

#endif
