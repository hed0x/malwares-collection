   #include <stdio.h>
   #include <string.h>
   #include <stdlib.h>
   #include <errno.h>
   #include <signal.h>
   #include <sys/types.h>
   #include <netinet/in.h>
   #include <sys/socket.h>
   #include <sys/wait.h>
   #include <net/if.h>
   #include <netinet/in.h>
   #include <netdb.h>
   #include <rpc/rpc.h>
   #include <rpc/pmap_prot.h>
   #include <rpc/pmap_clnt.h>
   #include <unistd.h>
   #include <fcntl.h>
   #include <ctype.h>
   #include <signal.h>
   #include <sys/wait.h>
   #include <arpa/inet.h>
   #include <arpa/nameser.h>
   #include <getopt.h>
   #include <stdarg.h>
   #include <netinet/ip.h>
   //#include <netinet/tcp.h>
   #include <netinet/udp.h>
   #include <netinet/ip_icmp.h>
   #include <pthread.h>
   #include <thread_db.h>
   #include <sys/time.h>
   #include <sys/select.h>
   #include <sys/file.h>
   #include <sys/uio.h>
   #include <sys/ioctl.h>
   #include <ctype.h>

   //#define DEBUG  1      //if u  want to debug define it ,else not define it
   #define MAXHOST          255    //define the scale max  host number once scan
   #define SCANPORTNUM  11 //define the scan port type number
   #define MAXTHREAD    40     //define the thread num once time, default=10
   #define MIN_MULTI_NUM    1  //define the min of the multi, default = 1;
   #define CONNECT_TIME     4  //define the connect timeout , default=2;
   #define WEB_READTIMEOUT  4      //define the 80 socket read timeout , default=4
   #define WEB_WRITETIMEOUT 4      //define the 80 socket write timeout , default=4
   #define FTP_READTIMEOUT  4  //define the 21 socket read timeout, default=4
   #define FTP_WRITETIMEOUT 4  //define the 21 socket write timeout, default=4
   #define TELNET_READTIMEOUT 2    //define the 23 socket read timeout ,default=4
   #define TELNET_WRITETIMEOUT 2   //define the 23 socket write timeout ,default=4
   #define FINGER_WRITETIMEOUT 6   //define the finger timeout
   #define RPC_TIMEOUT  4      //define the create rpc timeout , default = 4
   #define BIND_TIMEOUT     4  //define the bind check timeout , default = 4
   #define CHECK_COUNT_M    19 //define the hole count when scan multi host, default=13
   #define CHECK_COUNT_S    426    //define all the check count ,if u add one type ,please modify it
   #define H_CONNECTING     1
   #define H_NONE       0
   #define H_TESTING    2
   #define H_DONE       3
   #define H_JOINED     4
   #define WU_FTP_260   1      //define the wu_ftp ver 2.60 type
   #define  LISTENQ        1       /* listen() backlog */

   struct host{
       char h_name[1024];
       unsigned long h_network;
       int h_port;
       int h_flags;
       int h_tid;
   }host[MAXHOST];

   int HostNumber;


   int daemon_init();
   void sig_chid(int signo);
   ssize_t writen(int fd,const void *vptr,size_t n);
   ssize_t readn(int fd,void *vptr,size_t n);
   static ssize_t my_read(int fd,char *ptr);
   ssize_t readline(int fd,void *vptr,size_t maxlen,int want_n);
   int TCP_listen(int port);
   int TCP_connect(char *Remote,int port);
   int TCP_NB_connect(unsigned long host_net,int port,int nsec);
   int UDP_NB_connect(unsigned long host_net,int port,int nsec);
   int readable_timeo(int fd, int sec);  //check if is readable , sec is the timeout time
                        //>0 express is readable

   int writeable_timeo(int fd, int sec);  //check if is writeable , sec is the timeout time
   char * create_randomIP();  //create a ip address, the last bit is 1
