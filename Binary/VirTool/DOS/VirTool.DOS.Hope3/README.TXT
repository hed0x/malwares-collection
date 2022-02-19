                                HOPE v2.52b

IMPORTANT NOTE: HOPE is still in BETA stage and is incomplete. It is
                prone to crashes on some systems. Use of HOPE should
                be limited to research and trials in its current state.


Huge Overhead Polymorphic Engine

The overhead of this engine isn't actually very 'Huge' at all, the name
just came about due to its modular design which has a lot of module
parsing and headers etc.. causing it to be quite a generic polymorphic
engine (GPE?).

All version numbers are internal version numbers until official release.

This engine is not a virus, nor is it designed to release one on your
system. It is a utility for linking into your own programs to make them
polymorphic.

I have now included the source to HOPE, hopefully this will help to weed
out the bugs, please mail any corrections or optimisations, there are
plenty to be made. This is my first attempt at writing a polymorphic
engine, and I have done so basically from scratch.


Files included with [HOPE].

HOPE.OBJ     - Main Engine File
HOPE.asm     - Source to the engine
STUB.*       - Program to generate, run and display decryptors
HOPEGEN.*    - Program to generate 50 virii like com files
HOPEG2.*     - Program to generate 50 TPE like test files
HEXDIS.*     - Utility to display a hexadecimal number, used by stub
REGDISP.*    - Utility to display the registers in use, used by stub

JUNK*.*      - Junk modules that can be linked into HOPE
INIT*.*      - Initialisation modules that can be linked into HOPE
COUNT*.*     - Counter modules that can be linked into HOPE
CRYPT*.*     - Encryption modules that can be linked into HOPE
LOOP*.*      - Loop modules that can be linked into HOPE

HOPE.TXT     - Summary of how to use HOPE in your program
MODULES.TXT  - A doc on how to create your own modules
DEFINIT.TXT  - A reference to the 'codes' used in the modules
ADVANCED.TXT - Summarises some of the features available in HOPE
HISTORY.TXT  - Log of changes to HOPE
README.TXT   - This file

