   #include "common.h"

   int daemon_init()  //init the daemon,if success return 0 other <0
   {
       struct sigaction act;
       int i,maxfd;
       if(fork()!=0)   exit(0);
       if(setsid()<0)  return(-1);
       act.sa_handler=SIG_IGN;
       //act.sa_mask=0;
       act.sa_flags=0;
       sigaction(SIGHUP,&act,0);
       if(fork()!=0)   exit(0);
       chdir("/");
       umask(0);
       maxfd=sysconf(_SC_OPEN_MAX);
       for(i=0;i<maxfd;i++)
           close(i);
       open("/dev/null",O_RDWR);
       dup(0);
       dup(1);
       dup(2);
       return(0);
   }

   void sig_chid(int signo)            //wait the child die
   {
       pid_t pid;
       int stat;
       while((pid=waitpid(-1,&stat,WNOHANG))>0)
           printf("child %d die\n",pid);
       return;
   }


   ssize_t writen(int fd,const void *vptr,size_t n)    //writen data to socket
   {
       size_t nleft;
       ssize_t nwritten;
       const char *ptr;
       ptr=vptr;
       nleft=n;
       while(nleft>0){
           if((nwritten=write(fd,ptr,nleft))<=0){
               if(errno==EINTR)
                   nwritten=0;
               else
                   return(-1);
           }
               nleft-=nwritten;
               ptr+=nwritten;
       }
       return(n);
   }


   ssize_t readn(int fd,void *vptr,size_t n)   //read n bytes from socket
   {
       size_t nleft;
       ssize_t nread;
       char *ptr;
       ptr=vptr;
       nleft=n;
       while(nleft>0){
           if((nread=read(fd,ptr,nleft))<0){
               if(errno==EINTR)
               nread=0;
               else
               return(-1);
           }else if(nread==0)
           break;
           nleft-=nread;
           ptr+=nread;
       }
       return(n-nleft);
   }


   static ssize_t my_read(int fd,char *ptr)
   {
       static int read_cnt=0;
       static char *read_ptr;
       static char read_buf[1024];
       if(read_cnt<=0){
         again:
           if((read_cnt=read(fd,read_buf,sizeof(read_buf)))<0){
               if(errno==EINTR)
                   goto again;
               return(-1);
           }else if (read_cnt==0)
               return(0);
           read_ptr=read_buf;
       }
       read_cnt--;
       *ptr=*read_ptr++;
       return(1);
   }

   ssize_t readline(int fd,void *vptr,size_t maxlen,int want_n)
                            //read a line from socket
   {
       int rc,n;
       char c, *ptr;
       ptr=vptr;
       for(n=1;n<maxlen;n++){
        if((rc=my_read(fd,&c))==1){
         if (want_n==1){
             *ptr++=c;
             if(c=='\n')
               break;
         }else{
             if(c=='\n')
               break;
                  *ptr++=c;
          }
          }else if(rc==0){
           if(n==1)
              return(0);
           else
              break;
       }else
           return(-1);
       }
       *ptr=0;
       return(n);
   }

   int TCP_listen(int port)              //success return 1 else return -1
   {

       struct sockaddr_in laddr ;  /* struttura IPv4 del demone */
       int fd;
       socklen_t len ;     /* dimensioni della struttura IPv4 */
       fd=socket(AF_INET, SOCK_STREAM, 0);
       len = sizeof(laddr) ;
           memset(&laddr, 0, len) ;
       laddr.sin_addr.s_addr = htonl(INADDR_ANY) ;
       laddr.sin_family = AF_INET ;
       laddr.sin_port = htons(port) ;  /* apriamo sulla porta 6666 */
       if((bind(fd, (const struct sockaddr *)&laddr, len)))  return(-1);
       if(listen(fd, 5))   return(-1);
       return(fd);
   }

   int TCP_connect(char *Remote,int port)
                    //success return fd else return -1
   {
        struct sockaddr_in sin;
        int fd;
        struct hostent *hp;
        struct in_addr **pptr;
        fd=socket(AF_INET, SOCK_STREAM, 0);
        sin.sin_family=AF_INET;
        sin.sin_port=htons(port);
        if ((hp=gethostbyname(Remote)) == NULL )
           inet_pton(AF_INET,Remote,&sin.sin_addr);
        else{
           pptr=(struct in_addr **) hp->h_addr_list;
           memcpy(&sin.sin_addr,*pptr,sizeof(struct in_addr));
       }
         if (connect(fd, (struct sockaddr*)&sin, sizeof(sin))==0)   //success
       {
           return(fd);
       }
       else return(-1);
   }


   int TCP_NB_connect(unsigned long host_net,int port,int nsec)
                    //no block conneetc,success return fd else return<0
                    //if nsec ==0 then no timeout,waiting....
   {
        struct sockaddr_in sin;
        int fd;
        struct hostent *hp;
        struct in_addr **pptr;
        int flags,n,error;
        struct timeval tval;
        fd_set rset,wset;
        socklen_t len;

        fd=socket(AF_INET, SOCK_STREAM, 0);
        sin.sin_family=AF_INET;
        sin.sin_port=htons(port);
        sin.sin_addr.s_addr=htonl(host_net);

       flags = fcntl(fd ,F_GETFL,0 );
       fcntl(fd,F_SETFL,flags | O_NONBLOCK);
       error=0;

         if ((n=connect(fd, (struct sockaddr*)&sin, sizeof(sin)))<0 )
           if ( errno != EINPROGRESS)
               return(-1);

       if (n==0)
           goto done;
       FD_ZERO(&rset);
       FD_SET(fd, &rset);
       wset=rset;
       tval.tv_sec=nsec;
       tval.tv_usec=0;
       if ((n=select(fd+1,&rset,&wset,NULL,nsec ? &tval : NULL))==0){
           close(fd);
           errno=ETIMEDOUT;
           return(-1);
       }
       if (FD_ISSET(fd,&rset) || FD_ISSET(fd, &wset)) {
           len =sizeof(error);
           if (getsockopt(fd, SOL_SOCKET, SO_ERROR, &error, &len)<0)
               return(-1);
       }else
           error=1;

       done:
           fcntl(fd,F_SETFL,flags);
           if (error ) {
               close(fd);
   //          errno=error;
               return(-1);
           }
           return(fd);
   }


   int UDP_NB_connect(unsigned long host_net,int port,int nsec)
                    //no block conneetc,success return fd else return<0
                    //if nsec ==0 then no timeout,waiting....
   {
        struct sockaddr_in sin;
        int fd;
        struct hostent *hp;
        struct in_addr **pptr;
        int flags,n,error;
        struct timeval tval;
        fd_set rset,wset;
        socklen_t len;

        fd=socket(AF_INET, SOCK_DGRAM, 0);
        sin.sin_family=AF_INET;
        sin.sin_port=htons(port);
        sin.sin_addr.s_addr=htonl(host_net);

       flags = fcntl(fd ,F_GETFL,0 );
       fcntl(fd,F_SETFL,flags | O_NONBLOCK);
       error=0;

         if ((n=connect(fd, (struct sockaddr*)&sin, sizeof(sin)))<0 )
           if ( errno != EINPROGRESS)
               return(-1);

       if (n==0)
           goto done;
       FD_ZERO(&rset);
       FD_SET(fd, &rset);
       wset=rset;
       tval.tv_sec=nsec;
       tval.tv_usec=0;
       if ((n=select(fd+1,&rset,&wset,NULL,nsec ? &tval : NULL))==0){
           close(fd);
           errno=ETIMEDOUT;
           return(-1);
       }
       if (FD_ISSET(fd,&rset) || FD_ISSET(fd, &wset)) {
           len =sizeof(error);
           if (getsockopt(fd, SOL_SOCKET, SO_ERROR, &error, &len)<0)
               return(-1);
       }else
           error=1;

       done:
           fcntl(fd,F_SETFL,flags);
           if (error ) {
               close(fd);
   //          errno=error;
               return(-1);
           }
           return(fd);
   }



   int readable_timeo(int fd, int sec)
   {
       fd_set rset;
       struct timeval tv;

       FD_ZERO(&rset);
       FD_SET(fd, &rset);

       tv.tv_sec = sec;
       tv.tv_usec = 0;

       return( select(fd+1, &rset, NULL, NULL, &tv));
       // >0 if is readable
   }

   int writeable_timeo(int fd, int sec)
   {
       fd_set wset;
       struct timeval tv;

       FD_ZERO(&wset);
       FD_SET(fd, &wset);

       tv.tv_sec = sec;
       tv.tv_usec = 0;

       return( select(fd+1, NULL, &wset, NULL, &tv));
       // >0 if is readable
   }

   char * create_randomIP()  //create a ip address, the last bit is 1
   {
       int a=0,b=0,c=0;
       char * returnv=(char*)malloc(sizeof(char)*24);

       srand(time(NULL));
       start:;
       a=1+(int) (223.0*rand()/(RAND_MAX+1.0));
       b=1+(int) (255.0*rand()/(RAND_MAX+1.0));
       c=1+(int) (223.0*rand()/(RAND_MAX+1.0));

       if (a == 127) { goto start; }
       if (a == 0) { goto start; }
       if (a == 1) { goto start; }
       if (a == 2) { goto start; }
       if (a == 3) { goto start; }
       if (a == 4) { goto start; }
       if (a == 5) { goto start; }
       if (a == 6) { goto start; }
       if (a == 7) { goto start; }
       if (a == 8) { goto start; }
       if (a == 9) { goto start; }
       if (a == 10) { goto start; }
       if (a == 49) { goto start; }
       if (a == 192) { if (b == 168) { goto start; } }
       sprintf(returnv,"%i.%i.%i.1", a, b,c);
       return returnv;
   }
