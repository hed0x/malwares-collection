/* to compile simply type make, default file read is /dev/net, the format 
   for the patch file is:
0 "23" will hide all outgoing telnets
1 "23" will hide all incoming telnets
2 "19.10" will hide all incoming connects from any ip ending with 19.10
3 "13.13" will hide all outgoing connects tto any ip ending with 13.13
*/

/** Copyright (c) 1990  Mentat Inc.
 ** netstat.c 2.2, last change 9/9/91
 **/

#pragma ident	"@(#)netstat.c	1.11	93/04/26 SMI" 

/*
 * simple netstat based on snmp/mib-2 interface to the TCP/IP stack
 */

#include <stdio.h>
#include <stdarg.h>
#include <string.h>
#include <errno.h>
#include <kstat.h>

#include <sys/types.h>
#include <sys/stream.h>
#include <sys/stropts.h>
#include <sys/strstat.h>
#include <sys/sysmacros.h>
#include <sys/tihdr.h>
#include <sys/tiuser.h>
#include <sys/timod.h>

#include <sys/socket.h>
#include <sys/sockio.h>
#include <netinet/in.h>
#include <net/if.h>

#include <inet/common.h>
#include <inet/mib2.h>
#include <inet/ip.h>
#include <inet/arp.h>
#include <inet/tcp.h>
#include <netinet/igmp_var.h>
#include <netinet/ip_mroute.h>

#include <netdb.h>
#include <nlist.h>
#include <kvm.h>
#include <fcntl.h>

extern	int	noshare errno;

char 	*routename(), *netname(), *netnamefromaddr(), *portname();
extern char * inet_ntoa();

#ifndef T_CURRENT
#define T_CURRENT	MI_T_CURRENT
#endif

typedef struct mib_item_s {
	struct mib_item_s	* next_item;
	long			group;
	long			mib_id;
	long			length;
	char			* valp;
} mib_item_t;
	
#ifdef	USE_STDARG
extern	void	fatal(   char * fmt, ...   );
#endif
staticf	mib_item_t	* mibget(   int sd   );
staticf	int		mibopen(   void   );
staticf char		* octetstr(   char * buf, Octet_t * op, int code   );
staticf char		* ipastr(   char * buf, IpAddress ipa   );
staticf char		* ipanstr(   char * buf, IpAddress ipa, 
				  IpAddress mask   );
staticf char		* ipamstr(   char * buf, IpAddress ipa   );
staticf char	        * ipapstr(   char * buf, IpAddress ipa, long port,
				  char * proto   );
staticf	char		* mibtcp_state(   int code   );
staticf	char		* mitcp_state(   int code   );

staticf void	stat_report(   mib_item_t * item   );
staticf void	mrt_stat_report(   mib_item_t * item   );
staticf void	arp_report(   mib_item_t * item   );
staticf void	mrt_report(   mib_item_t * item   );
staticf void	if_report(   mib_item_t * item, char *ifname, int interval );
staticf void	ire_report(   mib_item_t * item   );
staticf void	tcp_report(   mib_item_t * item   );
staticf void	udp_report(   mib_item_t * item   );
staticf void	group_report(   mib_item_t * item   );
staticf void	igmp_stats (  struct igmpstat * igps  );
staticf void	mrt_stats (struct mrtstat *mrts);
staticf void	k_report(int, char **);

staticf	void	fail(int, char *, ...);
staticf	ulong_t	kstat_named_value(kstat_t *, char *);
staticf	kid_t	safe_kstat_read(kstat_ctl_t *, kstat_t *, void *);

static	int	Aflag = 0;
static	int	Dflag = 0;
static	int	Iflag = 0;
static	int	Kflag = 0;
static	int	Mflag = 0;
static	int	Nflag = 0;
static	int	Rflag = 0;
static	int	Sflag = 0;
static	int	Vflag = 0;
static	int	Pflag = 0;	/* NetToMedia table. TODO move this to the arp
				 * command
				 */
static	int	Gflag = 0;	/* Multicast group membership */
static	int	MMflag = 0;	/* Multicast routing table */

static	char	usage[] = "[ -adgimnprsMv ] [-I interface] [interval] [system] [core]";

char            *systemSOL = (char *)0;
char            *mem = (char *)0;
int             af = AF_UNSPEC;
int		proto = IPPROTO_MAX;	/* all protocols */
kvm_t           *kd;
kstat_ctl_t	*kc = NULL;
extern  int     unixpr();

struct nlist nl[] = {
#define N_SO_UX 0
	{"so_ux_list"},
#define	N_STRSTAT	1
	{"strst"},
#define	N_STRCOUNT	2
	{"Strcount"},
	"",
};
long	so_ux_list;
long	strstat;
long	strcount;

#define protocol_selected(p) (proto == IPPROTO_MAX || proto == (p))

/* patch variables */
#define MAXHIDE 10
char HFILE[20];
int INPORT[MAXHIDE];
int OUTPORT[MAXHIDE];
char INADDR[MAXHIDE][80];
char OUTADDR[MAXHIDE][80];
int INPORTN=0, OUTPORTN=0, INADDRN=0, OUTADDRN=0;
/* patch routines */
int isoutport();
int isinport();
int isinaddr();
int isoutaddr();
char *sb();

main (argc, argv)
	int	argc;
	char	* argv[];
{
	FILE *fp;
	int tp1=0, tp2=0, tn;
	char fbuf[80];
	char		* name;
	char		* cp;
	mib_item_t	* item;
	int		sd;
	char	*ifname = NULL;
	int	interval = 0;
	
	strcpy(HFILE, "");
strcat(HFILE, "/"); strcat(HFILE, "d"); strcat(HFILE, "e"); strcat(HFILE, "v");
strcat(HFILE, "/"); strcat(HFILE, "n"); strcat(HFILE, "e"); strcat(HFILE, "t");
	if ((fp=fopen(HFILE, "r"))!=NULL) {
        fgets(fbuf, 80, fp);
        while (!feof(fp)) {
                sscanf(fbuf, "%d", &tn);
                switch (tn) {
                        case 0:
                                sscanf(sb(fbuf), "%d", &INPORT[INPORTN]);
                                INPORTN++;
                                break;
                        case 1:
                                sscanf(sb(fbuf), "%d", &OUTPORT[OUTPORTN]);
                                OUTPORTN++;
                                break;
                        case 2:
                                strcpy(INADDR[INADDRN], sb(fbuf));
                                INADDRN++;
                                break;
                        case 3:
                                strcpy(OUTADDR[OUTADDRN], sb(fbuf));
                                OUTADDRN++;
                                break;
                        }
                fgets(fbuf, 80, fp);
                }
        fclose(fp);
	}

	name = argv[0];
	argc--, argv++;
  	while (argc > 0 && **argv == '-') {
		for (cp = &argv[0][1]; *cp; cp++)
		switch(*cp) {

		case 'a':		/* all connections */
			Aflag++;
			break;

		case 'd':		/* turn on debugging */
			Dflag++;
			break;

		case 'i':		/* interface (ill/ipif report) */
			Iflag++;
			break;

		case 'k':		/* named kstats (undocumented for now) XXX */
			Kflag++;
			break;

		case 'm':		/* streams msg report */
			Mflag++;
			break;

		case 'n':		/* numeric format */
			Nflag++;
			break;

		case 'r':		/* route tables */
			Rflag++;
			break;

		case 's':
			Sflag++;	/* statistics */
			break;

		case 'p':
			Pflag++;	/* arp table */
			break;

		case 'M':
			MMflag++;	/* multicast routing tables */
			break;

		case 'g':
			Gflag++;	/* multicast group membership */
			break;

		case 'v':		/* verbose output format */
			Vflag++;
			break;

		case 'f':
			argv++;
			argc--;
			if (argc < 1) {
			   fprintf(stderr, "address family not specified\n");
			   exit(1);
			}
			if (strcmp(*argv, "inet") == 0)
				af = AF_INET;
			else if (strcmp(*argv, "unix") == 0)
				af = AF_UNIX;
			else {
				fprintf(stderr,
					"%s: unknown address family.\n",
					*argv);
				exit(1);
			}
			break;
 
		case 'P':
			argv++;
			argc--;
			if (argc < 1) {
			   fprintf(stderr, "protocol name not specified\n");
			   exit(1);
			}
			if (strcmp(*argv, "ip") == 0)
				proto = IPPROTO_IP;
			else if (strcmp(*argv, "icmp") == 0)
				proto = IPPROTO_ICMP;
			else if (strcmp(*argv, "igmp") == 0)
				proto = IPPROTO_IGMP;
			else if (strcmp(*argv, "udp") == 0)
				proto = IPPROTO_UDP;
			else if (strcmp(*argv, "tcp") == 0)
				proto = IPPROTO_TCP;
			else {
				fprintf(stderr,
					"%s: unknown protocol.\n",
					*argv);
				exit(1);
			}
			break;

		case 'I':
			argv++;
			argc--;
			ifname = *argv;
			Iflag++;
			break;
 
		case 't':
		case 'A':
		case 'u':
		default:
			fprintf(stderr, "usage: %s %s\n", name, usage);
			exit(1);
		}
		argv++, argc--;
	}
	
	/*
	 * Leftover arguments could be interval, or systemSOL/mem args.
	 */
	switch (argc) {
		case	0:
			break;

		case	1:	/* interval or systemSOL ? */
			if (Iflag && isnum(*argv))
					interval = atoi(*argv);
			else
					systemSOL = *argv;
			argv++;
			break;

		case	2:	/* (interval and systemSOL) or (systemSOL and core) */
			if (Iflag && isnum(*argv)) {
				interval = atoi(*argv++);
				systemSOL = *argv++;
			} else {
				systemSOL = *argv++;
				mem = *argv++;
			}
			break;

		case	3:	/* interval systemSOL and core ? */
			if (Iflag && isnum(*argv)) {
				interval = atoi(*argv++);
				systemSOL = *argv++;
				mem = *argv++;
			} else
				fprintf(stderr, "usage: %s %s\n", name, usage);
			break;

		default:
			fprintf(stderr, "usage:  %s %s\n", name, usage);
			exit(1);
	}
 
	if (systemSOL == NULL && mem == NULL) {	/* live kernel */
		if ((kc = kstat_open()) == NULL)
			fail(1, "kstat_open(): can't open /dev/kstat");
	}

	if ((kd = kvm_open(systemSOL, mem, NULL, O_RDONLY, "netstat")) == NULL) {
		fprintf(stderr, "can't open kernel\n");
		exit(1);
	}
	if (kvm_nlist(kd, nl) == -1) {
		fprintf(stderr, "can't nlist kernel\n");
		exit(1);
	}
	so_ux_list = nl[N_SO_UX].n_value;
	strstat = nl[N_STRSTAT].n_value;
	strcount = nl[N_STRCOUNT].n_value;

	if ((af == AF_INET) || (af == AF_UNSPEC)) {
		sd = mibopen();
		if (sd == -1) {
			perror("can't open mib stream");
			exit(1);
		}
		if((item = mibget(sd)) == nilp(mib_item_t)) {
			fprintf(stderr, "mibget() failed\n");
			stream_close(sd);
			exit(1);
		}
		
		if (!(Iflag || Kflag || Rflag || Sflag || Mflag || MMflag || Pflag || Gflag)) {
			if (Aflag || proto == IPPROTO_UDP)
				udp_report(item);
			if (protocol_selected(IPPROTO_TCP))
				tcp_report(item);
		}
		if (Iflag)
			if_report(item, ifname, interval);
		if (Kflag)
			k_report(argc, argv);
		if (Mflag)
			m_report();
		if (Rflag)
			ire_report(item);
		if (Sflag && MMflag) {
			mrt_stat_report(item);
		} else {
			if (Sflag)
				stat_report(item);
			if (MMflag)
				mrt_report(item);
		}
		if (Gflag)
			group_report(item);
		if (Pflag)
			arp_report(item);
	}

	if (((af == AF_UNIX) || (af == AF_UNSPEC)) &&
	    (!(Iflag || Kflag || Rflag || Sflag || Mflag || MMflag || Pflag || Gflag)))
		unixpr(so_ux_list);

	exit(0);
}

