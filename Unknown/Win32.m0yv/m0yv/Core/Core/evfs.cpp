#include "evfs.hpp"
#include "utils.hpp"
#include "strings.hpp"

HivemindModuleStorageSystem::HivemindModuleStorageSystem()
{
	this->iFiles = 0;
	this->pwFilePath = nullptr;
	this->pvfs_header = nullptr;
	RtlSecureZeroMemory(&this->blFileHeadersDecryptedArray, sizeof(this->blFileHeadersDecryptedArray));
}

HivemindModuleStorageSystem::~HivemindModuleStorageSystem()
{
	if (this->pwFilePath != nullptr)
	{
		delete[]this->pwFilePath;
		this->pwFilePath = nullptr;
	}
	if (this->pvfs_header != nullptr)
	{
		delete this->pvfs_header;
		this->pvfs_header = nullptr;
	}
	if (this->blFileHeadersDecryptedArray.lpBuffer != nullptr)
	{
		delete[]this->blFileHeadersDecryptedArray.lpBuffer;
		RtlSecureZeroMemory(&this->blFileHeadersDecryptedArray, sizeof(this->blFileHeadersDecryptedArray));
	}
}

evfs_status_t HivemindModuleStorageSystem::init()
{
	evfs_status_t status = evfs_status_t::EVFS_STATUS_INIT_ERROR;
	do
	{
		if ((!this->retrieve_vfs_path()) || (this->pwFilePath == nullptr))
		{
#ifdef _DEBUG
			WriteLog(L"[HivemindModuleStorageSystem::init] error cant retrieve vfs path");
#endif
			break;
		}

#ifdef _DEBUG
		WriteLog(L"[HivemindModuleStorageSystem::init] vfs path: ", this->pwFilePath);
#endif

		if (this->is_file_exist(this->pwFilePath) == FALSE)
		{
#ifdef _DEBUG
			WriteLog(L"[HivemindModuleStorageSystem::init] file doesnt exist, initializing new VFS container");
#endif
			if (this->create_vfs_container(this->pwFilePath))
				status = evfs_status_t::EVFS_STATUS_INIT_OK;
			break;
		}

		// иначе контейнер уже существует - прочитаем в память и декодируем vfs

		this->pvfs_header = new _hivemind_vfs_header;
		if (this->pvfs_header == nullptr)
			break;

		RtlSecureZeroMemory(this->pvfs_header, sizeof(_hivemind_vfs_header));

		this->blFileHeadersDecryptedArray.dwBufSize = sizeof(_hmvfs_fileheader) * HIVEMIND_VFS_FILES_LIMIT;
		this->blFileHeadersDecryptedArray.lpBuffer = (LPBYTE)new _hmvfs_fileheader[HIVEMIND_VFS_FILES_LIMIT];
		if (this->blFileHeadersDecryptedArray.lpBuffer == nullptr)
			break;

		RtlSecureZeroMemory(this->blFileHeadersDecryptedArray.lpBuffer, this->blFileHeadersDecryptedArray.dwBufSize);
		if (!this->read_from_file(this->pwFilePath, sizeof(_hivemind_vfs_header), NULL, (LPBYTE)this->pvfs_header))
			break;

		this->vfs_decrypt((LPBYTE)this->pvfs_header->fileheaders, this->blFileHeadersDecryptedArray.dwBufSize, this->blFileHeadersDecryptedArray.lpBuffer, this->pvfs_header->fileheader_key);
		
		status = evfs_status_t::EVFS_STATUS_INIT_OK;
		this->iFiles = this->amount();

	} while (FALSE);

	return status;
}

evfs_status_t HivemindModuleStorageSystem::init(PWCHAR pwPath)
{
	if (pwPath != nullptr)
	{
		UINT uLen = wcslen(pwPath) + 1;
		this->pwFilePath = new WCHAR[uLen + 1];
		if (this->pwFilePath != nullptr)
		{
			RtlSecureZeroMemory(this->pwFilePath, uLen * sizeof(WCHAR));
			wcscpy(this->pwFilePath, pwPath);
		}
	}
	return this->init();
}

