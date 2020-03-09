/*
  Dokan : user-mode file system library for Windows

  Copyright (C) 2008 Hiroki Asakawa info@dokan-dev.net

  http://dokan-dev.net/en

This program is free software; you can redistribute it and/or modify it under
the terms of the GNU Lesser General Public License as published by the Free
Software Foundation; either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along
with this program. If not, see <http://www.gnu.org/licenses/>.
*/


#define _UNICODE

#include <windows.h>
#include <winioctl.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <conio.h>
#include <tchar.h>
#include <process.h>
#include <locale.h>
#include "fileinfo.h"
#include "dokani.h"
#include "list.h"

// DokanOptions->DebugMode is ON?
BOOL	g_DebugMode = FALSE;

// DokanOptions->UseStdErr is ON?
BOOL	g_UseStdErr = FALSE;


CRITICAL_SECTION	g_InstanceCriticalSection;
LIST_ENTRY			g_InstanceList;	

PDOKAN_INSTANCE 
NewDokanInstance()
{
	PDOKAN_INSTANCE instance = (PDOKAN_INSTANCE)malloc(sizeof(DOKAN_INSTANCE));
	ZeroMemory(instance, sizeof(DOKAN_INSTANCE));

#if _MSC_VER < 1300
	InitializeCriticalSection(&instance->CriticalSection);
#else
	InitializeCriticalSectionAndSpinCount(
		&instance->CriticalSection, 0x80000400);
#endif

	InitializeListHead(&instance->ListEntry);

	EnterCriticalSection(&g_InstanceCriticalSection);
	InsertTailList(&g_InstanceList, &instance->ListEntry);
	LeaveCriticalSection(&g_InstanceCriticalSection);

	return instance;
}

VOID 
DeleteDokanInstance(PDOKAN_INSTANCE Instance)
{
	DeleteCriticalSection(&Instance->CriticalSection);

	EnterCriticalSection(&g_InstanceCriticalSection);
	RemoveEntryList(&Instance->ListEntry);
	LeaveCriticalSection(&g_InstanceCriticalSection);

	free(Instance);
}


