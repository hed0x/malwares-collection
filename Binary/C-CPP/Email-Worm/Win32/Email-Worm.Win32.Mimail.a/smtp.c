   #include <windows.h>
   #include <stdio.h>
   //#include "my_mx.c"
   //#define xfer(m) send(s, m, strlen(m), 0); printf("%s",m);

   /*int main(void)
   {

       smtp_init();
       if(smtp_send_file("mail.txt","discoinferno@ehighway.org","discoinferno@ehighway.org","test")){
           printf("Done!\n");
       } else {
           printf("Error!\n");
       }

       WSACleanup();
       return 0;
   }*/

   BOOL smtp_send_file(char *fname,char *to,char *from,char *subj){
       char *domain = strchr(to,'@');
       if(domain) domain++;
       else return FALSE;

       printf("Domain: '%s'\n",domain);
       char mx[256];

       if(!get_mx(domain,mx,5000,255)){
           printf("MX: '%s'\n",mx);
       } else {
           printf("Lookup failed\n");
           return FALSE;
       }

       char buf[4096];
       SOCKET s = 0;
       long dstaddr;

       struct hostent *he = gethostbyname(mx);
       if(!he){
           printf("hostent() error: %d\n",WSAGetLastError());
           return FALSE;
       }

       SOCKADDR_IN anAddr;
       s = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);

       if(s!=INVALID_SOCKET){
           dstaddr = *((long*)he->h_addr_list[0]);

           anAddr.sin_family = AF_INET;
           anAddr.sin_port = htons(25);
           anAddr.sin_addr.S_un.S_addr = dstaddr;

           if(connect(s, (struct sockaddr *)&anAddr, sizeof(struct sockaddr)) == 0) {
               myWait(s);
               xfer("HELO localhost\r\n");
               if(myWait(s)) { closesocket(s); return 1; }

               sprintf(buf,"MAIL FROM:<%s>\r\n",from);
               send(s, buf, strlen(buf), 0);
               if(myWait(s)) { closesocket(s); return 1; }

               sprintf(buf,"RCPT TO:<%s>\r\n",to);
               send(s, buf, strlen(buf), 0);
               if(myWait(s)) { closesocket(s); return 1; }

               xfer("DATA\r\n");
               if(myWait(s)) { closesocket(s); return 1; }

               char szSubj[255];
               sprintf(szSubj,"%s %d",subj,GetTickCount());
               sprintf(buf,"From: %s\nTo: <%s>\nReply-To: <%s>\nSubject: %s\n\n",from,to,from,szSubj);
               xfer(buf);

               DWORD bytesRead;
               char buf2;

               HANDLE hFile = CreateFile(fname, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, \
                   FILE_ATTRIBUTE_NORMAL, 0);
               if(hFile){
                   while(ReadFile(hFile,&buf2,1,&bytesRead,NULL)){
                       if(bytesRead==0) break;
                       send(s,&buf2,1,0);
                   }
               }
               CloseHandle(hFile);

               xfer("\r\n.\r\n");
               if(myWait(s)) { closesocket(s); return 1; }
               xfer("QUIT\r\n");
               if(myWait(s)) { closesocket(s); return 1; }

           } else {
               printf("Failed to connect: '%s'\n",mx);
           }
       }
       closesocket(s);

       return TRUE;
   }

   /*int myWait(SOCKET s){
       FD_SET test;
       TIMEVAL myTime;
       int canRead;
       char buf3[1024] = { 0 };
       int i = 0;
       int j = 0;
       char *p1 = buf3;
       test.fd_count = 1;
       test.fd_array[0] = s;
       myTime.tv_sec = 3;
       myTime.tv_usec = 0;

       do {
           j = recv(s,p1,1,0);
           canRead = select(0, &test, NULL, NULL, &myTime);

           p1++; i++;
       } while(j!=0 && canRead);
       *p1 = 0;

       printf("%s",buf3);

       if(strncmp(buf3,"250",3)==0 || strncmp(buf3,"220",3)==0 ||
           strncmp(buf3,"354",3)==0 || strncmp(buf3,"221",3)==0){
           return 0;
       }

       printf("ERROR! %s\n",buf3);
       return 1;
   }*/

   void smtp_init(void){
       WSADATA wsaData;
       WSAStartup(MAKEWORD(2,0), &wsaData);
   }