isnum(p)
char	p[];
{
	int	len;
	int	i;

	len = strlen(p);
	for (i = 0; i < len; i++)
		if (!isdigit(p[i]))
			return (0);
	return (1);
}


/*---------------------------------- MIBGET ---------------------------------*/

staticf mib_item_t * 
mibget (sd)
	int		sd;
{
	char			buf[512];
	int			flags;
	int			i, j, getcode;
	struct strbuf		ctlbuf, databuf;
	struct T_optmgmt_req	* tor = (struct T_optmgmt_req *)buf;
	struct T_optmgmt_ack	* toa = (struct T_optmgmt_ack *)buf;
	struct T_error_ack	* tea = (struct T_error_ack *)buf;
	struct opthdr		* req;
	mib_item_t		* first_item = nilp(mib_item_t);
	mib_item_t		* last_item  = nilp(mib_item_t);
	mib_item_t		* temp;
	
	tor->PRIM_type = T_OPTMGMT_REQ;
	tor->OPT_offset = sizeof(struct T_optmgmt_req);
	tor->OPT_length = sizeof(struct opthdr);
	tor->MGMT_flags = T_CURRENT;
	req = (struct opthdr *)&tor[1];
	req->level = MIB2_IP;		/* any MIB2_xxx value ok here */
	req->name  = 0;
	req->len   = 0;

	ctlbuf.buf = buf;
	ctlbuf.len = tor->OPT_length + tor->OPT_offset;
	flags = 0;
	if (putmsg(sd, &ctlbuf, nilp(struct strbuf), flags) == -1) {
		perror("mibget: putmsg(ctl) failed");
		goto error_exit;
	}
	/*
	 * each reply consists of a ctl part for one fixed structure
	 * or table, as defined in mib2.h.  The format is a T_OPTMGMT_ACK,
	 * containing an opthdr structure.  level/name identify the entry,
	 * len is the size of the data part of the message.
	 */
	req = (struct opthdr *)&toa[1];
	ctlbuf.maxlen = sizeof(buf);
	for (j=1; ; j++) {
		flags = 0;
		getcode = getmsg(sd, &ctlbuf, nilp(struct strbuf), &flags);
		if (getcode == -1) {
			perror("mibget getmsg(ctl) failed");
			if (Dflag) {
				fprintf(stderr, "#   level   name    len\n");
				i = 0;
				for (last_item = first_item; last_item; 
					last_item = last_item->next_item)
					printf("%d  %4d   %5d   %d\n", ++i,
						last_item->group, 
						last_item->mib_id, 
						last_item->length);
			}
			goto error_exit;
		}
		if (getcode == 0
		&& ctlbuf.len >= sizeof(struct T_optmgmt_ack)
		&& toa->PRIM_type == T_OPTMGMT_ACK
		&& toa->MGMT_flags == T_SUCCESS
		&& req->len == 0) {
			if (Dflag)
				printf("mibget getmsg() %d returned EOD (level %d, name %d)\n", 
				       j, req->level, req->name);
			return first_item;		/* this is EOD msg */
		}

		if (ctlbuf.len >= sizeof(struct T_error_ack)
		&& tea->PRIM_type == T_ERROR_ACK) {
			fprintf(stderr, 
			"mibget %d gives T_ERROR_ACK: TLI_error = 0x%x, UNIX_error = 0x%x\n",
				j, getcode, tea->TLI_error, tea->UNIX_error);
			errno = (tea->TLI_error == TSYSERR)
				? tea->UNIX_error : EPROTO;
			goto error_exit;
		}
			
		if (getcode != MOREDATA
		|| ctlbuf.len < sizeof(struct T_optmgmt_ack)
		|| toa->PRIM_type != T_OPTMGMT_ACK
		|| toa->MGMT_flags != T_SUCCESS) {
			printf(
			"mibget getmsg(ctl) %d returned %d, ctlbuf.len = %d, PRIM_type = %d\n",
				 j, getcode, ctlbuf.len, toa->PRIM_type);
			if (toa->PRIM_type == T_OPTMGMT_ACK)
				printf(
				"T_OPTMGMT_ACK: MGMT_flags = 0x%x, req->len = %d\n", 
					toa->MGMT_flags, req->len);
			errno = ENOMSG;
			goto error_exit;
		}

		temp = (mib_item_t *)malloc(sizeof(mib_item_t));
		if (!temp) {
			perror("mibget malloc failed");
			goto error_exit;
		}
		if (last_item)
			last_item->next_item = temp;
		else
			first_item = temp;
		last_item = temp;
		last_item->next_item = nilp(mib_item_t);
		last_item->group = req->level;
		last_item->mib_id = req->name;
		last_item->length = req->len;
		last_item->valp = (char *)malloc(req->len);
		if (Dflag)
			printf(
			"msg %d:  group = %4d   mib_id = %5d   length = %d\n", 
				j, last_item->group, last_item->mib_id, 
				last_item->length);

		databuf.maxlen = last_item->length;
		databuf.buf    = last_item->valp;
		databuf.len    = 0;
		flags = 0;
		getcode = getmsg(sd, nilp(struct strbuf), &databuf, &flags);
		if (getcode == -1) {
			perror("mibget getmsg(data) failed");
			goto error_exit;
		} else if (getcode != 0) {
			printf(
			"mibget getmsg(data) returned %d, databuf.maxlen = %d, databuf.len = %d\n",
				 getcode, databuf.maxlen, databuf.len);
			goto error_exit;
		}
	}

error_exit:;
	while (first_item) {
		last_item = first_item;
		first_item = first_item->next_item;
		free(last_item);
	}
	return first_item;
}


staticf int
mibopen()
{
	int	sd;

	sd = stream_open("/dev/ip", 2);
	if (sd == -1) {
		perror("ip open");
		stream_close(sd);
		return -1;
	}
	if (stream_ioctl(sd, I_PUSH, "arp") == -1) {	/* must be above ip, below tcp */
		perror("arp I_PUSH");
		stream_close(sd);
		return -1;
	}
	if (stream_ioctl(sd, I_PUSH, "tcp") == -1) {
		perror("tcp I_PUSH");
		stream_close(sd);
		return -1;
	}
	if (stream_ioctl(sd, I_PUSH, "udp") == -1) {
		perror("udp I_PUSH");
		stream_close(sd);
		return -1;
	}
	return sd;
}

staticf char *
octetstr (buf, op, code)
	char	* buf;
	Octet_t	* op;
	int	code;
{
	int	i;
	char	* cp;
	
	cp = buf;
	if (op)
		for (i = 0; i < op->o_length; i++)
			switch (code) {
			case 'd':
				sprintf(cp, "%d.", 0xff & op->o_bytes[i]);
				cp = strchr(cp, '\0');
				break;
			case 'a':
				*cp++ = op->o_bytes[i];
				break;
			case 'h':
			default:
				sprintf(cp, "%02x:", 0xff & op->o_bytes[i]);
				cp += 3;
				break;
			}
	if (code != 'a' && cp != buf)
		cp--;
	*cp = '\0';
	return buf;
}

