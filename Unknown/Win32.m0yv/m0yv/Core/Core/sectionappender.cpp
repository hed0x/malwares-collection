#include "sectionappender.hpp"
#include "utils.hpp"

static DWORD dwMax(DWORD a, DWORD b)
{
	if (a > b)
		return a;
	else
		return b;
}

BOOL appender::LastSectionAppender::set_attributes(HANDLE hFile, DWORD dwAttribute, DWORD dwArch)
{
	LARGE_INTEGER liMoveDistance;
	RtlSecureZeroMemory(&liMoveDistance, sizeof(liMoveDistance));
	LPBYTE lpHeaders = nullptr;
	DWORD dwHeadersSize = 0;
	BOOL bRet = FALSE;
	do
	{
		dwHeadersSize = GetPEHeadersSize(hFile, dwArch);

		if (!SetFilePointerEx(hFile, liMoveDistance, NULL, FILE_BEGIN))
			break;

		lpHeaders = new BYTE[dwHeadersSize + 1];
		if (lpHeaders == nullptr)
			break;

		DWORD dwRead = 0;
		if (!ReadFile(hFile, lpHeaders, dwHeadersSize, &dwRead, NULL))
			break;

		PIMAGE_SECTION_HEADER pLastSection = this->get_last_section((PIMAGE_DOS_HEADER)lpHeaders, dwArch);
		if (pLastSection == nullptr)
			break;

		if (!SetFilePointerEx(hFile, liMoveDistance, NULL, FILE_BEGIN))
			break;

		pLastSection->Characteristics |= dwAttribute;
		DWORD dwWritten = 0;
		bRet = WriteFile(hFile, lpHeaders, dwHeadersSize, &dwWritten, NULL);

	} while (FALSE);

	if (lpHeaders != nullptr)
		delete[]lpHeaders;

	SetFilePointerEx(hFile, liMoveDistance, NULL, FILE_BEGIN);

	return bRet;
}

