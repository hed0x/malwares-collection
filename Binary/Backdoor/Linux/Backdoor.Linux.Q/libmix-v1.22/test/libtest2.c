#include <mix/mix.h>

void tcptransmit
(unsigned long to, int port, char *payload)
{
int i = 0, sock = socket (PF_INET, SOCK_STREAM, 0);
char *p;
struct sa sin;

sin.fam = PF_INET;
sin.add = to;
sin.dp = htons(port);

i = strlen(payload);
  alg = SAFERP;
  aes_key ((const char *)"just_testing");
p = (char *) aes_encrypt((const u1byte *) payload, &i);

(void) connect(sock, (struct sockaddr *) &sin, sizeof(sin));
(void) write (sock, p, strlen(p));
(void) close (sock);
free (p);
}

void aes_test (void);
void net_test (void);
void misc_test (void);
void iot_test (void);

int
main (int argc, char **argv)
{
  unsigned long lh;
  char tst[50];
  strcpy (tst, "the transmission could be received!");
  printf ("Performing net test...\n");
  lh = resolve ("localhost");
  printf ("localhost: %lu\n", lh);
  printf ("ntoa test: %s\n", ntoa (lh));
  printf ("calling tcptransmit()... \n");
  tcptransmit (lh, 1, tst);

  return 0;
}