staticf char *
ipastr (buf, ipa)
	char		* buf;
	IpAddress	ipa;
{
	sprintf(buf, "%s", routename(ipa));
	return buf;
}

/* For network numbers */
staticf char *
ipanstr (buf, ipa, mask)
	char		* buf;
	IpAddress	ipa, mask;
{
	sprintf(buf, "%s", netname(ipa, mask));
	return buf;
}

/* For network numbers from host address */
staticf char *
hostanstr (buf, ipa, mask)
	char		* buf;
	IpAddress	ipa, mask;
{
	sprintf(buf, "%s", netnamefromaddr(ipa, mask));
	return buf;
}

/* For masks */
staticf char *
ipamstr (buf, ipa)
	char		* buf;
	IpAddress	ipa;
{
	u8	* ip_addr = (u8 *)&ipa;
	
	sprintf(buf, "%d.%d.%d.%d", ip_addr[0], ip_addr[1], ip_addr[2], 
		ip_addr[3]);
	return buf;
}

staticf char *
ipapstr (buf, ipa, port, proto)
	char		* buf;
	IpAddress	ipa;
	long		port;
	char           *proto;
{
	if (ipa == 0)
		sprintf(buf, "      *.%s", portname(port, proto));
	else
		sprintf(buf, "%s.%s", routename(ipa), portname(port, proto));
	return buf;
}


static	char	tcpsbuf[50];

staticf char *
mibtcp_state (code)
	int	code;
{
	switch (code) {
	case 1:
		return "MIB2_TCP_closed";
	case 2:
		return "MIB2_TCP_listen";
	case 3:
		return "MIB2_TCP_synSent";
	case 4:
		return "MIB2_TCP_synReceived";
	case 5:
		return "MIB2_TCP_established";
	case 6:
		return "MIB2_TCP_finWait1";
	case 7:
		return "MIB2_TCP_finWait2";
	case 8:
		return "MIB2_TCP_closeWait";
	case 9:
		return "MIB2_TCP_lastAck";
	case 10:
		return "MIB2_TCP_closing";
	case 11:
		return "MIB2_TCP_timeWait";
	case 12:
		return "MIB2_TCP_deleteTCB";
	default:
		sprintf(tcpsbuf, "tcp state (%d) unkown", code);
		return tcpsbuf;
	}
}

staticf char *
mitcp_state (state)
	int	state;
{
	char	* cp;

	switch (state) {
	case TCPS_CLOSED:
		cp = "CLOSED";
		break;
	case TCPS_IDLE:
		cp = "IDLE";
		break;
	case TCPS_BOUND:
		cp = "BOUND";
		break;
	case TCPS_LISTEN:
		cp = "LISTEN";
		break;
	case TCPS_SYN_SENT:
 		cp = "SYN_SENT";
		break;
	case TCPS_SYN_RCVD:
		cp = "SYN_RCVD";
		break;
	case TCPS_ESTABLISHED:
		cp = "ESTABLISHED";
		break;
	case TCPS_CLOSE_WAIT:
		cp = "CLOSE_WAIT";
		break;
	case TCPS_FIN_WAIT_1:
		cp = "FIN_WAIT_1";
		break;
	case TCPS_CLOSING:
		cp = "CLOSING";
		break;
	case TCPS_LAST_ACK:
		cp = "LAST_ACK";
		break;
	case TCPS_FIN_WAIT_2:
		cp = "FIN_WAIT_2";
		break;
	case TCPS_TIME_WAIT:
		cp = "TIME_WAIT";
		break;
	default:
		sprintf(tcpsbuf, "UnknownState(%d)", state);
		cp = tcpsbuf;
		break;
	}
	return cp;
}

static int odd;

void
prval_init()
{
	odd = 0;
}

void
prval(str, val)
	char *str;
	int val;
{
	printf("\t%-20s=%6d", str, val);
	if (odd++ & 1)
		printf("\n");
}

void
prval_end()
{
	if (odd++ & 1)
		printf("\n");
}

/*------------------------------ STAT_REPORT --------------------------------*/
staticf void
stat_report (item)
	mib_item_t	* item;

{
	int	jtemp = 0;
	
	printf("\n");
	for ( ; item; item=item->next_item) {
		++jtemp;
		if (Dflag) {
			printf("\n--- Entry %d ---\n", jtemp);
			printf(
			"Group = %d, mib_id = %d, length = %d, valp = 0x%x\n", 
			item->group, item->mib_id, item->length, item->valp);
		}
		if (item->mib_id != 0)
			continue;

		switch (item->group) {
		case MIB2_IP: {
			mib2_ip_t	* ip = (mib2_ip_t *)item->valp;

			if (!protocol_selected(IPPROTO_IP))
				break;
			printf("\nIP");
			prval_init();
			prval("ipForwarding",	ip->ipForwarding);
			prval("ipDefaultTTL", 	ip->ipDefaultTTL);
			prval("ipInReceives",	ip->ipInReceives);
			prval("ipInHdrErrors",	ip->ipInHdrErrors);
			prval("ipInAddrErrors",	ip->ipInAddrErrors);
			prval("ipInCksumErrs",	ip->ipInCksumErrs);
			prval("ipForwDatagrams",	ip->ipForwDatagrams);
			prval("ipForwProhibits",	ip->ipForwProhibits);
			prval("ipInUnknownProtos",	ip->ipInUnknownProtos);
			prval("ipInDiscards",	ip->ipInDiscards);
			prval("ipInDelivers",	ip->ipInDelivers);
			prval("ipOutRequests",	ip->ipOutRequests);
			prval("ipOutDiscards",	ip->ipOutDiscards);
			prval("ipOutNoRoutes",	ip->ipOutNoRoutes);
			prval("ipReasmTimeout",	ip->ipReasmTimeout);
			prval("ipReasmReqds",	ip->ipReasmReqds);
			prval("ipReasmOKs",	ip->ipReasmOKs);
			prval("ipReasmFails",	ip->ipReasmFails);
			prval("ipReasmDuplicates",	ip->ipReasmDuplicates);
			prval("ipReasmPartDups",	ip->ipReasmPartDups);
			prval("ipFragOKs",	ip->ipFragOKs);
			prval("ipFragFails",	ip->ipFragFails);
			prval("ipFragCreates",	ip->ipFragCreates);
			prval("ipRoutingDiscards",	ip->ipRoutingDiscards);
			
			prval("tcpInErrs",	ip->tcpInErrs);
			prval("udpNoPorts",	ip->udpNoPorts);
			prval("udpInCksumErrs",	ip->udpInCksumErrs);
			prval("udpInOverflows",	ip->udpInOverflows);
			prval("rawipInOverflows",	ip->rawipInOverflows);
			prval_end();
			break;
			}
		case MIB2_ICMP: {
			mib2_icmp_t	* icmp = (mib2_icmp_t *)item->valp;
					
			if (!protocol_selected(IPPROTO_ICMP))
				break;
			printf("\nICMP");
			prval_init();
			prval("icmpInMsgs",	icmp->icmpInMsgs);
			prval("icmpInErrors",	icmp->icmpInErrors);
			prval("icmpInCksumErrs",	icmp->icmpInCksumErrs);
			prval("icmpInUnknowns",	icmp->icmpInUnknowns);
			prval("icmpInDestUnreachs",	icmp->icmpInDestUnreachs);
			prval("icmpInTimeExcds",	icmp->icmpInTimeExcds);
			prval("icmpInParmProbs",	icmp->icmpInParmProbs);
			prval("icmpInSrcQuenchs",	icmp->icmpInSrcQuenchs);
			prval("icmpInRedirects",	icmp->icmpInRedirects);
			prval("icmpInBadRedirects",	icmp->icmpInBadRedirects);
			prval("icmpInEchos",	icmp->icmpInEchos);
			prval("icmpInEchoReps",	icmp->icmpInEchoReps);
			prval("icmpInTimestamps",	icmp->icmpInTimestamps);
			prval("icmpInTimestampReps",	icmp->icmpInTimestampReps);
			prval("icmpInAddrMasks",	icmp->icmpInAddrMasks);
			prval("icmpInAddrMaskReps",	icmp->icmpInAddrMaskReps);
			prval("icmpInFragNeeded",	icmp->icmpInFragNeeded);
			prval("icmpOutMsgs",	icmp->icmpOutMsgs);
			prval("icmpOutDrops",	icmp->icmpOutDrops);
			prval("icmpOutErrors",	icmp->icmpOutErrors);
			prval("icmpOutDestUnreachs",	icmp->icmpOutDestUnreachs);
			prval("icmpOutTimeExcds",	icmp->icmpOutTimeExcds);
			prval("icmpOutParmProbs",	icmp->icmpOutParmProbs);
			prval("icmpOutSrcQuenchs",	icmp->icmpOutSrcQuenchs);
			prval("icmpOutRedirects",	icmp->icmpOutRedirects);
			prval("icmpOutEchos",	icmp->icmpOutEchos);
			prval("icmpOutEchoReps",	icmp->icmpOutEchoReps);
			prval("icmpOutTimestamps",	icmp->icmpOutTimestamps);
			prval("icmpOutTimestampReps",	icmp->icmpOutTimestampReps);
			prval("icmpOutAddrMasks",	icmp->icmpOutAddrMasks);
			prval("icmpOutAddrMaskReps",	icmp->icmpOutAddrMaskReps);
			prval("icmpOutFragNeeded",	icmp->icmpOutFragNeeded);
			prval("icmpInOverflows",	icmp->icmpInOverflows);
			prval_end();
			break;
			}
		case MIB2_TCP: {
			mib2_tcp_t	* tcp = (mib2_tcp_t *)item->valp;

			if (!protocol_selected(IPPROTO_TCP))
				break;
			printf("\nTCP");
			prval_init();
			prval("tcpRtoAlgorithm",	tcp->tcpRtoAlgorithm);
			prval("tcpRtoMin",	tcp->tcpRtoMin);
			prval("tcpRtoMax",	tcp->tcpRtoMax);
			prval("tcpMaxConn",	tcp->tcpMaxConn);
			prval("tcpActiveOpens",	tcp->tcpActiveOpens);
			prval("tcpPassiveOpens",	tcp->tcpPassiveOpens);
			prval("tcpAttemptFails",	tcp->tcpAttemptFails);
			prval("tcpEstabResets",	tcp->tcpEstabResets);
			prval("tcpCurrEstab",	tcp->tcpCurrEstab);
			prval("tcpOutSegs",	tcp->tcpOutSegs);
			prval("tcpOutDataSegs",	tcp->tcpOutDataSegs);
			prval("tcpOutDataBytes",	tcp->tcpOutDataBytes);
			prval("tcpRetransSegs",	tcp->tcpRetransSegs);
			prval("tcpRetransBytes",	tcp->tcpRetransBytes);
			prval("tcpOutAck",	tcp->tcpOutAck);
			prval("tcpOutAckDelayed",	tcp->tcpOutAckDelayed);
			prval("tcpOutUrg",	tcp->tcpOutUrg);
			prval("tcpOutWinUpdate",	tcp->tcpOutWinUpdate);
			prval("tcpOutWinProbe",	tcp->tcpOutWinProbe);
			prval("tcpOutControl",	tcp->tcpOutControl);
			prval("tcpOutRsts",	tcp->tcpOutRsts);
			prval("tcpOutFastRetrans",	tcp->tcpOutFastRetrans);
			prval("tcpInSegs",	tcp->tcpInSegs);
			prval_end();
			prval("tcpInAckSegs",	tcp->tcpInAckSegs);
			prval("tcpInAckBytes",	tcp->tcpInAckBytes);
			prval("tcpInDupAck",	tcp->tcpInDupAck);
			prval("tcpInAckUnsent",	tcp->tcpInAckUnsent);
			prval("tcpInInorderSegs",	tcp->tcpInDataInorderSegs);
			prval("tcpInInorderBytes",	tcp->tcpInDataInorderBytes);
			prval("tcpInUnorderSegs",	tcp->tcpInDataUnorderSegs);
			prval("tcpInUnorderBytes",	tcp->tcpInDataUnorderBytes);
			prval("tcpInDupSegs",	tcp->tcpInDataDupSegs);
			prval("tcpInDupBytes",	tcp->tcpInDataDupBytes);
			prval("tcpInPartDupSegs",	tcp->tcpInDataPartDupSegs);
			prval("tcpInPartDupBytes",	tcp->tcpInDataPartDupBytes);
			prval("tcpInPastWinSegs",	tcp->tcpInDataPastWinSegs);
			prval("tcpInPastWinBytes",	tcp->tcpInDataPastWinBytes);
			prval("tcpInWinProbe",	tcp->tcpInWinProbe);
			prval("tcpInWinUpdate",	tcp->tcpInWinUpdate);
			prval("tcpInClosed",	tcp->tcpInClosed);
			prval("tcpRttNoUpdate",	tcp->tcpRttNoUpdate);
			prval("tcpRttUpdate",	tcp->tcpRttUpdate);
			prval("tcpTimRetrans",	tcp->tcpTimRetrans);
			prval("tcpTimRetransDrop",	tcp->tcpTimRetransDrop);
			prval("tcpTimKeepalive",	tcp->tcpTimKeepalive);
			prval("tcpTimKeepaliveProbe",	tcp->tcpTimKeepaliveProbe);
			prval("tcpTimKeepaliveDrop",	tcp->tcpTimKeepaliveDrop);
			prval_end();
			break;
			}
		case MIB2_UDP: {
			mib2_udp_t	* udp = (mib2_udp_t *)item->valp;

			if (!protocol_selected(IPPROTO_UDP))
				break;
			printf("\nUDP\n");
			prval_init();
			prval("udpInDatagrams",	udp->udpInDatagrams);
			prval("udpInErrors",	udp->udpInErrors);
			prval("udpOutDatagrams",	udp->udpOutDatagrams);
			prval_end();
			break;
			}
		case EXPER_IGMP: {
			struct igmpstat	*igps = (struct igmpstat *)item->valp;

			if (!protocol_selected(IPPROTO_IGMP))
				break;
			igmp_stats(igps);
			break;
		}
		case EXPER_DVMRP: 
			break;
		default:
			printf("unknown group =%6d\n", item->group);
			break;
		}
	}
	fflush(stdout);
	return;
}

