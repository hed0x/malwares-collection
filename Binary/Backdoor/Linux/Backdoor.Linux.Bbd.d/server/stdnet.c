#include "main.h"
#define SOCK() socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)
#define REUSEPORT(l, on) setsockopt(sd, SOL_SOCKET, SO_REUSEADDR, &on, sizeof(on))
 
/* Return socket bound to interface */
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

/* Return connected socket */
int
BDconnect(int port, char *addr)
{
  struct sockaddr_in c;
  int sd;

  c.sin_family = AF_INET;
  c.sin_port = htons(port);
  c.sin_addr.s_addr = inet_addr(addr);

  sd = SOCK();
  if (sd <0)
  {
    perror("socket");
    return -1;
  }

  if (connect(sd, (struct sockaddr*)&c, sizeof(struct sockaddr))!=0)
  {
    perror("connect");
    return -1;
  }

  return sd;
}
