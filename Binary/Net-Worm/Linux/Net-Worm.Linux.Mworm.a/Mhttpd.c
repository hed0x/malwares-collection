   //Mhttpd.c is a Http server ,it can translate file from remote host
   //Workd under linux
   //Code by Leaf  whleaf@21cn.com
   //compile: gcc Mhttpd2.c -o Mhttpd2
   //Usage:
   //Server: ./Mhttpd2
   //Client: http://IP:7977//etc/passwd

   #include <sys/socket.h>
   #include <stdio.h>
   #include <string.h>
   #include <signal.h>
   #include <netinet/ip.h>
   #include <unistd.h>
   #include <sys/wait.h>
   #include <fcntl.h>
   #include <errno.h>


   #define HTTPD_PORT  7977
   unsigned char ret_buf[32768];


   int TCP_listen(int port)          //success return 1 else return -1
   {

       struct sockaddr_in laddr ;
       int fd;
       socklen_t len ;
       fd=socket(AF_INET, SOCK_STREAM, 0);
       len = sizeof(laddr) ;
           memset(&laddr, 0, len) ;
       laddr.sin_addr.s_addr = htonl(INADDR_ANY) ;
       laddr.sin_family = AF_INET ;
       laddr.sin_port = htons(port) ;
       if((bind(fd, (const struct sockaddr *)&laddr, len)))  return(-1);
       if(listen(fd, 5))   return(-1);
       return(fd);
   }

   //return the file content as a large string
   //buf value like GET /index.html HTTP:/1.1
   char * read_worm_file(char *buf, int fd)
   {
       char *error_return = "<HTML>\n<BODY>File not found\n</BODY>\n</HTML>";
       int i;
       char *cp, *cp2;
       FILE *f;

       cp = buf +5;
       cp2 = strstr(cp , "HTTP");
       if(cp2!=NULL) *cp2 = '\0';
       cp[strlen(cp)-1] = 0;
       printf("File: %s\n", cp);
       f = fopen(cp, "r");
       if (f ==NULL) return error_return;
       while( !feof(f) ) {
           i = fread(ret_buf, 1, 32768, f);
           if (i == 0)  break;
           writen( fd, ret_buf, i );
       }

       fclose(f);
       return ret_buf;
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


   //The main function from here
   int main(int argc,char *argv[])
   {
       int fd, len,i;
       int csocket ;
       struct sockaddr_in caddr ;
       char readstr[4000];
       char * cbuf;
       pid_t pid ;

       fd=TCP_listen(HTTPD_PORT);
       if (fd <= 0) return -1;
       signal(SIGCHLD,sig_chid);

       for(;;)
       {
               len = sizeof(caddr);
           if((csocket=accept(fd, &caddr, &len)) < 0)  continue;
           if ((pid=fork()) == -1) continue;
           if(pid<=0){
               i = recv(csocket,readstr,4000,0);
               if (i == -1) break;
               if( readstr[ i -1 ] != '\n' ) break;
               readstr [i] = '\0';
               printf("Read from client: %s \n", readstr);
               cbuf =  read_worm_file(readstr, csocket);
               close(csocket);
           }
           close(csocket);
       }
       close(fd);
       return(1);
   }
