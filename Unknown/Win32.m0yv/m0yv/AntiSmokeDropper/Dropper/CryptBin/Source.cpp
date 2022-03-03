#include <Windows.h>
#include "stdio.h"

extern "C"
{
#include "sha512.h"
}

#define TARGET_KEY 0xAC829D39

#pragma pack(1)
struct crypted_data
{

	unsigned char hash[512 / 8];
	unsigned char block[]; // шифрованные данные
};
#pragma pack()


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

VOID AddDword(LPBYTE lpBuffer, DWORD dwBufSize, DWORD dwKey)
{
	PDWORD pdwBuf = (PDWORD)lpBuffer;
	for (UINT i = 0; i < (dwBufSize / sizeof(DWORD)); i++)
	{
		pdwBuf[i] += dwKey;
		dwKey++;
	}
}

BOOL create_encrypt(LPBYTE lpBuffer, DWORD dwBufSize, LPBYTE *lpOutput, DWORD *dwOutputSize)
{
	if ((dwBufSize % sizeof(DWORD)) != 0)
		return FALSE;

	*dwOutputSize = dwBufSize + offsetof(crypted_data, block);
	crypted_data *cd = (crypted_data*)new BYTE[*dwOutputSize + 1];

	sha512(lpBuffer, dwBufSize, cd->hash);

	RtlCopyMemory(&cd->block[0], lpBuffer, dwBufSize);

	AddDword(&cd->block[0], dwBufSize, TARGET_KEY);

	*lpOutput = (LPBYTE)cd;
	
	return TRUE;
}

int main()
{
	LPBYTE lpBuffer = nullptr;
	DWORD dwBufSize = 0;
	do
	{
		if (!read2buf(L"capsid.bin", &lpBuffer, &dwBufSize))
			break;

		LPBYTE lpEncrypted = nullptr;
		DWORD dwEncSize = 0;
		if (!create_encrypt(lpBuffer, dwBufSize, &lpEncrypted, &dwEncSize))
			break;

		if (!dump2file(L"bin.dat", lpEncrypted, dwEncSize))
			break;

		printf("OK, encrypted!");

	} while (FALSE);

	Sleep(INFINITE);
}