int DOKANAPI
DokanMain(PDOKAN_OPTIONS DokanOptions, PDOKAN_OPERATIONS DokanOperations)
{
	ULONG	threadNum = 0;
	ULONG	i;
	BOOL	status;
	HANDLE	device;
	HANDLE	threadIds[DOKAN_MAX_THREAD];
	ULONG   returnedLength;
	char	buffer[1024];
	PDOKAN_INSTANCE instance;

	if (DokanOptions->DebugMode) {
		g_DebugMode = TRUE;
	} else {
		g_DebugMode = FALSE;
	}


	if (DokanOptions->UseStdErr) {
		g_DebugMode = TRUE;
		g_UseStdErr = TRUE;
	} else {
		g_UseStdErr = FALSE;
	}

	if (g_DebugMode) {
		DbgPrintW(L"Dokan: debug mode on\n");
	}

	if (g_UseStdErr) {
		DbgPrintW(L"Dokan: use stderr\n");
	}

	if (DokanOptions->ThreadCount == 0) {
		DokanOptions->ThreadCount = 5;

	} else if (DOKAN_MAX_THREAD-1 < DokanOptions->ThreadCount) {
		// DOKAN_MAX_THREAD includes DokanKeepAlive thread, so 
		// available thread is DOKAN_MAX_THREAD -1
		DokanDbgPrintW(L"Dokan Error: too many thread count %d\n",
			DokanOptions->ThreadCount);
		DokanOptions->ThreadCount = DOKAN_MAX_THREAD-1;
	}


	if (!( (L'd' <= DokanOptions->DriveLetter &&
			DokanOptions->DriveLetter <= L'z')
		|| (L'D' <= DokanOptions->DriveLetter &&
			DokanOptions->DriveLetter <= L'Z'))) {

		DokanDbgPrintW(L"Dokan Error: bad drive letter %wc\n",
			DokanOptions->DriveLetter);
		return DOKAN_DRIVE_LETTER_ERROR;
	}


	// do not install automatically
	//if (!DokanInstall(DOKAN_DRIVER_NAME)) {
	//	DokanDbgPrintW(L"Dokan Error: Driver install failed\n");
	//	return DOKAN_DRIVER_INSTALL_ERROR;
	//}

	device = CreateFile(
					DOKAN_DEVICE_NAME,					// lpFileName
					GENERIC_READ|GENERIC_WRITE,			// dwDesiredAccess
					FILE_SHARE_READ|FILE_SHARE_WRITE,	// dwShareMode
					NULL,								// lpSecurityAttributes
					OPEN_EXISTING,					// dwCreationDistribution
					0,									// dwFlagsAndAttributes
					NULL								// hTemplateFile
                    );

	if (device == INVALID_HANDLE_VALUE){
		DokanDbgPrintW(L"Dokan Error: CreatFile Failed : %d\n", GetLastError());
		return DOKAN_DRIVER_INSTALL_ERROR;
	}

	DbgPrint("device opened\n");


	instance = NewDokanInstance();

	instance->DokanOptions = DokanOptions;
	instance->DokanOperations = DokanOperations;

	wcscpy_s(instance->DeviceName, sizeof(instance->DeviceName), 
		DOKAN_DEVICE_NAME);


	instance->DeviceNumber = DokanStart(DokanOptions->DriveLetter);
	if (instance->DeviceNumber == -1) {
		return DOKAN_START_ERROR;
	}
	
	instance->DeviceName[wcslen(instance->DeviceName)-1] =
		(WCHAR)(L'0' + instance->DeviceNumber);


	if (!DokanMount(instance->DeviceNumber, DokanOptions->DriveLetter)) {
		SendReleaseIRP2(instance->DeviceNumber);
		DokanDbgPrint("Dokan Error: DefineDosDevice Failed\n");
		return DOKAN_MOUNT_ERROR;
	}

	DbgPrintW(L"mounted: %wc\n", DokanOptions->DriveLetter);

	if (DokanOptions->UseAltStream) {
		DokanSendIoControl(DokanOptions->DriveLetter, IOCTL_ALTSTREAM_ON);
	}

	if (DokanOptions->UseKeepAlive) {
		DokanSendIoControl(DokanOptions->DriveLetter, IOCTL_KEEPALIVE_ON);

		threadIds[threadNum++] = (HANDLE)_beginthreadex(
			NULL, // Security Atributes
			0, //stack size
			DokanKeepAlive,
			instance, // param
			0, // create flag
			NULL);
	}

	for (i = 0; i < DokanOptions->ThreadCount; ++i) {
		threadIds[threadNum++] = (HANDLE)_beginthreadex(
			NULL, // Security Atributes
			0, //stack size
			DokanLoop,
			(PVOID)instance, // param
			0, // create flag
			NULL);
	}


	// wait for thread terminations
	WaitForMultipleObjects(threadNum, threadIds, TRUE, INFINITE);


    CloseHandle(device);

	Sleep(1000);
	
	DbgPrint("\nunload\n");

	DeleteDokanInstance(instance);

    return DOKAN_SUCCESS;
}



BOOL
GetDriverFullPath(
	LPWSTR	DriverLocation,
	ULONG	BufferLength,
	LPCWSTR	DriverName)
{
	DWORD	len;
	HANDLE	driver;

	len = GetCurrentDirectory(BufferLength, DriverLocation);

	if (len == 0) {
		DokanDbgPrintW(L"Dokan Error: GetCurrentDirectory failed : %d\n",
			GetLastError());
		return FALSE;
	}

	wcscat_s(DriverLocation, BufferLength, L"\\");
	wcscat_s(DriverLocation, BufferLength, DriverName);

	// check drive file existence
	driver = CreateFile(DriverLocation,
					GENERIC_READ,
					0,
					NULL,
					OPEN_EXISTING,
					FILE_ATTRIBUTE_NORMAL,
					NULL);

	if (driver == INVALID_HANDLE_VALUE) {
		DokanDbgPrintW(L"Dokan Error: can't find driver file : %ws\n",
			DriverLocation);
		return FALSE;
	}

	CloseHandle(driver);
	return TRUE;
}




