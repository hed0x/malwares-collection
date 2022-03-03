#include "HMexecutable_gen.h"
#include <winternl.h>
#include <intrin.h>
#include <stdio.h>
#include <time.h>

DWORD GetFileOffsetDirectory(PIMAGE_DATA_DIRECTORY directory, PIMAGE_HIVEMIND_HEADER pHivemind, BOOL bArch64)
{
	PIMAGE_SECTION_HEADER pSection = nullptr;

	DWORD dwNumberOfSections = 0;
	if (bArch64)
	{
		dwNumberOfSections = ((PIMAGE_NT_HEADERS64)((SIZE_T)pHivemind + (SIZE_T)pHivemind->e_lfanew))->FileHeader.NumberOfSections;
		pSection = IMAGE_FIRST_SECTION(((PIMAGE_NT_HEADERS64)((SIZE_T)pHivemind + (SIZE_T)pHivemind->e_lfanew)));
	}
	else
	{
		dwNumberOfSections = ((PIMAGE_NT_HEADERS32)((SIZE_T)pHivemind + (SIZE_T)pHivemind->e_lfanew))->FileHeader.NumberOfSections;
		pSection = IMAGE_FIRST_SECTION(((PIMAGE_NT_HEADERS32)((SIZE_T)pHivemind + (SIZE_T)pHivemind->e_lfanew)));
	}

	BOOL bFound = FALSE;
	for (int i = 0; i < dwNumberOfSections; i++, pSection++)
	{
		if ((directory->VirtualAddress >= pSection->VirtualAddress) && (directory->VirtualAddress <= pSection->VirtualAddress + pSection->Misc.VirtualSize))
		{
			bFound = TRUE;
			break;
		}
		
	}

	if (!bFound)
		return 0;

	// RVA от начала секции
	DWORD dwSectionOffset = directory->VirtualAddress - pSection->VirtualAddress;

	// файловый оффсет это RVA от начала секции + файловый офсет секции
	return dwSectionOffset + pSection->PointerToRawData;
}

int _cdecl _rand(long *holdrand)
{
	return (((*holdrand = *holdrand * 214013L + 2531011L) >> 16) & 0x7fff);
}

// создает случайный поток байтов не выше 10 на основе dwInitialKey
// байт не должен превышать 10, чтобы не создавал нулевых символов так как при расшифровке будем мониторить конец по нулевому символу
void CreateStreamChars(unsigned char *stream, SIZE_T dwStreamSize, DWORD dwInitialKey)
{
	long holdrand = dwInitialKey;
	for (SIZE_T i = 0; i < dwStreamSize; i++)
		stream[i] = _rand(&holdrand) % 10;
	
}

// ксорит str со stream до нулевого символа или окончания stream
void ApplyStream(unsigned char *stream, SIZE_T dwStreamSize, unsigned char *str)
{
	for (SIZE_T i = 0; i < dwStreamSize; i++)
	{
		if (str[i] == '\0')
			break;
		str[i] ^= stream[i];
	}
}

