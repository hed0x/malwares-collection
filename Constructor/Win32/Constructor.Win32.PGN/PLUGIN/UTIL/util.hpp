
#ifndef __UTIL_HPP__
#define __UTIL_HPP__

#pragma pack(push)
#pragma pack(1)

DWORD __stdcall createkeyV(DWORD uniqID, DWORD*phkResult);
DWORD __stdcall openkeyV  (DWORD uniqID, DWORD*phkResult);

DWORD __stdcall createkey(DWORD hKey, char*lpSubKey, DWORD*phkResult);
DWORD __stdcall openkey  (DWORD hKey, char*lpSubKey, DWORD*phkResult);
DWORD __stdcall closekey (DWORD hKey);
DWORD __stdcall setvalueex(DWORD hKey, char*lpValueName, DWORD Reserved,
                           DWORD dwType, BYTE *lpData, DWORD cbData);
DWORD __stdcall queryvalueex(HKEY hKey, char*lpValueName, DWORD lpReserved,
                             DWORD*lpType, BYTE*lpData, DWORD*lpcbData);

DWORD __stdcall gettime();
DWORD __stdcall getwindir(char* buf260ptr);
void  __stdcall uniquefname(char* buf260ptr, DWORD uniqID);

#pragma pack(pop)

#endif // __UTIL_HPP__

