#pragma once

#include "global.hpp"


namespace trashgen
{
	// интерфейс к генератору трешкода
	class ITrashgen
	{
	public:
		virtual ~ITrashgen() = default;
		virtual BOOL init(LPBYTE lpParameter, SIZE_T dwParameterSize) = 0;
		virtual DWORD gen(LPBYTE lpOutputBuffer, SIZE_T dwMaxGenSize) = 0;

	};

	struct trashgenDefaultParameter
	{
		// seed генератора рандома
		DWORD dwSeed;
		// архитектура генерируемого кода
		DWORD dwArch;
	};

	// генерирует исполняемый трэшкод из FPU инструкций
	class FPUExecutableTrashGenerator : ITrashgen
	{
	public:
		FPUExecutableTrashGenerator();
		~FPUExecutableTrashGenerator();

		// инициализирует генератор структурой trashgenDefaultParameter
		BOOL init(LPBYTE lpParameter, SIZE_T dwParameterSize);
		DWORD gen(LPBYTE lpOutputBuffer, SIZE_T dwMaxGenSize);

	private:
		trashgenDefaultParameter *parameter;

		DWORD gen_fpu(unsigned char *instruction);
	};

	typedef enum _nonexec_types
	{
		// полный трэш в том числе из невалидных инструкций
		complete_trash = 0,
		// стандартные инструкции встречаемые в большинстве апп
		default_instructions
	} nonexec_types_t;

	struct trashgenNonexecutableParameter
	{
		trashgenDefaultParameter defaultParam;
		nonexec_types_t type;
	};

	// генерирует неисполняемый трэш-код
	class NonExecutableTrash : ITrashgen
	{
	public:
		NonExecutableTrash();
		~NonExecutableTrash();

		// инициализирует генератор структурой trashgenNonExecutableParameter
		BOOL init(LPBYTE lpParameter, SIZE_T dwParameterSize);
		DWORD gen(LPBYTE lpOutputBuffer, SIZE_T dwMaxGenSize);
		
	private:
		trashgenNonexecutableParameter *parameter;

		DWORD gen_instr(unsigned char *instruction, DWORD dwCurrentBlockRVA);
		LPDWORD lpInstructionOffsetArray;
		DWORD dwTotalInstructions;
	};

	// список из экземпляров трешгенов
	struct trashLinkedList
	{
		// генератор трэшкода
		ITrashgen *trashgen;
		// параметр конкретного генератора трэшкода
		LPBYTE lpParameter;
		// размер параметра конкретного генератора трэшкода
		SIZE_T dwParamSize;
		// следующая запись
		trashLinkedList *next;
	};

	struct FunctionsLayerTrashParameter
	{
		trashgenDefaultParameter defaultParam;
		// указатель на список трэшген экземпляров для заполнения сгенерированных функций
		trashLinkedList *entry;
	};

	// максимальный размер блока (с функцией) FunctionsLayersTrash
#define FUNCTIONSLAYER_TRASH_BLOCKMAXSIZE 256
	// генерирует видимость функций: прологи, эпилоги, заполняет их при помощи других классов трешгена
	class FunctionsLayerTrash : ITrashgen
	{
	public:
		FunctionsLayerTrash();
		~FunctionsLayerTrash();

		// инициализирует генератор структурой FunctionsLayerTrashParameter
		BOOL init(LPBYTE lpParameter, SIZE_T dwParameterSize);
		DWORD gen(LPBYTE lpOutputBuffer, SIZE_T dwMaxGenSize);

	private:
		FunctionsLayerTrashParameter *parameter;
		LPDWORD lpcallRVA; // список RVA на call
		LPDWORD lpSubroutineRVA; // список RVA на блоки функций

		DWORD dwCallCounter;
		DWORD dwSubroutineCounter;
		DWORD dwElementsAmount;

		LPBYTE lpBlockBuffer;
		

		DWORD gen_block(DWORD dwCurrentBlockRVA);
		VOID fix_calls(LPBYTE lpBuffer);

	};

	// освобождает список реализаций трешгена
	// bDeleteGenerators если TRUE, то free_linkedlist удаляет из списка экземпляры генераторов через delete
	// bDeleteParameters - также удалит параметры
	VOID free_linkedlist(trashLinkedList *entry, BOOL bDeleteGenerators, BOOL bDeleteParameters);

	// pptlEntry - указатель на переменную, принимающую в себе адрес на новый entry
	// trashgen, lpParameter, dwParamSize - соответствующие поля элемента списка
	BOOL add_entry(trashLinkedList **pptlentry, ITrashgen *trashgen, LPBYTE lpParameter, SIZE_T dwParamSize);
	// считает количество элементов
	DWORD entry_amount(trashLinkedList *entry);
	trashLinkedList *get_entry(trashLinkedList *entry, DWORD dwIndex);
	// аллоцирует список для передачи в FunctionsLayerTrash, должен быть освобожден вызовом free_linkedlist со всеми булеан в TRUE
	trashLinkedList *funclist_alloc(BOOL bDefaultAlloc, BOOL bFpuAlloc, DWORD dwSeed, DWORD dwArch);
}