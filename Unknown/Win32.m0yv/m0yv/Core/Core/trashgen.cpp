#include "trashgen.hpp"
#include "utils.hpp"


trashgen::FPUExecutableTrashGenerator::FPUExecutableTrashGenerator()
{
#ifdef _DEBUG
	WriteLog(L"[trashgen::FPUExecutableTrashGenerator] constructor");
#endif

	this->parameter = nullptr;
}

trashgen::FPUExecutableTrashGenerator::~FPUExecutableTrashGenerator()
{
#ifdef _DEBUG
	WriteLog(L"[trashgen::FPUExecutableTrashGenerator] destructor");
#endif

}

BOOL trashgen::FPUExecutableTrashGenerator::init(LPBYTE lpParameter, SIZE_T dwParameterSize)
{
	if ((lpParameter == nullptr) || (dwParameterSize != sizeof(trashgen::trashgenDefaultParameter)))
	{
#ifdef _DEBUG
		WriteLog(L"[trashgen::FPUExecutableTrashGenerator::init] error invalid parameters");
#endif
		return FALSE;
	}

	this->parameter = (trashgen::trashgenDefaultParameter*)lpParameter;

	return TRUE;
}

DWORD trashgen::FPUExecutableTrashGenerator::gen(LPBYTE lpOutputBuffer, SIZE_T dwMaxGenSize)
{
	if (dwMaxGenSize == 0)
		return 0;

	DWORD dwGenSize = (_rand((long*)&this->parameter->dwSeed) % dwMaxGenSize);

#ifdef _DEBUG
	WCHAR debugOut[1024];
	wsprintfW(debugOut, L"[trashgen::FPUExecutableTrashGenerator::gen] generating max %d bytes into buffer %d bytes FPU trash arch %d using 0x%X seed", dwGenSize, dwMaxGenSize, this->parameter->dwArch, this->parameter->dwSeed);
	WriteLog(debugOut);
#endif

	unsigned char instruction[15];
	DWORD dwTotalBytes = 0;
	DWORD dwInstLength = 0;

	for (;;)
	{
		dwInstLength = this->gen_fpu(instruction);

		// проверим, если не хватает места для записи инструкции, то выйдем
		if ((dwTotalBytes + dwInstLength) > dwGenSize)
			break;

		for (UINT i = 0; i < dwInstLength; i++)
		{
			lpOutputBuffer[dwTotalBytes++] = instruction[i];
		}

	}
	return dwTotalBytes;
}

DWORD trashgen::FPUExecutableTrashGenerator::gen_fpu(unsigned char * instruction)
{
	DWORD dwSize = 0;
	// префикс FPU 

	DWORD dwChoice = _rand((long*)&this->parameter->dwSeed) % 3;
	
	switch (dwChoice)
	{
	case 0:
		instruction[dwSize++] = 0xD8;
		instruction[dwSize++] = 0xC0 + (BYTE)(_rand((long*)&this->parameter->dwSeed) % 0x2F);
		break;
	case 1:
		instruction[dwSize++] = 0xDA;
		instruction[dwSize++] = 0xC0 + (BYTE)(_rand((long*)&this->parameter->dwSeed) % 28);
		break;
	case 2:
		instruction[dwSize++] = 0xDD;
		instruction[dwSize++] = 0xD0 + (BYTE)(_rand((long*)&this->parameter->dwSeed) % 8);
		break;
	}

	return dwSize;
}

trashgen::NonExecutableTrash::NonExecutableTrash()
{
#ifdef _DEBUG
	WriteLog(L"[trashgen::NonExecutableTrash] constructor");
#endif

	this->parameter = nullptr;
	this->lpInstructionOffsetArray = nullptr;
}

trashgen::NonExecutableTrash::~NonExecutableTrash()
{
#ifdef _DEBUG
	WriteLog(L"[trashgen::NonExecutableTrash] destructor");
#endif
	if (this->lpInstructionOffsetArray != nullptr)
		delete[]this->lpInstructionOffsetArray;

}

