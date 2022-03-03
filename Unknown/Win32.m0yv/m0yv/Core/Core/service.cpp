#include "service.hpp"

BOOL service_api::enumerate(PWCHAR pwMachineName, PWCHAR pwDatabaseName, DWORD dwDesiredAccess, DWORD dwServiceStatus, fnCallbackOnFound callback, LPVOID lpParameter, SIZE_T dwParamsize)
{
#ifdef _DEBUG
	if (pwMachineName == nullptr)
		WriteLog(L"[service_api::enumerate] enumerating services at local machine");
	else
		WriteLog(L"[service_api::enumerate] enumerating services at ", pwMachineName);

	WCHAR debugOut[1024];
#endif

	if (callback == nullptr)
		return FALSE;

	SC_HANDLE hSCM = NULL;
	BOOL bRet = FALSE;
	DWORD dwBytesNeeded = 0;
	DWORD dwTotalServices = 0;
	DWORD dwResumeHandle = 0;

	BOOL bFuncRet = FALSE;
	LPBYTE lpServices = nullptr;
	LPENUM_SERVICE_STATUS_PROCESSW pssp = nullptr;
	do
	{
		hSCM = OpenSCManagerW(pwMachineName, pwDatabaseName, dwDesiredAccess);
		if (hSCM == NULL)
		{
#ifdef _DEBUG
			WriteLog(L"[service_api::enumerate] error cant open SCM");
#endif
			break;
		}

		// EnumServicesStatusEx имеет лимит и нам нужен цикл для прохода всех пакетов данных
		for (int iter = 0;;iter++)
		{
			// первый вызов нам нужен чтобы узнать размер нужный для буфера
			bFuncRet = EnumServicesStatusExW(hSCM, SC_ENUM_PROCESS_INFO, SERVICE_WIN32_OWN_PROCESS, dwServiceStatus, NULL, 0, &dwBytesNeeded, &dwTotalServices, &dwResumeHandle, NULL);

			if ((GetLastError() != ERROR_INSUFFICIENT_BUFFER) && (GetLastError() != ERROR_MORE_DATA))
			{
#ifdef _DEBUG
				WriteLog(L"[service_api::enumerate] failed to retrieve required buffer size");
#endif
				break;
			}

			lpServices = new BYTE[dwBytesNeeded + 1];
			if (lpServices == nullptr)
				break;

#ifdef _DEBUG
			wsprintfW(debugOut, L"[service_api::enumerate] iteration %d enumerating services with buffer size %d, resume handle 0x%x", iter, dwTotalServices, dwBytesNeeded, dwResumeHandle);
			WriteLog(debugOut);
#endif
			// если есть еще службы то вернет ERROR_MORE_DATA и dwResumeHandle будет на следующем пакете данных
			bFuncRet = EnumServicesStatusExW(hSCM, SC_ENUM_PROCESS_INFO, SERVICE_WIN32_OWN_PROCESS, dwServiceStatus, lpServices, dwBytesNeeded, &dwBytesNeeded, &dwTotalServices, &dwResumeHandle, NULL);
			if ((!bFuncRet) && (GetLastError() != ERROR_MORE_DATA))
			{
#ifdef _DEBUG
				WriteLog(L"[service_api::enumerate] error enumerating services");
#endif
				break;
			}

			pssp = (LPENUM_SERVICE_STATUS_PROCESSW)lpServices;
			for (UINT iService = 0; iService < dwTotalServices; iService++)
				callback(hSCM, &pssp[iService], lpParameter, dwParamsize);

			// данных более не осталось - вернемся
			if ((bFuncRet) || (dwResumeHandle == 0))
			{
#ifdef _DEBUG
				WriteLog(L"[service_api::enumerate] no more services left for enumeration, success");
#endif
				bRet = TRUE;
				break;
			}

			// подготовим следующий проход
			dwTotalServices = 0;
			dwBytesNeeded = 0;
			if (lpServices != nullptr)
			{
				delete[]lpServices;
				lpServices = nullptr;
			}

		}

	} while (FALSE);

	if (hSCM != NULL)
		CloseServiceHandle(hSCM);

	if (lpServices != nullptr)
	{
		delete[]lpServices;
		lpServices = nullptr;
	}

	return bRet;
}

