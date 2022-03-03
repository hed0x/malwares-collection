#include <Windows.h>
#include "stdio.h"
#include "time.h"

#define KEYSTREAM_SIZE 16
#pragma pack(1)
struct string_container
{
	unsigned char keystream[KEYSTREAM_SIZE]; // KEYSTREAM_SIZE*8-бит keystream для ксора с соответствующим байтом строки
	DWORD dwSizeOfBlob; // размер строки в байтах
	unsigned char str[]; // покриптованная строка
};
#pragma pack()

// L"Test string"
unsigned char test_container[42] = {
	0xF0, 0x4C, 0x87, 0x05, 0x81, 0x59, 0x21, 0x70, 0x1B, 0x78, 0x1F, 0xB0,
	0xE3, 0x5C, 0x9A, 0x8A, 0x16, 0x00, 0x00, 0x00, 0xA4, 0x4C, 0xE2, 0x05,
	0xF2, 0x59, 0x55, 0x70, 0x3B, 0x78, 0x6C, 0xB0, 0x97, 0x5C, 0xE8, 0x8A,
	0x9B, 0x4F, 0xE9, 0x0A, 0xE0, 0x60
};


unsigned char mutate(unsigned char* keystream, int index)
{
	return ((keystream[index] ^ 2) + index) % 255;
}
// ксорит блоб с keystream, как только keystream заканчивается, то он переиспользуется для оставшихся байт
void apply_keystream(unsigned char *blob, DWORD dwBlob_size, unsigned char *keystream)
{
	// новый keystream, на базе прошлых операций
	unsigned char new_keystream[KEYSTREAM_SIZE];
	DWORD dwBytesLeft = dwBlob_size;

	for (UINT i = 0; i < KEYSTREAM_SIZE; i++)
	{
		// создадим новый keystream для последующего прохода
		new_keystream[i] = mutate(keystream, i);

		blob[i] ^= keystream[i];
		dwBytesLeft--;
		// больше не надо ксорить
		if (dwBytesLeft == 0)
			break;
	}
	if (dwBytesLeft == 0)
		return; // поксорили все байты

				// иначе остались еще байты, доксорим
	apply_keystream(&blob[dwBlob_size - dwBytesLeft], dwBytesLeft, new_keystream);

	return;
}

BOOL ReadData(LPBYTE *lpData, PSIZE_T dwDataSize)
{
	HANDLE hFile = CreateFileW(L"string.txt", GENERIC_READ, 0, 0, OPEN_EXISTING, 0, 0);
	if (hFile == INVALID_HANDLE_VALUE)
		return FALSE;

	*dwDataSize = GetFileSize(hFile, 0);
	*lpData = new BYTE[*dwDataSize + 1];
	RtlSecureZeroMemory(*lpData, *dwDataSize + 1);
	DWORD dwRead = 0;

	ReadFile(hFile, *lpData, *dwDataSize, &dwRead, 0);

	CloseHandle(hFile);

	return TRUE;
}

LPVOID open_string_container(unsigned char *container, SIZE_T dwContainerSize)
{
	string_container *sc = (string_container*)container;
	LPBYTE lpResult = new BYTE[sc->dwSizeOfBlob + 2 + 1];
	if (lpResult == nullptr)
		return nullptr;

	RtlSecureZeroMemory(lpResult, sc->dwSizeOfBlob + 2);
	RtlCopyMemory(lpResult, sc->str, sc->dwSizeOfBlob);

	apply_keystream(lpResult, sc->dwSizeOfBlob, sc->keystream);

	return lpResult;
}

