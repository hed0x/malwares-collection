#include <Windows.h>
#include <stdio.h>

#pragma comment(lib, "crypt32")

extern "C"
{
#include "ed25519\ed25519.h"
}

#define ED25519_SEED_BYTES 32U
#define sign_ed25519_BYTES_DETACHED 64U
#define sign_ed25519_PUBLICKEYBYTES 32U
#define sign_ed25519_PRIVATEKEYBYTES 64U

/* G:\Work\APRCS\Ed25519_keygen\Release\seckey.bin (7/9/2020 4:33:08 PM)
StartOffset(h): 00000000, EndOffset(h): 0000003F, Length(h): 00000040 */

unsigned char ed25519_privatekey[64] = {
	0x60, 0x7F, 0x3F, 0x14, 0x75, 0x2B, 0x14, 0xC9, 0xB6, 0x70, 0x5D, 0x9E,
	0x64, 0xBB, 0x38, 0x6F, 0x96, 0xA9, 0x95, 0xF2, 0x8F, 0xAE, 0x5C, 0xDD,
	0xA0, 0x94, 0xE3, 0x46, 0x6B, 0xBC, 0xDE, 0x52, 0x5F, 0xB3, 0x86, 0x06,
	0x47, 0x6B, 0x02, 0xC0, 0x55, 0xA9, 0xC2, 0x46, 0xC1, 0x30, 0xE3, 0x35,
	0x7D, 0xED, 0x85, 0x4F, 0xE2, 0xCC, 0xAC, 0xB8, 0xAC, 0x0F, 0x11, 0x9C,
	0x5C, 0xD0, 0x65, 0xDD
};

/* G:\Work\APRCS\Ed25519_keygen\Release\pubkey.bin (7/9/2020 4:33:08 PM)
StartOffset(h): 00000000, EndOffset(h): 0000001F, Length(h): 00000020 */

unsigned char ed25519_publickey[32] = {
	0x66, 0xE3, 0x4B, 0x34, 0xF6, 0x3B, 0xE6, 0x58, 0x8A, 0xEC, 0x22, 0x00,
	0x59, 0x4E, 0x41, 0xB6, 0x94, 0x1F, 0xF4, 0xA4, 0xFA, 0x82, 0xD8, 0xCD,
	0x57, 0x22, 0x3F, 0x6F, 0x62, 0xAC, 0x8B, 0x11
};




extern "C"
{
#include "jfes\jfes.h"
}


BOOL Dump2File(PWCHAR wchName, LPBYTE lpData, SIZE_T dwSize)
{
	HANDLE hFile = CreateFileW(wchName, GENERIC_WRITE, 0, 0, CREATE_ALWAYS, 0, 0);
	if (hFile == INVALID_HANDLE_VALUE)
		return FALSE;

	DWORD dwWritten;
	BOOL bRet = WriteFile(hFile, lpData, dwSize, &dwWritten, 0);

	CloseHandle(hFile);

	return bRet;
}

BOOL ReadFromFile(PWCHAR pwFile, LPBYTE *lpOutput, SIZE_T *dwOutputSize)
{
	HANDLE hFile = CreateFileW(pwFile, GENERIC_READ, FILE_SHARE_READ, 0, OPEN_EXISTING, 0, 0);
	if (hFile == INVALID_HANDLE_VALUE)
		return FALSE;

	BOOL bRet = FALSE;
	DWORD dwSize = GetFileSize(hFile, 0);
	LPBYTE lpBuffer = (LPBYTE)VirtualAlloc(0, dwSize, MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE);
	if (lpBuffer)
	{
		bRet = ReadFile(hFile, lpBuffer, dwSize, (LPDWORD)dwOutputSize, NULL);
		if (bRet)
		{
			*lpOutput = lpBuffer;
		}
		else
		{
			*dwOutputSize = 0;
			VirtualFree(lpBuffer, 0, MEM_RELEASE);
		}
	}
	
	CloseHandle(hFile);

	return bRet;
}

void * _cdecl myMalloc(size_t size)
{
	printf("Allocating %d\n", size);
	return new BYTE[size];
}

