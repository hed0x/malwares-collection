#include "main.h"
#define SOCK() socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)
#define REUSEPORT(l, on) setsockopt(sd, SOL_SOCKET, SO_REUSEADDR, &on, sizeof(on))

/* lookup ip address from hostname */
struct in_addr
*lookup(const char *name)
{
 struct hostent *host;

 if (!inet_aton(name, &addr))
 {
   if ((host=gethostbyname(name))!=NULL)
     memcpy(&addr, host->h_addr_list[0], host->h_length);
   else
   {
     printf("Cannot resolve hostname %s!\n", name);
     return NULL;
   }
 }
 return &addr;
}
 
int
BDlisten(int port, int backlog)
{
  struct sockaddr_in l;
  int sd;
  const int true=1; /* enable sockopt */

  sd = SOCK();
  if (sd <0)
  {
    perror("socket");
    return -1;
  }

  REUSEPORT(sd, true);

  l.sin_family = AF_INET;
  l.sin_port = htons(port);
  l.sin_addr.s_addr = htonl(INADDR_ANY);

  if (bind(sd, (struct sockaddr*)&l, sizeof(struct sockaddr)) <0)
  {
    perror("bind");
    return -1;
  }

  if (listen(sd, backlog)==-1)
  {
    perror("listen");
    return -1;
  }

  return sd;
}

int
BDconnect(char *name, int port)
{
  struct sockaddr_in c;
  struct in_addr *ip = NULL;
  int sd;

  if ((ip = lookup(name))==NULL)
    return 0;

  c.sin_family = AF_INET;
  c.sin_port = htons(port);
  c.sin_addr.s_addr = ip->s_addr;

  sd = SOCK();
  if (sd <0)
  {
    perror("socket");
    return 0;
  }

  if (connect(sd, (struct sockaddr*)&c, sizeof(struct sockaddr))!=0)
  {
    perror("connect");
    return 0;
  }

  return sd;
}
