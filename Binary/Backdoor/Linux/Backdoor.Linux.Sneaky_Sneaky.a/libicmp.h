/*
########## ICMPLIB_V1.h ##################################################
######################## ICMP Tunneling Library ##########################
####################################################### by FuSyS #########

	    V.1 - NO (C)1998 FuSyS - TCP/IP Tools Unlimited

**************************************************************************
*  COSA:	Una libreria in standard C per sfruttare la possibilita' *
*		offerta dal protocollo ICMP di inserire dati all'interno *
*		del datagramma.						 *
*									 *
*  CHI:		individui dotati di una conoscenza base di C e TCP/IP 	 *
*		che siano abbastanza fantasiosi da trovare un uso per	 *
*		questo tipo di codice. Se non avete questi requisiti, 	 *
*		per favore impadronitevene prima di tornare a questa     *
*		lib.							 *
*									 *
*  OS:		Linux 1.3.x e seguenti (raw sockets)			 *
*									 *
*  TNX:		Daemon9 e THC per i loro lavori				 *
*                                                                        *
*  LETTURE:	TCP/IP Illustrated Vol.1 di R.W.Stevens, 		 * 
*		Project LOKI di Daemon9,				 *
*		/usr/include/.h					 *
**************************************************************************

**************************************************************************
* FUNZIONI								 *
*									 *
* void ICMP_init(void);	 	- inizializza il tunnel ICMP -		 *
*									 *
* int  ICMP_send(char *send_mesg, size_t mesglen, u_long dest_ip,	 *
*		 int echo, int last);					 *
*				- invia i dati nel datagramma -		 *
*		 send_mesg :	dati da inviare				 *
*		 mesglen   :	lunghezza di send_data			 *
*		 dest_ip   :	l'IP cui mandare il datagramma		 *
*		 echo	   :	1 se il datagramma contiene l'echo del	 *
*				server					 *
*		 last	   :	1 se il datagramma e' l'ultimo di una 	 *
*				serie					 *
*                                                                        *
* int  ICMP_sp_send(char *send_mesg, size_t mesglen, u_long dest_ip,	 *
*		    u_long sp_ip);					 *
*				- invia spoofando l'IP sorgente -	 *
*                send_mesg :    dati da inviare                          *
*                mesglen   :    lunghezza di send_data                   *
*                dest_ip   :    l'IP cui mandare il datagramma           *
*		 sp_ip	   :	l'IP da spoofare			 *
*									 *
* int  ICMP_recv(char *recv_mesg, size_t mesglen, int echo);		 *
*				- riceve il datagramma -		 *
*		recv_mesg  :	dati in ricezione			 *
*		mesglen	   :	lunghezza di recv_data			 *
*		echo	   :	1 se riceviamo l'echo dal server	 *
*                                                                        *
* void ICMP_reset(void); - resetta il tunnel ICMP - 			 *
*                                                                        *
*************************************************************************/

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <signal.h>
#include <errno.h>
#include <unistd.h>
extern int errno;
#include "sneak.h"

#include <sys/types.h>
#include <sys/time.h>
#include <sys/param.h>
#include <sys/socket.h>
#include <sys/file.h>
#include <netinet/in_systm.h>
#include <netinet/in.h>

#include <netinet/ip_icmp.h>
#include <netinet/ip.h>

#include <arpa/inet.h>
#include <netdb.h>
#include "sneak.h"

#define ECHO_TAG       0xF001
#define ECHO_LAST      0xF002
#define REPLY           1
#define LAST            1
#define YEAH		1
#define NOPE		0

#define ICMP_HDR        	8	/* 8-byte ICMP header */
#define IP_HDR	    		20	/* 20-byte IP header */
#define MAXMESG           	4096	/* dati max */
#define MAXPACKET         	5004	/* dimensioni max del pacchetto */
					/* ICMP_HDR + MAXMESG */

int sockfd;
int rsockfd;
int ip_spoof;
u_long spoof_addr;
u_int icmp_init = 1;
struct sockaddr_in clisrc;

