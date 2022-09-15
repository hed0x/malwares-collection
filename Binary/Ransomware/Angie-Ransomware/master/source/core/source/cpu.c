#include <cpu.h>

enum {
    /* ECX */
    CPUID_00000001_RDRAND = (1 << 30),
    CPUID_00000001_AES    = (1 << 25),
    CPUID_00000001_SSE4_2 = (1 << 20),

    /* EDX */
    CPUID_00000001_SSE2   = (1 << 26),
    CPUID_00000001_CMOV   = (1 << 15)
};

CPUFEATURES CpuFeatures;

BOOL
DECLSPEC_NOINLINE
InitCpu(VOID)
{
    FLONG dwEdx;
    FLONG dwEcx;

    __asm {
        mov eax, 0x00000001
        cpuid
        mov dword ptr [dwEdx], edx
        mov dword ptr [dwEcx], ecx
    }

    /* Minimal support */
    {
        if (!(dwEdx & CPUID_00000001_CMOV)) {
            return FALSE;
        }

        if (!(dwEdx & CPUID_00000001_SSE2)) {
            return FALSE;
        }
    };

    CpuFeatures.AES    = dwEcx & CPUID_00000001_AES;
    CpuFeatures.SSE5   = dwEcx & CPUID_00000001_SSE4_2;
    CpuFeatures.RdRand = dwEcx & CPUID_00000001_RDRAND;

    return TRUE;
}