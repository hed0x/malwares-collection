#pragma once

#include "global.hpp"
#include <AclAPI.h>
#include <sddl.h>

// интерфейс менеджера доступов, нужен для реализации классов по работе с правами доступа
class IAccessManager
{
public:
	virtual ~IAccessManager() = default;
	// инициализация AccessManager'а
	virtual BOOL init(PWCHAR pwFileObject, DWORD dwFlags) = 0;
	// получает доступ к объекту
	virtual BOOL get(DWORD dwFlags) = 0; 
	// возвращает предыдущие права доступа к объекту
	virtual BOOL revert() = 0;
};

// позволяет получить доступ через изменение DACL и взятия ownership
// для взятия ownership требуется SE_TAKE_OWNERSHIP_NAME
class FileSecurityManager : public IAccessManager
{
public:
	~FileSecurityManager();
	FileSecurityManager();

	// инициализирует внутренние структуры - получает через GetNamedSecurityInfo нужные поля и запоминает для последующего revert
	BOOL init(PWCHAR pwFileObject, DWORD dwFlags);
	// если возможно получает полный доступ к файлу через взятие ownership и установку DACL 
	BOOL get(DWORD dwFlags);
	// возвращает предыдущие SECURITY_INFORMATION файлу
	BOOL revert();

protected:
	PSID pSidOwner;
	PSID pSidGroup;
	PACL pDacl;
	PACL pSacl;
	PSECURITY_DESCRIPTOR pSecurityDescriptor;
	// revert делается исходя из того что было передано в init, а не в get
	DWORD dwRevertFlags;
	PWCHAR pwFilePath;

private:
#ifdef _DEBUG
	void print_debug(DWORD dwRet);
#endif

	// открывает токен текущего потока считает SID владельца новых создаваемых объектов, сохраняя результат в pOwnerSid
	// для освобождения - delete[]
	BOOL getownersid(TOKEN_OWNER **pptokownerSid);
};

namespace access_api
{
	BOOL SetPrivilege(LPWSTR Privilege, BOOL bEnablePrivilege);
	HANDLE GetCurrentToken(DWORD dwAccessFlags);
}