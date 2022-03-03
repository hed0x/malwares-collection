#define _CRT_SECURE_NO_WARNINGS

#include <stdio.h>
#include <Windows.h>

// максимальное количество доменов для опроса,  не должно быть слишком большим, так как боты будут итеративно проходить по каждому домену опрашивая его
#define MAX_DOMAIN_AMOUNT 128

// максимальное имя домена и минимальное, генерирует имена доменов между [MIN_DOMAINNAME_LENGTH;MAX_DOMAINNAME_LENGTH)
#define MAX_DOMAINNAME_LENGTH 10
#define MIN_DOMAINNAME_LENGTH 5


int _cdecl _rand(long *holdrand)
{
	return (((*holdrand = *holdrand * 214013L + 2531011L) >> 16) & 0x7fff);
}

BOOL fileprint(HANDLE hFile, PWCHAR pwchText)
{
	DWORD dwWritten;

	printf("%S", pwchText);

	BOOL bRet = WriteFile(hFile, pwchText, wcslen(pwchText) * 2, &dwWritten, NULL);

	if (!bRet)
		printf("Error writing to file\n");

	return bRet;
}

DWORD dwGetHexValue(PWCHAR pwchCommandLine, PWCHAR pwchArgName)
{
	PWCHAR pwchEntry = wcsstr(pwchCommandLine, pwchArgName);
	if (pwchEntry == nullptr)
		return 0;

	return wcstoll(&pwchEntry[wcslen(pwchArgName) + 1], nullptr, 16);
}

VOID gen_domainname(long *holdrand, PWCHAR pwOut, UINT uLength)
{
	for (UINT i = 0; i < uLength; i++)
		pwOut[i] = (_rand(holdrand) % (L'z' - L'a' + 1)) + L'a';

	wcscat(pwOut, L".biz");
	return;
}

// сгенерируем статичный пул
BOOL static_pool(HANDLE hOutFile, DWORD dwSeed, PWCHAR pwchText)
{
	WCHAR wchDomainName[1024];
	RtlSecureZeroMemory(pwchText, wcslen(pwchText) * 2 + 2);

	wsprintfW(pwchText, L"main static pool for 0x%x: ", dwSeed);
	for (UINT iIndex = 0; iIndex < MAX_DOMAIN_AMOUNT; iIndex++)
	{
		long holdrand = dwSeed ^ iIndex;
		RtlSecureZeroMemory(wchDomainName, sizeof(wchDomainName));

		gen_domainname(&holdrand,
			wchDomainName,
			(_rand(&holdrand) % (MAX_DOMAINNAME_LENGTH - MIN_DOMAINNAME_LENGTH)) + MIN_DOMAINNAME_LENGTH);

		wcscat(pwchText, wchDomainName);
		wcscat(pwchText, L"  ");
	}

	wcscat(pwchText, L"\r\n\r\n");

	return fileprint(hOutFile, pwchText);
}

DWORD secret_pool_seed(DWORD dwSeed, DWORD dwIndex, SYSTEMTIME *stime)
{
	long dwRet = dwSeed + stime->wYear;
	UINT weekN = UINT(((30.5 * (float)stime->wMonth) - (float)stime->wDay) / 7.0);

	for (UINT iCounter = 0; iCounter < weekN; iCounter++)
	{
		dwRet = _lrotl(dwRet + 1, 1);
	}

	return dwRet ^ dwIndex;
}

BOOL secret_pool_fordate(HANDLE hOutFile, SYSTEMTIME *stime, DWORD dwSeed, PWCHAR pwchText)
{
	BOOL bRet = FALSE;
	WCHAR wchDomainName[1024];

	do
	{
		
		wsprintfW(pwchText, L"%d.%d.%d: ", stime->wDay, stime->wMonth, stime->wYear);
		for (UINT iIndex = 0; iIndex < MAX_DOMAIN_AMOUNT; iIndex++)
		{
			long holdrand = secret_pool_seed(dwSeed, iIndex, stime);

			RtlSecureZeroMemory(wchDomainName, sizeof(wchDomainName));

			gen_domainname(&holdrand,
				wchDomainName,
				(_rand(&holdrand) % (MAX_DOMAINNAME_LENGTH - MIN_DOMAINNAME_LENGTH)) + MIN_DOMAINNAME_LENGTH);

			wcscat(pwchText, wchDomainName);
			wcscat(pwchText, L"  ");

		}

		wcscat(pwchText, L"\r\n\r\n----------------------------------------------------------------------------------------\r\n");

		if (!fileprint(hOutFile, pwchText))
			break;

		bRet = TRUE;

	} while (FALSE);

	return bRet;
}

