#ifndef AES_INCLUDED
#define AES_INCLUDED

#define AES_KEY_SIZE     16
#define AES_BLOCK_SIZE   16

#define SLOW_AES_EX_KEY_SIZE 176
#define FAST_AES_EX_KEY_SIZE 320

extern ULONG AesExpandedKeySize;

VOID
(* AesEncryptBlock)(
    IO PVOID PlainText,
    IN PVOID Key
    );

VOID
(* AesDecryptBlock)(
    IO PVOID PlainText,
    IN PVOID Key
    );

VOID
(* AesLoadKey)(
    IN  PVOID Key,
    OUT PVOID ExpandedKey
    );

VOID
SlowAesEncryptBlock(
    IO PVOID PlainText,
    IN PVOID Key
    );

VOID
SlowAesDecryptBlock(
    IO PVOID CipherText,
    IN PVOID Key
    );

VOID
SlowAesLoadKey(
    IN  PVOID Key,
    OUT PVOID ExpandedKey
    );

VOID
FastAesEncryptBlock(
    IO PVOID PlainText,
    IN PVOID Key
    );

VOID
FastAesDecryptBlock(
    IO PVOID CipherText,
    IN PVOID Key
    );

VOID
FastAesLoadKey(
    IN  PVOID Key,
    OUT PVOID ExpandedKey
    );

#endif
