    SpiceGirl family
    ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
    These are harmless memory resident parasitic viruses. They hook INT 21h and
    write themselves to the beginning of COM files (except COMMAND.COM) that are
    accessed. The viruses are encrypted starting from 1619 bytes version.
    Starting from 2123 bytes version they are semi-stealth - on opening an
    infected file they create temporary file, write to there disinfected copy of
    original file, and return "handle" of disinfected copy instead of original
    file. On closing these viruses delete the temporary file.

    The viruses use new way to avoid detection - the infected files have no
    entry point (start code). The address of entry point in infected files is
    out of file body and it is impossible to reach virus code by parsing EXE
    header. To realize this method the virus uses several PSP (Program's Segment
    Prefix) and EXE header tricks.

    The format of virus code is EXE, i.e. the virus as a program is EXE program
    with EXE header, relocation table and so on (as a result infected COM files
    are of EXE internal format). EXE header fields in virus (initial CS and IP)
    are patches so, that entry address points not to file code, but to PSP data
    (i.e. out of file). At that address PSP contains RET FAR code that follows
    the call to INT 21h handler. So, the virus entry address points to RET FAR
    code, and control then will be passed to code that is pointed by stack. To
    pass the control to its real entry code the virus has initial stack
    registers (SS and SP) in its EXE header and stack data that points to real
    entry:

              ÚÄÄÄÄÄÄÄÄÄÄÄÄ¿ PSP           Control flow
         0000 ³CD 20       ³
         .... ³        ³                     ³
         0050 ³CD 21       ³                     ³
         0052 ³CB / RET FAR³ Entry address, DOS will   <ÄÄÄÄÄÙ
         .... ³        ³ bring control to here  ÄÄÄÄÄ¿
                                     ³
         0100 ÉÍÍÍÍÍÍÍÍÍÍÍÍ» Virus code (file image)         ³
              º        º                     ³
              ÇÄÄÄÄÄÄÄÄÄÄÄÄ¶                     ³
              ºStack       º Stack data points to   ÄÄÄÄ>³
              º        º real entry              ³
              ÇÄÄÄÄÄÄÄÄÄÄÄÄ¶                     ³
              º        º Real virus entry code <ÄÄÄÄÄÙ
              º . . .      º

    The virus contain the text strings:

     What? 'Error: invalid program'? Me? Fprot, are you crazy? :)
     And you, Avp, 'EXE file but COM extension'. What a deep scan. ;)
     Spice_Girls virus causes problems to your scan engine eh? :)
