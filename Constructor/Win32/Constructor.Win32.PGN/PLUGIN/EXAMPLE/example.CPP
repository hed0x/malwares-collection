
////////x///////x///////x///////x///////x///////x///////x///////x///////x////
//
// .CPP example plugin
//
////////x///////x///////x///////x///////x///////x///////x///////x///////x////

#include <windows.h>
#pragma hdrstop

namespace PLUGIN {
extern "C" {

#include "..\LDRWIN32\ldrwin32.hpp"
#include "..\DEBUG\debug.hpp"
#include "..\FILEIO\fileio.hpp"
#include "..\MEMORY\memory.hpp"
#include "..\PLAN\plan.hpp"

#include "example.hpp"

/*  The following stuff is implemented in SIGMAN plugin:
 void __fastcall my_memcpy(void *dest, void *src, DWORD n)
 int __fastcall my_memcmp(BYTE *s1, BYTE *s2, DWORD n)
 void __fastcall my_memmove(char *dest, char *src, DWORD n)
 void __fastcall my_memset(void *dest, int c, DWORD n)      */

////////x///////x///////x///////x///////x///////x///////x///////x///////x////

BYTE* buf = 0;          // dynamically allocated buffer

  // public subroutine, may be used by other plugins
DWORD __export __cdecl example_proc(DWORD example_arg)
{
  printf("EXAMPLE: example_proc()\n");
  return example_arg ^ 666;
}

////////x///////x///////x///////x///////x///////x///////x///////x///////x////

  // interplugin event-based communication
int __export __cdecl HandleEvent(DWORD EventID, DWORD /*UserParam*/)
{
  if (EventID == EV_PLAN_PER_MACHINE)   // executed once on each machine
  {
    printf("EXAMPLE: EV_PLAN_PER_MACHINE\n");
    DWORD f = fopen_ro("c:\\autoexec.bat");
    if (f)
    {
      DWORD xsize = fgetsize(f);
      BYTE* xbuf = malloc(xsize+1);
      fread(f, xbuf,xsize, 0/*pos*/);
      fclose(f);
      buf[xsize]=0;
      printf("%s",xbuf);
      mfree(xbuf);
    }
    return 1;                   // handled, continue broadcasting
  }

  if (EventID == EV_EXAMPLE_IN_EVENT)   // received our event?
  {
    printf("EXAMPLE: EV_EXAMPLE_IN_EVENT\n");
    Event(EV_EXAMPLE_OUT_EVENT, 0);     // send another event, notify others
    return -1;                          // event handled, stop broadcasting
  }

  return 0;                             // unhandled is NOT handled
} //HandleEvent

////////x///////x///////x///////x///////x///////x///////x///////x///////x////

void __export __cdecl EntryPoint(DWORD oldver_unload_code)
{
  printf("EXAMPLE: EntryPoint(%08X)\n", oldver_unload_code);
  if (oldver_unload_code == 0)
  {
    buf = malloc(666);          // on startup
  }
  else
  {
    buf = (BYTE*) oldver_unload_code; // take pointer from older plugin
  }
} //EntryPoint

int __export __cdecl unload(int why)
{
  if (why==UT_UNINSTALL)
  {
    printf("EXAMPLE: unload(UT_UNINSTALL)\n");
    mfree(buf);                 // on quit
    return 0;
  }
  if (why==UT_UPDATE)
  {
    printf("EXAMPLE: unload(UT_UPDATE)\n");
    return (DWORD)buf;                 // pass pointer to newer plugin
  }
  return 0;
} //unload

////////x///////x///////x///////x///////x///////x///////x///////x///////x////

}; // extern "C"
}; // namespace PLUGIN
