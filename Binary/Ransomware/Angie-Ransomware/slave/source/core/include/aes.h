#ifndef AES_INCLUDED
#define AES_INCLUDED

#include <config.h>

#define AES_KEY_SIZE   16
#define AES_BLOCK_SIZE 16

typedef struct _AESKEY {
    M128I xwIv;

    union {;
        BYTE  cAesNiKey [320];
        BYTE  cAesKey   [176];
        WORD  wAesNiKey [160];
        WORD  wAesKey   [ 88];
        DWORD dwAesNiKey[ 80];
        DWORD dwAesKey  [ 44];
        QWORD qwAesNiKey[ 40];
        QWORD qwAesKey  [ 22];
        M128I xwAesNiKey[ 20];
        M128I xwAesKey  [ 11];
    };
} AESKEY, *PAESKEY;

extern
VOID
(* AesEncrypt)(
    IN PVOID   PlainText,
    IN SIZE_T  cbPlainText,
    IN PAESKEY Key
    );

extern
VOID
(* AesDecrypt)(
    IN PVOID   PlainText,
    IN SIZE_T  cbPlainText,
    IN PAESKEY Key
    );

extern
VOID
(* AesLoadKey)(
    IN  PVOID PlainKey,
    IN  PVOID Iv,
    OUT PAESKEY Key
    );

VOID
FastAesEncrypt(
    IN PVOID   PlainText,
    IN SIZE_T  cbPlainText,
    IN PAESKEY Key
    );

VOID
FastAesDecrypt(
    IN PVOID   PlainText,
    IN SIZE_T  cbPlainText,
    IN PAESKEY Key
    );

VOID
FastAesLoadKey(
    IN  PVOID PlainKey,
    IN  PVOID Iv,
    OUT PAESKEY Key
    );

VOID
SlowAesEncrypt(
    IN PVOID   PlainText,
    IN SIZE_T  cbPlainText,
    IN PAESKEY Key
    );

VOID
SlowAesDecrypt(
    IN PVOID   PlainText,
    IN SIZE_T  cbPlainText,
    IN PAESKEY Key
    );

VOID
SlowAesLoadKey(
    IN  PVOID PlainKey,
    IN  PVOID Iv,
    OUT PAESKEY Key
    );

static
VOID
FORCEINLINE
InitAes(VOID)
{
    $DLOG1(DLG_FLT_INFO, "Initializing AES");
    $DLOG3(DLG_FLT_DEFAULT, Config.Features.bAES ? "Using AESNI instructions" : "Using the slow method");

    if (Config.Features.bAES) {
        AesEncrypt = FastAesEncrypt;
        AesDecrypt = FastAesDecrypt;
        AesLoadKey = FastAesLoadKey;
    } else {
        AesEncrypt = SlowAesEncrypt;
        AesDecrypt = SlowAesDecrypt;
        AesLoadKey = SlowAesLoadKey;
    }

    $DLOG2(DLG_FLT_INFO, "Done");
}

#endif
