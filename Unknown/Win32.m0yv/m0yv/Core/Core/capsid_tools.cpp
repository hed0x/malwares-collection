#include "capsid_tools.h"
#include "utils.hpp"

VOID capsid_tools::get_extended(capsid_metadata *capsid, capsid_extended *pExtendedData_out, SIZE_T dwExtendedSize)
{
	if (dwExtendedSize != sizeof(capsid_extended))
	{
#ifdef _DEBUG
		MessageBoxA(0, "Error: capsid_tools::get_extended assert dwExtendedSIze != sizeof(capsid_extended)", "fatal error", MB_ICONERROR);
#endif
		return;
	}

#ifdef _DEBUG
	WriteLog(L"[capsid_tools::get_extended] getting extended data from capsid");
#endif

	LPBYTE lpExtendedRaw = (LPBYTE)pExtendedData_out;
	_RtlCopyMemory(lpExtendedRaw, (LPBYTE)&capsid->data_extended, dwExtendedSize);
	for (UINT iCounter = 0; iCounter < dwExtendedSize; iCounter++)
	{
		lpExtendedRaw[iCounter] ^= (BYTE)capsid->extended_key[iCounter];
	}

	return;
}

VOID capsid_tools::set_extended(capsid_metadata *capsid, capsid_extended *pExtendedData_in, SIZE_T dwExtendedSize)
{
	if (dwExtendedSize != sizeof(capsid_extended))
	{
#ifdef _DEBUG
		MessageBoxA(0, "Error: capsid_tools::set_extended assert dwExtendedSIze != sizeof(capsid_extended)", "fatal error", MB_ICONERROR);
#endif
		return;
	}

#ifdef _DEBUG
	WriteLog(L"[capsid_tools::set_extended] setting extended data into capsid");
#endif


	long holdrand = GetTickCount();
	LPBYTE lpExtendedCapsidRaw = (LPBYTE)&capsid->data_extended;
	_RtlCopyMemory(lpExtendedCapsidRaw, (LPBYTE)pExtendedData_in, dwExtendedSize);
	// сгенерируем новую гамму и тут же зашифруем
	for (UINT iCounter = 0; iCounter < dwExtendedSize; iCounter++)
	{
		capsid->extended_key[iCounter] = _rand(&holdrand) % 256;
		lpExtendedCapsidRaw[iCounter] ^= capsid->extended_key[iCounter];
	}

	return;
}