BOOL trashgen::NonExecutableTrash::init(LPBYTE lpParameter, SIZE_T dwParameterSize)
{
	if ((lpParameter == nullptr) || (dwParameterSize != sizeof(trashgen::trashgenNonexecutableParameter)))
	{
#ifdef _DEBUG
		WriteLog(L"[trashgen::NonExecutableTrash::init] error invalid parameter");
#endif
		return FALSE;
	}

	this->parameter = (trashgen::trashgenNonexecutableParameter*)lpParameter;

	// переинициализация
	if (this->lpInstructionOffsetArray != nullptr)
	{
		delete[]this->lpInstructionOffsetArray;
		this->lpInstructionOffsetArray = nullptr;
	}

	return TRUE;
}

DWORD trashgen::NonExecutableTrash::gen(LPBYTE lpOutputBuffer, SIZE_T dwMaxGenSize)
{
	if (dwMaxGenSize == 0)
		return 0;

	DWORD dwGenSize = (_rand((long*)&this->parameter->defaultParam.dwSeed) % dwMaxGenSize);
	
	this->lpInstructionOffsetArray = new DWORD[dwGenSize + 1]; // офсеты до начала каждой инструкции, dwGenSize + 1 должно быть достаточно при крайнем условии, что все инструкции однобайтные
	if (this->lpInstructionOffsetArray == nullptr)
		return 0;

#ifdef _DEBUG
	WCHAR debugOut[1024];
	wsprintfW(debugOut, L"[trashgen::NonExecutableTrash::gen] generating max %d bytes into buffer %d bytes trash arch %d using 0x%X seed", dwGenSize, dwMaxGenSize, this->parameter->defaultParam.dwArch, this->parameter->defaultParam.dwSeed);
	WriteLog(debugOut);
#endif

	unsigned char instruction[15];
	DWORD dwTotalBytes = 0;
	DWORD dwInstLength = 0;

	this->dwTotalInstructions = 0;

	for (;;)
	{
		dwInstLength = this->gen_instr(instruction, dwTotalBytes);
		if (dwInstLength == 0)
			continue;

		// проверим, если не хватает места для записи инструкции, то выйдем
		if ((dwTotalBytes + dwInstLength) > dwGenSize)
			break;

		this->lpInstructionOffsetArray[this->dwTotalInstructions++] = dwTotalBytes;

		for (UINT i = 0; i < dwInstLength; i++)
		{
			lpOutputBuffer[dwTotalBytes++] = instruction[i];
		}

	}
	return dwTotalBytes;

}

