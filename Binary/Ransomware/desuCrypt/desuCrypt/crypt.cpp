#include "stdafx.h"
#define KEYLENGTH  0x00800000
#define ENCRYPT_ALGORITHM CALG_RC4 
#define ENCRYPT_BLOCK_SIZE 8 
BOOL initializeCrypt() {
	//opening algorithm handle
	
	//first we delete key if exist
	CryptAcquireContext(
		&provPtr,
		L"desuKContainer",
		NULL,
		PROV_RSA_FULL,
		CRYPT_DELETEKEYSET
	);
	CryptAcquireContext(
		&provPtr,
		L"desuKContainer", //can produce errors if not unique
		NULL,
		PROV_RSA_FULL,
		CRYPT_NEWKEYSET
	);
	if (CryptGenKey(
		provPtr,
		ENCRYPT_ALGORITHM,
		KEYLENGTH | CRYPT_EXPORTABLE,
		&keyHandle)) {
		std::cout << "keys generated" << std::endl;
	}
	else { return FALSE; }
	return TRUE;
}	
void destroyKeys() {
	if (keyHandle) {
		CryptDestroyKey(keyHandle);
	}
	if (provPtr) {
		CryptReleaseContext(provPtr, NULL);
	}

}



void encryptBuffer(byte *buf, DWORD bufLen, BOOL isLastBlock) {
	
	if (CryptEncrypt(
		keyHandle,
		NULL,
		isLastBlock,
		CRYPT_OAEP,
		buf,
		&bufLen,
		bufLen
		)) {
		//std::cout << "encrypted buffer" << std::endl;
	}
}
void decryptBuffer(byte *buf, DWORD bufLen, BOOL isLastBlock) {
	if (CryptDecrypt(
		keyHandle,
		NULL,
		isLastBlock,
		CRYPT_OAEP,
		buf,
		&bufLen
	)) {
		//std::cout << "decrypted buffer" << std::endl;
	}
}

BOOL writeKeyToFile() {
	DWORD writtenBytes;
	if (CryptGenKey(
		provPtr,
		AT_KEYEXCHANGE,
		CRYPT_EXPORTABLE,
		&xchgKeyHandle)) {
		std::cout << "exchange key created" << std::endl;
		//determining the size of the Key
	}
	else { return FALSE; }
	if (CryptExportKey(
		keyHandle,
		xchgKeyHandle,
		SIMPLEBLOB,
		0,
		NULL,
		&keyBlobLen)) {
		std::cout << "size determined" << std::endl;
	}
	else { return FALSE; }
	auto pbKeyBlob = (BYTE *)malloc(keyBlobLen);
	if (*pbKeyBlob == NULL) {
		return FALSE;
	}
	std::cout << "memory for keyLen allocated" << std::endl;
	if (CryptExportKey(
			keyHandle,
			xchgKeyHandle,
			SIMPLEBLOB,
			0,
			pbKeyBlob,
			&keyBlobLen))
		{
			std::cout << "key exported into a BLOB" << std::endl;
		}
		else { return FALSE; }
	
		if (xchgKeyHandle) {
			if ((CryptDestroyKey(xchgKeyHandle)))
			{
				std::cout << "exchange key successfully was destroyed" << std::endl;
				xchgKeyHandle = 0;
			}
			else { return FALSE; }
		}
			//now we need to write key len to file
			//writeCurPath();
			keyContainerPath += std::wstring(L"C:\\");
			//keyContainerPath += std::wstring(L"\\");
			keyContainerPath += std::wstring(L"desucryptKeyContainer.info");
			auto keyContainer = CreateFile(keyContainerPath.c_str(), GENERIC_WRITE, NULL, NULL, CREATE_NEW, FILE_ATTRIBUTE_NORMAL, NULL);
			if (keyContainer == INVALID_HANDLE_VALUE) {
				return FALSE;
			}
			
			if(WriteFile(
				keyContainer,
				&keyBlobLen,
				sizeof(DWORD),
				&writtenBytes,
				NULL)==TRUE)
			{
				std::wcout << L"length was written to a file" << std::endl;
			}
			else { return FALSE; }
			if (WriteFile(
				keyContainer,
				pbKeyBlob,
				keyBlobLen,
				&writtenBytes,
				NULL)==TRUE)
			{
				std::wcout << L"key was written to a file" << std::endl;
			}
			else { return FALSE; }
			if (pbKeyBlob)
			{
				free(pbKeyBlob);
			}
			return TRUE;
			//std::wcout << keyContainerPath << std::endl;
}
BOOL importKeyFromFile() {
	CryptAcquireContext(
		&provPtr,
		L"desuKContainer", //can produce errors if not unique
		NULL,
		PROV_RSA_FULL,
		NULL
	);
	DWORD bytesRead;
	//writeCurPath();
	keyContainerPath += std::wstring(L"C:\\");
	//keyContainerPath += std::wstring(L"\\");
	keyContainerPath += std::wstring(L"desucryptKeyContainer.info");
	HANDLE keyFile = CreateFile(keyContainerPath.c_str(), GENERIC_READ, NULL, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
	if (keyFile == INVALID_HANDLE_VALUE) {
		return FALSE;
	}
	if (ReadFile(
		keyFile,
		&keyBlobLen,
		sizeof(DWORD),
		&bytesRead,
		NULL) == TRUE) {
		std::cout << "key lean read" << std::endl;
	}

	else { return FALSE; }
	auto keyBlob = (PBYTE)malloc(keyBlobLen);
	if (*keyBlob = NULL) {
		return FALSE;
	}
	if (ReadFile(
		keyFile,
		keyBlob,
		keyBlobLen,
		&bytesRead,
		NULL) == TRUE)
	{
		std::cout << "key read" << std::endl;
	}
	else{ return FALSE; }
	if (CryptImportKey(
		provPtr,
		keyBlob,
		keyBlobLen,
		0,
		0,
		&keyHandle)==TRUE)
	{
		std::cout << "key imported into CSP" << std::endl;
	}
	free(keyBlob);
	return TRUE;
}