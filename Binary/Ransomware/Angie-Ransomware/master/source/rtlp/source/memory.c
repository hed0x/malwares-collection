
VOID
RtlpFillMemory(
    OUT PVOID  Destination,
    IN  ULONG  cFillChar,
    IN  SIZE_T FillCount
    )
{
    if (FillCount >= 16 * 4) {
        cFillChar |= cFillChar <<  8;
        cFillChar |= cFillChar << 16;

        M128I dqwFillChar = _mm_set_epi32(cFillChar, cFillChar, cFillChar, cFillChar);

        while (FillCount >= 16 * 4) {
            _mm_storeu_si128(&((PM128I)Destination)[0], dqwFillChar);
            _mm_storeu_si128(&((PM128I)Destination)[1], dqwFillChar);
            _mm_storeu_si128(&((PM128I)Destination)[2], dqwFillChar);
            _mm_storeu_si128(&((PM128I)Destination)[3], dqwFillChar);
            ((PM128I)Destination) += 4;
            FillCount -= 16 * 4;
        }
    }

    __stosb(Destination, cFillChar, FillCount);
}

VOID
RtlpCopyMemory(
    OUT PVOID  Destination,
    IN  PVOID  Source,
    IN  SIZE_T CopyCount
    )
{
    while (CopyCount >= 16 * 4) {
        _mm_storeu_si128(&((PM128I)Destination)[0], _mm_loadu_si128(&((PM128I)Source)[0]));
        _mm_storeu_si128(&((PM128I)Destination)[1], _mm_loadu_si128(&((PM128I)Source)[1]));
        _mm_storeu_si128(&((PM128I)Destination)[2], _mm_loadu_si128(&((PM128I)Source)[2]));
        _mm_storeu_si128(&((PM128I)Destination)[3], _mm_loadu_si128(&((PM128I)Source)[3]));
        ((PM128I)Destination) += 4;
        ((PM128I)Source     ) += 4;
        CopyCount -= 16 * 4;
    }

    __movsb(Destination, Source, CopyCount);
}

BOOL
RtlpCompareMemory(
    IN PVOID  Data1,
    IN PVOID  Data2,
    IN SIZE_T CompareCount
    )
{
    while (CompareCount >= 16 * 4) {
        /* strange... but ok ? */
        BOOL bGood = !(WORD)_mm_movemask_epi8(_mm_xor_si128(_mm_loadu_si128(&((PM128I)Data1)[0]), _mm_loadu_si128(&((PM128I)Data2)[0]))) ? FALSE : TRUE;
             bGood = !(WORD)_mm_movemask_epi8(_mm_xor_si128(_mm_loadu_si128(&((PM128I)Data1)[1]), _mm_loadu_si128(&((PM128I)Data2)[1]))) ? FALSE : bGood;
             bGood = !(WORD)_mm_movemask_epi8(_mm_xor_si128(_mm_loadu_si128(&((PM128I)Data1)[2]), _mm_loadu_si128(&((PM128I)Data2)[2]))) ? FALSE : bGood;
             bGood = !(WORD)_mm_movemask_epi8(_mm_xor_si128(_mm_loadu_si128(&((PM128I)Data1)[3]), _mm_loadu_si128(&((PM128I)Data2)[3]))) ? FALSE : bGood;

        if (bGood) {
            return FALSE;
        }

        ((PM128I)Data1) += 4;
        ((PM128I)Data2) += 4;
        CompareCount -= 16 * 4;
    }

    while (CompareCount && (*((PBYTE)Data1) == *((PBYTE)Data2))) {
        ((PBYTE)Data1)++;
        ((PBYTE)Data2)++;
        CompareCount--;
    }

    return CompareCount ? FALSE : TRUE;
}
