/*
 * Name: kstat v.1.1 if.c
 * Date: Sun Feb 10 02:49:49 CET 2002
 * Author: FuSyS [fusys@s0ftpj.org, fusys@sikurezza.org]
 *
 * SoftProject Digital Security for Y2K
 * Sikurezza.org - Italian Security Mailinglist
 *
 * MOJITO-WARE LICENSE - This source code is like "THE BEER-WARE LICENSE" by
 * Poul-Henning Kamp <phk@FreeBSD.ORG> but you can give me in return a mojito.
 *
 * Tested on: Slackware 8 Linux MaNTRa 2.4.16 #4 i686 unknown
 */

#include "linux.h"

char *dumpHW (unsigned char *hw_s) {
        static char buffer[ETH_ALEN];
        sprintf(buffer, "%02X:%02X:%02X:%02X:%02X:%02X",
           hw_s[0], hw_s[1], hw_s[2], hw_s[3], hw_s[4], hw_s[5]);
        return buffer;
}

void looking_if(unsigned short type)
{
	switch(type){
		
		case ARPHRD_NETROM:	printf("NET/ROM");
					break;
		case ARPHRD_ETHER:	printf("Ethernet");
					break;
		case ARPHRD_EETHER:	printf("Experimental Ethernet");
					break;
		case ARPHRD_AX25:	printf("AX.25 lv2");
					break;
		case ARPHRD_PRONET:	printf("PROnet");
					break;
		case ARPHRD_CHAOS:	printf("Chaosnet");
					break;
		case ARPHRD_IEEE802:	printf("IEEE 802.2");
					break;
		case ARPHRD_ARCNET:	printf("ARCnet");
					break;
		case ARPHRD_APPLETLK:	printf("APPLEtalk");
					break;
		case ARPHRD_DLCI:	printf("Frame Relay DLCI");
					break;
		case ARPHRD_METRICOM:	printf("STRIP");
					break;
		case ARPHRD_SLIP:	printf("Serial Line IP");
					break;
		case ARPHRD_CSLIP:	printf("Compressed SLIP");
					break;
		case ARPHRD_X25:	printf("X.25");
					break;
		case ARPHRD_PPP:        printf("Point-to-Point Protocol");
					break;
		case ARPHRD_HDLC:	printf("Cisco HDLC");
					break;
		case ARPHRD_TUNNEL:	printf("IPIP Tunnel");
					break;
		case ARPHRD_LOOPBACK:   printf("Local Loopback");
                                        break;
		case ARPHRD_LOCALTLK:	printf("Localtalk");
					break;
		case ARPHRD_FDDI:	printf("Fiber Distributed Data Interface");
					break;
		case ARPHRD_IPGRE:	printf("GRE over IP");
					break;
		case ARPHRD_IRDA:	printf("Linux/InfraRed");
					break;
		default:		printf("Unknown");
					break;		
	}
}

