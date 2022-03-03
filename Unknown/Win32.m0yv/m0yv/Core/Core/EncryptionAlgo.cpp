#include "EncryptionAlgo.hpp"
#include "utils.hpp"

BasicPolymorphicEncryptionAlgorithm::BasicPolymorphicEncryptionAlgorithm()
{
#ifdef _DEBUG
	WriteLog(L"[BasicPolymorphicEncryptionAlgorithm] constructor");
#endif
	this->IL = nullptr;
	this->dwILSize = 0;
	this->holdrand = 0;
}

BasicPolymorphicEncryptionAlgorithm::~BasicPolymorphicEncryptionAlgorithm()
{
#ifdef _DEBUG
	WriteLog(L"[BasicPolymorphicEncryptionAlgorithm] destructor");
#endif
	if (this->IL != nullptr)
		delete[]this->IL;
}

// генерирует IL с операциями для блока размером dwBlockSize
BOOL BasicPolymorphicEncryptionAlgorithm::init(UINT dwBlockSize, DWORD dwPolyEncSeed)
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
#endif

#ifdef _SLOW_POLYMORPHISM
	this->holdrand = dwPolyEncSeed;
#else
	this->holdrand = GetTickCount();
#endif


	if (this->IL != nullptr)
		return FALSE;
	if ((dwBlockSize % sizeof(DWORD)) != 0)
	{
#ifdef _DEBUG
		WriteLog(L"[BasicPolymorphicEncryptionAlgorithm] block size must be aligned to size of dword");
#endif
		return FALSE;
	}

	this->_dwBlockSize = dwBlockSize;
	// количество необходимых инструкций для шифрования блока - размер блока / размер шифруемых данных за 1 операцию
	SIZE_T dwInstructionsAmount = dwBlockSize / sizeof(DWORD);
	// размер IL кода == количество инструкций * размер инструкции
	this->dwILSize = sizeof(basic_instructions) * dwInstructionsAmount;
	this->IL = (basic_instructions*)new BYTE[dwILSize + 1];
	if (this->IL == nullptr)
		return FALSE;

	RtlSecureZeroMemory(this->IL, this->dwILSize);

	for (SIZE_T i = 0; i < dwInstructionsAmount; i++)
	{

		// операция над двордом
		this->IL[i].opcode = (BYTECODE_OPCODE_TYPE)(_rand(&this->holdrand) % (int)BYTECODE_OPCODE_TYPE::AMOUNT_MAX);
		// ключ
		PWORD pwOp = (PWORD)&this->IL[i].dwOperand;
		pwOp[0] = _rand(&this->holdrand);
		pwOp[1] = _rand(&this->holdrand);
		//this->IL[i].dwOperand = _rand(&this->holdrand) + _rand(&this->holdrand);
	}

#ifdef _DEBUG
	wsprintfW(debugOut, L"[BasicPolymorphicEncryptionAlgorithm] generated %d instructions for %d bytes block total IL size %d",
		dwInstructionsAmount, this->_dwBlockSize, this->dwILSize);
	WriteLog(debugOut);
#endif

	return TRUE;
}

// интерпретация IL для поблочного шифрования переданного буфера
BOOL BasicPolymorphicEncryptionAlgorithm::encrypt_buffer(LPBYTE lpBuffer, SIZE_T dwBufferSize)
{
	if (this->IL == nullptr)
		return FALSE;
	if ((dwBufferSize % this->_dwBlockSize) != 0)
	{
#ifdef _DEBUG
		WriteLog(L"[BasicPolymorphicEncryptionAlgorithm::encrypt_buffer] error buffer size must be aligned to block size boundary");
#endif
		return FALSE;
	}


	SIZE_T dwInstructionsAmount = this->_dwBlockSize / sizeof(DWORD);
	PDWORD pdwBuffer = (PDWORD)lpBuffer;
	// количество двордов в буфере
	SIZE_T dwEncryptionElements = dwBufferSize / sizeof(DWORD);

#ifdef _DEBUG
	WCHAR debugOut[1024];
	wsprintfW(debugOut, L"[BasicPolymorphicEncryptionAlgorithm::encrypt_buffer] encrypting buffer %d bytes with %d dwords counts using %d instructions",
		dwBufferSize, dwEncryptionElements, dwInstructionsAmount);
	WriteLog(debugOut);
#endif


	for (SIZE_T dwCounter = 0; dwCounter < dwEncryptionElements;)
	{
		this->encrypt_block(pdwBuffer, dwCounter, dwInstructionsAmount);
		dwCounter += dwInstructionsAmount;
	}

	return TRUE;
}