BOOL appender::LastSectionAppender::append_data(HANDLE hFile, LPBYTE lpDataBuffer, SIZE_T dwDataSize, appender_status * outStatus, DWORD dwArch, BOOL bDoNotWrite)
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
#endif

	unsigned char align_buf[128];
	DWORD dwAdditionalAligmentBytes = 0;
	LARGE_INTEGER liMoveDistance;
	RtlSecureZeroMemory(&liMoveDistance, sizeof(liMoveDistance));

	DWORD dwHeadersSize = GetPEHeadersSize(hFile, dwArch);
	LPBYTE lpHeaders = nullptr;
	BOOL bRet = FALSE;
	do
	{
		RtlSecureZeroMemory(&liMoveDistance, sizeof(liMoveDistance));
		if (!SetFilePointerEx(hFile, liMoveDistance, NULL, FILE_BEGIN))
			break;

		if (dwHeadersSize == 0)
		{
#ifdef _DEBUG
			WriteLog(L"[appender::LastSectionAppender::append_data] error invalid header size");
#endif
			break;
		}
		lpHeaders = new BYTE[dwHeadersSize + 1];
		if (lpHeaders == nullptr)
			break;

		DWORD dwRead = 0;
		if (!ReadFile(hFile, lpHeaders, dwHeadersSize, &dwRead, NULL))
			break;

		PIMAGE_SECTION_HEADER pLastSection = this->get_last_section((PIMAGE_DOS_HEADER)lpHeaders, dwArch);
		if (pLastSection == nullptr)
			break;

#ifdef _DEBUG
		wsprintfW(debugOut,
			L"[appender::LastSectionAppender::append_data] HeadersSize = %d, LastSection: Name = %S, Characteristics = 0x%x, SizeOfRaw = 0x%x",
			dwHeadersSize, pLastSection->Name, pLastSection->Characteristics, pLastSection->SizeOfRawData);
		WriteLog(debugOut);
#endif

		DWORD dwSectionAlignment, dwFileAligmment;
		this->get_aligments((PIMAGE_DOS_HEADER)lpHeaders, &dwSectionAlignment, &dwFileAligmment, dwArch);

		// уравняем 
		int iDifference = pLastSection->SizeOfRawData - (int)pLastSection->Misc.VirtualSize;

		// --- заполним результат ---
		// начало присоединенных данных section RVA + размер (maxrva старой секции) + разница между размерами virtual и физическим
		outStatus->BeginDataRVA = pLastSection->VirtualAddress + pLastSection->Misc.VirtualSize;
		if (iDifference > 0)
			outStatus->BeginDataRVA += iDifference;
		else
			outStatus->BeginDataRVA -= (DWORD)abs(iDifference);

		// размер данных
		outStatus->dwDataSize = dwDataSize;
		// файловый офсет до присоединенных данных section file offset + section raw file size
		outStatus->BeginDataFileOffset = pLastSection->PointerToRawData + pLastSection->SizeOfRawData;

		DWORD dwOldSize = pLastSection->SizeOfRawData;

		// установим новый выравненный физический и виртуальный размер
		pLastSection->SizeOfRawData = align(pLastSection->SizeOfRawData + dwDataSize, dwSectionAlignment);

		/*pLastSection->Misc.VirtualSize = align(pLastSection->Misc.VirtualSize + dwDataSize, dwSectionAlignment);*/
		// виртуальный считаем таким образом, чтобы VirtualSize был всегда больше чем SizeOfRawData поскольку иначе есть риск что наши дописанные данные не замапятся 
		pLastSection->Misc.VirtualSize = align(pLastSection->SizeOfRawData + dwDataSize, dwSectionAlignment);
		
		// пофиксим размер модуля
		// количество байт для записи после выравнивания, общий выравненный - (старый размер + дописываемый размер)
		dwAdditionalAligmentBytes = pLastSection->SizeOfRawData - (dwOldSize + dwDataSize);

		outStatus->NewImageSize = align(pLastSection->VirtualAddress + pLastSection->Misc.VirtualSize, dwSectionAlignment);
		this->fix_imagesize((PIMAGE_DOS_HEADER)lpHeaders, outStatus->NewImageSize, dwArch);
		
		if (bDoNotWrite == TRUE)
		{
#ifdef _DEBUG
			WriteLog(L"[appender::LastSectionAppender::append_data] do not write flag is set, returning...");
#endif
			bRet = TRUE;
			break;
		}

		RtlSecureZeroMemory(&liMoveDistance, sizeof(liMoveDistance));
		if (!SetFilePointerEx(hFile, liMoveDistance, NULL, FILE_BEGIN))
			break;

		// перезапишем хидеры
		DWORD dwWritten;
		if (!WriteFile(hFile, lpHeaders, dwHeadersSize, &dwWritten, 0))
			break;

		// запишем добавленные данные
		liMoveDistance.QuadPart = (LONGLONG)outStatus->BeginDataFileOffset;
		if (!SetFilePointerEx(hFile, liMoveDistance, NULL, FILE_BEGIN))
			break;

		bRet = WriteFile(hFile, lpDataBuffer, dwDataSize, &dwWritten, NULL);

		// выравним файл
		RtlSecureZeroMemory(align_buf, sizeof(align_buf));
		while (dwAdditionalAligmentBytes > 0)
		{
			if (dwAdditionalAligmentBytes >= sizeof(align_buf))
				WriteFile(hFile, align_buf, sizeof(align_buf), &dwWritten, NULL);
			else
				WriteFile(hFile, align_buf, dwAdditionalAligmentBytes, &dwWritten, NULL);
			dwAdditionalAligmentBytes -= dwWritten;
		}

	} while (FALSE);

	if (lpHeaders != nullptr)
		delete[]lpHeaders;

	RtlSecureZeroMemory(&liMoveDistance, sizeof(liMoveDistance));
	SetFilePointerEx(hFile, liMoveDistance, NULL, FILE_BEGIN);

	return bRet;
}