// выполним тесты контейнера строк
BOOL test()
{

	CHAR szStr[32];
	for (UINT i = 0; i < sizeof(szStr); i++)
		szStr[i] = rand() % 255;
	szStr[31] = 0;

	WCHAR wchStr[] = L"Hello, World!";

	SIZE_T szStrSize = 31;
	SIZE_T wchStrSize = lstrlenW(wchStr);

	unsigned char keystream[KEYSTREAM_SIZE];

	PCHAR pszCrypted = new CHAR[szStrSize + 1];
	PWCHAR pwCrypted = new WCHAR[wchStrSize * 2 + 2];

	// 1000 тестов
	for (UINT i = 0; i < 1000;i++)
	{
		memcpy(pszCrypted, szStr, 32);
		lstrcpyW(pwCrypted, wchStr);

		// заполним keystream
		for (UINT i = 0; i < KEYSTREAM_SIZE; i++)
		{
			keystream[i] = rand() % 255;
		}

		apply_keystream((unsigned char*)pszCrypted, szStrSize, keystream);
		apply_keystream((unsigned char*)pwCrypted, wchStrSize * 2, keystream);

		apply_keystream((unsigned char*)pszCrypted, szStrSize, keystream);
		apply_keystream((unsigned char*)pwCrypted, wchStrSize * 2, keystream);

		if (memcmp(pszCrypted, szStr, 32))
			printf("FAILED TEST ascii %d\n", i);
		if (lstrcmpiW(pwCrypted, wchStr))
			printf("FAILED TEST unicode %d\n", i);


	}


	return TRUE;
}

BOOL testopen()
{
	DWORD dwStart = GetTickCount();
	for (UINT i = 0; i < 1000; i++)
	{
		PWCHAR pwTest = (PWCHAR)open_string_container(test_container, sizeof(test_container));
		if (pwTest)
		{
			RtlSecureZeroMemory(pwTest, lstrlenW(pwTest) * 2);
			delete[]pwTest;
		}
	}
	printf("Time taken: %d ms\n", GetTickCount() - dwStart);

	return FALSE;
}

int main()
{
	srand(time(NULL));
	for (UINT i = 0; i < 100; i++)
		test();
	testopen();

	printf("Reading the string from string.txt\n");

	BOOL wchardata = FALSE;

	LPBYTE lpData = nullptr;
	SIZE_T dwDataSize = 0;
	if (!ReadData(&lpData, &dwDataSize))
		return 0;

	LPBYTE lpStringPtr = lpData;
	SIZE_T dwStringBytesNum = dwDataSize; // размер блоба строки, сколько она занимает в байтах
	if (dwDataSize > 2)
	{
		// проверим BOM
		if ((lpData[0] == 0xFF) && (lpData[1] == 0xFE))
		{
			printf("String.txt is UTF16-LE: %S\n", &lpData[2]);
			wchardata = TRUE;
			lpStringPtr = &lpData[2]; // указатель на строку будет после BOM'а
			dwStringBytesNum -= 2; // 2 байта занимает BOM
		}
		else
			printf("String.txt is ascii: %s\n", lpData);
	}
	else
		printf("String.txt is ascii: %s\n", lpData);

	// сгенерим keystream
	unsigned char keystream[KEYSTREAM_SIZE];
	for (UINT i = 0; i < KEYSTREAM_SIZE; i++)
		keystream[i] = rand() % 255;

	SIZE_T dwResultSize = offsetof(string_container, str) + dwStringBytesNum;

	LPBYTE lpResult = new BYTE[dwResultSize + 1];
	string_container *sc = (string_container*)lpResult;
	// заполним результирующую структуру
	sc->dwSizeOfBlob = dwStringBytesNum;
	memcpy(sc->keystream, keystream, KEYSTREAM_SIZE);
	memcpy(sc->str, lpStringPtr, dwStringBytesNum);
	apply_keystream(sc->str, sc->dwSizeOfBlob, sc->keystream);

	HANDLE hFile = CreateFileW(L"container.bin", GENERIC_WRITE, 0, 0, CREATE_ALWAYS, 0, 0);
	if (hFile != INVALID_HANDLE_VALUE)
	{
		DWORD dwWritten;
		WriteFile(hFile, lpResult, dwResultSize, &dwWritten, 0);
		CloseHandle(hFile);
		printf("Saved to container.bin\n");
	}


	return 0;
}