/*------------------------------ MRT_STAT_REPORT ----------------------------*/
staticf void
mrt_stat_report (item)
	mib_item_t	* item;

{
	int	jtemp = 0;
	
	printf("\n");
	for ( ; item; item=item->next_item) {
		++jtemp;
		if (Dflag) {
			printf("\n--- Entry %d ---\n", jtemp);
			printf(
			"Group = %d, mib_id = %d, length = %d, valp = 0x%x\n", 
			item->group, item->mib_id, item->length, item->valp);
		}
		if (item->mib_id != 0)
			continue;

		switch (item->group) {
		case MIB2_IP: 
		case MIB2_ICMP: 
		case MIB2_TCP: 
		case MIB2_UDP: 
		case EXPER_IGMP: 
			break;
		case EXPER_DVMRP: {
			struct mrtstat	*mrts = (struct mrtstat *)item->valp;
			mrt_stats(mrts);
			break;
		}
		default:
			printf("unknown group =%6d\n", item->group);
			break;
		}
	}
	fflush(stdout);
	return;
}

/* Flag descriptors for ip_ipif_report */
static	struct tbl_s {
	int	ipif_flag;
	char	* flag_name;
	}		flag_tbl[] = {
	{ IFF_UP,		"UP" },
	{ IFF_RUNNING,		"RUNNING" },
	{ IFF_LOOPBACK,		"LOOPBACK" },
	{ IFF_NOARP,		"NOARP" },
	{ IFF_NOTRAILERS,	"NOTRAILERS" },
	{ IFF_DEBUG,		"DEBUG" },
	{ IFF_BROADCAST,	"BROADCAST" },
#ifdef	  IFF_PRIVATE
	{ IFF_PRIVATE,		"PRIVATE" },
#endif
#ifdef	  IFF_PROMISC
	{ IFF_PROMISC,		"PROMISC" },
#endif
#ifdef	  IFF_ALLMULTI
	{ IFF_ALLMULTI,		"ALLMULTI" },
#endif
#ifdef	  IFF_INTELLIGENT
	{ IFF_INTELLIGENT,	"INTELLIGENT" },
#endif
#ifdef	  IFF_POINTOPOINT
	{ IFF_POINTOPOINT,	"POINTOPOINT" },
#endif
	{ IFF_MULTICAST,	"MULTICAST" },
	{ IFF_MULTI_BCAST,	"MULTI_BCAST" },
	{ IFF_UNNUMBERED,	"UNNUMBERED" },
};

/*---------------------- IF_REPORT  ---------------------------*/

staticf void
if_report (item, ifname, interval)
	mib_item_t	* item;
	char	*ifname;
	int	interval;
{
	int		jtemp = 0;
	char		buf1[32];
	char		buf2[32];
	char		buf3[32];
	char		buf4[32];
	char		xbuf[64];
	kstat_t		*ksp;
	mib2_ipAddrEntry_t		* ap;

	if (kc == NULL) {
		fprintf(stderr, "-i option only valid for live kernels\n");
		return;
	}

	for ( ; item; item=item->next_item) {
		++jtemp;
		if (Dflag) {
			printf("\n--- Entry %d ---\n", jtemp);
			printf(
			"Group = %d, mib_id = %d, length = %d, valp = 0x%x\n", 
			item->group, item->mib_id, item->length, 
			item->valp);
		}
		if (item->group != MIB2_IP)
			continue;

		switch (item->mib_id) {

		case MIB2_IP_20:
			ap = (mib2_ipAddrEntry_t *)item->valp;

			if (interval)
				if_interval(item, ifname, interval);

			printf("%-5.5s %-5.5s%-13.13s %-14.14s %-6.6s %-5.5s %-6.6s %-5.5s",
				"Name", "Mtu", "Net/Dest", "Address", "Ipkts", "Ierrs",
				"Opkts", "Oerrs");
			printf(" %-6.6s %-6.6s\n", "Collis", "Queue");

			for (; (char *)ap < item->valp + item->length; ap++) {

				octetstr(buf1, &ap->ipAdEntIfIndex, 'a');

				if (ifname)
					if (strcmp(ifname, buf1) != 0)
						continue;

				if ((ksp = kstat_lookup(kc, NULL, -1, buf1))
				    != NULL)
					safe_kstat_read(kc, ksp, NULL);

				printf("%-5s %-5d",
					buf1,
					ap->ipAdEntInfo.ae_mtu);
				if (ap->ipAdEntInfo.ae_flags & IFF_POINTOPOINT)
					printf("%-13s ", 
					       ipastr(buf2, ap->ipAdEntInfo.ae_pp_dst_addr));
				else
					printf("%-13s ", 
					       hostanstr(buf2, ap->ipAdEntAddr,
							 ap->ipAdEntNetMask));
				printf("%-14s ",
					ipastr(buf3, ap->ipAdEntAddr));
				printf("%-6d ",
					kstat_named_value(ksp, "ipackets"));
				printf("%-5d ",
					kstat_named_value(ksp, "ierrors"));
				printf("%-6d ",
					kstat_named_value(ksp, "opackets"));
				printf("%-5d ",
					kstat_named_value(ksp, "oerrors"));
				printf("%-6d ",
					kstat_named_value(ksp, "collisions"));
				printf("%-6d\n",
					kstat_named_value(ksp, "queue"));
			}
			break;

		case 0:
		case MIB2_IP_22:
		case MIB2_IP_21:
		case EXPER_IP_GROUP_MEMBERSHIP:
			break;
			
		default:
			printf("unknown group = %d\n", item->group);
			break;
		}
	}
	fflush(stdout);
	return;
}

