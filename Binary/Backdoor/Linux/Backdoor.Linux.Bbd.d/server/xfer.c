#include "main.h"
/*
 ;<file>;<dir>;<ip>;<port>;
*/

enum xfer_enum
{
  FIL=1,
  DIR,
  PASV,
  PORT
};

enum mode
{
  ACTIVE,
  PASSIVE /* For the next release */
};

/* Put parameters in structure */
int
parse_xfer(char *cmdline, struct xfer_struct *xfer)
{
  char buffer[255];
  int i,j,k;
  int ret;

  memset(buffer, 0, sizeof(buffer));
  memset(xfer->file, 0, sizeof(xfer->file));

  for (i=j=k=0; i <strlen(cmdline); i++)
  {
    if (*(cmdline+i)==';')
    {
      buffer[k]='\0';
      k=0;
      switch(j)
      {
        case FIL:
          strncpy (xfer->file, buffer, strlen(buffer));
          break;
        case DIR:
          xfer->dir = atoi(buffer);
          break;
        case PASV:
          xfer->mode = atoi(buffer);
          break;
        case PORT:
          xfer->port = atoi(buffer);
          break;
      }
      j++;
    }
    else
    {
      buffer[k]=*(cmdline+i);
      k++;
    }
  }
  ret = chk_struct(xfer);
  if (j!=(PORT+1))
    return -1;
  else
    return ret;
}

/* Check for wrong values */
int
chk_struct (struct xfer_struct *xfer)
{
  FILE *fp;
  int ret;

  ret=1;
  if (xfer->port <=0 || xfer->port >=65536)
    ret= -1;
  if (inet_addr(xfer->ip)==INADDR_NONE)
    ret= -1;
  if (xfer->mode != 0 && xfer->mode!=1)
    ret= -1;
  switch(xfer->dir)
  {
    case DOWN: 
         fp = fopen(xfer->file, "r");
         if (fp==NULL)
         {
           printf("> No such file!\n");
           ret= -1;
         }
         else
           fclose(fp);
         break;
    case UP:
         fp = fopen(xfer->file, "w");
         if (fp==NULL)
         {
           perror("fopen");
           return -1;
         }
         else
           fclose(fp);
         break;
    default:
         ret= -1;
  }
 return ret;
}

#define BUFLEN 4192 /* 4k buffer */

/* Interpret xfer structure; act on it */
int
BDxfer(struct xfer_struct *xfer)
{
  int sd;
  int asd;
  int ret;
  FILE *fp;

  switch(xfer->dir)
  {
    case DOWN:
      if ((fp=fopen(xfer->file, "r"))!=NULL)
      {
        switch(xfer->mode)
        {
          case ACTIVE:
            sd = BDconnect(xfer->port, xfer->ip);
            break;
          case PASSIVE:
            break;
        }
      }
      else
      {
        perror("fopen");
        ret =-1;
      }

      if (sd!=-1)
        ret = xfer_download(sd, asd, fp, xfer->mode);
      break;
    case UP:
      if ((fp=fopen(xfer->file, "w"))!=NULL)
        switch(xfer->mode)
        {
          case ACTIVE:
            sd = BDconnect(xfer->port, xfer->ip);
            break;
          case PASSIVE:
            break;
        }
      else
      {
        perror("fopen");
        ret =-1;
      }

      if (sd!=-1)
        ret = xfer_upload(sd, asd, fp, xfer->mode);
      
      break;
  }
  return ret;
}

int
xfer_download(int sd, int asd, FILE *fp, int mode)
{
 int rb; /* read chars */
 int ret;
 char *buffer;

 ret=1;

 buffer = (char *) malloc(BUFLEN);
 memset(buffer, 0, BUFLEN);

 switch (mode)
 {
   case PASSIVE:
     break;
   case ACTIVE: 
     asd = sd;
     break;
 }

 while ((rb=fread(buffer, 1, BUFLEN-1, fp))!=0)
 {
   if (send(asd, buffer, rb, 0)==-1)
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
xfer_upload(int sd, int asd, FILE *fp, int mode)
{
 int rb;
 int ret;
 char *buffer;

 ret=1;

 buffer = (char *) malloc(BUFLEN);

 switch (mode)
 {
   case PASSIVE:
     break;
   case ACTIVE: 
     if (sd!=-1)
       asd = sd;
     break;
 }

 while ((rb = recv(asd, buffer, (size_t)BUFLEN-1, MSG_WAITALL))!=-1)
 {
   if (rb<(BUFLEN-1))
   {
     fwrite(buffer, 1, rb, fp);
     break;
   }
   if (fwrite(buffer, 1, rb, fp)==0)
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
