#include <mix/mix.h>

void aes_test (void);
void net_test (void);
void misc_test (void);
void iot_test (void);

int
main (int argc, char **argv)
{
  printf ("libmix version %s found...\n", libmix_version);
  printf ("libmix test - 1: aes 2: misc 3: net 4: ioterm > ");
  switch (getchar ())
    {
    case '1':
      aes_test ();
      break;
    case '2':
      disguise ("misc-test", argc, argv);
      misc_test ();
      break;
    case '3':
      net_test ();
      break;
    case '4':
      iot_test ();
      break;
    }
  return 0;
}

void
net_test (void)
{
  char ip[100];
  unsigned long lh;
  int i, u, t, c;
  char tst[50];
  strcpy (tst, "the transmission could be received!");
  printf ("Performing net test...\n");
  strcpy (ip, "1.2.3.4");
  if (isip (ip))
    printf ("isip test passed\n");
  lh = resolve ("localhost");
  printf ("localhost: %lu\n", lh);
  printf ("ntoa test: %s\n", ntoa (lh));
  incip (ip);
  printf ("incip: %s\tdecip: ", ip);
  decip (ip);
  printf ("%s\n", ip);
  i = rawsock (P_ICMP);
  u = rawsock (P_UDP);
  t = rawsock (P_TCP);
  printf ("raw sockets... icmp %s, udp %s, tcp %s\n",
	  i >= 0 ? "ok" : "failed", u >= 0 ? "ok" : "failed",
	  t >= 0 ? "ok" : "failed");
  printf ("calling tfntransmit() (random protocol)... \n");
  alg = SAFERP;
  aes_key ((const char *)"just_testing");
  tfntransmit (lh, lh, -1, tst);
  for (c = 1; c <= 10; c++)
    {
      char *p = tfnread (i, u, t);
      printf ("tfnread(), try %d... %s\n", c, p == NULL ? "failed" : p);
      if (p != NULL)
	break;
    }
}

void
lamefunc (unsigned int bah)
{
 char bleh[32];
 printf("%s ",lm_ntoa(bah,bleh));
}


void
misc_test (void)
{
  char *str1 = "strscpy test!passed";
  char str2[100], str3[100];
  char str4[100];
  FILE *fp;

  strcpy (str4, "StRlOwer tEsT... PaSsEd");

  printf ("Performing misc test...\n");
  printf ("Small random number: %ld\tlarge random number: %ld\n",
	  getrandom (0, 10), getrandom (1024, 65535));
  printf ("Installing sighandler... ");
  sighandler (SIG_IGN);
  raise (SIGHUP);
  raise (SIGINT);
  raise (SIGTRAP);
  raise (SIGIOT);
  raise (SIGTERM);
  raise (SIGCHLD);
  strscpy (str1, str2, str3, '!');
  strlower (str4);
  printf ("ok\n");
  fp = fopen("test/ipaddr.txt", "r");
  if (fp)
   {
    printf("Exclude test follows...\n");
    while(exclude_parse(fp));
printf("aah\n");fflush(stdout);
    fclose(fp);
    exclude_list();
    printf("1.2.3.4 is %s\n", excluded(inet_addr("1.2.3.4"))?"excluded":"not excluded");
    printf("255.2.3.4 is %s\n", excluded(inet_addr("255.2.3.4"))?"excluded":"not excluded");
    printf("25.2.3.4 is %s\n", excluded(inet_addr("25.2.3.4"))?"excluded":"not excluded");
    printf("10.2.3.4 is %s\n", excluded(inet_addr("10.2.3.4"))?"excluded":"not excluded");
    exclude_free();
   }
  printf ("%s %s\n", str2, str3);
  printf ("%s\n", str4);
  fflush (stdout);
  log ("/dev/stdout", "log function is %s\n", "ok");
  printf ("scan_run test: "); fflush(stdout);
  fp = fopen("test/iplist.txt", "r");
  lm_scan_run (fp,lamefunc,2);
  fatal ("test %s", "successfully finished\n");
}