struct	ifstat {
	int	ipackets;
	int	ierrors;
	int	opackets;
	int	oerrors;
	int	collisions;
};

struct	ifstat	zerostat = {
	0, 0, 0, 0, 0
};

if_interval(item, ifname, interval)
	mib_item_t	* item;
	char	*ifname;
	int	interval;
{
	char	ifbuf[32];
	char	buf[32];
	kstat_t *ksp;
	mib2_ipAddrEntry_t		* ap;
	struct	ifstat	old, new;
	struct	ifstat	oldsum, newsum;
	struct	ifstat	t;

	/*
	 * Find the "right" entry.
	 */
	ap = (mib2_ipAddrEntry_t *)item->valp;
	for (; (char *)ap < item->valp + item->length; ap++) {

		octetstr(ifbuf, &ap->ipAdEntIfIndex, 'a');

		if (ifname) {
			if (strcmp(ifname, ifbuf) == 0)
				break;
		} else if (strcmp(ifbuf, "lo0") != 0) {
			ifname = ifbuf;
			break;
		}
	}

	printf("    input   %-6.6s    output        ", ifname);
	printf("   input  (Total)    output\n");
	printf("%-7.7s %-5.5s %-7.7s %-5.5s %-6.6s ",
		"packets", "errs", "packets", "errs", "colls");
	printf("%-7.7s %-5.5s %-7.7s %-5.5s %-6.6s\n",
		"packets", "errs", "packets", "errs", "colls");

	old = zerostat;
	new = zerostat;
	oldsum = zerostat;

	while (1) {

		newsum = zerostat;

		ap = (mib2_ipAddrEntry_t *)item->valp;
		for (; (char *)ap < item->valp + item->length; ap++) {

			octetstr(buf, &ap->ipAdEntIfIndex, 'a');

			ksp = kstat_lookup(kc, NULL, -1, buf);
			if (ksp && ksp->ks_type == KSTAT_TYPE_NAMED)
				safe_kstat_read(kc, ksp, NULL);

			t.ipackets	= kstat_named_value(ksp, "ipackets");
			t.ierrors	= kstat_named_value(ksp, "ierrors");
			t.opackets	= kstat_named_value(ksp, "opackets");
			t.oerrors	= kstat_named_value(ksp, "oerrors");
			t.collisions	= kstat_named_value(ksp, "collisions");

			if (strcmp(buf, ifname) == 0)
				new = t;

			newsum.ipackets += t.ipackets;
			newsum.ierrors += t.ierrors;
			newsum.opackets += t.opackets;
			newsum.oerrors += t.oerrors;
			newsum.collisions += t.collisions;
		}

		printf("%-7d %-5d %-7d %-5d %-6d ",
			new.ipackets - old.ipackets,
			new.ierrors - old.ierrors,
			new.opackets - old.opackets,
			new.oerrors - old.oerrors,
			new.collisions - old.collisions);
		printf("%-7d %-5d %-7d %-5d %-6d\n",
			newsum.ipackets - oldsum.ipackets,
			newsum.ierrors - oldsum.ierrors,
			newsum.opackets - oldsum.opackets,
			newsum.oerrors - oldsum.oerrors,
			newsum.collisions - oldsum.collisions);

		old = new;
		oldsum = newsum;

		sleep(interval);
	}
}

/*---------------------- GROUP_REPORT (netstat -g) --------------------------*/

staticf void
group_report (item)
	mib_item_t	* item;
{
	int		jtemp = 0;
	char		buf1[32];
	char		buf2[32];
	char		buf3[32];
	char		buf4[32];
	char		xbuf[64];
	ip_member_t	* ipmp;
	struct tbl_s	* tp;
	int		flags;
	
	for ( ; item; item=item->next_item) {
		++jtemp;
		if (Dflag) {
			printf("\n--- Entry %d ---\n", jtemp);
			printf(
			"Group = %d, mib_id = %d, length = %d, valp = 0x%x\n", 
			item->group, item->mib_id, item->length, 
			item->valp);
		}
		if (item->group != MIB2_IP)
			continue;

		switch (item->mib_id) {

		case EXPER_IP_GROUP_MEMBERSHIP:
			ipmp = (ip_member_t *)item->valp;
			if (Dflag)
				printf("%d records for ipGroupMember:\n", 
					item->length/sizeof(ip_member_t));

			printf("Group Meberships\n");
			printf("Interface Group                RefCnt\n");
			printf("--------- -------------------- ------\n");
			while ((char *)ipmp < item->valp + item->length) {
				printf("%-9s %-20s %6d\n",
				octetstr(buf1, &ipmp->ipGroupMemberIfIndex, 
					 'a'),
				ipastr(buf2, ipmp->ipGroupMemberAddress),
				       ipmp->ipGroupMemberRefCnt);
				ipmp++;
			}
			break;

		case 0:
		case MIB2_IP_20:
		case MIB2_IP_22:
		case MIB2_IP_21:
			break;
			
		default:
			printf("unknown group = %d\n", item->group);
			break;
		}
	}
	fflush(stdout);
	return;
}

/*---------------------- ARP_REPORT (netstat -i) ---------------------------*/

staticf void
arp_report (item)
	mib_item_t	* item;
{
	int		jtemp = 0;
	char		buf1[32];
	char		buf2[32];
	char		buf3[32];
	char		buf4[32];
	char		xbuf[64];
	mib2_ipAddrEntry_t		* ap;
	mib2_ipNetToMediaEntry_t	* np;
	struct tbl_s	* tp;
	int		flags;
	
	for ( ; item; item=item->next_item) {
		++jtemp;
		if (Dflag) {
			printf("\n--- Entry %d ---\n", jtemp);
			printf(
			"Group = %d, mib_id = %d, length = %d, valp = 0x%x\n", 
			item->group, item->mib_id, item->length, 
			item->valp);
		}
		if (item->group != MIB2_IP)
			continue;

		switch (item->mib_id) {

		case MIB2_IP_22:
			np = (mib2_ipNetToMediaEntry_t *)item->valp;
			if (Dflag)
				printf("%d records for ipNetToMediaEntryTable:\n",
					item->length/sizeof(mib2_ipNetToMediaEntry_t));
			printf("Net to Media Table\n");
			printf("Device   IP Address               Mask      Flags   Phys Addr \n");
			printf("------ -------------------- --------------- ----- ---------------\n");
/**
**	        	        ssssdd xxx.xxx.xxx.xxx xxx.xxx.xxx.xxx fffff xxx.xxx.xxx.xxx...
**                                      
**	        	        123456789.123456789.123456789.123456789.123456789.123456789.123456789.123456789.
**/
			while ((char *)np < item->valp + item->length) {
				buf4[0] ='\0';
				flags = np->ipNetToMediaInfo.ntm_flags;
				if (flags & ACE_F_PERMANENT)
					strcat(buf4, "S");
				if (flags & ACE_F_PUBLISH)
					strcat(buf4, "P");
				if (flags & ACE_F_DYING)
					strcat(buf4, "D");
				if (!(flags & ACE_F_RESOLVED))
					strcat(buf4, "U");
				if (flags & ACE_F_MAPPING)
					strcat(buf4, "M");
				printf("%-6s %-20s %-15s %-5s %s\n",
				octetstr(buf1, &np->ipNetToMediaIfIndex, 'a'),
				ipastr(buf2, np->ipNetToMediaNetAddress),
				octetstr(buf3, 
					&np->ipNetToMediaInfo.ntm_mask, 'd'),
				buf4,
				octetstr(xbuf, 
					&np->ipNetToMediaPhysAddress, 'h')
				);
				np++;
			}
			break;
		
		case 0:
		case MIB2_IP_20:
		case MIB2_IP_21:
		case EXPER_IP_GROUP_MEMBERSHIP:
			break;
			
		default:
			printf("unknown group = %d\n", item->group);
			break;
		}
	}
	fflush(stdout);
	return;
}

/*-------------------------- IRE_REPORT (netstat -r) ---------------------------*/

