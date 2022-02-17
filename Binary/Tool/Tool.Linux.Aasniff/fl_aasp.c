/*
Fucker Latency test for Anti Anti Sniffer Patch
*/

#include "libvsk.h" /* www.s0ftpj.org for more info */
#include <errno.h>

extern int errno;

#define fatal(M)	{	   \
			perror(M); \
			exit(0);   \
			}

#define IPSIZE		sizeof(struct iphdr)
#define ICMPSIZE 	sizeof(struct icmphdr)
#define IIPKTSIZE	sizeof(struct iipkt)

int check_dup(struct iipkt *);
void build_reply(struct iipkt *, struct sockaddr_in *, struct iipkt *);
unsigned short ip_s(unsigned short *, int);

int main(int argc, char **argv)
	{
	int dlsfd, offset, forward, hdrincl =1, pkt_info[4], x;
	char ipdst[18], *rcvd =malloc(IIPKTSIZE);
	struct ifreq ifr;
	struct in_addr in;
	struct iipkt *reply =malloc(IIPKTSIZE);

	printf("\t Anti Anti Sniffer Patch for elude latency test\n");
	printf("\t by vecna - vecna@s0ftpj.org - www.s0ftpj.org\n\n");

	if(argc != 3)
		{
		printf( " usage %s interface fakedelay\n\n", argv[0]);
		exit(0);
		}

	printf(" running on background\n");
	if(fork())
		exit(0);

	pkt_info[0] =pkt_info[1] =ICMP_ECHO;
	pkt_info[2] =0;
	pkt_info[3] =0xFFFF;

	x =socket(PF_INET, SOCK_DGRAM, IPPROTO_IP);

	strncpy(ifr.ifr_name, argv[1], sizeof(ifr.ifr_name));
	if(ioctl (x, SIOCGIFADDR, &ifr) < 0) 
		fatal("unable to look local address");

	memcpy((void *)&in, (void *)&ifr.ifr_addr.sa_data +2, 4);
	strcpy(ipdst, (char *)inet_ntoa(in));
	close(x);

	dlsfd =set_vsk_param(NULL, ipdst, pkt_info, argv[1], 
				IPPROTO_ICMP, IO_IN, IP_FW_INSERT, 0, 0);
	if(dlsfd < 0)
	 	fatal("set_vsk: IP_FW_INSERT");

	if((offset =get_offset(dlsfd, argv[1])) <0)
		fatal("get device offset");

	if((forward = socket(AF_INET, SOCK_RAW, IPPROTO_ICMP)) == -1)
		fatal("forward socket - SOCK_RAW");

	if((x = setsockopt(forward, IPPROTO_IP, IP_HDRINCL, 
					&hdrincl, sizeof(hdrincl))) == -1)
		fatal("setsockopt - IP_HDRINCL");

	while(1)
		{
		struct iipkt *packet;
                static int last_id;

		read(dlsfd, rcvd, IIPKTSIZE);

		(char *)packet = rcvd + offset; 

		if(check_dup(packet))
			continue;

		if(check_packet(packet, IPPROTO_ICMP))
			{
			struct sockaddr_in sin;

			build_reply(packet, &sin, reply);

			usleep(atoi(argv[2]));
			/* 
			poll & select it's more intelligent...
			mah... maybe
			*/

			x =sendto(forward, (char *)reply, 
				ntohs(reply->ip.tot_len), 0, 
				(struct sockaddr *)&sin, 
				sizeof(struct sockaddr)	);

			if(x < 0)
				fatal("sendto on forwarding packet");

			}
		memset(packet, 0, IIPKTSIZE); 
		}
	free(rcvd);	/* never here */
	}

void build_reply(struct iipkt *packet, struct sockaddr_in *sin, 
						struct iipkt *reply)
	{

	memcpy((void *)reply, (void *)packet, IIPKTSIZE);

	reply->ip.id =getpid() & 0xffff ^ packet->ip.id;
	reply->ip.saddr =packet->ip.daddr;
	reply->ip.daddr =packet->ip.saddr;
	reply->ip.check	=ip_s((u_short *)&reply->ip, IPSIZE);

	reply->icmp.type =ICMP_ECHOREPLY;
	reply->icmp.checksum =0x0000;
	reply->icmp.checksum =ip_s((u_short *)&reply->icmp, 
				ntohs(packet->ip.tot_len) - IPSIZE );

	/* setting sockaddr_in stuctures */
	sin->sin_port =htons(0);
	sin->sin_family = AF_INET;
	sin->sin_addr.s_addr = reply->ip.daddr;
	}

int check_dup(struct iipkt *packet)
	{
	static int last_id;
	int id =htons(packet->ip.id);

	if(id ==htons(last_id))
		return 1;

	last_id =packet->ip.id;

	return 0;
	}

u_short ip_s(u_short *ptr, int nbytes)
	{
	register long sum = 0;
	u_short oddbyte;
	register u_short answer;

	while (nbytes > 1)
		{
		sum += *ptr++;
		nbytes -= 2;
		}
	if (nbytes == 1)
		{
		oddbyte = 0;
		*((u_char *) &oddbyte) = *(u_char *)ptr;
		sum += oddbyte;
		}
	sum  = (sum >> 16) + (sum & 0xffff);
	sum += (sum >> 16); 
	answer = ~sum;

	return(answer);
	}