#ifdef _DEBUG
// интерпретация IL для поблочной расшифровки буфера
BOOL BasicPolymorphicEncryptionAlgorithm::decrypt_buffer(LPBYTE lpBuffer, SIZE_T dwBufferSize)
{
	if (this->IL == nullptr)
		return FALSE;
	if ((dwBufferSize % this->_dwBlockSize) != 0)
	{
#ifdef _DEBUG
		WriteLog(L"[BasicPolymorphicEncryptionAlgorithm::decrypt_buffer] error buffer size must be aligned to block size boundary");
#endif
		return FALSE;
	}

	SIZE_T dwInstructionsAmount = this->_dwBlockSize / sizeof(DWORD);
	PDWORD pdwBuffer = (PDWORD)lpBuffer;
	// количество двордов в блоке
	SIZE_T dwEncryptionElements = dwBufferSize / sizeof(DWORD);
	for (SIZE_T dwCounter = 0; dwCounter < dwEncryptionElements;)
	{
		this->decrypt_block(pdwBuffer, dwCounter, dwInstructionsAmount);
		dwCounter += dwInstructionsAmount;
	}

	return TRUE;
}


void BasicPolymorphicEncryptionAlgorithm::decrypt_block(PDWORD pdwBuffer, DWORD dwCounter, DWORD dwInstructionsAmount)
{
	for (SIZE_T i = 0; i < dwInstructionsAmount; i++, dwCounter++)
	{
		switch (this->IL[i].opcode)
		{
			// в операции декрипта для add и substract делаем противоположные операции
		case BYTECODE_OPCODE_TYPE::ADD:
			pdwBuffer[dwCounter] = pdwBuffer[dwCounter] - this->IL[i].dwOperand;
			break;
		case BYTECODE_OPCODE_TYPE::SUBSTRACT:
			pdwBuffer[dwCounter] = pdwBuffer[dwCounter] + this->IL[i].dwOperand;
			break;
		case BYTECODE_OPCODE_TYPE::INVERSE:
			pdwBuffer[dwCounter] = ~pdwBuffer[dwCounter];
			break;
		case BYTECODE_OPCODE_TYPE::XOR:
			pdwBuffer[dwCounter] = pdwBuffer[dwCounter] ^ this->IL[i].dwOperand;
			break;
		}
	}
	return;
}
#endif

void BasicPolymorphicEncryptionAlgorithm::encrypt_block(PDWORD pdwBuffer, DWORD dwCounter, DWORD dwInstructionsAmount)
{
	for (SIZE_T i = 0; i < dwInstructionsAmount; i++, dwCounter++)
	{
		switch (this->IL[i].opcode)
		{
		case BYTECODE_OPCODE_TYPE::ADD:
			pdwBuffer[dwCounter] = pdwBuffer[dwCounter] + this->IL[i].dwOperand;
			break;
		case BYTECODE_OPCODE_TYPE::SUBSTRACT:
			pdwBuffer[dwCounter] = pdwBuffer[dwCounter] - this->IL[i].dwOperand;
			break;
		case BYTECODE_OPCODE_TYPE::INVERSE:
			pdwBuffer[dwCounter] = ~pdwBuffer[dwCounter];
			break;
		case BYTECODE_OPCODE_TYPE::XOR:
			pdwBuffer[dwCounter] = pdwBuffer[dwCounter] ^ this->IL[i].dwOperand;
			break;
		default:
#ifdef _DEBUG
			WriteLog(L"[BasicPolymorphicEncryptionAlgorithm::encrypt_block] error invalid opcode");
#endif
			break;
		}
	}
	return;
}