BOOL secret_pool(HANDLE hOutFile, SYSTEMTIME *stime, DWORD dwSeed, PWCHAR pwchText)
{

	for (UINT iIndex = 0; iIndex < 365 * 2; iIndex++)
	{
		if (!secret_pool_fordate(hOutFile, stime, dwSeed, pwchText))
			return FALSE;

		if (stime->wDay == 31)
		{
			if (stime->wMonth == 12)
			{
				stime->wYear++;
				stime->wMonth = 1;
			}
			else
				stime->wMonth++;

			stime->wDay = 1;
		}
		else
			stime->wDay++;

	}

	return TRUE;
}

BOOL gen_domains(HANDLE hOutFile, SYSTEMTIME *stime, DWORD dwSeed)
{
	PWCHAR pwchText = new WCHAR[1024 * 1024];
	if (pwchText == nullptr)
		return FALSE;

	RtlSecureZeroMemory(pwchText, (1024 * 1024) * 2);

	BOOL bRet = FALSE;
	do
	{


		if (!static_pool(hOutFile, dwSeed, pwchText))
			break;

		wsprintfW(pwchText, L"Starting date for secret pool is %d.%d.%d with seed = 0x%x\r\n\r\nDomains generated for each day assuming there is 31 days in month. Just ignore incorrect dates\r\n--------------secret pool--------------\r\n", stime->wDay, stime->wMonth, stime->wYear, dwSeed);
		if (!fileprint(hOutFile, pwchText))
			break;

		if (!secret_pool(hOutFile, stime, dwSeed, pwchText))
			break;

		bRet = TRUE;

	} while (FALSE);

	if (pwchText != nullptr)
		delete[]pwchText;

	return bRet;
}

BOOL create_domainlist(DWORD dwSeed)
{
	WCHAR wchCurrentDir[1024];
	WCHAR wchFilePath[1024];
	BOOL bRet = FALSE;
	HANDLE hFile = INVALID_HANDLE_VALUE;
	SYSTEMTIME stime;
	GetSystemTime(&stime);

	do
	{

		if (!GetCurrentDirectoryW(512, wchCurrentDir))
			break;

		wsprintfW(wchFilePath, L"%s\\%x_domains.txt", wchCurrentDir, dwSeed);

		printf("Saving to %S\n", wchFilePath);

		hFile = CreateFileW(wchFilePath, GENERIC_WRITE, FILE_SHARE_READ, NULL, CREATE_ALWAYS, NULL, NULL);
		if (hFile == INVALID_HANDLE_VALUE)
			break;

		if (!gen_domains(hFile, &stime, dwSeed))
			break;

		bRet = TRUE;

	} while (FALSE);

	if (hFile != INVALID_HANDLE_VALUE)
		CloseHandle(hFile);

	return bRet;
}

int main()
{
	PWCHAR pwchCommandLine = GetCommandLineW();
	
	do
	{
		if (!wcsstr(pwchCommandLine, L"--seed"))
		{
			printf("Please provide either --seed=<hex> or --seed <hex> for domain generation\n");
			break;
		}

		DWORD dwSeed = dwGetHexValue(pwchCommandLine, L"--seed");
		if (dwSeed == 0)
		{
			printf("Error cant parse --seed\nSupply it using either --seed=<hex> or --seed <hex>\n");
			break;
		}

		printf("Generating domains for 0x%x\n", dwSeed);

		if (!create_domainlist(dwSeed))
		{
			printf("Error cant generate domain list\n");
			break;
		}

		printf("Generated domains successfully!\n");

	} while (FALSE);


	return 0;
}