DWORD trashgen::NonExecutableTrash::gen_instr(unsigned char * instruction, DWORD dwCurrentBlockRVA)
{
	DWORD dwSize = 0;

	if (this->parameter->type == trashgen::nonexec_types_t::complete_trash)
	{
		dwSize = _rand((long*)&this->parameter->defaultParam.dwSeed) % 15;
		for (UINT i = 0; i < dwSize; i++)
		{
			instruction[i] = (BYTE)_rand((long*)&this->parameter->defaultParam.dwSeed) % 256;
		}

		return dwSize;
	}

	DWORD dwChoice = _rand((long*)&this->parameter->defaultParam.dwSeed) % 13;

	unsigned char registers[32];
	UINT iTotalRegisters = 6; // без ebp и esp

	registers[0] = 0x0;
	registers[1] = 0x1;
	registers[2] = 0x2;
	registers[3] = 0x3;
	registers[4] = 0x6;
	registers[5] = 0x7;

	DWORD dwRegister = registers[_rand((long*)&this->parameter->defaultParam.dwSeed) % iTotalRegisters];
	switch (dwChoice)
	{
	case 0: // add r32/r64, dword
		if (this->parameter->defaultParam.dwArch == IMAGE_FILE_MACHINE_AMD64)
			instruction[dwSize++] = 0x48;
		instruction[dwSize++] = 0x81;
		instruction[dwSize++] = 0xC0 + dwRegister;
		*((PDWORD)&instruction[dwSize]) = (DWORD)_rand((long*)&this->parameter->defaultParam.dwSeed);
		dwSize += 4;
		break;
	case 1: // add r32, byte
		if (this->parameter->defaultParam.dwArch == IMAGE_FILE_MACHINE_AMD64)
			instruction[dwSize++] = 0x48;

		instruction[dwSize++] = 0x83;
		instruction[dwSize++] = 0xC0 + dwRegister;
		instruction[dwSize++] = (BYTE)_rand((long*)&this->parameter->defaultParam.dwSeed) % 256;
		break;
	case 2: // sub r32, byte
		if (this->parameter->defaultParam.dwArch == IMAGE_FILE_MACHINE_AMD64)
			instruction[dwSize++] = 0x48;
		instruction[dwSize++] = 0x83;
		instruction[dwSize++] = 0xE8 + dwRegister;
		instruction[dwSize++] = (BYTE)_rand((long*)&this->parameter->defaultParam.dwSeed) % 256;
		break;
	case 3:
		if (this->parameter->defaultParam.dwArch == IMAGE_FILE_MACHINE_AMD64)
			instruction[dwSize++] = 0x48;
		instruction[dwSize++] = 0x81;
		instruction[dwSize++] = 0xE8 + dwRegister;
		*((PDWORD)&instruction[dwSize]) = (DWORD)_rand((long*)&this->parameter->defaultParam.dwSeed);
		dwSize += 4;
		break;
	case 4:
		if (dwRegister)
		{
			instruction[dwSize++] = 0x80;
			instruction[dwSize++] = 0xC0 + dwRegister;
		}
		else
			instruction[dwSize++] = 0x04;

		instruction[dwSize++] = (BYTE)_rand((long*)&this->parameter->defaultParam.dwSeed) % 256;
		break;
	case 6:
		if (this->parameter->defaultParam.dwArch == IMAGE_FILE_MACHINE_AMD64)
			instruction[dwSize++] = 0x48;

		instruction[dwSize++] = 0x8B;
		instruction[dwSize++] = 0xC0 + _rand((long*)&this->parameter->defaultParam.dwSeed) % 36;

		break;

	case 7:

		instruction[dwSize++] = 0x66;
		instruction[dwSize++] = 0x8B;
		instruction[dwSize++] = 0xC0 + _rand((long*)&this->parameter->defaultParam.dwSeed) % 0x3F;

		break;
	case 8:

		if (this->parameter->defaultParam.dwArch == IMAGE_FILE_MACHINE_AMD64)
			instruction[dwSize++] = 0x48;

		instruction[dwSize++] = 0x8D;
		instruction[dwSize++] = 0x05 + (dwRegister * 0x8);

		*((PDWORD)&instruction[dwSize]) = (DWORD)0x00400000 + (DWORD)_rand((long*)&this->parameter->defaultParam.dwSeed) % 10000;
		dwSize += 4;

		break;
	case 9:

		if (_rand((long*)&this->parameter->defaultParam.dwSeed) % 2)
		{
			instruction[dwSize++] = 0x6A;
			instruction[dwSize++] = (BYTE)_rand((long*)&this->parameter->defaultParam.dwSeed) % 256;
		}
		else
		{
			instruction[dwSize++] = 0x68;
			*((PDWORD)&instruction[dwSize]) = (DWORD)_rand((long*)&this->parameter->defaultParam.dwSeed);
			dwSize += 4;
		}

		break;

	case 10:
	case 11:
	case 12:
	case 5: // сгенерируем случайный test / jnz переход на уже сгенерированную инструкцию
		if (this->dwTotalInstructions > 1)
		{
			if (this->parameter->defaultParam.dwArch == IMAGE_FILE_MACHINE_AMD64)
				instruction[dwSize++] = 0x48;
			instruction[dwSize++] = 0x85;
			instruction[dwSize++] = 0xC0 + (_rand((long*)&this->parameter->defaultParam.dwSeed) % 0x3F);

			DWORD dwTargetOffset = this->lpInstructionOffsetArray[_rand((long*)&this->parameter->defaultParam.dwSeed) % this->dwTotalInstructions];
			signed int siRel32 = dwTargetOffset - (dwCurrentBlockRVA + dwSize);
			if ((siRel32 < 125) && (siRel32 > -125))
			{
				siRel32 -= 2;
				instruction[dwSize++] = 0x75;
				instruction[dwSize++] = (BYTE)siRel32;
			}
			else
			{
				siRel32 -= 6;
				instruction[dwSize++] = 0x0F;
				instruction[dwSize++] = 0x85;
				*((PDWORD)&instruction[dwSize]) = (DWORD)siRel32;
				dwSize += 4;
			}

		}
		break;

	}

	return dwSize;
}