void
aes_test (void)
{
  const u1byte *buf1 = (const u1byte *)"AES test successfully passed!";
  const u1byte *buf2 = (const u1byte *)"passwords can be even more than 32 bytes but it'll have no effect";
  const u1byte *buf3 = (const u1byte *)"this hash can be up to 32 bytes";
  char *tmp1, *tmp2;
  int strl = strlen ((const char *) buf1);
  /* aes_binary = 1; */
  printf ("Performing aes test...\n");
  alg = CAST256;
  aes_key ((const char *)buf2);
  tmp1 = (char *)aes_encrypt (buf1, &strl);
  tmp2 = (char *)aes_decrypt ((const u1byte *)tmp1, strl);
  printf ("\n\tAES CAST256 algorithm:\nEncrypted: %s\nDecrypted: %s\n", tmp1,
	  tmp2);
  DELETE(tmp1);
  DELETE(tmp2);
  tmp1 = (char *)aes_hash ((const s1byte *)buf3);
  printf ("Hash test: %s\n", tmp1);
  DELETE(tmp1);
  alg = MARS;
  aes_key ((const char *)buf2);
  tmp1 = (char *)aes_encrypt (buf1, &strl);
  tmp2 = (char *)aes_decrypt ((const u1byte *)tmp1, strl);
  printf ("\n\tAES MARS algorithm:\nEncrypted: %s\nDecrypted: %s\n", tmp1,
	  tmp2);
  DELETE(tmp1);
  DELETE(tmp2);
  tmp1 = (char *)aes_hash ((const s1byte *)buf3);
  printf ("Hash test: %s\n", tmp1);
  DELETE(tmp1);

  alg = SAFERP;
  aes_key ((const char *)buf2);
  tmp1 = (char *)aes_encrypt (buf1, &strl);
  tmp2 = (char *)aes_decrypt ((const u1byte *)tmp1, strl);
  printf ("\n\tAES SAFERPLUS algorithm:\nEncrypted: %s\nDecrypted: %s\n",
	  tmp1, tmp2);
  DELETE(tmp1);
  DELETE(tmp2);
  tmp1 = (char *)aes_hash ((const s1byte *)buf3);
  printf ("Hash test: %s\n", tmp1);
  DELETE(tmp1);

  alg = TWOFISH;
  aes_key ((const char *)buf2);
  tmp1 = (char *)aes_encrypt (buf1, &strl);
  tmp2 = (char *)aes_decrypt ((const u1byte *)tmp1, strl);
  printf ("\n\tAES TWOFISH algorithm:\nEncrypted: %s\nDecrypted: %s\n", tmp1,
	  tmp2);
  DELETE(tmp1);
  DELETE(tmp2);
  tmp1 = (char *)aes_hash ((const s1byte *)buf3);
  printf ("Hash test: %s\n", tmp1);
  DELETE(tmp1);

  alg = RIJNDAEL;
  aes_key ((const char *)buf2);
  tmp1 = (char *)aes_encrypt (buf1, &strl);
  tmp2 = (char *)aes_decrypt ((const u1byte *)tmp1, strl);
  printf ("\n\tAES RIJNDAEL algorithm:\nEncrypted: %s\nDecrypted: %s\n", tmp1,
	  tmp2);
  DELETE(tmp1);
  DELETE(tmp2);
  tmp1 = (char *)aes_hash ((const s1byte *)buf3);
  printf ("Hash test: %s\n", tmp1);
  DELETE(tmp1);
}

void
iot_test (void)
{
  char *mykey = "verysecretkey1234567890";
  int myport = getrandom (20000, 60000);
  int s = 0, p = 0;
  struct sa sck;

  printf ("Performing terminal test...\n");
  printf
    ("Please type something, it should be echoed to tty11. Terminate with CTRL+C\n");

  aes_key ((const char *)mykey);

  sck.fam = PF_INET;
  sck.dp = htons (myport);
  sck.add = inet_addr ("127.0.0.1");

  if (fork () == 0)		/* child */
    {
      int d = open ("/dev/tty11", O_RDWR);
      s = socket (PF_INET, SOCK_STREAM, 0);
      (void) bind (s, (struct sockaddr *) &sck, sizeof (sck));
      (void) listen (s, 1);
      p = accept (s, NULL, NULL);
      ioterm (d, p, 1);
      exit (0);
    }

/* parent */

  sleep (2);
  s = socket (PF_INET, SOCK_STREAM, 0);
  if (connect (s, (struct sockaddr *) &sck, sizeof (sck)) < 0)
    fatal ("can`t connect to child");
  ioterm (0, s, 1);
  exit (0);
}
