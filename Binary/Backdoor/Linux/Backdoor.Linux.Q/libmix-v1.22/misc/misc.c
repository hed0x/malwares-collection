#include <mix/misc.h>
#include <mix/mix.h>

char rseed[65535];
int rcounter = 0;
int bufsize = 1024;

void
random_init(void)
{
  int rfd = open("/dev/arandom", O_RDONLY);

  if (rfd < 0)
    rfd = open("/dev/urandom", O_RDONLY);
  if (rfd < 0)
    rfd = open("/dev/random", O_RDONLY);
  if (rfd >= 0)
    {
      rcounter = read(rfd, rseed, 65535);
      close(rfd);
    }
  else
    {
      rcounter = 65535;
      memset(rseed, (getpid() % 0xf0) + 1, 65535);
    }

#ifdef HAVE_INITSTATE
  initstate(getpid(), rseed, 65535);
#endif

}

long
getrandom(int min, int max)
{
  if (rcounter < 2)
    random_init();
  srandom(rseed[rcounter] + (rseed[rcounter - 1] << 8));
  rcounter -= 2;
  return ((random() % (int) (((max) + 1) - (min))) + (min));
}

#ifndef __cplusplus
void
sighandler(void *handler)
{
  signal(SIGHUP, handler);
  signal(SIGINT, handler);
  signal(SIGFPE, handler);
  signal(SIGBUS, handler);
  signal(SIGTRAP, handler);
  signal(SIGIOT, handler);
  signal(SIGPIPE, handler);
  signal(SIGTTIN, handler);
  signal(SIGTTOU, handler);
  signal(SIGTERM, handler);
  signal(SIGCHLD, handler);
  signal(SIGUSR1, handler);
}
#endif

void
strchop(char *str)
{
  int i;

  for (i = 0; i <= (int) strlen(str); i++)
    if ((str[i] == '\n') || (str[i] == '\r'))
      str[i] = '\0';

}

void
strlower(char *str)
{
  int i;

  for (i = 0; i <= (int) strlen(str); i++)
    if (isupper(str[i]))
      str[i] = tolower(str[i]);
}

void
strnsubst(char *str, char subst, int siz)
{
  int i;

  for (i = 0; i < (siz - 1); i++)
    if (str[i] == '\0')
      str[i] = subst;
}

char *
strscpy(char *src, char *sdest, char *edest, char c)
{
  size_t i;

  for (i = 0; i <= strlen(src); i++)
    if (src[i] == c)
      break;

  memset(sdest, 0, i + 1);
  memcpy(sdest, src, i);	/* copy this anyways, 2nd arg is optional */

  if (i >= strlen(src))
    return NULL;

  if (edest != NULL)
    {
      memset(edest, 0, strlen(src) - i);
      memcpy(edest, src + i + 1, strlen(src) - i - 1);
    }

  return (sdest);
}

void
log(char *log, char *msg,...)
{
  FILE *fd = fopen(log, "a");
  va_list va;

  if (fd == NULL)
    return;

  va_start(va, msg);
  vfprintf(fd, msg, va);
  va_end(va);

  fclose(fd);
}

