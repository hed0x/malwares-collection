#pragma once

#include "global.hpp"

namespace search_api
{
	// коллбек вызываемый при каждом файле
	// @pwFilePath - путь до файла
	// @pfnd - структура, содержащая информацию о найденном файле
	// @lpParameter - блоб, указывающий на дополнительные параметры
	// dwParameterSize - размер параметров
	typedef DWORD(CALLBACK *fnSearchCallback)(PWCHAR pwFilePath, PWIN32_FIND_DATAW pfnd, LPBYTE lpParameter, SIZE_T dwParameterSize);
	// рекурсивный поиск файлов, принимает один параметр для совместимости с LPTHREAD_START_ROUTINE
	// @pwEntrySearch - входная директория для поиска, также может быть UNC путем
	// @onFound - указатель на функцию, которая вызывается как только нашли любой файл
	// @lpParameter - передается коллбеку
	// @dwParameterSize - передается коллбеку
	// @bUseBlacklist - использовать ли логику исключений папок для поиска
	// @bExitThread - если TRUE то в конце своей работы функция завершает поток, иначе просто ретерн
	// при TRUE - удаляет lpParameter при помощи delete
	struct search_parameter
	{
		PWCHAR pwEntrySearch;
		fnSearchCallback onFound;
		LPBYTE lpParameter;
		SIZE_T dwParameterSize;
		BOOL bUseBlacklist;
		BOOL bExitThread;
	};
	DWORD WINAPI search(search_parameter *lpParameter);
}