void print_if(struct net_device dev)
{
	struct in_device in_dev;
	struct in_ifaddr ifa;
#ifdef IPV6
	struct inet6_dev in6_dev;
	struct inet6_ifaddr ifa6;
#endif

	printf("%s\t", name);
	printf("Link encap:");
	looking_if(dev.type);
	printf("  Internal Index:%d", dev.ifindex);
	if(dev.type==1)
	printf("  MAC:%s\n\t", dumpHW(dev.dev_addr));
	else printf("\n\t");
	if(dev.flags & IFF_UP) printf("UP ");
	if(dev.flags & IFF_BROADCAST) printf("BROADCAST ");
	if(dev.flags & IFF_DEBUG) printf("DEBUG ");
	if(dev.flags & IFF_LOOPBACK) printf("LOOPBACK ");
	if(dev.flags & IFF_POINTOPOINT) printf("POINTOPOINT ");
	if(dev.flags & IFF_NOTRAILERS) printf("NOTRAILERS ");
	if(dev.flags & IFF_RUNNING) printf("RUNNING ");
	if(dev.flags & IFF_NOARP) printf("NOARP ");
	if(dev.flags & IFF_PROMISC || dev.gflags & IFF_PROMISC || 
		dev.promiscuity != 0) printf("PROMISC ");
	if(dev.flags & IFF_ALLMULTI || dev.allmulti != 0) printf("ALLMULTI ");
	if(dev.flags & IFF_MASTER) printf("MASTER ");
	if(dev.flags & IFF_SLAVE) printf("SLAVE ");
	if(dev.flags & IFF_MULTICAST) printf("MULTICAST ");
	if(dev.flags & IFF_DYNAMIC) printf("DYNAMIC ");
	printf(" MTU:%d", dev.mtu);
	if(dev.type == 1)
                printf("  IRQ:%d Base:0x%lx\n\t", dev.irq, dev.base_addr&0x0000ffff);
        else
                printf("\n\t");
	if(kread(fd, (unsigned long)dev.ip_ptr, &in_dev, sizeof(struct in_device)) == -1) err("kread error");
	if(kread(fd, (unsigned long)in_dev.ifa_list, &ifa, sizeof(struct in_ifaddr)) == -1) err("kread error");
	if(dev.flags & IFF_UP)
		printf("inet addr:%s", ntoa(ifa.ifa_local));
	if(dev.flags & IFF_UP && dev.flags & IFF_POINTOPOINT)
		printf("  P-t-P:%s", ntoa(ifa.ifa_address));
	else
		printf("  Bcast:%s", ntoa(ifa.ifa_broadcast));
	printf("  Mask:%s\n\t", ntoa(ifa.ifa_mask));
#ifdef IPV6
	if((dev.type == ARPHRD_ETHER || dev.type == ARPHRD_LOOPBACK) && (dev.flags & IFF_UP)) {
	 if(kread(fd, (unsigned long)dev.ip6_ptr, &in6_dev, sizeof(struct inet6_dev)) == -1) err("kread error");
	 if(kread(fd, (unsigned long)in6_dev.addr_list, &ifa6, sizeof(struct inet6_ifaddr)) == -1) err("kread error");
	 printf("inet6 addr: %s/%d", ntoa6(ifa6.addr), ifa6.prefix_len);
	 switch(ifa6.scope){
		
		case IFA_LINK:		printf("  Scope:Link\n\t");
					break;
		case IFA_HOST:		printf("  Scope:Host\n\t");
					break;
		case IFA_SITE:		printf("  Scope:Site\n\t");
					break;
		case IFA_GLOBAL:	printf("  Scope:Global\n\t");
					break;
		default:		printf("  Scope:Unknown\n\t");
					break;
	 }
	}
#endif
	printf("IPv4 Sysctl Params:\n\t\t");
	printf("accept_redirects:\t\t%s\n\t\t", (in_dev.cnf.accept_redirects)?"yes":"no");
	printf("send_redirects:\t\t\t%s\n\t\t", (in_dev.cnf.send_redirects)?"yes":"no");
	printf("secure_redirects:\t\t%s\n\t\t", (in_dev.cnf.secure_redirects)?"yes":"no");
	printf("accept_source_route:\t\t%s\n\t\t", (in_dev.cnf.accept_source_route)?"yes":"no");
        printf("shared_media:\t\t\t%s\n\t\t", (in_dev.cnf.shared_media)?"yes":"no");
	printf("rp_filter:\t\t\t%s\n\t\t", (in_dev.cnf.rp_filter)?"yes":"no");
	printf("proxy_arp:\t\t\t%s\n\t\t", (in_dev.cnf.proxy_arp)?"yes":"no");
	printf("arp_filter:\t\t\t%s\n\t\t", (in_dev.cnf.arp_filter)?"yes":"no");
	printf("bootp_relay:\t\t\t%s\n\t\t", (in_dev.cnf.bootp_relay)?"yes":"no");
	printf("log_martians:\t\t\t%s\n\t\t", (in_dev.cnf.log_martians)?"yes":"no");
	printf("forwarding:\t\t\t%s\n\t\t", (in_dev.cnf.forwarding)?"yes":"no");
	printf("mc_forwarding:\t\t\t%s\n\t\t", (in_dev.cnf.mc_forwarding)?"yes":"no");
	printf("tag:\t\t\t\t%s\n\t\t\n\t", (in_dev.cnf.tag)?"yes":"no");
#ifdef IPV6
	if((dev.type == ARPHRD_ETHER) && (dev.flags & IFF_UP)) {
         printf("IPv6 Sysctl Params:\n\t\t");
         printf("forwarding:\t\t\t%s\n\t\t", (in6_dev.cnf.forwarding)?"yes":"no");
         printf("hop_limit:\t\t\t%s\n\t\t", (in6_dev.cnf.hop_limit)?"yes":"no");
         printf("mtu:\t\t\t\t%s\n\t\t", (in6_dev.cnf.mtu6)?"yes":"no");
         printf("accept_ra:\t\t\t%s\n\t\t", (in6_dev.cnf.accept_ra)?"yes":"no");
         printf("accept_redirects:\t\t%s\n\t\t", (in6_dev.cnf.accept_redirects)?"yes":"no");
         printf("autoconf:\t\t\t%s\n\t\t", (in6_dev.cnf.autoconf)?"yes":"no");
         printf("dad_transmits:\t\t\t%s\n\t\t", (in6_dev.cnf.dad_transmits)?"yes":"no");
         printf("router_solicitations:\t\t%s\n\t\t", (in6_dev.cnf.rtr_solicits)?"yes":"no");
         printf("router_solicitation_interval:\t%s\n\t\t", (in6_dev.cnf.rtr_solicit_interval)?"yes":"no");
         printf("router_solicitation_delay:\t%s\n\t\t", (in6_dev.cnf.rtr_solicit_delay)?"yes":"no");
	}
#endif
	if(dev.promiscuity) 
		printf("\n\tPROMISC Descriptors:\t\t%d", dev.promiscuity);
	printf("\n\n");	
}

int iff_stat()
{
	struct net_device *p, dev;
	unsigned long kaddr=0;

	p=NULL;
	kaddr=find_kmem_offset(DEV_BASE_OFF);
	if(kaddr)p=(struct net_device *)kaddr;

	fd=open(KMEM, O_RDONLY);
	if(kread(fd, (unsigned long)p, &p, sizeof(struct net_device)) == -1) err("kread error");
	for(; p; p = dev.next){
			if(kread(fd, (unsigned long)p, &dev, sizeof(struct net_device)) == -1) err("kread error");
			if(kread(fd, (unsigned long)dev.name, &name, 9) == -1) err("kread error");
			if(!strcmp(name, iff)) {
				print_if(dev);
				exit(0);
			}
	}
	printf("\n");
	exit(0);
}