trashgen::FunctionsLayerTrash::FunctionsLayerTrash()
{
#ifdef _DEBUG
	WriteLog(L"[trashgen::FunctionsLayerTrash] constructor");
#endif

	this->parameter = nullptr;
	this->lpBlockBuffer = nullptr;
	this->lpSubroutineRVA = nullptr;
	this->lpcallRVA = nullptr;
}

trashgen::FunctionsLayerTrash::~FunctionsLayerTrash()
{
#ifdef _DEBUG
	WriteLog(L"[trashgen::FunctionsLayerTrash] destructor");
#endif
	if (this->lpBlockBuffer != nullptr)
		delete[]this->lpBlockBuffer;

	if (this->lpcallRVA != nullptr)
	{
		delete[]this->lpcallRVA;
		this->lpcallRVA = nullptr;
	}

	if (this->lpSubroutineRVA != nullptr)
	{
		delete[]this->lpSubroutineRVA;
		this->lpSubroutineRVA = nullptr;
	}

}

BOOL trashgen::FunctionsLayerTrash::init(LPBYTE lpParameter, SIZE_T dwParameterSize)
{
	if ((lpParameter == nullptr) || (dwParameterSize != sizeof(trashgen::FunctionsLayerTrashParameter)))
	{
#ifdef _DEBUG
		WriteLog(L"[trashgen::FunctionsLayerTrash::init] error invalid parameter");
#endif
		return FALSE;
	}

	this->parameter = (trashgen::FunctionsLayerTrashParameter*)lpParameter;
	if (this->parameter->entry == nullptr)
		return FALSE;

	this->lpBlockBuffer = new BYTE[FUNCTIONSLAYER_TRASH_BLOCKMAXSIZE + 1];
	if (this->lpBlockBuffer == nullptr)
		return FALSE;

	// WARNING: если в последствии класс сможет быть переиспользвоан, как другие генераторы, то тут надо вставить освобождение lpSubroutineRVA и lpcallRVA если уже есть

	return TRUE;
}

DWORD trashgen::FunctionsLayerTrash::gen(LPBYTE lpOutputBuffer, SIZE_T dwMaxGenSize)
{
	//DWORD dwGenSize = (_rand((long*)&this->parameter->defaultParam.dwSeed) % dwMaxGenSize);
	DWORD dwGenSize = 1024;

	this->lpcallRVA = new DWORD[dwGenSize];
	this->lpSubroutineRVA = new DWORD[dwGenSize];
	this->dwElementsAmount = dwGenSize;
	this->dwCallCounter = 0;
	this->dwSubroutineCounter = 0;

#ifdef _DEBUG
	WCHAR debugOut[1024];
	wsprintfW(debugOut, L"[trashgen::FunctionsLayerTrash::gen] generating max %d bytes into buffer %d bytes trash arch %d using 0x%X seed", dwGenSize, dwMaxGenSize, this->parameter->defaultParam.dwArch, this->parameter->defaultParam.dwSeed);
	WriteLog(debugOut);
#endif

	
	DWORD dwTotalBytes = 0;
	DWORD dwBlockLength = 0;

	DWORD dwLastCallTable = 0;
	for (;;)
	{
		dwBlockLength = this->gen_block(dwTotalBytes);
		if (dwBlockLength == 0)
			continue;

		// проверим, если не хватает места для записи инструкции, то выйдем
		if ((dwTotalBytes + dwBlockLength) > dwGenSize)
		{
			this->dwCallCounter = dwLastCallTable;
			break;
		}
		if (this->dwSubroutineCounter < this->dwElementsAmount)
			this->lpSubroutineRVA[this->dwSubroutineCounter++] = dwTotalBytes;

		dwLastCallTable = this->dwCallCounter;

		for (UINT i = 0; i < dwBlockLength; i++)
		{
			lpOutputBuffer[dwTotalBytes++] = this->lpBlockBuffer[i];
		}

	}

	// исправим все заглушки вызовы, вставив rel32 на случайную сгенерированную функцию
	this->fix_calls(lpOutputBuffer);

	return dwTotalBytes;

}

