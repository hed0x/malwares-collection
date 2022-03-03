#pragma once

#include "global.hpp"
#include "json_builder.hpp"
#include "utils.h"
#include <DSRole.h>
#include <lmcons.h>
#include <LM.h>


#define MAX_NETSERVERENUM_ITERATIONS 1024
#define LEVEL_SERVER 100

class IInformation
{
public:
	virtual ~IInformation() = default;
	virtual BOOL collect() = 0;
	virtual BOOL create_json(blob *pbJsonOutput) = 0;
};

class DefaultInformationGather : public IInformation
{
public:
	DefaultInformationGather();
	~DefaultInformationGather();
	// собирает информацию во внутренние структуры
	BOOL collect();
	// создает json для отправки
	BOOL create_json(blob *pbJsonOutput);
private:
	BOOL free_ctx();

	struct informationdata
	{
		blob bComputerName;
		blob bUserName;
		blob bOSName;
		PDSROLE_PRIMARY_DOMAIN_INFO_BASIC pdsinfo;
		LPBYTE pProcessInformation;
		// массив указателей на SERVER_INFO_100, нужен в случае огромного количества серверов в локальной сети если за один проход не удастся все получить
		struct _server_info
		{
			// каждый i-й элемент sinfo100 соответствует dwEntries 
			PSERVER_INFO_100 sinfo100[MAX_NETSERVERENUM_ITERATIONS];
			DWORD dwEntries[MAX_NETSERVERENUM_ITERATIONS];  // i-й dwEntries означает что sinfo100[i] содержит dwEntries[i] элементов
		} serversinfo;
	} *ctx;

	BOOL FillComputerName();
	BOOL FillUserName();
	BOOL FillOsName();
	BOOL FillDomainInfoBasic();
	BOOL FillServerList();
	BOOL FillSystemProcessInformation();

	PWCHAR domain_json(JsonBuilder *jbuilder);
	PWCHAR server_arrayjson();
	PWCHAR process_arraysjson();

	VOID getserver_amount(PDWORD dwTotalBuffers, PDWORD dwServersNameLength);
	VOID getprocess_amount(PDWORD dwProcessAmountLength);

	BOOL isProcessBlacklist(LPBYTE pStr);
};