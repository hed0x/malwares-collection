#include <windows.h>

extern WINAPI WinMain(HINSTANCE hInstance,HINSTANCE hPrevInstance,LPSTR lpCmdLine,int nCmdShow);

extern "C" void WinMainCRTStartup() { WinMain(GetModuleHandle(NULL),NULL,GetCommandLine(),SW_SHOW); }

void *malloc(size_t size) { return HeapAlloc(GetProcessHeap(),NULL,size); }

void free(void *block) { HeapFree(GetProcessHeap(),NULL,block); }