evfs_status_t HivemindModuleStorageSystem::write(DWORD dwFileName, blob * pblFileBuffer)
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
#endif
	evfs_status_t status = evfs_status_t::EVFS_STATUS_WRITE_UNKNOWN_ERROR;

	if ((this->blFileHeadersDecryptedArray.lpBuffer == nullptr)
		|| (this->blFileHeadersDecryptedArray.dwBufSize < (HIVEMIND_VFS_FILES_LIMIT * sizeof(_hmvfs_fileheader)))
		|| (pblFileBuffer == nullptr)
		|| (this->pwFilePath == nullptr)
		|| (this->pvfs_header == nullptr)
		|| (pblFileBuffer->lpBuffer == nullptr)
		|| (pblFileBuffer->dwBufSize == 0))
	{
#ifdef _DEBUG
		WriteLog(L"[HivemindModuleStorageSystem::write] invalid parameters");
#endif
		return status;
	}

	LPBYTE lpEncryptedBuffer = nullptr;
	LARGE_INTEGER liNewFilePointer;
	RtlSecureZeroMemory(&liNewFilePointer, sizeof(liNewFilePointer));
	do
	{
		if ((this->iFiles + 1) > HIVEMIND_VFS_FILES_LIMIT)
		{
#ifdef _DEBUG
			WriteLog(L"[HivemindModuleStorageSystem::write] error vfs files limit reached");
#endif
			status = evfs_status_t::EVFS_STATUS_WRITE_LIMIT_ERROR;
			break;
		}

		_hmvfs_fileheader *pFileHeader = &((_hmvfs_fileheader*)this->blFileHeadersDecryptedArray.lpBuffer)[this->iFiles];
		if ((pFileHeader->dwFileOffset) || (pFileHeader->dwFileSize))
		{
#ifdef _DEBUG
			WriteLog(L"[HivemindModuleStorageSystem::write] critical error *BUG* - rewriting existing file");
#endif
			break;
		}

		lpEncryptedBuffer = new BYTE[pblFileBuffer->dwBufSize];
		if (lpEncryptedBuffer == nullptr)
			break;

		// добавим метаданные 
		pFileHeader->dwFileName = dwFileName;
		pFileHeader->dwFileSize = pblFileBuffer->dwBufSize;
		this->gen_timebased_key(pFileHeader->filedata_key, sizeof(_hmvfs_fileheader::filedata_key));
		this->vfs_encrypt(pblFileBuffer->lpBuffer, pblFileBuffer->dwBufSize, lpEncryptedBuffer, pFileHeader->filedata_key);

		if (!this->write_to_file(this->pwFilePath, pFileHeader->dwFileSize, lpEncryptedBuffer, 0, FILE_END, &liNewFilePointer))
		{
#ifdef _DEBUG
			WriteLog(L"[HivemindModuleStorageSystem::write] error cant write encrypted blob to file");
#endif
			break;
		}

		pFileHeader->dwFileOffset = (DWORD)liNewFilePointer.QuadPart;

		// поставим всем файлам с данным именем outdated флаг кроме новодобавленного (так как он последний, а iFiles до сих пор старое значение, то он будет вне полного прохода
		this->set_all_outdated(pFileHeader->dwFileName);

		// зашифруем по новой все метаданные 
		this->vfs_encrypt(this->blFileHeadersDecryptedArray.lpBuffer, this->blFileHeadersDecryptedArray.dwBufSize, (LPBYTE)this->pvfs_header->fileheaders, this->pvfs_header->fileheader_key);

		// обновим заголовки содержащие новый файл
		if (this->write_to_file(this->pwFilePath, sizeof(_hivemind_vfs_header), (LPBYTE)this->pvfs_header, NULL, FILE_BEGIN, NULL))
		{
			status = evfs_status_t::EVFS_STATUS_WRITE_OK;
			// добавили успешно
			this->iFiles++;
#ifdef _DEBUG
			wsprintfW(debugOut, L"[HivemindModuleStorageSystem::write] Wrote %d bytes of 0x%x file at offset 0x%x", pFileHeader->dwFileSize, pFileHeader->dwFileName, pFileHeader->dwFileOffset);
			WriteLog(debugOut);
#endif
		}

	} while (FALSE);

	if (lpEncryptedBuffer != nullptr)
	{
		delete[]lpEncryptedBuffer;
		lpEncryptedBuffer = nullptr;
	}

	return status;
}

