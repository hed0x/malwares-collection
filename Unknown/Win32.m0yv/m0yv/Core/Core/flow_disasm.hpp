#pragma once
#include "global.hpp"

// заставит дизасм следовать за jmp. Может глубоко закопаться. А если не использовать переход, то может уйти туда что никогда не исполнится
#define DISASM_FOLLOW_JMP 

#define DISASM_UNKNOWN_ARCH -1 // передали неподдерживаемую архитектуру
#define DISASM_INVALID_INSTRUCTION -2 // невалидная инструкция встретилась
#define DISASM_NULLPADDING_REACHED -3 // достигли паддинга конца секции
#define DISASM_CALLOUT_SECTION -4 // встретили вызов за пределы кодовой секции, с флагом _FNO_FLAGS_USEHEURISTICS используется как индикатор зараженности
#define DISASM_MAXIMUM_DEPTH_REACHED 1 // достигли максимальной глубины рекурсии входа в процедуры
#define DISASM_RET_REACHED 2 // достигли выход из процедуры

#define DISASM_LIMIT_JMP_EMUL 10 // лимит джампов в 10 в одной функции - если достигли такого количества JMP переходов, то на лицо имеем зацикливание и тогда отключаем эмулятор jmp

#define RET_OPCODE1 0xC3
#define RET_OPCODE2 0xCB
#define RET_OPCODE3 0xC2
#define RET_OPCODE4 0xCA

#define CALL_REL_OPCODE 0xE8

#define JMP_REL_OPCODE 0xE9

// поточный дизассемблер для поиска подходящих целей под перехват
namespace flow_disasm
{
	struct context
	{
		DWORD dwFlags;
		DWORD dwLength;
		BYTE opcode; 
		BYTE opcode2;
	};
	struct call_list
	{
		// смещение от базы буфера который дизассемблируется до call rel32
		DWORD32 call_offset;
		call_list *next_entry;
	};

	class FlowCallDisassembler
	{
	public:
		FlowCallDisassembler() = default;
		~FlowCallDisassembler() = default;

		// точка входа в буфер для потокового дизассемблера
		// lpBase - база буффера в памяти, используется чтобы корректно считать офсеты (от начала переданного буфера)
		// lpBufferEntryPoint - точка входа с которой начинать дизасм
		// lcall_entry - выходной параметр указатель на вход в список в который сохраняется список офсетов до инструкций call rel32 подлежащих перехвату
		// dwArch - архитектура дизассемблируемого кода
		// dwMaximumDepth - максимальная глубина входа в процедуры
		// dwInitialDepth - зарезервированно, всегда передавать NULL, используется как счетчик в рекурсии
		// возвращает статус дизассемблера указывая были ли какие-то проблемы или нет
		INT begin(LPBYTE lpBase, LPBYTE lpBufferEntryPoint, SIZE_T dwBufferSize, call_list **lcall_entry, DWORD dwArch, DWORD dwMaximumDepth, DWORD dwInitialDepth);
		// указатель на вход в список который требуется освободить
		VOID destroy_list(call_list **lcall_entry);
		// количество call rel32
		UINT call_amount(call_list **lcall_entry);
		// декодирует rel32 из операнда команды и возвращает как signed int 
		INT decode_rel32(LPBYTE lpOperand);
		// соединяет два списка в один
		// list_one - указатель на первый список, list_two - на второй
		// соединяет устанавливая последнему элементу list_one next_entry указатель на начало list_two
		// в outLastEntry передает указатель на последний элемент list_two
		VOID list_concatenate(call_list *list_one, call_list *list_two, call_list **outLastEntry);
		// возвращает указатель на последний элемент
		call_list *get_last_entry(call_list *list);
		// возвращает i-й вход
		call_list *get_i_entry(call_list *list, UINT i);
#ifdef _DEBUG
		VOID print_call_list(call_list *list);
#endif
	};
}