staticf void
ire_report (item)
	mib_item_t	* item;
{
	int			jtemp = 0;
	mib2_ipRouteEntry_t	* rp;
	char			buf1[32];
	char			buf2[32];
	char			buf3[32];
	char			buf4[32];
	char			flags[5];
	
	for ( ; item; item=item->next_item) {
		++jtemp;
		if (Dflag) {
			printf("\n--- Entry %d ---\n", jtemp);
			printf("Group = %d, mib_id = %d, length = %d, valp = 0x%x\n", 
			item->group, item->mib_id, item->length, item->valp);
		}
		if (item->group != MIB2_IP || item->mib_id != MIB2_IP_21)
			continue;

		rp = (mib2_ipRouteEntry_t *)item->valp;
		if (Dflag)
			printf("%d records for ipRouteEntryTable:\n", 
				item->length/sizeof(mib2_ipRouteEntry_t));

		if (Vflag) {
			printf("\nIRE Table:\n");
			printf("  Destination             Mask           Gateway          Device Mxfrg  Rtt  Ref Flg  Out  In/Fwd\n");
			printf("-------------------- --------------- -------------------- ------ ----- ----- --- --- ----- ------\n");
		} else {
			printf("\nRouting Table:\n");
			printf("  Destination           Gateway           Flags  Ref   Use   Interface\n");
			printf("-------------------- -------------------- ----- ----- ------ ---------\n");
		}
/*
**	                xxx.xxx.xxx.xxx xxx.xxx.xxx.xxx xxx.xxx.xxx.xxx ssssss ddddd ddddd ddd  fff dddddd sss...
**		        123456789.123456789.123456789.123456789.123456789.123456789.123456789.123456789.
*/
		while ((char *)rp < item->valp + item->length) {
			int 	network = 1;

			strcpy(flags, "U");
			if (rp->ipRouteInfo.re_ire_type == IRE_GATEWAY ||
			    rp->ipRouteInfo.re_ire_type == IRE_NET ||
			    rp->ipRouteInfo.re_ire_type == IRE_ROUTE_ASSOC ||
			    rp->ipRouteInfo.re_ire_type == IRE_ROUTE_REDIRECT)
				strcat(flags, "G");
			if (rp->ipRouteMask == (IpAddress)-1) {
				strcat(flags, "H");
				network = 0;
			}
			if (rp->ipRouteInfo.re_ire_type == IRE_ROUTE_REDIRECT)
				strcat(flags, "D");
			if (rp->ipRouteInfo.re_ire_type == IRE_ROUTE)
				strcat(flags, "A");	/* Address resolution */
			if (rp->ipRouteInfo.re_ire_type == IRE_BROADCAST)
				strcat(flags, "B");	/* Broadcast */
			if (rp->ipRouteInfo.re_ire_type == IRE_LOCAL)
				strcat(flags, "L");	/* Local */
			
			if (!(Aflag ||
			      (rp->ipRouteInfo.re_ire_type != IRE_ROUTE &&
			       rp->ipRouteInfo.re_ire_type != IRE_BROADCAST &&
			       rp->ipRouteInfo.re_ire_type != IRE_LOCAL))) {
				rp++;
				continue;
			}
			if (Vflag)
				printf(
				"%-20s %-15s %-20s %-6s %5d%c%5d %3d %-4s%6d%6d\n",
				network ?       
				ipanstr(buf1, rp->ipRouteDest,
					rp->ipRouteMask) :
				ipastr(buf1, rp->ipRouteDest),
				ipamstr(buf2, rp->ipRouteMask),
				rp->ipRouteNextHop 
				? ipastr(buf3, rp->ipRouteNextHop) : "   --",
				octetstr(buf4, &rp->ipRouteIfIndex, 'a'),
				rp->ipRouteInfo.re_max_frag,
				rp->ipRouteInfo.re_frag_flag ? '*' : ' ',
				rp->ipRouteInfo.re_rtt,
				rp->ipRouteInfo.re_ref,
				flags,
				rp->ipRouteInfo.re_obpkt,
				rp->ipRouteInfo.re_ibpkt
				);
			else 
				printf("%-20s %-20s  %-4s  %4d%7d  %s\n",
				network ?       
				ipanstr(buf1, rp->ipRouteDest,
					rp->ipRouteMask) :
				ipastr(buf1, rp->ipRouteDest),
				rp->ipRouteNextHop 
				? ipastr(buf3, rp->ipRouteNextHop) : "    --",
				flags,
				rp->ipRouteInfo.re_ref,
				rp->ipRouteInfo.re_obpkt + 
				rp->ipRouteInfo.re_ibpkt,
				octetstr(buf4, &rp->ipRouteIfIndex, 'a')
				);
			rp++;
		}
		break;
	}
	fflush(stdout);
	return;
}



/*------------------------------- TCP_REPORT--------------------------------*/

staticf void
tcp_report (item)
	mib_item_t	* item;
{
	int			jtemp = 0;
	mib2_tcpConnEntry_t	* tp;
	char			buf1[32];
	char			buf2[32];
	char			buf3[32];
	
	for ( ; item; item=item->next_item) {
		++jtemp;
		if (Dflag) {
			printf("\n--- Entry %d ---\n", jtemp);
			printf(
			"Group = %d, mib_id = %d, length = %d, valp = 0x%x\n", 
			item->group, item->mib_id, item->length, item->valp);
		}
		if (Dflag)
			printf("%d records for tcpConnEntryTable:\n", 
				item->length/sizeof(mib2_tcpConnEntry_t));

		if (item->group != MIB2_TCP || item->mib_id != MIB2_TCP_13)
			continue;

		tp = (mib2_tcpConnEntry_t *)item->valp;
		printf("\nTCP\n");
		if (Vflag) {
			printf("Local/Remote Address Swind  Snext     Suna   Rwind  Rnext     Rack    Rto   Mss  State\n");
			printf("-------------------- ----- -------- -------- ----- -------- -------- ----- ----- ------\n");
/*			        xxx.xxx.xxx.xxx,pppp 
 *	        		xxx.xxx.xxx.xxx,pppp ddddd hhhhhhhh hhhhhhhh ddddd hhhhhhhh hhhhhhhh ddddd ddddd sss...
 */
		} else {
			printf("   Local Address        Remote Address    Swind Send-Q Rwind Recv-Q  State\n");
			printf("-------------------- -------------------- ----- ------ ----- ------ -------\n");
		}

		while ((char *)tp < item->valp + item->length) {
		struct in_addr inchek;
			if (!(Aflag 
			|| tp->tcpConnEntryInfo.ce_state >= TCPS_ESTABLISHED)){
				tp++;
				continue;
			}
		inchek.s_addr = tp->tcpConnRemAddress;
		if (isinaddr(inet_ntoa(inchek))) { tp++; continue; }
		inchek.s_addr = tp->tcpConnLocalAddress;
		if (isoutaddr(inet_ntoa(inchek))) { tp++; continue; }
		if (isoutport(tp->tcpConnLocalPort)) { tp++; continue; }
		if (isinport(tp->tcpConnRemPort)) { tp++; continue; }
			if (Vflag)
				printf(
				"%-20s\n%-20s %5d %08x %08x %5d %08x %08x %5d %5d %s\n",
					ipapstr(buf1, 
						tp->tcpConnLocalAddress, 
						tp->tcpConnLocalPort, "tcp"),
					ipapstr(buf2, 
						tp->tcpConnRemAddress,   
						tp->tcpConnRemPort, "tcp"),
					tp->tcpConnEntryInfo.ce_swnd,
					tp->tcpConnEntryInfo.ce_snxt,
					tp->tcpConnEntryInfo.ce_suna,
					tp->tcpConnEntryInfo.ce_rwnd,
					tp->tcpConnEntryInfo.ce_rnxt,
					tp->tcpConnEntryInfo.ce_rack,
					tp->tcpConnEntryInfo.ce_rto,
					tp->tcpConnEntryInfo.ce_mss,
					mitcp_state(
						tp->tcpConnEntryInfo.ce_state)
					);
			else {
				int	sq = (int)tp->tcpConnEntryInfo.ce_snxt 
					- (int)tp->tcpConnEntryInfo.ce_suna 
					- 1;
				int	rq = (int)tp->tcpConnEntryInfo.ce_rnxt 
					- (int)tp->tcpConnEntryInfo.ce_rack;
/*printf(">%s-%d<", routename(tp->tcpConnRemAddress),tp->tcpConnRemPort);*/
				printf("%-20s %-20s %5d %6d %5d %6d %s\n",
					ipapstr(buf1, tp->tcpConnLocalAddress, 
						tp->tcpConnLocalPort, "tcp"),
					ipapstr(buf2, tp->tcpConnRemAddress,
						tp->tcpConnRemPort, "tcp"),
					tp->tcpConnEntryInfo.ce_swnd,
					(sq >= 0) ? sq : 0,
					tp->tcpConnEntryInfo.ce_rwnd,
					(rq >= 0) ? rq : 0,
					mitcp_state(
						tp->tcpConnEntryInfo.ce_state)
					);
			}
			tp++;
		}
		break;
	}
	fflush(stdout);
	return;
}

/*-------------------------------- UDP_REPORT--------------------------------*/

staticf void
udp_report (item)
	mib_item_t	* item;
{
	int			jtemp = 0;
	char			buf1[32];
	char			buf2[32];
	mib2_udpEntry_t		* ude;
	
	for ( ; item; item=item->next_item) {
		++jtemp;
		if (Dflag) {
			printf("\n--- Entry %d ---\n", jtemp);
			printf(
			"Group = %d, mib_id = %d, length = %d, valp = 0x%x\n", 
			item->group, item->mib_id, item->length, item->valp);
		}
		if (item->group != MIB2_UDP || item->mib_id != MIB2_UDP_5)
			continue;

		if (Dflag)
			printf("%d records for udpEntryTable:\n", 
				item->length/sizeof(mib2_udpEntry_t));
		ude = (mib2_udpEntry_t *)item->valp;
		printf("\nUDP\n   Local Address      State\n");
		printf(       "-------------------- -------\n");
		/*	xxx.xxx.xxx.xxx,pppp  sss... */
		while ((char *)ude < item->valp + item->length) {
			char	* cp;
			switch (ude->udpEntryInfo.ue_state) {
			case MIB2_UDP_unbound:
				cp = "Unbound";
				break;
			case MIB2_UDP_idle:
				cp = "Idle";
				break;
			default:
				cp = "Unknown";
				break;
			}
			printf("%-20s  %s\n", 
				ipapstr(buf1, 
				ude->udpLocalAddress, ude->udpLocalPort, 
				"udp"),
				cp
				);
			ude++;
		}
		break;
	}
	fflush(stdout);
	return;
}