evfs_status_t HivemindModuleStorageSystem::read_by_name(DWORD dwFileName, blob * pblFileBuffer)
{
	evfs_status_t status = evfs_status_t::EVFS_STATUS_READ_UNKNOWN_ERROR;
	if ((this->blFileHeadersDecryptedArray.lpBuffer == nullptr)
		|| (this->blFileHeadersDecryptedArray.dwBufSize < (HIVEMIND_VFS_FILES_LIMIT * sizeof(_hmvfs_fileheader)))
		|| (pblFileBuffer == nullptr)
		|| (this->pwFilePath == nullptr)
		|| (this->pvfs_header == nullptr))
	{
#ifdef _DEBUG
		WriteLog(L"[HivemindModuleStorageSystem::read_by_name] invalid parameters");
#endif
		return status;
	}

	BOOL bFound = FALSE;
	_hmvfs_fileheader *pFileHeader = &((_hmvfs_fileheader*)this->blFileHeadersDecryptedArray.lpBuffer)[0];
	UINT iIndex = 0;
	do
	{
		for (; iIndex < this->iFiles; iIndex++, pFileHeader++)
		{
			if ((pFileHeader->dwFileName == dwFileName) && (!pFileHeader->bFileOutdated))
			{
				bFound = TRUE;
				break;
			}
		}

		if (!bFound)
		{
#ifdef _DEBUG
			WriteLog(L"[HivemindModuleStorageSystem::read_by_name] cant find up to date file with this name");
#endif
			status = evfs_status_t::EVFS_STATUS_READ_NOTFOUND_ERROR;
			break;
		}

		status = this->read_by_index(iIndex, pblFileBuffer);

	} while (FALSE);

	return status;
}

evfs_status_t HivemindModuleStorageSystem::read_by_index(UINT iIndex, blob * pblFileBuffer)
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
#endif

	evfs_status_t status = evfs_status_t::EVFS_STATUS_READ_UNKNOWN_ERROR;
	if ((iIndex > HIVEMIND_VFS_FILES_LIMIT)
		|| (this->blFileHeadersDecryptedArray.lpBuffer == nullptr)
		|| (this->blFileHeadersDecryptedArray.dwBufSize < (HIVEMIND_VFS_FILES_LIMIT * sizeof(_hmvfs_fileheader)))
		|| (pblFileBuffer == nullptr)
		|| (this->pwFilePath == nullptr)
		|| (this->pvfs_header == nullptr))
	{
#ifdef _DEBUG
		WriteLog(L"[HivemindModuleStorageSystem::read_by_index] invalid parameters");
#endif
		return status;
	}

	_hmvfs_fileheader *pFileHeader = &((_hmvfs_fileheader*)this->blFileHeadersDecryptedArray.lpBuffer)[iIndex];
	LPBYTE lpEncryptedBuffer = nullptr;
	do
	{
		if ((pFileHeader->dwFileSize == 0) || (pFileHeader->dwFileOffset == 0))
		{
#ifdef _DEBUG
			WriteLog(L"[HivemindModuleStorageSystem::read_by_index] cant find file with this index");
#endif
			status = evfs_status_t::EVFS_STATUS_READ_NOTFOUND_ERROR;
			break;
		}

		pblFileBuffer->dwBufSize = pFileHeader->dwFileSize;
		pblFileBuffer->lpBuffer = new BYTE[pblFileBuffer->dwBufSize + 1];
		if (pblFileBuffer->lpBuffer == nullptr)
			break;
		
		lpEncryptedBuffer = new BYTE[pblFileBuffer->dwBufSize + 1];
		if (lpEncryptedBuffer == nullptr)
			break;

		RtlSecureZeroMemory(pblFileBuffer->lpBuffer, pblFileBuffer->dwBufSize);

		if (this->read_from_file(this->pwFilePath, pFileHeader->dwFileSize, pFileHeader->dwFileOffset, lpEncryptedBuffer))
		{
			status = evfs_status_t::EVFS_STATUS_READ_OK;
			this->vfs_decrypt(lpEncryptedBuffer, pFileHeader->dwFileSize, pblFileBuffer->lpBuffer, pFileHeader->filedata_key);
#ifdef _DEBUG
			wsprintfW(debugOut, L"[HivemindModuleStorageSystem::read_by_index] read 0x%x file with size %d bytes from 0x%x offset", pFileHeader->dwFileName, pFileHeader->dwFileSize, pFileHeader->dwFileOffset);
			WriteLog(debugOut);
#endif
		}

	} while (FALSE);

	if (lpEncryptedBuffer != nullptr)
	{
		delete[]lpEncryptedBuffer;
		lpEncryptedBuffer = nullptr;
	}

	return status;
}

