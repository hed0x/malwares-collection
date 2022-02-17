#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>
#include <string.h>
#include <netdb.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <sys/time.h>
#include <sys/types.h>
#include <unistd.h>

struct xfer_struct
{
  char lfile[255];
  char rfile[255];
  int dir;
  char ip[20];
  int mode;
  int port;
};

enum DIR
{
  DOWN,
  UP
};

enum xfer_enum
{
  FIL=1,
  DIR,
  PASV,
  PORT
};

enum xfer_cmds
{
  HELP,
  SET,
  PUT,
  GET
};

enum mode
{
  ACTIVE,
  PASSIVE
};

struct in_addr addr;
