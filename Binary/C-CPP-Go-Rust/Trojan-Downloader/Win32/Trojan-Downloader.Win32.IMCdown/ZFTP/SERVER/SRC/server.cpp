
#include <windows.h>

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <io.h>
#include <conio.h>

#pragma hdrstop

#define MIN(a,b)        ((a)<(b)?(a):(b))
#define MAX(a,b)        ((a)>(b)?(a):(b))

CRITICAL_SECTION critical_section;

DWORD filesize = 0;
char* filebuf  = NULL;

#include "log.cpp"
#include "list.cpp"
#include "hostaddr.cpp"
#include "zftpserv.cpp"

void main(int argc, char* argv[])
{
  if (argc!=2)
  {
    printf("syntax: SERVER filename\n");
    return;
  }

  FILE*f=fopen(argv[1],"rb");
  if (f==NULL)
  {
    printf("ERROR: file not found: %s\n", argv[1]);
    return;
  }
  filesize = filelength(fileno(f));
  filebuf = (char*)malloc( filesize+ZFTP_PACKET_SIZE*2 );
  assert(filebuf);
  fread(filebuf, 1,filesize, f);
  fclose(f);

  WSADATA WSAData;
  assert( WSAStartup(MAKEWORD(1,1), &WSAData) == 0 );

  InitializeCriticalSection(&critical_section);

  init_hostaddr_list();

  zftp_StartServer();

  printf("ZFTP:server is running. press ESC to quit...\n");
  while (!kbhit())
  {
    if (getch() == 27) break;
    printf("ZFTP:%i server threads, %i client threads, %i files sent\n",
      zftp_server_list.count,
      zftp_client_list.count,
      zftp_sentok_list.count);
  }

/*
  while (sentok_list.count < 100) // wait while 100 files successfully sent
    Sleep(1000);
*/

  zftp_StopServer();

  // process sentok_list here
  ForEach(zftp_sentok_list, zftp_sentok_struct, sentok)
  {
    log("file sent to: %s\n", inet_ntoa( *(in_addr*)&sentok->client_ip ));
  }

  DeleteCriticalSection(&critical_section);

  WSACleanup();
} // main
