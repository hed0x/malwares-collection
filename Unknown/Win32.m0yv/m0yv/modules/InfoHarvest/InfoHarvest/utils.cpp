#include "utils.h"
#include <ntsecapi.h>
#include "ntos.h"
#include "ntstatus.h"

VOID _RtlCopyMemory(LPBYTE target, LPBYTE from, SIZE_T dwSize)
{
	for (UINT i = 0; i < dwSize; i++)
		target[i] = from[i];
	return;
}


static PVOID SfuGetSystemInfo(
	DWORD InfoClass
)
{
	
	INT			c = 0;
	LPBYTE		Buffer = NULL;
	ULONG		Size = 0x1000;
	NTSTATUS	status;
	ULONG       memIO;

	do {
		Buffer = new BYTE[Size];
		if (Buffer != NULL) {
			status = NtQuerySystemInformation((_SYSTEM_INFORMATION_CLASS)InfoClass, Buffer, Size, &memIO);
		}
		else {
			return NULL;
		}
		if (status == STATUS_INFO_LENGTH_MISMATCH) {
			delete[]Buffer;
			Buffer = NULL;
			Size *= 2;
			c++;
			if (c > 100) {
				status = STATUS_SECRET_TOO_LONG;
				break;
			}
		}
	} while (status == STATUS_INFO_LENGTH_MISMATCH);

	if (NT_SUCCESS(status)) {
		return Buffer;
	}

	if (Buffer) {
		delete[]Buffer;
	}
	return NULL;
}

