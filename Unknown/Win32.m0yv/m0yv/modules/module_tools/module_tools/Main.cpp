#include "global.h"
#include "stdio.h"
#include "HMexecutable_gen.h"


BOOL buf2file(PWCHAR pwFileName, LPBYTE lpBuf, SIZE_T dwSize)
{
	printf("Saving %d bytes to %S\n", dwSize, pwFileName);
	BOOL bRet = FALSE;
	HANDLE hFile = INVALID_HANDLE_VALUE;
	do
	{
		hFile = CreateFileW(pwFileName, GENERIC_WRITE, FILE_SHARE_READ, NULL, CREATE_ALWAYS, NULL, NULL);
		if (hFile == INVALID_HANDLE_VALUE)
			break;

		DWORD dwWritten;
		bRet = WriteFile(hFile, lpBuf, dwSize, &dwWritten, NULL);

	} while (FALSE);

	if (hFile != INVALID_HANDLE_VALUE)
		CloseHandle(hFile);

	return bRet;
}

static BOOL is_wchNumber(PWCHAR pwStr)
{
	if ((pwStr == nullptr) || (*pwStr == L'\0'))
		return FALSE;

	for (SIZE_T i = 0; i < wcslen(pwStr); i++)
	{
		// если не цифра в панике съебываем
		if (!((pwStr[i] >= L'0') && (pwStr[i] <= L'9')))
			return FALSE;
	}

	return TRUE;
}

// возвращает указатель на операнд, например --fast=10 вернет на 10, в --path="C:\database" вернет на "C:\database"
static PWCHAR get_ptr_operand(PWCHAR pwCommand)
{
	SetLastError(ERROR_SUCCESS);
	while (*pwCommand != L'=')
	{
		if ((*pwCommand == L'\0') || (*pwCommand == L' '))
		{
			// неверный синтаксис команды, встретили либо конец строки, либо пробел
			SetLastError(ERROR_INVALID_PARAMETER);
			return nullptr;
		}
		pwCommand++;
	}
	pwCommand++;
	return pwCommand;
}
// парсит число из например --fast=10 вернет 10
static UINT get_number_param(PWCHAR pwCommand)
{
	WCHAR strNumber[64];
	RtlSecureZeroMemory(strNumber, sizeof(strNumber));

	pwCommand = get_ptr_operand(pwCommand);
	if (pwCommand == nullptr)
		return 0;

	// скопируем данные которые идут после равно
	int i = 0;
	while ((*pwCommand != L'\0') && (*pwCommand != L' ') && (*pwCommand != L'\"'))
	{
		strNumber[i++] = *pwCommand;
		pwCommand++;
	}
	strNumber[i] = L'\0';

	// если не число выбьем ошибку
	if (!is_wchNumber(strNumber))
		SetLastError(ERROR_INVALID_PARAMETER);

	return _wtoi(strNumber);
}

// возвращает в новыделенной памяти строку содержащуюся после равно между "
// --path="C:\\hueta" -> C:\\hueta
// --ext="ext;ext2" -> ext;ext2
PWCHAR get_str_operand(PWCHAR pwCommand)
{
	pwCommand = get_ptr_operand(pwCommand);
	if (pwCommand == nullptr)
		return 0;

	if (pwCommand[0] != L'\"')
	{
		SetLastError(ERROR_INVALID_PARAMETER);
		return nullptr;
	}
	pwCommand++;
	PWCHAR pEndData = pwCommand;

	while ((*pEndData != L'\"') && (*pEndData != L'\0'))
		pEndData++;

	// нет завершителя
	if (*pEndData == L'\0')
	{
		SetLastError(ERROR_INVALID_PARAMETER);
		return nullptr;
	}

	SIZE_T dwStringSize = pEndData - pwCommand + 1;
	PWCHAR pwResult = new WCHAR[dwStringSize + 1];
	RtlSecureZeroMemory(pwResult, dwStringSize * 2 + 2);

	UINT i = 0;
	while (pwCommand != pEndData)
	{
		pwResult[i++] = *pwCommand;
		pwCommand++;
	}

	return pwResult;
}