UINT HivemindModuleStorageSystem::amount()
{
	if ((this->blFileHeadersDecryptedArray.lpBuffer == nullptr) || (this->blFileHeadersDecryptedArray.dwBufSize < (HIVEMIND_VFS_FILES_LIMIT * sizeof(_hmvfs_fileheader))))
	{
#ifdef _DEBUG
		WriteLog(L"[HivemindModuleStorageSystem::amount] invalid buffer");
#endif
		return 0;
	}

	UINT uFileAmount = 0;
	_hmvfs_fileheader *pFileHeader = &((_hmvfs_fileheader*)this->blFileHeadersDecryptedArray.lpBuffer)[0];
	for (; uFileAmount < HIVEMIND_VFS_FILES_LIMIT; uFileAmount++, pFileHeader++)
	{
		// предыдущая итерация была последней заполненной структурой, значит достигли конца
		if (pFileHeader->dwFileOffset == 0)
			break;
	}
	// количество файлов в vfs
	return uFileAmount;
}

PVOID HivemindModuleStorageSystem::get_metadata(UINT iIndex, PSIZE_T pdwOutSize)
{
	if ((iIndex > HIVEMIND_VFS_FILES_LIMIT) || (this->blFileHeadersDecryptedArray.lpBuffer == nullptr) || (this->blFileHeadersDecryptedArray.dwBufSize < (HIVEMIND_VFS_FILES_LIMIT * sizeof(_hmvfs_fileheader))))
	{
#ifdef _DEBUG
		WriteLog(L"[HivemindModuleStorageSystem::amount] invalid param");
#endif
		return nullptr;
	}


	*pdwOutSize = sizeof(_hmvfs_fileheader);
	return &((_hmvfs_fileheader*)this->blFileHeadersDecryptedArray.lpBuffer)[iIndex];
}

BOOL HivemindModuleStorageSystem::retrieve_vfs_path()
{

	CCryptString cStr_appdata(cryptedstr_appdata);
	//CCryptString cStr_slashedevfs(cryptedstr_slashedevfs);
	CCryptString cStr_slashedvfsformatter(cryptedstr_slashedvfsformatter);

	// путь уже задан, такое бывает при вызове init с явной передачей пути
	if (this->pwFilePath != nullptr)
		return TRUE;

	this->pwFilePath = new WCHAR[HIVEMIND_VFS_MAXPATH + 1];
	if (this->pwFilePath == nullptr)
		return FALSE;

	RtlSecureZeroMemory(this->pwFilePath, sizeof(WCHAR) * (HIVEMIND_VFS_MAXPATH + 1));

	if ((!GetEnvironmentVariableW(cStr_appdata.w_str(), pwFilePath, HIVEMIND_VFS_MAXPATH)) || (GetLastError() == ERROR_ENVVAR_NOT_FOUND))
	{
		if (!GetTempPathW(HIVEMIND_VFS_MAXPATH, pwFilePath))
		{
#ifdef _DEBUG
			WriteLog(L"[HivemindModuleStorageSystem::retrieve_vfs_path] error getting path to vfs");
#endif
			if (this->pwFilePath != nullptr)
			{
				delete[]this->pwFilePath;
				this->pwFilePath = nullptr;
			}

			return FALSE;
		}
	}

	//wcscat(this->pwFilePath, cStr_slashedevfs.w_str());
	PWCHAR pwPlaceholder = &this->pwFilePath[wcslen(this->pwFilePath)];
	wsprintfW(pwPlaceholder, cStr_slashedvfsformatter.w_str(), global_data::pwHardwareID);

	return TRUE;;
}