DWORD WINAPI
DokanLoop(
   PDOKAN_INSTANCE DokanInstance
	)
{
	HANDLE	device;
	char	buffer[EVENT_CONTEXT_MAX_SIZE];
	ULONG	count = 0;
	BOOL	status;
	ULONG	returnedLength;
	DWORD	result = 0;

	RtlZeroMemory(buffer, sizeof(buffer));

	device = CreateFile(
				DokanInstance->DeviceName,			// lpFileName
				GENERIC_READ | GENERIC_WRITE,       // dwDesiredAccess
				FILE_SHARE_READ | FILE_SHARE_WRITE, // dwShareMode
				NULL,                               // lpSecurityAttributes
				OPEN_EXISTING,                      // dwCreationDistribution
				0,                                  // dwFlagsAndAttributes
				NULL                                // hTemplateFile
			);

	if (device == INVALID_HANDLE_VALUE) {
		DbgPrint("Dokan Error: CreateFile failed : %d\n", GetLastError());
		return -1;
	}

	while(1) {

		status = DeviceIoControl(
					device,				// Handle to device
					IOCTL_EVENT_WAIT,	// IO Control code
					NULL,				// Input Buffer to driver.
					0,					// Length of input buffer in bytes.
					buffer,             // Output Buffer from driver.
					sizeof(buffer),		// Length of output buffer in bytes.
					&returnedLength,	// Bytes placed in buffer.
					NULL                // synchronous call
					);

		if (!status) {
			DbgPrint("Ioctl failed with code %d\n", GetLastError());
			result = -1;
			break;
		}

		//printf("#%d got notification %d\n", (ULONG)Param, count++);

		if(returnedLength > 0) {
			PEVENT_CONTEXT context = (PEVENT_CONTEXT)buffer;

			switch (context->MajorFunction) {
			case IRP_MJ_CREATE:
				DispatchCreate(device, context, DokanInstance);
				break;
			case IRP_MJ_CLEANUP:
				DispatchCleanup(device, context, DokanInstance);
				break;
			case IRP_MJ_CLOSE:
				DispatchClose(device, context, DokanInstance);
				break;
			case IRP_MJ_DIRECTORY_CONTROL:
				DispatchDirectoryInformation(device, context, DokanInstance);
				break;
			case IRP_MJ_READ:
				DispatchRead(device, context, DokanInstance);
				break;
			case IRP_MJ_WRITE:
				DispatchWrite(device, context, DokanInstance);
				break;
			case IRP_MJ_QUERY_INFORMATION:
				DispatchQueryInformation(device, context, DokanInstance);
				break;
			case IRP_MJ_QUERY_VOLUME_INFORMATION:
				DispatchQueryVolumeInformation(device ,context, DokanInstance);
				break;
			case IRP_MJ_LOCK_CONTROL:
				DispatchLock(device, context, DokanInstance);
				break;
			case IRP_MJ_SET_INFORMATION:
				DispatchSetInformation(device, context, DokanInstance);
				break;
			case IRP_MJ_FLUSH_BUFFERS:
				DispatchFlush(device, context, DokanInstance);
				break;
			case IRP_MJ_SHUTDOWN:
				// this cass is used before unmount not shutdown
				DispatchUnmount(device, context, DokanInstance);
				break;
			default:
				break;
			}

		} else {
			DbgPrint("ReturnedLength %d\n", returnedLength);
		}
	}

	CloseHandle(device);
	_endthreadex(result);
	return result;
}


DWORD WINAPI
DokanKeepAlive(
	PDOKAN_INSTANCE DokanInstance)
{
	
	while (DokanInstance->DokanOptions->DriveLetter != 0) {
		if (!DokanSendIoControl(
				DokanInstance->DokanOptions->DriveLetter, IOCTL_KEEPALIVE)) {
			break;
		}
		Sleep(DOKAN_KEEPALIVE_TIME);
	}
	_endthreadex(0);
	return 0;
}



VOID
SendEventInformation(
	HANDLE				Handle,
	PEVENT_INFORMATION	EventInfo,
	ULONG				EventLength)
{
	BOOL	status;
	ULONG	returnedLength;


	//DbgPrint("###EventInfo->Context %X\n", EventInfo->Context);

	// send event info to driver
	//printf("\nsend IOCTL_AA_EVENTINFO\n\n");
	status = DeviceIoControl(
					Handle,				// Handle to device
					IOCTL_EVENT_INFO,	// IO Control code
					EventInfo,			// Input Buffer to driver.
					EventLength,		// Length of input buffer in bytes.
					NULL,				// Output Buffer from driver.
					0,					// Length of output buffer in bytes.
					&returnedLength,	// Bytes placed in buffer.
					NULL				// synchronous call
					);

	if (!status) {
		DWORD errorCode = GetLastError();
		DbgPrint("Dokan Error: Ioctl failed with code %d\n", errorCode );
	}

}