void
ioterm(int p, int c, int crypt)
{
  char buf[4096], outbuf[8192], *tmpp;
  fd_set rfds;
  int i;

  while (1)
    {
      FD_ZERO(&rfds);
      FD_SET(p, &rfds);
      FD_SET(c, &rfds);

      if (select((p > c ? p : c) + 1, &rfds, NULL, NULL, NULL) < 1)
	{
	  close(p);
	  close(c);
	  return;
	}

      if (FD_ISSET(c, &rfds))
	{
	  memset(buf, 0, sizeof(buf));
	  if ((i = read(c, buf, sizeof(buf))) < 1)
	    {
	      close(p);
	      close(c);
	      return;
	    }

	  if (crypt)
	    {
	      size_t j = 0;

	      memset(outbuf, 0, sizeof(outbuf));
	      tmpp = (char *) aes_decrypt((u1byte *) buf, i);
	      for (j = 0; j < strlen(tmpp); j++)
		if (!isprint(tmpp[j]) && !isspace(tmpp[j]))
		  tmpp[j] = 0x20;
	      memcpy(outbuf, tmpp, strlen(tmpp));
	      free(tmpp);
	      write(p, outbuf, strlen(outbuf));
	      continue;
	    }
	  else
	    write(p, buf, i);
	}

      if (FD_ISSET(p, &rfds))
	{
	  memset(buf, 0, sizeof(buf));
	  if ((i = read(p, buf, sizeof(buf))) < 1)
	    {
	      close(p);
	      close(c);
	      return;
	    }

	  if (crypt)
	    {
	      memset(outbuf, 0, sizeof(outbuf));
	      tmpp = (char *) aes_encrypt((u1byte *) buf, &i);
	      memcpy(outbuf, tmpp, aes_binary ? i : strlen(tmpp));
	      free(tmpp);
	      write(c, outbuf, aes_binary ? i : strlen(outbuf));
	      continue;
	    }
	  else
	    write(c, buf, i);
	}
    }
}

int
pattern(char *data, char **list)
{
  int i = 0;

  while (strcmp(list[i++], NULL) != 0)
    if (strstr(data, list[i]) != NULL)
      return 1;

  return 0;
}

void
fatal(char *msg,...)
{
  va_list va;

  va_start(va, msg);
  vfprintf(stderr, msg, va);
  va_end(va);

  exit(-1);
}

void
disguise(char *as, int argc, char **argv)
{
#ifdef HAVE_SOLARIS
  return;			/* blah */
#else
  int i, s = strlen(argv[0]);

  for (i = 0; i < argc; i++)
    memset(argv[i], 0, strlen(argv[i]));
  strncpy(argv[0], as, s);
#endif
}

int
isactive(char *pidfile)
{
  FILE *fp = fopen(pidfile, "r");
  char data[10];
  int rpid = 0;

  if (fp != NULL)
    {
      fgets(data, 10, fp);
      fclose(fp);
      rpid = atoi(data);
      if (!kill(rpid, SIGUSR1))
	return 1;		/* kill succeeded, pid is active */
    }

  unlink(pidfile);		/* write current pid to file */
  fp = fopen(pidfile, "w");
  fprintf(fp, "%d", getpid());
  fclose(fp);
  return 0;			/* process was not active, go ahead */
}

char *
nstrdup(const char *p)
{
  size_t i = strlen(p) + 1;
  char *n = NEW(char, i);

  memset(n, 0, i);
  return (strncpy(n, p, i - 1));
}

int
sexec(char *path, char *newpath, char *arg0, char *arg1, char *arg2, char *arg3)
{
  int pid;

  (void) unlink(newpath);
  if (symlink(path, newpath) < 0)
    return -1;

  if (!(pid = fork()))
    {
      (void) setsid();
#ifdef HAVE_LINUX
      (void) setpgrp();
#endif
      (void) execl(newpath, arg0, arg1, arg2, arg3, NULL);
      exit(-1);
    }

  sleep(5);
  (void) unlink(newpath);
  return 0;
}

int
lm_scan_run (FILE *input, lm_callback myfunc, int forkme)
{
 char buf[8192];
 memset(buf,0,8192);

 if (forkme)
  {
   int pid = fork();
   signal(SIGHUP,SIG_IGN);
   signal(SIGCHLD,SIG_IGN);
   if (pid>0)
    return pid;
  }

 while(fgets(buf,8192,input)!=NULL)
  {
   strchop(buf);
   if (forkme>1)
    {
     if (!fork())
      {
       myfunc(resolve(buf));
       exit(0);
      }
    }
   else
    myfunc(resolve(buf));

   memset(buf,0,8192);
  }

 if (forkme)
  exit(0);
 else
  return 1;
}