BOOL appender::LastSectionAppender::disable_security(HANDLE hFile, DWORD dwArch, BOOL bDisableRelocs)
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
#endif
	LARGE_INTEGER liMoveDistance;
	DWORD dwHeadersSize = GetPEHeadersSize(hFile, dwArch);
	LPBYTE lpHeaders = nullptr;
	DWORD dwRead;
	BOOL bRet = FALSE;
	UINT_PTR pNtHeaders = NULL;
	PIMAGE_DATA_DIRECTORY pRelocs = nullptr;
	PIMAGE_DATA_DIRECTORY pSecurityDir = nullptr;

	DWORD NumberOfRvaAndSizes = 0;
	do
	{
		RtlSecureZeroMemory(&liMoveDistance, sizeof(liMoveDistance));
		if (!SetFilePointerEx(hFile, liMoveDistance, NULL, FILE_BEGIN))
			break;

		lpHeaders = new BYTE[dwHeadersSize + 1];
		if (lpHeaders == nullptr)
			break;
		
		if (!ReadFile(hFile, lpHeaders, dwHeadersSize, &dwRead, 0))
			break;

		PIMAGE_DOS_HEADER pDos = (PIMAGE_DOS_HEADER)lpHeaders;
		pNtHeaders = (UINT_PTR)((SIZE_T)lpHeaders + (SIZE_T)pDos->e_lfanew);

		switch (dwArch)
		{
		case IMAGE_FILE_MACHINE_I386:
			NumberOfRvaAndSizes = ((PIMAGE_NT_HEADERS32)pNtHeaders)->OptionalHeader.NumberOfRvaAndSizes;

			if (IMAGE_DIRECTORY_ENTRY_BASERELOC < NumberOfRvaAndSizes)
				pRelocs = &((PIMAGE_NT_HEADERS32)pNtHeaders)->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_BASERELOC];
			if (IMAGE_DIRECTORY_ENTRY_SECURITY < NumberOfRvaAndSizes)
				pSecurityDir = &((PIMAGE_NT_HEADERS32)pNtHeaders)->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_SECURITY];
			
			// снимем флаг ASLR
			if (bDisableRelocs)
				((PIMAGE_NT_HEADERS32)pNtHeaders)->OptionalHeader.DllCharacteristics &= ~IMAGE_DLLCHARACTERISTICS_DYNAMIC_BASE;

			// CFG
			((PIMAGE_NT_HEADERS32)pNtHeaders)->OptionalHeader.DllCharacteristics &= ~IMAGE_DLLCHARACTERISTICS_GUARD_CF;

			break;
		case IMAGE_FILE_MACHINE_AMD64:
			NumberOfRvaAndSizes = ((PIMAGE_NT_HEADERS64)pNtHeaders)->OptionalHeader.NumberOfRvaAndSizes;

			if (IMAGE_DIRECTORY_ENTRY_BASERELOC < NumberOfRvaAndSizes)
				pRelocs = &((PIMAGE_NT_HEADERS64)pNtHeaders)->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_BASERELOC];
			if (IMAGE_DIRECTORY_ENTRY_SECURITY < NumberOfRvaAndSizes)
				pSecurityDir = &((PIMAGE_NT_HEADERS64)pNtHeaders)->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_SECURITY];

			// снимем флаг ASLR
			if (bDisableRelocs)
				((PIMAGE_NT_HEADERS64)pNtHeaders)->OptionalHeader.DllCharacteristics &= ~IMAGE_DLLCHARACTERISTICS_DYNAMIC_BASE;

			// CFG
			((PIMAGE_NT_HEADERS64)pNtHeaders)->OptionalHeader.DllCharacteristics &= ~IMAGE_DLLCHARACTERISTICS_GUARD_CF;


			break;
		default:
			break;
		}

		// удалим релоки если опционально - тру
		if ((bDisableRelocs) && (pRelocs) && (pRelocs->VirtualAddress != 0))
		{
#ifdef _DEBUG
			wsprintfW(debugOut, L"[appender::LastSectionAppender::disable_security] disabling relocs located at 0x%x with size %d", pRelocs->VirtualAddress, pRelocs->Size);
			WriteLog(debugOut);
#endif
			pRelocs->VirtualAddress = 0;
			pRelocs->Size = 0;
		}

		// сносим подпись
		if ((pSecurityDir) && (pSecurityDir->VirtualAddress != 0))
		{
#ifdef _DEBUG
			wsprintfW(debugOut, L"[appender::LastSectionAppender::disable_security] disabling security directory located at 0x%x with size %d", pSecurityDir->VirtualAddress, pSecurityDir->Size);
			WriteLog(debugOut);
#endif
			pSecurityDir->VirtualAddress = 0;
			pSecurityDir->Size = 0;
		}


		RtlSecureZeroMemory(&liMoveDistance, sizeof(liMoveDistance));
		SetFilePointerEx(hFile, liMoveDistance, NULL, FILE_BEGIN);

		DWORD dwWritten;
		bRet = WriteFile(hFile, lpHeaders, dwHeadersSize, &dwWritten, NULL);

	} while (FALSE);

	if (lpHeaders != nullptr)
		delete[]lpHeaders;

	RtlSecureZeroMemory(&liMoveDistance, sizeof(liMoveDistance));
	SetFilePointerEx(hFile, liMoveDistance, NULL, FILE_BEGIN);
	
	return bRet;
}

