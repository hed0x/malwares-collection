#include <init.h>
#include <crc32.h>
#include <aes.h>
#include <aeskey.h>
#include <cpu.h>
#include <config.h>
#include <console.h>

BOOL
InitCryptoModule(VOID)
{
    Crc32SumBuffer = CpuFeatures.SSE5 ? FastCrc32SumBuffer : SlowCrc32SumBuffer;

    if (CpuFeatures.AES) {
        AesEncryptBlock    = FastAesEncryptBlock;
        AesDecryptBlock    = FastAesDecryptBlock;
        AesLoadKey         = FastAesLoadKey;
        AesExpandedKeySize = FAST_AES_EX_KEY_SIZE;
    } else {
        AesEncryptBlock    = SlowAesEncryptBlock;
        AesDecryptBlock    = SlowAesDecryptBlock;
        AesLoadKey         = SlowAesLoadKey;
        AesExpandedKeySize = SLOW_AES_EX_KEY_SIZE;
    }

    #if SCFG_CRYPTO_AESKEY_FORCE_USE_XOROSHIRO == ON
        Config.Aes.KeyGenAlgorithm = AES_KEY_GEN_XOROSHIRO;
    #elif SCFG_CRYPTO_AESKEY_FORCE_USE_HARDWARE == ON
        Config.Aes.KeyGenAlgorithm = AES_KEY_GEN_HARDWARE;
    #elif SCFG_CRYPTO_AESKEY_FORCE_USE_CRYPTAPI == ON
        Config.Aes.KeyGenAlgorithm = AES_KEY_GEN_BCRYPT;
    #endif

    if (Config.Aes.KeyGenAlgorithm == AES_KEY_GEN_XOROSHIRO) {
        if (!InitAesKeyGenerateXoroshiro()) {
            return FALSE;
        }

        AesKeyGenerate = AesKeyGenerateXoroshiro;
    } else if (Config.Aes.KeyGenAlgorithm == AES_KEY_GEN_BCRYPT) {
        AesKeyGenerate = AesKeyGenerateBCrypt;
    } else if (Config.Aes.KeyGenAlgorithm == AES_KEY_GEN_HARDWARE) {
        AesKeyGenerate = AesKeyGenerateHardware;
    } else if (Config.Aes.KeyGenAlgorithm == AES_KEY_GEN_HARDWARE_XOROSHIRO) {
        if (CpuFeatures.RdRand) {
            AesKeyGenerate = AesKeyGenerateHardware;
        } else {
            ConsolePrint("This CPU doens't support HRNG, using XOROSHIRO\n");

            if (!InitAesKeyGenerateXoroshiro()) {
                return FALSE;
            }

            AesKeyGenerate = AesKeyGenerateXoroshiro;
        }
    } else if (Config.Aes.KeyGenAlgorithm == AES_KEY_GEN_HARDWARE_BCRYPT) {
        if (CpuFeatures.RdRand) {
            AesKeyGenerate = AesKeyGenerateHardware;
        } else {
            ConsolePrint("This CPU doens't support HRNG, using BCRYPT\n");
            AesKeyGenerate = AesKeyGenerateBCrypt;
        }
    } else {
        ConsolePrint("Invalid AES Key generator! Check settings.cfg...");

        return FALSE;
    }

    return TRUE;
}
