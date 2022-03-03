#pragma once
#include "global.h"

#define IMAGE_SIZEOF_BASE_RELOCATION         8

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

void EncryptPointers(PIMAGE_HIVEMIND_HEADER pHivemind, DWORD dwKey);
void EncryptEntryPoint(PIMAGE_HIVEMIND_HEADER pHivemind, DWORD dwKey, BOOL bArch64);
void EncryptImportNames(PIMAGE_HIVEMIND_HEADER pHivemind, DWORD dwKey, BOOL bArch64);
void ConvertHeaders(PIMAGE_DOS_HEADER lpModule);
DWORD GenKey(BOOL bArch64, PIMAGE_HIVEMIND_HEADER pHivemind);