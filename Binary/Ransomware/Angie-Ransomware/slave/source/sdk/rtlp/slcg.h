#ifndef SDK_RTLP_SLCG_INCLUDED
#define SDK_RTLP_SLCG_INCLUDED

/* SLCG (Static linear congruential generator)
   Xn+1 = (a * Xn + c) % m

   m - modulus
   a - multiplier
   c - increment
   X - seed
*/

#ifndef RTLP_LCG_SEED
    #ifdef RELEASE
        #error RTLP_LCG_SEED is not defined!
    #else
        #define RTLP_LCG_SEED 563792i64
    #endif
#endif

#define RTLP_LCG_GENERATE ((1316503279i64 * (RTLP_LCG_SEED + __COUNTER__) + 35019i64) % 65535i64)

#define RTLP_LCG_BYTE  ((UCHAR  )RTLP_LCG_GENERATE)
#define RTLP_LCG_WORD  ((USHORT )RTLP_LCG_GENERATE)
#define RTLP_LCG_DWORD ((ULONG32)((ULONG32)RTLP_LCG_WORD  | (ULONG32)RTLP_LCG_WORD << 16))
#define RTLP_LCG_QWORD ((ULONG64)((ULONG64)RTLP_LCG_DWORD | (ULONG64)RTLP_LCG_DWORD << 32))

#ifdef _AMD64_
    #define RTLP_LCG_NATIVE RTLP_LCG_QWORD
#else
    #define RTLP_LCG_NATIVE RTLP_LCG_DWORD
#endif

#endif
