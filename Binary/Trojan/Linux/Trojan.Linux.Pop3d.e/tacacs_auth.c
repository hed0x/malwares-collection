#ifdef TACACS_AUTH
/*
/*
**	tacacs_auth.c
**
**	TACACS support for pop3d password authentication
**
**	Author: Filippo Grassilli (phil@hyppo.com)
**	Date:	14-Jun-97
**
**	This patch was written for systems that use TACACS authentication:
**	although when a mbx resides on a host this entry must be present in
**	users file, can be useful to keep authentication on another server.
**	I use it also for logging reason.
**	It works under Linux, *should* be portable!
**
*/

#include <stdio.h>
#include <signal.h>
#include <netdb.h>
#include <netinet/in.h>
typedef	unsigned char uchar;
/* typedef unsigned long ulong; */
#include "tacacs.h"

/************************************************************************/
/* PROTO								*/
/************************************************************************/
void alrm(int sig);
int get_servername(char sname[]);
void get_myaddress(struct in_addr *addr);

/************************************************************************/
/* TACACS_VERIFY_USER							*/
/************************************************************************/
int tacacs_verify_user(char *user, char *pass)
{
int s,len,r;
struct hostent *he;
struct servent *se;
struct sockaddr_in sa;
char buf[256];
char tacacs_server[48];
struct in_addr my_hostaddress, server_addr;
xtacacstype *tp;

    if(!get_servername(tacacs_server)) {
	/*
	printf("tacacs server not found\n");
	*/
	return(-1);
    }
    he=gethostbyname(tacacs_server);
    if(!he) {
	/*
	printf("gethostbyname() failed [%s]\n",sys_errlist[errno]);
	*/
	return(-1);
    }
    memcpy((char *)&server_addr.s_addr,he->h_addr,4);
    bzero((caddr_t)&sa,sizeof(sa));
    sa.sin_family      = AF_INET;
    sa.sin_addr.s_addr = server_addr.s_addr;
    /* Tries to get svc name from services, else uses default		*/
    se=getservbyname(TACACS_SVC_NAME,"udp");
    if(se) sa.sin_port = se->s_port;
    else   sa.sin_port = htons(TACACS_PORT);
    /*
    printf("Server: %s  Port: %d\n",inet_ntoa(server_addr),ntohs(sa.sin_port));
    */
    if((s=socket(AF_INET,SOCK_DGRAM,0))<0) {
	/* printf("socket() failed [%s]\n",sys_errlist[errno]); */
	return(-1);
    }
    /* My address to tell tac-server the host contacted			*/
    get_myaddress(&my_hostaddress);

    bzero(buf,sizeof(buf));
    tp=(xtacacstype *)&buf[0];
    tp->type=XTA_LOGIN;			/* Can be used also XTA_CONNECT	*/
    tp->version=XTA_VERSION;
    tp->trans=htons(getpid());		/* Haven't better idea??	*/
    tp->reason=XTA_A_NONE;
    tp->dhost=my_hostaddress.s_addr;	/* Already in network order	*/
    tp->dport=htons(110);		/* Use pop3 port number		*/
    tp->lport=htons(0);			/* Is it used by your server?	*/
    tp->namelen=(char)strlen(user);
    tp->pwlen=(char)strlen(pass);
    len=XTACACSSIZE+tp->namelen+tp->pwlen;
    memcpy(&buf[XTACACSSIZE],user,tp->namelen);
    memcpy(&buf[XTACACSSIZE+tp->namelen],pass,tp->pwlen);
    sendto(s,buf,len,0,(struct sockaddr *)&sa,sizeof(struct sockaddr_in));

    /* Prepare to receive the answer					*/
    memset(buf,0,sizeof(buf));
    /* Set an appropriate timeout					*/
    signal(SIGALRM,alrm);
    alarm(ANSWER_TIMEOUT);
    len=sizeof(struct sockaddr_in);
    r=recvfrom(s,buf,sizeof(buf),0,(struct sockaddr *)&sa,&len);
    alarm(0);
    /* Probably timeout...						*/
    if(r==-1) {
	/*
	printf(">>> XTACACS Timeout\n");
	*/
	return(-1);
    }
    /*
    printf(">>> XTACACS response (%d bytes): [V%02x %s]\n",r,tp->version,tp->response==1?"Accepted":"Rejected");
    printf(">>> V%02x  Type:%d  Answer:%d %s (reason %d)\n",tp->version,tp->type,tp->response,tp->response==1?"Accepted":"Rejected",tp->reason);
    */
    close(s);
    return(tp->response==1?0:-1);
}
/************************************************************************/
/* ALRM									*/
/************************************************************************/
void alrm(int sig)
{
    return;
}
/************************************************************************/
/* GET_SERVERNAME							*/
/************************************************************************/
int get_servername(char sname[])
{ 
FILE *FP;
char buf[80];
int ok=0;

    FP=fopen(SERVER_FILE,"r");
    if(!FP) {
	fprintf(stdout,"-ERR %s unavailable\r\n",SERVER_FILE);
	return(0);
    }
    while(fgets(buf,sizeof(buf),FP)) {
	buf[strlen(buf)-1]='\0';
	if(!strncmp(buf,"server ",7)) {
	    strcpy(sname,&buf[7]);
	    ok=1;
	    break;
	}
    }
    fclose(FP);
    if(!ok) {
	fprintf(stdout,"-ERR server not found in %s\r\n",SERVER_FILE);
    }
    return(ok);
}
/************************************************************************/
/* GET_MYADDRESS							*/
/************************************************************************/
void get_myaddress(struct in_addr *addr)
{ 
char name[48];
struct hostent *he;

    gethostname(name,sizeof(name));
    strncat(name,".",sizeof(name)-strlen(name)-1);
    if(getdomainname(&name[strlen(name)],sizeof(name)-strlen(name-1))!=0) {
	gethostname(name,sizeof(name));
    }
    he=gethostbyname(name);
    memcpy((char *)&addr->s_addr,he->h_addr,4);
    /* printf("%s\n",inet_ntoa(*addr)); */
}
/* EOF ******************************************************************/
#endif