// компиляция IL в x86/x64 натив
BOOL BasicPolymorphicEncryptionAlgorithm::generate_block_decryptor(UINT uRegisterNumber, LPBYTE * lpOutBuffer, SIZE_T * dwOutBufferSize, DWORD dwArch)
{
	SIZE_T dwInstructionsAmount = this->_dwBlockSize / sizeof(DWORD);
	// максимальный размер - количество инструкций * максимальную длину инструкции интела
	SIZE_T dwMaximumSize = (dwInstructionsAmount + 1) * INTEL_MAXLEN;

	LPBYTE lpResult = new BYTE[dwMaximumSize + 1];
	// массив индексов, говорит в каком порядке нам компилировать инструкции
	LPINT lpiOrderIndex = new INT[dwInstructionsAmount + 1];
	// дельта текущей инструкции от начала буфера
	SIZE_T dwDelta = 0;

	BOOL bRet = FALSE;
	do
	{
		if (lpResult == nullptr)
			break;

		if (lpiOrderIndex == nullptr)
			break;

		this->reorder_instructions(lpiOrderIndex, dwInstructionsAmount);

		for (SIZE_T i = 0; i < dwInstructionsAmount; i++)
		{
			// доступы через lpiOrderIndex, массив перемешанных индексов, чтобы чтение операций происходило в случайном порядке
			switch (this->IL[lpiOrderIndex[i]].opcode)
			{
				// расшифровка, обратные операции: если add то выполняем sub, если sub то add
			case BYTECODE_OPCODE_TYPE::ADD:
				this->create_sub(uRegisterNumber, this->IL[lpiOrderIndex[i]].dwOperand, lpiOrderIndex[i] * sizeof(DWORD), lpResult, &dwDelta, dwArch);
				break;
			case BYTECODE_OPCODE_TYPE::SUBSTRACT:
				this->create_add(uRegisterNumber, this->IL[lpiOrderIndex[i]].dwOperand, lpiOrderIndex[i] * sizeof(DWORD), lpResult, &dwDelta, dwArch);
				break;
			case BYTECODE_OPCODE_TYPE::INVERSE:
				this->create_not(uRegisterNumber, lpiOrderIndex[i] * sizeof(DWORD), lpResult, &dwDelta, dwArch);
				break;
			case BYTECODE_OPCODE_TYPE::XOR:
				this->create_xor(uRegisterNumber, this->IL[lpiOrderIndex[i]].dwOperand, lpiOrderIndex[i] * sizeof(DWORD), lpResult, &dwDelta, dwArch);
				break;
			default:
#ifdef _DEBUG
				WriteLog(L"[BasicPolymorphicEncryptionAlgorithm::generate_block_decryptor] error invalid opcode");
#endif
				break;
			}
		}

		bRet = TRUE;
	} while (FALSE);

	*lpOutBuffer = lpResult;
	*dwOutBufferSize = dwDelta;

	if (lpiOrderIndex != nullptr)
		delete[]lpiOrderIndex;

	return TRUE;
}

DWORD BasicPolymorphicEncryptionAlgorithm::get_blocksize()
{
	return this->_dwBlockSize;
}


void BasicPolymorphicEncryptionAlgorithm::create_sub(ULONG uRegisterNumber, DWORD dwOperand, UINT iIndex, LPBYTE lpPlaceholder, PSIZE_T pdwDelta, DWORD dwArch)
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
	wsprintfW(debugOut, L"[BasicPolymorphicEncryptionAlgorithm::create_sub] creating sub dword [reg_%d + %d], 0%Xh", uRegisterNumber, iIndex, dwOperand);
	WriteLog(debugOut);
#endif

	SIZE_T szRVA = *pdwDelta;

	lpPlaceholder[szRVA++] = 0x81; 
	if (iIndex == 0) // задает [r32], если iIndex == 0, то смещения нет
	{
		lpPlaceholder[szRVA++] = 0x28 + uRegisterNumber;
	}
	else if (iIndex < 128) // [r32 + rel] rel в пределах ворда, т.к значение signed то если iIndex < 128, то можем закодировать данную инструкцию вот так
	{
		lpPlaceholder[szRVA++] = 0x68 + uRegisterNumber;
		lpPlaceholder[szRVA++] = (BYTE)iIndex;
	}
	else // иначе для больших офсетов
	{
		lpPlaceholder[szRVA++] = 0xA8 + uRegisterNumber;
		*((PDWORD)&lpPlaceholder[szRVA]) = (DWORD)iIndex;
		szRVA += sizeof(DWORD);
	}

	// добавим операнд
	*((PDWORD)&lpPlaceholder[szRVA]) = dwOperand;
	szRVA += sizeof(DWORD);

	*pdwDelta = szRVA;
	return;
}

void BasicPolymorphicEncryptionAlgorithm::create_add(ULONG uRegisterNumber, DWORD dwOperand, UINT iIndex, LPBYTE lpPlaceholder, PSIZE_T pdwDelta, DWORD dwArch)
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
	wsprintfW(debugOut, L"[BasicPolymorphicEncryptionAlgorithm::create_add] creating add dword [reg_%d + %d], 0%Xh", uRegisterNumber, iIndex, dwOperand);
	WriteLog(debugOut);
