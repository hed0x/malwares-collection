#include <unistd.h>
#include <stdio.h>

long getrandom(int,int);
int ICMP_sp_send(char *,int,unsigned long ,int,int);

int decoy(unsigned long ip,char *payload)
 {
  int tmp;
  extern int delay;

  sleep(getrandom(0,delay));
  tmp = ICMP_sp_send(payload,0,ip,0,0);
  return tmp;

 }