PIMAGE_SECTION_HEADER appender::LastSectionAppender::get_last_section(PIMAGE_DOS_HEADER pDosHeader, DWORD dwArch)
{
	UINT_PTR pNtHeaders = (UINT_PTR)((SIZE_T)pDosHeader + (SIZE_T)pDosHeader->e_lfanew);

	PIMAGE_SECTION_HEADER pFirstSection = nullptr;
	DWORD dwSizeOfOptionalHeader = 0;
	DWORD dwNumberOfSections = 0;
	UINT i = 0;

	switch (dwArch)
	{
	case IMAGE_FILE_MACHINE_I386:
		dwNumberOfSections = ((PIMAGE_NT_HEADERS32)pNtHeaders)->FileHeader.NumberOfSections;
		dwSizeOfOptionalHeader = ((PIMAGE_NT_HEADERS32)pNtHeaders)->FileHeader.SizeOfOptionalHeader;
		pFirstSection = (PIMAGE_SECTION_HEADER)((SIZE_T)pNtHeaders + (SIZE_T)offsetof(IMAGE_NT_HEADERS32, OptionalHeader) + (SIZE_T)dwSizeOfOptionalHeader);
		break;
	case IMAGE_FILE_MACHINE_AMD64:
		dwNumberOfSections = ((PIMAGE_NT_HEADERS64)pNtHeaders)->FileHeader.NumberOfSections;
		dwSizeOfOptionalHeader = ((PIMAGE_NT_HEADERS64)pNtHeaders)->FileHeader.SizeOfOptionalHeader;
		pFirstSection = (PIMAGE_SECTION_HEADER)((SIZE_T)pNtHeaders + (SIZE_T)offsetof(IMAGE_NT_HEADERS64, OptionalHeader) + (SIZE_T)dwSizeOfOptionalHeader);
		break;
	}

	// обойдем все секции взяв последнюю секцию с ненулевым физическим размером
	
	PIMAGE_SECTION_HEADER pLastSection = &pFirstSection[dwNumberOfSections - 1];
	while (pLastSection->SizeOfRawData == 0)
		pLastSection--;

	return pLastSection;
}

DWORD appender::LastSectionAppender::get_aligments(PIMAGE_DOS_HEADER pDosHeader, PDWORD dwSectionAlign, PDWORD dwFileAlign, DWORD dwArch)
{
	UINT_PTR pNtHeaders = (UINT_PTR)((SIZE_T)pDosHeader + (SIZE_T)pDosHeader->e_lfanew);

	switch (dwArch)
	{
	case IMAGE_FILE_MACHINE_I386:
		*dwSectionAlign = ((PIMAGE_NT_HEADERS32)pNtHeaders)->OptionalHeader.SectionAlignment;
		*dwFileAlign = ((PIMAGE_NT_HEADERS32)pNtHeaders)->OptionalHeader.FileAlignment;
		break;
	case IMAGE_FILE_MACHINE_AMD64:
		*dwSectionAlign = ((PIMAGE_NT_HEADERS64)pNtHeaders)->OptionalHeader.SectionAlignment;
		*dwFileAlign = ((PIMAGE_NT_HEADERS64)pNtHeaders)->OptionalHeader.FileAlignment;
		break;
	default:
		*dwSectionAlign = 0;
		*dwFileAlign = 0;
		break;
	}

	return 0;
}

DWORD appender::LastSectionAppender::fix_imagesize(PIMAGE_DOS_HEADER pDosHeader, DWORD dwNewSize, DWORD dwArch)
{
	UINT_PTR pNtHeaders = (UINT_PTR)((SIZE_T)pDosHeader + (SIZE_T)pDosHeader->e_lfanew);
	switch (dwArch)
	{
	case IMAGE_FILE_MACHINE_I386:
		((PIMAGE_NT_HEADERS32)pNtHeaders)->OptionalHeader.SizeOfImage = dwNewSize;
		break;
	case IMAGE_FILE_MACHINE_AMD64:
		((PIMAGE_NT_HEADERS64)pNtHeaders)->OptionalHeader.SizeOfImage = dwNewSize;
		break;
	}
	return 0;
}