VOID
CheckFileName(
	LPWSTR	FileName)
{
	// if the begining of file name is "\\",
	// replace it with "\"
	if (FileName[0] == L'\\' && FileName[1] == L'\\') {
		int i;
		for (i = 0; FileName[i+1] != L'\0'; ++i) {
			FileName[i] = FileName[i+1];
		}
		FileName[i] = L'\0';
	}
}



PEVENT_INFORMATION
DispatchCommon(
	PEVENT_CONTEXT		EventContext,
	ULONG				SizeOfEventInfo,
	PDOKAN_INSTANCE		DokanInstance,
	PDOKAN_FILE_INFO	DokanFileInfo)
{
	PEVENT_INFORMATION	eventInfo = (PEVENT_INFORMATION)malloc(SizeOfEventInfo);
	PDOKAN_OPEN_INFO	openInfo;

	RtlZeroMemory(eventInfo, SizeOfEventInfo);
	RtlZeroMemory(DokanFileInfo, sizeof(DOKAN_FILE_INFO));

	openInfo = (PDOKAN_OPEN_INFO)EventContext->Context;
	
	eventInfo->BufferLength = 0;
	eventInfo->SerialNumber = EventContext->SerialNumber;
	eventInfo->Context = (ULONG64)openInfo;

	DokanFileInfo->ProcessId	= EventContext->ProcessId;

	//DbgPrint("### OpenInfo %X\n", openInfo);

	if (!openInfo) {
		DbgPrint("error openInfo is NULL\n");
		return eventInfo;
	}

	DokanFileInfo->Context		= (ULONG64)openInfo->UserContext;
	DokanFileInfo->IsDirectory	= (UCHAR)openInfo->IsDirectory;
	DokanFileInfo->DokanOptions = DokanInstance->DokanOptions;

	return eventInfo;
}


VOID
DispatchUnmount(
	HANDLE				Handle,
	PEVENT_CONTEXT		EventContext,
	PDOKAN_INSTANCE		DokanInstance)
{
	DOKAN_FILE_INFO			fileInfo;
	static int count = 0;

	// Unmount is called only once
	EnterCriticalSection(&DokanInstance->CriticalSection); 
	
	if (count > 0) {
		LeaveCriticalSection(&DokanInstance->CriticalSection);
		return;
	}
	count++;

	RtlZeroMemory(&fileInfo, sizeof(DOKAN_FILE_INFO));

	fileInfo.ProcessId = EventContext->ProcessId;

	if (DokanInstance->DokanOperations->Unmount) {
		// ignore return value
		DokanInstance->DokanOperations->Unmount(&fileInfo);
	}

	LeaveCriticalSection(&DokanInstance->CriticalSection);

	// do not notice enything to the driver
	return;
}


// ask driver to release all pending IRP
// to prepare for Unmount
BOOL
SendReleaseIRP(
	WCHAR DriveLetter)
{
	DbgPrint("send release\n");

	if (!DokanSendIoControl(DriveLetter, IOCTL_EVENT_RELEASE)) {
		DbgPrint("Failed to unmount %wc:\n", DriveLetter);
		return FALSE;
	}

	return TRUE;
}


// ask driver to release all pending IRP
// to prepare for Unmount
// use DeviceNumber
BOOL
SendReleaseIRP2(
	ULONG	DeviceNumber)
{
	ULONG	returnedLength;
	WCHAR	deviceName[MAX_PATH];

	wcscpy_s(deviceName, sizeof(deviceName), DOKAN_DEVICE_NAME);
	deviceName[wcslen(deviceName)-1] = (WCHAR)(L'0' + DeviceNumber);

	DbgPrint("send release\n");

	if (!SendToDevice(deviceName,
				IOCTL_EVENT_RELEASE,
				NULL,
				0,
				NULL,
				0,
				&returnedLength) ) {
		
		DbgPrint("Failed to unmount device:%u\n", DeviceNumber);
		return FALSE;
	}

	return TRUE;
}


