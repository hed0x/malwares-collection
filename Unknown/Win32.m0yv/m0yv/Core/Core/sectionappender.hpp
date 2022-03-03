#pragma once

#include "global.hpp"

namespace appender
{
	// результат работы аппендера
	struct appender_status
	{
		// RVA начала данных прибавленных к файлу
		DWORD32 BeginDataRVA;
		// файловый оффсет начала данных прибавленных к файлу
		DWORD32 BeginDataFileOffset;
		// размер данных
		DWORD32 dwDataSize;
		// новый размер модуля
		DWORD32 NewImageSize; 
	};

	// добавляет к последней секции указанные данные, фиксит PE хидеры и возвращает RVA начала добавленных данных 
	// все функции принимают указатель на хэндл файла, все действие производится через SetFilePointerEx для того чтобы была возможность
	// работы с большими файлами
	class LastSectionAppender
	{
	public:
		LastSectionAppender() = default;
		~LastSectionAppender() = default;
		// изменяет аттрибуты у последней секции
		BOOL set_attributes(HANDLE hFile, DWORD dwAttribute, DWORD dwArch);
		// расширяет физический и виртуальный размер последней секции на dwDataSize, фиксит заголовки и пишет в расширенное место lpDataBuffer 
		// в status возвращает RVA начала записанных данных
		// bDoNotWrite - если стоит в TRUE, то функция возвращается ДО записи и расширения секции, считая только outStatus
		BOOL append_data(HANDLE hFile, LPBYTE lpDataBuffer, SIZE_T dwDataSize, appender_status *outStatus, DWORD dwArch, BOOL bDoNotWrite);
		// удаляет подпись, отключает CFG и опционально удаляет релоки отключая ASLR
		BOOL disable_security(HANDLE hFile, DWORD dwArch, BOOL bDisableRelocs);
	private:
		PIMAGE_SECTION_HEADER get_last_section(PIMAGE_DOS_HEADER pDosHeader, DWORD dwArch);
		DWORD get_aligments(PIMAGE_DOS_HEADER pDosHeader, PDWORD dwSectionAlign, PDWORD dwFileAlign, DWORD dwArch);
		DWORD fix_imagesize(PIMAGE_DOS_HEADER pDosHeader, DWORD dwNewSize, DWORD dwArch);
	};
}