DWORD trashgen::FunctionsLayerTrash::gen_block(DWORD dwCurrentBlockRVA)
{
	DWORD dwSize = 0;
	DWORD dwMinSize = 10; // пролог и эпилог на x86
	if (this->parameter->defaultParam.dwArch == IMAGE_FILE_MACHINE_AMD64)
		dwMinSize = 14; // пролог и эпилог на x64 

	DWORD dwBlockSize = (_rand((long*)&this->parameter->defaultParam.dwSeed) % (FUNCTIONSLAYER_TRASH_BLOCKMAXSIZE - dwMinSize - 1)) + dwMinSize;
	// аллоцируемый размер под стэковые переменные
	BYTE dwStackVariables = _rand((long*)&this->parameter->defaultParam.dwSeed) % 64;
	DWORD dwGeneratorIndex = 0;
	trashgen::trashLinkedList *ptlEntry = nullptr;

	// сгенерируем пролог функции
	// push ebp / push rbp
	this->lpBlockBuffer[dwSize++] = 0x55;

	if (this->parameter->defaultParam.dwArch == IMAGE_FILE_MACHINE_AMD64)
		this->lpBlockBuffer[dwSize++] = 0x48;

	this->lpBlockBuffer[dwSize++] = 0x8B;
	this->lpBlockBuffer[dwSize++] = 0xEC;

	// sub rsp, N / sub esp, N
	if (this->parameter->defaultParam.dwArch == IMAGE_FILE_MACHINE_AMD64)
		this->lpBlockBuffer[dwSize++] = 0x48;

	this->lpBlockBuffer[dwSize++] = 0x83;
	this->lpBlockBuffer[dwSize++] = 0xEC;
	this->lpBlockBuffer[dwSize++] = dwStackVariables;

	// заполним кодом

	DWORD dwCodeSize = 0;
	DWORD dwSizeLeft = dwBlockSize - dwMinSize;
	DWORD dwOldSize = 0;
	while (dwSizeLeft > 15) // 15 это убогий костыль, поскольку есть вероятность, что нам никогда не удастся сгенерировать что-то вмещяющееся в меньшее значение и будет вечный цикл
	{
		// запомним старое значение чтобы знать сколько мы сгенерировали
		dwOldSize = dwSize;
		// максимальный размер заполняемого кода рандомный в пределах [1;dwSizeLeft)
		dwCodeSize = _rand((long*)&this->parameter->defaultParam.dwSeed) % (dwSizeLeft - 1) + 1;

		switch (_rand((long*)&this->parameter->defaultParam.dwSeed) % 2 )
		{

		case 0:
			// выберем случайный генератор
			dwGeneratorIndex = _rand((long*)&this->parameter->defaultParam.dwSeed) % (trashgen::entry_amount(this->parameter->entry));
			ptlEntry = trashgen::get_entry(this->parameter->entry, dwGeneratorIndex);
			if ((ptlEntry != nullptr) && (ptlEntry->trashgen->init(ptlEntry->lpParameter, ptlEntry->dwParamSize)))
			{
				// сгенерируем блок с максимальной длиной текущего блока за вычетом пролога и эпилога
				dwSize += ptlEntry->trashgen->gen(&this->lpBlockBuffer[dwSize], dwCodeSize);
			}
			break;
		case 1: // вставим в данное место call и запомним его адрес для последующего фиксапа
			if ((dwCodeSize >= 5) && (dwCallCounter < this->dwElementsAmount))
			{
				// запомним адрес текущего call и запишем нулевой вызов для последущего фикса
			
				this->lpcallRVA[dwCallCounter++] = dwCurrentBlockRVA + dwSize;
				this->lpBlockBuffer[dwSize++] = 0xE8;
				*((PDWORD)&lpBlockBuffer[dwSize]) = 0x00000000;
				dwSize += 4;
			}

			break;
		}

		// сколько нам осталось сгенерить исходя из того сколько мы сгенерировали в данную итерацию
		dwSizeLeft -= (dwSize - dwOldSize);
	}

	// эпилог
	if (this->parameter->defaultParam.dwArch == IMAGE_FILE_MACHINE_AMD64)
	{
		this->lpBlockBuffer[dwSize++] = 0x48;
		this->lpBlockBuffer[dwSize++] = 0x8D;
		this->lpBlockBuffer[dwSize++] = 0x65;
		this->lpBlockBuffer[dwSize++] = dwStackVariables;
	}
	else
	{
		this->lpBlockBuffer[dwSize++] = 0x8B;
		this->lpBlockBuffer[dwSize++] = 0xE5;
	}

	// pop rbp, ret
	this->lpBlockBuffer[dwSize++] = 0x5D;
	this->lpBlockBuffer[dwSize++] = 0xC3;

	return dwSize;
}