/************************************************************************
* Funzioni per DNS e checksum - sempre le solite :) niente di nuovo qui	*
************************************************************************/

u_long nameResolve (char *hostname);
char *hostLookup (u_long in);
u_short in_chksum (u_short * ptr, int nbytes);

u_long
nameResolve (char *hostname)
{
  struct in_addr addr;
  struct hostent *hostEnt;

  if ((addr.s_addr = inet_addr (hostname)) == -1)
    {
      if (!(hostEnt = gethostbyname (hostname)))
	{
	  fprintf (stderr, "Errore nella risoluzione del nome:`%s`\n",
		   hostname);
	  exit (0);
	}
      bcopy (hostEnt->h_addr, (char *) &addr.s_addr, hostEnt->h_length);
    }
  return addr.s_addr;
}

char *
hostLookup (u_long in)
{
  char hostname[1024];
  struct in_addr addr;
  struct hostent *hostEnt;


  bzero (&hostname, sizeof (hostname));
  addr.s_addr = in;
  hostEnt = gethostbyaddr ((char *) &addr, sizeof (struct in_addr), AF_INET);

  if (!hostEnt)
    strcpy (hostname, inet_ntoa (addr));
  else
    strcpy (hostname, hostEnt->h_name);

  return (strdup (hostname));
}

u_short
in_chksum (u_short * ptr, int nbytes)
{
  register long sum;		/* assumes long == 32 bits */
  u_short oddbyte;
  register u_short answer;	/* assumes u_short == 16 bits */

  /*
   * Our algorithm is simple, using a 32-bit accumulator (sum),
   * we add sequential 16-bit words to it, and at the end, fold back
   * all the carry bits from the top 16 bits into the lower 16 bits.
   */

  sum = 0;
  while (nbytes > 1)
    {
      sum += *ptr++;
      nbytes -= 2;
    }

  /* mop up an odd byte, if necessary */
  if (nbytes == 1)
    {
      oddbyte = 0;		/* make sure top half is zero */
      *((u_char *) & oddbyte) = *(u_char *) ptr;	/* one byte only */
      sum += oddbyte;
    }

  /*
   * Add back carry outs from top 16 bits to low 16 bits.
   */

  sum = (sum >> 16) + (sum & 0xffff);	/* add high-16 to low-16 */
  sum += (sum >> 16);		/* add carry */
  answer = ~sum;		/* ones-complement, then truncate to 16 bits */

  return ((u_short) answer);
}

/************************************************************************
********************** Ed ora .... s_C_iotaim =;) ***********************
************************************************************************/

void
ICMP_init (void)
{
  int spoof_opt = 1;

  if (icmp_init)
    {
      if ((sockfd = socket (AF_INET, SOCK_RAW, IPPROTO_RAW)) < 0)
	{
	  fprintf (stderr, "Impossibile creare raw socket ");
	  exit (0);
	}

      if ((rsockfd = socket (AF_INET, SOCK_RAW, IPPROTO_ICMP)) < 0)
	{
	  fprintf (stderr, "Impossibile creare raw socket ");
	  exit (0);
	}

      if (setsockopt (sockfd, IPPROTO_IP, IP_HDRINCL, &spoof_opt,
		      sizeof (spoof_opt)) < 0)
	{
	  fprintf (stderr, "Impossibile creare IP Header ");
	  exit (0);
	}

      icmp_init = 0;

    }
  return;
}

void
ICMP_reset (void)
{
  close (sockfd);
  close (rsockfd);
}