void _cdecl myFree(void *block)
{
	printf("Free block\n");
	delete[]block;
}

PCHAR Convert2UTF8(PWCHAR pwStr, SIZE_T dwLen)
{
	int utf8_len = WideCharToMultiByte(CP_UTF8, 0, pwStr, dwLen, NULL, 0, NULL, NULL);
	if (utf8_len == 0)
		return nullptr;

	PCHAR pResult = new CHAR[utf8_len + 1];
	if (pResult == nullptr)
		return nullptr;
	
	RtlSecureZeroMemory(pResult, utf8_len + 1);

	WideCharToMultiByte(CP_UTF8, 0, pwStr, dwLen, pResult, utf8_len, 0, 0);

	return pResult;
}

BOOL _RtlCompareMemory(LPBYTE lpFirst, LPBYTE lpSecond, SIZE_T dwSize)
{
	for (UINT i = 0; i < dwSize; i++)
	{
		if (lpFirst[i] != lpSecond[i])
			return FALSE;
	}
	return TRUE;
}

VOID _RtlCopyMemory(LPBYTE lpDest, LPBYTE lpFrom, SIZE_T dwSize)
{
	for (UINT i = 0; i < dwSize; i++)
		lpDest[i] = lpFrom[i];
}

// ищет keyword_name в джсоне и проверяет равен ли он value_json
// если такого кейворда нет или он равен другому значению, то возвращает фолс
BOOL isKeywordEqualTo(PCHAR pchJson, jfes_token_t *tokens, jfes_size_t amount, unsigned char *keyword_name, unsigned char *value_json, jfes_size_t start_index)
{
	int keyword_len = strlen((const char*)keyword_name);
	int value_len = strlen((const char*)value_json);

	for (jfes_size_t i = start_index; i < amount; i++)
	{
		// найдем кейворд
		jfes_token_t token = tokens[i];
		if ((token.type == jfes_type_string) && (token.end - token.start == keyword_len) && (_RtlCompareMemory((LPBYTE)&pchJson[token.start], keyword_name, keyword_len)))
		{
			// проверим что значение равно нашему
			if (i + 1 != amount)
			{
				token = tokens[i + 1];
				if ((token.type == jfes_type_string) && (token.end - token.start == value_len) && (_RtlCompareMemory((LPBYTE)&pchJson[token.start], value_json, value_len)))
					return TRUE;
			}
		}
	}

	return FALSE;
}

// находит и keyword и создает в памяти буфер с его содержимым, если такого кейворда нет, то возвращает NULL
PCHAR getStringFromKeyword(PCHAR pchJson, jfes_token_t *tokens, jfes_size_t amount, unsigned char *keyword_name, jfes_size_t start_index)
{
	int keyword_len = strlen((const char*)keyword_name);
	PCHAR pResult = nullptr;

	for (jfes_size_t i = start_index; i < amount; i++)
	{
		jfes_token_t token = tokens[i];
		if ((token.type == jfes_type_string) && (token.end - token.start == keyword_len) && (_RtlCompareMemory((LPBYTE)&pchJson[token.start], keyword_name, keyword_len)))
		{
			if (i + 1 != amount)
			{
				token = tokens[i + 1];
				if (token.type == jfes_type_string)
				{
					int pResultSize = token.end - token.start;
					pResult = new CHAR[pResultSize + 1];
					if (pResult != nullptr)
					{
						RtlSecureZeroMemory(pResult, pResultSize + 1);
						_RtlCopyMemory((LPBYTE)pResult, (LPBYTE)&pchJson[token.start], pResultSize);
						break;
					}
				}
			}
		}
	}

	return pResult;
}


PCHAR convert_to_base64(LPBYTE lpBuffer, SIZE_T dwSize)
{
	PCHAR pchBase64 = nullptr;
	SIZE_T dwRequiredSize = 0;

	if (!CryptBinaryToStringA(lpBuffer, dwSize, CRYPT_STRING_BASE64 | CRYPT_STRING_NOCRLF, nullptr, &dwRequiredSize))
	{
		return nullptr;
	}

	pchBase64 = new CHAR[dwRequiredSize + 1];
	RtlSecureZeroMemory(pchBase64, dwRequiredSize + 1);
	if (!CryptBinaryToStringA(lpBuffer, dwSize, CRYPT_STRING_BASE64 | CRYPT_STRING_NOCRLF, pchBase64, &dwRequiredSize))
	{
		delete[]pchBase64;
		return nullptr;
	}

	return pchBase64;
}