VOID trashgen::FunctionsLayerTrash::fix_calls(LPBYTE lpBuffer)
{
	if ((this->dwSubroutineCounter == 0) || (this->dwCallCounter == 0) || (this->lpcallRVA == nullptr) || (this->lpSubroutineRVA == nullptr))
		return;
	
	for (UINT i = 0; i < this->dwCallCounter; i++)
	{
		UINT iSubroutineIndex = _rand((long*)&this->parameter->defaultParam.dwSeed) % this->dwSubroutineCounter;
		PDWORD lpdwRel32 = (PDWORD)&lpBuffer[this->lpcallRVA[i] + 1];
		
		*lpdwRel32 = this->lpSubroutineRVA[iSubroutineIndex] - (this->lpcallRVA[i] + 5);
	}

	return;
}

VOID trashgen::free_linkedlist(trashLinkedList *entry, BOOL bDeleteGenerators, BOOL bDeleteParameters)
{
	if (entry == nullptr)
		return;

#ifdef _DEBUG
	WriteLog(L"[trashgen::free_linkedlist] freeing linked list");
#endif

	trashLinkedList *list = entry;
	trashLinkedList *tmp = nullptr;

	do
	{
		tmp = list;
		list = list->next;
		if ((bDeleteGenerators) && (tmp->trashgen != nullptr))
		{
#ifdef _DEBUG
			WriteLog(L"[trashgen::free_linkedlist] deleting trashgen object...");
#endif
			delete tmp->trashgen;
		}

		if ((bDeleteParameters) && (tmp->lpParameter != nullptr))
		{
#ifdef _DEBUG
			WriteLog(L"[trashgen::free_linkedlist] deleting parameters...");
#endif
			delete[]tmp->lpParameter;
		}

		delete tmp;

	} while (list != nullptr);

	return;
}

