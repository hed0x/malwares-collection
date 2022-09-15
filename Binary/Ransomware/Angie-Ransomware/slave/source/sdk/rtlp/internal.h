#ifndef SDK_RTLP_INTERNAL_INCLUDED
#define SDK_RTLP_INTERNAL_INCLUDED

static
PKUSER_SHARED_DATA
FORCEINLINE
RtlpUserShared(VOID)
{
    return ((PKUSER_SHARED_DATA)USER_SHARED_DATA);
}

static
PTEB32
FORCEINLINE
RtlpGetTeb32(VOID)
{
    return (PTEB32)((ULONG_PTR)__readfsdword(FIELD_OFFSET(NT_TIB32, Self)));
}

static
PTEB64
FORCEINLINE
RtlpGetTeb64(VOID)
{
    #ifdef _AMD64_
        return (PTEB64)((ULONG_PTR)__readgsqword(FIELD_OFFSET(NT_TIB64, Self)));
    #else
        enum {
            TebOffset = FIELD_OFFSET(NT_TIB64, Self)
        };

        __asm {
            mov eax, gs:[TebOffset]
        };
    #endif
}

static
PTEB
FORCEINLINE
RtlpGetTeb(VOID)
{
    #ifdef _AMD64_
        return (PTEB)RtlpGetTeb64();
    #else
        return (PTEB)RtlpGetTeb32();
    #endif
}

static
PPEB32
FORCEINLINE
RtlpGetPeb32(VOID)
{
    PRAGMA_WARNING_DISABLE(810) // conversion from "PVOID64" to "$PPEB64" may lose significant bits)
    return (PPEB32)(ULONG_PTR)RtlpGetTeb32()->ProcessEnvironmentBlock;
}

static
PPEB64
FORCEINLINE
RtlpGetPeb64(VOID)
{
    PRAGMA_WARNING_DISABLE(810) // conversion from "PVOID64" to "$PPEB64" may lose significant bits)
    return (PPEB64)(ULONG_PTR)RtlpGetTeb64()->ProcessEnvironmentBlock;
}

static
PPEB
FORCEINLINE
RtlpGetPeb(VOID)
{
    #ifdef _AMD64_
        return (PPEB)RtlpGetPeb64();
    #else
        return (PPEB)RtlpGetPeb32();
    #endif
}

static
PRTL_USER_PROCESS_PARAMETERS32
FORCEINLINE
RtlpGetUserProcessParameters32(VOID)
{
    return (PRTL_USER_PROCESS_PARAMETERS32)(ULONG_PTR)RtlpGetPeb32()->ProcessParameters;
}

static
PRTL_USER_PROCESS_PARAMETERS64
FORCEINLINE
RtlpGetUserProcessParameters64(VOID)
{
    return (PRTL_USER_PROCESS_PARAMETERS64)(ULONG_PTR)RtlpGetPeb64()->ProcessParameters;
}

static
PRTL_USER_PROCESS_PARAMETERS
FORCEINLINE
RtlpGetUserProcessParameters(VOID)
{
    #ifdef _AMD64_
        return (PRTL_USER_PROCESS_PARAMETERS)RtlpGetUserProcessParameters64();
    #else
        return (PRTL_USER_PROCESS_PARAMETERS)RtlpGetUserProcessParameters32();
    #endif
}

static
BOOLEAN
FORCEINLINE
RtlpIsProcessorFeaturePresent(
    IN ULONG dwFeatureId
    )
{
    return RtlpUserShared()->ProcessorFeatures[dwFeatureId];
}

static
WORD
FORCEINLINE
RtlpIsProcessRunningUnderWow64(VOID)
{
    __asm {
        mov ax, gs
    };
}

#endif