#endif

	SIZE_T szRVA = *pdwDelta;

	lpPlaceholder[szRVA++] = 0x81; 
	if (iIndex == 0) // задает [r32], если iIndex == 0, то смещения нет
	{
		lpPlaceholder[szRVA++] = 0x00 + uRegisterNumber;
	}
	else if (iIndex < 128) // [r32 + rel] rel в пределах ворда, т.к значение signed то если iIndex < 128, то можем закодировать данную инструкцию вот так
	{
		lpPlaceholder[szRVA++] = 0x40 + uRegisterNumber;
		lpPlaceholder[szRVA++] = (BYTE)iIndex;
	}
	else // иначе для больших офсетов
	{
		lpPlaceholder[szRVA++] = 0x80 + uRegisterNumber;
		*((PDWORD)&lpPlaceholder[szRVA]) = (DWORD)iIndex;
		szRVA += sizeof(DWORD);
	}

	// добавим операнд
	*((PDWORD)&lpPlaceholder[szRVA]) = dwOperand;
	szRVA += sizeof(DWORD);

	*pdwDelta = szRVA;
	return;

}

void BasicPolymorphicEncryptionAlgorithm::create_xor(ULONG uRegisterNumber, DWORD dwOperand, UINT iIndex, LPBYTE lpPlaceholder, PSIZE_T pdwDelta, DWORD dwArch)
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
	wsprintfW(debugOut, L"[BasicPolymorphicEncryptionAlgorithm::create_xor] creating xor dword [reg_%d + %d], 0%Xh", uRegisterNumber, iIndex, dwOperand);
	WriteLog(debugOut);
#endif


	SIZE_T szRVA = *pdwDelta;

	lpPlaceholder[szRVA++] = 0x81;
	if (iIndex == 0) // задает [r32], если iIndex == 0, то смещения нет
	{
		lpPlaceholder[szRVA++] = 0x30 + uRegisterNumber;
	}
	else if (iIndex < 128) // [r32 + rel] rel в пределах ворда, т.к значение signed то если iIndex < 128, то можем закодировать данную инструкцию вот так
	{
		lpPlaceholder[szRVA++] = 0x70 + uRegisterNumber;
		lpPlaceholder[szRVA++] = (BYTE)iIndex;
	}
	else // иначе для больших офсетов
	{
		lpPlaceholder[szRVA++] = 0xB0 + uRegisterNumber;
		*((PDWORD)&lpPlaceholder[szRVA]) = (DWORD)iIndex;
		szRVA += sizeof(DWORD);
	}

	// добавим операнд
	*((PDWORD)&lpPlaceholder[szRVA]) = dwOperand;
	szRVA += sizeof(DWORD);

	*pdwDelta = szRVA;
	return;

}

void BasicPolymorphicEncryptionAlgorithm::create_not(ULONG uRegisterNumber, UINT iIndex, LPBYTE lpPlaceholder, PSIZE_T pdwDelta, DWORD dwArch)
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
	wsprintfW(debugOut, L"[BasicPolymorphicEncryptionAlgorithm::create_not] creating not dword [reg_%d + %d]", uRegisterNumber, iIndex);
	WriteLog(debugOut);
#endif

	SIZE_T szRVA = *pdwDelta;

	lpPlaceholder[szRVA++] = 0xF7;
	if (iIndex == 0) // задает [r32], если iIndex == 0, то смещения нет
	{
		lpPlaceholder[szRVA++] = 0x10 + uRegisterNumber;
	}
	else if (iIndex < 128) // [r32 + rel] rel в пределах ворда, т.к значение signed то если iIndex < 128, то можем закодировать данную инструкцию вот так
	{
		lpPlaceholder[szRVA++] = 0x50 + uRegisterNumber;
		lpPlaceholder[szRVA++] = (BYTE)iIndex;
	}
	else // иначе для больших офсетов
	{
		lpPlaceholder[szRVA++] = 0x90 + uRegisterNumber;
		*((PDWORD)&lpPlaceholder[szRVA]) = (DWORD)iIndex;
		szRVA += sizeof(DWORD);
	}

	*pdwDelta = szRVA;
	return;
}

BOOL BasicPolymorphicEncryptionAlgorithm::reorder_instructions(PINT indexarr, DWORD dwInstructionsAmount)
{
	for (DWORD i = 0; i < dwInstructionsAmount; i++)
		indexarr[i] = i;
	shuffle(&this->holdrand, indexarr, dwInstructionsAmount);
	return TRUE;
}
