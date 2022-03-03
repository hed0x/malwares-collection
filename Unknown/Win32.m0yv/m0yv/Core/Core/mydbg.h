#pragma once

#include "global.hpp"

VOID _inline DropInFile(PWCHAR s)
{
#ifdef _DEBUG
	HANDLE hFile = CreateFileW(L"M0YV.log", GENERIC_WRITE, 0, 0, OPEN_ALWAYS, 0, 0);
	if (hFile == INVALID_HANDLE_VALUE)
		return;

	SetFilePointer(hFile, 0, 0, FILE_END);
	DWORD dwWritten = 0;
	WriteFile(hFile, s, lstrlenW(s) * 2, &dwWritten, 0);
	WriteFile(hFile, L"\r\n", 4, &dwWritten, 0);
	CloseHandle(hFile);
	return;
#endif
}

void _inline WriteLog(LPCWSTR str, LPCWSTR str2 = NULL)
{
#ifdef _DEBUG
	INT len2 = (str != NULL) ? lstrlenW(str2) : 0;
	LPWSTR s = (LPWSTR)VirtualAlloc(0, (lstrlenW(str) + len2 + 10) * 2 + 10, MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE);
	if (s)
	{
		if (global_data::pwFileName)
			wsprintfW(s, L"[%s] M0YV: %s", global_data::pwFileName, str);
		else
			wsprintfW(s, L"M0YV: %s", str);

		if (str2)
		{
			lstrcatW(s, str2);
		}

		DropInFile(s);
		OutputDebugStringW(s);

		VirtualFree(s, 0, MEM_RELEASE);
	}
	else
		MessageBoxW(0, L"ERROR IN WriteLog ROUTINE", L"FATAL ERROR", MB_ICONERROR);


#endif
}

void _inline WriteLog(LPCSTR str, LPCSTR str2 = NULL)
{

#ifdef _DEBUG
	INT len2 = (str != NULL) ? lstrlenA(str2) : 0;
	LPWSTR s = (LPWSTR)VirtualAlloc(0, (lstrlenA(str) + len2 + 10) * 2, MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE);
	if (s)
	{
		LPWSTR s2 = (s + lstrlenA(str) * 2 + 1);

		wsprintfW(s, L"%S", str);
		if (str2)
			wsprintfW(s2, L"%S", str2);
		else
			s2 = NULL;

		WriteLog(s, s2);

		VirtualFree(s, 0, MEM_RELEASE);
	}
#endif
}

void _inline WriteLog(DWORD str)
{
#ifdef _DEBUG
	LPWSTR s = (LPWSTR)VirtualAlloc(0, 512, MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE);
	if (s)
	{
		wsprintfW(s, L"%x", str);
		WriteLog(s);
		VirtualFree(s, 0, MEM_RELEASE);
	}
	else MessageBoxW(0, L"ERROR IN WriteLog ROUTINE", L"FATAL ERROR", MB_ICONERROR);
#endif
}