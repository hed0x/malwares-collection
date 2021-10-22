
// ARG.C - module to parse command line
// Copyright (C) 1998 Z0MBiE/29A

#define max_argc        10      // max. number of arguments
#define max_argv        256     // max argument size

dword argc;                     // argc, or paramcount in pascal
char  argv[max_argc][max_argv]; // argv, or paramstr(i) in pascal

pchar cmdlineptr(void);         // windows api - get pointer to command line
void arg_init(void);            // subroutine to parse cmd. line

pchar cmdlineptr(void)
  {
    asm
        extrn   GetCommandLineA:PROC
        call    GetCommandLineA
    end;
    return((pchar) _EAX);       // to avoid fucking compiler`s warning
  }

void arg_init(void)             // parse cmd. line
  {
    pchar p = cmdlineptr();     // p = pointer to cmd. line

    argc = 0;                   // zero resulting vars
    zero(argv);                 //

    while ((char) *p != 0)      // search till zero byte will be found
      {
        if ( ((char) *p == ' ') || ((char) *p == 0x09) ) // space or tab?
          {
          if (strlen(argv[argc]) != 0)   // if argv[argc] <> 0
            argc++;                      // then increase argc
          }
        else
          straddchar(argv[argc], (char) *p);  // else add current character
        p++;
      }
    if (argv[argc][0] != 0x00) argc++; // check for last argv
  }