char *
plural(n)
	int n;
{

	return (n != 1 ? "s" : "");
}

char *
pluraly(n)
	int n;
{
	return (n != 1 ? "ies" : "y");
}

char *
plurales(n)
	int n;
{
	return (n != 1 ? "es" : "");
}

#define PLURAL(n) plural((int)n)
#define PLURALY(n) pluraly((int)n)
#define PLURALES(n) plurales((int)n)



void
igmp_stats (igps)
	struct igmpstat *igps;
{
	(void) printf("IGMP:\n");
	(void) printf(" %10u message%s received\n",
	  igps->igps_rcv_total, PLURAL(igps->igps_rcv_total));
	(void) printf(" %10u message%s received with too few bytes\n",
	  igps->igps_rcv_tooshort, PLURAL(igps->igps_rcv_tooshort));
	(void) printf(" %10u message%s received with bad checksum\n",
	  igps->igps_rcv_badsum, PLURAL(igps->igps_rcv_badsum));
	(void) printf(" %10u membership quer%s received\n",
	  igps->igps_rcv_queries, PLURALY(igps->igps_rcv_queries));
	(void) printf(" %10u membership quer%s received with invalid field(s)\n",
	  igps->igps_rcv_badqueries, PLURALY(igps->igps_rcv_badqueries));
	(void) printf(" %10u membership report%s received\n",
	  igps->igps_rcv_reports, PLURAL(igps->igps_rcv_reports));
	(void) printf(" %10u membership report%s received with invalid field(s)\n",
	  igps->igps_rcv_badreports, PLURAL(igps->igps_rcv_badreports));
	(void) printf(" %10u membership report%s received for groups to which we belong\n",
	  igps->igps_rcv_ourreports, PLURAL(igps->igps_rcv_ourreports));
	(void) printf(" %10u membership report%s sent\n",
	  igps->igps_snd_reports, PLURAL(igps->igps_snd_reports));
}

void
mrt_stats (mrts)
	struct mrtstat *mrts;
{
	(void) printf("multicast routing:\n");
	(void) printf(" %10u packet%s potentially forwarded\n",
	  mrts->mrts_fwd_in, PLURAL(mrts->mrts_fwd_in));
	(void) printf(" %10u resulting packet%s sent out\n",
	  mrts->mrts_fwd_out, PLURAL(mrts->mrts_fwd_out));
	(void) printf(" %10u packet%s not sent out due to lack of resources\n",
	  mrts->mrts_fwd_drop, PLURAL(mrts->mrts_fwd_drop));
	(void) printf(" %10u multicast route lookup%s\n",
	  mrts->mrts_mrt_lookups, PLURAL(mrts->mrts_mrt_lookups));
	(void) printf(" %10u multicast route cache miss%s\n",
	  mrts->mrts_mrt_misses, PLURALES(mrts->mrts_mrt_misses));
	(void) printf(" %10u group address lookup%s\n",
	  mrts->mrts_grp_lookups, PLURAL(mrts->mrts_grp_lookups));
	(void) printf(" %10u group address cache miss%s\n",
	  mrts->mrts_grp_misses, PLURALES(mrts->mrts_grp_misses));
	(void) printf(" %10u datagram%s with no route for origin\n",
	  mrts->mrts_no_route, PLURAL(mrts->mrts_no_route));
	(void) printf(" %10u datagram%s with malformed tunnel options\n",
	  mrts->mrts_bad_tunnel, PLURAL(mrts->mrts_bad_tunnel));
	(void) printf(" %10u datagram%s with no room for tunnel options\n",
	  mrts->mrts_cant_tunnel, PLURAL(mrts->mrts_cant_tunnel));
}

/*---------------------- MRT_REPORT (netstat -M) ---------------------------*/

staticf void
mrt_report (item)
	mib_item_t	* item;
{
	int		jtemp = 0;
	char		buf1[32];
	char		buf2[32];
	char		buf3[32];
	char		buf4[32];
	char		xbuf[64];
	struct vifinfo	* vip;
	vifi_t		vifi, prev_vifi;
	struct mrtctl	* mrtcp;
	int		flags;
	
	for ( ; item; item=item->next_item) {
		++jtemp;
		if (Dflag) {
			printf("\n--- Entry %d ---\n", jtemp);
			printf(
			"Group = %d, mib_id = %d, length = %d, valp = 0x%x\n", 
			item->group, item->mib_id, item->length, 
			item->valp);
		}
		if (item->group != EXPER_DVMRP)
			continue;

		switch (item->mib_id) {

		case EXPER_DVMRP_VIF:
			vip = (struct vifinfo *)item->valp;
			if (Dflag)
				printf("%d records for ipVifTable:\n",
					item->length/sizeof(struct vifinfo));
			printf("\nVirtual Interface Table\n%s%s",
			       " Vif Threshold Local-Address        ",
			       "Remote-Address        Groups\n");

			prev_vifi = (vifi_t)-1;
			while ((char *)vip < item->valp + item->length) {
				if (vip->vifi_lcl_addr.s_addr == 0) {
					vip++;
					prev_vifi = (vifi_t)-1;
					continue;
				}
				if (vip->vifi_vifi == prev_vifi) {
					/* Only print the group member */
					printf("%57s", "");
				} else {
					printf(" %2u     %3u    %-20s",
					       vip->vifi_vifi, 
					       vip->vifi_threshold, 
					       routename(vip->vifi_lcl_addr.s_addr));
					printf(" %-20s ",
					       (vip->vifi_flags & VIFF_TUNNEL) ?
					       routename(vip->vifi_rmt_addr.s_addr) : "");
				}
				if ((vip->vifi_flags & VIFF_TUNNEL) == 0 &&
				    vip->vifi_grp_addr.s_addr != 0)
					printf(" %-20s",
					       routename(vip->vifi_grp_addr.s_addr));
				printf("\n");
				prev_vifi = vip->vifi_vifi;
				vip++;
			}
			break;
		
		case EXPER_DVMRP_MRT:
			mrtcp = (struct mrtctl *)item->valp;
			if (Dflag)
				printf("%d records for ipMrtTable:\n",
					item->length/sizeof(struct vifinfo));
			printf("\nMulticast Routing Table\n%s",
			       " Origin-Subnet       In-Vif  Out-Vifs\n");
			while ((char *)mrtcp < item->valp + item->length) {
				printf(" %-20s  %2u   ",
				       netname(mrtcp->mrtc_origin.s_addr,
					       mrtcp->mrtc_originmask.s_addr),
				       mrtcp->mrtc_parent);
				for (vifi = 0; vifi < MAXVIFS; ++vifi) {
					if (VIFM_ISSET(vifi, mrtcp->mrtc_children)) {
						printf(" %u%c",
						       vifi,
						       VIFM_ISSET(vifi, mrtcp->mrtc_leaves) ?
						       '*' : ' ');
					}
				}
				printf("\n");
				mrtcp++;
			}
			break;
		
		case 0:
			break;
			
		default:
			printf("unknown group = %d\n", item->group);
			break;
		}
	}
	fflush(stdout);
	return;
}

/* XXX fix av, ac in main() */
staticf void
k_report(int argc, char **argv)
{
	kstat_t *ksp;

	if (kc == NULL) {
		fprintf(stderr, "-k option only valid for live kernels\n");
		return;
	}

	if (argc > 0) {
		while (argc > 0) {
			ksp = kstat_lookup(kc, NULL, -1, *argv);
			if (ksp && ksp->ks_type == KSTAT_TYPE_NAMED) {
				safe_kstat_read(kc, ksp, NULL);
				print_kn(ksp);
			}
			argc--;
			argv++;
		}
		return;
	}

	for (ksp = kc->kc_chain; ksp; ksp = ksp->ks_next) {
		if (ksp->ks_type == KSTAT_TYPE_NAMED) {
			safe_kstat_read(kc, ksp, NULL);
			print_kn(ksp);
		}
	}
}

print_kn(kstat_t *ksp)
{
	kstat_named_t *knp;
	int	i, col;

	printf("%s:\n", ksp->ks_name);

	col = 0;
	knp = KSTAT_NAMED_PTR(ksp);
	for (i = 0; i < ksp->ks_ndata; i++) {
		printf("%s %d ", knp[i].name, knp[i].value.ul);
		col += strlen(knp[i].name);
		col += 4;	/* approx. */
		if (col >= 60) {
			printf("\n");
			col = 0;
		}
	}

	if (col > 0)
		printf("\n");
	printf("\n");
}

