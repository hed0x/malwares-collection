#pragma once

#include "global.hpp"

void identification_init();

namespace sync
{
	typedef enum _sync_type
	{
		SYNC_INFECTOR,
		SYNC_BOT
	} sync_type_t;

	// создаст мьютекс и подождет ownership, так, чтобы одновременно выполнялся лишь один инстанс
	// FALSE - неудачно. Либо такой мьютекс уже существует, но к нему нет доступа, либо любая другая ошибка.
	// TRUE - мьютекс был создан / открыт удачно и по возвращению из функции мы единственный инстанс бота/инфектора, который выполняется
	// hOutHandle - открытый хендл если он != nullptr
	BOOL CreateMutexAndWait(sync_type_t sync_type, PHANDLE hOutHandle);
}