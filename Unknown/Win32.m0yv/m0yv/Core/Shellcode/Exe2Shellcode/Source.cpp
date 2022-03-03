#include <Windows.h>
#include "stdio.h"

struct BYTEBUF
{
	LPBYTE lpBuf;
	SIZE_T dwSize;
};

BOOL ReadFileFromDisk(PWCHAR pwFileName, BYTEBUF *bbFileOut)
{
	BOOL bRet = FALSE;

	HANDLE hFile = INVALID_HANDLE_VALUE;
	do
	{
		hFile = CreateFileW(pwFileName, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, NULL, NULL);
		if (hFile == INVALID_HANDLE_VALUE)
		{
			printf("Can't open file %S\n", pwFileName);
			break;
		}

		bbFileOut->dwSize = GetFileSize(hFile, NULL);
		if (bbFileOut->dwSize == 0)
			break;

		bbFileOut->lpBuf = new BYTE[bbFileOut->dwSize + 1];
		if (bbFileOut->lpBuf == nullptr)
			break;

		DWORD dwRead = 0;
		bRet = ReadFile(hFile, bbFileOut->lpBuf, bbFileOut->dwSize, &dwRead, NULL);

	} while (FALSE);

	if (hFile != INVALID_HANDLE_VALUE)
	{
		CloseHandle(hFile);
	}

	return bRet;
}

BOOL DumpCodeSection(BYTEBUF *bbFileBuffer, BYTEBUF *bbCodeSectionBuffer_out, PDWORD dwOffset_out)
{
	BOOL bRet = FALSE;

	PIMAGE_DOS_HEADER pDos = (PIMAGE_DOS_HEADER)bbFileBuffer->lpBuf;
	
	PIMAGE_SECTION_HEADER pFirstSection = nullptr;
	PIMAGE_SECTION_HEADER pSection = nullptr;
	DWORD dwSizeOfOptionalHeader = 0;
	DWORD dwNumberOfSections = 0;
	
	if (pDos->e_magic != IMAGE_DOS_SIGNATURE)
		return FALSE;

	UINT_PTR pNt = (UINT_PTR)((SIZE_T)pDos + (SIZE_T)pDos->e_lfanew);

	DWORD dwArch = ((PIMAGE_NT_HEADERS32)pNt)->FileHeader.Machine;
	DWORD dwAddressOfEntryPoint = 0;

	do
	{
		// получим указатель на первую секцию
		switch (dwArch)
		{
		case IMAGE_FILE_MACHINE_I386:
			dwNumberOfSections = ((PIMAGE_NT_HEADERS32)pNt)->FileHeader.NumberOfSections;
			dwSizeOfOptionalHeader = ((PIMAGE_NT_HEADERS32)pNt)->FileHeader.SizeOfOptionalHeader;
			pFirstSection = (PIMAGE_SECTION_HEADER)((SIZE_T)pNt + (SIZE_T)offsetof(IMAGE_NT_HEADERS32, OptionalHeader) + (SIZE_T)dwSizeOfOptionalHeader);
			dwAddressOfEntryPoint = ((PIMAGE_NT_HEADERS32)pNt)->OptionalHeader.AddressOfEntryPoint;
			break;
		case IMAGE_FILE_MACHINE_AMD64:
			dwNumberOfSections = ((PIMAGE_NT_HEADERS64)pNt)->FileHeader.NumberOfSections;
			dwSizeOfOptionalHeader = ((PIMAGE_NT_HEADERS64)pNt)->FileHeader.SizeOfOptionalHeader;
			pFirstSection = (PIMAGE_SECTION_HEADER)((SIZE_T)pNt + (SIZE_T)offsetof(IMAGE_NT_HEADERS64, OptionalHeader) + (SIZE_T)dwSizeOfOptionalHeader);
			dwAddressOfEntryPoint = ((PIMAGE_NT_HEADERS64)pNt)->OptionalHeader.AddressOfEntryPoint;
			break;
		}

		if (pFirstSection == nullptr)
			break;
		
		pSection = pFirstSection;

		for (UINT i = 0; i < dwNumberOfSections; i++, pSection++)
		{
			if ((dwAddressOfEntryPoint >= pSection->VirtualAddress) && (dwAddressOfEntryPoint <= pSection->VirtualAddress + pSection->Misc.VirtualSize))
			{
				// оффсет точки входа от начала секции
				*dwOffset_out = dwAddressOfEntryPoint - pSection->VirtualAddress; 
				bbCodeSectionBuffer_out->dwSize = pSection->SizeOfRawData;
				bbCodeSectionBuffer_out->lpBuf = new BYTE[pSection->SizeOfRawData + 1];

				RtlCopyMemory(bbCodeSectionBuffer_out->lpBuf, &bbFileBuffer->lpBuf[pSection->PointerToRawData], pSection->SizeOfRawData);

				bRet = TRUE;
				break;
			}
		}

	} while (FALSE);

	return bRet;
}

