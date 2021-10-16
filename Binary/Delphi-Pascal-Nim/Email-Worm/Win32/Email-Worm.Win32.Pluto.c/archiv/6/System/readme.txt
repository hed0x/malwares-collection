KOL - Key Objects Library - FREEWARE OPEN SOURCE project.
(C) by Kladov Vladimir 2000

XCL - eXtream Class Library - FREEWARE OPEN SOURCE project.
(C) by Kladov Vladimir 1999, 2000.

DELPHI6 SYSTEM.DCU REPLACEMENT VERSION 1.1
(C) 2000 by Kladov Vladimir

Part of KOL/MCK (and earlier XCL) technology: 
system.dcu, sysinit.dcu and some other sysxxxxx.dcu (with sources)
to replace Delphi standard ones and make all KOL (and other Delphi
non-VCL based) projects even smaller (difference is 6-11K depending
on project). Dcu's in this archive are provided for Delphi6 only, 
but with sources, and You can adjust it for earlier Delphi versions too. 
Version for Delphi5 is available too.

What is done here (briefly, see also sources - all changes are
marked with '{X' characters):

***  references to console input/output routines (AssignFile, Read, 
Write, etc) removed (it is possible to call UseInputOutput to provide 
it therefore);

***  floating point initialization removed (if You want, call manually 
one of FpuInit or FpuInitConsiderNECWindows procedures);

***  references to both WriteLn and MessageBox are removed in error 
handling routine. You have to call manually one of UseErrorMessageBox 
or UseErrorMessageWrite procedure to provide it again.

***  Variables CmdShow and CmdLine are replaced with same-named 
functions - to allow smart-linking.

***  Embedded support of Wide strings, Wide String arrays removed. 
(It is yet possible to use wide strings/wide string arrays by placing 
a reference to units SysWStr units into uses clause of dpr, but with 
some small restrictions, e.g. it is not possible to initialize such 
variables in dpr itself).

***  Overblotted Delphi memory manager is replaced by very simple one, 
which just calls HeapAlloc, HeapFree, HeapReAlloc. (It is yet possible 
to call UseDelphiMemoryManager to restore it, or to call SetMemoryManager 
to setup your own memory manager).

***  Try-except-finally & raise handling support routines removed, 
including steps of units initializations / finalization. (But therefore 
it can be turned on again by adding a reference to SysSfIni unit in uses 
clause of project's dpr file).

***  Safe-thread string reference count (and dynamic arrays too) handling 
feature removed (all LOCK prefixes are commented, and there is no way to 
enable this again - except uncommenting it again and recompiling system.pas).

In result, size of empty project is only 4,5K after compiling. And if some 
ansi string operations are added, size is about 5,5K. For dynamic array of 
strings, size of executable is about 6,5K. And so on.

HISTORY:

*** In version 1.1 (15-Jun-2000):
[-] System.Move fixed. There are now three versions there for lovers:
    1. Borland's; 2. Small; 3. Fast (the last is turned on).

[-] SysSfIni.pas usage fixed (changes made in SetExceptionHandler).

[+] Some declarations moved from SysInit.pas to System.pas to avoid of
    creating second import section from kernel32.dll (thanks to Alexey
    Torgashin).

[+] ErrorAddr now is not set to nil in _Halt0 (by advice of Alexey 
    Torgashin - to allow check ErrorAddr in the rest of finalization
    sections).

*** In version 1.2 (6-Sep-2001):
[+] Version for Delphi6 ready.

INSTALLATION:

- DO NOT REPLACE EXISTING FILES with new ones. Place it in any other directory
where You wish, and add path to it in your project AS FIRST path.
Provided DCU's are only for Delphi6 and compiled with -DDEBUG key (so, it
is possible to step into system.pas, sysinit.pas, getmem.inc and others
while debugging. If You want to turn debug info off, recompile it as it is said
below).


RECOMPILING:

- If You want to make some changes and recompile units provided, do following:

1. Backup existing system.pas, sysinit.pas, getmem.inc (and other which You 
want to change) - in Delphi6\Source\Rtl\Sys directory.

2. Place new versions of source files (system.pas, sysinit.pas, getmem.inc,
syssfini.pas, syswstr.pas) to your Delphi6\Source\Rtl\Sys
directory, replacing existing ones.

3. Ensure that a directory Delphi6\Rtl\Lib exists and empty.

4. Place provided file named 'makefile' to Delphi6\Source\Rtl directory,
replacing existing one (You can also rename existing makefile to save it too).

5. Copy make.exe from Delphi6\Bin to Delphi6\Source\Rtl directory. You can
open also makefile to read recompiling instructions there.

6. Open your lovely DOS Shell program (NC, DN, Far, VC, WC, etc.) or command
line prompt and go to the Delphi6\Source\Rtl directory. Run there make.exe
with desired parameters, e.g.:

> make -DDEBUG >1.txt

or

> make >1.txt

Than see compiler log and errors in 1.txt file.

6. Go to Delphi6\Source\Rtl\Lib and watch resulting dcu's there . Cut them and
paste to where you wish, (BUT NOT TO: Delphi6\Lib or Delphi6\Lib\Debug !)

[7. If the Delphi IDE is yet open, close it. (It is better to close it before
compiling, but it seems no matter - it event have not to be restarted).

8. Open Delphi6 again and enjoy.]

TIP: if You plan to make some changes and to test it in standard programming
cycle - writing-compiling-debugging, make bat-file to perform steps 5-6 more
easy. Do not forget, that Source\Rtl\Lib must be empty before recompiling,
but sysconst.dcu.

=============================================================================
If You adjust changed files to earlier versions of Delphi (2-4), or have found
some bugs, or could suggest some useful changes, and even if You have
(unique) opinion about the work, please e-mail me:

mailto: bonanzas@xcl.cjb.net?subject=system

Web page: http://xcl.cjb.net

LET US MAKE OUR DELPHI PROGRAMS SMALL !