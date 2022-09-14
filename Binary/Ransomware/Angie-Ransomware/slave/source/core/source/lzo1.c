#include <lzo1.h>

#define RBITS  5
#define CLEVEL 1

#define RSIZE (1 << RBITS)
#define RMASK (RSIZE - 1)

#define OBITS RBITS
#define OSIZE (1 << OBITS)
#define OMASK (OSIZE - 1)

#define MBITS (8 - OBITS)
#define MSIZE (1 << MBITS)
#define MMASK (MSIZE - 1)

#define R0MIN  (RSIZE)
#define R0MAX  (R0MIN + 255)
#define R0FAST (R0MAX & ~7u)

#define MIN_MATCH       3
#define THRESHOLD       (MIN_MATCH - 1)
#define MIN_MATCH_SHORT MIN_MATCH
#define MAX_MATCH_SHORT (THRESHOLD + (MSIZE - 2))
#define MIN_MATCH_LONG  (MAX_MATCH_SHORT + 1)
#define MAX_MATCH_LONG  (MIN_MATCH_LONG + 255)
#define MAX_OFFSET      (1 << (8 + OBITS))

VOID
Lzo1Decompress(
    IN  PVOID   Source,
    IN  SIZE_T  cbSource,
    OUT PVOID   Destination
    )
{
    PBYTE sOut = Destination;
    PBYTE sIndex = (PBYTE)Source;
    PBYTE sIndexEnd = (PBYTE)Source + cbSource;

    while (sIndex != sIndexEnd) {
        ULONG n = *sIndex++;

        if (n < R0MIN) {
            if (!n) {
                n = *sIndex++;

                if (n >= R0FAST - R0MIN) {
                    n -= R0FAST - R0MIN;

                    if (!n) {
                        n = R0FAST;
                    } else {
                        ULONG y = 256;

                        do {
                            y <<= 1;
                        } while(--n > 0);

                        n = y;
                    }

                    RtlpCopyMemoryInstr(sOut, sIndex, n);
                    sOut += n;
                    sIndex += n;

                    continue;
                }

                n += R0MIN;
            }

            RtlpCopyMemoryInstr(sOut, sIndex, n);
            sOut += n;
            sIndex += n;
        } else {
            ULONG y;
            PBYTE sOutIndex = (sOut - 1) - (((ULONG)(n & OMASK)) | ((ULONG)*sIndex++) << OBITS);

            if (n >= ((MSIZE - 1) << OBITS)) {
                y = (MIN_MATCH_LONG - THRESHOLD) + *sIndex++;
            } else {
                y = n >> OBITS;
            }

            *sOut++ = *sOutIndex++;
            *sOut++ = *sOutIndex++;
            RtlpCopyMemoryInstr(sOut, sOutIndex, y);
            sOut += y;
            sOutIndex += y;
        }
    }
}
