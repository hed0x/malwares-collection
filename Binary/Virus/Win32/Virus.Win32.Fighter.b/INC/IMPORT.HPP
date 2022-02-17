#ifndef IMPORT_HPP
#define IMPORT_HPP

typedef void* __stdcall iGetProcAddress(int,char*);
typedef void* __stdcall iLoadLibraryA(char*);
typedef int __stdcall iMessageBoxA(int,char*,char*,int);
typedef int __stdcall iFindFirstFileA(void*,LPWIN32_FIND_DATA);
typedef int __stdcall iFindNextFileA(int,LPWIN32_FIND_DATA);
typedef void __stdcall iOutputDebugStringA(char*);
typedef HANDLE __stdcall iCreateFileA(char*,DWORD,DWORD,DWORD,DWORD,DWORD,HANDLE);
typedef HANDLE __stdcall iCreateFileMappingA(HANDLE,DWORD,DWORD,DWORD,DWORD,char*);
typedef void* __stdcall iMapViewOfFile(HANDLE,DWORD,DWORD,DWORD,DWORD);
typedef void __stdcall iCloseHandle(HANDLE);
typedef void __stdcall iUnmapViewOfFile(void*);

typedef struct api_
{
    iLoadLibraryA* LoadLibraryA;            //kernel32.dll
    iFindFirstFileA* FindFirstFileA;
    iFindNextFileA* FindNextFileA;
    iOutputDebugStringA* OutputDebugStringA;
    iCreateFileA* CreateFileA;
    iCreateFileMappingA* CreateFileMappingA;
    iMapViewOfFile* MapViewOfFile;
    iCloseHandle* CloseHandle;
    iUnmapViewOfFile* UnmapViewOfFile;
    
    iMessageBoxA* MessageBoxA;              //user32.dll
} api;

#endif
