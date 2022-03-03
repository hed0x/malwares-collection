#pragma once

#include "global.hpp"

extern "C"
{
#include "crypto\ecrypt-sync.h"
}

typedef enum _evfs_status
{
	EVFS_STATUS_INIT_OK,
	EVFS_STATUS_INIT_ERROR,
	EVFS_STATUS_WRITE_OK,
	EVFS_STATUS_WRITE_UNKNOWN_ERROR,
	EVFS_STATUS_WRITE_LIMIT_ERROR, // больше нет места для записи
	EVFS_STATUS_READ_OK,
	EVFS_STATUS_READ_UNKNOWN_ERROR,
	EVFS_STATUS_READ_NOTFOUND_ERROR // файл не найден
} evfs_status_t;

class IEncryptedVirtualFS
{
public:
	virtual ~IEncryptedVirtualFS() = default;

	// инициализирует evfs
	virtual evfs_status_t init() = 0;
	// задать путь вызывающим кодом
	virtual evfs_status_t init(PWCHAR pwPath) = 0;
	// добавляет в evfs файл
	// dwFileName - имя файла в DWORD
	// pblFileBuffer - записываемый буффер
	virtual evfs_status_t write(DWORD dwFileName, blob *pblFileBuffer) = 0;
	// dwFileName - имя файла
	// pblFileBuffer_out - запишет сюда поинтер на нововыделенную память с файлом
	virtual evfs_status_t read_by_name(DWORD dwFileName, blob *pblFileBuffer) = 0;
	// iIndex - индекс файла
	// pblFileBuffer_out - запишет сюда поинтер на нововыделенную память с файлом
	virtual evfs_status_t read_by_index(UINT iIndex, blob *pblFileBuffer) = 0;
	// вернет количество файлов, верхний номер индекса = количество файлов - 1 (индексация с 0)
	virtual UINT amount() = 0;
	// вернет метаданные файла (имя, офсеты, размер и тд) по его индексу. Нужно для итерации по evfs
	// pdwOutSize - принимает размер структуры на которую указывает указатель
	virtual PVOID get_metadata(UINT iIndex, PSIZE_T pdwOutSize) = 0;
};

#pragma pack(1)
struct _hmvfs_fileheader
{
	// TRUE - значит есть более новая версия с таким же именем
	BOOL bFileOutdated;
	// ключ шифрования данных файла
	unsigned char filedata_key[ECRYPT_MAXKEYSIZE / 8];
	// размер файла
	DWORD dwFileSize;
	// оффсет до файла
	DWORD dwFileOffset;
	// дворд-имя файла
	DWORD dwFileName;
};
#pragma pack()

#define HIVEMIND_VFS_FILES_LIMIT 256
#define HIVEMIND_VFS_MAXPATH 4096
#define HIVEMIND_VFS_MAXSIZE 4 * 1024 * 1024 * 1024 // 4 GB

#pragma pack(1)
struct _hivemind_vfs_header
{
	// ключ для расшифровки массива файловых хидеров
	unsigned char fileheader_key[ECRYPT_MAXKEYSIZE / 8];
	_hmvfs_fileheader fileheaders[HIVEMIND_VFS_FILES_LIMIT];
};
#pragma pack()

// evfs для хранения модулей
class HivemindModuleStorageSystem : public IEncryptedVirtualFS
{
public:
	HivemindModuleStorageSystem();
	~HivemindModuleStorageSystem();

	// прочтет и расшифрует хидеры evfs в память екземпляра класса
	evfs_status_t init();
	// явно задать путь вызывающим кодом
	evfs_status_t init(PWCHAR pwPath);
	// добавит в evfs новый файл. Если файлы с таким именем уже есть, то установит bFileOutdated в TRUE в их метаданных, 
	// говоря о том, что данный файл уже устаревший и имеется новая версия
	evfs_status_t write(DWORD dwFileName, blob *pblFileBuffer);
	// прочтет файл с данным именем
	evfs_status_t read_by_name(DWORD dwFileName, blob *pblFileBuffer);
	// чтение по индексу
	evfs_status_t read_by_index(UINT iIndex, blob *pblFileBuffer);
	UINT amount();
	// возвращает указатель на конкретный _fileheader
	PVOID get_metadata(UINT iIndex, PSIZE_T pdwOutSize);

protected:
	// pvfs_header и blFileHeadersDecryptedArray заполняются при инициализации vfs в последствии изменяясь после каждого write (соответственно меняются заголовки
	// write изменяет blFileHeadersDecryptedArray (добавляя новое значение метаданных), после чего обновляет pvfs_header через шифрование blFileHeadersDecryptedArray и записывает новые заголовки в файл
	// vfs_header в сыром виде
	_hivemind_vfs_header *pvfs_header;
	// указатель на массив _hmvfs_fileheader расшифрованный
	blob blFileHeadersDecryptedArray;
	// количество файлов
	UINT iFiles; 
	PWCHAR pwFilePath;

private:
	// получает путь до VFS и кладет в pwFilePath
	BOOL retrieve_vfs_path();

	BOOL read_from_file(PWCHAR pwFilePath, SIZE_T dwAmountRead, SIZE_T dwFileOffset, LPBYTE lpOutBuffer);
	// lpNewFilePointer - поинтер куда данные были дописаны
	BOOL write_to_file(PWCHAR pwFilePath, SIZE_T dwAmountWrite, LPBYTE lpDataBuffer, SIZE_T dwFileOffset, DWORD dwMoveMethod, PLARGE_INTEGER lpNewFilePointer);
	BOOL is_file_exist(PWCHAR pwFilePath);
	BOOL create_vfs_container(PWCHAR pwFilePath);

	VOID gen_timebased_key(LPBYTE lpKey, SIZE_T dwKeyLen);

	VOID vfs_encrypt(LPBYTE lpBufferRaw, SIZE_T dwBufferSize, LPBYTE lpBufferOutput, LPBYTE lpKey);
	VOID vfs_decrypt(LPBYTE lpBufferRaw, SIZE_T dwBufferSize, LPBYTE lpBufferOutput, LPBYTE lpKey);

	VOID set_all_outdated(DWORD dwFileName);
};