void EncryptImportNames(PIMAGE_HIVEMIND_HEADER pHivemind, DWORD dwKey, BOOL bArch64)
{
	unsigned char stream[256];
	CreateStreamChars(stream, sizeof(stream), dwKey);

	PIMAGE_DATA_DIRECTORY directory = nullptr;
	if (bArch64)
		directory = (PIMAGE_DATA_DIRECTORY)&(((PIMAGE_NT_HEADERS64)((SIZE_T)pHivemind + pHivemind->e_lfanew))->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_IMPORT]);
	else
		directory = (PIMAGE_DATA_DIRECTORY)&(((PIMAGE_NT_HEADERS32)((SIZE_T)pHivemind + pHivemind->e_lfanew))->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_IMPORT]);

	if (directory->Size == 0)
		return;

	DWORD ImportTableFileOffset = GetFileOffsetDirectory(directory, pHivemind, bArch64);
	if (ImportTableFileOffset == 0)
	{
		printf("Error can't get offset to IAT\n");
		return;
	}

	PIMAGE_IMPORT_DESCRIPTOR importDesc = (PIMAGE_IMPORT_DESCRIPTOR)((SIZE_T)pHivemind + ImportTableFileOffset);

	for (;!IsBadReadPtr(importDesc, sizeof(IMAGE_IMPORT_DESCRIPTOR)) && importDesc->Name; importDesc++)
	{
		SIZE_T *thunkRef, *funcRef;
		DWORD dwFileOffset = 0;
		unsigned char *lpszName = nullptr;
		// файловый офсет до имени = офсет до имени от начала импорт таблицы + офсет до импорт таблицы
		dwFileOffset = (importDesc->Name - directory->VirtualAddress) + ImportTableFileOffset;
		lpszName = &((unsigned char*)pHivemind)[dwFileOffset];

		printf("Obfuscating import name in %s - %s -> ", (bArch64) ? "x64" : "x86", lpszName);
		ApplyStream(stream, sizeof(stream), lpszName);
		printf("%s\n", lpszName);

		if (importDesc->OriginalFirstThunk)
		{
			thunkRef = (SIZE_T *)((SIZE_T)pHivemind + (SIZE_T)((importDesc->OriginalFirstThunk - directory->VirtualAddress) + ImportTableFileOffset));
			funcRef = (SIZE_T *)((SIZE_T)pHivemind + (SIZE_T)((importDesc->FirstThunk - directory->VirtualAddress) + ImportTableFileOffset));
		}
		else {
			thunkRef = (SIZE_T *)((SIZE_T)pHivemind + (SIZE_T)((importDesc->FirstThunk - directory->VirtualAddress) + ImportTableFileOffset));
			funcRef = (SIZE_T *)((SIZE_T)pHivemind + (SIZE_T)((importDesc->FirstThunk - directory->VirtualAddress) + ImportTableFileOffset));
		}

#ifndef _WIN64 // из 86 бит программы нам нужны 8-байт тип если мы хотим из 86 пропарсить 64
		LONGLONG *pLongThunk = (LONGLONG*)thunkRef;
		LONGLONG *pLongFunc = (LONGLONG*)funcRef;
		if (!bArch64)
		{
			for (; *thunkRef; thunkRef++, funcRef++)
			{
				if (!IMAGE_SNAP_BY_ORDINAL(*thunkRef))
				{
					PIMAGE_IMPORT_BY_NAME thunkData = (PIMAGE_IMPORT_BY_NAME)((SIZE_T)pHivemind + (SIZE_T)((*thunkRef - directory->VirtualAddress) + ImportTableFileOffset));
					printf("Obfuscating %s in %s -> ", (bArch64) ? "x64" : "x86", &thunkData->Name);
					ApplyStream(stream, sizeof(stream), (unsigned char*)&thunkData->Name);
					printf("%s\n", &thunkData->Name);
				}

			}
		}
		else
		{
			for (; *pLongThunk; pLongThunk++, pLongFunc++)
			{
				if (!IMAGE_SNAP_BY_ORDINAL(*pLongThunk))
				{
					PIMAGE_IMPORT_BY_NAME thunkData = (PIMAGE_IMPORT_BY_NAME)((SIZE_T)pHivemind + (SIZE_T)((*pLongThunk - directory->VirtualAddress) + ImportTableFileOffset));
					printf("Obfuscating %s in %s -> ", (bArch64) ? "x64" : "x86", &thunkData->Name);
					ApplyStream(stream, sizeof(stream), (unsigned char*)&thunkData->Name);
					printf("%s\n", &thunkData->Name);
				}

			}
		}
#else // для 64 бит кода нам нужны короткие указатели 4-байтовые если мы хотим из 64 бит пропарсить 86 бит импорт
		DWORD *pShortThunkRef = (DWORD*)thunkRef;
		DWORD *pShortFuncRef = (DWORD*)funcRef;

		if (bArch64 == TRUE)
		{
			for (; *thunkRef; thunkRef++, funcRef++)
			{
				if (!IMAGE_SNAP_BY_ORDINAL(*thunkRef))
				{
					PIMAGE_IMPORT_BY_NAME thunkData = (PIMAGE_IMPORT_BY_NAME)((SIZE_T)pHivemind + (SIZE_T)((*thunkRef - directory->VirtualAddress) + ImportTableFileOffset));
					printf("Obfuscating %s in %s -> ", (bArch64) ? "x64" : "x86", &thunkData->Name);
					ApplyStream(stream, sizeof(stream), (unsigned char*)&thunkData->Name);
					printf("%s\n", &thunkData->Name);
				}

			}
		}
		else
		{
			for (; *pShortThunkRef; pShortThunkRef++, pShortFuncRef++)
			{
				if (!IMAGE_SNAP_BY_ORDINAL(*pShortThunkRef))
				{
					PIMAGE_IMPORT_BY_NAME thunkData = (PIMAGE_IMPORT_BY_NAME)((SIZE_T)pHivemind + (SIZE_T)((*pShortThunkRef - directory->VirtualAddress) + ImportTableFileOffset));
					printf("Obfuscating %s in %s -> ", (bArch64) ? "x64" : "x86", &thunkData->Name);
					ApplyStream(stream, sizeof(stream), (unsigned char*)&thunkData->Name);
					printf("%s\n", &thunkData->Name);
				}

			}
		}
#endif

	}
	return;
}

