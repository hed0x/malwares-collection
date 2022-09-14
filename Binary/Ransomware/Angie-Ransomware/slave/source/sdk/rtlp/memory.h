#ifndef SDK_RTLP_MEMORY_INCLUDED
#define SDK_RTLP_MEMORY_INCLUDED

static
VOID
FORCEINLINE
RtlpFillMemoryInstr(
    OUT PVOID  Destination,
    IN  ULONG  cFillChar,
    IN  SIZE_T FillCount
    )
{
    __stosb((PBYTE)Destination, cFillChar, FillCount);
}

#define RtlpZeroMemoryInstr(DATA, FILLCOUNT) RtlpFillMemoryInstr(DATA, 0, FILLCOUNT)
#define RtlpZeroObjectInstr(DATA)            RtlpFillMemoryInstr(&(DATA), 0, sizeof(DATA))

static
VOID
FORCEINLINE
RtlpFillMemoryInline(
    OUT PVOID  Destination,
    IN  ULONG  cFillChar,
    IN  SIZE_T FillCount
    )
{
    if (FillCount >= sizeof(M128I)) {
        cFillChar |= cFillChar <<  8;
        cFillChar |= cFillChar << 16;

        M128I dqwFillChar = _mm_set_epi32(cFillChar, cFillChar, cFillChar, cFillChar);

        while (FillCount >= sizeof(M128I)) {
            _mm_storeu_si128((PM128I)Destination, dqwFillChar);
            ((PM128I)Destination)++;
            FillCount -= sizeof(M128I);
        }
    }

    while (FillCount) {
        *((PBYTE)Destination)++ = cFillChar;
        FillCount--;
    }
}

#define RtlpZeroMemoryInline(DATA, FILLCOUNT) RtlpFillMemoryInline(DATA, 0, FILLCOUNT)
#define RtlpZeroObjectInline(DATA)            RtlpFillMemoryInline(&(DATA), 0, sizeof(DATA))

VOID
RtlpFillMemory(
    OUT PVOID  Destination,
    IN  ULONG  cFillChar,
    IN  SIZE_T FillCount
    );

#define RtlpZeroMemory(DATA, FILLCOUNT) RtlpFillMemory(DATA, 0, FILLCOUNT)
#define RtlpZeroObject(DATA)            RtlpFillMemory(&(DATA), 0, sizeof(DATA))
                                                      
static
VOID
FORCEINLINE
RtlpCopyMemoryInstr(
    OUT PVOID  Destination,
    IN  PVOID  Source,
    IN  SIZE_T FillCount
    )
{
    __movsb((PBYTE)Destination, (PBYTE)Source, FillCount);
}

static
VOID
FORCEINLINE
RtlpCopyMemoryInline(
    OUT PVOID  Destination,
    IN  PVOID  Source,
    IN  SIZE_T FillCount
    )
{
    while (FillCount >= sizeof(M128I)) {
        _mm_storeu_si128((PM128I)Destination, _mm_loadu_si128((PM128I)Source));
        ((PM128I)Destination)++;
        ((PM128I)Source     )++;
        FillCount -= sizeof(M128I);
    }

    while (FillCount) {
        *((PBYTE)Destination)++ = *((PBYTE)Source)++;
        FillCount--;
    }
}

VOID
RtlpCopyMemory(
    OUT PVOID  Destination,
    IN  PVOID  Source,
    IN  SIZE_T FillCount
    );

static
BOOL
FORCEINLINE
RtlpCompareMemoryInline(
    IN PVOID  Data1,
    IN PVOID  Data2,
    IN SIZE_T CompareCount
    )
{
    while (CompareCount && (*((PBYTE)Data1) == *((PBYTE)Data2))) {
        ((PBYTE)Data1)++;
        ((PBYTE)Data2)++;
        CompareCount--;
    }

    return CompareCount ? FALSE : TRUE;
}

BOOL
RtlpCompareMemory(
    IN PVOID  Data1,
    IN PVOID  Data2,
    IN SIZE_T CompareCount
    );

#endif