BOOL trashgen::add_entry(trashLinkedList **pptlentry, ITrashgen *trashgen, LPBYTE lpParameter, SIZE_T dwParamSize)
{
	if ((pptlentry == nullptr) || (trashgen == nullptr) || (lpParameter == nullptr) || (dwParamSize == 0))
		return FALSE;

	trashLinkedList *newentry = new trashLinkedList;
	if (newentry == nullptr)
		return FALSE;

#ifdef _DEBUG
	WriteLog(L"[trashgen::add_entry] adding linked list entry");
#endif

	newentry->dwParamSize = dwParamSize;
	newentry->lpParameter = lpParameter;
	newentry->trashgen = trashgen;
	newentry->next = nullptr;

	*pptlentry = newentry;

	return TRUE;
}

DWORD trashgen::entry_amount(trashLinkedList *entry)
{
	DWORD dwAmount = 0;
	trashLinkedList *tmp = entry;
	while (tmp != nullptr)
	{
		dwAmount++;
		tmp = tmp->next;
	}
	return dwAmount;
}

trashgen::trashLinkedList *trashgen::get_entry(trashLinkedList *entry, DWORD dwIndex)
{
	trashLinkedList *ptlRet = nullptr;
	trashLinkedList *tmp = entry;
	DWORD dwCounter = 0;
	while (tmp != nullptr)
	{
		if (dwIndex == dwCounter)
		{
			ptlRet = tmp;
			break;
		}

		tmp = tmp->next;
		dwCounter++;
	}

	return ptlRet;
}

trashgen::trashLinkedList *trashgen::funclist_alloc(BOOL bDefaultAlloc, BOOL bFpuAlloc, DWORD dwSeed, DWORD dwArch)
{
#ifdef _DEBUG
	WriteLog(L"[trashgen::funclist_alloc] adding entries to list");
#endif

	ITrashgen *tmpGenerator = nullptr;
	blob tmpParameter;
	RtlSecureZeroMemory(&tmpParameter, sizeof(tmpParameter));
	trashLinkedList *entry = nullptr;
	trashLinkedList **lastentry = &entry;

	trashgenNonexecutableParameter *nonExecParam = nullptr;
	trashgenDefaultParameter *defaultParam = nullptr;
	
	if (bDefaultAlloc)
	{
		tmpGenerator = (ITrashgen*)new NonExecutableTrash;
		if (tmpGenerator != nullptr)
		{
			tmpParameter.dwBufSize = sizeof(trashgenNonexecutableParameter);
			tmpParameter.lpBuffer = new BYTE[tmpParameter.dwBufSize + 1];
			nonExecParam = (trashgenNonexecutableParameter*)tmpParameter.lpBuffer;
			if (nonExecParam != nullptr)
			{
				nonExecParam->defaultParam.dwArch = dwArch;
				nonExecParam->defaultParam.dwSeed = dwSeed;
				nonExecParam->type = nonexec_types_t::default_instructions;
				if (add_entry(lastentry, tmpGenerator, tmpParameter.lpBuffer, tmpParameter.dwBufSize))
					lastentry = &entry->next;
			}
		}
	}

	if (bFpuAlloc)
	{
		tmpGenerator = (ITrashgen*)new FPUExecutableTrashGenerator;
		if (tmpGenerator != nullptr)
		{
			tmpParameter.dwBufSize = sizeof(trashgenDefaultParameter);
			tmpParameter.lpBuffer = new BYTE[tmpParameter.dwBufSize + 1];
			defaultParam = (trashgenDefaultParameter*)tmpParameter.lpBuffer;
			if (defaultParam != nullptr)
			{
				defaultParam->dwArch = dwArch;
				defaultParam->dwSeed = dwSeed;
				if (add_entry(lastentry, tmpGenerator, tmpParameter.lpBuffer, tmpParameter.dwBufSize))
					lastentry = &entry->next;
			}
		}
	}

#ifdef _DEBUG
	WCHAR debugOut[1024];
	if (entry != nullptr)
		wsprintfW(debugOut, L"[trashgen::funclist_alloc] added %d entries", entry_amount(entry));
	else
		wsprintfW(debugOut, L"[trashgen::funclist_alloc] error added 0 entries");
	WriteLog(debugOut);
#endif


	return entry;
}