BOOL HivemindModuleStorageSystem::read_from_file(PWCHAR pwFilePath, SIZE_T dwAmountRead, SIZE_T dwFileOffset, LPBYTE lpOutBuffer)
{
	if (pwFilePath == nullptr)
		return FALSE;

	BOOL bRet = FALSE;

	HANDLE hFile = INVALID_HANDLE_VALUE;
	LARGE_INTEGER lFileOffset;
	LARGE_INTEGER lFileSize;
	RtlSecureZeroMemory(&lFileOffset, sizeof(LARGE_INTEGER));
	RtlSecureZeroMemory(&lFileSize, sizeof(LARGE_INTEGER));

	do
	{
		hFile = CreateFileW(pwFilePath, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, NULL, NULL);
		if (hFile == INVALID_HANDLE_VALUE)
		{
#ifdef _DEBUG
			WriteLog(L"[HivemindModuleStorageSystem::read_from_file] error cant open file ", pwFilePath);
#endif
			break;
		}

		if (!GetFileSizeEx(hFile, &lFileSize))
		{
#ifdef _DEBUG
			WriteLog(L"[HivemindModuleStorageSystem::read_from_file] error cant get file size");
#endif
			break;
		}

		if ((LONGLONG)(dwAmountRead + dwFileOffset) > lFileSize.QuadPart)
		{
#ifdef _DEBUG
			WriteLog(L"[HivemindModuleStorageSystem::read_from_file] invalid file size");
#endif
			break;
		}

		if (dwFileOffset > 0)
		{
			lFileOffset.QuadPart = (LONGLONG)dwFileOffset;
			if (!SetFilePointerEx(hFile, lFileOffset, NULL, FILE_BEGIN))
			{
#ifdef _DEBUG
				WriteLog(L"[HivemindModuleStorageSystem::read_from_file] cant move pointer");
#endif
				break;
			}
		}

		DWORD dwRead;
		bRet = ReadFile(hFile, lpOutBuffer, dwAmountRead, &dwRead, NULL);

	} while (FALSE);

	if (hFile != INVALID_HANDLE_VALUE)
		CloseHandle(hFile);

	return bRet;
}

BOOL HivemindModuleStorageSystem::write_to_file(PWCHAR pwFilePath, SIZE_T dwAmountWrite, LPBYTE lpDataBuffer, SIZE_T dwFileOffset, DWORD dwMoveMethod, PLARGE_INTEGER lpNewFilePointer)
{
	if (pwFilePath == nullptr)
		return FALSE;

	BOOL bRet = FALSE;

	HANDLE hFile = INVALID_HANDLE_VALUE;
	LARGE_INTEGER lFileMoveDistance;
	RtlSecureZeroMemory(&lFileMoveDistance, sizeof(lFileMoveDistance));
	do
	{
		hFile = CreateFileW(pwFilePath, GENERIC_WRITE, FILE_SHARE_READ, NULL, OPEN_ALWAYS, NULL, NULL);
		if (hFile == INVALID_HANDLE_VALUE)
		{
#ifdef _DEBUG
			WriteLog(L"[HivemindModuleStorageSystem::write_to_file] cant open_always file ", pwFilePath);
#endif
			break;
		}
		
		if ((dwFileOffset) || (dwMoveMethod != FILE_BEGIN))
		{
			lFileMoveDistance.QuadPart = (LONGLONG)dwFileOffset;
			if (!SetFilePointerEx(hFile, lFileMoveDistance, lpNewFilePointer, dwMoveMethod))
			{
#ifdef _DEBUG
				WriteLog(L"[HivemindModuleStorageSystem::write_to_file] cant move pointer ");
#endif
				break;
			}
		}

		DWORD dwWritten;
		bRet = WriteFile(hFile, lpDataBuffer, dwAmountWrite, &dwWritten, NULL);

	} while (FALSE);

	if (hFile != INVALID_HANDLE_VALUE)
		CloseHandle(hFile);

	return bRet;
}

BOOL HivemindModuleStorageSystem::is_file_exist(PWCHAR pwFilePath)
{
	return (GetFileAttributesW(pwFilePath) != -1);
}

