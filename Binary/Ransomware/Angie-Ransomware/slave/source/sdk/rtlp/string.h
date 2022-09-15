#ifndef RTLP_STRING_INCLUDED
#define RTLP_STRING_INCLUDED

static
BOOL
FORCEINLINE
RtlpCompareUnicodeNZ(
    IN PVOID  String1,
    IN PVOID  String2,
    IN SIZE_T MaxCompareCount
    )
{
    for (ULONG_PTR i = 0; i != MaxCompareCount; i++) {
        if (((PWCHAR)String1)[i] != ((PWCHAR)String2)[i]) {
            return FALSE;    
        }

        if (!((PWCHAR)String1)[i]) {
            break;
        }
    }

    return TRUE;
}

#endif
