#include "main.h"

char helpstring[]="xfer: Up- or download files to/from remote host\n\nUse:\n;xfer set\n;xfer put\n;xfer get\n;xfer help\n";

int
parse_xfer(char *cmd, struct xfer_struct *xfer)
{
  char *addr;
  int answer='n';
  int done=0;

  static char *cmds[] =
  {
    "xfer set",
    "xfer put",
    "xfer get",
    "xfer help",
  };

  if (strstr(cmd, cmds[0])!=NULL)
  {
    printf("Current settings:\nMode: %s\nPort: %d\n\n",
           (xfer->mode==0) ? "Active" : "Passive",
           xfer->port);
    printf("Toggle mode? (y/n) ");
    scanf("%c", &answer);
    if (answer=='y')
      printf("Sorry! Passive mode not implemented yet!\n");

    printf("Port: ");
    scanf("%d", &xfer->port);
  }
  else if (strstr(cmd, cmds[1])!=NULL)
  {
    xfer->dir=UP;
    if (xfer->port <=0 || xfer->port >=65536)
    {
      printf("Please specify a valid port, type \';xfer set\'\n");
      return 0;
    }
    printf("Local file: ");
    /* YES, this *IS* a buffer overflow ;^) */
    scanf("%s", xfer->lfile);
    printf("Remote file: ");
    scanf("%s", xfer->rfile);

    if (strlen(xfer->lfile)>0 && strlen(xfer->rfile)>0)
      done=1;
  }
  else if (strstr(cmd, cmds[2])!=NULL)
  {
    xfer->dir=DOWN;
    if (xfer->port <=0 || xfer->port >=65536)
    {
      printf("Please specify a valid port, type \';xfer set\'\n");
      return 0;
    }
    printf("Remote file: ");
    scanf("%s", xfer->rfile);
    printf("Local file: ");
    scanf("%s", xfer->lfile);
    if (strlen(xfer->lfile)>0 && strlen(xfer->rfile)>0)
      done=1;
  }
  else
   printf("%s", helpstring);

  return done;
}

/* check input */
int
chk_struct (struct xfer_struct *xfer)
{
  FILE *fp;
  int ret;

  ret=1;
  if (xfer->port <=0 || xfer->port >=65536)
  {
    printf("> Invalid port address!\n");
    ret= 0;
  }
  if (xfer->mode != 0 && xfer->mode!=1)
  {
    /* check for it anyways */
    printf("Unknown mode! %d\n", xfer->mode);
    ret= 0;
  }
  switch(xfer->dir)
  {
    case DOWN: 
         fp = fopen(xfer->lfile, "w");
         if (fp==NULL)
         {
           perror("fopen");
           ret= 0;
         }
         else
           fclose(fp);
         break;
    case UP:
         fp = fopen(xfer->lfile, "r");
         if (fp==NULL)
         {
           perror("fopen");
           ret =0;
         }
         else
           fclose(fp);
         break;
    default:
         printf("> No such direction option\n");
         ret= 0;
  }
 return ret;
}

/* send parameters to server */
/* call it a protocol :) */
int
call_server(struct xfer_struct *xfer, int sd)
{
  char *xfer_str;
  char *ip;
  int sent;

  xfer_str = (char*) malloc(1000);
  memset(xfer_str, 0, sizeof(xfer_str));

  snprintf(xfer_str, 999,";%s;%d;%d;%d;",
           xfer->rfile,
           xfer->dir,
           xfer->mode,
           xfer->port);

  sent =send(sd, xfer_str, strlen(xfer_str), 0);
  if (sent!=strlen(xfer_str))
  {
    printf("sent error\n");
    return 1;
  }
}
#define BUFLEN 4192 /* 4k buffer */

/* do it */
int
BDxfer(struct xfer_struct *xfer, int sockfd)
{
  int sd;
  int asd;
  int ret;
  FILE *fp;

  switch(xfer->dir)
  {
    case DOWN:
      if ((fp=fopen(xfer->lfile, "w"))!=NULL)
      {
        ret = xfer_download(fp, xfer, sockfd);
        if (ret!=-1)
          ret=1;
        else
          ret=0;
      }
      else
      {
        perror("fopen");
        ret =-1;
      }
      break;
    case UP:
      if ((fp=fopen(xfer->lfile, "r"))!=NULL)
      {
        ret = xfer_upload(fp, xfer, sockfd);
        if (ret!=-1)
          ret=1;
        else
          ret=0;
      }
      else
      {
        perror("fopen");
        ret =0;
      }
      break;
  }
  memset(xfer->lfile, 0, strlen(xfer->lfile));
  memset(xfer->rfile, 0, strlen(xfer->rfile));
  return ret;
}

int
xfer_upload(FILE *fp, struct xfer_struct *xfer, int sockfd)
{
 int sd, asd;
 int br; /* bytes read */
 int sc; /* ammount sent chars */
 int ret;
 char *buffer;

 ret=1;

 buffer = (char *) malloc(BUFLEN);
 memset(buffer, 0, BUFLEN);

 switch (xfer->mode)
 {
   case ACTIVE:
     sd = BDlisten(xfer->port, 1);
     call_server(xfer, sockfd);
     printf("Waiting for incoming connection... ");
     fflush(NULL);

     if (asd!=-1)
       printf("connected.\n");
     else
       printf("unable to connect\n");
     asd = accept(sd, (struct sockaddr*)0, (int*)0);
     break;
   case PASSIVE: 
     break;
 }

 while ((br=fread(buffer, 1, BUFLEN-1, fp))!=0)
 {
     if (send(asd, buffer, br, 0)==-1)
     {
       perror("send");
       ret=-1;
     }
     memset(buffer, 0, BUFLEN);
 }

 fclose(fp);
 close(asd);
 close(sd);

 return ret;
}

int
xfer_download(FILE *fp, struct xfer_struct *xfer, int sockfd)
{
 int sd, asd;
 int rc; /* ammount received chars */
 int ret;
 char *buffer;

 ret=1;

 buffer = (char *) malloc(BUFLEN);
 memset(buffer, 0, BUFLEN);

 switch (xfer->mode)
 {
   case ACTIVE:
     sd = BDlisten(xfer->port, 1);
     call_server(xfer, sockfd);
     printf("Waiting for incoming connection... ");
     asd = accept(sd, (struct sockaddr*)0, (int*)0);

     if (asd!=-1)
       printf("connected.\n");
     else
       printf("unable to connect\n");
     break;
   case PASSIVE:
     break;
 }

 while ((rc = recv(asd, buffer, (size_t)BUFLEN-1, MSG_WAITALL))!=-1)
 {
   if (rc<(BUFLEN-1))
   {
     fwrite(buffer, 1, rc, fp);
     break;
   }
   if (fwrite(buffer, 1, rc, fp)==0)
   {
     perror("fputs");
     ret =-1;
     break;
   }
   else
     memset(buffer, 0, (strlen(buffer)));
 }

 fclose(fp);
 close(asd);
 close(sd);

 return ret;
}
