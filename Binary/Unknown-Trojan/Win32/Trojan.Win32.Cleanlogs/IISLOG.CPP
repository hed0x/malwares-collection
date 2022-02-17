
ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ[IISLOG.CPP]ÄÄÄ
#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <io.h>
#pragma hdrstop

#define MIN(a,b) ((a)<(b)?(a):(b))

#define C_IIS_KEYPATH "SYSTEM\\CurrentControlSet\\Services\\W3SVC\\Parameters"
#define C_IIS_LOGSUBKEY "LogFileDirectory"

#define IISLOG_BLOCK_SIZE      65536

void cleaniislogfile(char* filename)    // clean single .log file
{
  // open LOG file in compatible mode
  HANDLE h = CreateFile(filename,
                        GENERIC_READ | GENERIC_WRITE,
                        FILE_SHARE_READ | FILE_SHARE_WRITE,
                        NULL,
                        OPEN_EXISTING,
                        FILE_ATTRIBUTE_NORMAL | FILE_FLAG_SEQUENTIAL_SCAN,
                        NULL);
  // return if not opened
  if (h == INVALID_HANDLE_VALUE) return;
  // allocate some temporary buffer
  DWORD buflen;
  char* buf = (char*)malloc( IISLOG_BLOCK_SIZE+1 );
  if (buf != NULL)
  {
    // if allocated, zerofill
    memset(buf, 0x00, IISLOG_BLOCK_SIZE);
    // get file size
    DWORD len = GetFileSize(h, NULL);
    // zerofill file
    while(len)
    {
      DWORD buflen = MIN( len, IISLOG_BLOCK_SIZE );
      WriteFile(h, buf, buflen, &buflen, NULL);
      len -= buflen;
    }
    // free allocated memory
    free(buf);
  }
  // close file
  CloseHandle(h);
} // cleaniislogfile()

void cleaniislogrecursive(char* path, int reclevel)  // search for .log files
{
  // copy path to search in
  char* buf = (char*)malloc(strlen(path)+MAXPATH+2);
  if (buf==NULL) return;
  strcpy(buf, path);
  // add \ if needed
  if (strrchr(buf,'\\')+1!=strchr(buf,0)) strcat(buf, "\\");
  char* bufend = strchr(buf, 0);
  // add *.*
  strcat(buf, "*.*");
  // start search
  WIN32_FIND_DATA ff;
  HANDLE h = FindFirstFile(buf, &ff);
  if (h != INVALID_HANDLE_VALUE)
  {
    for(;;) // for each file found
    {
      // form full path and file name
      strcpy(bufend, ff.cFileName);
      // if directory
      if (ff.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY)
      {
        if (strcmp(ff.cFileName, "." )!=0)
        if (strcmp(ff.cFileName, "..")!=0)
          if (reclevel == 0)
            // logs are contained in LogFiles\W3SVC\ directory by default
            if (strncmpi(ff.cFileName, "W3SVC", 5)==0)
              cleaniislogrecursive(buf, reclevel+1);
      }
      else
      {
        char* t = strrchr(ff.cFileName,'.');
        if (t && (stricmp(t,".log")==0))
          cleaniislogfile(buf); // zerofill found file
      }
      // find next file, exit if no more files
      if (FindNextFile(h, &ff) == 0) break;
    }
    // stop search
    FindClose(h);
  }
  // free allocated memory
  free(buf);
} // cleaniislogrec()

  // clear everything. call it from your src.
  // be sure that current http request processing by iis has been finished.
void CleanIISLogs()
{
  // 1. \WINNT\SYSTEM32\LogFiles
  cleaniislogrecursive("\\WINNT\\SYSTEM32\\LogFiles\\",0);
  // 2. C:\WINNT\SYSTEM32\LogFiles
  cleaniislogrecursive("C:\\WINNT\\SYSTEM32\\LogFiles\\",0);
  // 3. %SystemDirectory%\LogFiles
  char temp[MAXPATH];
  GetSystemDirectory(temp,MAXPATH);
  strcat(temp, "\\LogFiles\\");
  cleaniislogrecursive(temp,0);
  // 4. %SYSTEM\CurrentControlSet\Services\W3SVC\Parameters.LogFileDirectory%
  // open key
  HKEY hKey;
  if ( RegOpenKeyEx(HKEY_LOCAL_MACHINE, C_IIS_KEYPATH, 0, KEY_QUERY_VALUE,
                    &hKey) != ERROR_SUCCESS ) return;
  // get key value (log files directory)
  char buf[1024];
  DWORD buflen = sizeof(buf);
  if ( RegQueryValueEx(hKey, C_IIS_LOGSUBKEY, 0,
                       NULL, buf, &buflen) == ERROR_SUCCESS )
  {
    // can contain %SystemDirectory% - alike environment strings, so expand
    char expbuf[1024];
    ExpandEnvironmentStrings(buf, expbuf, sizeof(expbuf));
    // find & clean logs
    cleaniislogrecursive(expbuf, 0);
  }
  RegCloseKey(hKey);
} // CleanIISLogs()

void main()
{
//WSADATA WSAData;
//assert( WSAStartup(MAKEWORD(1,1), &WSAData) == 0 );

  CleanIISLogs();

//WSACleanup();
}
ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ[IISLOG.CPP]ÄÄÄ
ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ[MAKE.BAT]ÄÄÄ
@echo off
bcc32.exe -lap -5 -C -pr -ff -O2 iislog.cpp
del iislog.tds
del iislog.obj
ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ[MAKE.BAT]ÄÄÄ
