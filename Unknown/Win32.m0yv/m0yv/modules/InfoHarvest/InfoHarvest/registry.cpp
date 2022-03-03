#include "registry.hpp"



/*
BOOL registry_api::read_registry_key(HKEY hKey_path, PWCHAR wchKey_path, PWCHAR wchValue_name, PWCHAR lp_output, PSIZE_T dwOut_maxsize, BOOL bWow64)
{
	BOOL bRet;
	HKEY hKey;
	DWORD dwError = 0;

	if (ERROR_SUCCESS != RegOpenKeyExW(hKey_path, wchKey_path, 0, KEY_READ, &hKey))
	{
#ifdef _DEBUG
		dwError = GetLastError();

		WriteLog(dwError);
		WriteLog(L"[registry_api::read_registry_key] RegOpenKeyExW failed with code above");

		SetLastError(dwError); // нужно чтобы восстановить последнюю ошибку после дебаг вывода
#endif
		return FALSE;
	}

	bRet = (ERROR_SUCCESS == RegQueryValueExW(hKey, wchValue_name, 0, 0, (LPBYTE)lp_output, dwOut_maxsize));
	dwError = GetLastError();

#ifdef _DEBUG
	if (!bRet)
	{
		WriteLog(dwError);
		WriteLog(L"[registry_api::read_registry_key] RegQueryValueExW failed with code above");
	}
#endif


	RegCloseKey(hKey);

	// восстановим последнюю ошибку, чтобы вызывающая функция смогла понять причину проеба
	SetLastError(dwError);

	return bRet;
}*/

BOOL registry_api::read_registry_key(HKEY hKey_path, PWCHAR wchKey_path, PWCHAR wchValue_name, blob *pblOutput, DWORD dwWow64Flag)
{
	if ((pblOutput == nullptr) || (pblOutput->lpBuffer != nullptr))
		return FALSE;
	
	BOOL bRet = FALSE;
	HKEY hKey = NULL;

	DWORD dwSize = 0;
	DWORD dwSizeAllocation = 0;
	do
	{
		if (RegOpenKeyExW(hKey_path, wchKey_path, NULL, KEY_READ | dwWow64Flag, &hKey) != ERROR_SUCCESS)
		{
#ifdef _DEBUG
			WriteLog(L"[registry_api::read_registry_key] cant open ", wchKey_path);
#endif
			break;
		}

		if (RegQueryValueExW(hKey, wchValue_name, nullptr, nullptr, nullptr, &dwSize) != ERROR_SUCCESS)
		{
#ifdef _DEBUG
			WriteLog(L"[registry_api::read_registry_key] cant query size of value  ", wchValue_name);
#endif
			break;
		}

		dwSizeAllocation = dwSize + 2;
		pblOutput->dwBufSize = dwSize;
		pblOutput->lpBuffer = (LPBYTE)new WCHAR[dwSizeAllocation];
		if (pblOutput->lpBuffer == nullptr)
			break;

		RtlSecureZeroMemory(pblOutput->lpBuffer, dwSizeAllocation);

		if (RegQueryValueExW(hKey, wchValue_name, nullptr, nullptr, pblOutput->lpBuffer, &dwSize) != ERROR_SUCCESS)
		{
#ifdef _DEBUG
			WriteLog(L"[registry_api::read_registry_key] cant read value content ", wchValue_name);
#endif
			break;
		}

		pblOutput->dwBufSize = dwSize;

		bRet = TRUE;

	} while (FALSE);

	if ((!bRet) && (pblOutput->lpBuffer != nullptr))
	{
		delete[]pblOutput->lpBuffer;
		pblOutput->dwBufSize = 0;
		pblOutput->lpBuffer = nullptr;
	}

	if (hKey != NULL)
		RegCloseKey(hKey);

	return bRet;
}