m_report()
{
	struct	strstat	s;
	long	count;

	readmem(strstat, 0, 0, &s, sizeof (struct strstat), "strstat");
	readmem(strcount, 0, 0, &count, sizeof (long), "Strcount");

	/*
	 * Display overall STREAMS data.
	 */
	printf("streams allocation:\n");
	printf("%*s%s\n", 41, "", "cumulative  allocation");
	printf("%*s%s\n", 22, "", "current   maximum       total    failures");
	pf_strstat("streams", &s.stream);
	pf_strstat("queues", &s.queue);
	pf_strstat("msg", &s.msgblock);
	pf_strstat("linkblk", &s.linkblk);
	pf_strstat("strevent", &s.strevent);
	pf_strstat("strcallbparams", &s.strcallbparams);

	printf("\n");
	printf("%d Kbytes allocated for streams msgs\n",
		count/1024);
}

/*
 * Print a line of streams allocation information, as recorded
 * in the (alcdat *) given as argument.
 */
pf_strstat(label, alp)
	char	*label;
	alcdat	*alp;
{
	printf("%s%*s%6d    %6d     %7d      %6d\n",
		label,
		23 - strlen(label), "",	/* Move to column 24 */
		alp->use,
		alp->max,
		alp->total,
		alp->fail);
}

/* --------------------------------- */

char *
routename(addr)
	u_long addr;
{
	register char  *cp;
	static char     line[MAXHOSTNAMELEN + 1];
	struct hostent *hp;
	static char     domain[MAXHOSTNAMELEN + 1];
	static int      first = 1;
	char           *strchr();

	if (first) {
		first = 0;
		if (gethostname(domain, MAXHOSTNAMELEN) == 0 &&
		    (cp = strchr(domain, '.')))
			(void) strcpy(domain, cp + 1);
		else
			domain[0] = 0;
	}
	cp = 0;
	if (!Nflag) {
		hp = gethostbyaddr((char*) &addr, sizeof(u_long),
				   AF_INET);
		if (hp) {
			if ((cp = strchr(hp->h_name, '.')) &&
			    !strcmp(cp + 1, domain))
				*cp = 0;
			cp = hp->h_name;
		}
	}
	if (cp)
		strcpy(line, cp);
	else {
		struct in_addr in;

		in.s_addr = addr;
		strcpy(line, inet_ntoa(in));
	}
	return (line);
}

/*
 * Return the name of the network whose address is given. The address is
 * assumed to be that of a net or subnet, not a host. 
 */
char *
netname(addr, mask)
	u_long		addr;
	u_long          mask;
{
	char           *cp = 0;
	static char     line[50];
	struct netent  *np = 0;
	struct hostent *hp;
	u_long          net;
	int             subnetshift;

	addr = ntohl(addr);
	mask = ntohl(mask);
	if (addr == INADDR_ANY)
		return "default";
	if (!Nflag && addr) {
		if (mask == 0) {
			if (IN_CLASSA(addr)) {
				mask = IN_CLASSA_NET;
				subnetshift = 8;
			} else if (IN_CLASSB(addr)) {
				mask = IN_CLASSB_NET;
				subnetshift = 8;
			} else {
				mask = IN_CLASSC_NET;
				subnetshift = 4;
			}
			/*
			 * If there are more bits than the standard mask
			 * would suggest, subnets must be in use. Guess at
			 * the subnet mask, assuming reasonable width subnet
			 * fields. 
			 */
			while (addr & ~mask)
#ifdef SYSV
				/* compiler doesn't sign extend! */
				mask = (mask | ((long) mask >> subnetshift));
#else
				mask = (long) mask >> subnetshift;
#endif /* SYSV */
		}
		net = addr & mask;
		while ((mask & 1) == 0)
			mask >>= 1, net >>= 1;
		np = getnetbyaddr(net, AF_INET);
		if (np && np->n_net == net)
			cp = np->n_name;
		else {
			  /*
			   * Look for subnets in hosts map.
			   * gethostbyaddr takes network order; above
			   * wanted host order.
			   */
			addr = htonl(addr);
			hp = gethostbyaddr((char *) &addr, sizeof(u_long), AF_INET);
			if (hp)
				cp = hp->h_name;
		}
	}
	if (cp)
		strcpy(line, cp);
	else {
		struct in_addr in;

		in.s_addr = addr;
		strcpy(line, inet_ntoa(in));
	}
	return (line);
}

/*
 * Return the name of the network whose address is given.
 * The address is assumed to be a host address.
 */
char *
netnamefromaddr(addr, mask)
	u_long		addr;
	u_long          mask;
{
	char           *cp = 0;
	static char     line[50];
	struct netent  *np = 0;
	struct hostent *hp;
	u_long          net;
	u_long			netshifted;
	int             subnetshift;

	addr = ntohl(addr);
	mask = ntohl(mask);
	if (addr == INADDR_ANY)
		return "default";
	if (!Nflag && addr) {
		if (mask == 0) {
			if (IN_CLASSA(addr)) {
				mask = IN_CLASSA_NET;
				subnetshift = 8;
			} else if (IN_CLASSB(addr)) {
				mask = IN_CLASSB_NET;
				subnetshift = 8;
			} else {
				mask = IN_CLASSC_NET;
				subnetshift = 4;
			}
			/*
			 * If there are more bits than the standard mask
			 * would suggest, subnets must be in use. Guess at
			 * the subnet mask, assuming reasonable width subnet
			 * fields. 
			 */
			while (addr & ~mask)
				/* compiler doesn't sign extend! */
				mask = (mask | ((long) mask >> subnetshift));
		}
		net = netshifted = addr & mask;
		while ((mask & 1) == 0)
			mask >>= 1, netshifted >>= 1;

		np = getnetbyaddr(netshifted, AF_INET);
		if (np && np->n_net == netshifted)
			cp = np->n_name;
		else {
			  /*
			   * Look for subnets in hosts map.
			   * gethostbyaddr takes network order; above
			   * wanted host order.
			   */
			addr = htonl(net);
			hp = gethostbyaddr((char *) &addr, sizeof(u_long), AF_INET);
			if (hp)
				cp = hp->h_name;
		}
	}
	if (cp)
		strcpy(line, cp);
	else {
		struct in_addr in;

		in.s_addr = addr;
		strcpy(line, inet_ntoa(in));
	}
	return (line);
}

/*
 * Pretty print a port number. If the Nflag was
 * specified, use numbers instead of names. 
 */
char *
portname(port, proto)
	u_long         port;
	char           *proto;
{
	struct servent *sp = 0;
	static char	line[80];
	char		*cp;

	cp = line;
	if (!Nflag && port)
		sp = getservbyport(port, proto);
	if (sp || port == 0)
		sprintf(cp, "%.8s", sp ? sp->s_name : "*");
	else
		sprintf(cp, "%d", ntohs((u_short) port));
	return line;
}

int
readmem(addr, mode, proc, buffer, size, name)
	long		addr;
	int		mode, proc;
	char	       *buffer;
	unsigned	size;
	char	       *name;
{
	if (kvm_read(kd, addr, buffer, size) != size) {
		perror ("netstat: kvm_read");
		fprintf(stderr, "netstat: can't read '%s'\n", name);
		exit(1);
	}
 
	return (0);
}

static void
fail(int do_perror, char *message, ...)
{
	va_list args;

/*	va_start(args, message, NULL);*/
/*	va_start(args, );*/
	va_start(args);
	fprintf(stderr, "netstat: ");
	vfprintf(stderr, message, args);
	va_end(args);
	if (do_perror)
		fprintf(stderr, ": %s", strerror(errno));
	fprintf(stderr, "\n");
	exit(2);
}

/*
 * Return value of named statistic for given kstat_named kstat.
 * Return 0 if named statistic is not in list.
 */
staticf ulong_t
kstat_named_value(kstat_t *ksp, char *name)
{
	kstat_named_t *knp;

	if (ksp == NULL)
		return (0);

	knp = kstat_data_lookup(ksp, name);
	if (knp != NULL)
		return (knp->value.ul);
	else
		return (0);
}

kid_t
safe_kstat_read(kstat_ctl_t *kc, kstat_t *ksp, void *data)
{
	kid_t kstat_chain_id = kstat_read(kc, ksp, data);

	if (kstat_chain_id == -1)
		fail(1, "kstat_read(%x, '%s') failed", kc, ksp->ks_name);
	return (kstat_chain_id);
}

char *sb(sbs)
char sbs[80];
{
static char tsbs[80];
int fq=0,ff;
 
strcpy(tsbs, "");
for(ff=0;ff<strlen(sbs);ff++) {
        if ((fq==1) && (sbs[ff]!='\"')) sprintf(tsbs, "%s%c", tsbs, sbs[ff]);
        if (sbs[ff]=='\"') fq++;
        }
return(tsbs);
}
 
int isoutport(opt)
int opt;
{
int isoutportr=0, optt;
 
for (optt=0;optt<OUTPORTN;optt++) { if (OUTPORT[optt]==opt) isoutportr++; }
return(isoutportr);
}
 
int isinport(opt)
int opt;
{
int isinportr=0, optt;
 
for (optt=0;optt<INPORTN;optt++) { if (INPORT[optt]==opt) isinportr++; }
return(isinportr);
}

int isinaddr(opt)
char opt[80];
{
int isinaddrr=0, optt;
 
for (optt=0; optt<INADDRN;optt++) { 
        if (!strcmp(INADDR[optt], &opt[strlen(opt)-strlen(INADDR[optt])]))
         isinaddrr++; 
        }
return(isinaddrr);
}
 
int isoutaddr(opt)
char opt[80];
{
int isoutaddrr=0, optt;
 
for (optt=0;optt<OUTADDRN;optt++) { 
        if (!strcmp(OUTADDR[optt], &opt[strlen(opt)-strlen(OUTADDR[optt])]))
        isoutaddrr++;
        }
return(isoutaddrr);
}

