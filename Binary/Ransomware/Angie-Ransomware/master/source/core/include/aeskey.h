#ifndef AESKEY_INCLUDED
#define AESKEY_INCLUDED

#ifndef AES_KEY_SIZE
    #include <aes.h>
#endif

typedef struct _AESKEY {
    BYTE  Key[AES_KEY_SIZE];
    BYTE  Iv [AES_KEY_SIZE];
} AESKEY, *PAESKEY;

BOOL
(* AesKeyGenerate)(
    OUT PAESKEY Key
    );

BOOL
AesKeyGenerateXoroshiro(
    OUT PAESKEY Key
    );

BOOL
AesKeyGenerateHardware(
    OUT PAESKEY Key
    );

BOOL
AesKeyGenerateBCrypt(
    OUT PAESKEY Key
    );

BOOL
InitAesKeyGenerateXoroshiro(VOID);

#endif