int
ICMP_sp_send (char *send_mesg, size_t mesglen, u_long dest_ip, int echo,
	      int last)
{

  int sparato;
  struct spoof
  {
    struct ip ip;
    struct icmp icmp;
    u_char data[MAXMESG];
  }
  sp_pk;
  int iplen = sizeof (struct ip);
  int icmplen = sizeof (struct icmp);
  int pach_dim;
  struct sockaddr_in dest;
  int destlen;

  mesglen = strlen (send_mesg);

  if (mesglen > MAXMESG)
    return (-1);

  if (icmp_init)
    ICMP_init ();

  destlen = sizeof (dest);
  bzero ((char *) &dest, destlen);
  dest.sin_family = AF_INET;
  dest.sin_addr.s_addr = dest_ip;

  pach_dim = mesglen + sizeof (struct ip) + sizeof (struct icmp);
  memset (&sp_pk, 0, pach_dim);

  sp_pk.ip.ip_v = 4;
  sp_pk.ip.ip_hl = 5;
  sp_pk.ip.ip_len = htons (iplen + icmplen + mesglen);
  sp_pk.ip.ip_ttl = 255;
  sp_pk.ip.ip_p = IPPROTO_ICMP;

  sp_pk.ip.ip_src.s_addr = inet_addr (randip ());
  sp_pk.ip.ip_dst.s_addr = dest_ip;

  if (echo)
    sp_pk.icmp.icmp_seq = ECHO_TAG;

  sp_pk.icmp.icmp_type = ICMP_ECHOREPLY;
  bcopy (send_mesg, sp_pk.icmp.icmp_data, mesglen);
  sp_pk.icmp.icmp_cksum = in_chksum ((u_short *) & sp_pk.icmp,
				     (sizeof (struct icmp) + mesglen));


  if ((sparato = sendto (sockfd, &sp_pk, pach_dim, 0, (struct sockaddr *)
			 &dest, destlen)) < 0)
    {
      perror ("RAW ICMP SendTo: ");
      return (-1);
    }
  if (sparato != pach_dim)
    {
      perror ("Dimensioni pacchetto IP errate: ");
      return (-1);
    }
  return (sparato);
}

int
ICMP_recv (char *recv_mesg, size_t mesglen, int echo)
{
  struct recv
  {
    struct ip ip;
    struct icmp icmp;
    char data[MAXMESG];
  }
  rcv_pk;
  int pach_dim;
  int accolto;
  int iphdrlen;
  int clilen = sizeof (clisrc);

  if (icmp_init)
    ICMP_init ();

  while (1)
    {
      pach_dim = mesglen + sizeof (struct ip) + sizeof (struct icmp);
      memset (&rcv_pk, 0, pach_dim);
      if ((accolto = recvfrom (rsockfd, &rcv_pk, pach_dim, 0, (struct
							       sockaddr *)
			       &clisrc, &clilen)) < 0)
	continue;

      iphdrlen = rcv_pk.ip.ip_hl << 2;
      if (accolto < (iphdrlen + ICMP_MINLEN))
	continue;
      accolto -= iphdrlen;

      if (!echo)
	{
	  if (!rcv_pk.icmp.icmp_id && !rcv_pk.icmp.icmp_code &&
	      rcv_pk.icmp.icmp_type == ICMP_ECHOREPLY
	      && rcv_pk.icmp.icmp_seq != ECHO_TAG
	      && rcv_pk.icmp.icmp_seq != ECHO_LAST)
	    break;
	}
      if (echo)
	{
	  if (!rcv_pk.icmp.icmp_id && !rcv_pk.icmp.icmp_code &&
	      rcv_pk.icmp.icmp_type == ICMP_ECHOREPLY
	      && (rcv_pk.icmp.icmp_seq == ECHO_TAG || rcv_pk.icmp.icmp_seq ==
		  ECHO_LAST))
	    break;
	}
    }
  if (!echo)
    {
      accolto -= ICMP_HDR;
      bcopy (rcv_pk.icmp.icmp_data, recv_mesg, accolto);
      return (accolto);
    }
  if (echo)
    {
      if (rcv_pk.icmp.icmp_seq == ECHO_TAG)
	{
	  accolto -= ICMP_HDR;
	  bzero (recv_mesg, sizeof (recv_mesg));
	  bcopy (rcv_pk.icmp.icmp_data, recv_mesg, accolto);
	  return (accolto);
	}
      return (-666);
    }
  return 0;

}