BOOL ReadData(PWCHAR pwFilePath, LPBYTE *lpOut, PSIZE_T pdwSize)
{
	BOOL bRet = FALSE;

	HANDLE hFile = CreateFileW(pwFilePath, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, NULL, NULL);
	if (hFile == INVALID_HANDLE_VALUE)
		return FALSE;

	do
	{
		SIZE_T dwFileSize = GetFileSize(hFile, NULL);
		if (dwFileSize == 0)
			break;

		LPBYTE lpBuffer = new BYTE[dwFileSize + 1];
		if (lpBuffer == nullptr)
			break;
		
		RtlSecureZeroMemory(lpBuffer, dwFileSize);

		if (ReadFile(hFile, lpBuffer, dwFileSize, pdwSize, NULL))
		{
			bRet = TRUE;
			*lpOut = lpBuffer;
		}
		else
			delete[]lpBuffer;


	} while (FALSE);

	CloseHandle(hFile);

	return bRet;
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

// вайпит всякую хуету из пе файла
VOID wipe_meta(LPBYTE file)
{
	PIMAGE_DOS_HEADER pDos = (PIMAGE_DOS_HEADER)file;
	UINT_PTR pNtHeaders = (UINT_PTR)((SIZE_T)pDos + (SIZE_T)pDos->e_lfanew);

	BOOL b64 = FALSE;
	if (((PIMAGE_NT_HEADERS32)pNtHeaders)->FileHeader.Machine == IMAGE_FILE_MACHINE_AMD64)
		b64 = TRUE;
	else
		b64 = FALSE;

	printf("Wiping from %s\n", b64 ? "x64" : "x86");

	PIMAGE_DEBUG_DIRECTORY dbg = nullptr;
	PIMAGE_EXPORT_DIRECTORY pExport = nullptr;

	UINT_PTR dbg_RVA = NULL;
	UINT_PTR export_RVA;
	if (b64)
	{
		dbg_RVA = ((PIMAGE_NT_HEADERS64)pNtHeaders)->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_DEBUG].VirtualAddress;
		export_RVA = ((PIMAGE_NT_HEADERS64)pNtHeaders)->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT].VirtualAddress;
	}
	else
	{
		dbg_RVA = ((PIMAGE_NT_HEADERS32)pNtHeaders)->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_DEBUG].VirtualAddress;
		export_RVA = ((PIMAGE_NT_HEADERS32)pNtHeaders)->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT].VirtualAddress;
	}

	printf("wiping %s Timestamp: 0x%x -> 0\n", b64 ? "x64" : "x86", ((PIMAGE_NT_HEADERS32)pNtHeaders)->FileHeader.TimeDateStamp);
	((PIMAGE_NT_HEADERS32)pNtHeaders)->FileHeader.TimeDateStamp = 0;

	if (dbg_RVA == NULL)
		printf("No IMAGE_DEBUG_DIRECTORY\n");
	else
	{
		dbg = (PIMAGE_DEBUG_DIRECTORY)((SIZE_T)file + (SIZE_T)Rva2Offset(b64, dbg_RVA, (UINT_PTR)file));

		printf("wiping %s IMAGE_DEBUG_DIRECTORY Timestamp: 0x%x -> 0\n", b64 ? "x64" : "x86", dbg->TimeDateStamp);
		dbg->TimeDateStamp = 0;
	}

	if (export_RVA == NULL)
		printf("No IMAGE_EXPORT_DIRECTORY\n");
	else
	{
		pExport = (PIMAGE_EXPORT_DIRECTORY)((SIZE_T)file + (SIZE_T)Rva2Offset(b64, export_RVA, (UINT_PTR)file));
		printf("wiping %s IMAGE_EXPORT_DIRECTORY Timestamp: 0x%x -> 0\n", b64 ? "x64" : "x86", pExport->TimeDateStamp);
		pExport->TimeDateStamp = 0;
	}
}


