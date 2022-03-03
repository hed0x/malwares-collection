#include "FileSearch.h"
#include "strings.hpp"

static BOOL BlacklistDir(PWCHAR wchDir)
{
	CCryptString cStr_windows(cryptedstr_slashedwindowsfolder);
	CCryptString cStr_programdata(cryptedstr_programdata);
	// не AppData (!), а "Application Data"
	CCryptString cStr_applicationdata(cryptedstr_applicationdata);
	CCryptString cStr_slashmicrosoft(cryptedstr_slashmicrosoft);

	PWCHAR pwBlacklisted[4];
	pwBlacklisted[0] = cStr_windows.w_str();
	pwBlacklisted[1] = cStr_programdata.w_str();
	pwBlacklisted[2] = cStr_applicationdata.w_str();
	pwBlacklisted[3] = cStr_slashmicrosoft.w_str();

	for (UINT iIndex = 0; iIndex < sizeof(pwBlacklisted) / sizeof(PWCHAR); iIndex++)
	{
		if (wcsstr(wchDir, pwBlacklisted[iIndex]))
			return TRUE;
	}

	return FALSE;
}

BOOL BlacklistFile(PWCHAR pwFileName)
{
	CCryptString cStr_chrome(cryptedstr_chromeexe);
	CCryptString cStr_msedge(cryptedstr_msedgeexe);

	PWCHAR pwBlacklisted[2];
	pwBlacklisted[0] = cStr_chrome.w_str();
	pwBlacklisted[1] = cStr_msedge.w_str();

	for (UINT iIndex = 0; iIndex < sizeof(pwBlacklisted) / sizeof(PWCHAR); iIndex++)
	{
		if (!_wcsicmp(pwFileName, pwBlacklisted[iIndex]))
		{
#ifdef _DEBUG
			WriteLog(L"[BlacklistFile] blacklisted filename ", pwFileName);
#endif
			return TRUE;
		}
	}

	return FALSE;
}

static DWORD FindRecursive(PWCHAR wchDir, UINT uMaxSearchPathLen, search_api::fnSearchCallback onFound, LPBYTE lpParameter, SIZE_T dwParameterSize, BOOL bUseBlacklist, UINT uCurrentPathLen)
{

	WIN32_FIND_DATAW fd;

	

	// проверим что директория в которую мы зашли не находится в черном списке для поиска файлов
	if ((bUseBlacklist) && (BlacklistDir(wchDir)))
	{
#ifdef _DEBUG
		WriteLog(L"[FindRecursive] Skipping directory from searching, but continue to lookup or SQL ", wchDir);
#endif
		return 0;
	}

	PWCHAR LastSymbol = &wchDir[wcslen(wchDir)];
	wcscat(wchDir, L"*");

	HANDLE hSearch = FindFirstFileW(wchDir, &fd);
	if (hSearch == INVALID_HANDLE_VALUE)
	{
#ifdef _DEBUG
		WriteLog(L"Error FindFirstFile: ", wchDir);
#endif
		return 0;
	}
	
	*LastSymbol = L'\0';

	do
	{
		if (fd.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY)
		{
			if ((!wcscmp(fd.cFileName, L".")) || (!wcscmp(fd.cFileName, L"..")))
				continue;

			// проверим что нет оверфлоу
			UINT uNewLen = uCurrentPathLen + wcslen(fd.cFileName) + 1;
			if (uNewLen < uMaxSearchPathLen)
			{
				wcscat(fd.cFileName, L"\\");
				wcscat(wchDir, fd.cFileName);

				FindRecursive(wchDir, uMaxSearchPathLen, onFound, lpParameter, dwParameterSize, bUseBlacklist, uNewLen);
			
			}
			else
			{
#ifdef _DEBUG
				WriteLog(L"[FindRecursive] file path is too big", wchDir);
#endif
			}
			*LastSymbol = L'\0';

		}
		else 
		{
			if (!BlacklistFile(fd.cFileName))
			{
				UINT uNewLen = uCurrentPathLen + wcslen(fd.cFileName) + 1;
				if (uNewLen < uMaxSearchPathLen)
				{
					wcscat(wchDir, L"\\");
					wcscat(wchDir, fd.cFileName);
					(onFound)(wchDir, &fd, lpParameter, dwParameterSize);
				}
				*LastSymbol = L'\0';
			}
		}

	} while (FindNextFileW(hSearch, &fd));

	FindClose(hSearch);

	return 0;
}

DWORD WINAPI search_api::search(search_parameter *lpParameter)
{
	if (lpParameter == nullptr)
		return FALSE;

	PWCHAR pwFilePathStorage = nullptr;
	do
	{
		UINT uEntryLen = wcslen(lpParameter->pwEntrySearch);

		UINT uPathMax = uEntryLen + 10240; // начальная длина + еще 10к символов
		pwFilePathStorage = new WCHAR[uPathMax + 1];
		if (pwFilePathStorage == nullptr)
			break;

		wcscpy(pwFilePathStorage, lpParameter->pwEntrySearch);
		if (pwFilePathStorage[uEntryLen - 1] != L'\\')
			wcscat(pwFilePathStorage, L"\\");

#ifdef _DEBUG
		WriteLog(L"[search_api::search] searching ", pwFilePathStorage);
#endif

		// запустить наконец-то рекурсивный нагибатор
		FindRecursive(pwFilePathStorage, uPathMax - 1, lpParameter->onFound, lpParameter->lpParameter, lpParameter->dwParameterSize, lpParameter->bUseBlacklist, wcslen(pwFilePathStorage));

	} while (FALSE);
	
	if (pwFilePathStorage != nullptr)
		delete[]pwFilePathStorage;
	
	if (lpParameter->bExitThread)
	{
		Sleep(1000); 
		delete lpParameter;
		ExitThread(0);
	}

	return TRUE;
}
