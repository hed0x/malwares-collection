/*
 * exclude.c - exclude classless IPv4 networks from target addresses
 * idea from scanssh's exclude.c by Niels Provos <provos@citi.umich.edu>
 */

#include <mix/misc.h>
#include <mix/mix.h>

void exclude_insert(unsigned int, int);
int exclude_match(unsigned int, unsigned int, unsigned int);

int exclude_counter = 0;

struct exclude_t
  {
    unsigned int start;
    unsigned int end;
    struct exclude_t *next;
  }
ex_p, *ex_last = &ex_p;

int
exclude_parse(FILE * fp)
{
  char buffer[256], *add, *net;
  int hasbits = 0, bits = 0;
  unsigned int iaddr;

  if (fgets(buffer, 256, fp) == NULL)
    return 0;
  add = strtok(buffer, "/");

  if (add == NULL)
    add = buffer;
  else
    hasbits = 1;

  if (!(iaddr = resolve(add)))
    return 0;

  if (hasbits)
    {
      net = strtok(NULL, "/");
      bits = net ? atoi(net) : 0;
    }

  exclude_insert(iaddr, bits);
  return 1;
}

#ifdef WORDS_BIGENDIAN
#define HT(x) x
#else
#define HT(x) htonl(x)
#endif
void
exclude_insert(unsigned int addr, int bits)
{
  unsigned int mask = 0xFFFFFFFF << (32 - bits);

  ex_last->start = HT(ntohl(addr) & mask);
  ex_last->end = HT(ntohl(addr) | (~mask));
  ex_last->next = NEW(struct exclude_t, 1);

  ex_last = ex_last->next;
  exclude_counter++;
}

void
exclude_free(void)
{
  struct exclude_t *ep = ex_p.next, *en = ep;

  exclude_counter = 0;
  while (ep->next != NULL)
    {
      en = ep->next;
      DELETE(ep);
      ep = en;
    }
  ex_p.next = NULL;
}

int
excluded(unsigned int addr)
{
  struct exclude_t *en = &ex_p;

  while (en->next != NULL)
    {
      if (exclude_match(en->start, addr, en->end))
	return 1;
      en = en->next;
    }
  return 0;
}

int
exclude_match(unsigned int st, unsigned int ad, unsigned int en)
{
  unsigned char *start = (unsigned char *) &st, *addr = (unsigned char *) &ad,
   *end = (unsigned char *) &en;

  if (!addr[0])			/* exclude 0.*.*.* hardcoded */

    return 1;
  if ((addr[0] < start[0]) || (addr[0] > end[0]))
    return 0;
  if ((addr[1] < start[1]) || (addr[1] > end[1]))
    return 0;
  if ((addr[2] < start[2]) || (addr[2] > end[2]))
    return 0;
  if ((addr[3] < start[3]) || (addr[3] > end[3]))
    return 0;

  return 1;
}

void
exclude_list(void)
{
  struct exclude_t *en = &ex_p;
  int i = 0;

  while (en->next != NULL)
    {
      printf("%d. %s -", ++i, ntoa(en->start));
      printf(" %s\n", ntoa(en->end));
      en = en->next;
    }
}