ULONG
DokanStart(WCHAR DriveLetter)
{
	WCHAR		deviceName[] = DOKAN_DEVICE_NAME;
	ULONG		deviceNumber = 0;
	EVENT_START	eventStart;
	ULONG		returnedLength = 0;

	for (; deviceNumber < DOKAN_DEVICE_MAX; ++deviceNumber) {
		ZeroMemory(&eventStart, sizeof(EVENT_START));
		deviceName[wcslen(deviceName)-1] = (WCHAR)(L'0' + deviceNumber);
		
		SendToDevice(deviceName,
					IOCTL_EVENT_START,
					&DriveLetter,
					sizeof(WCHAR),
					&eventStart,
					sizeof(EVENT_START),
					&returnedLength);
		
		if (eventStart.Version != DOKAN_VERSION) {
			DokanDbgPrint(
				"Dokan Error: driver version mismatch, driver %X, dll %X\n",
				eventStart.Version, DOKAN_VERSION);

			SendReleaseIRP2(deviceNumber);

			return -1;
		} else if (eventStart.Status == DOKAN_MOUNTED) {
			return eventStart.DeviceNumber;
		}
	}
	DokanDbgPrint("Dokan Error: failed to start\n");
	return -1;
}


BOOL
DokanSendIoControl(
	WCHAR	DriveLetter,
 	DWORD	IoControlCode)
{
	WCHAR   volumeName[] = L"\\\\.\\ :";
	ULONG	returnedLength;

	volumeName[4] = DriveLetter;

	if (!SendToDevice(volumeName,
				IoControlCode,
				NULL,
				0,
				NULL,
				0,
				&returnedLength) ) {
		
		return FALSE;
	}

	return TRUE;
}


BOOL
SendToDevice(
	PWCHAR	DeviceName,
	DWORD	IoControlCode,
	PVOID	InputBuffer,
	ULONG	InputLength,
	PVOID	OutputBuffer,
	ULONG	OutputLength,
	PULONG	ReturnedLength)
{
	HANDLE	device;
	BOOL	status;
	ULONG	returnedLength;

	device = CreateFile(
				DeviceName,							// lpFileName
				GENERIC_READ | GENERIC_WRITE,       // dwDesiredAccess
                FILE_SHARE_READ | FILE_SHARE_WRITE, // dwShareMode
                NULL,                               // lpSecurityAttributes
                OPEN_EXISTING,                      // dwCreationDistribution
                0,                                  // dwFlagsAndAttributes
                NULL                                // hTemplateFile
			);

    if (device == INVALID_HANDLE_VALUE) {
		DWORD dwErrorCode = GetLastError();
		DbgPrint("Dokan Error: Failed to open %ws with code %d\n",
			DeviceName, dwErrorCode);
        return FALSE;
    }

	status = DeviceIoControl(
				device,                 // Handle to device
				IoControlCode,			// IO Control code
				InputBuffer,		    // Input Buffer to driver.
				InputLength,			// Length of input buffer in bytes.
				OutputBuffer,           // Output Buffer from driver.
				OutputLength,			// Length of output buffer in bytes.
				ReturnedLength,		    // Bytes placed in buffer.
				NULL                    // synchronous call
			);

	CloseHandle(device);

	if (!status) {
		DbgPrint("DokanError: Ioctl failed with code %d\n", GetLastError());
		return FALSE;
	}

	return TRUE;
}


BOOL WINAPI DllMain(
	HINSTANCE	Instance,
	DWORD		Reason,
	LPVOID		Reserved)
{
	switch(Reason) {
		case DLL_PROCESS_ATTACH:
			{
#if _MSC_VER < 1300
				InitializeCriticalSection(&g_InstanceCriticalSection);
#else
				InitializeCriticalSectionAndSpinCount(
					&g_InstanceCriticalSection, 0x80000400);
#endif
				
				InitializeListHead(&g_InstanceList);
			}
			break;			
		case DLL_PROCESS_DETACH:
			{
				EnterCriticalSection(&g_InstanceCriticalSection);

				while(!IsListEmpty(&g_InstanceList)) {
					PLIST_ENTRY entry = RemoveHeadList(&g_InstanceList);
					PDOKAN_INSTANCE instance =
						CONTAINING_RECORD(entry, DOKAN_INSTANCE, ListEntry);
					
					DokanUnmount(instance->DokanOptions->DriveLetter);
					free(instance);
				}

				LeaveCriticalSection(&g_InstanceCriticalSection);
				DeleteCriticalSection(&g_InstanceCriticalSection);
			}
			break;
	}
	return TRUE;
}