int main()
{
	// в request.bin - UTF16-LE джсон, в аутпут пишем в UTF-8
	printf("Reading handshake operation data from request.bin for signing, saving result to response.bin\n");

	jfes_config_t config;
	jfes_size_t tokamount = 1024;
	jfes_parser_t parser;

	jfes_token_t *tokens = new jfes_token_t[tokamount];

	unsigned char ed25519_detached[sign_ed25519_BYTES_DETACHED];
	RtlSecureZeroMemory(ed25519_detached, sizeof(ed25519_detached));

	LPBYTE lpRequestData = nullptr;
	SIZE_T dwRequestSize = 0;
	PCHAR pchJsonHandshakeRequest = nullptr;
	PCHAR pchSessionIdentifier = nullptr;
	PCHAR pchBase64Signature = nullptr;
	do
	{
#ifndef _DEBUG
		if (!ReadFromFile(L"request.bin", &lpRequestData, &dwRequestSize))
			break;
#else
		if (!ReadFromFile(L"G:\\Work\\APRCS\\HandshakeEmulator\\Debug\\request.bin", &lpRequestData, &dwRequestSize))
			break;
#endif

		config.jfes_free = nullptr;
		config.jfes_malloc = nullptr;

		pchJsonHandshakeRequest = Convert2UTF8((PWCHAR)lpRequestData, wcslen((PWCHAR)lpRequestData) + 2);
		if (pchJsonHandshakeRequest == nullptr)
			break;

		printf("Json: %s\n", pchJsonHandshakeRequest);

	//	if (jfes_success != jfes_parse_to_value(&config, pchJsonHandshakeRequest, strlen(pchJsonHandshakeRequest) + 1, &value))
		//	break;

		if (jfes_success != jfes_init_parser(&parser, &config))
			break;

		if (jfes_success != jfes_parse_tokens(&parser, pchJsonHandshakeRequest, strlen(pchJsonHandshakeRequest) + 1, tokens, &tokamount))
			break;

		if (!isKeywordEqualTo(pchJsonHandshakeRequest, tokens, tokamount, (unsigned char*)"op", (unsigned char*)"hs", 0))
			break;

		pchSessionIdentifier = getStringFromKeyword(pchJsonHandshakeRequest, tokens, tokamount, (unsigned char*)"SessionIdentifier", 0);
		if (pchSessionIdentifier == nullptr)
			break;

		printf("SessionIdentifier: %s\n", pchSessionIdentifier);

		ed25519_sign(ed25519_detached, (unsigned char*)pchSessionIdentifier, strlen(pchSessionIdentifier), ed25519_publickey, ed25519_privatekey);

		pchBase64Signature = convert_to_base64(ed25519_detached, sizeof(ed25519_detached));
		if (pchBase64Signature == nullptr)
			break;

		CHAR chResult[1024];
		wsprintfA(chResult, "{\"op\": \"hs\", \"base64\": \"%s\"}", pchBase64Signature);

		printf("Response: %s\n", chResult);

		if (Dump2File(L"response.bin", (LPBYTE)chResult, strlen(chResult) + 1))
			printf("Success!\n");
		else
			printf("Error!\n");

	} while (FALSE);

	if (lpRequestData != nullptr)
		VirtualFree(lpRequestData, 0, MEM_RELEASE);
	if (pchJsonHandshakeRequest != nullptr)
		delete[]pchJsonHandshakeRequest;

	//jfes_free_value(&config, &value);

	if (tokens)
		delete[]tokens;
	if (pchSessionIdentifier != nullptr)
		delete[]pchSessionIdentifier;
	if (pchBase64Signature != nullptr)
		delete[]pchBase64Signature;

	return 0;
}