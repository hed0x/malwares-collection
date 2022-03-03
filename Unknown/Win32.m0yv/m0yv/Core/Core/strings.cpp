#include "strings.hpp"
#include "utils.hpp"

// преобразует байт текущего keystream'а в новый
static unsigned char mutate(unsigned char* keystream, int index)
{
	return ((keystream[index] ^ 2) + index) % 255;
}

// ксорит блоб с keystream, как только keystream заканчивается, то он переиспользуется для оставшихся байт
static void apply_keystream(unsigned char *blob, DWORD dwBlob_size, unsigned char *keystream)
{
	// новый keystream, на базе прошлых операций
	unsigned char new_keystream[KEYSTREAM_SIZE];
	DWORD dwBytesLeft = dwBlob_size;

	for (UINT i = 0; i < KEYSTREAM_SIZE; i++)
	{
		// создадим новый keystream для последующего прохода
		new_keystream[i] = mutate(keystream, i);

		blob[i] ^= keystream[i];
		dwBytesLeft--;
		// больше не надо ксорить
		if (dwBytesLeft == 0)
			break;
	}
	if (dwBytesLeft == 0)
		return; // поксорили все байты

				// иначе остались еще байты, доксорим
	apply_keystream(&blob[dwBlob_size - dwBytesLeft], dwBytesLeft, new_keystream);

	return;
}


LPVOID WINAPI open_string_container(unsigned char *container)
{
	string_container *sc = (string_container*)container;
	LPBYTE lpResult = new BYTE[sc->dwSizeOfBlob + 2 + 1];
	if (lpResult == nullptr)
		return nullptr;

	RtlSecureZeroMemory(lpResult, sc->dwSizeOfBlob + 2);
	_RtlCopyMemory(lpResult, sc->str, sc->dwSizeOfBlob);

	apply_keystream(lpResult, sc->dwSizeOfBlob, sc->keystream);

	return lpResult;
}


CCryptString::CCryptString(LPBYTE lpStringEncrypted)
{
	this->lpString = (LPBYTE)open_string_container(lpStringEncrypted);
	this->dwSize = ((string_container*)lpStringEncrypted)->dwSizeOfBlob;
}

CCryptString::~CCryptString()
{
	if (this->lpString != nullptr)
	{
		RtlSecureZeroMemory(this->lpString, this->dwSize);
		delete[]this->lpString;
		this->lpString = nullptr;
		this->dwSize = 0;
	}
}

PCHAR CCryptString::c_str()
{
	return (PCHAR)this->lpString;
}

PWCHAR CCryptString::w_str()
{
	return (PWCHAR)this->lpString;
}

