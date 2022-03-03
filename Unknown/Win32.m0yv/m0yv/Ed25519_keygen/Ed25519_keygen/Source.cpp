#include <Windows.h>
#include <stdio.h>

extern "C"
{
#include "ed25519\ed25519.h"
}


#define ED25519_SEED_BYTES 32U
#define sign_ed25519_BYTES_DETACHED 64U
#define sign_ed25519_PUBLICKEYBYTES 32U
#define sign_ed25519_PRIVATEKEYBYTES 64U


BOOL Dump2File(PWCHAR wchName, LPBYTE lpData, SIZE_T dwSize)
{
	HANDLE hFile = CreateFileW(wchName, GENERIC_WRITE, 0, 0, CREATE_ALWAYS, 0, 0);
	if (hFile == INVALID_HANDLE_VALUE)
		return FALSE;

	DWORD dwWritten;
	BOOL bRet = WriteFile(hFile, lpData, dwSize, &dwWritten, 0);

	CloseHandle(hFile);

	return bRet;
}


int main()
{
	printf("Generating Ed25519 keypair\n");

	unsigned char seed[ED25519_SEED_BYTES];
	unsigned char pubkey[sign_ed25519_PUBLICKEYBYTES];
	unsigned char seckey[sign_ed25519_PRIVATEKEYBYTES];

	if (0 == ed25519_create_seed(seed))
	{
		ed25519_create_keypair(pubkey, seckey, seed);

		if (Dump2File(L"pubkey.bin", pubkey, sizeof(pubkey)))
			printf("public key success %d\n", sizeof(pubkey));
		if (Dump2File(L"seckey.bin", seckey, sizeof(seckey)))
			printf("private key success %d\n", sizeof(seckey));
	}

	return 0;
}