void EncryptPointers(PIMAGE_HIVEMIND_HEADER pHivemind, DWORD dwKey)
{
	SIZE_T i;

	BOOL bArch64 = ((PIMAGE_HIVEMIND_NT_HEADER32)((SIZE_T)pHivemind + (SIZE_T)pHivemind->e_lfanew))->FileHeader.Machine == IMAGE_FILE_MACHINE_AMD64;

	PIMAGE_DATA_DIRECTORY directory = NULL;

	PIMAGE_NT_HEADERS32 pHed = (PIMAGE_NT_HEADERS32)((SIZE_T)pHivemind + (SIZE_T)pHivemind->e_lfanew);
	PIMAGE_HIVEMIND_NT_HEADER32 pHerHive = (PIMAGE_HIVEMIND_NT_HEADER32)((SIZE_T)pHivemind + (SIZE_T)pHivemind->e_lfanew);

	if (bArch64)
		directory = &((PIMAGE_NT_HEADERS64)((SIZE_T)pHivemind + (SIZE_T)pHivemind->e_lfanew))->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_BASERELOC];
	else
		directory = &((PIMAGE_NT_HEADERS32)((SIZE_T)pHivemind + (SIZE_T)pHivemind->e_lfanew))->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_BASERELOC];

	// найдем физическое смещение до нужной директории

	DWORD FileOffset = GetFileOffsetDirectory(directory, pHivemind, bArch64);


	if (directory->Size > 0)
	{
		PIMAGE_BASE_RELOCATION relocation = (PIMAGE_BASE_RELOCATION)((SIZE_T)pHivemind + FileOffset);

		for (; relocation->VirtualAddress > 0; )
		{
			IMAGE_DATA_DIRECTORY tmp;
			tmp.Size = 0;
			tmp.VirtualAddress = relocation->VirtualAddress;
	
			unsigned char *dest = (unsigned char*)((SIZE_T)pHivemind + GetFileOffsetDirectory(&tmp, pHivemind, bArch64));
			unsigned short *relInfo = (unsigned short *)((unsigned char *)relocation + IMAGE_SIZEOF_BASE_RELOCATION);

			for (i = 0; i < ((relocation->SizeOfBlock - IMAGE_SIZEOF_BASE_RELOCATION) / 2); i++, relInfo++)
			{
				DWORD *patchAddrHL;
				LONGLONG* patchAddrDIR64;

				int type, offset;

				type = *relInfo >> 12;
				offset = *relInfo & 0xfff;

				switch (type)
				{
				case IMAGE_REL_BASED_ABSOLUTE:
					break;
				case IMAGE_REL_BASED_DIR64:
					patchAddrDIR64 = (LONGLONG *)((SIZE_T)dest + (SIZE_T)offset);
				    //printf("Encrypting DIR64 ptr at 0x%x with 0x%x\n", patchAddrDIR64, dwKey);
					*patchAddrDIR64 ^= (LONGLONG)dwKey;

					break;
				case IMAGE_REL_BASED_HIGHLOW:
					patchAddrHL = (DWORD *)((SIZE_T)dest + (SIZE_T)offset);
					//printf("Encrypting HIGHLOW ptr 0x%x at 0x%x with 0x%x\n", *patchAddrHL, patchAddrHL, dwKey);
					*patchAddrHL ^= dwKey;
					break;


				default:
					break;
				}
			}

			relocation = (PIMAGE_BASE_RELOCATION)(((SIZE_T)relocation) + relocation->SizeOfBlock);
		}
	}
	


	return;
}