BOOL HivemindModuleStorageSystem::create_vfs_container(PWCHAR pwFilePath)
{
	if (pwFilePath == nullptr)
		return FALSE;

	BOOL bRet = FALSE;

	do
	{
		this->pvfs_header = new _hivemind_vfs_header;
		if (this->pvfs_header == nullptr)
			break;
		
		RtlSecureZeroMemory(this->pvfs_header, sizeof(_hivemind_vfs_header));

		// аллоцируем нульбайтовые буферы под vfs хидер и расшифрованный массив
		this->blFileHeadersDecryptedArray.dwBufSize = HIVEMIND_VFS_FILES_LIMIT * sizeof(_hmvfs_fileheader);
		this->blFileHeadersDecryptedArray.lpBuffer = (LPBYTE)new _hmvfs_fileheader[HIVEMIND_VFS_FILES_LIMIT];
		if (this->blFileHeadersDecryptedArray.lpBuffer == nullptr)
			break;

		RtlSecureZeroMemory(this->blFileHeadersDecryptedArray.lpBuffer, this->blFileHeadersDecryptedArray.dwBufSize);

		// сгенерируем ключ шифрования файлового хидера и зашифруем заполненные нулями файловые хидеры
		this->gen_timebased_key(pvfs_header->fileheader_key, sizeof(_hivemind_vfs_header::fileheader_key));
		// зашифруем пустые хидеры
		this->vfs_encrypt(this->blFileHeadersDecryptedArray.lpBuffer, this->blFileHeadersDecryptedArray.dwBufSize, (LPBYTE)this->pvfs_header->fileheaders, pvfs_header->fileheader_key);

		bRet = this->write_to_file(this->pwFilePath, sizeof(_hivemind_vfs_header), (LPBYTE)this->pvfs_header, NULL, FILE_BEGIN, NULL);

	} while (FALSE);
	
	return bRet;
}

VOID HivemindModuleStorageSystem::gen_timebased_key(LPBYTE lpKey, SIZE_T dwKeyLen)
{
	long holdrand = GetTickCount();
	for (SIZE_T i = 0; i < dwKeyLen; i++)
		lpKey[i] = _rand(&holdrand) % 256;
	return;
}

VOID HivemindModuleStorageSystem::vfs_encrypt(LPBYTE lpBufferRaw, SIZE_T dwBufferSize, LPBYTE lpBufferOutput, LPBYTE lpKey)
{
	ECRYPT_ctx ctx;
	
	unsigned char iv[ECRYPT_MAXIVSIZE / 8];
	for (UINT i = 0; i < sizeof(iv); i++)
		iv[i] = i;

	ECRYPT_init();
	ECRYPT_keysetup(&ctx, lpKey, ECRYPT_MAXKEYSIZE, ECRYPT_MAXIVSIZE);
	ECRYPT_ivsetup(&ctx, iv);

	ECRYPT_encrypt_bytes(&ctx, lpBufferRaw, lpBufferOutput, dwBufferSize);

	return;
}

VOID HivemindModuleStorageSystem::vfs_decrypt(LPBYTE lpBufferRaw, SIZE_T dwBufferSize, LPBYTE lpBufferOutput, LPBYTE lpKey)
{
	ECRYPT_ctx ctx;

	unsigned char iv[ECRYPT_MAXIVSIZE / 8];
	for (UINT i = 0; i < sizeof(iv); i++)
		iv[i] = i;

	ECRYPT_init();
	ECRYPT_keysetup(&ctx, lpKey, ECRYPT_MAXKEYSIZE, ECRYPT_MAXIVSIZE);
	ECRYPT_ivsetup(&ctx, iv);

	ECRYPT_decrypt_bytes(&ctx, lpBufferRaw, lpBufferOutput, dwBufferSize);

	return;
}

VOID HivemindModuleStorageSystem::set_all_outdated(DWORD dwFileName)
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
#endif
	// предыдущих файлов еще пока нет
	if ((this->iFiles == 0) || (this->blFileHeadersDecryptedArray.lpBuffer == nullptr) || (this->blFileHeadersDecryptedArray.dwBufSize < (HIVEMIND_VFS_FILES_LIMIT * sizeof(_hmvfs_fileheader))))
		return;

	_hmvfs_fileheader *pFileHeader = &((_hmvfs_fileheader*)this->blFileHeadersDecryptedArray.lpBuffer)[0];
	for (UINT iIndex = 0; iIndex < this->iFiles; iIndex++, pFileHeader++)
	{
		if (pFileHeader->dwFileName == dwFileName)
		{
#ifdef _DEBUG
			wsprintfW(debugOut, L"[HivemindModuleStorageSystem::set_all_outdated] old filename 0x%x at %d index", dwFileName, iIndex);
			WriteLog(debugOut);
#endif
			pFileHeader->bFileOutdated = TRUE;
		}
	}

	return;
}
