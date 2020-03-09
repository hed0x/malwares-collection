/*

Copyright (c) 2007, 2008 Hiroki Asakawa asakaw@gmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/

#include <windows.h>
#include <stdio.h>
#include "mount.h"


BOOL
DokanControlMount(
	ULONG	DeviceNumber,
	WCHAR	DriveLetter)
{
	WCHAR   volumeName[] = L"\\\\.\\ :";
	WCHAR	driveLetterAndSlash[] = L"C:\\";
	WCHAR	uniqueVolumeName[MAX_PATH];
	HANDLE  device;
	WCHAR	deviceName[MAX_PATH];

	wcscpy_s(deviceName, sizeof(deviceName), DOKAN_DEVICE_NAME);
	deviceName[wcslen(deviceName)-1] = (WCHAR)(L'0' + DeviceNumber);

    volumeName[4] = DriveLetter;
	driveLetterAndSlash[0] = DriveLetter;

	DbgPrintW(L"DeviceNumber %d DriveLetter %c\n", DeviceNumber, DriveLetter);
	DbgPrintW(L"DeviceName %s\n",deviceName);

	device = CreateFile(
		volumeName,
		GENERIC_READ | GENERIC_WRITE,
		FILE_SHARE_READ | FILE_SHARE_WRITE,
		NULL,
		OPEN_EXISTING,
		FILE_FLAG_NO_BUFFERING,
		NULL
		);

    if (device != INVALID_HANDLE_VALUE) {
        DbgPrintW(L"DokanControl Mount failed\n");
        return FALSE;
    }

    if (!DefineDosDevice(0, &volumeName[4], deviceName)) {
        DbgPrintW(L"DokanControl DefineDosDevice failed\n");
        return FALSE;
    }

	/*
	if (!GetVolumeNameForVolumeMountPoint(
			driveLetterAndSlash, 
			uniqueVolumeName,
			MAX_PATH)) {

		DbgPrint("Error: GetVolumeNameForValumeMountPoint failed : %d\n", GetLastError());
	}

	DefineDosDevice(DDD_REMOVE_DEFINITION,
					&volumeName[4],
                    NULL);

	if (!SetVolumeMountPoint(driveLetterAndSlash, uniqueVolumeName)) {
		fprintf(stderr, "Error: SetVolumeMountPoint failed : %d\n", GetLastError());
		return FALSE;
	}
	*/

    device = CreateFile(
        volumeName,
        GENERIC_READ | GENERIC_WRITE,
        FILE_SHARE_READ | FILE_SHARE_WRITE,
        NULL,
        OPEN_EXISTING,
        FILE_FLAG_NO_BUFFERING,
        NULL
        );

    if (device == INVALID_HANDLE_VALUE) {
        DbgPrintW(L"DokanControl Mount failed\n");
        DefineDosDevice(DDD_REMOVE_DEFINITION, &volumeName[4], NULL);
        return FALSE;
    }

	CloseHandle(device);

    return TRUE;
}


BOOL
DokanControlUnmount(
	WCHAR DriveLetter)
{
    WCHAR   volumeName[] = L"\\\\.\\ :";
    HANDLE  device;

    volumeName[4] = DriveLetter;
/*
    device = CreateFile(
        volumeName,
        GENERIC_READ | GENERIC_WRITE,
        FILE_SHARE_READ | FILE_SHARE_WRITE,
        NULL,
        OPEN_EXISTING,
        FILE_FLAG_NO_BUFFERING,
        NULL
        );

    if (device == INVALID_HANDLE_VALUE) {
		DbgPrintW(L"DriveLetter %wc\n", DriveLetter);
        DbgPrintW(L"DokanControl Unmount failed\n");
        return FALSE;
    }

    CloseHandle(device);
*/
    if (!DefineDosDevice(DDD_REMOVE_DEFINITION, &volumeName[4], NULL)) {
		DbgPrintW(L"DriveLetter %wc\n", DriveLetter);
        DbgPrintW(L"DokanControl DefineDosDevice failed\n");
        return FALSE;
    }

	return TRUE;
}
