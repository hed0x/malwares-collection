
#include <windows.h>

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <io.h>
#include <conio.h>

#pragma hdrstop

#define MIN(a,b)        ((a)<(b)?(a):(b))
#define MAX(a,b)        ((a)>(b)?(a):(b))

#include "log.cpp"

extern "C"
{
void  WINAPI FuckMe();
DWORD WINAPI MySize();
BYTE* WINAPI MyData();
};

void main(int argc, char* argv[])
{
  __try
  {

    WSADATA WSAData;
    assert( WSAStartup(MAKEWORD(1,1), &WSAData) == 0 );

    log("TEST:MySize() = 0x%08X = %i\n", MySize(), MySize());
    log("TEST:MyData() = 0x%08X\n", (DWORD)MyData());
    log("TEST:command line = %s\n", GetCommandLine());
    log("TEST:argc = %i, argv[0] = %s\n", argc, argv[0]);

    WSACleanup();

  }//__try
  __except(1)
  {
    log("TEST:ERROR:SEH error\n");
  }

  FuckMe();     // zerofill this program in memory & exit

} // main
