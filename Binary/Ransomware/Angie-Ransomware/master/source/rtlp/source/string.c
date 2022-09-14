
VOID
RtlpStringToUppercase(
    IO PSTR szString
    )
{
    while (*szString) {
        if ((ULONG)*szString - 'a' < 26) {
            *szString -= 0x20;
        }

        szString++;
    }
}

SIZE_T
RtlpStringCount(
    IN PSTR szString
    )
{
    SIZE_T StringLenght = 0;

    while (*szString) {
        szString++;
        StringLenght++;
    }

    return StringLenght;
}

BOOL
RtlpStringCompareNZ(
    IN PVOID  String1,
    IN PVOID  String2,
    IN SIZE_T MaxCompareCount
    )
{
    for (ULONG_PTR i = 0; i != MaxCompareCount; i++) {
        if (((PBYTE)String1)[i] != ((PBYTE)String2)[i]) {
            return FALSE;    
        }

        if (((PBYTE)String1)[i] == 0) {
            break;
        }
    }

    return TRUE;
}
