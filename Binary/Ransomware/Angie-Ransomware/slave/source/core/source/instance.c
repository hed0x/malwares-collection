#include <instance.h>
#include <ntapi.h>
#include <crc32.h>
#include <xorshift.h>

WCHAR InstanceMutantPath[48];
HANDLE InstanceMutantObject;

enum {
    MUTAN_DIRECTORY_XOR_KEY_I0 = RTLP_LCG_DWORD,
    MUTAN_DIRECTORY_XOR_KEY_I1 = RTLP_LCG_DWORD,
    MUTAN_DIRECTORY_XOR_KEY_I2 = RTLP_LCG_DWORD,
    MUTAN_DIRECTORY_XOR_KEY_I3 = RTLP_LCG_DWORD,
};

static CONST VOLATILE DWORD xwMutantDirectoryXorKey[4] = {
    MUTAN_DIRECTORY_XOR_KEY_I0,
    MUTAN_DIRECTORY_XOR_KEY_I1,
    MUTAN_DIRECTORY_XOR_KEY_I2,
    MUTAN_DIRECTORY_XOR_KEY_I3
};

static CONST VOLATILE DWORD xwMutantDirectoryPart1[4] =  {
    MAKELONG('\\', 'B') ^ MUTAN_DIRECTORY_XOR_KEY_I0,
    MAKELONG('a' , 's') ^ MUTAN_DIRECTORY_XOR_KEY_I1,
    MAKELONG('e' , 'N') ^ MUTAN_DIRECTORY_XOR_KEY_I2,
    MAKELONG('a' , 'm') ^ MUTAN_DIRECTORY_XOR_KEY_I3
};

static CONST VOLATILE DWORD xwMutantDirectoryPart2[4] =  {
    MAKELONG('e', 'd') ^ MUTAN_DIRECTORY_XOR_KEY_I0,
    MAKELONG('O', 'b') ^ MUTAN_DIRECTORY_XOR_KEY_I1,
    MAKELONG('j', 'e') ^ MUTAN_DIRECTORY_XOR_KEY_I2,
    MAKELONG('c', 't') ^ MUTAN_DIRECTORY_XOR_KEY_I3
};

BOOL
DECLSPEC_NOINLINE
CreateInstance(VOID)
{
    $DLOG1(DLG_FLT_INFO, "Creating a instance");

    DWORD dwBuffer[4];
    WCHAR sAsciiHex[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };
    PUNICODE_STRING ImagePathName = (PVOID)&RtlpGetUserProcessParameters()->ImagePathName;

    #if SCFG_CORE_INSTANCE_USE_SEED_SALT == ON
        ULONG dwSeed = Crc32SumBuffer(ImagePathName->Buffer, ImagePathName->Length) ^ RTLP_LCG_DWORD;
    #else
        ULONG dwSeed = Crc32SumBuffer(ImagePathName->Buffer, ImagePathName->Length);
    #endif

    $DLOG3(DLG_FLT_DEFAULT, "Seed  : 0x%08lX", dwSeed);

    for (ULONG_PTR i = 0; i != 4; i++) {
        PRAGMA_NOINLINE
        dwBuffer[i] = Xorshift32Ex(&dwSeed);
    }

    PBYTE sBuffer = (PVOID)&dwBuffer;
    PWSTR sMutant = (PVOID)&InstanceMutantPath;

    {
        // TODO: create CCSTR
        _mm_storeu_si128(((PM128I)sMutant)++, _mm_xor_si128(_mm_loadu_si128((PM128I)xwMutantDirectoryPart1), _mm_loadu_si128((PM128I)xwMutantDirectoryXorKey)));
        _mm_storeu_si128(((PM128I)sMutant)++, _mm_xor_si128(_mm_loadu_si128((PM128I)xwMutantDirectoryPart2), _mm_loadu_si128((PM128I)xwMutantDirectoryXorKey)));
        *((PDWORD)sMutant)++ = MAKELONG('s', '\\');

        for (ULONG_PTR i = 0; i != 4; i++) {
            *sMutant++ = sAsciiHex[(*sBuffer >> 4) & 0x0F];
            *sMutant++ = sAsciiHex[ *sBuffer++     & 0x0F];
        }

        *sMutant++ = '-';

        for (ULONG_PTR i = 0; i != 2; i++) {
            *sMutant++ = sAsciiHex[(*sBuffer >> 4) & 0x0F];
            *sMutant++ = sAsciiHex[ *sBuffer++     & 0x0F];
        }

        *sMutant++ = '-';

        for (ULONG_PTR i = 0; i != 2; i++) {
            *sMutant++ = sAsciiHex[(*sBuffer >> 4) & 0x0F];
            *sMutant++ = sAsciiHex[ *sBuffer++     & 0x0F];
        }

        *sMutant++ = '-';

        for (ULONG_PTR i = 0; i != 6; i++) {
            *sMutant++ = sAsciiHex[(*sBuffer >> 4) & 0x0F];
            *sMutant++ = sAsciiHex[ *sBuffer++     & 0x0F];
        }
    };

    $DLOG3(DLG_FLT_DEFAULT, "Mutant: %ls", InstanceMutantPath);

    UNICODE_STRING String = {
        sizeof(InstanceMutantPath),
        sizeof(InstanceMutantPath),
        (PVOID)&InstanceMutantPath
    };

    OBJECT_ATTRIBUTES Object = RTL_CONSTANT_OBJECT_ATTRIBUTES(
        &String,
        OBJ_OPENIF
    );

    if (!NT_ERROR(NtOpenMutant(&InstanceMutantObject, STANDARD_RIGHTS_ALL | FILE_READ_DATA, &Object))) {
        $DLOG1(DLG_FLT_ERROR, "Another instance is running");

        return FALSE;
    }
    
    Object.Attributes = 0;

    if (NT_ERROR(NtCreateMutant(&InstanceMutantObject, STANDARD_RIGHTS_ALL | FILE_READ_DATA, &Object, TRUE))) {
        $DLOG1(DLG_FLT_CRITICAL, "Failed to create new mutex");

        return FALSE;
    }

    $DLOG2(DLG_FLT_INFO, "Done");

    return TRUE;
}
