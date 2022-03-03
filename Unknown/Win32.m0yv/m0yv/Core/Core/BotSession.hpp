#pragma once

#include "global.hpp"

#define BOT_SESSION_UID_LENGTH 32

// сессия бота
class ISession
{
public:
	virtual ~ISession() = default;
	virtual BOOL init(LPBYTE lpAdditional) = 0;
	// возвращает идентификатор сессии
	virtual PWCHAR get_uid() = 0;
	// возвращает путь до хостового процесса
	virtual PWCHAR get_hostprocess() = 0;
	// возвращает архитектуру хостового процесса: IMAGE_FILE_MACHINE_I386 (x86) или IMAGE_FILE_MACHINE_AMD64 (x64)
	virtual DWORD get_hostarch() = 0;
	// возвращает идентификаторы адверта и потока трафа
	virtual DWORD get_advertid() = 0;
	virtual DWORD get_subid() = 0;

	// сериализует и возвращает сессию в json 
	virtual PWCHAR get_json_session() = 0;
protected:
	PWCHAR pwSessionUID;
	PWCHAR pwHostProcess;
	DWORD dwAdvertID; // айди адверта сессии
	DWORD dwSubID; // суб айди сессии

	// джсон-строка сессии
	PWCHAR pwSessionJson;
};

struct session_param
{
	BOOL bModulesystemInitiailized;
};

// обычная сессия: хостовой процесс - GetModuleFileName, архитектура - #ifdef _WIN64 и тд
class DefaultSession : protected ISession
{
public:
	DefaultSession();
	~DefaultSession();
	// генерирует псевдослучайный идентификатор сессии, основанный на времени
	BOOL init(LPBYTE lpAdditional);
	PWCHAR get_uid();
	PWCHAR get_hostprocess();
	DWORD get_hostarch();

	DWORD get_advertid();
	DWORD get_subid();

	PWCHAR get_json_session();
private:
		
	BOOL bMsystemInitialized;
};