void EncryptEntryPoint(PIMAGE_HIVEMIND_HEADER pHivemind, DWORD dwKey, BOOL bArch64)
{
	
	if (bArch64)
	{
		PIMAGE_NT_HEADERS64 pNtHeaders64 = (PIMAGE_NT_HEADERS64)((SIZE_T)pHivemind + pHivemind->e_lfanew);
		pNtHeaders64->OptionalHeader.AddressOfEntryPoint ^= dwKey;
		printf("Encrypted x64 encrypoint using key %x\n", dwKey);
	}
	else
	{
		PIMAGE_NT_HEADERS32 pNtHeaders32 = (PIMAGE_NT_HEADERS32)((SIZE_T)pHivemind + pHivemind->e_lfanew);
		pNtHeaders32->OptionalHeader.AddressOfEntryPoint ^= dwKey;
		printf("Encrypted x86 encrypoint using key %x\n", dwKey);
	}

	return;
}

void ConvertHeaders(PIMAGE_DOS_HEADER lpModule)
{
	if (sizeof(IMAGE_HIVEMIND_HEADER) != sizeof(IMAGE_DOS_HEADER))
	{

		printf("ERROR! HEADER SIZE IMAGE_HIVEMIND != IMAGE_DOS_HEADER");
		Sleep(INFINITE);
	}
	BOOL bArch64 = ((PIMAGE_NT_HEADERS32)((SIZE_T)lpModule + (SIZE_T)lpModule->e_lfanew))->FileHeader.Machine == IMAGE_FILE_MACHINE_AMD64;

	IMAGE_HIVEMIND_HEADER imgHM;
	LPBYTE imgHMNT = (LPBYTE)((SIZE_T)lpModule + (SIZE_T)lpModule->e_lfanew);

	RtlSecureZeroMemory(&imgHM, sizeof(imgHM));

	imgHM.dwHiveSign1 = IMAGE_HIVEMIND_SIGNATURE_PART1;
	imgHM.dwHiveSign2 = IMAGE_HIVEMIND_SIGNATURE_PART2;
	imgHM.e_lfanew = lpModule->e_lfanew;
	RtlCopyMemory((LPBYTE)lpModule, (LPBYTE)&imgHM, sizeof(IMAGE_HIVEMIND_HEADER));

	// вайпнуть ненужный мусор между NT хидерами и концом DOS
	RtlSecureZeroMemory(&((LPBYTE)lpModule)[sizeof(IMAGE_DOS_HEADER)], imgHM.e_lfanew - sizeof(IMAGE_DOS_HEADER));
	
	if (bArch64)
		((PIMAGE_HIVEMIND_NT_HEADER64)imgHMNT)->Signature = IMAGE_HIVEMIND_NT_SIGNATURE;
	else
		((PIMAGE_HIVEMIND_NT_HEADER32)imgHMNT)->Signature = IMAGE_HIVEMIND_NT_SIGNATURE;

	return;

}

DWORD GenKey(BOOL bArch64, PIMAGE_HIVEMIND_HEADER pHivemind)
{
	DWORD dwKey = GetTickCount() % 0x1000 + 64;
	
	if (bArch64)
		((PIMAGE_NT_HEADERS64)((SIZE_T)pHivemind + (SIZE_T)pHivemind->e_lfanew))->OptionalHeader.CheckSum = dwKey;
	else
		((PIMAGE_NT_HEADERS32)((SIZE_T)pHivemind + (SIZE_T)pHivemind->e_lfanew))->OptionalHeader.CheckSum = dwKey;


	return dwKey;
}
