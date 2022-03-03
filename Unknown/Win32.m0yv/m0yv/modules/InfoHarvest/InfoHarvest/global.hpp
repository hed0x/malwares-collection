#pragma once

// имя модуля цифровое - для админки и для EVFS-контейнера
#define HIVEMIND_MODULE_DWORD_NAME 0x01

#ifndef _CRT_SECURE_NO_WARNINGS
#define _CRT_SECURE_NO_WARNINGS
#endif

#ifndef _UNICODE
#define _UNICODE
#endif

//#define _DEBUG

#ifdef _DEBUG // для дебаг вывода
#define MODULE_NAME_STR L"InfoHarvest"
#define FILELOG_NAME_STR L"InfoHarvest.log"
#endif

#include <Windows.h>
#include "..\..\..\common\module_data.hpp"


void *operator new(size_t size);
void operator delete(void *p);

struct blob
{
	LPBYTE lpBuffer;
	SIZE_T dwBufSize;
};

namespace global_data
{
	extern module_data::msys_context *ctx;
}

#include "myWriteLog.h"