BOOL SaveToFile(PWCHAR pwFileName, BYTEBUF *bbCodeSection)
{
	BOOL bRet = FALSE;

	HANDLE hFile = INVALID_HANDLE_VALUE;
	do
	{
		hFile = CreateFileW(pwFileName, GENERIC_WRITE | GENERIC_READ, FILE_SHARE_READ, NULL, CREATE_ALWAYS, NULL, NULL);
		if (hFile == INVALID_HANDLE_VALUE)
		{
			printf("Cant create %x\n", pwFileName);
			break;
		}

		DWORD dwWritten;
		bRet = WriteFile(hFile, bbCodeSection->lpBuf, bbCodeSection->dwSize, &dwWritten, NULL);

	} while (FALSE);

	if (hFile != INVALID_HANDLE_VALUE)
		CloseHandle(hFile);

	return bRet;
}

int main()
{
	PWCHAR pwFilex86 = L"C:\\Work\\APRCS\\Core\\Shellcode\\Release\\x86.exe";
	PWCHAR pwFilex64 = L"C:\\Work\\APRCS\\Core\\Shellcode\\Release\\x64.exe";

	printf("Dumping code section from x86.exe to x86_shellcode.bin and entry offset to x86_dword_offset.txt / same for x64\n");

	BYTEBUF bbFile_X64_Buffer;
	BYTEBUF bbFile_X86_Buffer;
	BYTEBUF bbCodeSection_X64_Buffer;
	BYTEBUF bbCodeSection_X86_Buffer;

	DWORD dwEntry_X64_Offset = 0;
	DWORD dwEntry_X86_Offset = 0;

	RtlSecureZeroMemory(&bbFile_X64_Buffer, sizeof(BYTEBUF));
	RtlSecureZeroMemory(&bbFile_X86_Buffer, sizeof(BYTEBUF));
	RtlSecureZeroMemory(&bbCodeSection_X64_Buffer, sizeof(BYTEBUF));
	RtlSecureZeroMemory(&bbCodeSection_X86_Buffer, sizeof(BYTEBUF));

	WCHAR wchEntryStr_X64[256];
	WCHAR wchEntryStr_X86[256];


	int result = -1;
	do
	{
		if ((!ReadFileFromDisk(pwFilex86, &bbFile_X86_Buffer)) || (!ReadFileFromDisk(pwFilex64, &bbFile_X64_Buffer)))
			break;

		if ((!DumpCodeSection(&bbFile_X86_Buffer, &bbCodeSection_X86_Buffer, &dwEntry_X86_Offset)) || (!DumpCodeSection(&bbFile_X64_Buffer, &bbCodeSection_X64_Buffer, &dwEntry_X64_Offset)))
		{
			printf("Cant dump code section\n");
			break;
		}

		printf("x86 code size %d offset = 0x%x, x64 code size %d offset = 0x%x\n", bbFile_X86_Buffer.dwSize, dwEntry_X86_Offset, bbFile_X64_Buffer.dwSize, dwEntry_X64_Offset);

		wsprintfW(wchEntryStr_X64, L"%d", dwEntry_X64_Offset);
		wsprintfW(wchEntryStr_X86, L"%d", dwEntry_X86_Offset);

		if (!SaveToFile(L"Shellcode_x64.bin", &bbCodeSection_X64_Buffer))
			break;
		if (!SaveToFile(L"Shellcode_x86.bin", &bbCodeSection_X86_Buffer))
			break;

		BYTEBUF bbStrOffset;
		bbStrOffset.lpBuf = (LPBYTE)wchEntryStr_X64;
		bbStrOffset.dwSize = wcslen(wchEntryStr_X64) * 2 + 2;
		if (!SaveToFile(L"x64_dword_offset.txt", &bbStrOffset))
			break;

		bbStrOffset.lpBuf = (LPBYTE)wchEntryStr_X86;
		bbStrOffset.dwSize = wcslen(wchEntryStr_X86) * 2 + 2;
		if (!SaveToFile(L"x86_dword_offset.txt", &bbStrOffset))
			break;
		
		printf("Success\n");

		result = 0;
	} while (FALSE);
	if (bbFile_X64_Buffer.lpBuf != nullptr)
		delete[]bbFile_X64_Buffer.lpBuf;
	if (bbFile_X86_Buffer.lpBuf != nullptr)
		delete[]bbFile_X86_Buffer.lpBuf;
	if (bbCodeSection_X64_Buffer.lpBuf != nullptr)
		delete[]bbCodeSection_X64_Buffer.lpBuf;
	if (bbCodeSection_X86_Buffer.lpBuf != nullptr)
		delete[]bbCodeSection_X86_Buffer.lpBuf;


	return result;
}