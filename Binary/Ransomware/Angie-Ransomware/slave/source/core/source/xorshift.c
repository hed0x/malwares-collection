#include <xorshift.h>

DWORD
Xorshift32Ex(
    IO PDWORD dwSeed
    )
{
    DWORD dwValue = *dwSeed;
    dwValue ^= dwValue << 13;
    dwValue ^= dwValue >> 17;
    dwValue ^= dwValue << 5;
    *dwSeed = dwValue;

    return dwValue;
}