BOOL gen_mdata(PWCHAR pwCommandLine)
{
	BOOL bRet = FALSE;

	PWCHAR pwx64 = nullptr;
	PWCHAR pwx86 = nullptr;
	LPBYTE lpx86Buffer = nullptr;
	LPBYTE lpx64Buffer = nullptr;
	SIZE_T dwx86Size = 0;
	SIZE_T dwx64Size = 0;

	DWORD dwFileName = 0;

	module_data::resident_mdata *pResident = nullptr;
	module_data::nonresident_mdata *pNonresident_x86 = nullptr;
	module_data::nonresident_mdata *pNonresident_x64 = nullptr;

	unsigned char detached_x86[MODULE_SIGNATURE_SIZE_DETACHED];
	unsigned char detached_x64[MODULE_SIGNATURE_SIZE_DETACHED];

	WCHAR wchCurrentDirectory[1024];

	RtlSecureZeroMemory(wchCurrentDirectory, sizeof(wchCurrentDirectory));
	RtlSecureZeroMemory(detached_x64, sizeof(detached_x64));
	RtlSecureZeroMemory(detached_x86, sizeof(detached_x86));

	do
	{
		if (!GetCurrentDirectoryW(MAX_PATH + 1, wchCurrentDirectory))
		{
			printf("error cant get current directory\n");
			break;
		}
	
		if (wcsstr(pwCommandLine, L"--m86"))
			pwx86 = get_str_operand(wcsstr(pwCommandLine, L"--m86"));
		if (wcsstr(pwCommandLine, L"--m64"))
			pwx64 = get_str_operand(wcsstr(pwCommandLine, L"--m64"));
		if (wcsstr(pwCommandLine, L"--mname"))
			dwFileName = get_number_param(wcsstr(pwCommandLine, L"--mname"));

		if ((pwx64 == nullptr) || (pwx86 == nullptr) || (dwFileName == 0))
		{
			printf("You need to supply both --m86=\"path\" and --m64=\"path\" and --mname=N\nWhere N - numeric module file name > 0");
			break;
		}
		
		if ((!ReadData(pwx86, &lpx86Buffer, &dwx86Size)) || (!ReadData(pwx64, &lpx64Buffer, &dwx64Size)) || (lpx64Buffer == nullptr) || (lpx86Buffer == nullptr))
		{
			printf("Cant read files\n");
			break;
		}

		if (!wcsstr(pwx86, L"i386"))
		{
			printf("invalid x86 format name\nCHECK IF CORRECT ARCH WAS PROVIDED\n");
			break;
		}

		if (!wcsstr(pwx64, L"AMD64"))
		{
			printf("invalid x64 format name\nCHECK IF CORRECT ARCH WAS PROVIDED\n");
			break;
		}

		printf("Module name %d, x86 %S = %d bytes, x64 %S = %d bytes\n", dwFileName, pwx86, dwx86Size, pwx64, dwx64Size);

		wipe_meta(lpx86Buffer);
		wipe_meta(lpx64Buffer);

		DWORD dwKey64 = 0;
		DWORD dwKey86 = 0;
		ConvertHeaders((PIMAGE_DOS_HEADER)lpx86Buffer);
		ConvertHeaders((PIMAGE_DOS_HEADER)lpx64Buffer);
		dwKey86 = GenKey(TRUE, (PIMAGE_HIVEMIND_HEADER)lpx86Buffer);
		dwKey64 = GenKey(TRUE, (PIMAGE_HIVEMIND_HEADER)lpx64Buffer);

		EncryptPointers((PIMAGE_HIVEMIND_HEADER)lpx86Buffer, dwKey86);
		EncryptPointers((PIMAGE_HIVEMIND_HEADER)lpx64Buffer, dwKey64);

		EncryptEntryPoint((PIMAGE_HIVEMIND_HEADER)lpx86Buffer, dwKey86, FALSE);
		EncryptEntryPoint((PIMAGE_HIVEMIND_HEADER)lpx64Buffer, dwKey64, TRUE);

		EncryptImportNames((PIMAGE_HIVEMIND_HEADER)lpx86Buffer, dwKey86, FALSE);
		EncryptImportNames((PIMAGE_HIVEMIND_HEADER)lpx64Buffer, dwKey64, TRUE);

		ed25519_sign(detached_x86, lpx86Buffer, dwx86Size, ed25519::publickey, ed25519::secretkey);
		ed25519_sign(detached_x64, lpx64Buffer, dwx64Size, ed25519::publickey, ed25519::secretkey);

		DWORD dwx86NonResSize = offsetof(module_data::nonresident_mdata, module_data::nonresident_mdata::bufModuleFile) + dwx86Size;
		DWORD dwx64NonResSize = offsetof(module_data::nonresident_mdata, module_data::nonresident_mdata::bufModuleFile) + dwx64Size;
		pNonresident_x64 = (module_data::nonresident_mdata*)new BYTE[dwx64NonResSize + 1];
		pNonresident_x86 = (module_data::nonresident_mdata*)new BYTE[dwx86NonResSize + 1];
		
		DWORD dwResidentSize = sizeof(module_data::resident_mdata) + dwx64Size + dwx86Size;
		pResident = (module_data::resident_mdata*)new BYTE[dwResidentSize + 1];

		if ((pNonresident_x64 == nullptr) || (pNonresident_x86 == nullptr) || (pResident == nullptr))
		{
			printf("Cant alloc module data\n");
			break;
		}

		RtlSecureZeroMemory(pNonresident_x64, offsetof(module_data::nonresident_mdata, module_data::nonresident_mdata::bufModuleFile) + dwx64Size);
		RtlSecureZeroMemory(pNonresident_x86, offsetof(module_data::nonresident_mdata, module_data::nonresident_mdata::bufModuleFile) + dwx86Size);
		RtlSecureZeroMemory(pResident, dwResidentSize);


		pResident->dwStructSize = dwResidentSize;
		pResident->dwModulex64Size = dwx64Size;
		pResident->dwModulex86Size = dwx86Size;
		pResident->dwModuleName = dwFileName;
		RtlCopyMemory(pResident->bufSignaturex64, detached_x64, MODULE_SIGNATURE_SIZE_DETACHED);
		RtlCopyMemory(pResident->bufSignaturex86, detached_x86, MODULE_SIGNATURE_SIZE_DETACHED);

		// x86 идет сразу следом за структурой
		pResident->dwModulex86BufferOffset = sizeof(module_data::resident_mdata);
		RtlCopyMemory((LPBYTE)((SIZE_T)pResident + (SIZE_T)pResident->dwModulex86BufferOffset), lpx86Buffer, dwx86Size);
		// x64 следом за x86
		pResident->dwModulex64BufferOffset = pResident->dwModulex86BufferOffset + dwx86Size;
		RtlCopyMemory((LPBYTE)((SIZE_T)pResident + (SIZE_T)pResident->dwModulex64BufferOffset), lpx64Buffer, dwx64Size);

		pNonresident_x64->dwArchitecture = IMAGE_FILE_MACHINE_AMD64;
		pNonresident_x64->dwBufferSize = dwx64Size;
		pNonresident_x64->dwModuleName = dwFileName;
		RtlCopyMemory(pNonresident_x64->bufModuleFile, lpx64Buffer, dwx64Size);
	
		pNonresident_x86->dwArchitecture = IMAGE_FILE_MACHINE_I386;
		pNonresident_x86->dwBufferSize = dwx86Size;
		pNonresident_x86->dwModuleName = dwFileName;
		RtlCopyMemory(pNonresident_x86->bufModuleFile, lpx86Buffer, dwx86Size);

		bRet = TRUE;

		WCHAR wchName[1024];
		wsprintfW(wchName, L"%s\\resident\\%d.bin", wchCurrentDirectory, dwFileName);
		bRet &= buf2file(wchName, (LPBYTE)pResident, dwResidentSize);
		wsprintfW(wchName, L"%s\\x86\\%d.bin", wchCurrentDirectory, dwFileName);
		bRet &= buf2file(wchName, (LPBYTE)pNonresident_x86, dwx86NonResSize);
		wsprintfW(wchName, L"%s\\x64\\%d.bin", wchCurrentDirectory, dwFileName);
		bRet &= buf2file(wchName, (LPBYTE)pNonresident_x64, dwx64NonResSize);

	} while (FALSE);

	if (pNonresident_x64 != nullptr)
		delete[]pNonresident_x64;
	if (pNonresident_x86 != nullptr)
		delete[]pNonresident_x86;
	if (pResident != nullptr)
		delete[]pResident;

	if (lpx86Buffer != nullptr)
		delete[]lpx86Buffer;
	if (lpx64Buffer != nullptr)
		delete[]lpx64Buffer;
	if (pwx64 != nullptr)
		delete[]pwx64;
	if (pwx86 != nullptr)
		delete[]pwx86;

	return bRet;
}

int main()
{
	PWCHAR pwCommandLine = GetCommandLineW();
	do
	{
		if (pwCommandLine == nullptr)
			break;

		if (gen_mdata(pwCommandLine))
			printf("SUCCESSFULL\n");
		else
			printf("ERRROR\n");

	} while (FALSE);
	
	return 0;
}