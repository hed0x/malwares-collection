#pragma once

#include "global.hpp"

namespace service_api
{
	typedef DWORD(WINAPI *fnCallbackOnFound)(SC_HANDLE hSCManager, LPENUM_SERVICE_STATUS_PROCESSW pssp, LPVOID lpParameter, SIZE_T dwParamsize);
	/*
	Для каждой найденной службы вызовит callback и передаст туда информацию о службе, а также lpParameter/dwParamsize задаваемый вызывающей функцией
	pwMachineName, pwDatabaseName, dwDesiredAccess - параметры OpenSCManager
	dwServiceStatus - какие службы искать
	*/
	BOOL enumerate(PWCHAR pwMachineName, PWCHAR pwDatabaseName, DWORD dwDesiredAccess, DWORD dwServiceStatus, fnCallbackOnFound callback, LPVOID lpParameter, SIZE_T dwParamsize);
}